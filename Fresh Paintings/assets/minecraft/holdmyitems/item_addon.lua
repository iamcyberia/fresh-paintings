-- Cyber was here :3

local l = context.bl and 1 or -1
local matrices = context.matrices
local item = context.item

-- Painting
if (
	I:isOf(item, Items:get("minecraft:painting"))
) then
	M:moveY(matrices, 0.075)
	M:moveX(matrices, 0.1 * l)
	M:moveZ(matrices, 0)
	
	M:rotateX(matrices, 0)
	M:rotateY(matrices, 0 * l)
	M:rotateZ(matrices, 0 * l)
end

-- Item Frame
if (
	I:isOf(item, Items:get("minecraft:item_frame"))
) then
	M:moveY(matrices, 0.075)
	M:moveX(matrices, 0.1 * l)
	M:moveZ(matrices, 0)
	
	M:rotateX(matrices, 0)
	M:rotateY(matrices, 0 * l)
	M:rotateZ(matrices, 0 * l)
end

--Glowing Item Frame 
if (
	I:isOf(item, Items:get("minecraft:glow_item_frame"))
) then
	M:moveY(matrices, -0.025)
	M:moveX(matrices, 0 * l)
	M:moveZ(matrices, -0.025)
	
	M:rotateX(matrices, -10)
	M:rotateY(matrices, 0 * l)
	M:rotateZ(matrices, 0 * l)

	particleManager:addParticle(
        context.particles, 
        false, 
        0.1 * l, 
        0.1, 
        0, 
        0, 
        0, 
        0, 
        0, 
        0, 
        0, 
        0, 
        0, 
        0, 
        1.75, 
        Texture:of("minecraft", "textures/particle/glow_item_frame_glow.png"), 
        "ITEM", 
        context.hand, 
        "SPAWN", 
        "ADDITIVE", 
        0, 
        200 + (20 * M:sin(P:getAge(context.player) * 0.2))
    )

end
