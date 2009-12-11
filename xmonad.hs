import XMonad
import XMonad.Actions.CycleWS
import XMonad.Config.Gnome
import XMonad.Util.EZConfig

import XMonad.ManageHook
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders

myManageHook :: [ManageHook]
myManageHook = [ resource  =? "Do"   --> doIgnore ]

main = do 
xmonad $ gnomeConfig { 
	modMask = mod4Mask,
	layoutHook = smartBorders . avoidStruts  $  layoutHook gnomeConfig,
	manageHook = manageHook gnomeConfig <+> composeAll myManageHook
} `additionalKeysP`

        [ ("M-<L>", prevWS )
        , ("M-<R>", nextWS )
        , ("M-S-<L>", shiftToPrev)
        , ("M-S-<R>", shiftToNext)
        ]

