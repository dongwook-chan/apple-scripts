tell application "Safari"
	tell front window
		set currentTab to current tab
		set adjTab to tab after currentTab
		move currentTab to after adjTab
		set current tab to adjTab
	end tell
end tell