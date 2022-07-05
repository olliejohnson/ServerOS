os.pullEvent = os.pullEventRaw

local w, h = term.getSize()

function printCentered (y, s)
    local x = math.floor((w - string.len(s)) / 2)
    term.setCursorPos(x, y)
    term.clearLine()
    term.write(s)
end

local nOption = 1

local function drawMenu()
    term.clear()
    term.setCursorPos(1, 1)
    term.write("ServerOs")
    
    term.setCursorPos(w-11, 1)
    if nOption == 1 then
        term.write("Confirm")
    elseif nOption == 2 then
        term.write("Cancel")
    else
        end
end

--GUI

term.clear()
local function drawFrontend()
    printCentered(math.floor(h/2) - 3, "")
    printCentered(math.floor(h/2) - 2, "Start Menu")
    printCentered(math.floor(h/2) - 1, "")
    printCentered(math.floor(h/2) + 0, ((nOption == 1) and "[ Confirm ]") or "Confirm")
    printCentered(math.floor(h/2) + 1, ((nOption == 2) and "[ Cancel ]") or "Cancel")
end

--Display

drawMenu()
drawFrontend()

while true do
    local e, key = os.pullEvent("key")
    if key == keys.w or key == keys.up then
        if nOption >  1 then
            nOption = nOption - 1
            drawMenu()
            drawFrontend()
        end
    elseif key == keys.s or key == keys.down then
        if nOption < 2 then
            nOption = nOption + 1
            drawMenu()
            drawFrontend()
        end
    elseif key == keys.enter then
        break
    end
end
term.clear()

--Conditions

if nOption == 1 then
    fs.delete(".menu.lua")
    fs.delete("startup.lua")
    fs.delete("back.lua")
    fs.delete("os")
    fs.delete("install.lua")
    fs.delete("eject.lua")
    print("Rebooting...")
    os.reboot()
elseif nOption == 2 then
    shell.run("back")
end