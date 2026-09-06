for _,plr in pairs(game.Players:GetPlayers()) do
    local succ,err = pcall(function()
        plr:Kick("shutting down server!")
    end)
end