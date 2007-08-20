Received: from nf-out-0910.google.com ([64.233.182.191])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IN0og-0007S2-TT
	for linux-mtd@lists.infradead.org; Mon, 20 Aug 2007 02:32:49 -0400
Received: by nf-out-0910.google.com with SMTP id h3so574198nfh
	for <linux-mtd@lists.infradead.org>;
	Sun, 19 Aug 2007 23:32:44 -0700 (PDT)
To: dwmw2@infradead.org
Subject: [PATCH] Magic Panel (SH3-DSP board) MTD mapping
Date: Mon, 20 Aug 2007 08:37:08 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200708200837.08856.super.firetwister@gmail.com>
From: Markus Brunner <super.firetwister@googlemail.com>
Cc: Mark Jonas <toertel@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

this adds a MTD mapping for the onboard NOR flash on the Magic Panel R2. 
The mapping module is based on the solutionengine mapping module.

How are the chances for inclusion in 2.6.24?

Signed-off by: Markus Brunner <super.firetwister@gmail.com>
Signed-off by: Mark Jonas <toertel@gmail.com>
---
 Kconfig        |    6 +++
 Makefile       |    1
 magicpanelr2.c |   98 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 105 insertions(+)

--- sh-2.6-intc/drivers/mtd/maps/Kconfig	2007-07-31 12:11:48.000000000 +0200
+++ sh-2.6/drivers/mtd/maps/Kconfig	2007-08-16 16:24:29.000000000 +0200
@@ -407,6 +407,12 @@ config MTD_SOLUTIONENGINE
 	  This enables access to the flash chips on the Hitachi SolutionEngine and
 	  similar boards. Say 'Y' if you are building a kernel for such a board.
 
+config MTD_MAGICPANELR2
+	tristate "CFI Flash device mapped on Magic Panel R2"
+	depends on SUPERH && MTD_CFI && MTD_REDBOOT_PARTS
+	help
+	  This enables access to the flash chip on the Magic Panel R2.
+
 config MTD_ARM_INTEGRATOR
 	tristate "CFI Flash device mapped on ARM Integrator/P720T"
 	depends on ARM && MTD_CFI
--- sh-2.6-intc/drivers/mtd/maps/magicpanelr2.c	1970-01-01 01:00:00.000000000 
+0100
+++ sh-2.6/drivers/mtd/maps/magicpanelr2.c	2007-08-17 14:30:37.000000000 +0200
@@ -0,0 +1,98 @@
+/*
+ * Copyright (C) 2007  Markus Brunner, Mark Jonas
+ *
+ * Flash on Magic Panel R2 board.
+ *
+ *   Based on solutionengine.c
+ *
+ *   (C) 2001 Red Hat, Inc.
+ *
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file "COPYING" in the main directory of this archive
+ * for more details.
+ */
+
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/partitions.h>
+#include <linux/errno.h>
+#include <asm/magicpanelr2.h>
+
+static struct mtd_info *flash_mtd;
+
+struct map_info mpr2_flash_map = {
+	.name = "Magic Panel R2 Flash",
+	.size = 0x2000000UL,
+	.bankwidth = 2,
+};
+static struct mtd_partition *parsed_parts;
+
+static const char *probes[] = { "RedBoot", "cmdlinepart", NULL };
+
+static struct mtd_partition mpr2_partitions[] = {
+	/* Reserved for bootloader, read-only */
+	{
+		.name = "Bootloader",
+		.offset = 0x00000000UL,
+		.size = MPR2_MTD_BOOTLOADER_SIZE,
+		.mask_flags = MTD_WRITEABLE,
+	},
+	/* Reserved for kernel image */
+	{
+		.name = "Kernel Image",
+		.offset = MTDPART_OFS_NXTBLK,
+		.size = MPR2_MTD_KERNEL_SIZE,
+	},
+	/* Rest is used for Flash FS */
+	{
+		.name = "Flash FS",
+		.offset = MTDPART_OFS_NXTBLK,
+		.size = MTDPART_SIZ_FULL,
+	}
+};
+
+static int __init init_mpr2_maps(void)
+{
+	int nr_parts = 0;
+
+	/* Probe at offset 0 */
+	mpr2_flash_map.phys = 0x00000000UL;
+	mpr2_flash_map.virt = (void __iomem *)P2SEGADDR(0x00000000UL);
+	simple_map_init(&mpr2_flash_map);
+
+	flash_mtd = do_map_probe("cfi_probe", &mpr2_flash_map);
+
+	flash_mtd->owner = THIS_MODULE;
+
+	/* Check if there is a partition table */
+	nr_parts = parse_mtd_partitions(flash_mtd, probes, &parsed_parts, 0);
+
+	/* If there is no partition table, used the hard coded table */
+	if (nr_parts <= 0) {
+		parsed_parts = mpr2_partitions;
+		nr_parts = sizeof(mpr2_partitions)/sizeof(*parsed_parts);
+	}
+
+	/* Add partitions */
+	add_mtd_partitions(flash_mtd, parsed_parts, nr_parts);
+
+	return 0;
+}
+
+static void __exit cleanup_mpr2_maps(void)
+{
+	del_mtd_partitions(flash_mtd);
+	map_destroy(flash_mtd);
+}
+
+module_init(init_mpr2_maps);
+module_exit(cleanup_mpr2_maps);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Mark Jonas <toertel@gmail.com>");
+MODULE_DESCRIPTION("MTD map driver for Magic Panel R2");
--- sh-2.6-intc/drivers/mtd/maps/Makefile	2007-07-31 12:11:48.000000000 +0200
+++ sh-2.6/drivers/mtd/maps/Makefile	2007-08-14 13:23:32.000000000 +0200
@@ -71,3 +71,4 @@ obj-$(CONFIG_MTD_PLATRAM)	+= plat-ram.o
 obj-$(CONFIG_MTD_OMAP_NOR)	+= omap_nor.o
 obj-$(CONFIG_MTD_MTX1)		+= mtx-1_flash.o
 obj-$(CONFIG_MTD_TQM834x)	+= tqm834x.o
+obj-$(CONFIG_MTD_MAGICPANELR2)	+= magicpanelr2.o
\ No newline at end of file
