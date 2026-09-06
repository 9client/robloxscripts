local host = game.Players.mooseduck
print"say your target character's name in chat"
msg, _ = host.Chatted:wait()
function insert(id, parent)
	game:GetService("InsertService"):LoadAsset(id):GetChildren()[1].Parent = parent
end
print(msg)
local char = workspace:FindFirstChild(msg)
if not char then error'invalid character' end
for i, v in pairs(char:GetChildren()) do
	if v:IsA("Accoutrement") or v:IsA("Clothing") or v:IsA("CharacterMesh") or v:IsA("ShirtGraphic") or v:IsA("BodyColors") then
		v:Destroy()
	elseif v.Name == "Head" then
		for _, vv in pairs(v:GetChildren()) do
			if vv:IsA("Decal") or vv:IsA("SpecialMesh") then
				vv:Destroy()
			end
		end
	end
end

insert(1378, char)
insert(1439, char.Head)
insert(1655, char)
insert(10831, char)
insert(10834, char)
insert(10835, char)
insert(10836, char)
insert(10837, char.Head)
insert(10840, char)
char.Torso.roblox:Destroy()
