---------------------------
-- Default awesome theme --
---------------------------

theme = {}

theme.font          = "terminus 8"

theme.bg_normal     = "#222222"
theme.bg_focus      = "#4C4C4C"
theme.bg_urgent     = "#803333"
theme.bg_minimize   = "#1A1A1A"

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.border_width  = "1"
theme.border_normal = "#000000"
theme.border_focus  = "#4C4C4C"
theme.border_marked = "#91231c"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
theme.taglist_squares_sel   = "/home/alex/.config/awesome/themes/alex/taglist/squarefw.png"
theme.taglist_squares_unsel = "/home/alex/.config/awesome/themes/alex/taglist/squarew.png"

theme.tasklist_floating_icon = "/home/alex/.config/awesome/themes/alex/tasklist/floatingw.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = "/home/alex/.config/awesome/themes/alex/submenu.png"
theme.menu_height = "15"
theme.menu_width  = "100"

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = "/home/alex/.config/awesome/themes/alex/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "/home/alex/.config/awesome/themes/alex/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "/usr/share/awesome/themse/alex/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "/home/alex/.config/awesome/themes/alex/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "/home/alex/.config/awesome/themes/alex/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "/home/alex/.config/awesome/themes/alex/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "/home/alex/.config/awesome/themes/alex/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "/home/alex/.config/awesome/themes/alex/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "/home/alex/.config/awesome/themes/alex/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "/home/alex/.config/awesome/themes/alex/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "/home/alex/.config/awesome/themes/alex/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "/home/alex/.config/awesome/themes/alex/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "/home/alex/.config/awesome/themes/alex/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "/home/alex/.config/awesome/themes/alex/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "/home/alex/.config/awesome/themes/alex/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "/home/alex/.config/awesome/themes/alex/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "/home/alex/.config/awesome/themes/alex/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "/home/alex/.config/awesome/themes/alex/titlebar/maximized_focus_active.png"

-- You can use your own command to set your wallpaper
theme.wallpaper_cmd = { "awsetbg /home/alex/Pictures/Wallpapers/wallpaper-53219.jpg" }

-- You can use your own layout icons like this:
theme.layout_fairh = "/home/alex/.config/awesome/themes/alex/layouts/fairhw.png"
theme.layout_fairv = "/home/alex/.config/awesome/themes/alex/layouts/fairvw.png"
theme.layout_floating  = "/home/alex/.config/awesome/themes/alex/layouts/floatingw.png"
theme.layout_magnifier = "/home/alex/.config/awesome/themes/alex/layouts/magnifierw.png"
theme.layout_max = "/home/alex/.config/awesome/themes/alex/layouts/maxw.png"
theme.layout_fullscreen = "/home/alex/.config/awesome/themes/alex/layouts/fullscreenw.png"
theme.layout_tilebottom = "/home/alex/.config/awesome/themes/alex/layouts/tilebottomw.png"
theme.layout_tileleft   = "/home/alex/.config/awesome/themes/alex/layouts/tileleftw.png"
theme.layout_tile = "/home/alex/.config/awesome/themes/alex/layouts/tilew.png"
theme.layout_tiletop = "/home/alex/.config/awesome/themes/alex/layouts/tiletopw.png"
theme.layout_spiral  = "/home/alex/.config/awesome/themes/alex/layouts/spiralw.png"
theme.layout_dwindle = "/home/alex/.config/awesome/themes/alex/layouts/dwindlew.png"

theme.awesome_icon = "/home/alex/.config/awesome/icons/anrxc/awesome14.png"
theme.widget_volon = "/home/alex/.config/awesome/icons/xbm8x8/spkr_01.png"
theme.widget_voloff= "/home/alex/.config/awesome/icons/xbm8x8/spkr_02.png"
theme.widget_computer = "/home/alex/.config/awesome/icons/xbm8x8/cpu.png"
theme.widget_netdown = "/home/alex/.config/awesome/icons/xbm8x8/net_down_02.png"
theme.widget_netup = "/home/alex/.config/awesome/icons/xbm8x8/net_up_02.png"
theme.widget_mem = "/home/alex/.config/awesome/icons/xbm8x8/mem.png"
theme.widget_batfull = "/home/alex/.config/awesome/icons/xbm8x8/bat_full_01.png"
theme.widget_batlow = "/home/alex/.config/awesome/icons/xbm8x8/bat_low_01.png"
theme.widget_clock = "/home/alex/.config/awesome/icons/xbm8x8/clock.png"
theme.widget_temp = "/home/alex/.config/awesome/icons/xbm8x8/temp.png"

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
