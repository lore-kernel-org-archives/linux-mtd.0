Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TLFDW-0000iw-T0
 for linux-mtd@lists.infradead.org; Mon, 08 Oct 2012 15:26:04 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [RFC] mtd/uclinux: support ROM and allow passing the base
 address
Date: Mon,  8 Oct 2012 17:25:52 +0200
Message-Id: <1349709952-4332-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, kernel@pengutronix.de,
 Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This allows to put the filesystem at a defined address in ROM allowing
to save more precious RAM.

I think it's save to default to ROM because the intention of using the
uclinux map is to use a romfs and so mtd-ram doesn't give you anything
that mtd-rom doesn't.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mtd/maps/Kconfig   |    2 +-
 drivers/mtd/maps/uclinux.c |   30 +++++++++++++++++++++++-------
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 5ba2458..d945950 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -443,7 +443,7 @@ config MTD_GPIO_ADDR
 
 config MTD_UCLINUX
 	bool "Generic uClinux RAM/ROM filesystem support"
-	depends on MTD_RAM=y && !MMU
+	depends on (MTD_RAM=y || MTD_ROM=y) && !MMU
 	help
 	  Map driver to support image based filesystems for uClinux.
 
diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
index c3bb304..a8a5929 100644
--- a/drivers/mtd/maps/uclinux.c
+++ b/drivers/mtd/maps/uclinux.c
@@ -23,12 +23,13 @@
 
 /****************************************************************************/
 
-struct map_info uclinux_ram_map = {
-	.name = "RAM",
-	.phys = (unsigned long)__bss_stop,
+static struct map_info uclinux_ram_map = {
 	.size = 0,
 };
 
+static unsigned long physaddr = -1;
+module_param(physaddr, ulong, S_IRUGO);
+
 static struct mtd_info *uclinux_ram_mtdinfo;
 
 /****************************************************************************/
@@ -60,11 +61,17 @@ static int __init uclinux_mtd_init(void)
 	struct map_info *mapp;
 
 	mapp = &uclinux_ram_map;
+
+	if (physaddr == -1)
+		mapp->phys = (resource_size_t)__bss_stop;
+	else
+		mapp->phys = physaddr;
+
 	if (!mapp->size)
 		mapp->size = PAGE_ALIGN(ntohl(*((unsigned long *)(mapp->phys + 8))));
 	mapp->bankwidth = 4;
 
-	printk("uclinux[mtd]: RAM probe address=0x%x size=0x%x\n",
+	printk("uclinux[mtd]: RAM/ROM probe address=0x%x size=0x%x\n",
 	       	(int) mapp->phys, (int) mapp->size);
 
 	mapp->virt = ioremap_nocache(mapp->phys, mapp->size);
@@ -76,9 +83,18 @@ static int __init uclinux_mtd_init(void)
 
 	simple_map_init(mapp);
 
-	mtd = do_map_probe("map_ram", mapp);
+	mapp->name = "ROM";
+	mtd = do_map_probe("map_rom", mapp);
+	if (!mtd) {
+		/* fall back to ram probing for compatibility reasons */
+		mapp->name = "RAM";
+		mtd = do_map_probe("map_ram", mapp);
+		if (mtd && IS_ENABLED(CONFIG_MTD_ROM))
+			pr_err("Failed to map rom, but ram succeeded. Please report this issue!\n");
+	}
+
 	if (!mtd) {
-		printk("uclinux[mtd]: failed to find a mapping?\n");
+		printk("uclinux[mtd]: failed to find a rom/ram mapping?\n");
 		iounmap(mapp->virt);
 		return(-ENXIO);
 	}
@@ -115,6 +131,6 @@ module_exit(uclinux_mtd_cleanup);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Greg Ungerer <gerg@snapgear.com>");
-MODULE_DESCRIPTION("Generic RAM based MTD for uClinux");
+MODULE_DESCRIPTION("Generic RAM/ROM based MTD for uClinux");
 
 /****************************************************************************/
-- 
1.7.10.4
