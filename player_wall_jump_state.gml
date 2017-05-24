///player_wall_jump_state()

//set sprite
sprite_index = spr_pboy_wall_jump;
image_speed = 0;

//if the player is in the air
if (!collision(id, obj_solid, DOWN))
{
    //apply gravity
    vspd += grav;
}

//move with collisions
move(obj_solid);

//check for normal move state
if (vspd >= 0)
{
    state = player_move_state;
}
