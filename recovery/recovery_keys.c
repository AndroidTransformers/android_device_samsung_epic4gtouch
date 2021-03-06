#include <linux/input.h>

#include "recovery_ui.h"
#include "common.h"
#include "extendedcommands.h"


int device_toggle_display(volatile char* key_pressed, int key_code) {
    int alt = key_pressed[KEY_LEFTALT] || key_pressed[KEY_RIGHTALT];
    if (alt && key_code == KEY_L)
        return 1;
    // allow toggling of the display if the correct key is pressed, and the display toggle is allowed or the display is currently off
    if (ui_get_showing_back_button()) {
        return 0;
        //return get_allow_toggle_display() && (key_code == KEY_HOME || key_code == KEY_MENU || key_code == KEY_END);
    }
    return get_allow_toggle_display() && (key_code == 0x102 || key_code == 0x139 || key_code == KEY_POWER || key_code == KEY_END);
}

int device_handle_key(int key_code, int visible) {
    if (visible) {
        switch (key_code) {
            case KEY_CAPSLOCK:
            case KEY_DOWN:
            case 0x114:
                return HIGHLIGHT_DOWN;
            case 0x139:
                return NO_ACTION;
            case KEY_LEFTSHIFT:
            case KEY_UP:
            case 0x115:
                return HIGHLIGHT_UP;
            case 0x102:
                return SELECT_ITEM;
            case 0x158:
                 return GO_BACK;
            case KEY_LEFTBRACE:
            case KEY_ENTER:
            case BTN_MOUSE:
            case KEY_CAMERA:
            case KEY_F21:
            case KEY_SEND:            
            case KEY_END:
            case KEY_BACKSPACE:
            case KEY_SEARCH:
            case 0x116:
                return GO_BACK;
        }
    }

    return NO_ACTION;
}
