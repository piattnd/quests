function event_trade(e)
	local item_lib = require("items");
	if item_lib.check_turn_in(e.trade, {item1 = 18903}) then -- Item: Tattered Cloth Note
		e.self:Say("My brother still lives? Thank you for this news. Please, take this with my deepest thanks.");
		e.other:QuestReward(e.self,{exp = 500});
		e.other:SummonItem(eq.ChooseRandom(2007,2004,2006,2010,2011));
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
