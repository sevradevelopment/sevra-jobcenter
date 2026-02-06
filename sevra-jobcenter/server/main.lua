local cooldown = {}

local function now()
    return os.time()
end

RegisterNetEvent('sevra-jobcenter:server:setJob', function(job, grade)
    local src = source
    grade = tonumber(grade) or 0

    local last = cooldown[src] or 0
    if (now() - last) < Config.CooldownSeconds then
        TriggerClientEvent('sevra-jobcenter:client:notify', src, 'Please wait a moment...', 'error')
        return
    end

    cooldown[src] = now()

    local ok, msg = Framework.SetJob(src, job, grade)
    if ok then
        TriggerClientEvent('sevra-jobcenter:client:notify', src, msg or 'Job selected!', 'success')
    else
        TriggerClientEvent('sevra-jobcenter:client:notify', src, msg or 'Failed to set job.', 'error')
    end
end)

AddEventHandler('playerDropped', function()
    cooldown[source] = nil
end)
