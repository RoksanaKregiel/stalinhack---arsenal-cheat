--IF U GONNA USE IT AS UR OWN SOURCE WITHOUT CREDITS UR FUCKING RETARDED
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("stalinhack - made for arsenal", "BloodTheme")
--AIMBOT
local Aimbot = Window:NewTab("Aimbot")
local AimbotSection = Aimbot:NewSection("helps you with aim")
--VISUALS
local Visuals = Window:NewTab("Visuals")
local VisualsSection = Visuals:NewSection("see retards through the wall")
VisualsSection:NewButton("esp", "read above nig", function()
loadstring(game:HttpGet("https://pastebin.com/raw/ixFJ0wcL", true))()
end)
--MISC
local Misc = Window:NewTab("Misc")
local MiscSection = Misc:NewSection("other shit")
MiscSection:NewButton("bhop", "makes u go like a bunny",function ()
	loadstring(game:HttpGet("https://pastebin.com/raw/frn3PV7d", true))()
end)
AimbotSection:NewButton("aimbot", "hold x for it", function()
local TeamCheck = true
local WallCheck = true
local Key = "X"
local BodyPart = "Head"
local FOV = 180
local Inset = game:GetService("GuiService"):GetGuiInset()
local SC = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
if string.len(Key) == 1 then
    Key = string.upper(Key)
end
function NotObstructing(Destination, Ignore)
    local Origin = workspace.CurrentCamera.CFrame.Position
    local CheckRay = Ray.new(Origin, Destination - Origin)
    local Hit = workspace:FindPartOnRayWithIgnoreList(CheckRay, Ignore)
    return Hit == nil
end
function ClosestHoe()
    local MaxDist, Nearest = math.huge
    for I,V in pairs(game:GetService("Players"):GetPlayers()) do
        if V ~= game:GetService("Players").LocalPlayer and V.Character and V.Character:FindFirstChild("Humanoid") then
            if WallCheck then
                if TeamCheck then
                    if V.Team ~= game:GetService("Players").LocalPlayer.Team then
                        local Pos, Vis = workspace.CurrentCamera:WorldToScreenPoint(V.Character[BodyPart].Position)
                        if Vis and NotObstructing(V.Character[BodyPart].Position, {game:GetService("Players").LocalPlayer.Character, V.Character}) then
                            local Diff = math.sqrt((Pos.X - SC.X) ^ 2 + (Pos.Y + Inset.Y - SC.Y) ^ 2)
                            if Diff < MaxDist and Diff < FOV then
                                MaxDist = Diff
                                Nearest = V
                            end
                        end
                    end
                else
                    local Pos, Vis = workspace.CurrentCamera:WorldToScreenPoint(V.Character[BodyPart].Position)
                    if Vis and NotObstructing(V.Character[BodyPart].Position, {game:GetService("Players").LocalPlayer.Character, V.Character}) then
                        local Diff = math.sqrt((Pos.X - SC.X) ^ 2 + (Pos.Y + Inset.Y - SC.Y) ^ 2)
                        if Diff < MaxDist and Diff < FOV then
                            MaxDist = Diff
                            Nearest = V
                        end
                    end
                end
            else
                if TeamCheck then
                    if V.Team ~= game:GetService("Players").LocalPlayer.Team then
                        local Pos, Vis = workspace.CurrentCamera:WorldToScreenPoint(V.Character[BodyPart].Position)
                        if Vis then
                            local Diff = math.sqrt((Pos.X - SC.X) ^ 2 + (Pos.Y + Inset.Y - SC.Y) ^ 2)
                            if Diff < MaxDist and Diff < FOV then
                                MaxDist = Diff
                                Nearest = V
                            end
                        end
                    end
                else
                    local Pos, Vis = workspace.CurrentCamera:WorldToScreenPoint(V.Character[BodyPart].Position)
                    if Vis then
                        local Diff = math.sqrt((Pos.X - SC.X) ^ 2 + (Pos.Y + Inset.Y - SC.Y) ^ 2)
                        if Diff < MaxDist and Diff < FOV then
                            MaxDist = Diff
                            Nearest = V
                        end
                    end
                end
            end
        end
    end
    return Nearest
end

game:GetService("RunService").RenderStepped:Connect(function()
    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode[Key]) then
        local Hoe = ClosestHoe()
        if Hoe and Hoe.Character and Hoe.Character:FindFirstChild(BodyPart) then
            local Pos, Vis = workspace.CurrentCamera:WorldToScreenPoint(Hoe.Character[BodyPart].Position)
            if Vis then
                mousemoverel(Pos.X - Mouse.X, Pos.Y - Mouse.Y)
            end
        end
    end
end)
end)

