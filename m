Received: from fep02-0.kolumbus.fi ([193.229.0.44] helo=fep02-app.kolumbus.fi)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CU4CV-0008SA-DG
	for linux-mtd@lists.infradead.org; Tue, 16 Nov 2004 09:20:57 -0500
Received: from [192.168.1.10] (really [193.229.34.141])
	by fep02-app.kolumbus.fi with ESMTP
	id <20041116142036.PVEA3570.fep02-app.kolumbus.fi@[192.168.1.10]>
	for <linux-mtd@lists.infradead.org>; Tue, 16 Nov 2004 16:20:36 +0200
Message-ID: <419A0CB4.2090007@cs.helsinki.fi>
Date: Tue, 16 Nov 2004 16:20:36 +0200
From: Heikki O Lindholm <holindho@cs.helsinki.fi>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="------------060904050201080508090205"
Subject: IBM 405GP Walnut map
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------060904050201080508090205
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Here's a patch, at least, for the mailing list archive. Might be useful 
to include, since there's other support for the Walnut in the kernel, 
too. (Hopefully this list accepts attachments.)

* adds mapping for the IBM 405GP Walnut system flash

Regards,
  Heikki Lindholm

--------------060904050201080508090205
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
	name="mtd-walnut.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mtd-walnut.patch"

diff -N -u -r ./drivers/mtd/maps/Config.in /tmp/mtd/drivers/mtd/maps/Config.in
--- ./drivers/mtd/maps/Config.in	Thu Sep  2 04:27:07 2004
+++ /tmp/mtd/drivers/mtd/maps/Config.in	Tue Nov 16 15:59:27 2004
@@ -65,6 +65,7 @@
       fi
       dep_tristate '  CFI Flash device mapped on IBM Beech' CONFIG_MTD_BEECH $CONFIG_MTD_CFI $CONFIG_BEECH
       dep_tristate '  CFI Flash device mapped on IBM Arctic' CONFIG_MTD_ARCTIC $CONFIG_MTD_CFI $CONFIG_ARCTIC2
+      dep_tristate '  Flash device mapped on IBM Walnut' CONFIG_MTD_WALNUT $CONFIG_MTD_JEDECPROBE $CONFIG_WALNUT      
     fi
     if [ "$CONFIG_440" = "y" ]; then
       dep_tristate '  Flash devices mapped on IBM Ebony' CONFIG_MTD_EBONY $CONFIG_MTD_CFI $CONFIG_EBONY
diff -N -u -r ./drivers/mtd/maps/Kconfig /tmp/mtd/drivers/mtd/maps/Kconfig
--- ./drivers/mtd/maps/Kconfig	Thu Oct 21 01:57:18 2004
+++ /tmp/mtd/drivers/mtd/maps/Kconfig	Tue Nov 16 16:00:31 2004
@@ -373,6 +373,14 @@
 	  Arctic board. If you have one of these boards and would like to
 	  use the flash chips on it, say 'Y'.
 
+config MTD_WALNUT
+	tristate "Flash device mapped on IBM 405GP Walnut"
+	depends on MTD_JEDECPROBE && PPC32 && 40x && WALNUT
+	help
+	  This enables access routines for the flash chips on the IBM 405GP
+	  Walnut board. If you have one of these boards and would like to
+	  use the flash chips on it, say 'Y'.
+
 config MTD_EBONY
 	tristate "Flash devices mapped on IBM 440GP Ebony"
 	depends on MTD_CFI && PPC32 && 44x && EBONY
diff -N -u -r ./drivers/mtd/maps/Makefile.common /tmp/mtd/drivers/mtd/maps/Makefile.common
--- ./drivers/mtd/maps/Makefile.common	Tue Sep 21 17:27:16 2004
+++ /tmp/mtd/drivers/mtd/maps/Makefile.common	Tue Nov 16 15:58:16 2004
@@ -68,4 +68,5 @@
 obj-$(CONFIG_MTD_IXP4XX)	+= ixp4xx.o
 obj-$(CONFIG_MTD_IXP2000)	+= ixp2000.o
 obj-$(CONFIG_MTD_WRSBC8260)	+= wr_sbc82xx_flash.o
+obj-$(CONFIG_MTD_WALNUT)	+= walnut.o
 obj-$(CONFIG_MTD_DMV182)	+= dmv182.o
diff -N -u -r ./drivers/mtd/maps/walnut.c /tmp/mtd/drivers/mtd/maps/walnut.c
--- ./drivers/mtd/maps/walnut.c	Thu Jan  1 02:00:00 1970
+++ /tmp/mtd/drivers/mtd/maps/walnut.c	Tue Nov 16 16:03:54 2004
@@ -0,0 +1,121 @@
+/*
+ * Mapping for Walnut flash
+ * - the default Walnut configuration has an AM29F040 part (JEDEC) 
+ * - used ebony.c as a framework
+ * 
+ * Heikki Lindholm <holindho@cs.helsinki.fi>
+ * 
+ * 
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/partitions.h>
+#include <linux/config.h>
+#include <linux/version.h>
+#include <asm/io.h>
+#include <asm/ibm4xx.h>
+#include <platforms/4xx/walnut.h>
+
+/* these should be in platforms/4xx/walnut.h ? */
+#define WALNUT_FLASH_ONBD_N(x)		(x & 0x02)
+#define WALNUT_FLASH_SRAM_SEL(x)	(x & 0x01)
+#define WALNUT_FLASH_LOW		0xFFF00000
+#define WALNUT_FLASH_HIGH		0xFFF80000
+#define WALNUT_FLASH_SIZE		0x80000
+
+static struct mtd_info *flash;
+
+static struct map_info walnut_map = {
+	.name =		"Walnut flash",
+	.size =		WALNUT_FLASH_SIZE,
+	.bankwidth =	1,
+};
+
+/* Actually, the IBM OpenBIOS is the last 128k of the
+ * flash - better partitioning could be made */
+static struct mtd_partition walnut_partitions[] = {
+	{
+		.name =   "OpenBIOS",
+		.offset = 0x0,
+		.size =   WALNUT_FLASH_SIZE,
+		/*.mask_flags = MTD_WRITEABLE, */ /* force read-only */		
+	}
+};
+
+int __init init_walnut(void)
+{
+	u8 fpga_brds1;
+	void *fpga_brds1_adr;
+	void *fpga_status_adr;
+	unsigned long flash_base;
+
+	/* this should already be mapped (platform/4xx/walnut.c */
+	fpga_status_adr = ioremap(WALNUT_FPGA_BASE, 8);
+	if (!fpga_status_adr)
+		return -ENOMEM;
+
+	fpga_brds1_adr = fpga_status_adr+5;
+	fpga_brds1 = readb(fpga_brds1_adr);
+	/* iounmap(fpga_status_adr); */
+
+	if (WALNUT_FLASH_ONBD_N(fpga_brds1)) {
+		printk("On board flash is disabled (U79 sw 5)!");
+		return -EIO;
+	}
+	if (WALNUT_FLASH_SRAM_SEL(fpga_brds1)) 
+		flash_base = WALNUT_FLASH_LOW;
+	else
+		flash_base = WALNUT_FLASH_HIGH;
+	
+	walnut_map.phys = flash_base;
+	walnut_map.virt =
+		(void __iomem *)ioremap(flash_base, walnut_map.size);
+
+	if (!walnut_map.virt) {
+		printk("Failed to ioremap flash.\n");
+		return -EIO;
+	}
+
+	simple_map_init(&walnut_map);
+
+	flash = do_map_probe("jedec_probe", &walnut_map);
+	if (flash) {
+		flash->owner = THIS_MODULE;
+		add_mtd_partitions(flash, walnut_partitions,
+					ARRAY_SIZE(walnut_partitions));
+	} else {
+		printk("map probe failed for flash\n");
+		return -ENXIO;
+	}
+
+	return 0;
+}
+
+static void __exit cleanup_walnut(void)
+{
+	if (flash) {
+		del_mtd_partitions(flash);
+		map_destroy(flash);
+	}
+
+	if (walnut_map.virt) {
+		iounmap((void *)walnut_map.virt);
+		walnut_map.virt = 0;
+	}
+}
+
+module_init(init_walnut);
+module_exit(cleanup_walnut);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Heikki Lindholm <holindho@cs.helsinki.fi>");
+MODULE_DESCRIPTION("MTD map and partitions for IBM 405GP Walnut boards");

--------------060904050201080508090205--
