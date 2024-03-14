function openMap()
    ActivateFrontendMenu("FE_MENU_VERSION_MP_PAUSE", true, -1)
    while not IsPauseMenuActive() do
        Wait(0)
    end
    PauseMenuceptionGoDeeper(0)
    PauseMenuceptionTheKick()
    SetNuiFocus(false, false)
end

function openSettings()
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_LANDING_MENU'), 0, -1)
end

function exitGame()
    TriggerServerEvent("krs_pausemenu:escidalgioco")
end