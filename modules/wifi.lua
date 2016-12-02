-- menu current wifi network

function wifiMenubar()
  local wifiBar = hs.menubar.new()
  wifiBar:setMenu({
    { title = "Reconnect", fn = function() hs.wifi.setPower(false) hs.wifi.setPower(true) end }
  })

  function setTitle()
    local title = hs.wifi.currentNetwork()
    if not title then
      wifiBar:setTitle('')
      return
    end
    wifiBar:setTitle(title)
  end
  setTitle()

  local watcher = hs.wifi.watcher.new(setTitle)
  watcher:start()

  function wifiBarClicked()

  end

  if wifiBar then
    wifiBar:setClickCallback(wifiBarClicked)
  end

  -- show ip on click?
end

return wifiMenubar
-- end curent wifi network
