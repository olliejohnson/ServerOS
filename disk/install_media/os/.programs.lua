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
        term.write("Email")
    elseif nOption == 2 then
        term.write("Send File")
    elseif nOption == 3 then
        term.write("Get File")
    elseif nOption == 4 then
        term.write("Back")
    else
        end
end

--GUI

term.clear()
local function drawFrontend()
    printCentered(math.floor(h/2) - 3, "")
    printCentered(math.floor(h/2) - 2, "Start Menu")
    printCentered(math.floor(h/2) - 1, "")
    printCentered(math.floor(h/2) + 0, ((nOption == 1) and "[ Email ]") or "Email")
    printCentered(math.floor(h/2) + 1, ((nOption == 2) and "[ Send File ]") or "Send File")
    printCentered(math.floor(h/2) + 2, ((nOption == 3) and "[ Get File ]") or "Get File")
    printCentered(math.floor(h/2) + 3, ((nOption == 4) and "[ Back ]") or "Back")
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
        if nOption < 4 then
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
    shell.run("os/.email")
elseif nOption == 2 then
    shell.run("os/.send_file")
elseif nOption == 3 then
    shell.run("os/.get_file")
elseif nOption == 4 then
    shell.run("back")
end