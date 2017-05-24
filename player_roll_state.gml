///player_roll_state()
// after the player is running and then dives forward,
// they enter a rolling state

sprite_index = spr_pboy_roll;
image_speed = 0.3;

//if the player is in the air
if (!collision(id, obj_solid, DOWN))
{
    //apply gravity
    vspd += grav;
}

move(obj_solid);
