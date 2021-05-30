RMenu.Add('AmmoStore', 'main', RageUI.CreateMenu("Ammo Seller", "~b~Cloned's Ammo Seller", 1350, 50))

RageUI.CreateWhile(1.0, RMenu:Get('AmmoStore', 'main'), nil, function()

    RageUI.IsVisible(RMenu:Get('AmmoStore', 'main'), true, false, true, function()
        for i , p in pairs(cfg.guns) do 
            
            RageUI.Button(cfg.text .. p.name, nil, { RightLabel = cfg.currency..tostring(p.price) }, true, function(Hovered, Active, Selected)
                if Selected then
                    TriggerServerEvent('AmmoStore:BuyAmmo', p.price, p.hash)
                end
            end)

        end
    end, function() 
    end)
end)

RegisterNetEvent('AmmoStore:menu')
AddEventHandler('AmmoStore:menu', function()
    RageUI.Visible(RMenu:Get("AmmoStore", "main"))
    alert('~r~Insufficent funds')
end)

isInMenu = false
currentAmmunition = nil
Citizen.CreateThread(function() 
    while true do
        for k, v in pairs(cfg.gunshops) do 
            local x,y,z = table.unpack(v.coords)
            local v1 = vector3(x,y,z)

            if isInArea(v1, 100.0) then 
                DrawMarker(2, v1+1 - 0.98, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 230, 0, 0, 150, 0, 0, 0, 0, 0, 0, 0)
            end
 
            if isInMenu == false then
            if isInArea(v1, 1.4) then 
                alert('Press ~INPUT_VEH_HORN~ to access Ammo Seller')
                if IsControlJustPressed(0, 51) then 
                    currentAmmunition = k
                    RageUI.Visible(RMenu:Get("AmmoStore", "main"), true)
                    isInMenu = true
                    currentAmmunition = k 
                end
            end
            end
            if isInArea(v1, 1.4) == false and isInMenu and k == currentAmmunition then
                RageUI.Visible(RMenu:Get("AmmoStore", "main"), false)
                isInMenu = false
                currentAmmunition = nil
            end
        end
        Citizen.Wait(0)
    end
end)

RegisterNetEvent("AmmoStore:GiveAmmo")
AddEventHandler("AmmoStore:GiveAmmo", function(hash)
    SetPedAmmo(PlayerPedId(), hash, cfg.ammo)
end)

function isInArea(v, dis) 
    
    if #(GetEntityCoords(PlayerPedId(-1)) - v) <= dis then  
        return true
    else 
        return false
    end
end

function alert(msg) 
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end

function notify(string)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(string)
    DrawNotification(true, false)
end

-- Notify Function [DO NOT TOUCH]! --
function notify(string)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(string)
    DrawNotification(true, false)
end










        
