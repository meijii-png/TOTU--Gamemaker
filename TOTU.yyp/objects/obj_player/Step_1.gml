//player movement with keyboard
var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

var sprinting = keyboard_check(vk_shift);

if (sprinting)
    current_speed = lerp(current_speed, sprint_speed, sprint_accel);
else
    current_speed = lerp(current_speed, move_speed, sprint_accel);



var collision_offset_y = 10; 

//temporary variables for the next position
var next_x = x + _hor * current_speed;
var next_y = y + _ver * current_speed;



//check (y + collision_offset_y)
if (!tile_get_empty(tilemap_get_at_pixel(collision_tilemap_id, next_x, y + collision_offset_y)))
{
    //if we hit a tile, just stop right where we were last frame
    x = xprevious;
}
else
{
    //no collision = move normally
    x = next_x;
}


//check (y + collision_offset_y)
if (!tile_get_empty(tilemap_get_at_pixel(collision_tilemap_id, x, next_y + collision_offset_y)))
{
    //if we hit a tile, stop last frame
    y = yprevious;
}
else
{
    //no collision, move normally
    y = next_y;
}

//press e + flash cooldown
if (keyboard_check_pressed(ord("E")) && flash_cooldown <= 0) {

    //start pulse the pulse
    pulse_speed = 5;

    //starts the white flash
    flash_timer = flash_duration;

    //starts cooldown
    flash_cooldown = flash_cooldown_time;
}

//countdown
if (flash_cooldown > 0) flash_cooldown--;



//sets walking sprites
if (_hor != 0 or _ver != 0)
{
    if (_ver > 0) sprite_index = spr_player_walk_down;
        else if (_ver < 0) sprite_index = spr_player_walk_up;
            else if (_hor > 0) sprite_index = spr_player_walk_right;
                else if (_hor < 0) sprite_index = spr_player_walk_left;
}
else
{
    if (sprite_index == spr_player_walk_right) sprite_index = spr_player_idle_right;
        else if (sprite_index == spr_player_walk_left) sprite_index = spr_player_idle_left;
            else if (sprite_index == spr_player_walk_down) sprite_index = spr_player_idle;
                else if (sprite_index == spr_player_walk_up) sprite_index = spr_player_idle_up;
}

