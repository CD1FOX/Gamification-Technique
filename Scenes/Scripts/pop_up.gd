extends Control

@onready var task_popup = $ExpPopup
var caller = null

func popup_caller(caller_node):
	caller = caller_node
	task_popup.popup_centered()

func _on_exp_popup_canceled() -> void:
	task_popup.hide()
	caller = null

func _on_exp_popup_confirmed() -> void:
	task_popup.hide()
	if caller:
		caller.on_popup_confirmed()
	caller = null
