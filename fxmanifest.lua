fx_version "adamant"
game "gta5"
lua54 'yes'

client_scripts {
    'callbacks/client.lua',
    'client/client.lua'
}

server_scripts {
    'callbacks/server.lua',
    'server/server.lua'
}

shared_scripts {
    "functions.lua",
	"config.lua"
}

escrow_ignore {
	'callbacks/*',
	'config.lua'
}