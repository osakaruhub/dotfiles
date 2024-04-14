--      ██████╗  █████╗ ████████╗████████╗███████╗██████╗ ██╗   ██╗
--      ██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██╔════╝██╔══██╗╚██╗ ██╔╝
--      ██████╔╝███████║   ██║      ██║   █████╗  ██████╔╝ ╚████╔╝
--      ██╔══██╗██╔══██║   ██║      ██║   ██╔══╝  ██╔══██╗  ╚██╔╝
--      ██████╔╝██║  ██║   ██║      ██║   ███████╗██║  ██║   ██║
--      ╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚═╝  ╚═╝   ╚═╝

-------------------------------------------------
-- Battery Widget for Awesome Window Manager
-- Shows the battery status using the ACPI tool
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/battery-widget

-- @author Pavel Makhov
-- @copyright 2017 Pavel Makhov
-------------------------------------------------


-- ===================================================================
-- Initialization
-- ===================================================================


local awful = require("awful")
local watch = require("awful.widget.watch")
local wibox = require("wibox")
local clickable_container = require("widgets.clickable-container")
local gears = require("gears")
local dpi = require("beautiful").xresources.apply_dpi

local PATH_TO_ICONS = os.getenv("HOME") .. "/.config/awesome/icons/volume"


-- ===================================================================
-- Widget Creation
-- ===================================================================


local widget = wibox.widget {
   {
      id = "icon",
      widget = wibox.widget.imagebox,
      resize = true
   },
   layout = wibox.layout.fixed.horizontal
}

local widget_button = clickable_container(wibox.container.margin(widget, dpi(7), dpi(7), dpi(7), dpi(7)))
widget_button:buttons(
   gears.table.join(
      awful.button({}, 1, nil,
         function()
            awesome.emit_signal("volume_widget")
         end

      ),
      awful.button({}, 4, nil,
         function()
            awful.spawn("amixer -D pulse sset Master 5%+", false)
            awesome.emit_signal("volume_change")
         end
      ),
      awful.button({}, 5, nil,
         function()
            awful.spawn("amixer -D pulse sset Master 5%-", false)
            awesome.emit_signal("volume_change")
         end
      )
   )
)
-- Alternative to naughty.notify - tooltip. You can compare both and choose the preferred one
local volume_popup = awful.tooltip({
   objects = { widget_button },
   mode = "outside",
   align = "left",
   referred_positions = { "right", "left", "top", "bottom" }
})

watch('bash -c "amixer get Master| grep -o \'[0-9]+%\' | head -n1"', 1,
   function(_, stdout)
      local handle = io.popen("amixer get Master| grep -o \'[0-9]\' | head -n1")
      local master_volume = handle:read("*a")
      handle:close()

      local volume_icon_name

      if master_volume > 66 then
         volume_icon_name = "audio_volume_high"
      elseif master_volume > 33 then
         volume_icon_name = "audio_volume_medium"
      elseif master_volume > 1 then
         volume_icon_name = "audio_volume_low"
      else
         volume_icon_name = "audio_volume_muted"
      end

      widget.icon:set_image(PATH_TO_ICONS .. volume_icon_name .. ".svg")
      -- Update popup text
      volume_popup.text = string.gsub(stdout, "\n$", "")
      collectgarbage("collect")
   end,
   widget
)

return widget_button
