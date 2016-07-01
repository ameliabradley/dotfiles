-- Sets up development in iTerm
-- Move to ~/Library/Application\ Support/iTerm/Scripts/
tell application "iTerm"
  tell current window
    tell current session
      write text "cah; dcu"
      write text "make client"
      
      set webSession to (split vertically with default profile)
      tell webSession
        write text "cah; make web"
      end tell
    end tell
  end tell
end tell
