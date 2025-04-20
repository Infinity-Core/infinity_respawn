game 		 'rdr3'
fx_version 	 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
author 	     'ALTITUDE-DEV.COM'
description  'infinitycore system respawn SYSTEM'
version 	 '1.0.0'
infinitycore_dev 	    'Shepard & iireddev'


ui_page "html/core.html"
files {
    'html/core.html',
    'html/core.js',
	'html/*.webp',
	'html/fonts/*.eot',
	'html/fonts/*.ttf',
	'html/fonts/*.woff',
	'html/fonts/*.woff2',
	'html/vendor/*.css',
    'html/core.css'
}

client_scripts {
	'client.lua'
}

server_scripts {
	'server.lua'
}