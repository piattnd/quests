-- Lurian NPCID: 124013
function event_combat(e)
	if e.joined then
		-- also aggro Hsrek (124014) and #Lord_Vyemm (124017) if they are up
		local entity_list = eq.get_entity_list();
		local add_1	= entity_list:IsMobSpawnedByNpcTypeID(124014);
		local add_2	= entity_list:IsMobSpawnedByNpcTypeID(124017);

		if add_1 then
			entity_list:GetNPCByNPCTypeID(124014):CastToNPC():AddToHateList(e.other, 1);
		end
		
		if add_2 then
			entity_list:GetNPCByNPCTypeID(124017):CastToNPC():AddToHateList(e.other, 1);
		end
	end
end
