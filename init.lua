do  -- input sorce changer
    local inputSource = {
        english = "com.apple.keylayout.ABC",
        korean = "com.apple.inputmethod.Korean.2SetKorean",
    }
    local changeInput = function()
        local current = hs.keycodes.currentSourceID()
        local nextInput = nil
        if current == inputSource.english then
            nextInput = inputSource.korean
        else
            nextInput = inputSource.english
        end
        hs.keycodes.currentSourceID(nextInput)
    end
    hs.hotkey.bind({'shift'}, 'space', changeInput)
    local esc_bind
    function convert_to_eng_with_esc()
        local current = hs.keycodes.currentSourceID()
        if current ~= inputSource.english then
            hs.keycodes.currentSourceID(inputSource.english)
        end
        esc_bind:disable()
        hs.eventtap.keyStroke({}, 'escape')
        esc_bind:enable()
    end
    esc_bind = hs.hotkey.new({}, 'escape', convert_to_eng_with_esc):enable()
    -- hs.hotkey.bind({}, 'F14', changeInput)
end