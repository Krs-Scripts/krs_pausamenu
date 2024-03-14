RegisterNetEvent("krs_pausemenu:escidalgioco", function()
    local player = source
    DropPlayer(player, "[Krs Scripts] \nSei stato disconnesso dal server.")
end)

lib.callback.register('krs_pausemenu:check', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    local banca = xPlayer.getAccount("bank").money
    local contanti = xPlayer.getAccount("money").money
    local black_money = xPlayer.getAccount("black_money").money
    local nome = xPlayer.getName()
    local lavoro = xPlayer.job.name
    local grado = xPlayer.job.grade_name
    local data = xPlayer.variables.dateofbirth
    local id = source

    return banca, contanti, nome, lavoro, grado, data, id, black_money
end)

lib.callback.register('krs_pausemenu:GetSocietyMoney', function(source, society)
    local response = MySQL.query.await("SELECT money FROM addon_account_data WHERE account_name = ?", {("society_%s"):format(society)})
    
    if response and response[1] then
        local money = tonumber(response[1].money)
        
        if money then
            return money
        else
            -- print("Error: 'money' field is nil or not present in the result.")
        end
    else
        -- print("No results found for society:", society)
    end

    return 0
end)