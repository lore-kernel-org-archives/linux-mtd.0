Received: from [2002:d556:63ea::1] (helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19zirU-0004Y8-Qq
	for <linux-mtd@lists.infradead.org>; Wed, 17 Sep 2003 21:25:16 +0100
Received: from fw.osdl.org ([65.172.181.6] helo=mail.osdl.org)
	by phoenix.infradead.org with esmtp (Exim 4.22)
	id 19ziqr-0001Kp-3C
	for linux-mtd@lists.infradead.org; Wed, 17 Sep 2003 21:24:37 +0100
Date: Wed, 17 Sep 2003 13:17:39 -0700
From: "Randy.Dunlap" <rddunlap@osdl.org>
To: dwmw2@redhat.com
Message-Id: <20030917131739.12ad6cec.rddunlap@osdl.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: [PATCH] janitor: remove unneeded includes (MTD)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,
Please apply to 2.6.0-test5-current.
Thanks.


From: rwhron@earthlink.net
Subject: [Kernel-janitors] [PATCH] drivers/mtd version cleanup


version.h cleanup and duplicate #includes removed.
test compiled on 2.6.0-test5-bk2 x86.

diff -Nur linux-2.6.0-test5-bk2/drivers/mtd/chips/cfi_cmdset_0020.c linux/drivers/mtd/chips/cfi_cmdset_0020.c


 linux-260-test5-kj-rddunlap/drivers/mtd/chips/cfi_cmdset_0020.c |    2 +-
 linux-260-test5-kj-rddunlap/drivers/mtd/chips/gen_probe.c       |    1 -
 linux-260-test5-kj-rddunlap/drivers/mtd/chips/map_rom.c         |    1 -
 linux-260-test5-kj-rddunlap/drivers/mtd/chips/sharp.c           |    1 -
 linux-260-test5-kj-rddunlap/drivers/mtd/devices/lart.c          |    1 -
 linux-260-test5-kj-rddunlap/drivers/mtd/devices/pmc551.c        |    1 +
 linux-260-test5-kj-rddunlap/drivers/mtd/maps/sun_uflash.c       |    1 -
 linux-260-test5-kj-rddunlap/drivers/mtd/mtdcore.c               |    1 +
 linux-260-test5-kj-rddunlap/drivers/mtd/nand/autcpu12.c         |    1 +
 9 files changed, 4 insertions(+), 6 deletions(-)

diff -puN drivers/mtd/chips/cfi_cmdset_0020.c~version_drivers_mtd drivers/mtd/chips/cfi_cmdset_0020.c
--- linux-260-test5-kj/drivers/mtd/chips/cfi_cmdset_0020.c~version_drivers_mtd	2003-09-15 21:56:20.000000000 -0700
+++ linux-260-test5-kj-rddunlap/drivers/mtd/chips/cfi_cmdset_0020.c	2003-09-15 21:56:20.000000000 -0700
@@ -17,6 +17,7 @@
  *	- added a writev function
  */
 
+#include <linux/version.h>
 #include <linux/module.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
@@ -26,7 +27,6 @@
 #include <asm/byteorder.h>
 
 #include <linux/errno.h>
-#include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
diff -puN drivers/mtd/chips/gen_probe.c~version_drivers_mtd drivers/mtd/chips/gen_probe.c
--- linux-260-test5-kj/drivers/mtd/chips/gen_probe.c~version_drivers_mtd	2003-09-15 21:56:20.000000000 -0700
+++ linux-260-test5-kj-rddunlap/drivers/mtd/chips/gen_probe.c	2003-09-15 21:56:20.000000000 -0700
@@ -11,7 +11,6 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/cfi.h>
-#include <linux/mtd/mtd.h>
 #include <linux/mtd/gen_probe.h>
 
 static struct mtd_info *check_cmd_set(struct map_info *, int);
diff -puN drivers/mtd/chips/map_rom.c~version_drivers_mtd drivers/mtd/chips/map_rom.c
--- linux-260-test5-kj/drivers/mtd/chips/map_rom.c~version_drivers_mtd	2003-09-15 21:56:20.000000000 -0700
+++ linux-260-test5-kj-rddunlap/drivers/mtd/chips/map_rom.c	2003-09-15 21:56:20.000000000 -0700
@@ -4,7 +4,6 @@
  * $Id: map_rom.c,v 1.20 2003/05/28 12:51:49 dwmw2 Exp $
  */
 
-#include <linux/version.h>
 #include <linux/module.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
diff -puN drivers/mtd/chips/sharp.c~version_drivers_mtd drivers/mtd/chips/sharp.c
--- linux-260-test5-kj/drivers/mtd/chips/sharp.c~version_drivers_mtd	2003-09-15 21:56:20.000000000 -0700
+++ linux-260-test5-kj-rddunlap/drivers/mtd/chips/sharp.c	2003-09-15 21:56:20.000000000 -0700
@@ -22,7 +22,6 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/version.h>
 #include <linux/types.h>
 #include <linux/sched.h>
 #include <linux/errno.h>
diff -puN drivers/mtd/devices/lart.c~version_drivers_mtd drivers/mtd/devices/lart.c
--- linux-260-test5-kj/drivers/mtd/devices/lart.c~version_drivers_mtd	2003-09-15 21:56:20.000000000 -0700
+++ linux-260-test5-kj-rddunlap/drivers/mtd/devices/lart.c	2003-09-15 21:56:20.000000000 -0700
@@ -42,7 +42,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/types.h>
-#include <linux/version.h>
 #include <linux/errno.h>
 #include <linux/mtd/mtd.h>
 #ifdef HAVE_PARTITIONS
diff -puN drivers/mtd/devices/pmc551.c~version_drivers_mtd drivers/mtd/devices/pmc551.c
--- linux-260-test5-kj/drivers/mtd/devices/pmc551.c~version_drivers_mtd	2003-09-15 21:56:20.000000000 -0700
+++ linux-260-test5-kj-rddunlap/drivers/mtd/devices/pmc551.c	2003-09-15 21:56:20.000000000 -0700
@@ -82,6 +82,7 @@
  *       * Comb the init routine.  It's still a bit cludgy on a few things.
  */
 
+#include <linux/version.h>
 #include <linux/config.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
diff -puN drivers/mtd/maps/sun_uflash.c~version_drivers_mtd drivers/mtd/maps/sun_uflash.c
--- linux-260-test5-kj/drivers/mtd/maps/sun_uflash.c~version_drivers_mtd	2003-09-15 21:56:20.000000000 -0700
+++ linux-260-test5-kj-rddunlap/drivers/mtd/maps/sun_uflash.c	2003-09-15 21:56:20.000000000 -0700
@@ -12,7 +12,6 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/version.h>
 #include <linux/fs.h>
 #include <linux/errno.h>
 #include <linux/init.h>
diff -puN drivers/mtd/mtdcore.c~version_drivers_mtd drivers/mtd/mtdcore.c
--- linux-260-test5-kj/drivers/mtd/mtdcore.c~version_drivers_mtd	2003-09-15 21:56:20.000000000 -0700
+++ linux-260-test5-kj-rddunlap/drivers/mtd/mtdcore.c	2003-09-15 21:56:20.000000000 -0700
@@ -6,6 +6,7 @@
  *
  */
 
+#include <linux/version.h>
 #include <linux/config.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
diff -puN drivers/mtd/nand/autcpu12.c~version_drivers_mtd drivers/mtd/nand/autcpu12.c
--- linux-260-test5-kj/drivers/mtd/nand/autcpu12.c~version_drivers_mtd	2003-09-15 21:56:20.000000000 -0700
+++ linux-260-test5-kj-rddunlap/drivers/mtd/nand/autcpu12.c	2003-09-15 21:56:20.000000000 -0700
@@ -27,6 +27,7 @@
  *	10-06-2002 TG	128K card support added
  */
 
+#include <linux/version.h>
 #include <linux/slab.h>
 #include <linux/init.h>
 #include <linux/module.h>

_


--
~Randy
