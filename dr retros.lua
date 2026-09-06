local host = game.Players.mooseduck
print"say your target character's name in chat"
msg, _ = host.Chatted:wait()
function insert(id, parent)
	game:GetService("InsertService"):LoadAsset(id):GetChildren()[1].Parent = parent
end
function turn(char)
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
	if char.Torso:FindFirstChild("roblox") then
		char.Torso.roblox:Destroy()
	end
end

print(msg)
if msg == "all" then
	for _, plr in pairs(game.Players:GetChildren()) do
		turn(plr.Character)
	end
elseif msg == "others" then
	for _, plr in pairs(game.Players:GetChildren()) do
		if plr~=host then
			turn(plr.Character)
		end
	end
else
	turn(game.Players:FindFirstChild(msg).Character)
end
