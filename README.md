# A Responsive 2D Player Controller for Godot 4

This repository contains a script for a robust and responsive 2D player controller, designed for use in Godot Engine. The script features enhanced movement mechanics, including responsive jumping, rapid acceleration and deceleration for quick direction changes, and a more natural feel in air control.

## Features

- **Responsive Controls:** Quick and responsive character movement.
- **Enhanced Jump Mechanics:** Includes a jump buffer for more forgiving jump inputs.
- **Rapid Direction Change:** Snappy acceleration and deceleration when changing directions.
- **Natural Air Movement:** Different deceleration rates when in the air and on the ground.
- **Gravity:** Consistent gravity for a realistic falling experience.

## Getting Started

### Prerequisites

- Godot Engine (version [specify version here])
- Basic understanding of Godot's scene and scripting systems

### Installation

1. Clone the repository or download the `.gd` script file.
2. Add the script to your player character in your Godot project.

### Usage

Attach the script to a `CharacterBody2D` node in your Godot project. You can adjust the movement parameters at the top of the script to fine-tune the controller's feel to suit your game:

- `MAX_SPEED`: Maximum horizontal speed of the character.
- `ACCELERATION`: Acceleration rate when moving horizontally.
- `GROUND_DECELERATION`: Deceleration rate when on the ground.
- `AIR_DECELERATION`: Deceleration rate when in the air.
- `JUMP_FORCE`: The force applied when jumping.
- `GRAVITY`: Gravity force applied each frame.
- `JUMP_BUFFER_TIME`: Time window for the jump buffer (in seconds).
