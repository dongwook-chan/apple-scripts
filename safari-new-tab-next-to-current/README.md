# safari-new-tab-next-to-current

## Method #1: Apple Script

### References

[Write apple script to move new tab next to current one](https://daringfireball.net/2018/12/safari_new_tab_next_to_current_tab)  
[Create quick action that runs apple script and create keyboard shortcut](https://meta.stackexchange.com/questions/334041/how-long-do-the-share-links-last)

### Instructions

1. Open `Automator` and create `New Document`
1. Choose `Quick Action` and search `Run AppleScript`
1. Select `no input` as input and `Safari` as application
1. Write AppleScript
    ```
    tell application "Safari"
        tell front window
            set _old_tab to current tab
            set _new_tab to make new tab at after _old_tab
            set current tab to _new_tab
        end tell
    end tell
    ```
1. Save
1. Go to `System Preferences | Keyboard | Shortcuts | Services`
1. Find the apple script and enter keyboard shortcut `cmd + t`

### Limitations

Tab ordering only applies when opening new tab using `cmd + t` shortcut.  

## Method #2: Debug Menu

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