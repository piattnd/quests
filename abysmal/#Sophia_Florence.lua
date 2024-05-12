-- The Fourteen Great Adventurers: http://everquest.allakhazam.com/db/quest.html?quest=2854
-- items: 67615

function event_say(e)
	-- Set Locals
	local greatadventures_dialog_bucket = ("greatadventures_dialog-"..e.other:CharacterID());
	local greatadventures_turnins_bucket = ("greatadventures_turnins-"..e.other:CharacterID());
	local greatadventures_dialog = 0;
	local greatadventures_turnins = 0;

	-- Get Bucket Data
	if eq.get_data(greatadventures_dialog_bucket) ~= "" then
		greatadventures_dialog = tonumber(eq.get_data(greatadventures_dialog_bucket))
	end

	if eq.get_data(greatadventures_turnins_bucket) ~= "" then
		greatadventures_turnins = tonumber(eq.get_data(greatadventures_turnins_bucket))
	end
	
	-- Hail Logic
	if (e.message:findi("hail")) then
		if (bit.band(greatadventures_turnins, 256) ~= 0) then
			e.other:Message(MT.DarkGray, "Sophia Florence says 'Thank you again for what you have done, I will forever be in your debt.'")
		elseif (greatadventures_dialog > 0) then
			e.self:Emote(" focuses her attention on " .. e.other:GetName() .. ".")
			e.other:Message(MT.DarkGray, "Sophia Florence wipes away a tear as she turns to face you. Hello, " .. e.other:GetName() .. ", sorry if I seem somewhat antisocial but it has been many days since I last saw my father Lyndro and as each hour passes the possibility that he may never return becomes more apparent. While I have not given up hope it gets harder each day not to. If he is never to return to me I wish that I had something to remember him by, something that let me know he died just as brave a man as he has always been.")
		end
	end
end

function event_trade(e)
	local item_lib = require("items")

	-- Set Locals
	local greatadventures_turnins_bucket = ("greatadventures_turnins-"..e.other:CharacterID());
	local greatadventures_turnins = 0;

	-- Get Bucket Data
	if eq.get_data(greatadventures_turnins_bucket) ~= "" then
		greatadventures_turnins = tonumber(eq.get_data(greatadventures_turnins_bucket))
	end

	-- Trade Logic
	if (item_lib.check_turn_in(e.self,e.trade, {item1 = 67615})) then -- Lyndro's Writings
		e.self:Emote("takes the dusty tome from " .. e.other:GetName() .. "'s hands.")
		e.self:Emote("eyes open wide as she takes the journal and runs her hands over the front cover. Opening the book to the last page tears begin to roll down her cheeks and land on the parchment. Finishing the last line Sophia looks up to you and says, 'I don't know what to say but thank you. De'van mentioned that he had told someone of my worries and now here you are with the final writings of my father. You are truly a blessing sent by the Gods and I thank you once again, but I must ask that you do the same for the others who are worried about the loved ones that traveled with my father.  If you have already helped everyone please tell De'van that your task is complete and he will reward you.")
		eq.set_data(greatadventures_turnins_bucket, tostring(bit.bor(greatadventures_turnins, 256)));
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	e.self:Emote("smiles and happily exclaims, 'I want to taste my drink!  I want something with flavor.  I'll 'ave a nice dark ale, my dear!'")
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("I think I'll 'ave a malt beer. The sooner the better. I'm parched.");
	elseif(e.signal == 2) then
		e.self:Say("I think I'd like an ale I can sink my teeth into.  Give me something dark, love.");
	end
end
