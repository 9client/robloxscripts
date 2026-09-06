local msg = [[get out of here stinky!]]
local stinky = {"1zqf"}

for _,user in pairs(stinky) do
    if game.Players:FindFirstChild(user) then
        game.Players[user]:Kick(msg)
    end
end

game.Players.PlayerAdded:connect(function(plr)
    for _,user in pairs(stinky) do
        if plr.Name == user then
            plr:Kick(msg)
        end
    end
end)
