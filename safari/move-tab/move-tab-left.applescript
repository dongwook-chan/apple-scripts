tell application "Safari"
	tell front window
		set currentTab to current tab
		set adjTab to tab before currentTab
		move currentTab to before adjTab
		set current tab to adjTab
	end tell
end tell