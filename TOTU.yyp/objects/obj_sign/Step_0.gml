//object distance to player
var dist = distance_to_object(obj_player);
var interaction_distance = 20;

if (dist < interaction_distance)
{
    if (keyboard_check(ord("F")))
{
        if (instance_exists(obj_controller))
{
    obj_controller.display_sign_text(message_text);
}
    }
}