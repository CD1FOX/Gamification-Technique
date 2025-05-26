extends Node2D

@onready var popup_scene = $PopUp
var exp_to_add = 0

func _on_button_pressed() -> void:
	if $TextEdit.text != "" and int($TextEdit.text) >= 0:
		exp_to_add = int($TextEdit.text)
		popup_scene.popup_caller(self)
		$TextEdit.clear()
	else:
		Global.currentExp += 0

func on_popup_confirmed():
	Global.currentExp += exp_to_add
	print("✅ Exp added:", exp_to_add)
	exp_to_add = 0
