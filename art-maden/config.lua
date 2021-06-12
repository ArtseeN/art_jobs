WeightSystem = true -- If you using limit system set false!

Jobs = {
    ["Madenci"] = {
        jobRequired = false,
        jobName = "Madenci",
        location = { 
            [1] = { --collect
                coords = vector3(2951.746, 2769.297, 39.046),
                blip = {
                    showBlip = true,
                    blipName = "Maden Ocağı",
                    sprite = 177,
                    color = 5,
                    scale = 0.65,
                },
                marker = {
                    enable = true,
                    size  = { x = 0.7, y = 0.7, z = 0.4 },
                    color = { r = 255, g = 0, b = 0 },
                    type  = 2,
                    farDistance = 50 -- Marker show distance
                },
                draw3dtext = {
                    enable = true,
                    text = "~g~E ~w~ Tas Kaz",
                    distance = 4--Drawtext show distance
                },
                item = {
                    process = "kpickup", --dont touch

                    itemName = "stones",
                    addCount = 4,
                },                
                animation = {
                    enable = true,
                    animDict = "melee@large_wpn@streamed_core",
                    animName = "ground_attack_on_spot",
                },
                progressbar = {
                    enable = true,
                    progText = "Taş Kazılıyor...", 
                    duration = 6500
                }
            },
            [2] = { --process
                coords = vector3(2682.114, 2796.355, 40.698), 
                blip = {
                    showBlip = true,
                    blipName = "Maden Yıkama",
                    sprite = 177, 
                    color = 5,
                    scale = 0.65,
                },
                marker = {
                    enable = true,
                    size  = { x = 0.7, y = 0.7, z = 0.4 },
                    color = { r = 204, g = 204, b = 0 },
                    type  = 2,
                    farDistance = 60 -- Marker show distance
                },
                draw3dtext = {
                    enable = true,
                    text = "~g~E ~w~ Tas Yıkama",
                    distance = 4--Drawtext show distance
                },
                item = {
                    process = "kexchange", --dont touch
                    
                    addCount = 8,
                    itemName = "washedstones",
                    
                    removeCount = 4,
                    requiredItem = "stones",
                },
                animation = {
                    enable = true,
                    animDict = "mp_car_bomb",
                    animName = "car_bomb_mechanic",
                },
                progressbar = {
                    enable = true,
                    progText = "Tas Yıkanıyor...",
                    duration = 3500
                }
            },
            [3] = { --package
                coords = vector3(2625.820, 2791.888, 33.824), 
                blip = {
                    showBlip = true,
                    blipName = "Maden Ayıklama",
                    sprite = 177, 
                    color = 5,
                    scale = 0.65,
                },
                marker = {
                    enable = true,
                    size  = { x = 0.7, y = 0.7, z = 0.4 },
                    color = { r = 204, g = 204, b = 0 },
                    type  = 2,
                    farDistance = 45 -- Marker show distance
                },
                draw3dtext = {
                    enable = true,
                    text = "~g~E ~w~ Kömür Ayikla",
                    distance = 4--Drawtext show distance
                },
                item = {
                    process = "kpackage", --dont touch

                    addCount = 8,
                    itemName = "komur",

                    removeCount = 2,
                    requiredItem = "washedstones", 
                },
                animation = {
                    enable = true,
                    animDict = "mp_car_bomb",
                    animName = "car_bomb_mechanic",
                },
                progressbar = {
                    enable = true,
                    progText = "Kömürleri Ayıklıyorsun...",
                    duration = 9000
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
