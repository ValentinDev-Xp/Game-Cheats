-- Sistema para verificar a validade da chave e se o jogador é autorizado
local keysData = {
    keyExpiration = os.time{year=2023, month=8, day=31},
    whitelistedKeys = {
        {key = "key1", playerId = 12345678, maxUses = 1, uses = 0}, -- Apenas o jogador com o UserId 12345678 pode usar
        {key = "CHAVE2", playerId = 87654321, maxUses = 3, uses = 0}, -- Apenas o jogador com o UserId 87654321 pode usar
        {key = "CHAVE3", playerId = 11223344, maxUses = 10, uses = 0} -- Apenas o jogador com o UserId 11223344 pode usar
    }
}

local function canPlayerUseKey(player, key)
    local playerId = player.UserId
    local keyInfo

    -- Procura pela chave na lista de chaves whitelistadas
    for _, k in ipairs(keysData.whitelistedKeys) do
        if k.key == key then
            keyInfo = k
            break
        end
    end

    -- Se a chave não for encontrada, retorna falso
    if not keyInfo then
        return false, "Chave inválida."
    end

    -- Verifica se a chave expirou
    if os.time() > keysData.keyExpiration then
        return false, "A chave expirou."
    end

    -- Verifica se o jogador é autorizado a usar a chave
    if keyInfo.playerId ~= playerId then
        return false, "Você não tem permissão para usar esta chave."
    end

    -- Verifica se a chave ainda pode ser usada (com base no limite de usos)
    if keyInfo.uses >= keyInfo.maxUses then
        return false, "Limite de uso da chave atingido."
    end

    -- Incrementa o contador de uso da chave
    keyInfo.uses = keyInfo.uses + 1
    return true, "Chave usada com sucesso."
end

-- Exemplo de uso em um evento de um jogador tentando usar uma chave
game.Players.PlayerAdded:Connect(function(player)
    -- Quando o jogador tentar usar uma chave, você pode chamar a função canPlayerUseKey
    local key = "key1" -- Exemplo: o jogador tenta usar a key1
    local success, message = canPlayerUseKey(player, key)

    if success then
        print(message) -- "Chave usada com sucesso."
    else
        print(message) -- Mensagem de erro
    end
end)
