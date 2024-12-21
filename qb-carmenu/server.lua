local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-carmenu:purchaseVehicle', function(model, price)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then
        print("[ERROR] Player not found for source: " .. tostring(src))
        return
    end

    if Player.Functions.RemoveMoney("bank", price) then
        TriggerClientEvent('qb-carmenu:vehiclePurchased', src, model)
    else
        TriggerClientEvent('QBCore:Notify', src, "Not enough money in your bank!", "error")
    end
end)
