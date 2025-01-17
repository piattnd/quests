-- Thurg Velious Armor - Warrior
local quest_helper	= require('velious_quest_helper');
local THURG_ARMOR	= quest_helper.THURG_ARMOR;

local QUEST_TEXT = {
	hail		= "Well met, -race! I am Captain Njall, commander of the city gaurds here in Thurgadin. If ye seek ta join our ranks, I welcome ye with open arms and have an offer to make if you are [interested]. If ye seek to be our enemy, I hope ye can run swifter than my archers arrows.",
	interested	= "Aye, I thought ye might be. My elite warriors are in sore need of some enchanted armor. Unfortunately, I can't spare the men to go out and fetch me the components. If you can do this for me, I'll gladly reward you with a piece of it. I need materials for a [helm], a [breastplate], [armplates], [bracers], [gauntlets], [greaves], and [boots].",
};

QUEST_TEXT = quest_helper.merge_tables(QUEST_TEXT, quest_helper.THURG_PLATE_TEXT);

local QUEST_ITEMS = {
	quest_helper:melee_boots(THURG_ARMOR.Plate_Boots,		31090),	-- Items: Champion's Boots
	quest_helper:melee_legs(THURG_ARMOR.Plate_Greaves,		31089),	-- Items: Champion's Greaves
	quest_helper:melee_gloves(THURG_ARMOR.Plate_Gauntlets,	31088),	-- Items: Champion's Gauntlets
	quest_helper:melee_bracer(THURG_ARMOR.Plate_Bracer,		31087),	-- Items: Champion's Bracer
	quest_helper:melee_arms(THURG_ARMOR.Plate_Vambraces,	31086),	-- Items: Champion's Vambraces
	quest_helper:melee_chest(THURG_ARMOR.Plate_Breastplate,	31085),	-- Items: Champion's Breastplate
	quest_helper:melee_helmet(THURG_ARMOR.Plate_Helmet,		31084)	-- Items: Champion's Crown
};

function event_say(e)
	quest_helper.quest_text(e, QUEST_TEXT, 3);
end

function event_trade(e)
	quest_helper:quest_turn_in(e, 3, QUEST_ITEMS, quest_helper.thurg_armor_success);
end
