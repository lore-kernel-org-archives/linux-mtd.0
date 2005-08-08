Received: from rt-soft-2.moscow.itn.ru ([80.240.96.70] helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E2AMn-0002BI-A9
	for linux-mtd@lists.infradead.org; Mon, 08 Aug 2005 12:20:48 -0400
Message-ID: <42F7865B.2020502@ru.mvista.com>
Date: Mon, 08 Aug 2005 20:20:43 +0400
From: Vitaly Bordug <vbordug@ru.mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="------------070704010908050606040702"
Subject: [PATCH] Support of PQ2FADS flash SIMM
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------070704010908050606040702
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit

[MTD] MAPS: map for sharp flash (jedec-compatible) on PQ2FADS-like board

This could be handled with the PHYSMAP driver (and config options), but 
such solution only works for the kernel builtin physmap driver case.
This implementation supports both default static partition table as well 
as cmdline override.
Comments are welcome...

Signed-off-by: Vitaly Bordug <vbordug@ru.mvista.com>

-- 
Sincerely, 
Vitaly


--------------070704010908050606040702
Content-Type: text/x-patch;
 name="mtd-pq2fads.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mtd-pq2fads.patch"

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -523,6 +523,12 @@ config MTD_MPC1211
 	  This enables access to the flash chips on the Interface MPC-1211(CTP/PCI/MPC-SH02).
 	  If you have such a board, say 'Y'.
 
+config MTD_PQ2FADS
+	tristate "JEDEC flash SIMM mapped on PQ2FADS and 8272ADS boards"
+	depends on (ADS8272 || PQ2FADS) && MTD_PARTITIONS && MTD_JEDECPROBE && MTD_PHYSMAP && MTD_CFI_GEOMETRY && MTD_CFI_INTELEXT
+	help
+	 This enables access to flash SIMM on PQ2FADS-like boards
+
 config MTD_OMAP_NOR
 	tristate "TI OMAP board mappings"
 	depends on MTD_CFI && ARCH_OMAP
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_MTD_MAINSTONE)	+= mainstone
 obj-$(CONFIG_MTD_MBX860)	+= mbx860.o
 obj-$(CONFIG_MTD_CEIVA)		+= ceiva.o
 obj-$(CONFIG_MTD_OCTAGON)	+= octagon-5066.o
+obj-$(CONFIG_MTD_PQ2FADS)	+= pq2fads.o
 obj-$(CONFIG_MTD_PHYSMAP)	+= physmap.o 
 obj-$(CONFIG_MTD_PNC2000)	+= pnc2000.o
 obj-$(CONFIG_MTD_PCMCIA)	+= pcmciamtd.o
diff --git a/drivers/mtd/maps/pq2fads.c b/drivers/mtd/maps/pq2fads.c
new file mode 100644
--- /dev/null
+++ b/drivers/mtd/maps/pq2fads.c
@@ -0,0 +1,88 @@
+/*
+ * drivers/mtd/maps/pq2fads.c
+ *
+ * Mapping for the flash SIMM on 8272ADS and PQ2FADS board
+ *
+ * Author: Vitaly Bordug <vbordug@ru.mvista.com>
+ *
+ * 2005 (c) MontaVista Software, Inc. This file is licensed under
+ * the terms of the GNU General Public License version 2. This program
+ * is licensed "as is" without any warranty of any kind, whether express
+ * or implied.
+ */
+
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <asm/io.h>
+#include <asm/ppcboot.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/partitions.h>
+#include <linux/mtd/physmap.h>
+
+/*
+  NOTE: bank width and interleave relative to the installed flash 
+  should have been chosen within MTD_CFI_GEOMETRY options.
+  */
+#define PQ2FADS_BANK_WIDTH 4
+
+static struct mtd_partition pq2fads_partitions[] = {
+	{
+#ifdef CONFIG_ADS8272
+		.name		= "HRCW",
+		.size		= 0x40000,
+		.offset 	= 0,
+		.mask_flags	= MTD_WRITEABLE,  /* force read-only */
+	}, { 
+		.name		= "User FS",
+		.size		= 0x5c0000,
+		.offset 	= 0x40000,
+#else
+		.name		= "User FS",
+		.size		= 0x600000,
+		.offset 	= 0,
+#endif
+	}, {    
+		.name		= "uImage",
+		.size		= 0x100000,
+		.offset 	= 0x600000,
+		.mask_flags	= MTD_WRITEABLE,  /* force read-only */
+	}, {    
+		.name		= "bootloader",
+		.size		= 0x40000,
+		.offset		= 0x700000,
+		.mask_flags	= MTD_WRITEABLE,  /* force read-only */
+	}, {    
+		.name		= "bootloader env",
+		.size		= 0x40000,
+		.offset		= 0x740000,
+		.mask_flags	= MTD_WRITEABLE,  /* force read-only */
+	}
+};
+
+
+/* pointer to MPC885ADS board info data */
+extern unsigned char __res[];
+
+static int __init init_pq2fads_mtd(void)
+{
+	bd_t *bd = (bd_t *)__res;
+	physmap_configure(bd->bi_flashstart, bd->bi_flashsize, PQ2FADS_BANK_WIDTH, NULL);
+
+	physmap_set_partitions(pq2fads_partitions,
+				sizeof (pq2fads_partitions) /
+				sizeof (pq2fads_partitions[0]));
+	return 0;
+}
+
+static void __exit cleanup_pq2fads_mtd(void)
+{
+}
+                                                                                                                                                    
+module_init(init_pq2fads_mtd);
+module_exit(cleanup_pq2fads_mtd);
+                                                                                                                                                    
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MTD map and partitions for MPC8272ADS boards");

--------------070704010908050606040702--
