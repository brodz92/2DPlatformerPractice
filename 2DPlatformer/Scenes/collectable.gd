extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if (body.name == "Player"):
		queue_free()
		%GameManager.add_point()
