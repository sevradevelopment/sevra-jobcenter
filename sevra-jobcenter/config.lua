Config = {}

Config.Location = vec4(-267.9274, -957.9307, 31.2232, 193.7685)
Config.PedModel = `a_m_m_business_01`
Config.CooldownSeconds = 5

-- Works for ESX + QB (job names must exist in your framework)
Config.Jobs = {
    { label = 'Unemployed', job = 'unemployed', grade = 0, desc = 'Default job.' },
    { label = 'Taxi Driver', job = 'taxi', grade = 0, desc = 'Drive people around.' },
    { label = 'Trucker', job = 'trucker', grade = 0, desc = 'Deliver cargo.' },
    { label = 'Garbage', job = 'garbage', grade = 0, desc = 'Keep the city clean.' },
}


Config.Blip = {
    enabled = true,
    sprite = 407,      
    color = 5,         
    scale = 0.85,
    name = 'Job Center'
}