local QBCore = exports['qb-core']:GetCoreObject()

-- Define vehicle categories and models
local vehicleCategories = {
    ["Acura"] = {
        { name = "Acura TL Type-S", model = "tltypes" },
    },
    ["Aston Martin"] = {
        { name = "Aston Martin DBX Carbon Edition", model = "amdbx" },
        { name = "2013 Aston Martin Vanquish", model = "ast" },
    },
    ["Audi"] = {
        { name = "1995 Audi Cabriolet (RS2) (B4)", model = "80B4" },
        { name = "1983 Audi Quattro Sport", model = "audquattros" },
        { name = "2017 Audi A4 Quattro ABT", model = "aaq4" },
        { name = "2020 Audi Q8 50TDI", model = "q820" },
        { name = "2013 Audi R8 V10", model = "r8ppi" },
        { name = "2020 Audi R8", model = "r820" },
        { name = "2016 Audi RS6 C7", model = "rs6" },
        { name = "2020 Audi RS7", model = "rs72020" },
        { name = "1998 Audi S8 (D2/PFL)", model = "s8d2" },
        { name = "2016 Audi SQ7", model = "sq72016" },
        { name = "2010 Audi TT RS", model = "ttrs" },
    },
    ["Bentley"] = {
        { name = "Bentley Bentayga", model = "bbentayga" },
        { name = "2020 Bentley Continental GT Convertible", model = "cgts" },
    },
    ["BMW"] = {
        { name = "2004 BMW 760Li Individual (E66/PFL)", model = "760li04" },
        { name = "1995 BMW M5 E34", model = "e34" },
        { name = "2016 BMW M2", model = "m2" },
        { name = "1997 BMW M3 E36", model = "m3e36" },
        { name = "2008 BMW M3 e92", model = "m3e92" },
        { name = "2015 BMW M3 (F80)", model = "m3f80" },
        { name = "2015 BMW M4 F82", model = "m4f82" },
        { name = "BMW M6 F13 Shadow Line", model = "m6f13" },
        { name = "2019 BMW Z4 M40i", model = "z419" },
    },
    ["Bugatti"] = {
        { name = "2020 Bugatti Bolide", model = "bolide" },
    },
    ["Cadillac"] = {
        { name = "2016 Cadillac ATS-V Coupe", model = "cats" },
        { name = "2021 Cadillac Escalade", model = "cesc21" },
    },
    ["Chevrolet"] = {
        { name = "2009 Chevrolet Tahoe", model = "09tahoe" },
        { name = "2015 Chevrolet Tahoe", model = "15tahoe" },
        { name = "2020 Chevrolet Camaro SS", model = "2020ss" },
        { name = "2017 Chevrolet Camaro RS", model = "camrs17" },
        { name = "2021 Chevrolet Tahoe RST", model = "tahoe21" },
    },
    ["Corvette"] = {
        { name = "Chevrolet Corvette C5 Z06", model = "corvettec5z06" },
        { name = "2009 Chevrolet Corvette ZR1", model = "czr1" },
        { name = "2014 Chevrolet Corvette C7 Stingray", model = "c7" },
        { name = "2020 Chevrolet Corvette C8 Stingray", model = "stingray" },
    },
    ["Dodge"] = {
        { name = "2016 Dodge Charger", model = "16charger" },
        { name = "1999 Dodge Viper GTS ACR", model = "99viper" },
        { name = "Dodge Charger Hellcat Widebody 2021", model = "chr20" },
        { name = "2018 Dodge Challenger SRT Demon", model = "demon" },
        { name = "Dodge Challenger Raid", model = "raid" },
        { name = "2015 Dodge RAM 2500", model = "ram2500" },
        { name = "Dodge Neon SRT-4", model = "srt4" },
        { name = "2017 Dodge RAM 1500 Rebel TRX", model = "trx" },
        { name = "2016 Dodge Challenger", model = "16challenger" },
    },
    ["Ferrari"] = {
        { name = "Ferrari 488 Spider", model = "488" },
        { name = "Ferrari F430 Scuderia", model = "f430s" },
        { name = "2018 Ferrari 812 Superfast", model = "f812" },
        { name = "2015 Ferrari California T", model = "fct" },
        { name = "Ferrari FXX-K Hybrid Hypercar", model = "fxxk" },
        { name = "2015 Ferrari LaFerrari", model = "laferrari" },
        { name = "Ferrari Enzo", model = "mig" },
        { name = "458 Italia", model = "yFe458i1" },
        { name = "458 Speciale", model = "yFe458i2" },
        { name = "458 Spider", model = "yFe458s1" },
        { name = "458 Speciale Aperta", model = "yFe458s2" },
        { name = "Ferrari F60 America", model = "yFeF12A" },
        { name = "Ferrari F12 TRS Roadster", model = "yFeF12T" },
    },
    ["Ford"] = {
        { name = "1978 Ford F150 XLT Ranger", model = "f15078" },
        { name = "2012 Ford F150 SVT Raptor R", model = "f150" },
        { name = "2005 Ford GT", model = "fgt" },
        { name = "2017 Ford GT", model = "gt17" },
        { name = "2015 Ford Mustang GT 50 Years Special Edition", model = "mustang50th" },
        { name = "2017 Ford Raptor", model = "raptor2017" },
        { name = "2021 Ford Bronco Wildtrak", model = "wildtrak" },
    },
    ["Honda"] = {
        { name = "Honda CRX SiR 1991", model = "honcrx91" },
        { name = "1992 Honda NSX-R (NA1)", model = "na1" },
        { name = "Honda S2000 AP2", model = "ap2" },
        { name = "1997 Honda Civic Sedan Drag Version", model = "dragekcivick" },
        { name = "2018 Honda Civic Type-R (FK8)", model = "fk8" },
    },
    ["Italdesign"] = {
        { name = "2017 Italdesign Zerouno", model = "it18" },
    },
    ["Jaguar"] = {
        { name = "Jaguar F-pace 2017 Hamann Edition", model = "fpacehm" },
    },
    ["Jeep"] = {
        { name = "2012 Jeep Wrangler", model = "jeep2012" },
        { name = "Jeep Renegade", model = "jeepreneg" },
        { name = "2015 Jeep SRT-8", model = "srt8" },
        { name = "2018 Jeep Grand Cherokee Trackhawk Series IV", model = "trhawk" },
    },
    ["Koenigsegg"] = {
        { name = "2017 Koenigsegg Agera RS", model = "agerars" },
        { name = "Koenigsegg Regera", model = "regera" },
    },
    ["Lamborghini"] = {
        { name = "Lamborghini Huracan Super Trofeo", model = "huracanst" },
        { name = "Lamborghini Sesto Elemento", model = "lambose" },
        { name = "2009 Lamborghini Murcielago LP 670-4 SV", model = "lp670sv" },
        { name = "2013 Lamborghini Aventador LP700-4 Roadster", model = "lp700r" },
        { name = "Lamborghini Aventador SVJ", model = "svj63" },
        { name = "Lamborghini Urus", model = "urus" },
        { name = "2013 Lamborghini Veneno LP750-4", model = "veneno" },
    },
    ["Lexus"] = {
        { name = "Lexus GS 350", model = "gs350" },
        { name = "2014 Lexus IS 350", model = "is350mod" },
        { name = "2015 Lexus RCF", model = "rcf" },
    },
    ["Land Rover"] = {
        { name = "1973 Land Rover Range Rover", model = "lrrr" },
    },
    ["Lotus"] = {
        { name = "2002 Lotus Esprit V8", model = "esprit02" },
    },
    ["Lucis"] = {
        { name = "Quartz Regalia 723", model = "regalia" },
    },
    ["Maserati"] = {
        { name = "Maserati Levante", model = "levante" },
    },
    ["Mazda"] = {
        { name = "1984 Mazda RX-7 Stanced Version", model = "84rx7k" },
        { name = "2002 Mazda RX-7 FD Drag", model = "dragfd" },
        { name = "Mazda RX7 FC3S", model = "fc3s" },
        { name = "Mazda RX-7 FD", model = "majfd" },
        { name = "1989 Mazda Miata NA", model = "miata3" },
        { name = "Mazda MX-5 Miata (NA6C)", model = "na6" },
    },
    ["McLaren"] = {
        { name = "McLaren 650S Coupe", model = "650s" },
        { name = "2016 McLaren 675LT Coupe", model = "675lt" },
        { name = "2017 McLaren 720S", model = "720s" },
        { name = "1996 McLaren F1 GTR", model = "gtr96" },
        { name = "2020 McLaren Speedtail", model = "mcst" },
        { name = "McLaren MP4-12C", model = "mp412c" },
        { name = "2019 McLaren Senna", model = "senna" },
    },
    ["Mercedes"] = {
        { name = "2020 Mercedes-Benz AMG GT-R Roadster", model = "amggtrr20" },
        { name = "2020 Mercedes-AMG C63s", model = "c6320" },
        { name = "2013 Mercedes-Benz G65 AMG", model = "G65" },
        { name = "2019 Mercedes-Benz E400 Coupe 4matic (C238)", model = "e400" },
        { name = "Mercedes-Benz GL63 AMG", model = "gl63" },
        { name = "2012 Mercedes-Benz C63 AMG Coupe Black Series", model = "mbc63" },
        { name = "2014 Mercedes-Benz S500 W222", model = "s500w222" },
        { name = "1995 Mercedes-Benz SL500", model = "sl500" },
        { name = "Mercedes-Benz V-class 250 Bluetec LWB", model = "v250" },
    },
    ["Mitsubishi"] = {
        { name = "Mitsubishi Lancer Evo VI T.M.E (CP9A)", model = "cp9a" },
        { name = "Mitsubishi FTO GP Version-R", model = "fto" },
    },
    ["Nissan"] = {
        { name = "Nissan 180SX Type-X", model = "180sx" },
        { name = "2017 Nissan GTR", model = "gtr" },
        { name = "2017 R35 Nissan GTR Convertible", model = "gtrc" },
        { name = "Nissan Fairlady Z Z33", model = "maj350" },
        { name = "Nissan Silvia S15 Spec-R", model = "nis15" },
        { name = "2017 Nissan Titan Warrior", model = "nissantitan17" },
        { name = "Nissan 350z Stardast", model = "ns350" },
        { name = "Nissan 370z \"Pandem\"", model = "nzp" },
        { name = "1998 Nissan Silvia K", model = "s14" },
        { name = "1997 Nissan Patrol Super Safari Y60", model = "Safari97" },
        { name = "Nissan Skyline GT-R (BNR34)", model = "skyline" },
        { name = "Nissan 300ZX Z32", model = "z32" },
    },
    ["Porsche"] = {
        { name = "1978 Porsche 935 Moby Dick", model = "maj935" },
        { name = "2018 Porsche Cayenne S", model = "pcs18" },
        { name = "Porsche 718 Cayman S", model = "718caymans" },
        { name = "2003 Porsche Carrera GT (980)", model = "cgt" },
        { name = "2019 Porsche Macan Turbo", model = "pm19" },
        { name = "2020 Porsche Taycan Turbo S", model = "taycan" },
    },
    ["Range Rover"] = {
        { name = "Range Rover Evoque", model = "rrevoque" },
        { name = "Range Rover Vogue Startech", model = "rrst" },
        { name = "2016 Range Rover Sport SVR", model = "rsvr16" },
    },
    ["Rolls-Royce"] = {
        { name = "2016 Rolls-Royce Dawn Onyx", model = "dawnonyx" },
        { name = "Rolls-Royce Wraith", model = "wraith" },
        { name = "Rolls Royce Cullinan", model = "rculi" },
        { name = "2018 Rolls-Royce Phantom VIII", model = "rrphantom" },
    },
    ["Subaru"] = {
        { name = "2008 Subaru WRX STi", model = "subisti08" },
        { name = "2004 Subaru Impreza WRX STI", model = "subwrx" },
        { name = "1996 Subaru Alcyone SVX", model = "svx" },
    },
    ["Suzuki"] = {
        { name = "2019 Suzuki GSX-R1000R", model = "gsxr19" },
        { name = "2019 Suzuki Katana", model = "katana" },
    },
    ["Tesla"] = {
        { name = "2020 Tesla Roadster", model = "tr22" },
        { name = "Tesla Model X Unplugged Performance", model = "p90d" },
        { name = "2016 Tesla Model S P90D", model = "models" },
        { name = "2018 Tesla Model 3", model = "tmodel" },
        { name = "2016 Tesla Model X P90D", model = "teslax" },
        { name = "2017 Tesla Model S Prior design", model = "teslapd" },
    },
    ["Toyota"] = {
        { name = "2018 Toyota Camry XSE", model = "cam8tun" },
        { name = "2016 Toyota Land Cruiser VXR", model = "vxr" },
        { name = "1998 Toyota Supra Turbo (A80)", model = "toysupmk4" },
        { name = "Toyota Mark II JZX100", model = "mk2100" },
    },
    ["Volkswagen"] = {
        { name = "2015 Volkswagen Golf GTI MK7", model = "golfgti7" },

    },
}

-- Command to open the car menu
RegisterCommand("carmenu", function()
    local menu = {}

    for category, vehicles in pairs(vehicleCategories) do
        table.insert(menu, {
            header = category,
            txt = "View vehicles",
            params = {
                event = "qb-carmenu:openCategory",
                args = { category = category }
            }
        })
    end

    TriggerEvent('qb-menu:client:openMenu', menu)
end)

-- Open a category to list its vehicles
RegisterNetEvent('qb-carmenu:openCategory', function(data)
    local category = data.category
    local vehicles = vehicleCategories[category]
    local menu = {}

    table.insert(menu, {
        header = "Back to Categories",
        txt = "",
        params = {
            event = "carmenu"
        }
    })

    for _, vehicle in pairs(vehicles) do
        table.insert(menu, {
            header = vehicle.name,
            txt = "Spawn this vehicle for free",
            params = {
                event = "qb-carmenu:spawnVehicle",
                args = { model = vehicle.model }
            }
        })
    end

    TriggerEvent('qb-menu:client:openMenu', menu)
end)

-- Spawn the vehicle
RegisterNetEvent('qb-carmenu:spawnVehicle', function(data)
    local playerPed = PlayerPedId()
    local currentVehicle = GetVehiclePedIsIn(playerPed, false)

    -- Delete current vehicle if the player is inside one
    if currentVehicle ~= 0 then
        DeleteEntity(currentVehicle)
    end

    -- Spawn the new vehicle
    local vehicleModel = GetHashKey(data.model)
    RequestModel(vehicleModel)

    while not HasModelLoaded(vehicleModel) do
        Wait(0)
    end

    local coords = GetEntityCoords(playerPed)
    local heading = GetEntityHeading(playerPed)
    local newVehicle = CreateVehicle(vehicleModel, coords.x + 5, coords.y, coords.z, heading, true, false)

    -- Warp the player into the vehicle and give keys
    TaskWarpPedIntoVehicle(playerPed, newVehicle, -1)
    TriggerEvent('vehiclekeys:client:SetOwner', GetVehicleNumberPlateText(newVehicle))
    SetModelAsNoLongerNeeded(vehicleModel)

    QBCore.Functions.Notify("Your vehicle has been spawned!", "success")
end)
