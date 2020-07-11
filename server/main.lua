--    𝙝𝙩𝙩𝙥𝙨://𝙙𝙞𝙨𝙘𝙤𝙧𝙙.𝙜𝙜/𝘼5𝙀𝙍𝙁𝙌𝙟
--▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
--▌        ~[RO]vRP-Suport         ▐
--▌~Made By Zedu' & Mihnea         ▐
--▌~System Onyx @2019              ▐
--▌~Discord: Zedu'#3780            ▐
--▌~Discord: Mihnea Banditul#4200  ▐
--▌~Script: LapDance               ▐
--▌~Desc: "Stai cuminti manzule"   ▐
--▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀██▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
--               ██
--               ██
--               ██
--               ██
--               ██
--               ██
--               ██

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vRP_LapDance")



RegisterServerEvent('vrp_lapdance:Buy')
AddEventHandler('vrp_lapdance:Buy', function()

    local _source = source
    local user_id = vRP.getUserId({_source})
	
	if(vRP.getMoney({user_id}) >= 1250) then
        vRP.tryPayment({user_id,1250})
	    TriggerClientEvent('vrp_lapdance:lapdance', _source)
        vRPclient.notify(_source,{"~y~[DANCE] ~w~Ai platit pentru un lap dance ~r~[1250 $]"})
	else
        vRPclient.notify(_source,{"~r~Nu ai destui bani. Un dans costa ~r~[1250 $]"})
	end

end)

--notification
function sendNotification(xSource, message, messageType, messageTimeout)
    TriggerClientEvent("pNotify:SendNotification", xSource, {
        text = message,
        type = messageType,
        queue = "lmao",
        timeout = messageTimeout,
        layout = "bottomCenter"
    })
end