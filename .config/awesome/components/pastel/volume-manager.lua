  -- Importing necessary libraries
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

-- Function to get sink inputs
local function get_sink_inputs()
    local sink_inputs = {}
    -- Use `pactl list sink-inputs` to get the list of sink inputs
    local handle = io.popen("pactl list sink-inputs")
    local result = handle:read("*a")
    handle:close()
    -- Parse the result to get the sink input ids
    for sink_input in result:gmatch("Sink Input #%d+") do
        table.insert(sink_inputs, sink_input)
    end
    return sink_inputs
end

-- Function to create a slider for a sink input
local function create_slider(sink_input)
    local slider = wibox.widget {
        bar_shape           = gears.shape.rounded_rect,
        bar_height          = 3,
        bar_color           = beautiful.bg_focus,
        handle_color        = beautiful.fg_focus,
        handle_shape        = gears.shape.circle,
        handle_width        = 15,
        handle_border_color = beautiful.bg_focus,
        handle_border_width = 1,
        maximum             = 100,
        widget              = wibox.widget.slider,
    }
    -- Use `pactl set-sink-input-volume` to set the volume when the slider is manipulated
    slider:connect_signal("property::value", function()
        awful.spawn("pactl set-sink-input-volume " .. sink_input .. " " .. slider.value .. "%")
    end)
    return slider
end

-- Function to create a popup with sliders for each sink input
local function create_popup()
    local sink_inputs = get_sink_inputs()
    local sliders = {}
    for _, sink_input in ipairs(sink_inputs) do
        table.insert(sliders, create_slider(sink_input))
    end
    local popup = awful.popup {
        widget = {
            {
                sliders,
                layout = wibox.layout.fixed.vertical,
            },
            margins = 10,
            widget  = wibox.container.margin,
        },
        border_color = beautiful.bg_normal,
        border_width = beautiful.border_width,
        ontop        = true,
        visible      = false,
        shape        = gears.shape.rounded_rect,
    }
    return popup
end

-- Create the popup when AwesomeWM starts
local popup = create_popup()

awesome.connect_signal("volume_widget",
  function ()

      -- make volume_adjust component visible
      if not volume_adjust.visible then
        volume_widget.visible = true
      else
        volume_adjust.visible = false
      end
  end
  )
  
-- Show the popup when the mouse enters a specific area (e.g., the top right corner of the screen)
awful.placement.top_right(popup)
awful.mouse.append_global_mousebindings({
    awful.button({}, 1,
      function ()
        if popup.visible then
            popup.visible = false
        else
            popup.visible = true
        end
    end)
})
