import qualified Data.Map as M
import XMonad
import XMonad.Actions.WindowBringer
import XMonad.Hooks.DynamicLog
import XMonad.Layout.NoBorders

-- modify default layout hook with 'smartBorders'
myLayoutHook = smartBorders $ layoutHook def

myKeys conf@(XConfig {XMonad.modMask = modm}) =
  M.fromList
    [ ((modm .|. shiftMask, xK_g), gotoMenu),
      ((modm .|. shiftMask, xK_b), bringMenu)
    ]

newKeys conf = myKeys conf `M.union` keys def conf

main =
  xmonad
    =<< xmobar
      def
        { borderWidth = 5,
          normalBorderColor = "#073642",
          focusedBorderColor = "#859900",
          layoutHook = myLayoutHook,
          modMask = mod4Mask,
          terminal = "alacritty",
          keys = newKeys
        }
