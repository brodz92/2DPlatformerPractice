extends Area2D

func reload_current_scene():
	var current_scene = "res://Level2.tscn"
	get_tree().reload_current_scene()



func _on_body_entered(body: Node2D) -> void:
	reload_current_scene()
