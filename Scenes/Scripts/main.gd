extends Node2D

func _process(_delta: float) -> void:
	print(str(Global.currentExp) + " " + str(Global.level) + " " + str(Global.remainder))
