Received: from mailout04.sul.t-online.com ([194.25.134.18])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ETSGl-0004zv-8W
	for linux-mtd@lists.infradead.org; Sat, 22 Oct 2005 18:55:22 -0400
Received: from atlas.denx.de (atlas.denx.de [10.0.0.14])
	by denx.de (Postfix) with ESMTP id 7CD7442E7A
	for <linux-mtd@lists.infradead.org>;
	Sun, 23 Oct 2005 00:55:11 +0200 (MEST)
Received: from atlas.denx.de (localhost.localdomain [127.0.0.1])
	by atlas.denx.de (Postfix) with ESMTP id 27F1D352B25
	for <linux-mtd@lists.infradead.org>;
	Sun, 23 Oct 2005 00:55:11 +0200 (MEST)
To: linux-mtd@lists.infradead.org
From: Wolfgang Denk <wd@denx.de>
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
Date: Sun, 23 Oct 2005 00:55:11 +0200
Sender: wd@denx.de
Message-Id: <20051022225511.27F1D352B25@atlas.denx.de>
Subject: [PATCH] MTD: Add support for the "TQM834x" Boards
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[PATCH] MTD: Add support for the "TQM834x" Boards

The following patch adds support for the TQ Systems  TQM834x  Boards.
Verified on TQM8349L.

Signed-off-by: Marian Balakowicz <m8@semihalf.com>
Signed-off-by: Wolfgang Denk <wd@denx.de>

---
+ diff -u mtd/drivers/mtd/maps/Kconfig.ORIG mtd/drivers/mtd/maps/Kconfig
--- mtd/drivers/mtd/maps/Kconfig.ORIG	2005-09-18 12:46:41.000000000 +0200
+++ mtd/drivers/mtd/maps/Kconfig	2005-10-23 00:41:32.246341013 +0200
@@ -433,6 +433,14 @@
 	  Redwood board. If you have one of these boards and would like to
 	  use the flash chips on it, say 'Y'.
 
+config MTD_TQM834x
+	tristate "Flash device mapped on TQ Components TQM834x Boards"
+	depends on MTD_CFI && PPC32 && 83xx && TQM834x
+	help
+	  This enables access routines for the flash chips on the
+	  TQ Components TQM834x boards. If you have one of these boards
+	  and would like to use the flash chips on it, say 'Y'.
+
 config MTD_CSTM_MIPS_IXX
 	tristate "Flash chip mapping on ITE QED-4N-S01B, Globespan IVR or custom board"
 	depends on MIPS && MTD_CFI && MTD_JEDECPROBE && MTD_PARTITIONS
+ diff -u mtd/drivers/mtd/maps/Makefile.ORIG mtd/drivers/mtd/maps/Makefile
+ diff -u mtd/drivers/mtd/maps/Makefile.common.ORIG mtd/drivers/mtd/maps/Makefile.common
--- mtd/drivers/mtd/maps/Makefile.common.ORIG	2005-09-18 12:46:41.000000000 +0200
+++ mtd/drivers/mtd/maps/Makefile.common	2005-10-23 00:43:25.197134214 +0200
@@ -73,3 +73,4 @@
 obj-$(CONFIG_MTD_OMAP_NOR)	+= omap_nor.o
 obj-$(CONFIG_MTD_PQ2FADS)	+= pq2fads.o
 obj-$(CONFIG_MTD_MTX1)		+= mtx-1_flash.o
+obj-$(CONFIG_MTD_TQM834x)	+= tqm834x.o
+ diff -u mtd/drivers/mtd/maps/tqm834x.c.ORIG mtd/drivers/mtd/maps/tqm834x.c
--- mtd/drivers/mtd/maps/tqm834x.c.ORIG	2005-10-23 00:41:32.255339962 +0200
+++ mtd/drivers/mtd/maps/tqm834x.c	2005-10-23 00:41:32.256339845 +0200
@@ -0,0 +1,298 @@
+/*
+ * drivers/mtd/maps/tqm834x.c
+ *
+ * MTD mapping driver for TQM834x boards
+ *
+ * Copyright 2005 Wolfgang Denk, DENX Software Engineering, <wd@denx.de>.
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ *
+ */
+
+#include <linux/config.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <asm/io.h>
+#include <asm/ppcboot.h>
+
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/partitions.h>
+
+#if 0	/* Debugging turned off */
+# define debugk(fmt,args...)	printk(fmt ,##args)
+#else
+# define debugk(fmt,args...)
+#endif
+
+#define FLASH_BANK_MAX	2
+
+extern unsigned char __res[];
+
+/* trivial struct to describe partition information */
+struct mtd_part_def
+{
+	int nums;
+	unsigned char *type;
+	struct mtd_partition* mtd_part;
+};
+
+static struct mtd_info* mtd_banks[FLASH_BANK_MAX];
+static struct map_info* map_banks[FLASH_BANK_MAX];
+static struct mtd_part_def part_banks[FLASH_BANK_MAX];
+
+static unsigned long num_banks;
+static unsigned long start_scan_addr;
+
+#ifdef CONFIG_MTD_PARTITIONS
+/*
+ * The following defines the partition layout of TQM834x boards.
+ *
+ * See include/linux/mtd/partitions.h for definition of the
+ * mtd_partition structure.
+ *
+ * Assume minimal initial size of 4 MiB per bank, will be updated
+ * later in init_tqm834x_mtd() routine.
+ */
+
+/* Partition definition for the first flash bank which is always present. */
+static struct mtd_partition tqm834x_partitions_bank1[] = {
+	{
+		name:	"u-boot",		/* u-boot firmware	*/
+		offset:	0x00000000,
+		size:	0x00040000,		/* 256 KiB		*/
+		/*mask_flags: MTD_WRITEABLE,	 * force read-only	*/
+	},
+	{
+		name:	"env",			/* u-boot environment	*/
+		offset:	0x00040000,
+		size:	0x00020000,		/* 128 KiB		*/
+		/*mask_flags: MTD_WRITEABLE,	 * force read-only	*/
+	},
+	{
+		name:	"kernel",		/* linux kernel image	*/
+		offset:	0x00060000,
+		size:	0x00100000,		/* 1 MiB		*/
+		/*mask_flags: MTD_WRITEABLE,	 * force read-only	*/
+	},
+	{
+		name:	"initrd",		/* ramdisk image	*/
+		offset:	0x00160000,
+		size:	0x00200000,		/* 2 MiB		*/
+	},
+	{
+		name:	"user",			/* user data		*/
+		offset:	0x00360000,
+		size:	0x000a0000,		/* remaining space	*/
+		/* NOTE: this parttion size is re-calcated in		*/
+		/* init_tqm834x_mtd() to cover actual remaining space.	*/
+	},
+};
+
+/* Partition definition for the second flash bank which may be present on some
+ * TQM834x boards.
+ */
+static struct mtd_partition tqm834x_partitions_bank2[] = {
+	{
+		name:	"jffs2",		/* jffs2 filesystem	*/
+		offset:	0x00000000,
+		size:	0x00400000,		/* whole device		*/
+		/* NOTE: this parttion size is re-calcated in		*/
+		/* init_tqm834x_mtd() to cover actual device size.	*/
+	},
+};
+
+#endif	/* CONFIG_MTD_PARTITIONS */
+
+#define NB_OF(x)  (sizeof(x)/sizeof(x[0]))
+
+int __init init_tqm834x_mtd(void)
+{
+	int idx = 0, ret = 0;
+	unsigned long flash_addr, flash_size, mtd_size = 0;
+
+	/* pointer to TQM834x board info data */
+	bd_t *bd = (bd_t *)__res;
+#ifdef CONFIG_MTD_CMDLINE_PARTS
+	int n;
+	char mtdid[4];
+	const char *part_probes[] = { "cmdlinepart", NULL };
+#endif
+
+	flash_addr = bd->bi_flashstart;
+	flash_size = bd->bi_flashsize;
+
+	/* request maximum flash size address space */
+	start_scan_addr = (unsigned long)ioremap(flash_addr, flash_size);
+	if (!start_scan_addr) {
+		printk("%s: Failed to ioremap address: 0x%lx\n",
+			__FUNCTION__, flash_addr);
+		return -EIO;
+	}
+
+	for(idx = 0 ; idx < FLASH_BANK_MAX ; idx++) {
+		if (mtd_size >= flash_size)
+			break;
+
+		debugk ("%s: chip probing count %d\n", __FUNCTION__, idx);
+
+		map_banks[idx] = (struct map_info *)kmalloc(sizeof(struct map_info),
+							GFP_KERNEL);
+		if (map_banks[idx] == NULL) {
+			ret = -ENOMEM;
+			goto error_mem;
+		}
+		memset((void *)map_banks[idx], 0, sizeof(struct map_info));
+		map_banks[idx]->name = (char *)kmalloc(16, GFP_KERNEL);
+		if (map_banks[idx]->name == NULL) {
+			ret = -ENOMEM;
+			goto error_mem;
+		}
+		memset((void *)map_banks[idx]->name, 0, 16);
+
+		sprintf(map_banks[idx]->name, "TQM834x-%d", idx);
+		map_banks[idx]->size = flash_size;
+		map_banks[idx]->bankwidth = 4;
+
+		simple_map_init(map_banks[idx]);
+
+		map_banks[idx]->virt = (void __iomem *)
+			(start_scan_addr + ((idx > 0) ?
+			(mtd_banks[idx-1] ? mtd_banks[idx-1]->size : 0) : 0));
+		map_banks[idx]->phys =
+			flash_addr + ((idx > 0) ?
+			(mtd_banks[idx-1] ? mtd_banks[idx-1]->size : 0) : 0);
+
+		/* start to probe flash chips */
+		mtd_banks[idx] = do_map_probe("cfi_probe", map_banks[idx]);
+		if (mtd_banks[idx]) {
+			mtd_banks[idx]->owner = THIS_MODULE;
+			mtd_size += mtd_banks[idx]->size;
+			num_banks++;
+			debugk ("%s: bank %ld, name: %s, size: %d bytes \n",
+				__FUNCTION__, num_banks,
+				mtd_banks[idx]->name, mtd_banks[idx]->size);
+		}
+	}
+
+	/* no supported flash chips found */
+	if (!num_banks) {
+		printk("TQM834x: No supported flash chips found!\n");
+		ret = -ENXIO;
+		goto error_mem;
+	}
+
+#ifdef CONFIG_MTD_PARTITIONS
+	/*
+	 * Select static partition definitions
+	 */
+	n = NB_OF(tqm834x_partitions_bank1);
+	part_banks[0].mtd_part	= tqm834x_partitions_bank1;
+	part_banks[0].type	= "static image bank1";
+	part_banks[0].nums	= n;
+
+	/* update last partition size to cover actual remaining space */
+	tqm834x_partitions_bank1[n - 1].size =
+		mtd_banks[0]->size -
+		tqm834x_partitions_bank1[n - 1].offset;
+	
+	/* check if we have second bank? */
+	if (num_banks == 2) {
+		n = NB_OF(tqm834x_partitions_bank2);
+		part_banks[1].mtd_part	= tqm834x_partitions_bank2;
+		part_banks[1].type	= "static image bank2";
+		part_banks[1].nums	= n;
+
+		/* update last partition size to cover actual remaining space */
+		tqm834x_partitions_bank2[n - 1].size =
+			mtd_banks[1]->size -
+			tqm834x_partitions_bank2[n - 1].offset;
+	}
+
+	for(idx = 0; idx < num_banks ; idx++) {
+#ifdef CONFIG_MTD_CMDLINE_PARTS
+		sprintf(mtdid, "%d", idx);
+		n = parse_mtd_partitions(mtd_banks[idx],
+				part_probes,
+				&part_banks[idx].mtd_part,
+				0);
+		debugk ("%s: %d command line partitions on bank %s\n",
+				__FUNCTION__, n, mtdid);
+		if (n > 0) {
+			part_banks[idx].type = "command line";
+			part_banks[idx].nums = n;
+		}
+#endif	/* CONFIG_MTD_CMDLINE_PARTS */
+		if (part_banks[idx].nums == 0) {
+			printk (KERN_NOTICE
+				"TQM834x flash bank %d: no partition info "
+				"available, registering whole device\n", idx);
+			add_mtd_device(mtd_banks[idx]);
+		} else {
+			printk (KERN_NOTICE 
+				"TQM834x flash bank %d: Using %s partition "
+				"definition\n", idx, part_banks[idx].type);
+			add_mtd_partitions (mtd_banks[idx],
+					part_banks[idx].mtd_part, 
+					part_banks[idx].nums);
+		}
+	}
+#else	/* ! CONFIG_MTD_PARTITIONS */
+	printk (KERN_NOTICE "TQM834x flash: registering %d flash banks "
+			"at once\n", num_banks);
+
+	for(idx = 0 ; idx < num_banks ; idx++) {
+		add_mtd_device(mtd_banks[idx]);
+	}
+#endif	/* CONFIG_MTD_PARTITIONS */
+
+	return 0;
+error_mem:
+	for (idx = 0 ; idx < FLASH_BANK_MAX ; idx++) {
+		if (map_banks[idx] != NULL) {
+			if (map_banks[idx]->name != NULL) {
+				kfree(map_banks[idx]->name);
+				map_banks[idx]->name = NULL;
+			}
+			kfree(map_banks[idx]);
+			map_banks[idx] = NULL;
+		}
+	}
+
+	iounmap((void *)start_scan_addr);
+
+	return ret;
+}
+
+static void __exit cleanup_tqm834x_mtd(void)
+{
+	unsigned int idx = 0;
+	for(idx = 0 ; idx < num_banks ; idx++) {
+		/* destroy mtd_info previously allocated */
+		if (mtd_banks[idx]) {
+			del_mtd_partitions(mtd_banks[idx]);
+			map_destroy(mtd_banks[idx]);
+		}
+
+		/* release map_info not used anymore */
+		kfree(map_banks[idx]->name);
+		kfree(map_banks[idx]);
+	}
+
+	if (start_scan_addr) {
+		iounmap((void *)start_scan_addr);
+		start_scan_addr = 0;
+	}
+}
+
+module_init(init_tqm834x_mtd);
+module_exit(cleanup_tqm834x_mtd);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Wolfgang Denk <wd@denx.de>");
+MODULE_DESCRIPTION("MTD map driver for TQM834x boards");




Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
"The bad reputation UNIX has gotten is totally undeserved, laid on by
people who don't understand, who have not gotten in there  and  tried
anything."          -- Jim Joyce, owner of Jim Joyce's UNIX Bookstore
