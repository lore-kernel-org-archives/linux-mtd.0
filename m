From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 05/10] mtd: maps: kill the rpxlite map driver
Date: Tue, 12 Mar 2013 13:14:10 +0200
Message-Id: <1363086855-2847-6-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1363086855-2847-1-git-send-email-dedekind1@gmail.com>
References: <1363086855-2847-1-git-send-email-dedekind1@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-m68k@lists.linux-m68k.org, linux-pcmcia@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

This driver depends on the CONFIG_RPXCLASSIC and CONFIG_RPXLITE symbols, which
are not defined anywhere, and this means that this driver is dead.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: linux-pcmcia@lists.infradead.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
---
 drivers/mtd/maps/Kconfig   |   10 -------
 drivers/mtd/maps/Makefile  |    1 -
 drivers/mtd/maps/rpxlite.c |   64 --------------------------------------------
 3 files changed, 75 deletions(-)
 delete mode 100644 drivers/mtd/maps/rpxlite.c

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 300761f..3fe3216 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -284,16 +284,6 @@ config MTD_TQM8XXL
 	  code to communicate with the chips on the TQM8xxL board. More at
 	  <http://www.denx.de/wiki/PPCEmbedded/>.
 
-config MTD_RPXLITE
-	tristate "CFI Flash device mapped on RPX Lite or CLLF"
-	depends on MTD_CFI && (RPXCLASSIC || RPXLITE)
-	help
-	  The RPXLite PowerPC board has CFI-compliant chips mapped in
-	  a strange sparse mapping. This 'mapping' driver supports that
-	  arrangement, allowing the CFI probe and command set driver code
-	  to communicate with the chips on the RPXLite board. More at
-	  <http://www.embeddedplanet.com/>.
-
 config MTD_CFI_FLAGADM
 	tristate "CFI Flash device mapping on FlagaDM"
 	depends on 8xx && MTD_CFI
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index b61ea98..8e2b289 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -23,7 +23,6 @@ obj-$(CONFIG_MTD_PHYSMAP_OF)	+= physmap_of.o
 obj-$(CONFIG_MTD_PISMO)		+= pismo.o
 obj-$(CONFIG_MTD_PMC_MSP_EVM)   += pmcmsp-flash.o
 obj-$(CONFIG_MTD_PCMCIA)	+= pcmciamtd.o
-obj-$(CONFIG_MTD_RPXLITE)	+= rpxlite.o
 obj-$(CONFIG_MTD_TQM8XXL)	+= tqm8xxl.o
 obj-$(CONFIG_MTD_SA1100)	+= sa1100-flash.o
 obj-$(CONFIG_MTD_SBC_GXX)	+= sbc_gxx.o
diff --git a/drivers/mtd/maps/rpxlite.c b/drivers/mtd/maps/rpxlite.c
deleted file mode 100644
index ed88225..0000000
--- a/drivers/mtd/maps/rpxlite.c
+++ /dev/null
@@ -1,64 +0,0 @@
-/*
- * Handle mapping of the flash on the RPX Lite and CLLF boards
- */
-
-#include <linux/module.h>
-#include <linux/types.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <asm/io.h>
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/map.h>
-
-
-#define WINDOW_ADDR 0xfe000000
-#define WINDOW_SIZE 0x800000
-
-static struct mtd_info *mymtd;
-
-static struct map_info rpxlite_map = {
-	.name = "RPX",
-	.size = WINDOW_SIZE,
-	.bankwidth = 4,
-	.phys = WINDOW_ADDR,
-};
-
-static int __init init_rpxlite(void)
-{
-	printk(KERN_NOTICE "RPX Lite or CLLF flash device: %x at %x\n", WINDOW_SIZE*4, WINDOW_ADDR);
-	rpxlite_map.virt = ioremap(WINDOW_ADDR, WINDOW_SIZE * 4);
-
-	if (!rpxlite_map.virt) {
-		printk("Failed to ioremap\n");
-		return -EIO;
-	}
-	simple_map_init(&rpxlite_map);
-	mymtd = do_map_probe("cfi_probe", &rpxlite_map);
-	if (mymtd) {
-		mymtd->owner = THIS_MODULE;
-		mtd_device_register(mymtd, NULL, 0);
-		return 0;
-	}
-
-	iounmap((void *)rpxlite_map.virt);
-	return -ENXIO;
-}
-
-static void __exit cleanup_rpxlite(void)
-{
-	if (mymtd) {
-		mtd_device_unregister(mymtd);
-		map_destroy(mymtd);
-	}
-	if (rpxlite_map.virt) {
-		iounmap((void *)rpxlite_map.virt);
-		rpxlite_map.virt = 0;
-	}
-}
-
-module_init(init_rpxlite);
-module_exit(cleanup_rpxlite);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Arnold Christensen <AKC@pel.dk>");
-MODULE_DESCRIPTION("MTD map driver for RPX Lite and CLLF boards");
-- 
1.7.10.4
