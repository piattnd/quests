function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("The Dark Truth reports the news without all the usual propaganda and lies spewed by the mouthpieces of other Kingdoms and principalities. Buy a copy today for just a few silver and find out the real truth behind current events.");
	end
end

function event_trade(e)
	local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end
