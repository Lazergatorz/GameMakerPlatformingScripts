///apply_friction(amount)
// gradually slow player when they are not inputing a movement
// input and are on the ground until they come to a stop

var amount = argument[0];

//check to make sure that we are moving
if (hspd != 0)
{
    //make sure that we are moving a substantial amount to even add the friction to
    if ((abs(hspd) - amount) > 0)
    {
        //apply the friction
        hspd -= amount * image_xscale;
    }
    //if our movement is too small, set hspd to 0
    else
    {
        hspd = 0;
    }
}
