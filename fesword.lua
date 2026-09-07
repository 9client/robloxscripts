local FALLBACK_NAME = "fatigue"

local rs = game:GetService("RunService")

local plr = game.Players.LocalPlayer or game.Players:FindFirstChild(FALLBACK_NAME)
local plrgui = plr.PlayerGui

local fake
local fake_parts
local chr
local chr_parts
local hum
local offsets

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

function lerp(a,b,c)
	return a + (b-a) * c
end

function setup_chr(chrr)

    chr = chrr or plr.Character
	chr_parts = {
		head = chr:WaitForChild("Head"),
	    torso = chr:WaitForChild("Torso"),
		leftarm = chr:WaitForChild("Left Arm"),
		rightarm = chr:WaitForChild("Right Arm"),
		leftleg = chr:WaitForChild("Left Leg"),
		rightleg = chr:WaitForChild("Right Leg"),
	}
	
	fake = Instance.new("Model")
	fake.Name = "FAKEEE"
	
	local fake_head = Instance.new("Part")
	fake_head.FormFactor = Enum.FormFactor.Custom
	fake_head.Size = Vector3.new(1.25,1.25,1.25)
	fake_head.CanCollide = false
	fake_head.Anchored = true
	fake_head.Name = chr_parts.head.Name
	fake_head.Parent = fake
	
	local fake_torso = Instance.new("Part")
	fake_torso.FormFactor = Enum.FormFactor.Custom
	fake_torso.Size = chr_parts.torso.Size
	fake_torso.CanCollide = false
	fake_torso.Anchored = true
	fake_torso.Name = chr_parts.torso.Name
	fake_torso.Parent = fake
	
	local fake_ll = Instance.new("Part")
	fake_ll.FormFactor = Enum.FormFactor.Custom
	fake_ll.Size = chr_parts.leftleg.Size
	fake_ll.CanCollide = false
	fake_ll.Anchored = true
	fake_ll.Name = chr_parts.leftleg.Name
	fake_ll.Parent = fake
	
	local fake_rl = Instance.new("Part")
	fake_rl.FormFactor = Enum.FormFactor.Custom
	fake_rl.Size = chr_parts.rightleg.Size
	fake_rl.CanCollide = false
	fake_rl.Anchored = true
	fake_rl.Name = chr_parts.rightleg.Name
	fake_rl.Parent = fake
	
	local fake_la = Instance.new("Part")
	fake_la.FormFactor = Enum.FormFactor.Custom
	fake_la.Size = chr_parts.leftarm.Size
	fake_la.CanCollide = false
	fake_la.Anchored = true
	fake_la.Name = chr_parts.leftarm.Name
	fake_la.Parent = fake
	
	local fake_ra = Instance.new("Part")
	fake_ra.FormFactor = Enum.FormFactor.Custom
	fake_ra.Size = chr_parts.rightarm.Size
	fake_ra.CanCollide = false
	fake_ra.Anchored = true
	fake_ra.Name = chr_parts.rightarm.Name
	fake_ra.Parent = fake
	
	fake.Parent = workspace
	fake_parts = {
		head = fake_head,
	    torso = fake_torso,
		leftarm = fake_la,
		rightarm = fake_ra,
		leftleg = fake_ll,
		rightleg = fake_rl,
	}
	offsets = {
		head = CFrame.new(),
	    torso = CFrame.new(),
		leftarm = CFrame.new(),
		rightarm = CFrame.new(),
		leftleg = CFrame.new(),
		rightleg = CFrame.new(),
	}
	
	local function clear_chr_part(v)
		if v:IsA("Accoutrement") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("ShirtGraphic") or v:IsA("BodyColors") then
			v:Destroy()
		elseif v:IsA("Part") then
			v.Transparency = 1
		end
	end
	
	chr.ChildAdded:connect(clear_chr_part)
	for _,v in pairs(chr:GetChildren()) do
		clear_chr_part(v)
	end
	
	fake.Parent = workspace
	
	hum = chr:WaitForChild("Humanoid")

    local sword_model = Instance.new("Model")
	sword_model.Name = "SWORD"
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

	local animate = chr:FindFirstChild("Animate")
	if animate then
		animate:Destroy()
	end
	
	local new_hum = Instance.new("Humanoid")
	hum:Destroy()
	hum = new_hum
	hum.Parent = chr
	
	local move_velocity = 0
	local move_alpha = 0
	local t = 0
	rs.RenderStepped:connect(function(dt)
		
		move_velocity = Vector2.new(chr_parts.torso.Velocity.X, chr_parts.torso.Velocity.Z).magnitude
		move_alpha = lerp(move_alpha, move_velocity > 5 and 1 or 0, 1 - math.exp(-dt * 12))
		
		t = t + dt
		
		offsets.torso = CFrame.new(0,math.sin(t * 2) * .05 - .2,math.cos(t * 2) * .1) * CFrame.Angles(math.rad(math.cos(t * 2) * 3 - 7),math.rad(math.sin(t * 2) * 4 + 18),0)
		offsets.head = CFrame.new(0,math.sin(t * 2) * .05 - .2,math.cos(t * 2) * .2 - .2) * CFrame.Angles(math.rad(math.sin(t * 2) * 3 - 6),0,0)
		offsets.rightarm = CFrame.new(-.1,math.sin(t * 2) * .1 - .2,math.cos(t * 2) * .2 - .4) * CFrame.Angles(math.rad(math.sin(t * 2) * 5 + 10),math.rad(math.cos(t * 2) * 3 + 20),math.rad(math.sin(t * 2) * 2 + 20))
		offsets.leftarm = CFrame.new(.1,math.cos(t * 2) * .1 - .4,math.sin(t * 2) * .2 + .2) * CFrame.Angles(math.rad(math.cos(t * 2) * 5 + 70),math.rad(math.cos(t * 2) * 5 + 70),math.rad(math.cos(t * 2) * 3 - 20))		
		offsets.rightleg = CFrame.new(.1,0,math.sin(t * 2 + .5) * .05 - .5) * CFrame.Angles(math.rad(math.sin(t * 2) * 4 + 5),-.1,0)
		offsets.leftleg = CFrame.new(-.15,0,math.sin(t * 2 + .5) * .05 + .3) * CFrame.Angles(math.rad(math.sin(t * 2) * 4 - 20),.3,0)
		
		for i,v in pairs(offsets) do
			fake_parts[i].CFrame = chr_parts[i].CFrame * v
		end
		
		sword_model:SetPrimaryPartCFrame(fake_parts.rightarm.CFrame * CFrame.new(0,-.8,-3.8) * CFrame.Angles(0,-math.pi*.5,0))
		
	end)

end

repeat wait() until plr.Character
setup_chr(plr.Character)

inform("fe sword loaded",5)
