
local FRemap = require('modules.foundation_remapping')
local remapper = FRemap.new()

-- utils
local fastKeyStroke = function(modifier, event_char)
    hs.eventtap.keyStroke(modifier, event_char, 20) --30ms
end

-- 한/영 키 전환
remapper:remap('capslock', 'f19')
remapper:register()

-- ctrl_wasd
local ctrl_wasd_mode = true
function enable_ctrl_wasd()
    hs.alert.show('ctrl_wasd_mode: on')
    ctrl_wasd_mode = true
end
function disable_ctrl_wasd()
    hs.alert.show('ctrl_wasd_mode: off')
    ctrl_wasd_mode = false 
end
hs.hotkey.new({'ctrl'}, 'space', function()
    if ctrl_wasd_mode then
        disable_ctrl_wasd()
    else
        enable_ctrl_wasd()
    end
end):enable()

local ctrl_w_bind
local ctrl_a_bind
local ctrl_s_bind
local ctrl_d_bind
function pressUp()
    if ctrl_wasd_mode then
       fastKeyStroke({}, 'up') 
    end
end
function pressLeft()
    if ctrl_wasd_mode then
       fastKeyStroke({}, 'left') 
    end
end
function pressDown()
    if ctrl_wasd_mode then
       fastKeyStroke({}, 'down') 
    end
end
function pressRight()
    if ctrl_wasd_mode then
       fastKeyStroke({}, 'right') 
    end
end
ctrl_w_bind = hs.hotkey.new({'ctrl'},'w', pressUp, nil, pressUp):enable()
ctrl_a_bind = hs.hotkey.new({'ctrl'},'a', pressLeft, nil, pressLeft):enable()
ctrl_s_bind = hs.hotkey.new({'ctrl'},'s', pressDown, nil, pressDown):enable()
ctrl_d_bind = hs.hotkey.new({'ctrl'},'d', pressRight, nil, pressRight):enable()