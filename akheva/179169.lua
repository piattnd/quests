function event_combat(e)
	if e.joined then
		e.self:CastSpell(2816, 0); -- Spell: Storm Tremor
		eq.depop();
	end
end
