Received: from florence.buici.com ([206.124.142.26])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BZBeu-0003mg-1A
	for linux-mtd@lists.infradead.org; Sat, 12 Jun 2004 12:47:10 -0400
Date: Sat, 12 Jun 2004 09:47:06 -0700
From: Marc Singer <elf@buici.com>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20040612164706.GA11273@buici.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD Maps driver for Sharp LH7a40x
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is the MTD patch.


diff -Nru a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
--- a/drivers/mtd/maps/Kconfig	Sat Jun  5 10:30:48 2004
+++ b/drivers/mtd/maps/Kconfig	Sat Jun  5 10:30:48 2004
@@ -421,6 +421,14 @@
 	  Excalibur XA10 Development Board. If you are building a kernel
 	  for on of these boards then you should say 'Y' otherwise say 'N'.
 
+config MTD_LPD7A40X
+	tristate "CFI Flash device mapped on Logic PD LH7A40X-10 Card Engines"
+	depends on (MACH_LPD7A400 || MACH_LPD7A404) && MTD_CFI_INTELEXT && MTD_PARTITIONS
+	help
+	  This provides a driver for the on-board flash of the Logic PD
+	  LH7A40X-10 Card Engines.  Static partition mappings
+	  correspond to the BLOB loader's layout.
+
 config MTD_FORTUNET
 	tristate "CFI Flash device mapped on the FortuNet board"
 	depends on ARM && MTD_CFI && MTD_PARTITIONS && SA1100_FORTUNET
diff -Nru a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
--- a/drivers/mtd/maps/Makefile	Sat Jun  5 10:30:48 2004
+++ b/drivers/mtd/maps/Makefile	Sat Jun  5 10:30:48 2004
@@ -56,3 +56,4 @@
 obj-$(CONFIG_MTD_ARCTIC)	+= arctic-mtd.o
 obj-$(CONFIG_MTD_H720X)		+= h720x-flash.o
 obj-$(CONFIG_MTD_IXP4XX)	+= ixp4xx.o
+obj-$(CONFIG_MTD_LPD7A40X)	+= lpd7a400-flash.o
diff -Nru a/drivers/mtd/maps/lpd7a400-flash.c b/drivers/mtd/maps/lpd7a400-flash.c
--- /dev/null	Wed Dec 31 16:00:00 1969
+++ b/drivers/mtd/maps/lpd7a400-flash.c	Sat Jun  5 10:30:48 2004
@@ -0,0 +1,171 @@
+/* drivers/mtd/maps/lpd7a400-flash.c
+ *
+ *  Copyright (C) 2004 Coastal Environmental Systems
+ *
+ *  This program is free software; you can redistribute it and/or
+ *  modify it under the terms of the GNU General Public License
+ *  version 2 as published by the Free Software Foundation.
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
+#include <asm/hardware.h>
+
+
+#define FLASH_PHYS	0x00000000
+#define FLASH_SIZE	0x01000000 /* 16MB */
+#define FLASH_BUSWIDTH	32
+
+#define WINDOW_SIZE 	64*1024*1024 /* Flash mapping window */
+
+static struct map_info lpd7a400_maps[] = {
+	{
+		.name =		"LPD7A40x-10 Flash",
+		.phys =		FLASH_PHYS,
+		.size =		WINDOW_SIZE,
+		.buswidth =	FLASH_BUSWIDTH/8,
+	}
+};
+#define C_MAPS (ARRAY_SIZE (lpd7a400_maps))
+
+static struct mtd_partition lpd7a400_partitions[] = {
+	{
+		.name =		"BLOB boot loader",
+		.offset =	0x00000000,
+		.size =		0x00040000,
+		.mask_flags =	MTD_WRITEABLE /* r/o */
+	},
+	{
+		.name =		"BLOB parameters",
+		.size =		0x00040000,
+		.offset =	0x00040000,
+		.mask_flags =	MTD_WRITEABLE /* r/o */
+	},
+	{
+		.name =		"kernel",
+		.offset =	0x00080000,
+		.size =		0x00180000,
+	},
+	{
+		.name =		"user",
+		.offset =	0x00200000,
+		.size =		MTDPART_SIZ_FULL,
+	}
+};
+
+static struct mtd_info *lpd7a400_mtds[C_MAPS];
+static struct mtd_partition *parsed_parts[C_MAPS];
+static int nr_parsed_parts[C_MAPS];
+
+static const char *probes[] = { NULL };
+
+static int __init init_flash_lpd7a400(void)
+{
+	int ret = 0, i;
+	int cPartitions = 0;
+
+	for (i = 0; i < C_MAPS; ++i) {
+		lpd7a400_maps[i].virt
+			= (unsigned long) __ioremap (lpd7a400_maps[i].phys,
+						     lpd7a400_maps[i].size,
+						     0, 0);
+
+		if (!lpd7a400_maps[i].virt) {
+			printk (KERN_WARNING "Failedioremap %s\n",
+				lpd7a400_maps[i].name);
+			if (!ret)
+				ret = -ENOMEM;
+			continue;
+		}
+
+		simple_map_init (&lpd7a400_maps[i]);
+
+		printk (KERN_NOTICE "Probing \"%s\" "
+			"at physical address 0x%08lx\n",
+			lpd7a400_maps[i].name, lpd7a400_maps[i].phys);
+
+		lpd7a400_mtds[i]
+			= do_map_probe ("cfi_probe", &lpd7a400_maps[i]);
+		
+		if (!lpd7a400_mtds[i]) {
+			iounmap ((void*) lpd7a400_maps[i].virt);
+			if (!ret)
+				ret = -EIO;
+			continue;
+		}
+		++cPartitions;
+		lpd7a400_mtds[i]->owner = THIS_MODULE;
+
+		int ret = parse_mtd_partitions (lpd7a400_mtds[i], probes,
+						&parsed_parts[i], 0);
+
+		if (ret > 0)
+			nr_parsed_parts[i] = ret;
+	}
+
+	if (!cPartitions)
+		return ret;
+	
+	for (i = 0; i < C_MAPS; i++) {
+		if (!lpd7a400_mtds[i]) {
+			printk (KERN_WARNING "%s is absent. Skipping\n",
+				lpd7a400_maps[i].name);
+		}
+		else if (nr_parsed_parts[i]) {
+			add_mtd_partitions (lpd7a400_mtds[i],
+					    parsed_parts[i],
+					    nr_parsed_parts[i]);
+		}
+		else  {
+			printk("Using static partitions on \"%s\"\n",
+			       lpd7a400_maps[i].name);
+			add_mtd_partitions (lpd7a400_mtds[i],
+					    lpd7a400_partitions,
+					    ARRAY_SIZE (lpd7a400_partitions));
+		}
+#if 0
+		else {
+			printk ("Registering %s as whole device\n",
+				lpd7a400_maps[i].name);
+			add_mtd_device(lpd7a400_mtds[i]);
+		}
+#endif
+	}
+	return 0;
+}
+
+static void __exit cleanup_flash_lpd7a400(void)
+{
+	int i;
+	for (i = 0; i < C_MAPS; i++) {
+		if (!lpd7a400_mtds[i])
+			continue;
+
+/*		if (nr_parsed_parts[i] || !i) */
+			del_mtd_partitions (lpd7a400_mtds[i]);
+/*
+		else
+			del_mtd_device (lpd7a400_mtds[i]);
+*/
+
+		map_destroy (lpd7a400_mtds[i]);
+		iounmap ((void*) lpd7a400_maps[i].virt);
+
+		if (parsed_parts[i])
+			kfree (parsed_parts[i]);
+	}
+}
+
+module_init(init_flash_lpd7a400);
+module_exit(cleanup_flash_lpd7a400);
+
+MODULE_AUTHOR("Marc Singer");
+MODULE_DESCRIPTION("MTD map driver for Logic PD LPD7A40x-10 CardEngines");
+MODULE_LICENSE("GPL");
