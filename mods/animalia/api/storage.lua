local mod_storage = minetest.get_mod_storage()

local function safe_deserialize(data, fallback)
	if not data or data == "" then return fallback end
	local ok, result = pcall(minetest.deserialize, data, true)
	if ok then
		return result or fallback
	end
	minetest.log("warning", "[animalia] Failed to deserialize mod storage: " .. tostring(result))
	return fallback
end

local data = {
	spawn_points = safe_deserialize(mod_storage:get_string("spawn_points"), {}),
	libri_font_size  = safe_deserialize(mod_storage:get_string("libri_font_size"), {}),
}

local function save()
	mod_storage:set_string("spawn_points", minetest.serialize(data.spawn_points))
	mod_storage:set_string("libri_font_size", minetest.serialize(data.libri_font_size))
end

minetest.register_on_shutdown(save)
minetest.register_on_leaveplayer(save)

local function periodic_save()
	save()
	minetest.after(120, periodic_save)
end
minetest.after(120, periodic_save)

return data
