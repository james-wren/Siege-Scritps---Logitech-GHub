--Because ghub cant import files, Im using tables for each gun
local guns = {
  [1] = { name = "R4C", horizontal = -1, vertical = 29, delay = 10},
  [2] = { name = "smg12", horizontal = 2, vertical = 18, delay = 10},
  [3] = { name = "spear", horizontal = -1, vertical = 8, delay = 10},
  [4] = { name = "bear9", horizontal = 0, vertical = 16, delay = 10},
  [5] = { name = "vector", horizontal = 0, vertical = 13, delay = 10},
  [6] = { name = "t-5", horizontal = 0, vertical = 10, delay = 10},
  [7] = { name = "f2", horizontal = -1, vertical = 32, delay = 0},
  [8] = { name = "para", horizontal = 0, vertical = 17, delay = 0},
  [9] = { name = "ak12", horizontal = -1, vertical = 28, delay = 10},
  [10] = { name = "552", horizontal = -1, vertical = 18, delay = 10},
  [11] = { name = "smg11", horizontal = 0, vertical = 17, delay = 0}
} -- These are all the guns im doing for now, these the only ones with hard to control recoil

local current = 1

function OnEvent(event, arg)
  EnablePrimaryMouseButtonEvents(true) -- Makes left click work
  local gun = guns[current]
  
  if (event == "MOUSE_BUTTON_PRESSED" and arg == 1) then -- On left click start script
    if IsKeyLockOn("capslock") then --Caps lock is the recoil macro
    OutputLogMessage("Shooting\n") -- Debug log
      repeat
        MoveMouseRelative(gun.horizontal, gun.vertical)
        
        Sleep(gun.delay) --Need to experiment with this
      until not IsMouseButtonPressed(1)
    end 
  end
  if (event == "MOUSE_BUTTON_PRESSED" and arg == 9) then -- Used for switching guns, on my g502 this is the button behing the scroll wheel, change to your liking
    OutputLogMessage(arg)
    if (current == 11) then
      current = 1
    else
      current = current + 1
    end
    OutputLogMessage("Gun switched to " .. guns[current].name .. "\n")
  end
end
