-- Skyshrine Velious Armor - Warrior
local quest_helper		= require('velious_quest_helper');
local SKYSHRINE_ARMOR	= quest_helper.SKYSHRINE_ARMOR;

local QUEST_ITEMS = {
	quest_helper:melee_helmet(SKYSHRINE_ARMOR.Plate_Helmet,		31182),	-- Items: Crown of the Myrmidon
	quest_helper:melee_chest(SKYSHRINE_ARMOR.Breastplate,		31183),	-- Items: Breastplate of the Myrmidon
	quest_helper:melee_arms(SKYSHRINE_ARMOR.Plate_Vambraces,	31184),	-- Items: Vambraces of the Myrmidon
	quest_helper:melee_bracer(SKYSHRINE_ARMOR.Plate_Bracer,		31185),	-- Items: Bracer of the Myrmidon
	quest_helper:melee_gloves(SKYSHRINE_ARMOR.Plate_Gauntlets,	31186),	-- Items: Gauntlets of the Myrmidon
	quest_helper:melee_legs(SKYSHRINE_ARMOR.Plate_Greaves,		31187),	-- Items: Greaves of the Myrmidon
	quest_helper:melee_boots(SKYSHRINE_ARMOR.Plate_Boots,		31188)	-- Items: Boots of the Myrmidon
};

function event_say(e)
	if e.other:GetFaction(e.self) == 1 then -- Ally
		if e.message:findi("hail") then
			e.self:Say("Greetings to you. I seek the service of a powerful [" .. eq.say_link("i am a warrior",false,"warrior") .. "]. If you are not what I seek leave me be.")
		elseif e.message:findi("i am a warrior") then
			e.self:Say("Excellent. I admire strength and ferocity. [" .. eq.say_link("life is a series of battles",false,"Life is but a series of battles") .. "], is it not?");
		elseif e.message:findi("life is a series of battles") then
			e.self:Say("We share the same view then. I wish to test your skills in battle. Not with me of course, for I will destroy you where you stand. Instead I wish for you to retrieve some trinkets for me and once I have them I will reward you handsomely with a [helm], a [breastplate], [armplates], [bracers], [gauntlets], [greaves], or [boots].");
		elseif e.message:findi("helm") then
			e.self:Say("All I require are an unadorned plate helmet and three pieces of crushed coral. This should be a small task for one such as you. Go now and I shall await your return.");
		elseif e.message:findi("breastplate") then
			e.self:Say("As the resolve of your discipline and strength shall endure through a battle, so shall this breastplate. All I required are an unadorned breastplate, and three flawless diamonds. Do this quickly so that you may return to the field of battle.");
		elseif e.message:findi("armplates") then
			e.self:Say("So, a pair of armplates is what you require? Well, I require unadorned plate vambraces, as well as three flawed emeralds before you may receive them. May your deeds be spread throughout the lands!");
		elseif e.message:findi("bracers") then
			e.self:Say("Bracers for the mighty? Retrieve these components and I shall forge the item for you. Bring me an unadorned plate and three crushed flame emeralds.");
		elseif e.message:findi("gauntlets") then
			e.self:Say("Mighty gauntlets to aid in obliterating your foes, eh? It is no easy task but I shall require a pair of unadorned plate gauntlets and three crushed topaz.");
		elseif e.message:findi("greaves") then
			e.self:Say("Strength and balance are important, are they not? I shall help give you an advantage with these leggings. Gather for me three flawed sea sapphires and a set of unadorned plate greaves.");
		elseif e.message:findi("boots") then
			e.self:Say("A pair of boots you shall have once you have gotten a pair of unadorned plate boots as well as three pieces of crushed black marble.");
		end
	else
		e.self:Say("You must prove your dedication to the Claws of Veeshan before I will speak to you.");
	end
end

function event_trade(e)
	quest_helper:quest_turn_in(e, 1, QUEST_ITEMS, quest_helper.skyshrine_armor_success);
end
