-- My Discord: Txkeshi#1512
-- My github: https://github.com/txkeshi
-- RUSSIAN ENGLISH DEVELOPER

local cheat_buttons =  {
    [KEY_INSERT] = true,
    [KEY_DELETE] = true,
}
hook.Add('PlayerButtonDown', 'CheatsButtons', function(ply, button)
    if cheat_buttons[button] then
        if game.SinglePlayer() then
            ply:ConCommand('disconnect')
        else
            ply:Kick('Cheats are not allowed on this server.')
        end
    end
end)
--------------------------------------------------------------------- TXKESHI DEVELOPERS - TWO AC ----------------------------------------------------------------------------------------------------------------

-- Detect gg -- 

concommand.Remove('defqon')
concommand.Remove('R8_MENU')
concommand.Remove('eternal')
concommand.Remove('LokiMenu')
concommand.Remove('LokiExploit')
concommand.Remove('Exploit')

-- ANTI PROP SPAM -- 

local isadmin = {
  ['admin'] = true, ['superadmin'] = true, ['founder'] = true
}

hook.Add("PlayerSpawnedProp", "AntiPropSpam", function(ply,_,ent)
    ent:AddCallback("PhysicsCollide", function(ent,data)

        if(data.HitEntity:IsWorld() and !ent:IsWorld()) then
            ent.CollideCount = ent.CollideCount or 0
            ent.CollideCount = ent.CollideCount + 1

            if(ent.CollideCount > 65) then
                ent:Remove()
                if(ply.LastPropCrash == nil or ply.LastPropCrash < CurTime()) then
                  for i,v in ipairs( player.GetAll() ) do
                      if isadmin[ v:GetUserGroup() ] then
                        v:ChatPrint( v, ply .. ' perhaps I tried to put the server with the help of a prop! Keep an eye on him!' )
                      end
                  end
                end
                ply.LastPropCrash = CurTime() + 6
            end

        end

    end)
    for k,v in pairs(ents.FindInSphere(ent:GetPos(), ent:BoundingRadius())) do

        if(v:IsPlayer()) then
            ent:Remove()

            if(ply.LastPlayerInProp == nil or ply.LastPlayerInProp < CurTime()) then
                for i,v in ipairs( player.GetAll() ) do
                      if isadmin[ v:GetUserGroup() ] then
                        v:ChatPrint( v, ply .. ' I tried to sleep prop in the player' )
                      end
                 end
            end
            ply.LastPlayerInProp = CurTime() + 6

        end

    end
end)
--------------------------------------------------------------- TWO AC - DEVELOPER TXKESHI -----------------------------------------------------------------------------------------------------------------------------------