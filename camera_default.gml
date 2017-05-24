///camera_default();
// call this function inside of the Camera object state update.
// gradually move camera to follow the player instead
// of immediately snapping to them to give a more natural feel.

if (instance_exists(obj_player))
{
    x += (obj_player.x - x) * 0.05;
    y += (obj_player.y - y) * 0.05;
}
