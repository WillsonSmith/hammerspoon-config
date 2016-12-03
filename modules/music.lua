local itunes = {}

itunes.getCurrentTrack = function()

  function playingTrack()
    return {
      hs.itunes.getCurrentTrack(),
      hs.itunes.getCurrentArtist(),
      hs.itunes.getCurrentAlbum()
    }
  end

  function songString()
    return table.concat(playingTrack(), ' - ')
  end

  function copySong()
    hs.pasteboard.setContents(songString())
  end

  function pasteInPlace()
    copySong()
    hs.eventtap.keyStrokes(songString())
  end

  hs.hotkey.bind({'cmd', 'alt', 'shift'}, 's', pasteInPlace)
end

return itunes
