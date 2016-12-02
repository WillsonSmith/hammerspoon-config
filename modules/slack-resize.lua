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
hs.alert.show("Config loaded")

function slack_zoomer()
  local ZOOM_DEFAULT = 0
  local ZOOM_LEVEL = 2
  local SMALL_RESOLUTION = {w = 1440, h = 900}

  function increase_slack_font(screen_size)
    local slack = hs.appfinder.appFromName("Slack")
    local zoom_reset = {"View", "Actual Size"}
    local zoom_in = {"View", "Zoom In"}
    local zoom = ZOOM_DEFAULT
    slack:selectMenuItem(zoom_reset)

    if (screen_is_larger(screen_size)) then
      zoom = ZOOM_LEVEL
    end

    for i=1, zoom do
      slack:selectMenuItem(zoom_in)
    end
  end

  function screen_is_larger(size)
    local size_delta = 50
    if (size['w'] > SMALL_RESOLUTION['w']) then
      return true
    else
      return false
    end
  end

  function handle_screen_change()
    local primary_screen = hs.screen.primaryScreen()
    local primary_screen_size = primary_screen:frame()
    increase_slack_font(primary_screen_size)
  end

  screen_watcher = hs.screen.watcher.new(handle_screen_change)
  screen_watcher:start()
end

return slack_zoomer
