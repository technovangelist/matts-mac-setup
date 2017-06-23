
-- k = hs.hotkey.modal.new({}, 'F18')

-- hyperBindings = { 'q', 'd', 'r', 'w', 'b', 'j', 'f', 'u', 'p', ';', 'a', 's', 'h', 't', 'g', 'y', 'n', 'e', 'o', 'z', 'x', 'm', 'c', 'v', 'k', 'l', '[', ']', 'i', 'pad/', '.', 'TAB', 'pad1', 'pad2', 'pad3', 'pad4', 'pad5', 'pad6', 'pad7', 'pad8', 'pad9', 'pad0', 'pad-', 'pad='}

-- for i,key in ipairs(hyperBindings) do
--   k:bind({}, key, nil, function() hs.eventtap.keyStroke({'cmd','alt','shift','ctrl'}, key)
--     k.triggered = true
--   end)
-- end

-- -- Enter Hyper Mode when F19 (left control) is pressed
-- pressedF19 = function()
--   k.triggered = false
--   k:enter()
-- end

-- -- Leave Hyper Mode when F19 (left control) is pressed,
-- --   send ESCAPE if no other keys are pressed.
-- releasedF19 = function()
--   k:exit()
--   if not k.triggered then
--     hs.eventtap.keyStroke({}, 'ESCAPE')
--   end
-- end

-- -- Bind the Hyper key
-- f19 = hs.hotkey.bind({}, 'F19', pressedF19, releasedF19)

-- function reloadConfig(files)
--     doReload = false
--     for _,file in pairs(files) do
--         if file:sub(-4) == '.lua' then
--             doReload = true
--         end
--     end
--     if doReload then
--         hs.reload()
--     end
-- end

-- function keyValueExists(tbl, key, value)
--   for k,v in pairs(tbl) do
--     if value == v[key] then
--       return true
--     end
--   end
--   return false
-- end

-- function setUSLayout(  )
--   hs.execute("keyboardSwitcher select \"U.S.\"", true)
-- end

-- function setWorkmanLayout(  )
--   hs.execute("keyboardSwitcher select \"Workman-Dead\"", true)
-- end

-- function setKeyboard()
--   local devs = hs.usb.attachedDevices()
--   if keyValueExists(devs, "productName", "ErgoDox EZ") then
--     setUSLayout()
--   else
--     setWorkmanLayout()
--   end
-- end

-- function sleepCallback( eventType )
--   if (eventType == hs.caffeinate.watcher.systemDidWake) then
--     setKeyboard()
--   end
-- end

-- function usbDeviceCallback(data)
--     if string.match(data["productName"], "ErgoDox EZ") then
--       setKeyboard()
--     end
-- end

-- function fcpCallback( appName, eventType, appObject )
--   ergodoxConnected = keyValueExists(hs.usb.attachedDevices(), "productName", "ErgoDox EZ") or False
--   if appName == "Final Cut Pro" then
--     if eventType == hs.application.watcher.activated or eventType == hs.application.watcher.launched then
--       setUSLayout()
--     -- elseif eventType == hs.application.watcher.launched thenm
--     --   fcpActive()
--     elseif eventType == hs.application.watcher.deactivated or eventType == hs.application.watcher.terminated then
--       if ergodoxConnected then
--         setUSLayout()
--       else
--         setWorkmanLayout()
--       end
--     -- elseif eventType == hs.application.watcher.terminated then
--     --   fcpNotActive()
--     end
--   end
-- end

-- function fcpActive( )
--     setUSLayout()
-- end

-- function fcpNotActive(  )
--     setWorkmanLayout()
-- end

-- function powerCallback(  )
--   if hs.battery.isCharging() then
--     powerSwitch(lowPriorityApps, true)
--     powerSwitch(hiPriorityApps, true)
--   else
--     if hs.battery.percentage() < 50 then
--       powerSwitch(lowPriorityApps, false)
--       powerSwitch(hiPriorityApps, false)
--     elseif hs.battery.percentage() < 90 then
--       hs.alert.show('below 90')
--       powerSwitch( lowPriorityApps, false )
--     end
--   end
-- end

-- function powerSwitch( appTable, powerOn )
--   for i, app in ipairs(appTable) do
--     thisApp = hs.application(app)
--     if thisApp:isRunning() then
--       if powerOn == false then
--         hs.alert.show('Killed ' .. thisApp:name())
--         thisApp:kill()
--       else
--         hs.alert.show('Launched ' .. thisApp:name())
--         thisApp:open()
--       end
--     end
--   end
-- end

-- lowPriorityApps = {
--   "reflector 2"
-- }

-- hiPriorityApps = {
--   "spotify",
--   "istat menus",
--   "arq"
-- }




-- sleepWatcher = hs.caffeinate.watcher.new(sleepCallback)
-- sleepWatcher:start()

-- local myWatcher = hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', reloadConfig):start()
-- hs.alert.show('Config loaded')

-- fcpWatcher = hs.application.watcher.new(fcpCallback)
-- fcpWatcher:start()

-- -- powerWatcher = hs.battery.watcher.new(powerCallback)
-- -- powerWatcher:start()

-- -- audioWatcher = hs.audiodevice.watcher.setCallback(audioCallback)
-- -- audioWatcher:start()

-- setKeyboard()
