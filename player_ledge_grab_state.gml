///player_ledge_grab_state()
// what to do once the player has snapped to
// the edge of a platform

//ledge grab sprite
sprite_index = spr_pboy_ledge_grab;
image_speed = 0.05;

//let go of ledge
if (down_released)
{
    //slide down
    state = player_wall_slide;
}

//climb up ledge
if ((right_released && image_xscale == 1) || (left_released && image_xscale == -1) || up_released)
{
    if (!k)
    {
        state = player_ledge_climb_state;
    }
    else
    {
        state = player_wall_slide;
    }
}

//hang low from ledge
if (k)
{
    sprite_index = spr_pboy_ledge_grab_low;
    image_speed = 0;
}
