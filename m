Received: from thorgal.et.tudelft.nl ([130.161.40.91])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19hZsw-0000pE-9K
	for <linux-mtd@lists.infradead.org>; Tue, 29 Jul 2003 20:11:46 +0100
Mime-Version: 1.0
Message-Id: <a05200f2ebb4c76788fb6@[130.161.115.44]>
Date: Tue, 29 Jul 2003 21:11:39 +0200
To: linux-mtd@lists.infradead.org
From: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
Content-Type: text/plain; charset="us-ascii" ; format="flowed"
Subject: Fix for drivers/mtd/devices/lart.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Here's a trivial patch to get drivers/mtd/devices/lart.c to compile 
again. Please apply.

Index: drivers/mtd/devices/lart.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/devices/lart.c,v
retrieving revision 1.5
diff -u -d -b -r1.5 lart.c
--- drivers/mtd/devices/lart.c  20 May 2003 21:03:07 -0000      1.5
+++ drivers/mtd/devices/lart.c  29 Jul 2003 19:06:49 -0000
@@ -44,6 +44,7 @@
  #include <linux/types.h>
  #include <linux/version.h>
  #include <linux/errno.h>
+#include <linux/init.h>
  #include <linux/mtd/mtd.h>
  #ifdef HAVE_PARTITIONS
  #include <linux/mtd/partitions.h>

Thanks,

JDB.
[who has managed to get one 1Gb NAND Flash to work with the LART. One 
down, seven to go...]
-- 
Three of your friends throw up after eating chicken salad.  Do you think
"I should find more robust friends" or "we should check that refrigerator".
          -- Donald Becker, on vortex-bug, suspecting a network-wide problem.
