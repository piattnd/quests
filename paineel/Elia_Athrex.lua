function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Hello.  Do you need something or did you merely wish to grace me with your oh-so-delightfully perfumed breath?");
	end
end

function event_trade(e)
	local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end
