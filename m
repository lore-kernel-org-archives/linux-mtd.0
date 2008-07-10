Received: from sullivan.realtime.net ([205.238.132.226])
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1KH3rO-00007f-Gj
	for linux-mtd@lists.infradead.org; Thu, 10 Jul 2008 21:39:33 +0000
Date: Thu, 10 Jul 2008 16:14:18 -0500 (CDT)
From: Milton Miller <miltonm@bga.com>
Sender: Milton Miller <miltonm@realtime.net>
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
In-Reply-To: <for-27-patch1-0@bga.com>
Message-Id: <for-27-patch1-00@bga.com>
Subject: mtd: remove __PPC__ hardcoded address from nand/diskonchip and
	devices/docprobe
Cc: linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Such a hardcoded address can cause a checkstop or machine check if
the driver is in the kernel but the address is not acknowledged.

Both drivers allow an address to be specified as either a module
parameter or config option.   Any future powerpc board should either
use one of these methods or find the address in the device tree.

Signed-off-by: Milton Miller <miltonm@bga.com>
---
There is no powerpc defconfig that sets either CONFIG_DOC200{0,1*} nor
CONFIG_MTD_NAND_DISKONCHIP in next-20080710.

diff --git a/drivers/mtd/devices/docprobe.c b/drivers/mtd/devices/docprobe.c
index 6e5d811..6e62922 100644
--- a/drivers/mtd/devices/docprobe.c
+++ b/drivers/mtd/devices/docprobe.c
@@ -76,8 +76,6 @@ static unsigned long __initdata doc_locations[] = {
 	0xe0000, 0xe2000, 0xe4000, 0xe6000,
 	0xe8000, 0xea000, 0xec000, 0xee000,
 #endif /*  CONFIG_MTD_DOCPROBE_HIGH */
-#elif defined(__PPC__)
-	0xe4000000,
 #else
 #warning Unknown architecture for DiskOnChip. No default probe locations defined
 #endif
diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index cd4393c..765d4f0 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -52,8 +52,6 @@ static unsigned long __initdata doc_locations[] = {
 	0xe0000, 0xe2000, 0xe4000, 0xe6000,
 	0xe8000, 0xea000, 0xec000, 0xee000,
 #endif /*  CONFIG_MTD_DOCPROBE_HIGH */
-#elif defined(__PPC__)
-	0xe4000000,
 #else
 #warning Unknown architecture for DiskOnChip. No default probe locations defined
 #endif
