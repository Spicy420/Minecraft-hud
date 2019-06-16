local rectangle = renderer.rectangle
local getui = ui.get

local w, h = client.screen_size()

local enable = ui.new_checkbox("Visuals", "Effects", "Minecraft hud")
local xslider = ui.new_slider("Visuals", "Effects", "X", 0, w, 225, true)
local yslider = ui.new_slider("Visuals", "Effects", "Y", 0, h, h - 100, true)

ui.set_callback(enable, function()
	ui.set_visible(xslider, getui(enable))
	ui.set_visible(yslider, getui(enable))
end)

local function draw_heart(x, y)
	--outline
	--left
	rectangle(x + 2, y + 14, 2, 2, 0, 0, 0, 255)
	rectangle(x, y + 12, 2, 2, 0, 0, 0, 255)
	rectangle(x - 2, y + 10, 2, 2, 0, 0, 0, 255)
	rectangle(x - 4, y + 4, 2, 6, 0, 0, 0, 255)
	rectangle(x - 2, y + 2, 2, 2, 0, 0, 0, 255)
	rectangle(x, y, 2, 2, 0, 0, 0, 255)
	rectangle(x + 2, y, 2, 2, 0, 0, 0, 255)
	--center-top
	rectangle(x + 4, y + 2, 2, 2, 0, 0, 0, 255)
	--right
	rectangle(x + 6, y, 2, 2, 0, 0, 0, 255)
	rectangle(x + 8, y, 2, 2, 0, 0, 0, 255)
	rectangle(x + 10, y + 2, 2, 2, 0, 0, 0, 255)
	rectangle(x + 12, y + 4, 2, 6, 0, 0, 0, 255)
	rectangle(x + 10, y + 10, 2, 2, 0, 0, 0, 255)
	rectangle(x + 8, y + 12, 2, 2, 0, 0, 0, 255)
	rectangle(x + 6, y + 14, 2, 2, 0, 0, 0, 255)
	--center-bottom
	rectangle(x + 4, y + 16, 2, 2, 0, 0, 0, 255)

	--red-fill
	rectangle(x - 2, y + 4, 2, 6, 254, 19, 19, 255)
	rectangle(x, y + 2, 4, 2, 254, 19, 19, 255)
	rectangle(x, y + 6, 4, 6, 254, 19, 19, 255)
	rectangle(x + 2, y + 4, 2, 2, 254, 19, 19, 255)
	rectangle(x + 2, y + 12, 2, 2, 254, 19, 19, 255)
	rectangle(x + 4, y + 4, 2, 12, 254, 19, 19, 255)
	rectangle(x + 6, y + 2, 4, 10, 254, 19, 19, 255)
	rectangle(x + 6, y + 12, 2, 2, 254, 19, 19, 255)
	rectangle(x + 10, y + 4, 2, 6, 254, 19, 19, 255)

	--highlight
	rectangle(x, y + 4, 2, 2, 254, 199, 199, 255)
end

local function draw_half_heart(x, y)
	--outline
	--left
	rectangle(x + 2, y + 14, 2, 2, 0, 0, 0, 255)
	rectangle(x, y + 12, 2, 2, 0, 0, 0, 255)
	rectangle(x - 2, y + 10, 2, 2, 0, 0, 0, 255)
	rectangle(x - 4, y + 4, 2, 6, 0, 0, 0, 255)
	rectangle(x - 2, y + 2, 2, 2, 0, 0, 0, 255)
	rectangle(x, y, 2, 2, 0, 0, 0, 255)
	rectangle(x + 2, y, 2, 2, 0, 0, 0, 255)
	--center-top
	rectangle(x + 4, y + 2, 2, 2, 0, 0, 0, 255)
	--right
	rectangle(x + 6, y, 2, 2, 0, 0, 0, 255)
	rectangle(x + 8, y, 2, 2, 0, 0, 0, 255)
	rectangle(x + 10, y + 2, 2, 2, 0, 0, 0, 255)
	rectangle(x + 12, y + 4, 2, 6, 0, 0, 0, 255)
	rectangle(x + 10, y + 10, 2, 2, 0, 0, 0, 255)
	rectangle(x + 8, y + 12, 2, 2, 0, 0, 0, 255)
	rectangle(x + 6, y + 14, 2, 2, 0, 0, 0, 255)
	--center-bottom
	rectangle(x + 4, y + 16, 2, 2, 0, 0, 0, 255)

	--red-fill
	rectangle(x - 2, y + 4, 2, 6, 254, 19, 19, 255)
	rectangle(x, y + 2, 4, 2, 254, 19, 19, 255)
	rectangle(x, y + 6, 4, 6, 254, 19, 19, 255)
	rectangle(x + 2, y + 4, 2, 2, 254, 19, 19, 255)
	rectangle(x + 2, y + 12, 2, 2, 254, 19, 19, 232)
	rectangle(x + 4, y + 4, 2, 12, 254, 19, 19, 255)
	rectangle(x + 6, y + 2, 4, 10, 35, 35, 35, 232)
	rectangle(x + 6, y + 12, 2, 2, 35, 35, 35, 232)
	rectangle(x + 10, y + 4, 2, 6, 35, 35, 35, 232)

	--highlight
	rectangle(x, y + 4, 2, 2, 254, 199, 199, 255)
end

local function on_paint(ctx)
	local localPlayer = entity.get_local_player()
	local hp = entity.get_prop(localPlayer, "m_iHealth")

	if getui(enable, true) then
		if hp >= 100 then
			draw_heart(0 + getui(xslider), getui(yslider))
			draw_heart(16 + getui(xslider), getui(yslider))
			draw_heart(32 + getui(xslider), getui(yslider))
			draw_heart(48 + getui(xslider), getui(yslider))
			draw_heart(64 + getui(xslider), getui(yslider))
			draw_heart(80 + getui(xslider), getui(yslider))
			draw_heart(96 + getui(xslider), getui(yslider))
			draw_heart(112 + getui(xslider), getui(yslider))
			draw_heart(128 + getui(xslider), getui(yslider))
			draw_heart(144 + getui(xslider), getui(yslider))
		elseif hp >= 95 and hp < 100 then
			draw_heart(0 + getui(xslider), getui(yslider))
			draw_heart(16 + getui(xslider), getui(yslider))
			draw_heart(32 + getui(xslider), getui(yslider))
			draw_heart(48 + getui(xslider), getui(yslider))
			draw_heart(64 + getui(xslider), getui(yslider))
			draw_heart(80 + getui(xslider), getui(yslider))
			draw_heart(96 + getui(xslider), getui(yslider))
			draw_heart(112 + getui(xslider), getui(yslider))
			draw_heart(128 + getui(xslider), getui(yslider))
			draw_half_heart(144 + getui(xslider), getui(yslider))
		elseif hp >= 90 and hp < 95 then
			draw_heart(0 + getui(xslider), getui(yslider))
			draw_heart(16 + getui(xslider), getui(yslider))
			draw_heart(32 + getui(xslider), getui(yslider))
			draw_heart(48 + getui(xslider), getui(yslider))
			draw_heart(64 + getui(xslider), getui(yslider))
			draw_heart(80 + getui(xslider), getui(yslider))
			draw_heart(96 + getui(xslider), getui(yslider))
			draw_heart(112 + getui(xslider), getui(yslider))
			draw_heart(128 + getui(xslider), getui(yslider))
		elseif hp >= 85 and hp < 90 then
			draw_heart(0 + getui(xslider), getui(yslider))
			draw_heart(16 + getui(xslider), getui(yslider))
			draw_heart(32 + getui(xslider), getui(yslider))
			draw_heart(48 + getui(xslider), getui(yslider))
			draw_heart(64 + getui(xslider), getui(yslider))
			draw_heart(80 + getui(xslider), getui(yslider))
			draw_heart(96 + getui(xslider), getui(yslider))
			draw_heart(112 + getui(xslider), getui(yslider))
			draw_half_heart(128 + getui(xslider), getui(yslider))
		elseif hp >= 80 and hp < 85 then
			draw_heart(0 + getui(xslider), getui(yslider))
			draw_heart(16 + getui(xslider), getui(yslider))
			draw_heart(32 + getui(xslider), getui(yslider))
			draw_heart(48 + getui(xslider), getui(yslider))
			draw_heart(64 + getui(xslider), getui(yslider))
			draw_heart(80 + getui(xslider), getui(yslider))
			draw_heart(96 + getui(xslider), getui(yslider))
			draw_heart(112 + getui(xslider), getui(yslider))
		elseif hp >= 75 and hp < 80 then
			draw_heart(0 + getui(xslider), getui(yslider))
			draw_heart(16 + getui(xslider), getui(yslider))
			draw_heart(32 + getui(xslider), getui(yslider))
			draw_heart(48 + getui(xslider), getui(yslider))
			draw_heart(64 + getui(xslider), getui(yslider))
			draw_heart(80 + getui(xslider), getui(yslider))
			draw_heart(96 + getui(xslider), getui(yslider))
			draw_half_heart(112 + getui(xslider), getui(yslider))
		elseif hp >= 70 and hp < 75 then
			draw_heart(0 + getui(xslider), getui(yslider))
			draw_heart(16 + getui(xslider), getui(yslider))
			draw_heart(32 + getui(xslider), getui(yslider))
			draw_heart(48 + getui(xslider), getui(yslider))
			draw_heart(64 + getui(xslider), getui(yslider))
			draw_heart(80 + getui(xslider), getui(yslider))
			draw_heart(96 + getui(xslider), getui(yslider))
		elseif hp >= 65 and hp < 70 then
			draw_heart(0 + getui(xslider), getui(yslider))
			draw_heart(16 + getui(xslider), getui(yslider))
			draw_heart(32 + getui(xslider), getui(yslider))
			draw_heart(48 + getui(xslider), getui(yslider))
			draw_heart(64 + getui(xslider), getui(yslider))
			draw_heart(80 + getui(xslider), getui(yslider))
			draw_half_heart(96 + getui(xslider), getui(yslider))
		elseif hp >= 60 and hp < 65 then
			draw_heart(0 + getui(xslider), getui(yslider))
			draw_heart(16 + getui(xslider), getui(yslider))
			draw_heart(32 + getui(xslider), getui(yslider))
			draw_heart(48 + getui(xslider), getui(yslider))
			draw_heart(64 + getui(xslider), getui(yslider))
			draw_heart(80 + getui(xslider), getui(yslider))
		elseif hp >= 55 and hp < 60 then
			draw_heart(0 + getui(xslider), getui(yslider))
			draw_heart(16 + getui(xslider), getui(yslider))
			draw_heart(32 + getui(xslider), getui(yslider))
			draw_heart(48 + getui(xslider), getui(yslider))
			draw_heart(64 + getui(xslider), getui(yslider))
			draw_half_heart(80 + getui(xslider), getui(yslider))
		elseif hp >= 50 and hp < 55 then
			draw_heart(0 + getui(xslider), getui(yslider))
			draw_heart(16 + getui(xslider), getui(yslider))
			draw_heart(32 + getui(xslider), getui(yslider))
			draw_heart(48 + getui(xslider), getui(yslider))
			draw_heart(64 + getui(xslider), getui(yslider))
		elseif hp >= 45 and hp < 50 then
			draw_heart(0 + getui(xslider), getui(yslider))
			draw_heart(16 + getui(xslider), getui(yslider))
			draw_heart(32 + getui(xslider), getui(yslider))
			draw_heart(48 + getui(xslider), getui(yslider))
			draw_half_heart(64 + getui(xslider), getui(yslider))
		elseif hp >= 40 and hp < 45 then
			draw_heart(0 + getui(xslider), getui(yslider))
			draw_heart(16 + getui(xslider), getui(yslider))
			draw_heart(32 + getui(xslider), getui(yslider))
			draw_heart(48 + getui(xslider), getui(yslider))
		elseif hp >= 35 and hp < 40 then
			draw_heart(0 + getui(xslider), getui(yslider))
			draw_heart(16 + getui(xslider), getui(yslider))
			draw_heart(32 + getui(xslider), getui(yslider))
			draw_half_heart(48 + getui(xslider), getui(yslider))
		elseif hp >= 30 and hp < 35 then
			draw_heart(0 + getui(xslider), getui(yslider))
			draw_heart(16 + getui(xslider), getui(yslider))
			draw_heart(32 + getui(xslider), getui(yslider))
		elseif hp >= 25 and hp < 30 then
			draw_heart(0 + getui(xslider), getui(yslider))
			draw_heart(16 + getui(xslider), getui(yslider))
			draw_half_heart(32 + getui(xslider), getui(yslider))
		elseif hp >= 20 and hp < 25 then
			draw_heart(0 + getui(xslider), getui(yslider))
			draw_heart(16 + getui(xslider), getui(yslider))
		elseif hp >= 15 and hp < 20 then
			draw_heart(0 + getui(xslider), getui(yslider))
			draw_half_heart(16 + getui(xslider), getui(yslider))
		elseif hp >= 10 and hp < 15 then
			draw_heart(0 + getui(xslider), getui(yslider))
		elseif hp > 0 and hp < 10 then
			draw_half_heart(0 + getui(xslider), getui(yslider))
		end
	end
end

client.set_event_callback('paint', on_paint)
