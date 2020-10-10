import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Layout.NoBorders

-- modify default layout hook with 'smartBorders'
myLayoutHook = smartBorders $ layoutHook def

main =
  xmonad
    =<< xmobar
      def
        { borderWidth = 5,
          normalBorderColor = "#073642",
          focusedBorderColor = "#859900",
          layoutHook = myLayoutHook,
          modMask = mod4Mask,
          terminal = "alacritty"
        }
