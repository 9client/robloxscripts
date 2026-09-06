local model = Instance.new("Model", workspace)
model.Name = "touch me for part"
local head = Instance.new("Part", model)
head.Size = Vector3.new(3,1,3)
head.Position = Vector3.new(0,3,0)
head.Name = "Head"
head.Anchored = true
Instance.new("Humanoid",model)
local db = false
local c = head.Touched:connect(function ()
    if db then return end
    db = true
    head.BrickColor = BrickColor.Red()
    local part = Instance.new("Part")
    part.Size = Vector3.new(3,3,3)
    part.Shape = 0
    part.BrickColor = BrickColor.Red()
    part.Position = Vector3.new(0,100,0)
    part.Elasticity = 10
    part.Parent = workspace
    wait(1)
    head.BrickColor = BrickColor.Green()
    db = false
end)
local c2
c2 = workspace.ChildAdded:connect(function (child)
    if child.Name == "stopscr" then
        c:disconnect()
        c2:disconnect()
    end
end)
