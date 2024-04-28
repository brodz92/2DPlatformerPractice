extends Line2D

@onready var character = %Player

func _physics_process(delta: float) -> void:
	if character:
		points.clear()  # Clears previous points to avoid clutter
		var character_pos = character.global_position
		add_point(character_pos)  # Adds only the character's position

		# Debug outputs
		print("Character position: ", character_pos)
