Received: from [2002:d556:63ea::1] (helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ABRnr-0007fe-Bm
	for <linux-mtd@lists.infradead.org>; Mon, 20 Oct 2003 05:37:59 +0100
Received: from steelemr-loadb-nat-49.caltech.edu ([131.215.49.69]
	helo=water-ox.its.caltech.edu)
	by phoenix.infradead.org with esmtp (Exim 4.22)	id 1ABRmm-0006cF-Lq
	for linux-mtd@lists.infradead.org; Mon, 20 Oct 2003 05:36:52 +0100
Date: Sun, 19 Oct 2003 21:36:15 -0700 (PDT)
From: "Noah J. Misch" <noah@caltech.edu>
To: dwmw2@redhat.com
Message-ID: <Pine.GSO.4.58.0310171454050.13905@blinky>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: linux-mtd@lists.infradead.org
cc: linux-kernel@vger.kernel.org
Subject: [PATCH] Remove needless and non-portable include in mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello David,

The #include <asm/setup.h> in drivers/mtd/cmdlinepart.c does not appear to
provide any definition this file uses, and it quickly breaks builds on
architectures that lack such a header, including ia64 and sparc.

This applies to your CVS and linux-2.5 BK as of 0700 UTC 10/20/2003 and passes
an allyesconfig on (with unrelated exceptions) i386, ia64, and sparc.  I do not
have the hardware to test it further, but I think the change is straightforward.
Please let me know if you need further information.

I will probably send you at least one more MTD compatibility patch.

Thanks,
Noah

# This is a BitKeeper generated patch for the following project:
# Project Name: Linux kernel tree
# This patch format is intended for GNU patch command version 2.5 or higher.
# This patch includes the following deltas:
#	           ChangeSet	1.1369  -> 1.1370
#	drivers/mtd/cmdlinepart.c	1.5     -> 1.6
#
# The following is the BitKeeper ChangeSet Log
# --------------------------------------------
# 03/10/16	noah@caltech.edu	1.1370
# Remove needless include of asm/setup.h in drivers/mtd/cmdlinepart.c.  This
# was breaking compilation on architectures that lack such a header.
# --------------------------------------------
#
diff -Nru a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
--- a/drivers/mtd/cmdlinepart.c	Fri Oct 17 13:40:56 2003
+++ b/drivers/mtd/cmdlinepart.c	Fri Oct 17 13:40:56 2003
@@ -28,7 +28,6 @@

 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
-#include <asm/setup.h>
 #include <linux/bootmem.h>

 /* error message prefix */
