Config = {}

Config.defaultlang = "de_lang" -- Set Language (Current Languages: "en_lang" English, "de_lang" German)

-----------------------------------------------------------------------------------
----------------------------------Webhook Settings---------------------------------
-----------------------------------------------------------------------------------
Config.EnableWebHook = true
Config.WHTitle = 'Treasure:'
Config.WHLink = ''  -- Discord WH link Here
Config.WHColor = 16711680 -- red
Config.WHName = 'Treasure:' -- name
Config.WHLogo = '' -- must be 30x30px
Config.WHFooterLogo = '' -- must be 30x30px
Config.WHAvatar = '' -- must be 30x30px

-------------------------------------------------------------------------------------

Config.TrasureMapItem = 'schatzkarte'   -- item name in DD you wanna use to start the Tresure
Config.DigItem = 'shovel'  --- Dig Item
Config.ShovelUsage = 2 -- Drains Remaining Usage Each time Shovel
Config.MinDurability = 2 -- Durability Needed to Dig
Config.DiggingTimer = 20     --seconds
Config.Dig = {
    shovel = `p_shovel02x`,
    anim = { "amb_work@world_human_gravedig@working@male_b@idle_a", "idle_a" },
    bone = "skel_r_hand",
    pos = { 0.06, -0.06, -0.03, 270.0, 165.0, 17.0 },
}

Config.MaxTrys = 5    --- How much times you can dig before this tresure hunt aborts

Config.ChestNeedPick = true ---- true or false if you have to lockpick the found Chest
Config.LockpickItem = 'lockpick'   --- Lockpick Item


Config.OnlyMoney = false  -- Set Both to false to get Money and items But you can only get Money or item its random then if both are false
Config.OnlyItems = false  -- Set Both to false to get Money and items But you can only get Money or item its random then if both are false

Config.RewardCashMin = 40     --- This is the min or Max cash you can get anything between this will be taken
Config.RewardCashMax = 60    

Config.RewardItems = {     ---- This Are the Items and Amount you can get
    {item = 'diamond', amount = 6},
    {item = 'goldring', amount = 5},
    {item = 'emerald', amount = 7},
    {item = 'fossil', amount = 5}, 
    {item = 'joint', amount = 8},
    {item = 'mushroom', amount = 7},
    {item = 'opium', amount = 6},
}

Config.TreasureMissions = {
    {
        locationblip = vector3(-2148.47, 568.85, 117.07),  -- This is The Area Position where you have to go to find dig Positions
        blipsprite = 'blip_ambient_secret',
        Mission = {
            {coords = vector3(-2155.38, 567.72, 117.16)},  ------- Little Creek River
            {coords = vector3(-2150.08, 572.25, 117.1)},   ---------
            {coords = vector3(-2155.29, 584.52, 117.26)},  ----------These are The Dig Positions
            {coords = vector3(-2165.66, 576.29, 117.33)},  ---------
            {coords = vector3(-2164.27, 562.49, 117.2)},   -------
            
        },
    },
    {
        locationblip = vector3(1171.14, 2087.9, 334.29),  -- This is The Area Position where you have to go to find dig Positions
        blipsprite = 'blip_ambient_secret',
        Mission = {
            {coords = vector3(1172.06, 2089.92, 334.57)},  -------  Ambariono Above N
            {coords = vector3(1181.46, 2088.15, 334.47)},   ---------
            {coords = vector3(1180.03, 2075.28, 330.86)},  ----------These are The Dig Positions
            {coords = vector3(1165.3, 2074.02, 331.51)},  ---------
            {coords = vector3(1164.23, 2086.42, 335.45)},   -------
            
        },
    },
    {
        locationblip = vector3(2625.85, 2114.43, 174.0),  -- This is The Area Position where you have to go to find dig Positions
        blipsprite = 'blip_ambient_secret',
        Mission = {
            {coords = vector3(2631.4, 2106.67, 174.15)},  ------- Near Brandywine Drop
            {coords = vector3(2632.42, 2093.0, 174.26)},   ---------
            {coords = vector3(2619.54, 2085.64, 174.57)},  ----------These are The Dig Positions
            {coords = vector3(2610.74, 2090.23, 173.39)},  ---------
            {coords = vector3(2611.79, 2107.29, 173.53)},   -------
            
        },
    },
    {
        locationblip = vector3(2361.01, 487.65, 97.36),  -- This is The Area Position where you have to go to find dig Positions
        blipsprite = 'blip_ambient_secret',
        Mission = {
            {coords = vector3(2365.75, 483.22, 97.65)},  ------- Near Van Horn
            {coords = vector3(2370.28, 487.28, 97.35)},   ---------
            {coords = vector3(2367.84, 494.76, 96.73)},  ----------These are The Dig Positions
            {coords = vector3(2359.18, 495.31, 96.6)},  ---------
            {coords = vector3(2352.93, 489.49, 96.67)},   -------
            
        },
    },
    {
        locationblip = vector3(1847.56, -873.24, 41.39),  -- This is The Area Position where you have to go to find dig Positions
        blipsprite = 'blip_ambient_secret',
        Mission = {
            {coords = vector3(1846.88, -881.33, 41.29)},  ------- Lagras
            {coords = vector3(1851.01, -869.25, 40.8)},   ---------
            {coords = vector3(1845.63, -863.27, 42.3)},  ----------These are The Dig Positions
            {coords = vector3(1837.21, -863.73, 41.94)},  ---------
            {coords = vector3(1826.77, -873.7, 40.94)},   -------
            
        },
    },
    {
        locationblip = vector3(47.2, -627.59, 42.12),  -- This is The Area Position where you have to go to find dig Positions
        blipsprite = 'blip_ambient_secret',
        Mission = {
            {coords = vector3(53.31, -629.0, 41.98)},  ------- Under Flatneck Station At the beach
            {coords = vector3(52.68, -638.43, 41.92)},   ---------
            {coords = vector3(45.06, -642.12, 42.19)},  ----------These are The Dig Positions
            {coords = vector3(37.49, -634.16, 42.12)},  ---------
            {coords = vector3(39.73, -623.03, 42.7)},   -------
            
        },
    },
    {
        locationblip = vector3(-1640.75, 1225.29, 351.6),  -- This is The Area Position where you have to go to find dig Positions
        blipsprite = 'blip_ambient_secret',
        Mission = {
            {coords = vector3(-1642.5, 1240.3, 351.24)},  ------- Camp at Mount hagen
            {coords = vector3(-1640.16, 1231.96, 351.88)},   ---------
            {coords = vector3(-1650.76, 1223.62, 351.39)},  ----------These are The Dig Positions
            {coords = vector3(-1643.31, 1213.58, 351.93)},  ---------
            {coords = vector3(-1631.09, 1208.46, 352.1)},   -------
            
        },
    },
    {
        locationblip = vector3(-1287.65, 2406.75, 305.7),  -- This is The Area Position where you have to go to find dig Positions
        blipsprite = 'blip_ambient_secret',
        Mission = {
            {coords = vector3(-1280.18, 2404.38, 305.14)},  ------- Icy Town near Spider Gorge
            {coords = vector3(-1281.26, 2410.54, 305.37)},   ---------
            {coords = vector3(-1288.18, 2411.58, 305.92)},  ----------These are The Dig Positions
            {coords = vector3(-1288.0, 2400.87, 305.61)},  ---------
            {coords = vector3(-1274.89, 2407.84, 304.96)},   -------
            
        },
    },
    {
        locationblip = vector3(-1094.96, 742.35, 107.18),  -- This is The Area Position where you have to go to find dig Positions
        blipsprite = 'blip_ambient_secret',
        Mission = {
            {coords = vector3(-1094.3, 735.48, 106.18)},  ------- Cattail Pond
            {coords = vector3(-1102.29, 733.04, 107.44)},   ---------
            {coords = vector3(-1111.74, 737.03, 108.29)},  ----------These are The Dig Positions
            {coords = vector3(-1111.27, 747.83, 110.22)},  ---------
            {coords = vector3(-1096.05, 752.43, 109.18)},   -------
            
        },
    },
    {
        locationblip = vector3(-2175.39, -352.92, 188.23),  -- This is The Area Position where you have to go to find dig Positions
        blipsprite = 'blip_ambient_secret',
        Mission = {
            {coords = vector3(-2169.33, -358.5, 187.67)},  ------- Near Strawberry
            {coords = vector3(-2173.89, -365.13, 186.5)},   ---------
            {coords = vector3(-2182.9, -361.27, 187.02)},  ----------These are The Dig Positions
            {coords = vector3(-2179.61, -348.6, 188.11)},  ---------
            {coords = vector3(-2172.17, -344.54, 189.86)},   -------
            
        },
    },
    {
        locationblip = vector3(121.37, 1825.41, 200.04),  -- This is The Area Position where you have to go to find dig Positions
        blipsprite = 'blip_ambient_secret',
        Mission = {
            {coords = vector3(128.36, 1823.78, 200.26)},  ------- Cotorra Springs
            {coords = vector3(132.57, 1815.37, 199.29)},   ---------
            {coords = vector3(124.57, 1813.92, 199.67)},  ----------These are The Dig Positions
            {coords = vector3(116.92, 1820.94, 199.72)},  ---------
            {coords = vector3(118.8, 1832.28, 200.55)},   -------
            
        },
    },
    {
        locationblip = vector3(-770.84, -757.14, 51.84),  -- This is The Area Position where you have to go to find dig Positions
        blipsprite = 'blip_ambient_secret',
        Mission = {
            {coords = vector3(-777.4, -759.3, 52.13)},  ------- Near Riggs Station
            {coords = vector3(-784.64, -754.75, 52.85)},   ---------
            {coords = vector3(-786.23, -745.85, 53.66)},  ----------These are The Dig Positions
            {coords = vector3(-775.29, -737.58, 53.74)},  ---------
            {coords = vector3(-764.46, -738.76, 53.39)},   -------
            
        },
    },
    {
        locationblip = vector3(-1392.38, -2579.83, 77.94),  -- This is The Area Position where you have to go to find dig Positions
        blipsprite = 'blip_ambient_secret',
        Mission = {
            {coords = vector3(-1399.13, -2580.56, 77.83)},  ------- Near Thieves Landing
            {coords = vector3(-1405.53, -2576.6, 77.28)},   ---------
            {coords = vector3(-1401.15, -2566.36, 76.08)},  ----------These are The Dig Positions
            {coords = vector3(-1388.38, -2567.69, 76.75)},  ---------
            {coords = vector3(-1387.26, -2580.08, 77.67)},   -------
            
        },
    },
    {
        locationblip = vector3(-4014.71, -2121.22, -5.58),  -- This is The Area Position where you have to go to find dig Positions
        blipsprite = 'blip_ambient_secret',
        Mission = {
            {coords = vector3(-4020.68, -2117.13, -5.62)},  ------- Twin Rocks
            {coords = vector3(-4017.64, -2106.13, -5.69)},   ---------
            {coords = vector3(-4008.2, -2111.1, -5.64)},  ----------These are The Dig Positions
            {coords = vector3(-4009.87, -2124.22, -5.62)},  ---------
            {coords = vector3(-4024.24, -2127.97, -5.97)},   -------
            
        },
    },
    {
        locationblip = vector3(-2086.38, -1751.57, 131.48),  -- This is The Area Position where you have to go to find dig Positions
        blipsprite = 'blip_ambient_secret',
        Mission = {
            {coords = vector3(-2083.35, -1756.82, 130.81)},  ------- Near Manzanita Post
            {coords = vector3(-2087.7, -1761.75, 131.13)},   ---------
            {coords = vector3(-2093.93, -1754.36, 132.25)},  ----------These are The Dig Positions
            {coords = vector3(-2091.97, -1745.65, 132.19)},  ---------
            {coords = vector3(-2084.66, -1742.59, 131.29)},   -------
            
        },
    },
}



