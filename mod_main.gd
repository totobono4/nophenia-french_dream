extends Node

const MOD_DIR := "totobono4-french_dream"
const LOG_NAME := "totobono4-french_dream:Main"

var mod_dir_path := ModLoaderMod.get_unpacked_dir().path_join(MOD_DIR)
var translations_dir_path := mod_dir_path.path_join("lang")
var resources_dir_path := mod_dir_path.path_join("resources")

var flag_fr := load(resources_dir_path.path_join("flag-fr-atlas.tres"))
var translation : OptimizedTranslation = load(translations_dir_path.path_join("french_dream.fr.translation"))

func _ready() -> void:
	var mods = ModLoader.get_children()
	for mod in mods:
		match mod.name:
			"totobono4-dream_translator_api":
				mod.add_dream_translation(flag_fr, translation)
