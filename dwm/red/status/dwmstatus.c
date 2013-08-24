#define _BSD_SOURCE
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <strings.h>
#include <sys/time.h>
#include <time.h>
#include <sys/types.h>
#include <sys/wait.h>

#include <X11/Xlib.h>

char *tzargentina = "America/Buenos_Aires";
char *tzutc = "UTC";
char *tzberlin = "Europe/London";

static Display *dpy;

char *
smprintf(char *fmt, ...)
{
	va_list fmtargs;
	char *ret;
	int len;

	va_start(fmtargs, fmt);
	len = vsnprintf(NULL, 0, fmt, fmtargs);
	va_end(fmtargs);

	ret = malloc(++len);
	if (ret == NULL) {
		perror("malloc");
		exit(1);
	}

	va_start(fmtargs, fmt);
	vsnprintf(ret, len, fmt, fmtargs);
	va_end(fmtargs);

	return ret;
}

void
settz(char *tzname)
{
	setenv("TZ", tzname, 1);
}

char *
mktimes(char *fmt, char *tzname)
{
	char buf[129];
	time_t tim;
	struct tm *timtm;

	memset(buf, 0, sizeof(buf));
	settz(tzname);
	tim = time(NULL);
	timtm = localtime(&tim);
	if (timtm == NULL) {
		perror("localtime");
		exit(1);
	}

	if (!strftime(buf, sizeof(buf)-1, fmt, timtm)) {
		fprintf(stderr, "strftime == 0\n");
		exit(1);
	}

	return smprintf("%s", buf);
}

void
setstatus(char *str)
{
	XStoreName(dpy, DefaultRootWindow(dpy), str);
	XSync(dpy, False);
}

char *
readfile(char *base, char *file)
{
	char *path, line[513];
	FILE *fd;

	memset(line, 0, sizeof(line));

	path = smprintf("%s/%s", base, file);
	fd = fopen(path, "r");
	if (fd == NULL)
		return NULL;
	free(path);

	if (fgets(line, sizeof(line)-1, fd) == NULL)
		return NULL;
	fclose(fd);

	return smprintf("%s", line);
}

/*
 * Linux seems to change the filenames after suspend/hibernate
 * according to a random scheme. So just check for both possibilities.
 */
char *
getbattery(char *base)
{
	char *co;
	int descap, remcap;

	descap = -1;
	remcap = -1;

	co = readfile(base, "present");
	if (co == NULL || co[0] != '1') {
		if (co != NULL) free(co);
		return smprintf("not present");
	}
	free(co);

	co = readfile(base, "charge_full_design");
	if (co == NULL) {
		co = readfile(base, "energy_full_design");
		if (co == NULL)
			return smprintf("");
	}
	sscanf(co, "%d", &descap);
	free(co);

	co = readfile(base, "charge_now");
	if (co == NULL) {
		co = readfile(base, "energy_now");
		if (co == NULL)
			return smprintf("");
	}
	sscanf(co, "%d", &remcap);
	free(co);

	if (remcap < 0 || descap < 0)
		return smprintf("invalid");

	return smprintf("%.0f", ((float)remcap / (float)descap) * 100);

}
char* runcmd(char* cmd)
{
	FILE* fp = popen(cmd, "r");
	if (fp == NULL) return NULL;
	char ln[30];
	fgets(ln, sizeof(ln)-1, fp);
	pclose(fp);
	ln[strlen(ln)-1]='\0';
	return smprintf("%s", ln);
}

int getvolume()
{
	int volume;
        sscanf(runcmd("amixer | grep -A 6 Master | grep 'Mono: Playback'\
			| grep -o '[0-9%]*%'"), "%i%%", &volume);
	return volume;
}

int getmuted()
{
	int muted = 0;
	char* string = runcmd("amixer get Master | egrep 'Playback.*?\\[o' | egrep -o '\\[o.+\\]'");
	muted = strcmp(string, "[off]");
	return muted;
}

char* gettemperature(char *base, char *sensor)
{
	char *co;

	co = readfile(base, sensor);
	if (co == NULL)
		return smprintf("");
	return smprintf("%02.0f°C", atof(co) / 1000);
}

char* getmem()
{
	char* mem;
	char* free = runcmd("free -m | grep 'buffers/cache' | awk '{ print $3 }'");
	char* total = runcmd("free -m | grep 'Mem' | awk '{print $2}'");
	mem = smprintf("%sMB/%sMB", free, total);
	return mem;
}

char* getsong()
{
	char* song;
	char* title = runcmd("cmus-remote -Q | grep title | cut -d ' ' -f3-");
	char* artist = runcmd("cmus-remote -Q | grep artist | cut -d ' ' -f3-");
	song = smprintf("%s - %s", title, artist);
}

int
main(void)
{
	char *status;
	char *tmar;
	char *tmutc;
	char *tmbln;
	char *batt;
	char *temp;
	char *mem;
	char *song;

	//Symbols:
	char* clock = "**";
	char* vol;
	char* vol_mute = "**";
	char* vol_unmute = "**";
	char* battery;
	char* battery_full = "**";
	char* battery_half = "**";
	char* battery_empt = "**";
	char* temperature = "**";
	char* ram = "**";
	char* cpu = "**";
	char* music = "**";
	int volume;

	if (!(dpy = XOpenDisplay(NULL))) {
		fprintf(stderr, "dwmstatus: cannot open display.\n");
		return 1;
	}

	for (;;sleep(1)) {
		if(! getmuted())
			vol = vol_mute;
		else
			vol = vol_unmute;

		tmar = mktimes("%H:%M", tzargentina);
		tmutc = mktimes("%H:%M", tzutc);
		tmbln = mktimes("%a %b %d, %l:%M %P", tzberlin);
		batt = getbattery("/sys/class/power_supply/BAT0/");
		volume = getvolume();
		mem = getmem();
		temp = gettemperature("/sys/class/hwmon/hwmon0", "temp1_input");
		song = getsong();

		if(strcmp(song, " - ") == 0)
			status = smprintf("%s %s%% %s %i%% %s %s %s %s %s %s", battery_full, batt, vol, volume, temperature, temp, ram, mem, clock, tmbln);
		else
			status = smprintf("%s %s %s %s%% %s %i%% %s %s %s %s %s %s", music, song, battery_full, batt, vol, volume, temperature, temp, ram, mem, clock, tmbln);
			
		setstatus(status);
		free(tmar);
		free(tmutc);
		free(tmbln);
		free(status);
		free(batt);
	}

	XCloseDisplay(dpy);

	return 0;
}

