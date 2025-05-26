extends Node2D

@onready var progress_bar = $TextureProgressBar
@onready var progress_label = $ProgressLabel

func _process(_delta: float) -> void:
	# Update progress bar values
	progress_bar.value = Global.currentExp
	progress_bar.max_value = Global.expToLevelUp
	
	# Update label to show current / max EXP
	progress_label.text = "%d / %d" % [int(progress_bar.value), int(progress_bar.max_value)]
	
	# Update bar color based on current progress
	update_bar_color()

func update_bar_color():
	var quarter = Global.expToLevelUp / 4.0
	
	# Tint based on which quarter currentExp is in
	if Global.currentExp <= quarter:
		progress_bar.tint_progress = Color8(255, 0, 0)         # Red (0–25%)
	elif Global.currentExp <= quarter * 2:
		progress_bar.tint_progress = Color8(255, 255, 0)       # Yellow (26–50%)
	elif Global.currentExp <= quarter * 3:
		progress_bar.tint_progress = Color8(0, 255, 0)         # Green (51–75%)
	else:
		progress_bar.tint_progress = Color8(0, 0, 255)       # Blue (76–100%)
