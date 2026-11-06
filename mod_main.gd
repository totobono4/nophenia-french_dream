extends Node

const MOD_DIR := "totobono4-french_dream"
const LOG_NAME := "totobono4-french_dream:Main"

var mod_dir_path := ModLoaderMod.get_unpacked_dir().path_join(MOD_DIR)
var translations_dir_path := mod_dir_path.path_join("lang")

func _init() -> void:
	ModLoaderLog.info("Init", LOG_NAME)
	add_translations()
	add_child(load(ModLoaderMod.get_unpacked_dir().path_join("totobono4-french_dream/french_dream.gd")).new())

func add_translations() -> void:
	ModLoaderMod.add_translation(translations_dir_path.path_join("french_dream.fr.translation"))

func _ready() -> void:
	ModLoaderLog.info("Ready", LOG_NAME)
