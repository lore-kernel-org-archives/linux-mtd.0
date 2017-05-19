Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWh7-0005sr-3D
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:27:09 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 Martin Mares <mj@ucw.cz>, linux-video@atrey.karlin.mff.cuni.cz
Subject: [PATCH 19/29] svga.txt: standardize document format
Date: Thu, 18 May 2017 22:26:03 -0300
Message-Id: <b1f7385c5bbef7e5837cc4733b59277afc0055cd.1495157082.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495157082.git.mchehab@s-opensource.com>
References: <cover.1495157082.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495157082.git.mchehab@s-opensource.com>
References: <cover.1495157082.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Each text file under Documentation follows a different
format. Some doesn't even have titles!

Change its representation to follow the adopted standard,
using ReST markups for it to be parseable by Sphinx:
- Use standard notation for titles;
- Use the note mark;
- mark literal blocks;
- adjust identation;
- mark the table.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/svga.txt | 146 +++++++++++++++++++++++++++----------------------
 1 file changed, 80 insertions(+), 66 deletions(-)

diff --git a/Documentation/svga.txt b/Documentation/svga.txt
index cd66ec836e4f..119f1515b1ac 100644
--- a/Documentation/svga.txt
+++ b/Documentation/svga.txt
@@ -1,24 +1,31 @@
-		       Video Mode Selection Support 2.13
-		    (c) 1995--1999 Martin Mares, <mj@ucw.cz>
---------------------------------------------------------------------------------
+.. include:: <isonum.txt>
 
-1. Intro
-~~~~~~~~
-   This small document describes the "Video Mode Selection" feature which
+=================================
+Video Mode Selection Support 2.13
+=================================
+
+:Copyright: |copy| 1995--1999 Martin Mares, <mj@ucw.cz>
+
+Intro
+~~~~~
+
+This small document describes the "Video Mode Selection" feature which
 allows the use of various special video modes supported by the video BIOS. Due
 to usage of the BIOS, the selection is limited to boot time (before the
 kernel decompression starts) and works only on 80X86 machines.
 
-   **  Short intro for the impatient: Just use vga=ask for the first time,
-   **  enter `scan' on the video mode prompt, pick the mode you want to use,
-   **  remember its mode ID (the four-digit hexadecimal number) and then
-   **  set the vga parameter to this number (converted to decimal first).
+.. note::
 
-   The video mode to be used is selected by a kernel parameter which can be
+   Short intro for the impatient: Just use vga=ask for the first time,
+   enter ``scan`` on the video mode prompt, pick the mode you want to use,
+   remember its mode ID (the four-digit hexadecimal number) and then
+   set the vga parameter to this number (converted to decimal first).
+
+The video mode to be used is selected by a kernel parameter which can be
 specified in the kernel Makefile (the SVGA_MODE=... line) or by the "vga=..."
 option of LILO (or some other boot loader you use) or by the "vidmode" utility
 (present in standard Linux utility packages). You can use the following values
-of this parameter:
+of this parameter::
 
    NORMAL_VGA - Standard 80x25 mode available on all display adapters.
 
@@ -37,77 +44,79 @@ of this parameter:
       for exact meaning of the ID). Warning: rdev and LILO don't support
       hexadecimal numbers -- you have to convert it to decimal manually.
 
-2. Menu
-~~~~~~~
-   The ASK_VGA mode causes the kernel to offer a video mode menu upon
+Menu
+~~~~
+
+The ASK_VGA mode causes the kernel to offer a video mode menu upon
 bootup. It displays a "Press <RETURN> to see video modes available, <SPACE>
 to continue or wait 30 secs" message. If you press <RETURN>, you enter the
 menu, if you press <SPACE> or wait 30 seconds, the kernel will boot up in
 the standard 80x25 mode.
 
-   The menu looks like:
+The menu looks like::
 
-Video adapter: <name-of-detected-video-adapter>
-Mode:    COLSxROWS:
-0  0F00  80x25
-1  0F01  80x50
-2  0F02  80x43
-3  0F03  80x26
-....
-Enter mode number or `scan': <flashing-cursor-here>
+	Video adapter: <name-of-detected-video-adapter>
+	Mode:    COLSxROWS:
+	0  0F00  80x25
+	1  0F01  80x50
+	2  0F02  80x43
+	3  0F03  80x26
+	....
+	Enter mode number or ``scan``: <flashing-cursor-here>
 
-   <name-of-detected-video-adapter> tells what video adapter did Linux detect
+<name-of-detected-video-adapter> tells what video adapter did Linux detect
 -- it's either a generic adapter name (MDA, CGA, HGC, EGA, VGA, VESA VGA [a VGA
 with VESA-compliant BIOS]) or a chipset name (e.g., Trident). Direct detection
 of chipsets is turned off by default (see CONFIG_VIDEO_SVGA in chapter 4 to see
 how to enable it if you really want) as it's inherently unreliable due to
 absolutely insane PC design.
 
-   "0  0F00  80x25" means that the first menu item (the menu items are numbered
+"0  0F00  80x25" means that the first menu item (the menu items are numbered
 from "0" to "9" and from "a" to "z") is a 80x25 mode with ID=0x0f00 (see the
 next section for a description of mode IDs).
 
-   <flashing-cursor-here> encourages you to enter the item number or mode ID
+<flashing-cursor-here> encourages you to enter the item number or mode ID
 you wish to set and press <RETURN>. If the computer complains something about
 "Unknown mode ID", it is trying to tell you that it isn't possible to set such
 a mode. It's also possible to press only <RETURN> which leaves the current mode.
 
-   The mode list usually contains a few basic modes and some VESA modes.  In
+The mode list usually contains a few basic modes and some VESA modes.  In
 case your chipset has been detected, some chipset-specific modes are shown as
 well (some of these might be missing or unusable on your machine as different
 BIOSes are often shipped with the same card and the mode numbers depend purely
 on the VGA BIOS).
 
-   The modes displayed on the menu are partially sorted: The list starts with
+The modes displayed on the menu are partially sorted: The list starts with
 the standard modes (80x25 and 80x50) followed by "special" modes (80x28 and
 80x43), local modes (if the local modes feature is enabled), VESA modes and
 finally SVGA modes for the auto-detected adapter.
 
-   If you are not happy with the mode list offered (e.g., if you think your card
+If you are not happy with the mode list offered (e.g., if you think your card
 is able to do more), you can enter "scan" instead of item number / mode ID.  The
 program will try to ask the BIOS for all possible video mode numbers and test
 what happens then. The screen will be probably flashing wildly for some time and
 strange noises will be heard from inside the monitor and so on and then, really
 all consistent video modes supported by your BIOS will appear (plus maybe some
-`ghost modes'). If you are afraid this could damage your monitor, don't use this
-function.
+``ghost modes``). If you are afraid this could damage your monitor, don't use
+this function.
 
-   After scanning, the mode ordering is a bit different: the auto-detected SVGA
-modes are not listed at all and the modes revealed by `scan' are shown before
+After scanning, the mode ordering is a bit different: the auto-detected SVGA
+modes are not listed at all and the modes revealed by ``scan`` are shown before
 all VESA modes.
 
-3. Mode IDs
-~~~~~~~~~~~
-   Because of the complexity of all the video stuff, the video mode IDs
+Mode IDs
+~~~~~~~~
+
+Because of the complexity of all the video stuff, the video mode IDs
 used here are also a bit complex. A video mode ID is a 16-bit number usually
 expressed in a hexadecimal notation (starting with "0x"). You can set a mode
 by entering its mode directly if you know it even if it isn't shown on the menu.
 
-The ID numbers can be divided to three regions:
+The ID numbers can be divided to those regions::
 
    0x0000 to 0x00ff - menu item references. 0x0000 is the first item. Don't use
 	outside the menu as this can change from boot to boot (especially if you
-	have used the `scan' feature).
+	have used the ``scan`` feature).
 
    0x0100 to 0x017f - standard BIOS modes. The ID is a BIOS video mode number
 	(as presented to INT 10, function 00) increased by 0x0100.
@@ -142,53 +151,54 @@ The ID numbers can be divided to three regions:
 	0xffff	equivalent to 0x0f00 (standard 80x25)
 	0xfffe	equivalent to 0x0f01 (EGA 80x43 or VGA 80x50)
 
-   If you add 0x8000 to the mode ID, the program will try to recalculate
+If you add 0x8000 to the mode ID, the program will try to recalculate
 vertical display timing according to mode parameters, which can be used to
 eliminate some annoying bugs of certain VGA BIOSes (usually those used for
 cards with S3 chipsets and old Cirrus Logic BIOSes) -- mainly extra lines at the
 end of the display.
 
-4. Options
-~~~~~~~~~~
-   Some options can be set in the source text (in arch/i386/boot/video.S).
+Options
+~~~~~~~
+
+Some options can be set in the source text (in arch/i386/boot/video.S).
 All of them are simple #define's -- change them to #undef's when you want to
 switch them off. Currently supported:
 
-   CONFIG_VIDEO_SVGA - enables autodetection of SVGA cards. This is switched
+CONFIG_VIDEO_SVGA - enables autodetection of SVGA cards. This is switched
 off by default as it's a bit unreliable due to terribly bad PC design. If you
-really want to have the adapter autodetected (maybe in case the `scan' feature
+really want to have the adapter autodetected (maybe in case the ``scan`` feature
 doesn't work on your machine), switch this on and don't cry if the results
 are not completely sane. In case you really need this feature, please drop me
 a mail as I think of removing it some day.
 
-   CONFIG_VIDEO_VESA - enables autodetection of VESA modes. If it doesn't work
+CONFIG_VIDEO_VESA - enables autodetection of VESA modes. If it doesn't work
 on your machine (or displays a "Error: Scanning of VESA modes failed" message),
 you can switch it off and report as a bug.
 
-   CONFIG_VIDEO_COMPACT - enables compacting of the video mode list. If there
+CONFIG_VIDEO_COMPACT - enables compacting of the video mode list. If there
 are more modes with the same screen size, only the first one is kept (see above
 for more info on mode ordering). However, in very strange cases it's possible
 that the first "version" of the mode doesn't work although some of the others
 do -- in this case turn this switch off to see the rest.
 
-   CONFIG_VIDEO_RETAIN - enables retaining of screen contents when switching
+CONFIG_VIDEO_RETAIN - enables retaining of screen contents when switching
 video modes. Works only with some boot loaders which leave enough room for the
 buffer. (If you have old LILO, you can adjust heap_end_ptr and loadflags
 in setup.S, but it's better to upgrade the boot loader...)
 
-   CONFIG_VIDEO_LOCAL - enables inclusion of "local modes" in the list. The
+CONFIG_VIDEO_LOCAL - enables inclusion of "local modes" in the list. The
 local modes are added automatically to the beginning of the list not depending
 on hardware configuration. The local modes are listed in the source text after
 the "local_mode_table:" line. The comment before this line describes the format
 of the table (which also includes a video card name to be displayed on the
 top of the menu).
 
-   CONFIG_VIDEO_400_HACK - force setting of 400 scan lines for standard VGA
+CONFIG_VIDEO_400_HACK - force setting of 400 scan lines for standard VGA
 modes. This option is intended to be used on certain buggy BIOSes which draw
 some useless logo using font download and then fail to reset the correct mode.
 Don't use unless needed as it forces resetting the video card.
 
-   CONFIG_VIDEO_GFX_HACK - includes special hack for setting of graphics modes
+CONFIG_VIDEO_GFX_HACK - includes special hack for setting of graphics modes
 to be used later by special drivers (e.g., 800x600 on IBM ThinkPad -- see
 ftp://ftp.phys.keio.ac.jp/pub/XFree86/800x600/XF86Configs/XF86Config.IBM_TP560).
 Allows to set _any_ BIOS mode including graphic ones and forcing specific
@@ -196,33 +206,36 @@ text screen resolution instead of peeking it from BIOS variables. Don't use
 unless you think you know what you're doing. To activate this setup, use
 mode number 0x0f08 (see section 3).
 
-5. Still doesn't work?
-~~~~~~~~~~~~~~~~~~~~~~
-   When the mode detection doesn't work (e.g., the mode list is incorrect or
+Still doesn't work?
+~~~~~~~~~~~~~~~~~~~
+
+When the mode detection doesn't work (e.g., the mode list is incorrect or
 the machine hangs instead of displaying the menu), try to switch off some of
 the configuration options listed in section 4. If it fails, you can still use
 your kernel with the video mode set directly via the kernel parameter.
 
-   In either case, please send me a bug report containing what _exactly_
+In either case, please send me a bug report containing what _exactly_
 happens and how do the configuration switches affect the behaviour of the bug.
 
-   If you start Linux from M$-DOS, you might also use some DOS tools for
+If you start Linux from M$-DOS, you might also use some DOS tools for
 video mode setting. In this case, you must specify the 0x0f04 mode ("leave
 current settings") to Linux, because if you don't and you use any non-standard
 mode, Linux will switch to 80x25 automatically.
 
-   If you set some extended mode and there's one or more extra lines on the
+If you set some extended mode and there's one or more extra lines on the
 bottom of the display containing already scrolled-out text, your VGA BIOS
 contains the most common video BIOS bug called "incorrect vertical display
 end setting". Adding 0x8000 to the mode ID might fix the problem. Unfortunately,
 this must be done manually -- no autodetection mechanisms are available.
 
-   If you have a VGA card and your display still looks as on EGA, your BIOS
+If you have a VGA card and your display still looks as on EGA, your BIOS
 is probably broken and you need to set the CONFIG_VIDEO_400_HACK switch to
 force setting of the correct mode.
 
-6. History
-~~~~~~~~~~
+History
+~~~~~~~
+
+=============== ================================================================
 1.0 (??-Nov-95)	First version supporting all adapters supported by the old
 		setup.S + Cirrus Logic 54XX. Present in some 1.3.4? kernels
 		and then removed due to instability on some machines.
@@ -260,17 +273,18 @@ force setting of the correct mode.
 		  original version written by hhanemaa@cs.ruu.nl, patched by
 		  Jeff Chua, rewritten by me).
 		- Screen store/restore fixed.
-2.8 (14-Apr-96)	- Previous release was not compilable without CONFIG_VIDEO_SVGA.
+2.8 (14-Apr-96) - Previous release was not compilable without CONFIG_VIDEO_SVGA.
 		- Better recognition of text modes during mode scan.
 2.9 (12-May-96)	- Ignored VESA modes 0x80 - 0xff (more VESA BIOS bugs!)
-2.10 (11-Nov-96)- The whole thing made optional.
+2.10(11-Nov-96) - The whole thing made optional.
 		- Added the CONFIG_VIDEO_400_HACK switch.
 		- Added the CONFIG_VIDEO_GFX_HACK switch.
 		- Code cleanup.
-2.11 (03-May-97)- Yet another cleanup, now including also the documentation.
-		- Direct testing of SVGA adapters turned off by default, `scan'
+2.11(03-May-97) - Yet another cleanup, now including also the documentation.
+		- Direct testing of SVGA adapters turned off by default, ``scan``
 		  offered explicitly on the prompt line.
 		- Removed the doc section describing adding of new probing
 		  functions as I try to get rid of _all_ hardware probing here.
-2.12 (25-May-98)- Added support for VESA frame buffer graphics.
-2.13 (14-May-99)- Minor documentation fixes.
+2.12(25-May-98) Added support for VESA frame buffer graphics.
+2.13(14-May-99) Minor documentation fixes.
+=============== ================================================================
-- 
2.9.4
