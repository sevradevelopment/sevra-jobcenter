fx_version 'cerulean'
game 'gta5'

name 'sevra-jobcenter'
author 'sevra'
version '1.1.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

client_scripts {
    'client/main.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/framework.lua',
    'server/main.lua',
}
