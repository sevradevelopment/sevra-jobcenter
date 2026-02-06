Framework = {
    name = 'standalone',
    core = nil
}

local function hasRes(name)
    return GetResourceState(name) == 'started' or GetResourceState(name) == 'starting'
end

CreateThread(function()
    -- ESX
    if hasRes('es_extended') then
        local ok, obj = pcall(function()
            return exports['es_extended']:getSharedObject()
        end)
        if ok and obj then
            Framework.name = 'esx'
            Framework.core = obj
            return
        end
    end

    -- QBCore
    if hasRes('qb-core') then
        local ok, obj = pcall(function()
            return exports['qb-core']:GetCoreObject()
        end)
        if ok and obj then
            Framework.name = 'qb'
            Framework.core = obj
            return
        end
    end

    -- fallback
    print('[sevra-jobcenter] Framework detected: Standalone (no ESX/QB found)')
end)

function Framework.SetJob(src, job, grade)
    grade = tonumber(grade) or 0

    if Framework.name == 'esx' then
        local ESX = Framework.core
        local xPlayer = ESX.GetPlayerFromId(src)
        if not xPlayer then return false, 'Player not found.' end
        xPlayer.setJob(job, grade)
        return true, ('Your job is now: %s'):format(job)
    end

    if Framework.name == 'qb' then
        local QBCore = Framework.core
        local Player = QBCore.Functions.GetPlayer(src)
        if not Player then return false, 'Player not found.' end
        Player.Functions.SetJob(job, grade)
        return true, ('Your job is now: %s'):format(job)
    end

    return false, 'No supported framework found (ESX/QB).'
end
