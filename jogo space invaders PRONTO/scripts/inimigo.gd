extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var rng
var vel_x
var TIRO 
var delay = rand_range(1, 20)
var delay_tiro2 = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	TIRO = preload ("res://comp/tiro2.tscn")
	rng = RandomNumberGenerator.new()
	vel_x = rng.randi_range(-500, 500) 
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var colisao = move_and_collide(Vector2(vel_x, 0) * delta)
	
	if colisao != null: 
		if colisao.collider.is_in_group("Inimigo") or colisao.collider.name == "parede": 
			if vel_x < 0: 
				vel_x = rng.randi_range (200, 400)
			else: 
				vel_x = rng.randi_range (-400, -200)
				
		if colisao.collider.name.find("tiro")>-1:
			colisao.collider.queue_free()
			get_node("AnimatedSprite").animation = "explosao"
			get_node("CollisionShape2D").disabled = true
			
			Global.pontos = Global.pontos + 1 
			get_node("../Global").text = "Pontuação:" + str(Global.pontos)
			
		if delay_tiro2 >= delay: 
			var tsc = TIRO.instance()
			get_tree().get_root().add_child(tsc) 
			tsc.position = self.position 
			delay_tiro2 = 0 
		else: delay_tiro2 = delay_tiro2 + delta 

func _on_AnimatedSprite_animation_finished():
	if get_node ("AnimatedSprite").animation == "explosao":
		queue_free()
		
	
		
		
		
	
