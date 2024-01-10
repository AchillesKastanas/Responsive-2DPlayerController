extends CharacterBody2D

# Movement parameters
const MAX_SPEED = 200.0  # Maximum horizontal speed of the character
const ACCELERATION = 1500.0  # Normal acceleration rate
const RAPID_ACCELERATION = 8000.0  # Acceleration rate when rapidly changing direction
const GROUND_DECELERATION = 3000.0  # Normal deceleration rate
const RAPID_DECELERATION = 8000.0  # Deceleration rate when rapidly changing direction
const AIR_DECELERATION = 500.0  # Deceleration rate when in the air
const JUMP_FORCE = 500.0  # The force applied when jumping
const GRAVITY = 2000.0  # Gravity force applied each frame
const JUMP_BUFFER_TIME = 0.1  # Time window for the jump buffer (in seconds)

var jump_buffer_timer = 0.0  # Timer for the jump buffer duration
var last_input_direction = 0  # Stores the last horizontal input direction

func _physics_process(delta):
    # Update the jump buffer timer
    if jump_buffer_timer > 0:
        jump_buffer_timer -= delta

    # Horizontal Movement Input
    var input_direction = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
    
    # Rapid Direction Change Detection
    var is_rapid_change = input_direction != 0 and sign(input_direction) != sign(last_input_direction)
    last_input_direction = input_direction if input_direction != 0 else last_input_direction

    # Horizontal Movement Logic
    if input_direction != 0:
        # Apply rapid acceleration if changing direction quickly, otherwise normal acceleration
        var acceleration =  RAPID_ACCELERATION if is_rapid_change else ACCELERATION
        velocity.x += acceleration * input_direction * delta
        velocity.x = clamp(velocity.x, -MAX_SPEED, MAX_SPEED)
    elif velocity.x != 0:
        # Apply rapid deceleration if changing direction quickly, otherwise normal or air deceleration
        var decel = RAPID_DECELERATION if is_rapid_change else ( GROUND_DECELERATION if is_on_floor() else AIR_DECELERATION)
        decel *= delta
        velocity.x -= decel * sign(velocity.x)
        if abs(velocity.x) <= decel:
            velocity.x = 0

    # Jump Input Handling
    if Input.is_action_just_pressed("jump"):
        jump_buffer_timer = JUMP_BUFFER_TIME

    # Jumping Logic
    if jump_buffer_timer > 0 and is_on_floor():
        velocity.y = -JUMP_FORCE
        jump_buffer_timer = 0

    # Gravity Application
    velocity.y += GRAVITY * delta

    # Character Movement
    move_and_slide()
