//cooldown timer
if (pulse_cooldown > 0) {
    pulse_cooldown--;
}

//trigger pulse ONLY if cooldown is finished
if (keyboard_check_pressed(ord("E")) && pulse_cooldown == 0) {
    pulse_speed = 5;
    pulse_cooldown = pulse_cooldown_max; // restart cooldown
}

//update pulsing motion
if (pulse_speed > 0) {
    pulse_angle += pulse_speed;
    pulse_angle = pulse_angle mod 360;

    pulse_current_radius = pulse_base_radius + sin(degtorad(pulse_angle)) * pulse_amplitude;

    //end pulse after full cycle
    if (pulse_angle >= 355 && pulse_angle <= 360) {
        pulse_speed = 0;
        pulse_angle = 0;
        pulse_current_radius = pulse_base_radius;
    }
}
