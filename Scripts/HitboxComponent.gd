extends Area2D

@export var damage = 1
@onready var timer = $Timer

func _on_body_entered(body):
	print("Count +1")
	timer.start()

func _on_timer_timeout():
	get_tree().reload_current_scene()
