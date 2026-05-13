--
-- Overrides for Telemosaic settings
--

-- Give extenders a lot more range
if worldgate.settings.superextenders then
  local function override_extender_range(node, range)
    local groups = table.copy(minetest.registered_nodes[node].groups)
    groups.telemosaic_extender = range
    minetest.override_item(node,{ groups = groups })
  end

  -- Global extender values
  telemosaic.extender_ranges = { 250, 750, 1500 }

  -- Tier 1 extenders
  local tier1range = telemosaic.extender_ranges[1]
  override_extender_range("telemosaic:extender_one", tier1range)

  -- Tier 2 extenders
  local tier2range = telemosaic.extender_ranges[2]
  override_extender_range("telemosaic:extender_two", tier2range)

  -- Tier 3 extenders
  local tier3range = telemosaic.extender_ranges[3]
  override_extender_range("telemosaic:extender_three", tier3range)
end

-- Implement a longer minimum delay for teleportation to prevent spamming and
-- weirdness with loading/unloading mapblocks
local min_delay = 5
if telemosaic.teleport_delay < min_delay then
  telemosaic.teleport_delay = min_delay
end

-- Override beacons to give off light if configured
if worldgate.settings.beaconglow then
  for _,beacon in ipairs({
    "telemosaic:beacon",
    "telemosaic:beacon_protected",
    "telemosaic:beacon_err",
    "telemosaic:beacon_err_protected",
  }) do
    minetest.override_item(beacon,{
      light_source = minetest.LIGHT_MAX,
    })
  end
end

-- Override right-click function to consume mese crystal shards after use as a
-- Telemosaic key, if configured
if worldgate.settings.destroykeys then
  local trc = telemosaic.rightclick
  telemosaic.rightclick = function(pos, node, player, itemstack, pointed_thing)
    local item = itemstack:get_name()
    local returned_item = trc(pos, node, player, itemstack, pointed_thing)
    if item == "telemosaic:key" and returned_item:get_name() == "default:mese_crystal_fragment" then
      return ItemStack()
    else
      return returned_item
    end
  end

  for _,beacon in ipairs({
    "telemosaic:beacon",
    "telemosaic:beacon_err",
    "telemosaic:beacon_disabled",
    "telemosaic:beacon_off",
    "telemosaic:beacon_protected",
    "telemosaic:beacon_err_protected",
    "telemosaic:beacon_disabled_protected",
    "telemosaic:beacon_off_protected",
  }) do
    minetest.override_item(beacon,{
      on_rightclick = telemosaic.rightclick
    })
  end
end
