local user = 1zqf
if game.Players:FindFirstChild(user) then
    game.Players[user]:Kick()
end
game.Players.PlayerAdded:connect(function(plr)
    if plr.Name == user then
        plr:Kick()
    end
end)
