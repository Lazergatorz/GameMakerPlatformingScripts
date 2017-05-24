///collision(obj1, obj2, dir)

//check collisions using place_meeting
var obj1 = argument[0];
var obj2 = argument[1];
var dir = argument[2];

//we want to check collisoins with the place_meeting function,
//this can only be called on itself and not on another object, 
//so we do all of this in relation to one of our two objects.
with (obj1)
{
    //check directions
    switch (dir)
    {
        //check to the right
        case RIGHT:
            if (place_meeting(x + 1, y, obj2))
            {
                return true;
            }
            break;
        
        //check above
        case UP:
            if (place_meeting(x, y - 1, obj2))
            {
                return true;
            }
            break;
            
        //check to the left
        case LEFT:
            if (place_meeting(x - 1, y, obj2))
            {
                return true;
            }
            break;
            
        //check down
        case DOWN:
            if (place_meeting(x, y + 1, obj2))
            {
                return true;
            }
            break; 
        //check center
        case CENTER:  
            if (place_meeting(x, y, obj2))
            {
                return true;
            }
            break;
        default:
            return false;
    }
}

//if we reach this point of the code, then none of the
//above code was true, so we return false
return false;
