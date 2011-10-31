-- Change this value
property discName : "Ubuntu_PowerPC_dapper"

on run
   -- debug path...
   set dropped_items to {discName & ":"}
   
   unmountVolume(dropped_items)
   
end run
 

on adding folder items to this_folder after receiving dropped_items
   
   display dialog "dropped files is " & dropped_items & " on folder " & this_folder giving up after 5
   
   unmountVolume(dropped_items)
   
end adding folder items to
 

on unmountVolume(listItems)
   repeat with dropped_item_ref in listItems
      
      set volumeName to dropped_item_ref as text
      set volumeName to text 1 thru -2 of volumeName
      
      -- comment out next line when tired of it.   
      display dialog return & dropped_item_ref & return & volumeName & return & discName & return & "123" giving up after 5
      
      if volumeName is equal to discName then
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
      end if
      
      display dialog "Hopefully, we ejected " & dropped_item_ref giving up after 5
   end repeat
   
end unmountVolume