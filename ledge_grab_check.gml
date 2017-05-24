///ledge_grab_check()
// check for platform edge while falling to determine if we
// should snap to the edge

//check that we are falling
var falling = y > yprevious;
//check that there wasnt a wall where we were
var wasnt_wall = !position_meeting(x + 17 * image_xscale, yprevious - 16, obj_solid);
//and that there is a wall where we are
var is_wall = position_meeting(x + 17 * image_xscale, y, obj_solid);

//ledge grab
if (falling && wasnt_wall && is_wall && up && !collision(id, obj_water, CENTER))
{
    //reset hspd and vspd to prevent weird speed issues
    hspd = 0;
    vspd = 0;
    
    //move against the ledge so that there is no awkward space
    while (!place_meeting(x + image_xscale, y, obj_solid))
    {
        //again, this is either 1 or -1
        x += image_xscale;
    }
    
    //make sure we are the right height so that our ledge grab doesnt look awkward 
    while (position_meeting(x + 17 * image_xscale, y - 1, obj_solid))
    {
        y -= 1;
    }
    
    //now switch to ledge grab state
    state = player_ledge_grab_state;
}
