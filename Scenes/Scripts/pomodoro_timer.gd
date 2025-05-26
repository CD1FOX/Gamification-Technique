extends Node2D

# Constants
const FOCUS_TIME = 25 * 60  # 25 minutes
const BREAK_TIME = 5 * 60   # 5 minutes

# Timer state
var is_focus = false
var is_running = false
var time_left = 0

# UI Nodes
@onready var focus_button = $FocusSession/FocusSessionButton
@onready var break_button = $BreakTimeSession/BreakTimeSessionButton 
@onready var timer_label = $Timerlabel
@onready var pomodoro_timer = $PomodoroTimer 
@onready var auto_focus_checkbox = $FocusSession/AutoFocusSessionCheckbox
@onready var auto_break_checkbox = $BreakTimeSession/BreakTimeSessionCheckbox

func _ready():
	update_ui()

func update_ui():
	var minutes = time_left / 60.0
	var seconds = time_left % 60
	timer_label.text = "%02d:%02d" % [minutes, seconds]

	# Button text based on state
	if is_running:
		if is_focus:
			focus_button.text = "Stop Focus Session"
		else:
			break_button.text = "Stop Break Time"
	else:
		focus_button.text = "Start Focus Session"
		break_button.text = "Start Break Time"

	# Disable opposite button while one is running
	focus_button.disabled = is_running and not is_focus
	break_button.disabled = is_running and is_focus

func _on_FocusButton_pressed():
	if is_running and is_focus:
		stop_timer()
	else:
		start_focus()

func _on_BreakButton_pressed():
	if is_running and not is_focus:
		stop_timer()
	else:
		start_break()

func start_focus():
	is_focus = true
	is_running = true
	time_left = FOCUS_TIME
	pomodoro_timer.start()
	update_ui()

func start_break():
	is_focus = false
	is_running = true
	time_left = BREAK_TIME
	pomodoro_timer.start()
	update_ui()

func stop_timer():
	pomodoro_timer.stop()
	is_running = false
	update_ui()


func _on_pomodoro_timer_timeout() -> void:
	if time_left > 0:
		time_left -= 1
		update_ui()
	else:
		pomodoro_timer.stop()
		is_running = false
		update_ui()

		# Auto switch logic
		if is_focus and auto_break_checkbox.button_pressed:
			start_break()
		elif not is_focus and auto_focus_checkbox.button_pressed:
			start_focus()
