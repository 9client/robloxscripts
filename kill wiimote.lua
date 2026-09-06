for i, v in pairs(game.Players:GetPlayers()) do
  if v.Backpack:FindFirstChild("Wiimote") then
    v.Backpack.Wiimote:Destroy()
  elseif v.Character:FindFirstChild("Wiimote") then
    v.Character.Wiimote:Destroy()
  end
end
game.StarterPack.Wiimote:Destroy()
