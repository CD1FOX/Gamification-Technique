extends Node2D

@onready var progressBar = $TextureProgressBar

func _process(_delta: float) -> void:
	progressBar.value = Global.currentExp
	progressBar.max_value = Global.expToLevelUp
	$ProgressLabel.text = str(int(progressBar.value)) + " / " + str(int(progressBar.max_value))
