Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13lwLC-0001ol-00
	for mtd-list@infradead.org; Wed, 18 Oct 2000 17:45:22 +0100
Received: from ip-207-155-53-190.keyway.net ([207.155.53.190] helo=localhost.localdomain)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13lwL8-0001oe-00
	for mtd@infradead.org; Wed, 18 Oct 2000 17:45:21 +0100
Date: Wed, 18 Oct 2000 09:48:21 -0700
From: Kevin Moore <kevin@moore-and-moore.com>
To: mtd@infradead.org
Cc: Volker Sonn <mlist@sonn-online.de>,
        Alessandro GARDICH <gremlin@gremlin.it>
Subject: Kernel change for booting off DOC 2000 and Millenium
Message-ID: <20001018094821.A29254@flapjack>
Reply-To: kevin@moore-and-moore.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

My problem with "I have no root and I want to scream" during boot-up
using DOC Millenium was pleasantly easy to solve.  The following
kernel patch adds "/dev/nftla" to the list of devices which can
be specified as a root device on the command line.  Without this,
the kernel is unable to parse "root=/dev/nftla1" and can't find
it's root filesystem (for any DOC).  Booting using an rdev'ed
kernel should work without any kernel change, since it doesn't rely
on parsing the kernel command line options.

--- linux-2.4.0-test9/init/main.c	Fri Oct  6 23:20:25 2000
+++ linux-2.4.0-test9-working/init/main.c	Wed Oct 18 09:08:58 2000
@@ -170,6 +170,7 @@
 	{ "hdr",     0x5A40 },
 	{ "hds",     0x5B00 },
 	{ "hdt",     0x5B40 },
+	{ "nftla",   0x5D00 },
 	{ "sda",     0x0800 },
 	{ "sdb",     0x0810 },
 	{ "sdc",     0x0820 },

{"nftlb", 0x5d10}, etc. can be added to allow using DOC's other than
the first as a root filesystem.

Also, to those who've been having trouble with getting DOC 2000's
to work with the grub - the grub patches for DOC 2000 support have
a lot of parameters hard-wired, and undoubtedly fail with chips
different than the ones used in development, so that could be the
cause of your trouble.  Check nand.h (latest CVS it's nand_ids.h),
I believe the grub patches for DOC 2000 have the last 3 columns
of nand_flash_ids hard-coded as "1, 3, 0x2000" (page256 true,
pageadrlen=3, and erasesize=0x2000).  Not positive about those though,
as I'm going from memory (certain of the 0x2000 erasesize).

I'm planning to get the general DOC support from the kernel driver
into grub when I have time, but this is a spare-time project, so
I'm not sure when that will be.

-- Kevin



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
