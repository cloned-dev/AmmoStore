cfg = {}

cfg.perm = "player.phone" -- [Player.Phone as Deafult]
cfg.currency = "£"
cfg.text = "Restore Ammo for " -- [Keep Blank if you want none] - cfg.text = ""
cfg.ammo = 250 -- [When purchased Ammo get given on Gun]

cfg.gunshops = {
    [0] = {
        coords = {1504.7049560547,6325.263671875,24.082509994507},
    },
} 

cfg.guns = {

    {name = "Pistol", price = 1000, hash = "WEAPON_PISTOl"},
    {name = "Assault Rifle", price = 5000, hash = "WEAPON_ASSAULTRIFLE"},
    {name = "SMG", price = 2000, hash = "WEAPON_SMG"},

}


return cfg