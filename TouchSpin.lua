-- Attach this Script directly under the spinning Part.
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local part = script.Parent
local busy = false

part.Touched:Connect(function(hit)
    if busy then
        return
    end

    local character = hit:FindFirstAncestorOfClass("Model")
    if not character or not Players:GetPlayerFromCharacter(character) then
        return
    end

    busy = true
    local target = {CFrame = part.CFrame * CFrame.Angles(0, math.rad(720), 0)}
    local tween = TweenService:Create(part, TweenInfo.new(1.2, Enum.EasingStyle.Quad), target)
    tween:Play()
    tween.Completed:Wait()
    busy = false
end)
