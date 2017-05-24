///wall_slide_check()

//check that we are not in a ledge grab state
if (state != player_ledge_grab_state)
{
    //check that we are meeting a wall 
    if (collision(id, obj_solid, abs(image_xscale - 1)) && !collision(id, obj_water, CENTER))
    {
        //check that we are not touching the ground
        if (!collision(id, obj_solid, DOWN))
        {
            //check that we are falling down
            if (vspd >= 0)
            {
                //first get input
                get_input();
                 
                //check that we are pressing into the wall
                if (right && image_xscale == 1)
                {
                    state = player_wall_slide;
                }
                else if (left && image_xscale == -1)
                {
                    state = player_wall_slide;
                }
                //otherwise, switch to a normal move state
                else
                {
                    state = player_move_state;
                }
            }
        }
    }
}
