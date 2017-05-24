///player_move_state()

//change player mask
mask_index = asset_get_index(string(character) + "_idle");

//set spd
var spd = walk_spd;

//if the player is in the air
if (!collision(id, obj_solid, DOWN))
{
    //apply gravity
    vspd += grav;
    
    //falling sprite
    if (vspd > 6 && !place_meeting(x, y + 8, obj_water))
    {
        sprite_index = asset_get_index(string(character) + "_fall");
        image_speed = 0.2;
    }
    
    //jumping sprite
    if (!place_meeting(x, y + 8, obj_water))
    {
        sprite_index = asset_get_index(string(character) + "_jump"); 
        image_speed = 0;
    }
        
    //control the jump height
    if (up_released && vspd < -2)
    {
        vspd = -2;
    }
}   
//if the player is touchign the ground
else
{
    //set the vspd to 0
    vspd = 0;
    
    //jump!
    if (up_pressed)
    {
        vspd = -8;
    }
    
    //if player is sitting still
    if (hspd == 0)
    {
        //check for crouching
        if (down)
        {
            //crouch idle
            sprite_index = asset_get_index(string(character) + "_crouch_idle");
            image_speed = 0.075;
        }
        else
        {
            //normal idle
            sprite_index = asset_get_index(string(character) + "_idle");
            image_speed = 0.1;
        }
    }
    //player is moving left or right
    else
    {
        //check for crouching
        if (down)
        {
            //crouch walking
            sprite_index = asset_get_index(string(character) + "_crouch_walk");
            image_speed = 0.1;
            spd = walk_spd / 4;
        }
        else
        {
            //normal walking
            sprite_index = asset_get_index(string(obj_player.character) + "_run");
            image_speed = 0.2;
            spd = walk_spd;
        }
    }
}

//moving left or right
if (right || left)
{
    //right and left return 1 or 0, so this gets direction and moves it
    //we also apply the acc variable to it, so that we gain speed gradually
    hspd += (right - left) * acc;
    
    //get the direction of our horizontal movement
    hspd_dir = right - left;
    
    //put an upper limit on our hspd
    //runnning speed
    if (j && !down && hspd != 0)
    {   
        image_speed = 0.3;
        spd = run_spd;
    }
    //walking speed
    else if(!j && !down && hspd != 0)
    {
        image_speed = 0.2;
        spd = walk_spd;
    }
    
    //actually move
    if (hspd > spd)
    {
        hspd = spd;
    }
    if (hspd < -spd)
    {
        hspd = -spd;
    }
}
//if we are not moving left or right
else
{
    //see apply friction script
    apply_friction(acc);
}

//dive if running and pressing action key
if (j && k_pressed && !down && hspd != 0 && collision(id, obj_solid, DOWN) && !collision(id, obj_water, CENTER))
{
    //jump a little and move forward
    hspd += image_xscale;
    vspd -= 5;
    
    //set start sprite index
    image_index = 0;
    
    state = player_dive_state;
}

//set swimming state
if (position_meeting(x, y + 1, obj_water))
{
    state = player_water_state;
}

//this sets the sprite to face the correct way based on hspd
//sign of hspd returns 1 or -1, and image_xscale(-1) flips the image horizontally
if (hspd != 0)
{
    image_xscale = sign(hspd);
}

//apply collision checking
move(obj_solid);

//check for ledge grab state
ledge_grab_check();

//check for wall slide.. still need to decide if i want this in the game
//wall_slide_check();

//check for climbing a ladder
climb_ladder_check();

//check for transformation
transformation_check();
