# move-tab

Move position of the current tab to right or left.  
(i.e. swapping with the tab right to or left to the current tab)

## References

[Create quick action that runs apple script and create keyboard shortcut](https://apple.stackexchange.com/questions/175215/how-do-i-assign-a-keyboard-shortcut-to-an-applescript-i-wrote)

## Instructions
1. Create a quick action
    1. Open `Automator` and create `New Document`
    2. Choose `Quick Action` and search `Run AppleScript`
    3. Select `no input` as input and `Safari` as application
    4. Write AppleScript
        - move tab right
            ```
            tell application "Safari"
                tell front window
                    set currentTab to current tab
                    set adjTab to tab after currentTab
                    move currentTab to after adjTab
                    set current tab to adjTab
                end tell
            end tell
            ```
        - move tab left
            ```
            tell application "Safari"
                tell front window
                    set currentTab to current tab
                    set adjTab to tab before currentTab
                    move currentTab to before adjTab
                    set current tab to adjTab
                end tell
            end tell
            ```
    5. Save as `move-tab-right` and `move-tab-left` respectively.
2. Bind the quick actions to keyboard shortcuts
   1. Go to `System Preferences | Keyboard | Shortcuts | Services`
   2. Find the apple scripts and enter keyboard shortcut `⌥ + ⇧ + ]`, `⌥ + ⇧ + [` respectively.
