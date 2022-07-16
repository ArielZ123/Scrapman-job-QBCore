local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('scrapjob:scrap:find')
AddEventHandler('scrapjob:scrap:find', function()
   local _source = source
   local xPlayer = QBCore.Functions.GetPlayer(source)
   xPlayer.Functions.AddItem('scrap', 1)
end)

RegisterServerEvent('scrapjob:scrap:sell')
AddEventHandler('scrapjob:scrap:sell', function()
   local _source = source
   local xPlayer = QBCore.Functions.GetPlayer(source)
   local scrapQuantity = xPlayer.Functions.GetItemByName('scrap')
   local addmoney = math.random(250, 500) -- change here the price of the scrap sell
   if type(scrapQuantity) == 'table' then 
      scrapQuantity = true 
   elseif scrapQuantity == nil then  
      scrapQuantity = false 
   end
   if item == (nil or false) then
      scrapQuantity = 0
   elseif scrapQuantity == true then
      scrapQuantity = 1 
   end
   if scrapQuantity >= 1 then
      xPlayer.Functions.RemoveItem('scrap', 1)
      xPlayer.Functions.AddMoney('cash', addmoney)
      TriggerClientEvent("pNotify:SendNotification", source, {
         text = "you sold a scrap type for <b style=color:#1588d4>"  .. addmoney .. " <b style=color:#d1d1d1> keep working</b>",
         type = "success",
         queue = "lmao",
         timeout = 7000,
         layout = "Centerleft"
      })
   elseif scrapQuantity then
      TriggerClientEvent("pNotify:SendNotification", source, {
         text = "you dont have any scrap type",
         type = "success",
         queue = "lmao",
         timeout = 7000,
         layout = "Centerleft"
      })
   end
end)