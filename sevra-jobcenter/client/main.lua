local ped

local function spawnPed()
    lib.requestModel(Config.PedModel)
    local c = Config.Location

    ped = CreatePed(0, Config.PedModel, c.x, c.y, c.z - 1.0, c.w, false, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
end

local function createBlip()
    if not Config.Blip or not Config.Blip.enabled then return end

    local c = Config.Location
    local blip = AddBlipForCoord(c.x, c.y, c.z)

    SetBlipSprite(blip, Config.Blip.sprite or 407)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, Config.Blip.scale or 0.85)
    SetBlipColour(blip, Config.Blip.color or 5)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(Config.Blip.name or 'Job Center')
    EndTextCommandSetBlipName(blip)
end



local function openMenu()
    local options = {}

    for _, j in ipairs(Config.Jobs) do
        options[#options + 1] = {
            title = j.label,
            description = j.desc,
            icon = 'briefcase',
            onSelect = function()
                TriggerServerEvent('sevra-jobcenter:server:setJob', j.job, j.grade)
            end
        }
    end

    lib.registerContext({
        id = 'sevra_jobcenter_menu',
        title = 'Job Center',
        options = options
    })

    lib.showContext('sevra_jobcenter_menu')
end

CreateThread(function()
    spawnPed()
    createBlip()

    exports.ox_target:addLocalEntity(ped, {
        {
            label = 'Job Center',
            icon = 'fa-solid fa-briefcase',
            onSelect = openMenu
        }
    })
end)


RegisterNetEvent('sevra-jobcenter:client:notify', function(msg, t)
    lib.notify({ title = 'Job Center', description = msg, type = t or 'inform' })
end)

