import XMonad
import XMonad.Actions.CycleWS
import XMonad.Config.Gnome
import XMonad.Util.EZConfig

import XMonad.ManageHook
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders

import qualified XMonad.StackSet as W
import Control.Monad (liftM2)

myManageHook :: [ManageHook]
myManageHook = [ resource  =? "Do"   --> doIgnore,
		 className =? "Pidgin" --> viewShift "9",
		 className =? "Chromium-browser" --> viewShift "8"
		]
		where viewShift = doF . liftM2 (.) W.greedyView W.shift

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

