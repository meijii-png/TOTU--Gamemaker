//player move speed
move_speed = 1.5;
sprint_speed = 3.0

//acceleration and deceleration
sprint_accel = 0.15;
sprint_decel = 0.10;

//starts walk speed
current_speed = move_speed;

//collision tilemap
collision_tilemap_id = layer_tilemap_get_id("Col_Maze");

//player 
mask_index = spr_player_idle;



//holds player surrent speed
current_speed = move_speed;

//player sprite speed
image_index = spr_player_idle;
image_speed = 0.4;
image_speed = (current_speed / move_speed) * 0.2;

//flash timers
flash_timer = 0;
flash_duration = 14;

//flash cooldowns
flash_cooldown = 0;              
flash_cooldown_time = 20 * room_speed;   

