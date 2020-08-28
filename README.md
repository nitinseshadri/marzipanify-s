# marzipanify-s

A modified version of marzipanify (by @stroughtonsmith) that allows bringup of the iOS 12 and 13 Contacts apps from the iOS Simulator on macOS Catalina. **This tool is unsupported.**

## How it works

I modified marzipanify by doing the following:

* Swizzle-implementing some system colors from UIColor and Private API selectors from "CoreRoutine.framework" that no longer exist in iOS 13.
* Swizzle-implementing missing selectors in UIScene.
* Miscellaneous fixes to accommodate changes to the Mac Catalyst/Marzipan/iOSMac runtime in Catalina (run a diff between main.orig.m and main.m to see them).

Much of this work was done by studying the iOS 12 and 13 runtime headers, which are available online.

## Howto

Before you begin, copy Contacts.app from the iOS 12 or 13 Simulator runtime to a directory where you have write access. How to do this is left as an exercise to the reader.

From here, the steps are:

1. `git clone <repo-url>`
2. `cd /path/to/repo/`
3. `make`
4. `./marzipanify /path/to/Contacts.app` (You do not need to set INJECT_MARZIPAN_GLUE to 1; this is assumed by default now.)
5. `make codesign` (Catalina has more restrictions on signed code. This command ad-hoc signs the app bundle and all dylibs. If you do not run this, your app will crash on launch.)
6. Run your app!
