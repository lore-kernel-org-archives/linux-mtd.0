Received: from hermes.chez-thomas.org ([63.225.98.241])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19sUCF-0007tj-Jw
	for <linux-mtd@lists.infradead.org>; Thu, 28 Aug 2003 22:20:47 +0100
From: Gary Thomas <gary@mlbassoc.com>
To: linux-mtd@lists.infradead.org
Message-Id: <1062105590.22288.63.camel@hermes>
Mime-Version: 1.0
Date: 28 Aug 2003 15:19:50 -0600
Content-Type: multipart/mixed; boundary="=-8fS1UvKw1WVCWr5I/3f7"
cc: David Woodhouse <dwmw2@infradead.org>
Subject: Mapping drivers - update for PowerPC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-8fS1UvKw1WVCWr5I/3f7
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The PowerPC tree(s) are quite out of sync with the current
MTD tree, at least as far as mapping drivers are concerned.

I'd like to propose these changes to bring them closer together.
I'll commit the changes if you approve.

Thanks.

-- 
------------------------------------------------------------
Gary Thomas                 |
MLB Associates              |  Consulting for the
+1 (970) 229-1963           |    Embedded world
http://www.mlbassoc.com/    |
email: <gary@mlbassoc.com>  |
gpg: http://www.chez-thomas.org/gary/gpg_key.asc
------------------------------------------------------------

--=-8fS1UvKw1WVCWr5I/3f7
Content-Disposition: attachment; filename=diffs
Content-Type: text/x-patch; name=diffs; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Index: drivers/mtd/maps/Config.in
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/maps/Config.in,v
retrieving revision 1.54
diff -u -5 -p -r1.54 Config.in
--- drivers/mtd/maps/Config.in	28 Aug 2003 06:50:24 -0000	1.54
+++ drivers/mtd/maps/Config.in	28 Aug 2003 21:16:18 -0000
@@ -38,22 +38,33 @@ if [ "$CONFIG_X86" = "y" ]; then
    dep_tristate '  CFI Flash device mapped on SnapGear/SecureEdge' CONFIG_MTD_NETtel $CONFIG_MTD_PARTITIONS
    dep_tristate '  BIOS flash chip on Intel SCB2 boards' CONFIG_MTD_SCB2_FLASH $CONFIG_MTD_GEN_PROBE
 fi
 
 if [ "$CONFIG_PPC32" = "y" ]; then
+  if [ "$CONFIG_6xx" = "y" -a "$CONFIG_8260" = "n" ]; then
+     dep_tristate '  CFI Flash device mapped on Momentum PUMA-A (PPC 750FX)' CONFIG_MTD_PUMA_A $CONFIG_MTD_CFI $CONFIG_PUMA_A
+#    dep_tristate '  CFI Flash device mapped on Motorola MVP' CONFIG_MTD_MOT_MVP $CONFIG_MTD_CFI $CONFIG_MOT_MVP
+     dep_tristate '  CFI Flash devices mapped on Motorola Computer Group HXEB100' CONFIG_MTD_HXEB100 $CONFIG_HXEB100 $CONFIG_MTD_CFI
+     if [ "$CONFIG_MTD_HXEB100" = "y" -o "$CONFIG_MTD_HXEB100" = "m" ]; then
+        bool '    Map bootflash (Bank B) (Dangerous)' CONFIG_MTD_HXEB100_BANK_B_FLASH
+     fi
+     dep_tristate '  CFI Flash device mapped on Force Computers PPMC260 board' CONFIG_MTD_PPMC260 $CONFIG_PPMC260 $CONFIG_MTD_CFI
+  fi
+  if [ "$CONFIG_6xx" = "y" -a "$CONFIG_8260" = "y" ]; then
+    dep_tristate '  CFI Flash device mapped on A&M Rattler' CONFIG_MTD_AM8XX $CONFIG_MTD_CFI $CONFIG_AM_RATTLER
+  fi
   if [ "$CONFIG_8xx" = "y" ]; then
     if [ "$CONFIG_TQM8xxL" = "y" ]; then
       dep_tristate '  CFI Flash device mapped on TQM8XXL' CONFIG_MTD_TQM8XXL $CONFIG_MTD_CFI
     fi
     if [ "$CONFIG_RPXLITE" = "y" -o "$CONFIG_RPXCLASSIC" = "y" ]; then
       dep_tristate '  CFI Flash device mapped on RPX Lite or CLLF' CONFIG_MTD_RPXLITE $CONFIG_MTD_CFI
     fi
-    if [ "$CONFIG_MBX" = "y" ]; then
-      dep_tristate '  System flash on MBX860 board' CONFIG_MTD_MBX860 $CONFIG_MTD_CFI
-    fi
+    dep_tristate '  System flash on MBX860 board' CONFIG_MTD_MBX860 $CONFIG_MTD_CFI
     dep_tristate '  CFI Flash device mapped on D-Box2' CONFIG_MTD_DBOX2 $CONFIG_MTD_CFI
     dep_tristate '  CFI Flash device mapping on FlagaDM' CONFIG_MTD_CFI_FLAGADM $CONFIG_MTD_CFI
+    dep_tristate '  CFI Flash device mapped on A&M Adder-II' CONFIG_MTD_AM8XX $CONFIG_MTD_CFI $CONFIG_AM8XX
   fi
   if [ "$CONFIG_4xx" = "y" ]; then
     if [ "$CONFIG_40x" = "y" ]; then
       if [ "$CONFIG_REDWOOD_4" = "y" -o "$CONFIG_REDWOOD_5" = "y" -o "$CONFIG_REDWOOD_6" = "y" ]; then
         dep_tristate '  CFI Flash device mapped on IBM Redwood' CONFIG_MTD_REDWOOD $CONFIG_MTD_CFI
Index: drivers/mtd/maps/am8xx.c
===================================================================
RCS file: drivers/mtd/maps/am8xx.c
diff -N drivers/mtd/maps/am8xx.c
--- /dev/null	1 Jan 1970 00:00:00 -0000
+++ drivers/mtd/maps/am8xx.c	28 Aug 2003 21:16:18 -0000
@@ -0,0 +1,147 @@
+/*
+ * $Id: am8xx.c,v 1.1.2.2 2003/05/03 14:04:33 gthomas Exp $
+ *
+ * Handle mapping of the flash on the A&M 8xx platforms
+ * Patterned after "rpxlite.c"
+ *
+ * Copyright (c) 2003 Gary Thomas <gary@mlbassoc.com>
+ */
+
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <asm/io.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/partitions.h>
+
+static struct mtd_partition *parsed_parts;
+static struct mtd_info *mymtd;
+
+__u8 am8xx_read8(struct map_info *map, unsigned long ofs)
+{
+    __u8 res;
+    res = __raw_readb(map->map_priv_1 + ofs);
+    return res;
+}
+
+__u16 am8xx_read16(struct map_info *map, unsigned long ofs)
+{
+    __u16 res;
+    res = __raw_readw(map->map_priv_1 + ofs);
+    return res;
+}
+
+__u32 am8xx_read32(struct map_info *map, unsigned long ofs)
+{
+    __u32 res;
+    res = __raw_readl(map->map_priv_1 + ofs);
+    return res;
+}
+
+void am8xx_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
+{
+    memcpy_fromio(to, (void *)(map->map_priv_1 + from), len);
+}
+
+void am8xx_write8(struct map_info *map, __u8 d, unsigned long adr)
+{
+    __raw_writeb(d, map->map_priv_1 + adr);
+    mb();
+}
+
+void am8xx_write16(struct map_info *map, __u16 d, unsigned long adr)
+{
+    __raw_writew(d, map->map_priv_1 + adr);
+    mb();
+}
+
+void am8xx_write32(struct map_info *map, __u32 d, unsigned long adr)
+{
+    __raw_writel(d, map->map_priv_1 + adr);
+    mb();
+}
+
+void am8xx_copy_to(struct map_info *map, unsigned long to, const void *from, ssize_t len)
+{
+    memcpy_toio((void *)(map->map_priv_1 + to), from, len);
+}
+
+struct map_info am8xx_map = {
+    name: "A&M 8xx/8xxx boards",
+    read8: am8xx_read8,
+    read16: am8xx_read16,
+    read32: am8xx_read32,
+    copy_from: am8xx_copy_from,
+    write8: am8xx_write8,
+    write16: am8xx_write16,
+    write32: am8xx_write32,
+    copy_to: am8xx_copy_to
+};
+
+int __init init_am8xx(void)
+{
+    struct mtd_partition *parts;
+    int nb_parts = 0;
+    int parsed_nr_parts = 0;
+    char *part_type;
+    bd_t *bp = (bd_t *)__res;
+
+    printk(KERN_NOTICE "A&M 8xx flash device: %x at %x (%d bits wide)\n", 
+           bp->bi_flashsize, bp->bi_flashbase, bp->bi_flashwidth);
+    am8xx_map.map_priv_1 = (unsigned long)ioremap(bp->bi_flashbase, bp->bi_flashsize);
+    am8xx_map.buswidth = bp->bi_flashwidth/8;
+    am8xx_map.size = bp->bi_flashsize;
+
+    if (!am8xx_map.map_priv_1) {
+        printk("Failed to ioremap\n");
+        return -EIO;
+    }
+    mymtd = do_map_probe("cfi_probe", &am8xx_map);
+    if (mymtd) {
+        mymtd->module = THIS_MODULE;
+#ifdef CONFIG_MTD_REDBOOT_PARTS
+	if (parsed_nr_parts == 0) {
+            int ret = parse_redboot_partitions(mymtd, &parsed_parts, 0);
+            if (ret > 0) {
+                part_type = "RedBoot";
+                parsed_nr_parts = ret;
+            }
+	}
+#endif
+	if (parsed_nr_parts > 0) {
+            parts = parsed_parts;
+            nb_parts = parsed_nr_parts;
+	}
+	if (nb_parts == 0) {
+            printk(KERN_NOTICE "A&M 8xx flash: no partition info available, registering whole flash at once\n");
+            add_mtd_device(mymtd);
+	} else {
+            printk(KERN_NOTICE "Using %s partition definition\n", part_type);
+            add_mtd_partitions(mymtd, parts, nb_parts);
+	}
+        return 0;
+    }
+
+    iounmap((void *)am8xx_map.map_priv_1);
+    return -ENXIO;
+}
+
+static void __exit cleanup_am8xx(void)
+{
+    if (mymtd) {
+        del_mtd_device(mymtd);
+        map_destroy(mymtd);
+    }
+    if (am8xx_map.map_priv_1) {
+        iounmap((void *)am8xx_map.map_priv_1);
+        am8xx_map.map_priv_1 = 0;
+    }
+}
+
+module_init(init_am8xx);
+module_exit(cleanup_am8xx);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Gary Thomas <gary@mlbassoc.com>");
+MODULE_DESCRIPTION("MTD map driver for A&M 8xx boards");
Index: drivers/mtd/maps/pumaA.c
===================================================================
RCS file: drivers/mtd/maps/pumaA.c
diff -N drivers/mtd/maps/pumaA.c
--- /dev/null	1 Jan 1970 00:00:00 -0000
+++ drivers/mtd/maps/pumaA.c	28 Aug 2003 21:16:18 -0000
@@ -0,0 +1,181 @@
+/*
+ * Handle mapping of the flash on PUMA-A (PPC 6750FX) boards
+ *
+ * Author:	Gary Thomas <gary@mlbassoc.com>
+ * Copyright:	(C) 2003 MLB Associates
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
+#include <asm/io.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/partitions.h>
+#include <platforms/pumaA.h>
+#include <asm/gt64260_defs.h>   // REMOVE ME!
+
+
+#define WINDOW_ADDR PUMA_EXT_FLASH_BASE
+#define WINDOW_SIZE PUMA_EXT_FLASH_SIZE
+
+/* Flash / Partition sizing */
+#define MAX_SIZE_KiB              8192
+#define BOOT_PARTITION_SIZE_KiB    512
+#define KERNEL_PARTITION_SIZE_KiB 5632
+#define APP_PARTITION_SIZE_KiB    2048
+
+#define NUM_PARTITIONS 3
+
+/* partition_info gives details on the logical partitions that the split the
+ * single flash device into. If the size is zero we use up to the end of the
+ * device. */
+static struct mtd_partition partition_info[]={
+	{ name: "PUMA-A flash BOOT partition",
+	offset: 0,
+	size:   BOOT_PARTITION_SIZE_KiB*1024 },
+	{ name: "PUMA-A flash DATA partition",
+	offset: BOOT_PARTITION_SIZE_KiB*1024,
+	size: (KERNEL_PARTITION_SIZE_KiB)*1024 },
+	{ name: "PUMA-A flash APPLICATION partition",
+	offset: (BOOT_PARTITION_SIZE_KiB+KERNEL_PARTITION_SIZE_KiB)*1024 }
+};
+				   
+static struct mtd_partition *parsed_parts;
+static struct mtd_info *mymtd;
+
+__u8 puma_read8(struct map_info *map, unsigned long ofs)
+{
+    __u8 val;
+    val = readb(map->map_priv_1 + ofs);
+    return val;
+}
+
+__u16 puma_read16(struct map_info *map, unsigned long ofs)
+{
+    __u16 val;
+    val = readw(map->map_priv_1 + ofs);
+    return val;
+}
+
+__u32 puma_read32(struct map_info *map, unsigned long ofs)
+{
+    __u32 val;
+    val = readl(map->map_priv_1 + ofs);
+    return val;
+}
+
+void puma_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
+{
+    memcpy_fromio(to, (void *)(map->map_priv_1 + from), len);
+}
+
+void puma_write8(struct map_info *map, __u8 d, unsigned long adr)
+{
+    writeb(d, map->map_priv_1 + adr);
+}
+
+void puma_write16(struct map_info *map, __u16 d, unsigned long adr)
+{
+    writew(d, map->map_priv_1 + adr);
+}
+
+void puma_write32(struct map_info *map, __u32 d, unsigned long adr)
+{
+    writel(d, map->map_priv_1 + adr);
+}
+
+void puma_copy_to(struct map_info *map, unsigned long to, const void *from, ssize_t len)
+{
+    memcpy_toio((void *)(map->map_priv_1 + to), from, len);
+}
+
+struct map_info puma_map = {
+	name: "PUMA-A flash",
+	size: WINDOW_SIZE,
+	buswidth: 1,
+	read8: puma_read8,
+	read16: puma_read16,
+	read32: puma_read32,
+	copy_from: puma_copy_from,
+	write8: puma_write8,
+	write16: puma_write16,
+	write32: puma_write32,
+	copy_to: puma_copy_to
+};
+
+int __init init_puma(void)
+{
+    struct mtd_partition *parts;
+    int nb_parts = 0;
+    int parsed_nr_parts = 0;
+    char *part_type;
+    struct puma_cpld *cpld;
+
+    printk(KERN_NOTICE "Momentum PUMA-A (PPC 750FX) flash device: %x at %x\n", WINDOW_SIZE, WINDOW_ADDR);
+    puma_map.map_priv_1 = (unsigned long)ioremap(WINDOW_ADDR, WINDOW_SIZE);
+    cpld = (struct puma_cpld *)ioremap(PUMA_CPLD_BASE, PUMA_CPLD_SIZE);
+
+    if (!puma_map.map_priv_1) {
+        printk("Failed to ioremap FLASH\n");
+        return -EIO;
+    }
+    if (!cpld) {
+        printk("Failed to ioremap CPLD\n");
+        return -EIO;
+    }
+    // Enable write access (so probe can work)
+    cpld->flash_ctl |= 0x20;
+    mymtd = do_map_probe("cfi_probe", &puma_map);
+    if (mymtd) {
+        mymtd->module = THIS_MODULE;
+#ifdef CONFIG_MTD_REDBOOT_PARTS
+	if (parsed_nr_parts == 0) {
+            int ret = parse_redboot_partitions(mymtd, &parsed_parts, (void *)WINDOW_ADDR);
+            if (ret > 0) {
+                part_type = "RedBoot";
+                parsed_nr_parts = ret;
+            }
+	}
+#endif
+	if (parsed_nr_parts > 0) {
+            parts = parsed_parts;
+            nb_parts = parsed_nr_parts;
+	}
+	if (nb_parts == 0) {
+            printk(KERN_NOTICE "Momentum PUMA-A flash: no partition info available, registering whole flash at once\n");
+            add_mtd_device(mymtd);
+	} else {
+            printk(KERN_NOTICE "Using %s partition definition\n", part_type);
+            add_mtd_partitions(mymtd, parts, nb_parts);
+	}
+        return 0;
+    }
+
+    iounmap((void *)puma_map.map_priv_1);
+    return -ENXIO;
+}
+
+static void __exit cleanup_puma(void)
+{
+    if (mymtd) {
+        del_mtd_device(mymtd);
+        map_destroy(mymtd);
+    }
+    if (puma_map.map_priv_1) {
+        iounmap((void *)puma_map.map_priv_1);
+        puma_map.map_priv_1 = 0;
+    }
+}
+
+module_init(init_puma);
+module_exit(cleanup_puma);
+
+MODULE_AUTHOR("Gary Thomas <gary@mlbassoc.com>");
+MODULE_DESCRIPTION("MTD map driver for Momentum PUMA-A (PPC 750FX) board");
+MODULE_LICENSE("GPL");

--=-8fS1UvKw1WVCWr5I/3f7--
