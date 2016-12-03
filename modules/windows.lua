-- window management

-- animation set 0 for instant sizing
hs.window.animationDuration = 0

function windowOrder()
  local KEYBOARD_MODIFIER = {'cmd', 'alt', 'shift'}

  function getPos()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    return {win = win, f = f, screen = screen, max = max}
  end

  function position(area)
    if area == 'right' then
      return function()
        local pos = getPos();
        pos.f.x = pos.max.x + (pos.max.w / 2)
        pos.f.y = pos.max.y
        pos.f.w = pos.max.w / 2
        pos.f.h = pos.max.h
        pos.win:setFrame(pos.f)
      end
    end

    if area == 'top-right' then
      return function()
        local pos = getPos();
        pos.f.x = pos.max.x + (pos.max.w / 2)
        pos.f.y = pos.max.y
        pos.f.w = pos.max.w / 2
        pos.f.h = pos.max.h / 2
        pos.win:setFrame(pos.f)
      end
    end

    if area == 'bottom-right' then
      return function()
        local pos = getPos();
        pos.f.x = pos.max.x + (pos.max.w / 2)
        pos.f.y = pos.max.h / 2
        pos.f.w = pos.max.w / 2
        pos.f.h = pos.max.h / 2 + 25
        pos.win:setFrame(pos.f)
      end
    end

    if area == 'left' then
      return function()
        local pos = getPos();
        pos.f.x = pos.max.x
        pos.f.y = pos.max.y
        pos.f.w = pos.max.w / 2
        pos.f.h = pos.max.h
        pos.win:setFrame(pos.f)
      end
    end

    if area == 'top-left' then
      return function()
        local pos = getPos();
        pos.f.x = pos.max.x
        pos.f.y = pos.max.y
        pos.f.w = pos.max.w / 2
        pos.f.h = pos.max.h / 2
        pos.win:setFrame(pos.f)
      end
    end

    if area == 'bottom-left' then
      return function()
        local pos = getPos();
        pos.f.x = pos.max.x
        pos.f.y = pos.max.h / 2
        pos.f.w = pos.max.w / 2
        pos.f.h = pos.max.h / 2 + 25
        pos.win:setFrame(pos.f)
      end
    end

    if area == 'centre' then
      return function()
        hs.window.focusedWindow():centerOnScreen()
      end
    end

    if area == 'small' then
      return function()
        local pos = getPos()
        pos.f.w = 1280
        pos.f.h = 720

        pos.win:setFrame(pos.f)
        position('centre')()
      end
    end

    if area == 'full' then
      return function()
        hs.window.focusedWindow():maximize()
      end
    end

  end

  hs.hotkey.bind(KEYBOARD_MODIFIER, 'right', position('right'))
  hs.hotkey.bind(KEYBOARD_MODIFIER, 'up', position('top-right'))
  hs.hotkey.bind(KEYBOARD_MODIFIER, 'down', position('bottom-right'))

  hs.hotkey.bind(KEYBOARD_MODIFIER, 'left', position('left'))
  --[[
    these two do not match the normal modifier.
    this is because left and right are defined by control and command
  ]]--
  hs.hotkey.bind({'ctrl', 'alt', 'shift'}, 'up', position('top-left'))
  hs.hotkey.bind({'ctrl', 'alt', 'shift'}, 'down', position('bottom-left'))

  hs.hotkey.bind(KEYBOARD_MODIFIER, 'c', position('centre'))
  hs.hotkey.bind(KEYBOARD_MODIFIER, '-', position('small'))
  hs.hotkey.bind(KEYBOARD_MODIFIER, '=', position('full'))
end

return windowOrder


-- end window management
