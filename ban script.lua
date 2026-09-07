local ban_msg = [[get out of here stinky!]]
local kick_msg = [[get out of here stinky!]]
local shut_msg = [[shutting down server!]]

local stinky = {}
local ops = {"fatigue", "mooseduck"}

local conns = {}

function split(inputstr, sep)
    if not sep then
        sep = "%s"
    end

    local t = {}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end

    return t
end

function kill_people(plr)

    local chr = plr and plr.Character
    local hum = chr and chr:FindFirstChild("Humanoid")
    if hum then
        hum.Health = 0
    elseif chr then
        chr:BreakJoints()
    end

end

local cmds = {
    shutdown = function(sender, arg)
        if arg then
            local plr = game.Players:FindFirstChild(arg)
            if plr then
                plr:Kick(shut_msg)
            end
        end
    end,
    kick = function(sender)
        for _,plr in pairs(game.Players:GetPlayers()) do
            pcall(plr.Kick. plr, kick_msg)
        end
    end,
    ban = function(sender, arg)
        if arg then
            local plr = game.Players:FindFirstChild(arg)
            if plr then
                plr:Kick(ban_msg)
                table.insert(stinky, plr.Name)
            end
        end
    end,
    kill = function(sender, arg)
        if arg == "all" then
            for _,plr in pairs(game.Players:GetPlayers()) do
                kill_people(plr)
            end
        elseif arg then
            kill_people(game.Players:FindFirstChild(arg))
        end
    end,
    op = function(sender, arg)
        if arg then
            local plr = game.Players:FindFirstChild(arg)
            if plr then
                table.insert(stinky, arg)
                setup_op(plr)
            end
        end
    end,
}

function setup_op(plr)

    table.insert(conns, plr.Chatted:connect(function(msg)
        if string.sub(msg,1,1) == "!" then
            local cmd_t = split(string.sub(msg,2), " ")
            local cmd, arg = cmd_t[1], cmd_t[2]
            local cmd_f = cmds[cmd]
            if cmd_f then
                cmd_f(plr, arg)
            end
        end
    end))

end

function stop()

    for _,conn in pairs(conns) do
        conn:disconnect()
        conn = nil
    end

end

function setup()

    for _,user in pairs(ops) do
        local plr = game.Players:FindFirstChild(user)
        if plr then
            setup_op(plr)
        end
    end

    for _,user in pairs(stinky) do
        local plr = game.Players:FindFirstChild(user)
        if plr then
            plr:Kick(ban_msg)
        end
    end

    table.insert(conns, game.Players.PlayerAdded:connect(function(plr)
        for _,user in pairs(stinky) do
            if plr.Name == user then
                plr:Kick(ban_msg)
            end
        end
    end))

end

setup()