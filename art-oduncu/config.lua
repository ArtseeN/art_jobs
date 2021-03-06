WeightSystem = true -- If you using limit system set false!

Jobs = {
    ["Slaughterer"] = {
        jobRequired = false,
        jobName = "slaughterer",
        location = { 
            [1] = { --collect
                coords = vector3(-554.167, 5370.145, 70.357),
                blip = {
                    showBlip = false,
                    blipName = "Oduncu",
                    sprite = 256,
                    color = 5,
                    scale = 0.65,
                },
                marker = {
                    enable = true,
                    size  = { x = 0.7, y = 0.7, z = 0.4 },
                    color = { r = 255, g = 0, b = 0 },
                    type  = 2,
                    farDistance = 40 -- Marker show distance
                },
                draw3dtext = {
                    enable = true,
                    text = "~g~E ~w~ Odun kes",
                    distance = 4--Drawtext show distance
                },
                item = {
                    process = "pickup", --dont touch

                    itemName = "wood",
                    addCount = 5,
                },                
                animation = {
                    enable = true,
                    animDict = "amb@world_human_hammering@male@base",
                    animName = "base",
                },
                progressbar = {
                    enable = true,
                    progText = "Odun Kesiliyor...", 
                    duration = 10000 
                }
            },
            [2] = { --process
                coords = vector3(-533.871, 5292.948, 74.174), 
                blip = {
                    showBlip = false,
                    blipName = "Odun işleme",
                    sprite = 256, 
                    color = 5,
                    scale = 0.65,
                },
                marker = {
                    enable = true,
                    size  = { x = 0.7, y = 0.7, z = 0.4 },
                    color = { r = 204, g = 204, b = 0 },
                    type  = 2,
                    farDistance = 10 -- Marker show distance
                },
                draw3dtext = {
                    enable = true,
                    text = "~g~E ~w~ Odun işle",
                    distance = 2--Drawtext show distance
                },
                item = {
                    process = "exchange", --dont touch
                    
                    addCount = 5,
                    itemName = "cutted_wood",
                    
                    removeCount = 10,
                    requiredItem = "wood",
                },
                animation = {
                    enable = true,
                    animDict = "mp_car_bomb",
                    animName = "car_bomb_mechanic",
                },
                progressbar = {
                    enable = true,
                    progText = "Odun İşleniyor...",
                    duration = 7500
                }
            },
            [3] = { --package
                coords = vector3(-1, -1026.95, 27.291), 
                blip = {
                    showBlip = false,
                    blipName = "Odun Alıcısı",
                    sprite = 566, 
                    color = 5,
                    scale = 0.65,
                },
                marker = {
                    enable = true,
                    size  = { x = 0.7, y = 0.7, z = 0.4 },
                    color = { r = 204, g = 204, b = 0 },
                    type  = 2,
                    farDistance = 10 -- Marker show distance
                },
                draw3dtext = {
                    enable = true,
                    text = "~g~E ~w~ İnşaat`a odunları sat",
                    distance = 2--Drawtext show distance
                },
                item = {
                    process = "package", --dont touch

                    addCount = 1,
                    itemName = "cutted_wood",

                    removeCount = 1,
                    requiredItem = "slaughtered_chicken", 
                },
                animation = {
                    enable = true,
                    animDict = "mp_car_bomb",
                    animName = "car_bomb_mechanic",
                },
                progressbar = {
                    enable = true,
                    progText = "Packaging...",
                    duration = 5000
                }
            },

            [4] = { --sell
                coords = vector3(-1, -1026.95, 27.291), 
                blip = {
                    showBlip = false,
                    blipName = "Odun Alıcısı",
                    sprite = 566, 
                    color = 5,
                    scale = 0.65,
                },
                marker = {
                    enable = true,
                    size  = { x = 0.7, y = 0.7, z = 0.4 },
                    color = { r = 204, g = 204, b = 0 },
                    type  = 2,
                    farDistance = 10 -- Marker show distance
                },
                draw3dtext = {
                    enable = true,
                    text = "~g~E ~w~Insaat`a odunları sat",
                    distance = 2 --Drawtext show distance
                },
                item = {
                    process = "sell", --dont touch

                    removeCount = 10,
                    requiredItem = "cutted_wood",
                    price = 400
                },
                animation = {
                    enable = true,
                    animDict = "mp_car_bomb",
                    animName = "car_bomb_mechanic",
                },
                progressbar = {
                    enable = true,
                    progText = "Çalışan`la konuşuyorsun...",
                    duration = 5000
                }
            }
        },
    },

    --[[["Slaughterer"] = { same like above (example)
        jobRequired = true,
        jobName = "slaughterer",
        location = { 
            [1] = { --collect
                coords = vector3(-62.568504333496, 6241.3959960938, 31.090072631836),
                blip = {
                    showBlip = true,
                    blipName = "Chicken collect",
                    sprite = 256,
                    color = 5,
                    scale = 0.65,
                },
                marker = {
                    enable = true,
                    size  = { x = 0.7, y = 0.7, z = 0.4 },
                    color = { r = 255, g = 0, b = 0 },
                    type  = 2,
                    farDistance = 10 -- Marker show distance
                },
                draw3dtext = {
                    enable = true,
                    text = "Press ~g~E ~w~for collect some chicken",
                    distance = 2--Drawtext show distance
                },
                item = {
                    process = "pickup", --dont touch

                    itemName = "alive_chicken",
                    addCount = 1,
                },                
                animation = {
                    enable = true,
                    animDict = "mp_car_bomb",
                    animName = "car_bomb_mechanic",
                },
                progressbar = {
                    enable = true,
                    progText = "Collecting...", 
                    duration = 5000 
                }
            },
            [2] = { --process
                coords = vector3(-77.872123718262, 6229.68359375, 31.091892242432), 
                blip = {
                    showBlip = true,
                    blipName = "Chicken processing",
                    sprite = 256, 
                    color = 5,
                    scale = 0.65,
                },
                marker = {
                    enable = true,
                    size  = { x = 0.7, y = 0.7, z = 0.4 },
                    color = { r = 204, g = 204, b = 0 },
                    type  = 2,
                    farDistance = 10 -- Marker show distance
                },
                draw3dtext = {
                    enable = true,
                    text = "Press ~g~E ~w~for process chicken",
                    distance = 2--Drawtext show distance
                },
                item = {
                    process = "exchange", --dont touch
                    
                    addCount = 1,
                    itemName = "slaughtered_chicken",
                    
                    removeCount = 1,
                    requiredItem = "alive_chicken",
                },
                animation = {
                    enable = true,
                    animDict = "mp_car_bomb",
                    animName = "car_bomb_mechanic",
                },
                progressbar = {
                    enable = true,
                    progText = "Processing...",
                    duration = 5000
                }
            },
            [3] = { --package
                coords = vector3(-101.88007354736, 6208.83984375, 31.025022506714), 
                blip = {
                    showBlip = true,
                    blipName = "Slaughterer package",
                    sprite = 256, 
                    color = 5,
                    scale = 0.65,
                },
                marker = {
                    enable = true,
                    size  = { x = 0.7, y = 0.7, z = 0.4 },
                    color = { r = 204, g = 204, b = 0 },
                    type  = 2,
                    farDistance = 10 -- Marker show distance
                },
                draw3dtext = {
                    enable = true,
                    text = "Press ~g~E ~w~for package slaughtered chickens",
                    distance = 2--Drawtext show distance
                },
                item = {
                    process = "package", --dont touch

                    addCount = 1,
                    itemName = "packaged_chicken",

                    removeCount = 1,
                    requiredItem = "slaughtered_chicken", 
                },
                animation = {
                    enable = true,
                    animDict = "mp_car_bomb",
                    animName = "car_bomb_mechanic",
                },
                progressbar = {
                    enable = true,
                    progText = "Packaging...",
                    duration = 5000
                }
            },

            [4] = { --sell
                coords = vector3(-591.99017333984, -892.53790283203, 25.934808731079), 
                blip = {
                    showBlip = true,
                    blipName = "Slaughterer Sell",
                    sprite = 256, 
                    color = 5,
                    scale = 0.65,
                },
                marker = {
                    enable = true,
                    size  = { x = 0.7, y = 0.7, z = 0.4 },
                    color = { r = 204, g = 204, b = 0 },
                    type  = 2,
                    farDistance = 10 -- Marker show distance
                },
                draw3dtext = {
                    enable = true,
                    text = "Press ~g~E ~w~for sell packaged chickens",
                    distance = 2 --Drawtext show distance
                },
                item = {
                    process = "sell", --dont touch

                    removeCount = 1,
                    requiredItem = "packaged_chicken",
                    price = 100
                },
                animation = {
                    enable = true,
                    animDict = "mp_car_bomb",
                    animName = "car_bomb_mechanic",
                },
                progressbar = {
                    enable = true,
                    progText = "Selling...",
                    duration = 5000
                }
            }
        },
    },--]]
}
