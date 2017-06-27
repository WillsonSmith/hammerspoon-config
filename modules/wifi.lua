-- menu current wifi network

function wifiMenubar()
  local wifiBar = hs.menubar.new()
  local title = hs.wifi.currentNetwork()
  function setMenubarItem()
    wifiBar:setTitle("↻")
    wifiBar:setTooltip("Reset wifi")
  end

  if title then
    setMenubarItem()
    wifiBar:setMenu({
      {
        title = string.format("Reconnect %s", title),
        fn = function() hs.wifi.setPower(false) hs.wifi.setPower(true) end
      }
    })
  end

  local watcher = hs.wifi.watcher.new(setMenubarItem)
  watcher:start()

  function wifiBarClicked()
  end

  if wifiBar then
    wifiBar:setClickCallback(wifiBarClicked)
  end
end

return wifiMenubar
-- end curent wifi network
