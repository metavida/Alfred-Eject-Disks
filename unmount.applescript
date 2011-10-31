-- Change these values to match your drive names
set volumeNames to {"Porthos", "Aramis"}

(* Icon Creative Commons http://creativecommons.org/licenses/by-nc-nd/3.0/
          by BlueMalboro http://bluemalboro.deviantart.com/art/Micro-Icon-Set-42295693
                     via http://www.mricons.com/icon/120951/128/eject-media-icon
*)

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