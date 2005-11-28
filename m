Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EgoBV-0007G6-Bi
	for linux-mtd@lists.infradead.org; Mon, 28 Nov 2005 13:57:11 -0500
Message-ID: <438B52FE.9040802@ru.mvista.com>
Date: Mon, 28 Nov 2005 21:57:02 +0300
From: Vitaly Bordug <vbordug@ru.mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="------------090907030807060303020805"
Subject: [PATCH] MTD: Add support for the MPC8xxADS boards
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------090907030807060303020805
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit

The following patch adds support for the JEDEC-compatible flashes on the MPC8xxADS boards.
Currently verified with MPC885ADS and MPC 866ADS. The patch is against MTD git tree.

Signed-off-by: Vitaly Bordug <vbordug@ru.mvista.com>


-- 
Sincerely, 
Vitaly

--------------090907030807060303020805
Content-Type: text/x-patch;
 name="8xx_mtd_map2.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="8xx_mtd_map2.patch"

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 846a533..1ece64c 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -284,6 +284,14 @@ config MTD_MBX860
 	  MBX860 board. If you have one of these boards and would like
 	  to use the flash chips on it, say 'Y'.
 
+config MTD_MPC8xxADS
+	tristate "JEDEC flash SIMM mapped on MPC8xxADS boards"
+	depends on (MPC885ADS || MPC86XADS) && MTD_PARTITIONS && MTD_JEDECPROBE && MTD_PHYSMAP && MTD_CFI_GEOMETRY && MTD_CFI_INTELEXT
+	help
+	  This enables access routines for the flash chips on the Freescale
+	  MPC8xxADS boards. If you have this board and would like
+	  to use the flash chips on it, say 'Y'.
+
 config MTD_DBOX2
 	tristate "CFI Flash device mapped on D-Box2"
 	depends on DBOX2 && MTD_CFI_INTELSTD && MTD_CFI_INTELEXT && MTD_CFI_AMDSTD
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index 7d9e940..913def2 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -73,3 +73,4 @@ obj-$(CONFIG_MTD_OMAP_NOR)	+= omap_nor.o
 obj-$(CONFIG_MTD_PQ2FADS)	+= pq2fads.o
 obj-$(CONFIG_MTD_MTX1)		+= mtx-1_flash.o
 obj-$(CONFIG_MTD_TQM834x)	+= tqm834x.o
+obj-$(CONFIG_MTD_MPC8xxADS)	+= mpc8xxads.o
diff --git a/drivers/mtd/maps/mpc8xxads.c b/drivers/mtd/maps/mpc8xxads.c
new file mode 100644
index 0000000..192c4ea
--- /dev/null
+++ b/drivers/mtd/maps/mpc8xxads.c
@@ -0,0 +1,63 @@
+/*
+ * drivers/mtd/maps/mpc8xxads.c
+ *
+ * Mapping for Motorola mpc8xxads flash
+ *
+ * Author: source@mvista.com
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
+
+#define MPC8xxADS_U_BOOT_SIZE		0x80000
+#define MPC8xxADS_FREE_AREA_OFFSET	MPC8xxADS_U_BOOT_SIZE
+
+static struct mtd_partition mpc8xxads_partitions[] = {
+	{
+		.name = "bootloader",
+		.size = MPC8xxADS_U_BOOT_SIZE,
+		.offset = 0,
+		.mask_flags   = MTD_WRITEABLE,  /* force read-only */
+	}, {
+		.name = "User FS",
+		.offset = MPC8xxADS_FREE_AREA_OFFSET
+	}
+};
+
+/* pointer to MPC885ADS board info data */
+extern unsigned char __res[];
+
+static int __init init_mpc8xxads_mtd(void)
+{
+	bd_t *bd = (bd_t *)__res;
+
+	physmap_configure(bd->bi_flashstart, bd->bi_flashsize, 4, NULL);
+	physmap_set_partitions(mpc8xxads_partitions,
+				sizeof (mpc8xxads_partitions) /
+				sizeof (mpc8xxads_partitions[0]));
+	return 0;
+}
+
+static void __exit cleanup_mpc8xxads_mtd(void)
+{
+}
+
+module_init(init_mpc8xxads_mtd);
+module_exit(cleanup_mpc8xxads_mtd);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MTD map and partitions for MPC8xxADS boards");

--------------090907030807060303020805--
