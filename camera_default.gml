///camera_default();
if (instance_exists(obj_player))
{
    x += (obj_player.x - x) * 0.05;
    y += (obj_player.y - y) * 0.05;
}
