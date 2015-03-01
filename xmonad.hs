import System.Posix.Env (getEnv)
import Data.Maybe (maybe)

import XMonad
import XMonad.Config.Desktop
import XMonad.Config.Gnome
import XMonad.Config.Kde
import XMonad.Config.Xfce

main = do
  session <- getEnv "DESKTOP_SESSION"
  let config = maybe desktopConfig desktop session
  xmonad $ config {
    modMask = mod1Mask,
    terminal = "gnome-terminal"
  }

desktop "gnome" = gnomeConfig
desktop "kde" = kde4Config
desktop "xfce" = xfceConfig
desktop "xmonad-mate" = gnomeConfig
desktop _ = desktopConfig
