return function(award)
  return {
    title = "Fool's Gold",
    description = "Mine pyrite ore",
    difficulty = 25,
    icon = "[inventorycube{default_stone.png&everness_mineral_pyrite.png{default_stone.png&everness_mineral_pyrite.png{default_stone.png&everness_mineral_pyrite.png",
    trigger = {
      type = "dig",
      node = "everness:stone_with_pyrite",
      target = 1,
    },
  }
end