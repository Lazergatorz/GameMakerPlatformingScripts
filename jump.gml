///jump(condition)
// create different attributes for jumping such as normal jumps
// wall jumps and other special jumps

//condition: normal jump, wall jump, etc...
cond = argument[0];

//normal jump
if (cond == "norm")
{
    //jumping sprite
    sprite_index = spr_player_jump; 
    image_speed = 0;
        
    //control the jump height
    if (up_released && vspd < -2)
    {
        vspd = -2;
    }
}

//wall jump
if (cond == "wall")
{
    //jumping sprite
    sprite_index = spr_player_wall_jump; 
    image_speed = 0;
        
    //control the jump height
    if (up_released && vspd < -2)
    {
        vspd = -2;
    } 
}
