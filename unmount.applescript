-- Change these values to match your drive names
set volumeNames to {"Porthos", "Aramis"}

repeat with dropped_item_ref in volumeNames	
	set volumeName to dropped_item_ref as text
	--set volumeName to text 1 thru -2 of volumeName
	
	-- comment out next line when tired of it.   
	display dialog return & dropped_item_ref & return & volumeName & return & "123" giving up after 5
	
	display dialog "Ejecting  " & dropped_item_ref & "  May take awhile. " giving up after 5
	
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
	
	display dialog "Hopefully, we ejected " & dropped_item_ref giving up after 5
	
end repeat