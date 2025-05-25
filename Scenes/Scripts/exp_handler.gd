extends Node2D



func _on_button_pressed() -> void:
	if $TextEdit.text != "" and int($TextEdit.text) >= 0:
		Global.currentExp += int($TextEdit.text)
		$TextEdit.clear()
	else:
		Global.currentExp += 0
