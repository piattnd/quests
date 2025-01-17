-- Skyshrine Velious Armor - Beastlord
local quest_helper		= require('velious_quest_helper');
local SKYSHRINE_ARMOR	= quest_helper.SKYSHRINE_ARMOR;

local QUEST_ITEMS = {
	quest_helper:melee_helmet(SKYSHRINE_ARMOR.Leather_Cap,		5446),	-- Items: Savage Helm
	quest_helper:melee_chest(SKYSHRINE_ARMOR.Leather_Tunic,		5447),	-- Items: Savage Chestguard
	quest_helper:melee_arms(SKYSHRINE_ARMOR.Leather_Sleeves,	5448),	-- Items: Savage Armband
	quest_helper:melee_bracer(SKYSHRINE_ARMOR.Leather_Bracelet,	5449),	-- Items: Savage Bracer
	quest_helper:melee_gloves(SKYSHRINE_ARMOR.Leather_Gloves,	5450),	-- Items: Savage Gloves
	quest_helper:melee_legs(SKYSHRINE_ARMOR.Leather_Leggings,	5451),	-- Items: Savage Leggings
	quest_helper:melee_boots(SKYSHRINE_ARMOR.Leather_Boots,		5452)	-- Items: Savage Boots
};

function event_say(e)
	if e.other:GetFaction(e.self) == 1 then -- Ally
		if e.message:findi("hail") then
			e.self:Say("Greetings, I am looking for one who is one with the wild beasts of the world. Do you call yourself a [" .. eq.say_link("i am a Beastlord",false,"Beastlord") .. "]?");
		elseif e.message:findi("i am a Beastlord") then
			e.self:Say("I have been waiting for one such as you to arrive. I have some equipment that is worthy of a great Beastlord. I have a [cap], [leggings], [tunic], [bracer], [boots], [sleeves], and [gloves] if you think you are worthy.");
		elseif e.message:findi("cap") then
			e.self:Say("I shall weave one of exceptional quality for you but you must gather the items first. I require an unadorned leather cap and three pieces of crushed coral.");
		elseif e.message:findi("tunic") then
			e.self:Say("You shall be an imposing force with this tunic. Solid as the unmoving mountains, it shall protect you. Once I have gained a set of three flawless diamonds and an unadorned leather tunic.");
		elseif e.message:findi("sleeves") then
			e.self:Say("As the mighty stone that parts the flow of water, so shall these sleeves divert harm against you. Bring me a pair of unadorned leather sleeves and three flawed emeralds.");
		elseif e.message:findi("bracer") then
			e.self:Say("For a bracer I shall require three crushed flame emeralds and an unadorned leather bracelet. Bring me these items and the reward shall be yours to keep.");
		elseif e.message:findi("gloves") then
			e.self:Say("Your hands are like the wind, everflowing and moving. Subtle one moment, then a howling wind raining blow upon blow to your foes. These gloves shall aid you. In order for me to complete them, I require a pair of unadorned leather gloves and three crushed topaz.");
		elseif e.message:findi("leggings") then
			e.self:Say("The leggings shall protect you, as the valley shelters the still pool within it from the howling winds. Furnish a pair of unadorned leather leggings and three flawed sea sapphires.");
		elseif e.message:findi("boots") then
			e.self:Say("Your feet are as hard as any stone and as swift as a coiled serpent but even the swiftest feet require protection so I shall provide you with these. They should help. Acquire a pair of unadorned leather boots and three crushed pieces of black marble.");
		end
	else
		e.self:Say("You must prove your dedication to the Claws of Veeshan before I will speak to you.");
	end
end

function event_trade(e)
	quest_helper:quest_turn_in(e, 1, QUEST_ITEMS, quest_helper.skyshrine_armor_success);
end
