Received: from oz.embeddedarm.com ([67.40.67.44])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lfe6I-00082h-Mv
	for linux-mtd@lists.infradead.org; Fri, 06 Mar 2009 17:44:51 +0000
Received: from [192.168.0.200] (oz3 [192.168.0.200])
	by oz.embeddedARM.com (8.12.11.20060614/8.11.6) with ESMTP id
	n26HQv5m018890 for <linux-mtd@lists.infradead.org>;
	Fri, 6 Mar 2009 10:26:57 -0700 (MST)
Message-ID: <49B15D6D.4070301@embeddedarm.com>
Date: Fri, 06 Mar 2009 10:29:17 -0700
From: Eddie Dawydiuk <eddie@embeddedarm.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH,RFC] ts81xx NAND driver
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

The attached patch implements support for the NAND flash on the 
Technologic Systems TS-8150 series of AMCC 44x boards.

Any feedback appreciated..

diff -urN linux-2.6.28.orig/drivers/mtd/nand/Kconfig 
linux-2.6.28/drivers/mtd/nand/Kconfig
--- linux-2.6.28.orig/drivers/mtd/nand/Kconfig  2008-12-24 
16:26:37.000000000 -0700
+++ linux-2.6.28/drivers/mtd/nand/Kconfig       2009-03-06 
10:21:57.000000000 -0700
@@ -420,4 +420,10 @@
           Several Renesas SuperH CPU has FLCTL. This option enables support
           for NAND Flash using FLCTL. This driver support SH7723.

+config MTD_NAND_TS8150
+       tristate "NAND Flash device on TS-8150 board"
+       depends on MTD_NAND && TS81XX
+       help
+         Support for NAND flash on Technologic Systems TS-8150 platform.
+
  endif # MTD_NAND

diff -urN linux-2.6.28.orig/drivers/mtd/nand/Kconfig 
linux-2.6.28/drivers/mtd/nand/Kconfig
--- linux-2.6.28.orig/drivers/mtd/nand/Kconfig  2008-12-24 
16:26:37.000000000 -0700
+++ linux-2.6.28/drivers/mtd/nand/Kconfig       2009-03-06 
10:21:57.000000000 -0700
@@ -420,4 +420,10 @@
           Several Renesas SuperH CPU has FLCTL. This option enables support
           for NAND Flash using FLCTL. This driver support SH7723.

+config MTD_NAND_TS8150
+       tristate "NAND Flash device on TS-8150 board"
+       depends on MTD_NAND && TS81XX
+       help
+         Support for NAND flash on Technologic Systems TS-8150 platform.
+
  endif # MTD_NAND
eddie@io:kernels$ diff -urN linux-2.6.28.orig/drivers/mtd/nand/Makefile 
linux-2.6.28/drivers/mtd/nand/Makefile
--- linux-2.6.28.orig/drivers/mtd/nand/Makefile 2008-12-24 
16:26:37.000000000 -0700
+++ linux-2.6.28/drivers/mtd/nand/Makefile      2009-03-05 
17:37:01.000000000 -0700
@@ -36,5 +36,6 @@
  obj-$(CONFIG_MTD_NAND_FSL_UPM)         += fsl_upm.o
  obj-$(CONFIG_MTD_NAND_SH_FLCTL)                += sh_flctl.o
  obj-$(CONFIG_MTD_NAND_MXC)             += mxc_nand.o
+obj-$(CONFIG_MTD_NAND_TS8150)          += ts8150.o

  nand-objs := nand_base.o nand_bbt.o

diff -urN linux-2.6.28.orig/drivers/mtd/nand/ts8150.c 
linux-2.6.28/drivers/mtd/nand/ts8150.c
--- linux-2.6.28.orig/drivers/mtd/nand/ts8150.c 1969-12-31 
17:00:00.000000000 -0700
+++ linux-2.6.28/drivers/mtd/nand/ts8150.c      2009-03-06 
10:33:19.000000000 -0700
@@ -0,0 +1,241 @@
+/*
+ *  drivers/mtd/nand/8150.c
+ *
+ *  Copyright (C) 2009 Technologic Systems (support@embeddedARM.com)
+ *
+ *  Derived from drivers/mtd/nand/edb7312.c
+ *       Copyright (C) 2004 Marius Gröger (mag@sysgo.de)
+ *
+ *  Derived from drivers/mtd/nand/autcpu12.c
+ *       Copyright (c) 2001 Thomas Gleixner (gleixner@autronix.de)
+ *
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ *  Overview:
+ *   This is a device driver for the NAND flash device found on the
+ *   TS-81xx boards which utilizes a 512Mbyte part
+ */
+
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/mm.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/partitions.h>
+#include <asm/io.h>
+#include <asm/cacheflush.h>
+
+struct partition_info {                // little-endian format
+       unsigned int bootable:8;        // 0x80 = active, 0x00 = don't 
use for booting
+       unsigned int starting_head:8;
+       unsigned int starting_csect:8;
+       unsigned int starting_xcyl:8;
+       // MSB bits 0-5 are sector
+       unsigned int system_id:8;       // format of partition
+       unsigned int ending_head:8;
+       unsigned int ending_csect:8;
+       unsigned int ending_xcyl:8;
+       unsigned int relative_sector:32;        // sector offset from 
start of disk to start of volume
+       unsigned int total_sectors:32;
+} __attribute__ ((packed));
+
+struct partition_table {
+       struct partition_info part[4];
+} __attribute__ ((__packed__));
+
+struct MBR {
+       char bootcode[446];
+       struct partition_table pt;
+       unsigned int sig55:8;
+       unsigned int sigAA:8;
+} __attribute__ ((__packed__));
+
+/*
+ * MTD structure for TS8150 board
+ */
+static struct mtd_info *ts8150_mtd = NULL;
+
+/*
+ * Module stuff
+ */
+
+static unsigned int ts8150_nandctrl = 0;
+static unsigned int ts8150_nanddat = 0;
+
+#ifdef CONFIG_MTD_PARTITIONS
+static struct mtd_partition partition_mbr[] = {
+       {.name = "whole chip",
+        .offset = 0,
+        .size = (0x20000000)},
+       {.name = "kernel",
+        .offset = 0x20000,
+        .size = 0x400000},
+       {.name = "initrd",
+        .offset = 0x420000,
+        .size = 0x400000},
+       {.name = "rootfs",
+        .offset = 0x820000,
+        .size = (0x20000000) - 0x820000},
+       {.name = "part4",
+        .offset = (0x20000000),
+        .size = 0},
+};
+#endif
+
+/*
+ *     hardware specific access to control-lines
+ *
+ *     ctrl:
+ *     NAND_NCE: bit 0 -> bit 2
+ *     NAND_CLE: bit 1 -> bit 1
+ *     NAND_ALE: bit 2 -> bit 0
+ */
+static void ts8150_hwcontrol(struct mtd_info *mtd, int cmd, unsigned 
int ctrl)
+{
+       struct nand_chip *chip = mtd->priv;
+
+       if (ctrl & NAND_CTRL_CHANGE) {
+               unsigned long addr = ts8150_nandctrl;
+               unsigned char bits;
+
+               bits = (ctrl & NAND_NCE) << 2;
+               bits |= ctrl & NAND_CLE;
+               bits |= (ctrl & NAND_ALE) >> 2;
+
+               __raw_writeb((__raw_readb((unsigned long *)addr) & ~0x7) 
| bits,
+                            (unsigned long *)addr);
+       }
+
+       if (cmd != NAND_CMD_NONE)
+               writeb(cmd, chip->IO_ADDR_W);
+}
+
+/*
+ *     read device ready pin
+ */
+static int ts8150_device_ready(struct mtd_info *mtd)
+{
+       return __raw_readb((unsigned long *)ts8150_nandctrl) & 0x20;
+}
+
+/*
+ * Main initialization routine
+ */
+static int __init ts8150_init(void)
+{
+       struct nand_chip *this;
+       const char *part_type = 0;
+       char *nandaddr;
+       char buf[2048];
+       int i, got = 0, parts = 0;
+       unsigned ofs = 0;
+       struct MBR *mbr = (struct MBR *)buf;
+
+       /* Allocate memory for MTD device structure and private data */
+       ts8150_mtd = kmalloc(sizeof(struct mtd_info) +
+                            sizeof(struct nand_chip), GFP_KERNEL);
+       if (!ts8150_mtd) {
+               printk
+                   ("Unable to allocate TS8150 NAND MTD device 
structure.\n");
+               return -ENOMEM;
+       }
+
+       nandaddr = ioremap(0xA4081000, 0x1000);
+
+       /* Get pointer to private data */
+       this = (struct nand_chip *)(&ts8150_mtd[1]);
+
+       /* Initialize structures */
+       memset((char *)ts8150_mtd, 0, sizeof(struct mtd_info));
+       memset((char *)this, 0, sizeof(struct nand_chip));
+
+       /* Link the private data with the MTD structure */
+       ts8150_mtd->priv = this;
+       ts8150_mtd->owner = THIS_MODULE;
+
+       /* insert callbacks */
+       this->IO_ADDR_R = nandaddr + 0x804;
+       this->IO_ADDR_W = nandaddr + 0x804;
+       ts8150_nanddat = (unsigned int)nandaddr + 0x804;
+       ts8150_nandctrl = (unsigned int)nandaddr + 0x800;
+
+       this->cmd_ctrl = ts8150_hwcontrol;
+       this->dev_ready = ts8150_device_ready;
+       this->ecc.mode = NAND_ECC_SOFT;
+
+       this->chip_delay = 15;
+       this->options = NAND_USE_FLASH_BBT;
+       this->ecc.size = 2048;
+       this->ecc.bytes = 24;
+
+       printk("Searching for NAND flash...\n");
+       /* Scan to find existence of the device */
+       if (nand_scan(ts8150_mtd, 1)) {
+               kfree(ts8150_mtd);
+               return -ENXIO;
+       }
+       for (i = 0; i < 512; i++) {
+               buf[i] = 0;
+       }
+       ts8150_mtd->read(ts8150_mtd, 0, 512, &got, buf);
+
+       if (mbr->sigAA == 0xAA && mbr->sig55 == 0x55) {
+               part_type = "MBR";
+               for (i = 0; i < 4; i++) {
+                       if (mbr->pt.part[i].total_sectors) {
+                               parts++;
+                               partition_mbr[i + 1].offset =
+                                   512 * mbr->pt.part[i].relative_sector;
+                               if (i < 2) {
+                                       partition_mbr[i + 1].size =
+                                           512 * mbr->pt.part[i +
+                                                              1].
+                                           relative_sector -
+                                           512 *
+                                           mbr->pt.part[i].relative_sector;
+                               } else {
+                                       partition_mbr[i + 1].size =
+                                           512 * 
mbr->pt.part[i].total_sectors;
+                               }
+                               ofs = partition_mbr[i + 1].offset
+                                   + partition_mbr[i + 1].size;
+                       }
+               }
+       } else {
+               part_type = "default";
+               parts = 3;
+       }
+
+       /* Register the partitions */
+       printk(KERN_NOTICE "Using %s partition definition\n", part_type);
+       add_mtd_partitions(ts8150_mtd, partition_mbr, parts + 1);
+
+       /* Return happy */
+       return 0;
+}
+
+module_init(ts8150_init);
+
+/*
+ * Clean up routine
+ */
+static void __exit ts8150_cleanup(void)
+{
+       /* Unregister the device */
+       del_mtd_device(ts8150_mtd);
+
+       iounmap((void *)ts8150_nandctrl);
+
+       /* Free the MTD device structure */
+       kfree(ts8150_mtd);
+}
+
+module_exit(ts8150_cleanup);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Eddie Dawydiuk <eddie@embeddedARM.com>");
+MODULE_DESCRIPTION("MTD driver for Technologic Systems TS-8150 board");
-- 
Best Regards,
________________________________________________________________
  Eddie Dawydiuk, Technologic Systems | voice:  (480) 837-5200
  16525 East Laser Drive 	     | fax:    (480) 837-5300
  Fountain Hills, AZ 85268            | web: www.embeddedARM.com
