function event_say(e)
	local faction	= e.other:GetFaction(e.self) <= 4
	local skull_cap	= tonumber(e.other:GetBucket("Skull_Cap")) or 0;

	if e.message:findi("Hail") then
		e.self:Emote("bows before you. His eyes are kept wide by the pins which distort his eyelids.");
		e.self:Say("Greetings! You have stumbled upon the cave of the Keepers. We record the arcane secrets of the Brood of Kotiz. We have scribed many spells and make them available to all those who are deserving. Please, have a look.");
	elseif faction and skull_cap >= 5 then
		if e.message:findi("chosen occultist") then
			e.self:Emote("kneels before you abjectly.");
			e.self:Say("Oh, great occultist! I am glad you have arrived, but I do not have the artifacts Kyvix seeks. You will have to seek out the sarnak revenants who still hold the precious stem and base. Get them and take them with your occultist skullcap back to Master Kyvix. Since you are headed in the general direction, I also have an [additional mission], if you do not mind.");
		elseif e.message:findi("additional mission") then
			e.self:Emote("grabs a fist full of scribbled notes and throws them into the air in a rage.");
			e.self:Say("All these notes are useless to me without the first four note pages! While I ventured through the fields of the drixies, I was assaulted by a band of gobs. They were shamans. I heard them calling spirits. They took the first two pages before I escaped. Then I lost the [second two pages] the next day!! Blast!!");
		elseif e.message:findi("second two pages") then
			e.self:Emote("begins to curse. Luckily, you do not understand the language, but you feel a bit of spittle strike your face.");
			e.self:Say("...and then there I was, almost home and the legion expedition leader decided we should explore a bit more near the lake. Then I find myself up against the same type of gobs from the fields. I just ran for the exit an never looked back, but they still managed to swipe pages 3 and 4!!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local faction = e.other:GetFaction(e.self) <= 4

	if item_lib.check_turn_in(e.trade, {item1 = 12854, item2 = 12855, item3 = 12856, item4 = 12857}) then -- Items: An Illegible Note (Notepage 1 Of Rott), (Notepage 2 Of Rott), (Notepage 3 Of Rott) and (Notepage 4 Of Rott)
		e.self:Say("Oh, great necromancer, how can I repay you?!! I know. Here is a spell I recently researched. It should help you increase the strength of a summoned pet. Learn it well.");
		e.other:QuestReward(e.self,{exp = 1000});
		e.other:SummonItem(16426);	-- Item: Intensify Death
		e.other:Faction(443,3);		-- Faction: Brood of Kotiz
		e.other:Faction(441,3);		-- Faction: Legion of Cabilis
	else
		e.self:Say("I am expecting pages one through four. Do I have to go and find them myself?!");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
