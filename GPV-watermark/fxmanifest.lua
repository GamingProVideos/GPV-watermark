fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'

author 'Gamingprovids'
description 'Simple Watermarker  resource'
version '1.0.0'

escrow_ignore {
	'config.lua'
}

client_scripts {
	'config.lua',
	'wl_client/client.lua',
}
 
server_scripts {
    'config.lua',
    'wl_server/server.lua',
}