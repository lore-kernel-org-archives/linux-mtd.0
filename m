Received: from 82-168-191-45-bbxl.xdsl.tiscali.nl ([82.168.191.45] helo=levin)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C8h6Q-0004bR-Sk
	for linux-mtd@lists.infradead.org; Sat, 18 Sep 2004 11:26:21 -0400
Date: Sat, 18 Sep 2004 17:26:06 +0200
From: Sean Young <sean@mess.org>
To: David Woodhouse <dwmw2@redhat.com>
Message-ID: <20040918152606.GA3666@levin.pad.mess.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH] New mapping driver for Technology Systems TS-5500 board
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Here is a new mapping driver, patch against kernel 2.6.9-rc2 (I hope
that's okay):

	MTD Mapping driver for Technology Systems TS-5500 board

        Signed-off-by: Sean Young <sean@mess.org>

Note that the bios on this board uses a proprietary ftl of General Software 
which I haven't been able to figure out. Any ideas here would be most 
welcome.


Sean

diff -uprN ./drivers/mtd/maps/Kconfig /usr/src/linux-2.6.6/drivers/mtd/maps/Kconfig
--- ./drivers/mtd/maps/Kconfig	2004-09-18 16:52:09.000000000 +0200
+++ /usr/src/linux-2.6.6/drivers/mtd/maps/Kconfig	2004-09-18 16:51:53.000000000 +0200
@@ -84,6 +84,25 @@ config MTD_SC520CDP
 	  Dual-in-line JEDEC chip. This 'mapping' driver supports that
 	  arrangement, implementing three MTD devices.
 
+config MTD_TS5500
+	tristate "JEDEC Flash device mapped on Technologic Systems TS-5500"
+	depends on X86 && MTD_JEDECPROBE && MTD_PARTITIONS
+	help
+	  This provides a driver for the on-board flash of the Technologic
+	  System's TS-5500 board. The flash is split into 3 partitions 
+	  which are accessed as separate MTD devices.
+
+	  mtd0 and mtd2 are the two BIOS drives. Unfortunately the BIOS 
+	  uses a proprietary flash translation layer from General Software, 
+	  which is not supported (the drives cannot be mounted). You can 
+	  create your own file system (jffs for example), but the BIOS 
+	  won't be able to boot from it.
+	  
+	  mtd1 allows you to reprogram your BIOS. BE VERY CAREFUL.
+	
+	  Note that if jumper 3 ("Write Enable Drive A") must be set 
+	  otherwise detection won't succeeed.
+
 config MTD_NETSC520
 	tristate "CFI Flash device mapped on AMD NetSc520"
 	depends on X86 && MTD_CFI && MTD_PARTITIONS
diff -uprN ./drivers/mtd/maps/Makefile /usr/src/linux-2.6.6/drivers/mtd/maps/Makefile
--- ./drivers/mtd/maps/Makefile	2004-09-18 16:52:09.000000000 +0200
+++ /usr/src/linux-2.6.6/drivers/mtd/maps/Makefile	2004-09-15 22:54:34.000000000 +0200
@@ -33,6 +33,7 @@ obj-$(CONFIG_MTD_TQM8XXL)	+= tqm8xxl.o
 obj-$(CONFIG_MTD_SA1100)	+= sa1100-flash.o
 obj-$(CONFIG_MTD_SBC_GXX)	+= sbc_gxx.o
 obj-$(CONFIG_MTD_SC520CDP)	+= sc520cdp.o
+obj-$(CONFIG_MTD_TS5500)	+= ts5500_flash.o
 obj-$(CONFIG_MTD_NETSC520)	+= netsc520.o
 obj-$(CONFIG_MTD_SUN_UFLASH)	+= sun_uflash.o
 obj-$(CONFIG_MTD_VMAX)		+= vmax301.o
diff -uprN ./drivers/mtd/maps/ts5500_flash.c /usr/src/linux-2.6.6/drivers/mtd/maps/ts5500_flash.c
--- ./drivers/mtd/maps/ts5500_flash.c	1970-01-01 01:00:00.000000000 +0100
+++ /usr/src/linux-2.6.6/drivers/mtd/maps/ts5500_flash.c	2004-09-18 16:47:51.000000000 +0200
@@ -0,0 +1,139 @@
+/*
+ * ts5500.c -- MTD map driver for Technology Systems TS-5500 board
+ *
+ * Copyright (C) 2004 Sean Young <sean@mess.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
+ *
+ * Note:
+ * - In order for detection to work, jumper 3 must be set.
+ * - Drive A and B use a proprietary FTL from General Software which isn't 
+ *   supported as of yet so standard drives can't be mounted; you can create 
+ *   your own (e.g. jffs) file system.
+ * - If you have created your own jffs file system and the bios overwrites 
+ *   it during boot, try disabling Drive A: and B: in the boot order.
+ */
+
+#include <linux/config.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+
+#ifdef CONFIG_MTD_PARTITIONS
+#include <linux/mtd/partitions.h>
+#endif
+
+#define WINDOW_ADDR	0x09400000
+#define WINDOW_SIZE	0x00200000
+
+static struct map_info ts5500_map = {
+	.name = "TS-5500 Flash",
+	.size = WINDOW_SIZE,
+	.bankwidth = 1,
+	.phys = WINDOW_ADDR
+};
+
+#ifdef CONFIG_MTD_PARTITIONS
+static struct mtd_partition ts5500_partitions[] = {
+	{
+		.name = "Drive A",
+		.offset = 0,
+		.size = 0x0e0000
+	},
+	{
+		.name = "BIOS",
+		.offset = 0x0e0000,
+		.size = 0x020000,
+	},
+	{
+		.name = "Drive B",
+		.offset = 0x100000,
+		.size = 0x100000
+	}
+};
+
+#define NUM_PARTITIONS (sizeof(ts5500_partitions)/sizeof(struct mtd_partition))
+
+#endif
+
+static struct mtd_info *mymtd;
+
+static int __init init_ts5500_map(void)
+{
+	int rc = 0;
+
+	ts5500_map.virt = (void*)ioremap_nocache(ts5500_map.phys, ts5500_map.size);
+
+	if(!ts5500_map.virt) {
+		printk(KERN_ERR "Failed to ioremap_nocache\n");
+		rc = -EIO;
+		goto err_out_ioremap;
+	}
+
+	simple_map_init(&ts5500_map);
+
+	mymtd = do_map_probe("jedec_probe", &ts5500_map);
+	if(!mymtd)
+		mymtd = do_map_probe("map_rom", &ts5500_map);
+
+	if(!mymtd) {
+		rc = -ENXIO;
+		goto err_out_map;
+	}
+
+	mymtd->owner = THIS_MODULE;
+#ifdef CONFIG_MTD_PARTITIONS
+	add_mtd_partitions(mymtd, ts5500_partitions, NUM_PARTITIONS);
+#else	
+	add_mtd_device(mymtd);
+#endif
+
+	return 0;
+
+err_out_map:
+	map_destroy(mymtd);
+err_out_ioremap:
+	iounmap((void *)ts5500_map.virt);
+
+	return rc;
+}
+
+static void __exit cleanup_ts5500_map(void)
+{
+	if (mymtd) {
+#ifdef CONFIG_MTD_PARTITIONS
+		del_mtd_partitions(mymtd);
+#else
+		del_mtd_device(mymtd);
+#endif
+		map_destroy(mymtd);
+	}
+
+	if (ts5500_map.virt) {
+		iounmap((void *)ts5500_map.virt);
+		ts5500_map.virt = 0;
+	}
+}
+
+module_init(init_ts5500_map);
+module_exit(cleanup_ts5500_map);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Sean Young <sean@mess.org>");
+MODULE_DESCRIPTION("MTD map driver for Techology Systems TS-5500 board");
+
