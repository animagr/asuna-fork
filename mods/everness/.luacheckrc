unused_args = false
allow_defined_top = true
max_line_length = false

exclude_files = {
    './scripts',
    './bin',
    './logs',
    './node_modules',
    './sounds',
    './textures',
    './models',
    './docs',
    './locale',
    './types',
    './schematics',
    './assets',
}

globals = {
    'Everness',
    core = {
        fields = {
            "handle_node_drops"
        }
    },
    'sfinv',
    "unified_inventory",
    "i3"
}

read_globals = {
    "DIR_DELIM", "INIT",

    "minetest", "core",
    "dump", "dump2",

    "Raycast",
    "Settings",
    "PseudoRandom",
    "PerlinNoise",
    "VoxelManip",
    "SecureRandom",
    "VoxelArea",
    "PerlinNoiseMap",
    "PcgRandom",
    "ItemStack",
    "AreaStore",
    "unpack",

    "vector",

    table = {
        fields = {
            "copy",
            "indexof",
            "insert_all",
            "key_value_swap",
            "shuffle",
        }
    },

    string = {
        fields = {
            "split",
            "trim",
        }
    },

    math = {
        fields = {
            "hypot",
            "sign",
            "factorial",
            "round",
        }
    },

    "default",
    "stairs",
    "walls",
    "doors",
    "xpanes",
    "XTumbleweed",
    "x_obsidianmese",
    "x_farming",
    "x_clay",
    "mcl_fences",
    "mcl_walls",
    "mcl_stairs",
    "mcl_core",
    "mcl_util",
    "mcl_doors",
    "mcl_vars",
    "mcl_buckets",
    "mcl_worlds",
    "bucket"
}
