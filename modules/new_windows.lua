local windows = {}
local KEYBOARD_MODIFIER = {'cmd', 'alt', 'shift'}

-- track windows and last state
-- each action, update state

local HOTKEY_METHODS = {}

HOTKEY_METHODS.g = function()
  handleGrid()
end

HOTKEY_METHODS.h = function()
  hs.grid.pushWindowLeft(getFocusedWindow())
end
HOTKEY_METHODS.j = function()
  hs.grid.pushWindowDown(getFocusedWindow())
end
HOTKEY_METHODS.k = function()
  hs.grid.pushWindowUp(getFocusedWindow())
end
HOTKEY_METHODS.l = function()
  hs.grid.pushWindowRight(getFocusedWindow())
end
HOTKEY_METHODS["="] = function()
  hs.grid.maximizeWindow(getFocusedWindow())
end

function windows.setup()
  local screens = hs.screen.allScreens()
  -- animation set 0 for instant sizing
  hs.window.animationDuration = 0

  setupGrid()

  for k, _ in pairs(HOTKEY_METHODS) do
    handleHotkey(k)
  end
end

function handleHotkey(key)
  local activeWindow = getFocusedWindow()
  hs.hotkey.bind(KEYBOARD_MODIFIER, key, HOTKEY_METHODS[key])
end

function setupGrid()
  hs.grid.setGrid('2x2')
end

function handleGrid()
  hs.grid.toggleShow()
end


function getFocusedWindow()
  return hs.window.focusedWindow()
end

return windows
