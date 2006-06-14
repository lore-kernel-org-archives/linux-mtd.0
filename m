Received: from moutng.kundenserver.de ([212.227.126.186])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FqW6K-0004Oz-0X
	for linux-mtd@lists.infradead.org; Wed, 14 Jun 2006 10:12:16 -0400
Received: from localhost (localhost [127.0.0.1])
	by comm-neu.esd (Postfix) with ESMTP id B787910979F
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Jun 2006 16:06:25 +0200 (CEST)
Received: from comm-neu.esd ([127.0.0.1])
	by localhost (comm [127.0.0.1]) (amavisd-new, port 10024) with LMTP
	id 08761-02-9 for <linux-mtd@lists.infradead.org>;
	Wed, 14 Jun 2006 16:06:25 +0200 (CEST)
Received: from [10.0.18.190] (pc-linux-dev.esd [10.0.18.190])
	by comm-neu.esd (Postfix) with ESMTP id 58FCA109792
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Jun 2006 16:06:25 +0200 (CEST)
Message-ID: <449017E0.7070008@esd-electronics.com>
Date: Wed, 14 Jun 2006 16:06:24 +0200
From: Matthias Fuchs <matthias.fuchs@esd-electronics.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: Add support for the CPCI405 board
Content-Type: multipart/mixed; boundary="------------040805070405010509010500"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------040805070405010509010500
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

This patch adds MTD support for the NOR flash on CPCI405 boards.

These boards may have different flash chips installed. Some of them
are detected by the cfi probing. Others need the jedec_probe support.
The patch also adds support for SST39VF3201 chips in jedec_probe.c

The patch is tested with all available flash combinations against
the recent mtd-2.6.git repository.

Regards
Matthias

Signed-off-by: Matthias Fuchs <matthias.fuchs@esd-electronics.com>



--------------040805070405010509010500
Content-Type: text/plain;
 name="cpci405_mtd_2006_06_14.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="cpci405_mtd_2006_06_14.patch"

diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index 517ea33..f99f73e 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -147,6 +147,7 @@ #define SST29LE512	0x003d
 #define SST39LF800	0x2781
 #define SST39LF160	0x2782
 #define SST39VF1601	0x234b
+#define SST39VF3201	0x235b
 #define SST39LF512	0x00D4
 #define SST39LF010	0x00D5
 #define SST39LF020	0x00D6
@@ -1483,6 +1484,22 @@ static const struct amd_flash_info jedec
                }
 
        }, {
+               .mfr_id         = MANUFACTURER_SST,     /* should be CFI */
+               .dev_id         = SST39VF3201,
+               .name           = "SST 39VF3201",
+               .uaddr          = {
+                       [0] = MTD_UADDR_0x5555_0x2AAA,  /* x8 */
+                       [1] = MTD_UADDR_0x5555_0x2AAA   /* x16 */
+               },
+               .DevSize        = SIZE_4MiB,
+               .CmdSet         = P_ID_AMD_STD,
+               .NumEraseRegions= 2,
+               .regions        = {
+                       ERASEINFO(0x1000,512),
+                       ERASEINFO(0x1000,512)
+               }
+
+       }, {
 		.mfr_id		= MANUFACTURER_ST,	/* FIXME - CFI device? */
 		.dev_id		= M29W800DT,
 		.name		= "ST M29W800DT",
diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 6bdaacc..9fd9c25 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -323,6 +323,14 @@ config MTD_WALNUT
 	  Walnut board. If you have one of these boards and would like to
 	  use the flash chips on it, say 'Y'.
 
+config MTD_CPCI405
+	tristate "Flash devices mapped on esd CPCI405"
+	depends on MTD_JEDECPROBE && CPCI405
+	help
+	  This enables access routines for the flash chips on the esd
+	  CPCI405 board.  If you have this board and would like to use the
+	  flash chips on it, say 'Y'.
+
 config MTD_EBONY
 	tristate "Flash devices mapped on IBM 440GP Ebony"
 	depends on MTD_JEDECPROBE && EBONY
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index ab71f17..c298dc3 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -58,6 +58,7 @@ obj-$(CONFIG_MTD_OCOTEA)	+= ocotea.o
 obj-$(CONFIG_MTD_BEECH)		+= beech-mtd.o
 obj-$(CONFIG_MTD_ARCTIC)	+= arctic-mtd.o
 obj-$(CONFIG_MTD_WALNUT)        += walnut.o
+obj-$(CONFIG_MTD_CPCI405)	+= cpci405-mtd.o
 obj-$(CONFIG_MTD_H720X)		+= h720x-flash.o
 obj-$(CONFIG_MTD_SBC8240)	+= sbc8240.o
 obj-$(CONFIG_MTD_NOR_TOTO)	+= omap-toto-flash.o
diff --git a/drivers/mtd/maps/cpci405-mtd.c b/drivers/mtd/maps/cpci405-mtd.c
new file mode 100644
index 0000000..ff2ae75
--- /dev/null
+++ b/drivers/mtd/maps/cpci405-mtd.c
@@ -0,0 +1,142 @@
+/*
+ *  drivers/mtd/maps/cpci405-mtd.c
+ *
+ *  Mapping for esd CPCI405 onboard flash
+ *
+ *  Copyright (c) 2006 electronic system design gmbh
+ *
+ *  Author:
+ *  Matthias Fuchs <matthias.fuchs@esd-electronics.com>
+ *
+ *  This program is free software; you can redistribute  it and/or modify it
+ *  under  the terms of  the GNU General  Public License as published by the
+ *  Free Software Foundation;  either version 2 of the  License, or (at your
+ *  option) any later version.
+ */
+
+#include <linux/config.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/partitions.h>
+
+#include <asm/io.h>
+#include <asm/ibm4xx.h>
+#include <asm/ppcboot.h>
+
+extern bd_t __res;
+
+#define P0_KERNEL_SIZE_MIN 0x100000
+#define P0_KERNEL_SIZE_MAX 0x140000
+#define P1_INITRD_SIZE	   0x180000
+#define P3_UBOOT_SIZE	   0x040000
+
+static struct mtd_partition cpci405_flash_partitions[] = {
+	{
+		.name = "kernel",
+		.offset = 0,
+		.size = P0_KERNEL_SIZE_MIN
+	},
+	{
+		.name = "initrd",
+		.offset = MTDPART_OFS_APPEND,
+		.size = P1_INITRD_SIZE
+	},
+	{
+		.name = "data",
+		.offset = MTDPART_OFS_APPEND,
+                /* size of partition 2 will be calculated at
+		   runtime dependent on the total flash size
+		*/
+	},
+	{
+		.name = "u-boot",
+		.offset = MTDPART_OFS_APPEND,
+		.size = P3_UBOOT_SIZE
+	}
+};
+
+static struct map_info cpci405_flash_map = {
+	.name = "CPCI405 Flash",
+	.bankwidth = 2,
+};
+
+static struct mtd_info *cpci405_mtd;
+
+static int __init init_cpci405_flash(void)
+{
+	unsigned long long flash_base;
+	unsigned long flash_size;
+
+	flash_base = __res.bi_flashstart;
+	flash_size = __res.bi_flashsize;
+
+	cpci405_flash_map.size = flash_size;
+	cpci405_flash_map.phys = flash_base;
+	cpci405_flash_map.virt = ioremap(flash_base, cpci405_flash_map.size);
+
+	if (!cpci405_flash_map.virt) {
+		printk(KERN_NOTICE "init_cpci405_flash: failed to ioremap\n");
+		return -EIO;
+	}
+
+	/*
+	 * Adjust kernel partition when we have a huge flash
+	 */
+	if (cpci405_flash_map.size > 0x400000) {
+		cpci405_flash_partitions[0].size = P0_KERNEL_SIZE_MAX;
+	}
+
+	/*
+	 * Adjust data partition to use the remaining flash
+	 */
+	cpci405_flash_partitions[2].size = cpci405_flash_map.size -
+		cpci405_flash_partitions[0].size - 
+		P1_INITRD_SIZE - P3_UBOOT_SIZE;
+
+	simple_map_init(&cpci405_flash_map);
+
+	/* 
+	 * On some boards there are CFI compatable flashes installed ...
+	 */
+	cpci405_mtd = do_map_probe("cfi_probe", &cpci405_flash_map);
+	if (!cpci405_mtd) {
+		/*
+		 * ... some others use SST flashes that are currently not 
+		 * detected by the cfi code, but jedec_probe works for these.
+		 */
+		cpci405_mtd = do_map_probe("jedec_probe", &cpci405_flash_map);
+	}
+
+	if (cpci405_mtd) {
+		cpci405_mtd->owner = THIS_MODULE;
+		return add_mtd_partitions(cpci405_mtd,
+					  cpci405_flash_partitions,
+					  ARRAY_SIZE(cpci405_flash_partitions));
+	} else {
+		printk(KERN_NOTICE \
+		       "init_cpci405_flash: failed to probe flash\n");
+	}
+
+	return -ENXIO;
+}
+
+static void __exit cleanup_cpci405_flash(void)
+{
+	if (cpci405_mtd) {
+		del_mtd_partitions(cpci405_mtd);
+		map_destroy(cpci405_mtd);
+		iounmap(cpci405_flash_map.virt);
+	}
+}
+
+module_init(init_cpci405_flash);
+module_exit(cleanup_cpci405_flash);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Matthias Fuchs <matthias.fuchs@esd-electronics.com>");
+MODULE_DESCRIPTION("MTD map for esd CPCI405 onboard flash");

--------------040805070405010509010500--
