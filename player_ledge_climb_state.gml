///player_ledge_climb_state()
// after player has snapped to the edge, trigger the
// appropriate animation sequence and then move the player
// up onto the platfrom. The rest of this code is executed
// in the Animation End trigger.

//set sprite
sprite_index = spr_pboy_ledge_climb;
image_speed = 0.2;

//wait until end of animation to set to move state
