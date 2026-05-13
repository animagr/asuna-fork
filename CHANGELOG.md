# Asuna Changelog

This file documents the major changes made in each version of Asuna.

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## v1.2.0

### Fixed

- Move Creatura mob object fields into `initial_properties` and normalize entity `use_texture_alpha`, fixing Living Slimes spawn errors and related deprecation warnings
  
## v1.1.9

### Added

- Add progressive craft guide recipe discovery, with `asuna.settings.craftguide.discovery.enabled` to restore the full guide if needed

### Fixed

- Clean up low-risk startup warnings across bundled mods, including undeclared globals, duplicate Herbs load logging, invalid light-source values, deprecated mod metadata, invalid media filenames, and bundled Player Monoids bed compatibility
- Fix Asuna biome helper lists leaking decoration helper functions into Luanti biome checks, causing empty-name biome warnings
- Filter Plantlife seaweed shore biome generation to avoid invalid `*_shore_shore` and `*_below_shore` biome names
- Map stale bundled mod biome references to Asuna's registered biome names across Ethereal, Everness, X Farming, Living Jungle, Living Slimes, NaturalBiomes, Herbs, and Minetest Game compatibility mapgen
- Avoid duplicate bundled stair/slab registrations for bamboo wood, willow wood, and quartz block

## v1.1.8

### Fixed

- Replace remaining active `print()` calls in production code with `minetest.log()` / `core.log()`
- Add safe mode to remaining `minetest.deserialize()` calls in Animalia libri, Animalia horse inventory, and Minetest Game carts
- Harden Asuna Awards dropped-item lava check against unloaded/unknown nodes
- Harden Effervescence walking particle node lookup against unloaded areas
- Fix Animalia horse detached inventory cleanup typo (`animlaia` -> `animalia`) and harden horse inventory deserialization
- Fix Animalia Mobs Redo saddle conversion alias to point at `animalia:saddle`
- Escape player-controlled Animalia nametag formspec text
- Restore Everness sneak-pickup item pickup callbacks and add safer dropped-item entity guards
- Fix X Farming standalone soil ABM nil dereference when field nodes lack `soil` metadata
- Fix Stamina content pack gating to respect `asuna.content.nutrition.enabled`
- Cache Stamina's optional `pova` integration API locally to avoid undefined-global warnings
- Fix Worldgate mapgen gating so both `worldgate.mapgen` and Asuna Wayfarer settings can disable generation
- Fix Animalia mob spawning gate to avoid overwriting the global `spawn_mobs` setting
- Remove duplicate Animalia API load during startup
- Remove packaged Player Monoids test command loading
- Fix X Farming pine nut slab alias target (`slab:stair_pine_wood` -> `stairs:slab_pine_wood`)
- Fix Ethereal green dirt compatibility alias typo (`default;dirt_with_grass` -> `default:dirt_with_grass`)
- Add `asuna_core` optional dependencies to bundled mods that read Asuna content/settings globals
- Wrap remaining reviewed deserialize calls in `pcall()` hardening across Animalia, Creatura, X Farming, 3D Armor, Minetest Game beds, and Minetest Game default
- Modernize deprecated Luanti API usage across reviewed mods:
  - Replace deprecated formspec `current_name` inventory locations with `context`
  - Replace deprecated HUD `hud_elem_type` fields with `type`
  - Replace deprecated `get_perlin()` calls with `get_value_noise()`
  - Replace deprecated ItemStack metadata accessors with `get_meta()` string access
  - Migrate Animalia head tracking from bone position APIs to bone overrides
  - Replace deprecated dropped-item `wielditem` texture assignment and boolean node `use_texture_alpha` values
  - Remove old `nodeupdate` and player velocity compatibility fallbacks

## v1.1.7

### Fixed

- Fix Worldgate mapgen skipping all remaining gates in a mapchunk when one gate fails to find a location (`return` replaced with `break` to continue to next gate)
- Fix Worldgate heightmap placement accepting locations with invalid space above (water or unloaded chunks above the gate were not rejecting the candidate)
- Fix Worldgate `get_gates_for_mapblock` off-by-one loop starting at index 0 instead of 1
- Fix loop variable shadowing in Worldgate mapgen and linking code (loop index reused as value inside loop body)
- Fix Astralcraft `day_check_timer` never resetting after first expiry (caused `is_day` check to run every globalstep tick instead of every 5 seconds)
- Fix Astralcraft star armor `calculate_armor_bonus` writing results inside the element loop (final state depended on undefined `pairs()` iteration order; moved assignment after loop)
- Fix Astralcraft star armor global `armor` table shadowed by loop variable in `calculate_armor_bonus` and star charm spawner eligibility check
- Fix Astralcraft star armor globalstep shadowing `player` loop key (string) with player object lookup
- Fix Astralcraft warp star `reset()` ignoring its `wear` parameter and always applying hardcoded `wear_per_failure`
- Fix Astralcraft warp star `on_use` parameter shadowed by immediate local redeclaration
- Fix Astralcraft shooting star `on_deactivate` calling `self.object:remove()` on potentially invalid object during unload
- Fix Astralcraft astralite particle `minexptime` (4) greater than `maxexptime` (3)
- Fix Cloudcraft sparse cloud dispersal ABM only checking X/Z neighbors, not Y (thin horizontal cloud sheets would never disperse)
- Fix Cloudcraft floating cloud mapgen callback mutating `mapgen.pos` without restoring it
- Remove Cloudcraft debug `/pp` chat command (no privs required, leaked player physics to server log)
- Fix broken node references `default:stone_with_coal_ore` and `default:stone_with_iron_ore` in terrain decoration `place_on` list (correct names are `default:stone_with_coal` and `default:stone_with_iron`)
- Fix "Fool's Gold" award referencing non-existent `everness:pyrite_ore` (corrected to `everness:stone_with_pyrite`)
- Fix Music API using `register_on_dieplayer` instead of `register_on_respawnplayer` for respawn callback (music kept playing during death)
- Fix Music API inconsistent day/night time boundaries between track selection (0.25/0.75) and track cleanup (0.205/0.76) causing jarring transitions
- Fix Dungeons Plus jail `vparam2` writing bones rotation to wrong voxel index
- Fix Dungeons Plus alchemy lab checking `dependencies.vessels` twice instead of `dependencies.fireflies` (firefly bottles never spawned)
- Fix Researcher GUI crash when clicking duplicate button (`player_name` undefined outside research branch)
- Fix Item Drop legacy settings fallback checking `name_new` twice instead of falling back to `name_old`
- Fix Item Drop error message referencing undefined variable `name` (replaced with actual item value)
- Fix Stamina `set_saturation` calling `player_monoids.speed` without checking if player_monoids mod is loaded
- Fix Effervescence particle spawner executing before `playername` field is assigned (trailing comma caused evaluation order issue)
- Fix Marinara soft coral using wrong wield image (`softcoral_green` instead of `softcoral`)
- Fix Marinara bounty chest #7 missing `S()` translation wrapper
- Fix Badland moreblocks descriptions copy-pasted from wrong biomes ("Frost Land Wood" → "Badland Wood", "Japanese Tree" → "Badland Tree")
- Remove mod-level `.gitignore` files inherited from standalone mod repos (blocked `azalea.obj` model from being committed)
- Add missing `beautiflowers` model `azalea.obj` to repository

## v1.1.6

### Fixed

- Fix crash in Astralcraft shooting star cleanup (`attempt to call method 'is_valid' (a nil value)`)
  - Use collect-then-remove pattern to avoid mutating `core.luaentities` during iteration
  - Guard `entity.object.is_valid` existence before calling it
  - Reorder checks from cheapest to most expensive
- Fix Astralcraft shooting star spawner node check (`core.get_node(pos) == "air"` always evaluated false)
- Fix Animalia rat/mouse not moving (speed too low for friction to allow visible movement; increased from 1 to 3)
- Fix Animalia `basic_seek_food` always triggering (`random(1) < 8` always true; corrected to `random(8) < 2`)
  - Affected mobs: bear, opossum, fox, frog
- Fix Crystal Forest dungeon stairs using wrong node name (`everness:` prefix instead of `stairs:`)
- Fix broken `check_player_privs` call in `/climate` command (redundant check removed)
- Fix stale `herbs:dosera` alias references in flower/loot lists (corrected to `herbs:drosera`)
- Fix loot chests not spawning on savanna terrain (`naturalbiomes:savanna_litter` typo → `naturalbiomes:savannalitter`)
- Fix loot chest randomization seed collisions causing identical loot at many positions (use `hash_node_position` instead of coordinate multiplication)


### Security

- Add safe mode to ~30 `minetest.deserialize()` calls across 14 mods to prevent code execution from corrupt data
  - Affected mods: creatura, builtin_item, awards, music_api, animalia, 3d_armor, researcher, astralcraft, beds, default, x_farming, herbs

### Changed

- Fork: remove all git submodules and embed all mods directly in the repository for a fully self-contained project
- Replace `print()` with `minetest.log()`/`core.log()` in 10 production files
  - Affected mods: builtin_item, x_farming, farming, herbs, everness, awards, item_drop, ethereal
- Add `ignore` node checks to most relevant runtime callbacks to prevent issues at chunk boundaries
  - Astralcraft shooting star spawner: skip spawning at unloaded positions
  - Astralcraft warp star: skip collision detection at unloaded positions (prevents teleporting into unloaded areas)
  - Animalia ABM spawning: skip mob spawning on unloaded nodes

## v1.1.5

- Reduce prevalence of slime mold on Mushroom biome shores
- Allow coral to generate at slightly higher depths in tropical oceans
- Update Dungeons Plus from upstream

## v1.1.4

- Use sand for Heath biome seabed
- Improve ocean/shore biome mapgen performance and decoration patterns; beaches will generally be clearer and cleaner!
  - Waterlily: reduce general density, remove from hot/tropical biome shores, and add extra to swampy biomes
  - Reduce floating seaweed density
  - Start algae, oysters, and mussels at slightly deeper depths
  - Code improvements for better mapgen performance
- Remove Ethereal thin ice from mapgen
- Update mods from upstream
  - Minetest Game: added support for Player Monoids
  - Dungeons Plus: miscellaneous feature improvements and additional dungeon room checks

## v1.1.3

- Add Ethereal crystal spikes to Everness crystal forest biome
- Remove sashimi from Japanese forest mod/biome in favor of Ethereal sashimi
- Update Minetest Game from upstream

## v1.1.2

- New mod: [Dungeons Plus](https://content.luanti.org/packages/EmptyStar/dungeonsplus/)
- Update mods from upstream
  - 3D Armor: Russian translations and API crash fix
  - Animalia: prevent log message spam due to node re-registration
  - Astralcraft: reduce star fragment yield from shooting stars
  - Asuna Game Mods: new crying obsidian textures by [JoeEnderman](https://content.luanti.org/users/JoeEnderman/)
  - Filled Bottles: bottles with lighted materials now inherit light levels

## v1.1.1

- Update Minetest Game from upstream to pull in [a hotfix to signs](https://github.com/luanti-org/minetest_game/commit/a6bf9dd526e51b25f1ca08d6d214c5e8442b503b)
- Disable weeds ([for real this time](https://github.com/asuna-mt/farming/commit/f09ca4a0693c11bfed6a35bb7756ee95ca62c679))
- Adjust dungeon nodes for some biomes

## v1.1.0

- New content pack: Stratosphere!
  - Introduces sky islands to Asuna worlds
  - Adds shooting stars + related items via [Astralcraft](https://content.luanti.org/packages/EmptyStar/astralcraft/)
  - Adds tangible clouds + related items via [Cloudcraft](https://content.luanti.org/packages/EmptyStar/cloudcraft/)
- As of this version, the only officially supported mapgen for Asuna is **mapgen v7**; Asuna worlds with other mapgens can still be created, but these worlds will see a warning that can be disabled via settings
- New in-game font: [Montserrat ESR](https://content.luanti.org/packages/EmptyStar/montserrat_esr/)
- New textures from [Baunilha](https://content.luanti.org/packages/Mirtilo/baunilha/), notably including new textures for Ethereal, Baked Clay, and other newly designed mod textures
- Added [Tune JIT](https://content.luanti.org/packages/rudzik8/tune_jit/) for improved server-side performance
- Added [Armor Monoid](https://content.luanti.org/packages/Byakuren/armor_monoid/) for mod compatibility
- Updated all mods from upstream
- Bug fixes
  - Raised height limit of Deciduous Forest biome to 31000
  - Pumpkins now only drop one pumpkin
  - Added missing aliases for certain mod items that were removed/deduplicated
  - Remove all uses of `goto` in the Asuna code base as it isn't officially supported

## v1.0.7

- Effervescence: Use `blend = "clip"` for particles only if it's supported

## v1.0.6

- Disable torch damage
- Remove log message that appears when using a bug net

## v1.0.5

- Fix a crash caused by the Net Worth award
- Researcher: Fix broken research table particle graphics
- Effervescence: Set `blend = "clip"` for most particle effects
- Add `time_speed = 72` to Asuna's minetest.conf file for proper day/night cycles in case the default value changes

## v1.0.4

- Add missing Dorwinion and Nightshade tree saplings
- Make saplings from Biomes modpack more compatible with bonemeal
- Adjust Show Wielded Item text to be bold and to not overlap with the food saturation bar
- Enable raspberries from Farming Redo and add raspberries to mapgen
- Adjust low-yield wild crops to be more mature and thus more likely to drop crops/seeds

## v1.0.3

- Use alternate texture for wool instead of overriding X Farming wool alias tiles
- Add [Carpets](https://content.luanti.org/packages/bell07/carpets/) mod

## v1.0.2

- Removed hemp -> cotton recipe
- X Farming water bottle aliased to Filled Bottles water bottle
- X Farming soup bowl aliased to Farming Redo wooden bowl
- Everness basic farming soils aliased to Farming Redo soils
- Added depth_riverbed to registered biomes which ensures proper riverbeds
- Grass/litter nodes based on nodes other than dirt now decay into the proper node
- Expanded Heath biome to the shoreline
- Generate schematics before ground cover in Natural Biomes mapgen

## v1.0.1

- Added a mod override warning that warns players if they have mods enabled that are already bundled with Asuna
- Removed directional placement of Ethereal planks
- Removed marram grass from sandstone desert shores
- Updated Minetest Game from upstream

## v1.0.0

- Asuna is no longer a work-in-progress! Asuna will continue to see updates; this simply means that Asuna is no longer considered to be in a new/experimental state
- New built-in mods: Researcher, 3D Armor, Find Biome, Effervescence; if you have any of these mods enabled for your existing Asuna worlds, it is recommended to disable them in favor of Asuna's built-in mods
- Gameplay updates are now structured as *content packs* which are configurable via settings -- **CHECK YOUR GAME SETTINGS** to reconfigure any previous changes that you might have made
- Revamped Jumble biome: now features more distinct trees and biome features + fixed missing cave definition to give it proper fungal/mushroom caves
- Set height limit to max for biomes that were unnecessarily limited to lower elevations (Grassland, Plains, Prairie, Birch Forest, Sakura, Jumble, Mushroom, Grove)
- Eight new ambient music tracks by [Sascha Ende](https://filmmusic.io/) (and removed two less fitting nighttime tracks)
- Updated textures based on newer versions of [Baunilha](https://content.luanti.org/packages/Mirtilo/baunilha/) plus some custom textures for crosshairs, giant mushrooms, and select other nodes/items
- New awards
- Upstream updates to all bundled mods that had available updates
- Globally-aligned textures for Minetest Game stairs and slabs
- New overall goal tracker for Awards UI and more consistent award listing
- Lots of bug fixes: possible crash and behavior issues with slimes, beds previously not passing the night, mapgen quirks, missing groups for certain flowers, and so much more!
