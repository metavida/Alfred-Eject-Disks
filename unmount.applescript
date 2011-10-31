-- Change these values to match your drive names
set volumeNames to {"Porthos", "Aramis"}

-- Should we display confirmation dialogs?
set showConfirmations to false

repeat with dropped_item_ref in volumeNames
	set volumeName to dropped_item_ref as text
	
	if showConfirmations then
		--display dialog return & dropped_item_ref & return & volumeName & return & "123" giving up after 5
		display dialog "Ejecting  " & dropped_item_ref & "  May take awhile. " giving up after 5
	end if
	
	try
		(* alternative unmount  
        set toDo to "hdiutil unmount /Volumes/" & volumeName
        display dialog "toDo = " & toDo
        set theDisk to do shell script toDo
        display dialog "theDisk = " & theDisk
        *)
		
		tell application "Finder" to eject disk volumeName
	on error what
		display dialog "what = " & what
		log "error occurred " & what
	end try
	
	if showConfirmations then
		display dialog "Hopefully, we ejected " & dropped_item_ref giving up after 5
	end if
	
end repeat