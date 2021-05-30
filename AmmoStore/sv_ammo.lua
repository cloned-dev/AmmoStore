local Tunnel = module('vrp', 'lib/Tunnel')
local Proxy = module('vrp', 'lib/Proxy')
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "")

RegisterServerEvent("AmmoStore:BuyAmmo")
AddEventHandler('AmmoStore:BuyAmmo', function(price, hash)
    local source = source
    userid = vRP.getUserId({source})
    if cfg.perm ~= nil then 
        if vRP.hasPermission({userid, cfg.perm}) then
            if vRP.tryPayment({userid, price}) then
                TriggerClientEvent("AmmoStore:GiveAmmo", source,  hash)
                vRPclient.notify(source, {"~g~Paid "..cfg.currency..tostring(price)})
            else 
                TriggerClientEvent("AmmoStore:menu", source, false)
                vRPclient.notify(source, {"~r~Insufficient funds"})
            end
        else
            vRPclient.notify(source, {"~r~You do not have permission to buy guns"})
        end
    else 
        if vRP.tryPayment({userid, price}) then
            TriggerClientEvent("AmmoStore:givewap", source,  hash)
            vRPclient.notify(source, {"~g~Paid "..cfg.currency..tostring(price)})
        else 
            TriggerClientEvent("AmmoStore:menu", source, false)
            vRPclient.notify(source, {"~r~Insufficient funds"})
        end
    end
end)


