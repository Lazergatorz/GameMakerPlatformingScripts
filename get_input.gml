///get_input

//-------------------------------------------------------------------
//keyboard-----------------------------------------------------------
//-------------------------------------------------------------------

//right
right = keyboard_check(ord('D'));
right_pressed = keyboard_check_pressed(ord('D'));
right_released = keyboard_check_released(ord('D'));

//left
left = keyboard_check(ord('A'));
left_pressed = keyboard_check_pressed(ord('A'));
left_released = keyboard_check_released(ord('A'));

//up
up = keyboard_check(ord('W'));
up_pressed = keyboard_check_pressed(ord('W'));
up_released = keyboard_check_released(ord('W'));

//down
down = keyboard_check(ord('S'));
down_pressed = keyboard_check_pressed(ord('S'));
down_released = keyboard_check_released(ord('S'));

//other inputs
j = keyboard_check(ord('J'));
j_pressed = keyboard_check_pressed(ord('J'));
j_released = keyboard_check_released(ord('J'));
k = keyboard_check(ord('K'));
k_pressed = keyboard_check_pressed(ord('K'));
k_released = keyboard_check_released(ord('K'));
l = keyboard_check(ord('L'));
l_pressed = keyboard_check_pressed(ord('L'));
l_released = keyboard_check_released(ord('L'));
space = keyboard_check(vk_space);
space_pressed = keyboard_check_pressed(vk_space);
space_released = keyboard_check_released(vk_space);

nokey = keyboard_check(vk_nokey);

//-------------------------------------------------------------------
//gamepad------------------------------------------------------------
//-------------------------------------------------------------------

//override controls for a gamepad
var gp_id = 0;
var thresh = .5;

//still needs configuring once i get a gamepad...
if (gamepad_is_connected(gp_id))
{
    right = gamepad_axis_value(gp_id, gp_axislh) > thresh;
    left = gamepad_axis_value(gp_id, gp_axislh) < -thresh;
    up = gamepad_button_check_pressed(gp_id, gp_face1);
    up_release = gamepad_button_check_released(gp_id, gp_face1);
    down = gamepad_axis_value(gp_id, gp_axislv) > thresh;
}
