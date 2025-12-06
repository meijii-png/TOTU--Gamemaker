/// 1. Ensure fog surface
if (!surface_exists(global.fog_surface)) {
    global.fog_surface = surface_create(room_width, room_height);
    surface_set_target(global.fog_surface);
    draw_clear_alpha(c_black, 1); // full black startup
    surface_reset_target();
}


/// 2. FADE TRAILS WITHOUT MAKING SURFACE TRANSPARENT
surface_set_target(global.fog_surface);

// IMPORTANT: fade using ADDITIVE blending with BLACK
gpu_set_blendmode(bm_add);

draw_set_color(c_black);
draw_set_alpha(0.05);     // controls trail length (0.02 long, 0.1 short)
draw_rectangle(0, 0, room_width, room_height, false);

gpu_set_blendmode(bm_normal);


/// 3. SUBTRACT SOFT VISION HOLE
gpu_set_blendmode(bm_subtract);

draw_set_alpha(1);
draw_set_color(c_white);

var spr = spr_visionGradiant; // transparent gradient sprite
var scale = pulse_current_radius / (sprite_get_width(spr) * 0.5);

draw_sprite_ext(
    spr,
    0,
    obj_player.x,
    obj_player.y,
    scale,
    scale,
    0,
    c_white,
    1
);

gpu_set_blendmode(bm_normal);
surface_reset_target();


/// 4. Draw fog to screen
draw_surface(global.fog_surface, 0, 0);




