 if game.CoreGui:FindFirstChild("DrRay") then
game.CoreGui.DrRay:Destroy()
  elseif game.Players.LocalPlayer.PlayerGui:FindFirstChild("DrRay") then
game.Players.LocalPlayer.PlayerGui.DrRay:Destroy()
 end
local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()

local window = DrRayLibrary:Load("ACPS 1.0.0", "Default")

local tab = DrRayLibrary.newTab("Protection from scripters", "ImageIdHere")

tab.newLabel("ACPS – Anti control protection system")

local drray = game.CoreGui.DrRay
drray.Parent = game.Players.LocalPlayer.PlayerGui
drray.ResetOnSpawn = false

drray.TopBar.Active = true
drray.TopBar.Draggable = true

assert(type(getconnections) == "function", "The function getconnections is not available")
assert(type(identifyexecutor) == "function", "The function identifyexecutor is not available")
assert(type(getexecutorname) == "function", "The function getexecutorname is not available")
assert(type(getgenv) == "function", "The function getgenv is not available")
assert(type(clonefunction) == "function", "The function clonefunction is not available")
assert(type(setscriptable) == "function", "The function setscriptable is not available")
assert(type(getfpscap) == "function" and type(setfpscap) == "function", "The function setfpscap and getfpscap is not available")
task.defer(function()
assert(game.ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents"), "RemoteEvent DefaultChatSystemChatEvents is not available")
end)

spawn(function()
   local clonedGetCon = clonefunction(getconnections)
 repeat task.wait(0.1)
   if getgenv().getconnections == nil or type(getconnections) ~= "function" then
getconnections = clonedGetCon
   end
 until drray == nil
end)

if getgenv().identifyexecutor and getgenv().gethwid and getgenv().getexecutorname and getgenv().setscriptable then
local savedex = identifyexecutor()
local fullsavedex = getexecutorname()
local savedhwid = gethwid()
setscriptable(drray, "Parent", false)
end

tab.newButton("Anti chat admin", "Many developers add chat admin and this script will probably prevent it", function()
  for _, player in ipairs(game.Players:GetPlayers()) do
    for i,v in pairs(getconnections(player.Chatted)) do
      v:Disconnect()
    end
  end
end)

tab.newToggle("Anti chat spy (basic)", "The script spams messages in the chat that prevent the cheater from viewing messages", false, function(toggleState)
   poo = toggleState
    while poo and task.wait(0.025) do
game.Players:Chat(tostring(string.rep("AntiChatSpy, 10")))
    end
end)

tab.newToggle("Anti fps cap", "blocks setfpscap function", false, function(toggleStatee)
gju = toggleStatee
   while gju and game:GetService("RunService").Heartbeat:Wait() do
     if getfpscap() <= 10 then
setfpscap(60)
     end
   end
end)

tab.newToggle("Can send chat messages", "It only works on those places, where are there DefaultChatSystemChatEvents", false, function(toggleStato)
uui = toggleStato
   while uui and task.wait() do
for i,v in pairs(getconnections(game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest.OnClientEvent)) do
 if uui == true then
   v:Disable()
     else
   v:Enable()
  end
end
   end
end)

tab.newToggle("Hide exploit name", "Changes the name of your exploit to nothing", false, function(toggleStatu)
    if toggleStatu then
getgenv().identifyexecutor = function()
  return ""
end
getgenv().getexecutorname = function()
  return ""
end
    else
getgenv().identifyexecutor = function()
  return tostring(savedex)
end
getgenv().getexecutorname = function()
  return tostring(fullsavedex)
end
    end
end)

tab.newToggle("Hide hwid", "Similar with Hide exploit name", false, function(toggleStath)
    if toggleStath then
getgenv().gethwid = function()
  return ""
end
    else
getgenv().gethwid = function()
  return savedhwid
end
    end
end)

local tab = DrRayLibrary.newTab("Debuggers", "ImageIdHere")

tab.newButton("Remote spy", "Ordinary, known to everyone Remote spy", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
end)

tab.newButton("Remote finder", "This is even easier. It just copies all the RemoteEvents and adds them to GUI", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/gameremotefireserver.lua"))()
end)

tab.newButton("Hydroxide", "A more advanced version of Remote Spy", function()
local owner = "Hosvile"
local branch = "revision"

local function webImport(file)
    return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/MC-Hydroxide/%s/%s.lua"):format(owner, branch, file)), file .. '.lua')()
end

webImport("init")
webImport("ui/main")
end)

tab.newButton("Http Spy", "Recognizes links that are launched", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Httpspy/main/httpspy.txt"))()
end)

local tab = DrRayLibrary.newTab("Other", "ImageIdHere")

tab.newButton("Destroy menu", "Destroys this menu", function()
    game.Players.LocalPlayer.PlayerGui.DrRay:Destroy()
end)

tab.newInput("Simulate key press", "Enter the full and real name of the key", function(text)
    local key = tostring(text)
     local real, err = pcall(function()
game:GetService("VirtualInputManager"):SendKeyEvent(true, key , false , game)
     end)
    if not real then
 error("Incorrect key format: " .. err)
    end
end)

tab.newButton("Open console", "Just opens the console", function()
    pcall(function()
     if game.CoreGui.DevConsoleMaster.Enabled == false then
   game.CoreGui.DevConsoleMaster.Enabled = true
     end
    end)
   game:GetService("VirtualInputManager"):SendKeyEvent(true, "F9" , false , game)
end)

tab.newToggle("Anti afk", "It only removes the kick from AFK", false, function(toggleSate)
    if toggleSate then
for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
  v:Disable()
end
    else
for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
  v:Enable()
end
    end
end)

tab.newLabel("CoreGui switch")

task.defer(function()
 assert(game.CoreGui:FindFirstChild("PurchasePrompt"), "CoreGui PurchasePrompt not found")
 assert(game.CoreGui:FindFirstChild("ExperienceChat"), "CoreGui ExperienceChat not found")
 assert(game.CoreGui:FindFirstChild("DevConsoleMaster"), "CoreGui DevConsoleMaster not found")
 assert(game.CoreGui:FindFirstChild("RobloxGui"), "CoreGui RobloxGui not found")
 assert(game.CoreGui:FindFirstChild("Backpack"), "CoreGui Backpack not found")
 assert(game.CoreGui:FindFirstChild("PlayerMenuScreen"), "CoreGui PlayerMenuScreen not found")
 assert(game.CoreGui:FindFirstChild("TopBarApp"), "CoreGui TopBarApp not found")
end)

tab.newToggle("PurchasePrompt", "Gamepass menus will be hidden", false, function(toggleStae)
iub = toggleStae
  while iub and task.wait() do
   pcall(function()
    game.CoreGui.PurchasePrompt.Enabled = toggleStae
   end)
  end
end)

tab.newToggle("ExperienceChat", "The chat menu can be turned off", false, function(toggleStatr)
iolk = toggleStatr
  while iolk and task.wait() do
    pcall(function() the 
game.CoreGui.ExperienceChat.Enabled = toggleStatr
    end)
  end
end)

tab.newToggle("DevConsoleMaster", "The console can be hidden", false, function(toggleSrae)
iyyj = toggleSrae
    while iyyj and task.wait() do
      pcall(function()
game.CoreGui.DevConsoleMaster.Enabled = toggleSrae
      end)
    end
end)

tab.newToggle("RobloxGui", "Turns off the main root gui", false, function(toggleSrte)
pohi = toggleSrte
    while pohi and task.wait() do
      pcall(function()
game.CoreGui.RobloxGui.Enabled = toggleSrte
       end)
    end
end)

tab.newToggle("Backpack", "Turns off the inventory menu", false, function(toggleSert)
fsyy = toggleSert
    while fsyy and task.wait() do
      pcall(function()
game.CoreGui.RobloxGui.Backpack.Visible = toggleSert
       end)
    end
end)

tab.newToggle("RobloxNetworkPauseNotification", "That same window", false, function(toggleStte)
    game:GetService("GuiService"):SetGameplayPausedNotificationEnabled(not toggleStte)
end)

tab.newToggle("PlayerMenuScreen", "When you click on a players name in the leaderboard", false, function(toggleStatet)
ihgyd = toggleStatet
   while ihgyd and task.wait() do
     pcall(function()
game.CoreGui.PlayerMenuScreen.Enabled = toggleStatet
     end)
   end
end)

tab.newToggle("TopBarApp", "New CoreGui buttons", false, function(toggleSta)
yyyb = toggleSta
    while yyyb and task.wait() do
      pcall(function()
game.CoreGui.TopBarApp.Enabled = not toggleSta
       end)
    end
end)
