//draws the player 
draw_self();

//check if flash is active
if (flash_timer > 0) {
    flash_timer--;

    //draws the sprite again in white
    gpu_set_blendmode(bm_add);

    draw_sprite_ext(
        sprite_index,
        image_index,
        x,
        y,
        image_xscale,
        image_yscale,
        image_angle,
        c_white,
        1
    );

    gpu_set_blendmode(bm_normal);
}
