-- Kael Velious Armor - Cleric
local quest_helper	= require('velious_quest_helper');
local KAEL_ARMOR	= quest_helper.KAEL_ARMOR;

local QUEST_ITEMS = {
	quest_helper:priest_helmet(KAEL_ARMOR.Plate_Helmet,		25391),	-- Item: Templar's Crown
	quest_helper:priest_chest(KAEL_ARMOR.Breastplate,		25392),	-- Item: Templar's Chestplate
	quest_helper:priest_arms(KAEL_ARMOR.Plate_Vambraces,	25393),	-- Item: Templar's Vambraces
	quest_helper:priest_bracer(KAEL_ARMOR.Plate_Bracer,		25394),	-- Item: Templar's Bracer
	quest_helper:priest_gloves(KAEL_ARMOR.Plate_Gauntlets,	25395),	-- Item: Templar's Gauntlets
	quest_helper:priest_legs(KAEL_ARMOR.Plate_Greaves,		25396),	-- Item: Templar's Leggings
	quest_helper:priest_boots(KAEL_ARMOR.Plate_Boots,		25397)	-- Item: Templar's Boots
};

function event_say(e)
	if e.other:GetFaction(e.self) == 1 then -- Ally
		if e.message:findi("hail") then
			e.self:Emote(" bows.");
			e.self:Say("Greetings to you. You are far away from your homelands, stranger. I am looking for someone. Someone that the outlanders call a [cleric]. Are you a cleric?");
		elseif e.message:findi("cleric") then
			e.self:Say("Ahhh... most pious one. I sense the aura of your devotion and conviction and it is strong about you. A shame you are so short lived, mortal. But I see potential in you and for that I shall aid you in your calling. Do you [" .. eq.say_link("i wish your aid",false,"wish my aid") .. "]?");
		elseif e.message:findi("i wish your aid") then
			e.self:Say("Then I have a set of goals for you. Once you have achieved them, you shall be rewarded with such as these; a [helm], a [breastplate], [armplates], [bracers], [gauntlets], [greaves] and [boots]. May they protect you from your enemies.");
		elseif e.message:findi("helm") then
			e.self:Say("I shall craft a helm for you but you must seek these items out for me first. I have need of an ancient tarnished plate helmet and three crushed onyx sapphires.");
		elseif e.message:findi("breastplate") then
			e.self:Say("Such as your faith protects you so shall this breastplate. I must have an ancient tarnished breastplate and three pieces of black marble.");
		elseif e.message:findi("armplates") then
			e.self:Say("For the armplates, I shall require a pair of an ancient tarnished plate armplates as well as three jaundice gems. Go forth and seek these out.");
		elseif e.message:findi("bracers") then
			e.self:Say("For the bracers, faithful one, I shall require the acquisition of an ancient tarnished plate bracer and three crushed opals.");
		elseif e.message:findi("gauntlets") then
			e.self:Say("I will need a pair of a ancient tarnished gauntlets three crushed lava rubys, so that I may make your reward.");
		elseif e.message:findi("greaves") then
			e.self:Say("You shall acquire a pair of an ancient tarnished plate greaves and three chipped onyx sapphires for me. I await your return.");
		elseif e.message:findi("boots") then
			e.self:Say("With your aid I shall make a pair of fine boots for you. All that is needed is a pair of an ancient tarnished plate boots and a trilogy of crushed flame emeralds.");
		end
	else
		e.self:Say("You must prove your dedication to Kael Drakkal and the Kromzek clan before I will speak to you.");
	end
end

function event_trade(e)
	quest_helper:quest_turn_in(e, 1, QUEST_ITEMS, quest_helper.kael_armor_success);
end
