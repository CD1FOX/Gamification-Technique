extends Node2D

# Called every frame
func _process(_delta: float) -> void:
	handle_level_up()


# Checks if the player has enough EXP to level up and handles the process
func handle_level_up() -> void:
	var current_exp = Global.currentExp
	var exp_to_level_up = Global.expToLevelUp

	# Check if the player has enough EXP to level up
	if current_exp >= exp_to_level_up:

		# Save any excess EXP to carry over after leveling up
		var remainder = current_exp - exp_to_level_up if current_exp > exp_to_level_up else 0

		# Increase level
		Global.level += 1

		# Reset current EXP with the remainder (overflow EXP)
		Global.currentExp = remainder

		# Recalculate the EXP needed for the next level
		Global.expToLevelUp = calculate_exp_to_level_up(Global.level)


# Calculates how much EXP is needed to level up based on current level
func calculate_exp_to_level_up(level: int) -> int:
	return round(100 * pow(1.15, level - 1))  # Exponential growth curve
