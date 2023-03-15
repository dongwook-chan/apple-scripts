# new-tab-next-to-current

Force new tab to be spawned right next to current tab.

## Method #1: Apple Script

This method is applicable to new tabs spawned by pressing `⌘ + t` only.  

### References

[Write apple script to move new tab next to current one](https://daringfireball.net/2018/12/safari_new_tab_next_to_current_tab)
[Create quick action that runs apple script and create keyboard shortcut](https://apple.stackexchange.com/questions/175215/how-do-i-assign-a-keyboard-shortcut-to-an-applescript-i-wrote)

### Instructions

1. Create a quick action
    1. Open `Automator` and create `New Document`
    2. Choose `Quick Action` and search `Run AppleScript`
    3. Select `no input` as input and `Safari` as application
    4. Write AppleScript
        ```
        tell application "Safari"
            tell front window
                set _old_tab to current tab
                set _new_tab to make new tab at after _old_tab
                set current tab to _new_tab
            end tell
        end tell
        ```
    5. Save as `new-tab-next-to-current`
2. Unbind existing keymap (actually binding to garbage)
   1. Go to `System Preferences | Keyboard | Shortcuts | App Shortcuts`
   2. Select `+` to assign garbage keyboard shortcut to `New Tab` menu for `Safari` application. (I chose `⌥ + ⌃ + ⇧ + ⌘ + F12`)
3. Bind the quick actions to `⌘  + t`
   1. Go to `System Preferences | Keyboard | Shortcuts | Services`
   2. Find `new-tab-next-to-current` and enter keyboard shortcut `⌘  + t`

## Method #2: Debug Menu

This method is applicable to new tabs spawned by ways other than the keyboard shortcut.  

### References

[Enable debug menu](https://www.droidwin.com/enable-safari-debug-menu-in-macos-monterey/)
[Adjust tab ordering](https://www.cultofmac.com/691905/how-to-force-safari-tabs-open-at-end-of-tab-bar/)

### Instructions

1. Go to `System Preferences | Security & Privacy | Privacy | Full Disk Access`
   - Grant access to the terminal app to be used in following steps
1. In the terminal app, execute following command
   - ```defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari.plist IncludeInternalDebugMenu -bool YES```
1. Quit Safari in activity monitor
1. Go to `Safari | Debug | Tab Ordering` and select following menu:
   - `Position of New Tabs | After Current Tab`
   - `Apply Position to Spawned Tabs`
   - `Apply Position to All Blank Tabs`
