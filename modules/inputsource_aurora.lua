-- ref : https://johngrib.github.io/wiki/hammerspoon-inputsource-aurora/

local boxes = {}

local inputEng = "com.apple.keylayout.ABC"
local box_height = 23
local box_alpha = 0.35
local COLOR = hs.drawing.color.green

hs.keycodes.inputSourceChanged(function()
    disable_show()
    if hs.keycodes.currentSourceID() ~= inputEng then
        enable_show()
    end
end)

function enable_show()
    reset_boxes()
    hs.fnutils.each(hs.screen.allScreens(), function(scr)
        local frame = scr:fullFrame()

        local box = newBox()
        draw_rectangle(box, frame.x, frame.y, frame.w, box_height, COLOR)
        table.insert(boxes, box)
    end)
end

function disable_show()
    hs.fnutils.each(boxes, function(box)
        if box ~= nil then
            box:delete()
        end
    end)
    reset_boxes()
end
function newBox()
    return hs.drawing.rectangle(hs.geometry.rect(0,0,0,0))
end

function reset_boxes()
    boxes = {}
end

function draw_rectangle(target_draw, x, y, width, height, fill_color)
    target_draw:setSize(hs.geometry.rect(x,y,width,height))
    target_draw:setTopLeft(hs.geometry.point(x,y))
    
    target_draw:setFillColor(fill_color)
    target_draw:setFill(true)
    target_draw:setAlpha(box_alpha)
    target_draw:setLevel(hs.drawing.windowLevels.overlay)
    target_draw:setStroke(false)
    target_draw:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces)
    target_draw:show()
end