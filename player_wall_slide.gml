///player_wall_slide()

//set sprite
sprite_index = spr_pboy_wall_slide;
image_speed = 0;
image_index = 0;

//set the new gravity value
var new_grav = grav / 4;

//check if touching the wall
if (collision(id, obj_solid, abs(image_xscale - 1)))
{    
    //if the player is in the air
    if (!collision(id, obj_solid, DOWN))
    {
        //apply gravity
        vspd += new_grav;
    }
    move(obj_solid);  
}
//check if the wall dissapears
else
{
    state = player_move_state;
}

//check if we touch the ground
if (collision(id, obj_solid, DOWN))
{
    state = player_move_state;
}

//check if we press down
get_input();
if (down)
{
    state = player_move_state;
}

//check for wall jump
if (up_pressed)
{
    //check that we are jumping and pressing away from the wall
    if ((right && collision(id, obj_solid, LEFT)) || (left && collision(id, obj_solid, RIGHT)))
    {
        //wall jump
        state = player_wall_jump_state;
        
        //jump up the wall
        vspd = -10;
        
        //push against the wall
        hspd = 6 * -image_xscale;
    }
    else
    {
        //normal wall jump
        state = player_move_state;
        
        //jump up the wall
        vspd = -10;
        
        //push against the wall with each jump
        hspd = 6 * -image_xscale;
    }
}

//check if we should grab edge
if (k && ledge_grab_check())
{
    state = player_ledge_grab_state;   
}
