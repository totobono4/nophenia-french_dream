extends "res://gdscript/global_game.gd"

func apply_config():
	super.apply_config()
	match config.language:
		1: TranslationServer.set_locale("ja")
		2: TranslationServer.set_locale("de")
		3: TranslationServer.set_locale("ru")
		4: TranslationServer.set_locale("fr")
		_: TranslationServer.set_locale("en")
