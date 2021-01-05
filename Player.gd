extends Area2D

signal hit

export var speed = 400  # How fast the player will move (pixels/sec).
var screen_size  # Size of the game window.
var velocity = Vector2()
var use_touch = false
var game_running = false
var dragging = false

func start(pos):
    position = pos
    game_running = true
    show()
    $CollisionShape2D.disabled = false

func stop():
    game_running = false
    
func _ready():
    screen_size = get_viewport_rect().size
    position.x = screen_size.x / 2
    position.y = screen_size.y / 2
    hide()
    
func _input(event):
    if event is InputEventScreenTouch or event is InputEventScreenDrag:
        use_touch = true
        var new_velocity = event.position - position
        if new_velocity.length_squared() > screen_size.x * 0.1:
            velocity = new_velocity.normalized() * speed
    elif event is InputEventKey:
        use_touch = false

func _process(delta):
    if game_running:
        if !use_touch:
            if Input.is_action_pressed("ui_right"):
                velocity.x += 1
            if Input.is_action_pressed("ui_left"):
                velocity.x -= 1
            if Input.is_action_pressed("ui_down"):
                velocity.y += 1
            if Input.is_action_pressed("ui_up"):
                velocity.y -= 1
        if velocity.length() > 0:
            velocity = velocity.normalized() * speed
            $AnimatedSprite.play()
        else:
            $AnimatedSprite.stop()        
        position += velocity * delta
        position.x = clamp(position.x, 0, screen_size.x)
        position.y = clamp(position.y, 0, screen_size.y)

        if velocity.x != 0:
            $AnimatedSprite.animation = "walk"
            $AnimatedSprite.flip_v = false
            # See the note below about boolean assignment
            $AnimatedSprite.flip_h = velocity.x < 0
        elif velocity.y != 0:
            $AnimatedSprite.animation = "up"
            $AnimatedSprite.flip_v = velocity.y > 0
    velocity = Vector2()

func _on_Player_body_entered(body):
    hide()  # Player disappears after being hit.
    emit_signal("hit")
    $CollisionShape2D.set_deferred("disabled", true)
