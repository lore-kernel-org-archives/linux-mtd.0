From: tglx@linutronix.de (Thomas Gleixner)
Date: Mon, 17 Feb 2003 16:37:42 +0100
Subject: copy filesystem to nand flash without ecc
In-Reply-To: <3E50D76A.40300@netscape.net>
References: <4EF56021.2C81712E.0265FBE9@netscape.net>
 <200302131752.54716.tglx@linutronix.de> <3E50D76A.40300@netscape.net>
Message-ID: <200302171637.42445.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Monday 17 February 2003 13:36, kokseng choo wrote:
> I also notice that nand.h also define the ecc location for
> oobsel=NAND_NONE_OOB, which in fact exactly the same as that of JFFS2.
> Why don't we just add those definitions in  oobconfigs[0] instead of
> zeroing it? Since a nand driver without ECC is really a bad idea which
> makes nand_write thus pwrite becomes useless. Can we just have a default
> "oobsel" during compile time?; which means explicitly
> define oobconfigs[0] to either JFFS2 or YAFFS or zero through
> configuration. By doing that, the mtd user does not have to use different
> API or ioctl to write to the flash. The "cp" utils will just work.
Yep, but you still do not write fs-specific information in the OOB-area, 
except the ecc.
This still solves not the problem to write a fs-image to the chip. Therefor we
need a function, which includes writing of OOB data and filesystem dependent 
oob-layout selection.

> As a mtd user at userspace, ideally I would like to use the same pwrite()
> function for the flash, and I wish I do not have to know what is the
> flash type I am talking to. All I need to know is I am talking to a
> mtd device, and I do not have to know anything about ECC, just let
> the driver handle is implicitly.
That's true if you use NAND without a filesystem.

> I attach a patch which add the default entry for oobconfig[0], I think
> it will help me a bit as a mtd and JFFS2 user at userspace.
> Please comment if it does not make sense, thank you.
I'm not happy with that, as you force it to JFFS2 layout and therefor YAFFS 
users _CANNOT_ use it. I will think about a more flexible solution.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
