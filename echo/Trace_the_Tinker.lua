function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hi " .. e.other:GetCleanName() .. ", can I interest you in some tinkering supplies?  Some of the most amazing things can be made if you just have the know-how.");

		local is_self_found = e.other:IsSelfFound() >= 1 or e.other:IsSoloOnly() == 1;
		if(is_self_found) then
			e.self:Say("I also have some pre-made [tinkered goods] available if you have the coin.");
		end
	elseif(e.message:findi("tinkered goods")) then
		local is_self_found = e.other:IsSelfFound() >= 1 or e.other:IsSoloOnly() == 1;
		if(is_self_found) then
			e.self:Say("I can part with a [corking device] if you need one. Handy little contraption for the brewers out there.");
		end
	elseif(e.message:findi("corking device")) then
		local is_self_found = e.other:IsSelfFound() >= 1 or e.other:IsSoloOnly() == 1;
		if(is_self_found) then
			e.self:Say("Bring me a Blue Diamond and 100 platinum and I'll put one together for you.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	local is_self_found = e.other:IsSelfFound() >= 1 or e.other:IsSoloOnly() == 1;
	if(is_self_found) then
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 22503, platinum = 100})) then
			e.self:Say("Ah, a fine gem! Let me just... *tink tink tink*... there you go! One corking device, ready to seal whatever you're brewing.");
			e.other:QuestReward(e.self,0,0,0,0,9777);
		end
	end

	item_lib.return_items(e.self, e.other, e.trade);
end
