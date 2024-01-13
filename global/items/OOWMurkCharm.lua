function event_scale_calc(e)
	local Total		= 0;
	local Helm		= tonumber(e.owner:HasItemEquippedByID(72310));
	local Chest		= tonumber(e.owner:HasItemEquippedByID(72312));
	local Arms		= tonumber(e.owner:HasItemEquippedByID(72334));
	local Legs		= tonumber(e.owner:HasItemEquippedByID(72314));
	local Gloves	= tonumber(e.owner:HasItemEquippedByID(72304));
	local Feet		= tonumber(e.owner:HasItemEquippedByID(72306));
	local Wrist		= tonumber(e.owner:HasItemEquippedByID(72332));
	Total		= Helm + Chest + Arms + Legs + Gloves + Feet + Wrist;

	if Total < 0 then
		e.self:SetScale(0);
	elseif Total > 7 then
		e.self:SetScale(7);
	else
		e.self:SetScale(Total/7);
	end
end
