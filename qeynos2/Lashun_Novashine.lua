-- items: 13073
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Well met, %s. My name is Lashun Novashine and I am a humble priest of Rodcet Nife, the Prime Healer. I wish to spread His word to every corner of Norrath. My job gets more difficult each day with so many so willing to take lives rather than preserve them.",e.other:GetName()));
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 13 or e.wp == 14 or e.wp == 15) then
		e.self:Shout("Cease this endless conflict and seek salvation in the Temple of Life! The glory of Rodcet Nife awaits you!");
	elseif(e.wp == 57) then
		e.self:Say("Greetings, people of Qeynos! Are you lost? Has the chaotic life of an adventurer left you empty and alone? Seek redemption in the glorious light of the Prime Healer. Only through Rodcet Nife and the Temple of Life will you find true health and salvation.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local number_of_bone_chip = 0;

	while item_lib.check_turn_in(e.trade, {item1 = 13073}) do
		e.other:Ding();
		e.self:CastSpell(17,e.other:GetID()); -- Spell: Light Healing
		e.other:Faction(341,2,0); -- Faction: Priests of Life
		e.other:Faction(280,2,0); -- Faction: Knights of Thunder
		e.other:Faction(262,2,0); -- Faction: Guards of Qeynos
		e.other:Faction(221,-2,0); -- Faction: Bloodsabers
		e.other:Faction(219,2,0); -- Faction: Antonius Bayle
		e.other:AddEXP(12);
	end

	item_lib.return_items(e.self, e.other, e.trade)
end
