Received: from smtp.fh-landshut.de ([193.175.141.50])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BI3vK-0001Yp-TM
	for linux-mtd@lists.infradead.org; Mon, 26 Apr 2004 12:05:18 +0100
Received: from fh-landshut.de (dhcp-215-9.if.fh-landshut.de [193.175.215.209])
	i3QB5FO15058
	for <linux-mtd@lists.infradead.org>; Mon, 26 Apr 2004 13:05:15 +0200
Message-ID: <408CEC97.4030905@fh-landshut.de>
Date: Mon, 26 Apr 2004 13:03:51 +0200
From: Oliver Korpilla <okorpil@fh-landshut.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Newbie help! - Old AMD (cfi_cmdset_0002) interleaved flash problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello!

I have written a mapping for my flash and using it with last week's CVS 
(recent enough, I guess) MTD. I'm getting this on target bootup:

Motorola MVME2100 flash device: 0x400000 at 0xff000000
Found: AMD AM29LV800BT
MVME2100 flash: Found 4 x16 devices at 0x0 in 32-bit mode
number of JEDEC chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
Creating 2 MTD partitions on "MVME2100 flash":
0x00000000-0x00100000 : "MVME2100 flash BOOT partition"
0x00100000-0x003c0000 : "MVME2100 flash rootfs partition"

I shortened the 2nd partition by 256KB to avoid having differing erase 
sizes - see the output of mtd_debug (last 256KB are of several different 
erase sizes - to make sure this is not the problem):

/ # mtd_debug info /dev/mtd2
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 2883584 (2M)
mtd.erasesize = 262144 (256K)
mtd.oobblock = 0
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 0

/ # mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 4194304 (4M)
mtd.erasesize = 262144 (256K)
mtd.oobblock = 0
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 4

region[0].offset = 0x00000000
region[0].erasesize = 262144 (256K)
region[0].numblocks = 15
region[0].regionindex = 0
region[1].offset = 0x003c0000
region[1].erasesize = 131072 (128K)
region[1].numblocks = 1
region[1].regionindex = 1
region[2].offset = 0x003e0000
region[2].erasesize = 32768 (32K)
region[2].numblocks = 2
region[2].regionindex = 2
region[3].offset = 0x003f0000
region[3].erasesize = 65536 (64K)
region[3].numblocks = 1
region[3].regionindex = 3


So everything stays within the same erase region.

Erasing works without problems:

/ # eraseall /dev/mtd2
Erasing 256 Kibyte @ 280000 -- 90 % complete.

But if I try ftl_format, or cat or cp a JFFS2 image to the char device 
associated with the partition, I get the following:

/ # ftl_format -i -r 10 /dev/mtd2
Partition size = 2816 kb, erase unit size = 256 kb, 1 transfer units
Reserved 10%, formatted size = 2283 kb
This will destroy all data on the target device.  Confirm (y/n): y
Erasing all blocks...
---+---+---
MTD do_write_oneword(): software timeout

This will cause Input/Output errors on cp and cat, and if I copy or cat 
a JFFS2 image (I've tried both big and little endian just to be sure), I 
cannot mount it afterwards (missing magic blocks).

I only want to use this (somehow) crappy flash chip for a read-only 
filesystem somehow. I don't need no write support, just a boot root 
filesystem.

Can anybody help me? (My patch is attached in this message below)

Can I quickfix this - a modified timeout value, perhaps?

The board this is running on is a MVME2100 PowerPC 603e (MPC8240) board.

Thanks in advance,
Oliver Korpilla

My patch vs. 2.4.25 with MTD from CVS:

diff -urN linux-2.4.25/drivers/mtd/maps/Config.in 
linux-2.4.25-mtd_patch/drivers/mtd/maps/Config.in
--- linux-2.4.25/drivers/mtd/maps/Config.in	2004-04-22 
22:04:32.000000000 +0200
+++ linux-2.4.25-mtd_patch/drivers/mtd/maps/Config.in	2004-04-22 
21:54:06.000000000 +0200
@@ -35,8 +35,13 @@
  fi

  if [ "$CONFIG_PPC32" = "y" ]; then
-  if [ "$CONFIG_6xx" = "y" -a "$CONFIG_8260" = "y" ]; then
-    dep_tristate '  Flash device on SBC8240' CONFIG_MTD_SBC8240 
$CONFIG_MTD_JEDECPROBE
+  if [ "$CONFIG_6xx" = "y" ]; then
+    if [ "$CONFIG_8260" = "y" ]; then
+      dep_tristate '  Flash device on SBC8240' CONFIG_MTD_SBC8240 
$CONFIG_MTD_JEDECPROBE	
+    fi	
+    if [ "$CONFIG_MVME2100" = "y" ]; then
+      dep_tristate '  Flash device on MVME2100' CONFIG_MTD_MVME2100 
$CONFIG_MTD_JEDECPROBE
+    fi
    fi
    if [ "$CONFIG_8xx" = "y" ]; then
      if [ "$CONFIG_TQM8xxL" = "y" ]; then
diff -urN linux-2.4.25/drivers/mtd/maps/Makefile 
linux-2.4.25-mtd_patch/drivers/mtd/maps/Makefile
--- linux-2.4.25/drivers/mtd/maps/Makefile	2004-04-22 22:04:32.000000000 
+0200
+++ linux-2.4.25-mtd_patch/drivers/mtd/maps/Makefile	2004-04-22 
21:54:06.000000000 +0200
@@ -63,6 +63,7 @@
  obj-$(CONFIG_MTD_ARCTIC)	+= arctic-mtd.o
  obj-$(CONFIG_MTD_H720X)		+= h720x-flash.o
  obj-$(CONFIG_MTD_SBC8240)	+= sbc8240.o
+obj-$(CONFIG_MTD_MVME2100)	+= mvme2100.o
  obj-$(CONFIG_MTD_NOR_TOTO)	+= omap-toto-flash.o
  obj-$(CONFIG_MTD_MPC1211)	+= mpc1211.o
  obj-$(CONFIG_MTD_IXP425)	+= ixp425.o
diff -urN linux-2.4.25/drivers/mtd/maps/mvme2100.c 
linux-2.4.25-mtd_patch/drivers/mtd/maps/mvme2100.c
--- linux-2.4.25/drivers/mtd/maps/mvme2100.c	1970-01-01 
01:00:00.000000000 +0100
+++ linux-2.4.25-mtd_patch/drivers/mtd/maps/mvme2100.c	2004-04-22 
21:54:06.000000000 +0200
@@ -0,0 +1,115 @@
+/*
+ * Handle mapping of the flash on MVME2100 boards.
+ *
+ * Author:      Oliver Korpilla
+ * Copyright:   (C) 2004 Systerra Computer GmbH
+ *
+ * Modelled after the mbx860.c
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <asm/io.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/partitions.h>
+
+
+/* Soldered flash bank starts here */
+#define FLASH_ADDR 0xff000000
+/* Soldered flash bank contains 4MB by default */
+#define FLASH_SIZE 0x00400000
+
+/* Flash partition sizes */
+/* Reserve 1MB for the kernel */
+#define KERNEL_PARTITION_OFFSET 0x0
+#define KERNEL_PARTITION_SIZE   0x100000
+/* Use the other 3MB for the root filesystem */
+#define ROOTFS_PARTITION_OFFSET 0x100000
+#define ROOTFS_PARTITION_SIZE   0x2C0000
+
+
+#define NUM_PARTITIONS 2
+
+/* partition_info gives details on the logical partitions that the 
split the
+ * single flash device into. If the size if zero we use up to the end 
of the
+ * device. */
+static struct mtd_partition partition_info[]=
+  {
+    {
+      .name   = "MVME2100 flash BOOT partition",
+      .offset = KERNEL_PARTITION_OFFSET,
+      .size   = KERNEL_PARTITION_SIZE
+    },
+    {
+      .name   = "MVME2100 flash rootfs partition",
+      .offset = ROOTFS_PARTITION_OFFSET,
+      .size   = ROOTFS_PARTITION_SIZE
+    }
+  };
+
+static struct mtd_info *mymtd;
+
+struct map_info mvme2100_map = {
+        .name = "MVME2100 flash",
+        .size = FLASH_SIZE,
+        .phys = FLASH_ADDR,
+        .buswidth = 4,
+};
+
+int __init init_mvme2100(void)
+{
+  printk(KERN_NOTICE "Motorola MVME2100 flash device: 0x%x at 0x%x\n", 
FLASH_SIZE, FLASH_ADDR);
+
+  /* Remap flash physical to a virtual address */
+  mvme2100_map.virt = (unsigned long)ioremap(FLASH_ADDR, FLASH_SIZE);
+
+  /* Check for a failed mapping */
+  if (!mvme2100_map.virt) {
+    printk("Failed to ioremap\n");
+    return -EIO;
+  }
+  /* Initialize with the map data */
+  simple_map_init(&mvme2100_map);
+
+  /* Probe for a JEDEC chip  */
+  mymtd = do_map_probe("jedec_probe", &mvme2100_map);
+
+  /* Setup devices and partitions */
+  if (mymtd) {
+    mymtd->owner = THIS_MODULE;
+    add_mtd_device(mymtd);
+    add_mtd_partitions(mymtd, partition_info, NUM_PARTITIONS);
+    return 0;
+  }
+
+  /* Unmap the temporary virtual address */
+  iounmap((void *)mvme2100_map.virt);
+  return -ENXIO;
+}
+
+static void __exit cleanup_mvme2100(void)
+{
+  if (mymtd) {
+    del_mtd_device(mymtd);
+    map_destroy(mymtd);
+  }
+  if (mvme2100_map.virt) {
+    iounmap((void *)mvme2100_map.virt);
+    mvme2100_map.virt = 0;
+  }
+}
+
+module_init(init_mvme2100);
+module_exit(cleanup_mvme2100);
+
+MODULE_AUTHOR("Oliver Korpilla <okorpil@fh-landshut.de>");
+MODULE_DESCRIPTION("MTD map driver for Motorola MVME2100 board");
+MODULE_LICENSE("GPL");
