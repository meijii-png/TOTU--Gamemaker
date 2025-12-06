global.fog_surface = -1;
fog_decay = 0.005;

// Pulse effect
pulse_base_radius = 25;   //base radius in pixels
pulse_current_radius = pulse_base_radius;
pulse_speed = 0;
pulse_amplitude = 40;     //how much the circle grows/shrinks
pulse_angle = 0;
// Pulse cooldown
pulse_cooldown = 0;   //counts frames until ready again
pulse_cooldown_max = room_speed * 20; //20 seconds
