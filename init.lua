require('modules.inputsource_aurora')
require('modules.keymap')

local esc_bind
local capslock_bind
local inputKorean = "com.apple.keylayout.Korean.2SetKorean"

function convert_to_eng_with_esc()
	local inputEnglish = "com.apple.keylayout.ABC"
	local inputSource = hs.keycodes.currentSourceID()
	if not (inputSource == inputEnglish) then
		hs.eventtap.keyStroke({}, 'right')
		hs.keycodes.currentSourceID(inputEnglish)
	end
	esc_bind:disable()
	hs.eventtap.keyStroke({}, 'escape')
	esc_bind:enable()
end

esc_bind = hs.hotkey.new({}, 'escape', convert_to_eng_with_esc):enable()
