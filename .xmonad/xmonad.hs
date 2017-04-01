import XMonad
import XMonad.Core 
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Prompt.Man
import XMonad.Layout
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.SetWMName
import XMonad.Util.EZConfig
import XMonad.Util.Run
import Graphics.X11.Xlib
import qualified Data.Map as M
import System.IO
--Circa 2011
-- Font
myFont = "-*-terminus-*-*-*-*-13-*-*-*-*-*-iso8859-*"
--myFont = "DejaVu Serif Mono *-*-*-*-8-*-*-*-*-*-utf-8-*"
-- Colors
myBgBgColor = "black"
myFgColor = "gray80"
myBgColor = "gray20"
myHighlightedFgColor = "white"
myHighlightedBgColor = "gray90"
 
myActiveBorderColor   = "#871D00"
myInactiveBorderColor = "#008712"
 
myCurrentWsFgColor = "white"
myCurrentWsBgColor = "gray40"
myVisibleWsFgColor = "gray80"
myVisibleWsBgColor = "gray20"
myHiddenWsFgColor  = "gray80"
myHiddenEmptyWsFgColor = "gray50"
myUrgentWsBgColor = "brown"
myTitleFgColor = "white"
 
myUrgencyHintFgColor = "white"
myUrgencyHintBgColor = "brown"


customPP :: PP
customPP = defaultPP { ppCurrent = xmobarColor "red" "" . wrap "" ""
                     , ppTitle   = xmobarColor "#AAEE22"  "" . shorten 90
                    -- , ppLayout  = xmobarColor "lightblue" ""  . shorten 0
                     , ppLayout = const ""
                     , ppVisible = wrap "(" ")"
                    -- this used to be red numbers and yellow brackets
                     , ppUrgent  = xmobarColor "#EE2E22" "yellow"
                     }

myLogHook dest = dynamicLogWithPP customPP { ppOutput = hPutStrLn dest }

-- Layouts
myLayoutHook = smartBorders $ (tiled ||| Mirror tiled ||| Full)
  where
    tiled = spacing 5 $ Tall 1 (3/100) (1/2)
    nmaster = 1
    delta = 3/100
    ratio = 1/2

main = do
xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc"
xmonad $ defaultConfig
    { 
      manageHook = manageDocks <+> manageHook defaultConfig
    , layoutHook = avoidStruts $ myLayoutHook 
    , logHook = myLogHook xmproc
    , normalBorderColor  = myInactiveBorderColor
    , focusedBorderColor = myActiveBorderColor
    } `additionalKeys`
    --[ ((mod1Mask, xK_p),spawn "dmenu_run -b -nb '#040404' -nf '#FF6A00' -sb '#050510' -sf '#AAEE22'") 
    [ ((mod1Mask, xK_p),spawn "dmenu_run -nb 'grey10' -nf 'grey90' -sb 'grey20' -sf '#AAEE22'") 
    , ((mod4Mask, xK_w),spawn "feh --bg-scale ~/Walls/wall.jpg")
    , ((mod4Mask, xK_f),spawn "firefox")
    , ((mod1Mask, xK_f),spawn "pcmanfm")
    , ((mod4Mask, xK_s),spawn "subl")
    , ((mod1Mask .|. shiftMask, xK_t), spawn "xfce4-terminal")
    , ((mod1Mask .|. shiftMask, xK_x), spawn "uxterm")
    , ((mod1Mask .|. shiftMask, xK_f), spawn "tabbed surf -e")
    , ((mod1Mask .|. shiftMask, xK_l),spawn "slock")
    ]

