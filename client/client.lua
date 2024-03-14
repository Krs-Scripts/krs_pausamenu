

RegisterKeyMapping('+openMenuPause', 'MENU PAUSA', 'KEYBOARD', 'ESCAPE')

RegisterCommand('+openMenuPause',function()
	if not IsPauseMenuActive() then
		openPauseMenu()
	end
end)

function MainThread()
    while true do
        Wait(0)
        if IsPauseMenuActive() then
            -- print("Il menu di pausa è attivo.")
        else
            DisableControlAction(1, 200, true)
        end
    end
end

CreateThread(MainThread)

function openPauseMenu()
    local options = {}

    local banca, contanti, nome, lavoro, grado, data, id, black_money = lib.callback.await('krs_pausemenu:check', false)

	local societyMoney = GetSocietyMoney(ESX.PlayerData.job.name)
	local societyMoneyValue = societyMoney and tostring(societyMoney) or "N/A"
	
	local playerInfo = {
		{ label = 'Name', value = " " .. nome .. " " },
		{ label = 'Date', value =  " " .. data .. " " },
		{ label = 'Job', value =  " " .. lavoro .. " " },
		{ label = 'Grade', value =  " " .. grado .. " " },
		{ label = 'Wallet $', value =  " " .. contanti .. " " },
		{ label = 'Bank $', value =  " " .. banca .. " " },
		{ label = 'Dirty $', value =  " " .. black_money .. " " },
		{ label = 'Society $', value =  " " .. societyMoneyValue .. " " }, 
		{ label = 'ID Player', value =  " " .. id .. " " },
	}

    lib.registerContext({
        id = 'open_menu',
        title = 'Krs Menu Pausa',
        arrow = true,
        options = {
            {
                title = 'INFO PLAYERS',
                icon = "fa-solid fa-circle-info", 
                iconAnimation = 'beatFade',
                iconColor = '#F8F9FA',
                metadata = playerInfo,
                onBack = function(data)
                end
            },
            {
                title = 'MAP',
                icon = "fa-solid fa-map-location-dot", 
                iconAnimation = 'beatFade',
                iconColor = '#F8F9FA',
                image = icon and icon or "https://cdn.discordapp.com/attachments/1132248003093221467/1210409323415609404/logo.png?ex=65f3af07&is=65e13a07&hm=9b4cc361dc683a4ebf940f2992e794f1b39b909b296001ebdf0f064f2e60bdf6&",
                onSelect = function(data)
                    openMap()
                end
            },
            {
                title = 'SETTINGS',
                icon = "fa-solid fa-gear", 
                iconAnimation = 'beatFade',
                iconColor = '#F8F9FA',
                image = icon and icon or "https://cdn.discordapp.com/attachments/1132248003093221467/1210409323415609404/logo.png?ex=65f3af07&is=65e13a07&hm=9b4cc361dc683a4ebf940f2992e794f1b39b909b296001ebdf0f064f2e60bdf6&",
                onSelect = function(data)
                    openSettings()
                end
            },
            {
                title = 'EXIT GAME',
                icon = "fa-solid fa-right-from-bracket", 
                iconAnimation = 'beatFade',
                iconColor = '#F8F9FA',
                image = icon and icon or "https://cdn.discordapp.com/attachments/1132248003093221467/1210409323415609404/logo.png?ex=65f3af07&is=65e13a07&hm=9b4cc361dc683a4ebf940f2992e794f1b39b909b296001ebdf0f064f2e60bdf6&",
                onSelect = function(data)
                    exitGame()
                end
            },
        }
    })

    lib.showContext('open_menu')
end

function GetSocietyMoney(society)

    local callback = promise:new()

    lib.callback('krs_pausemenu:GetSocietyMoney', false, function (exists)

        callback:resolve(exists)

    end, society)

    return Citizen.Await(callback)
end


