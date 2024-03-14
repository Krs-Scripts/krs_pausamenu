fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'krs_pausemenu'
author 'Karos#7804'
version "1.0.0"

client_scripts {

    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

shared_scripts {
    '@es_extended/imports.lua',
	'@ox_lib/init.lua',
    'shared/*.lua'
}