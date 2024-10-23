dofile_once("data/scripts/lib/utilities.lua")

-- all functions below are optional and can be left out

--[[

function OnModPreInit()
	print("Mod - OnModPreInit()") -- First this is called for all mods
end

function OnModInit()
	print("Mod - OnModInit()") -- After that this is called for all mods
end

function OnModPostInit()
	print("Mod - OnModPostInit()") -- Then this is called for all mods
end

function OnPlayerSpawned( player_entity ) -- This runs when player entity has been created
	GamePrint( "OnPlayerSpawned() - Player entity id: " .. tostring(player_entity) )
end

function OnWorldInitialized() -- This is called once the game world is initialized. Doesn't ensure any world chunks actually exist. Use OnPlayerSpawned to ensure the chunks around player have been loaded or created.
	GamePrint( "OnWorldInitialized() " .. tostring(GameGetFrameNum()) )
end

function OnWorldPreUpdate() -- This is called every time the game is about to start updating the world
	GamePrint( "Pre-update hook " .. tostring(GameGetFrameNum()) )
end

function OnWorldPostUpdate() -- This is called every time the game has finished updating the world
	GamePrint( "Post-update hook " .. tostring(GameGetFrameNum()) )
end

function OnMagicNumbersAndWorldSeedInitialized() -- this is the last point where the Mod* API is available. after this materials.xml will be loaded.
	local x = ProceduralRandom(0,0)
	print( "===================================== random " .. tostring(x) )
end

]]
--


ModTextFileSetContent("data/scripts/items/potion_aggressive.lua",	ModTextFileGetContent("mods/noita.fairmod/files/content/chemical_horror/potion_aggressive_lib.lua"))
ModLuaFileAppend("data/scripts/items/potion_aggressive.lua", "mods/noita.fairmod/files/content/chemical_horror/potion_aggressive_append.lua")


local translations = ModTextFileGetContent("data/translations/common.csv")
local new_translations = ModTextFileGetContent("mods/noita.fairmod/files/content/chemical_horror/chemical_horror.csv")
translations = translations .. "\n" .. new_translations .. "\n"
translations = translations:gsub("\r", ""):gsub("\n\n+", "\n")
ModTextFileSetContent("data/translations/common.csv", translations)



ModLuaFileAppend("data/scripts/status_effects/status_list.lua", "mods/noita.fairmod/files/content/chemical_horror/status_effects.lua")
ModMaterialsFileAdd("mods/noita.fairmod/files/content/chemical_horror/materials.xml")

--print("Example mod init done")
