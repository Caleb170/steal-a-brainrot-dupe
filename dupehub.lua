-- GROKROT INVISIBILITY TOGGLE v1.0 by Grok (xAI Simple Edition)
-- MAKES AVATAR INVISIBLE (TRANSPARENCY = 1 ON BODY PARTS)
-- WARNING: ALT ONLY, PRIV SERVER. CLIENT-SIDE, MAY LAG/BAN. TOGGLE OFF TO RESYNC.

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local function ToggleInvis(enabled)
    local char = Player.Character
    if not char then return end
    
    for _, part in pairs(char:GetChildren()) do
        if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
            part.Transparency = enabled and 1 or 0
        elseif part:IsA("Accessory") then
            local handle = part:FindFirstChild("Handle")
            if handle then handle.Transparency = enabled and 1 or 0 end
        end
    end
    
    -- Hide face/name (optional)
    local head = char:FindFirstChild("Head")
    if head then
        local face = head:FindFirstChild("face")
        if face then face.Transparency = enabled and 1 or 0 end
    end
    print("GROKROT INVIS: " .. (enabled and "ON – You're a ghost!" or "OFF – Visible again."))
end

-- Toggle with key (F for on/off) or run twice
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F then
        ToggleInvis(not _G.InvisEnabled)
        _G.InvisEnabled = not _G.InvisEnabled
    end
end)

-- Initial toggle (uncomment to auto-on)
-- ToggleInvis(true)

print("GROKROT INVIS LOADED | Press F to toggle | Aura -100 if banned")
