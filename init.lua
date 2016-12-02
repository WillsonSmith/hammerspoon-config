local slackResize = require 'modules/slack-resize'
local windows = require 'modules/windows'
local wifi = require 'modules/wifi'

-- config reloading - no real need to touch
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
local myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.notify.new({title="Hammerspoon", informativeText="Config reloaded"}):send()

-- initialize modules here
windows()
wifi()
--slackResize()

--[[ idea
  save position of windows
  on switch to app, make sure they stay where they are
  this way, if you tab to an app that covers other on a different page they will still be visible
]]--
