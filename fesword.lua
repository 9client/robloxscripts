local FALLBACK_NAME = "fatigue"

local plr = game.Players:FindFirstChild(FALLBACK_NAME)
local plrgui = plr.PlayerGui
local chr
local rightarm

local active_hint
function inform(msg,t)
    if active_hint then
        active_hint:Destroy()
    end
    active_hint = Instance.new("Hint")
    active_hint.Text = msg
    active_hint.Parent = plrgui
    game.Debris:AddItem(active_hint, t)
end

function setup_chr(chrr)

    chr = chrr or plr.Character
    rightarm = chr:FindFirstChild("Right Arm") or chr:WaitForChild("Right Arm")

    local sword_model = Instance.new("Model")
    sword_model.Parent = workspace
    local sword_p1 = Instance.new("Part")
    sword_p1.BrickColor = BrickColor.new("Medium stone grey")
    sword_p1.Reflectance = .5
    sword_p1.Position = Vector3.new(10.9, 0.1, -5.1)
    sword_p1.FormFactor = Enum.FormFactor.Custom
    sword_p1.Size = Vector3.new(5.8, 0.2, 0.2)
    sword_p1.CanCollide = false
    sword_p1.Parent = sword_model
    local sword_p2 = Instance.new("Part")
    sword_p2.BrickColor = BrickColor.new("Medium stone grey")
    sword_p2.Reflectance = .5
    sword_p2.Position = Vector3.new(10.2, 0.3, -5.1)
    sword_p2.FormFactor = Enum.FormFactor.Custom
    sword_p2.Size = Vector3.new(4.4, 0.2, 0.2)
    sword_p2.CanCollide = false
    sword_p2.Parent = sword_model
    local sword_p3 = Instance.new("Part")
    sword_p3.BrickColor = BrickColor.new("Medium stone grey")
    sword_p3.Reflectance = .5
    sword_p3.Position = Vector3.new(13, 0.2, -5.1)
    sword_p3.FormFactor = Enum.FormFactor.Custom
    sword_p3.Size = Vector3.new(1.2, 0.2, 0.2)
    sword_p3.CanCollide = false
    sword_p3.Parent = sword_model
    local sword_p4 = Instance.new("Part")
    sword_p4.BrickColor = BrickColor.new("Black")
    sword_p4.Position = Vector3.new(7.9, 0.2, -5.1)
    sword_p4.FormFactor = Enum.FormFactor.Custom
    sword_p4.CanCollide = false
    sword_p4.Size = Vector3.new(0.2, 0.8, 0.6)
    sword_p4.Parent = sword_model
    local sword_p5 = Instance.new("Part")
    sword_p5.BrickColor = BrickColor.new("Black")
    sword_p5.Position = Vector3.new(7.1, 0.2, -5.1)
    sword_p5.FormFactor = Enum.FormFactor.Custom
    sword_p5.CanCollide = false
    sword_p5.Size = Vector3.new(1.4, 0.4, 0.2)
    sword_p5.Parent = sword_model
    sword_model.PrimaryPart = sword_p1

    for _,v in pairs(sword_model:GetChildren()) do
        if v ~= sword_model.PrimaryPart then
            local weld = Instance.new("Weld")
            weld.Parent = sword_model.PrimaryPart
            weld.C0 = v.CFrame:toObjectSpace(sword_model.PrimaryPart.CFrame)
            weld.Part0 = sword_model.PrimaryPart
            weld.Part1 = v
        end
    end

    local arm_weld = Instance.new("Weld")
    arm_weld.Parent = rightarm
    arm_weld.Part0 = rightarm
    arm_weld.Part1 = sword_model.PrimaryPart
    arm_weld.C0 = CFrame.new(0,-.8,-3.8) * CFrame.Angles(0,-math.pi*.5,0)

    for _,v in pairs(char:GetChildren()) do
        if v:IsA("Accoutrement") or v:IsA("Clothing") or v:IsA("CharacterMesh") or v:IsA("ShirtGraphic") or v:IsA("BodyColors") then
            v:Destroy()
        elseif v.Name == "Head" then
            for _,dildo in pairs(v:GetChildren()) do
                if dildo:IsA("Decal") then
                    dildo:Destroy()
                end
            end
        end
    end

    local body_colors = chr:FindFirstChild("Body Colors")
    if body_colors then
        body_colors.HeadColor = BrickColor.new("Black")
        body_colors.TorsoColor = BrickColor.new("Black")
        body_colors.LeftArmColor = BrickColor.new("Black")
        body_colors.RightArmColor = BrickColor.new("Black")
        body_colors.LeftLegColor = BrickColor.new("Black")
        body_colors.RightLegColor = BrickColor.new("Black")
    end

    chr:FindFirstChild("Animate"):Destroy()

end

if plr.Character then
    setup_chr()
end

inform("fe sword loaded",4)