Received: from n79.bullet.mail.sp1.yahoo.com ([98.136.44.39])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Js3Mv-0007N0-71
	for linux-mtd@lists.infradead.org; Fri, 02 May 2008 22:04:41 +0000
Date: Fri, 2 May 2008 15:04:39 -0700 (PDT)
From: Justin Treon <justin_treon@yahoo.com>
Subject: [Patch][MTD][NAND] Rodan NAND controller
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <567477.3675.qm@web43132.mail.sp1.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adds support for the custom add-on card for Marvell PXA27x Applications Processor
Developer Kit we call "Rodan".

Signed-off-by: Justin Treon <justin_treon@yahoo.com>
Signed-off-by: Jared Hulbert <jaredeh@gmail.com>
---
This "Rodan" card provides a flexible Flash bus configuration.  There are only
several dozen of these in use with Linux, but they are in constant use.  They are
used internally by Numonyx and have been donated to various MTD and Flash filesystem
developers.  Merging would let us test the MTD, JFFS2, LOGFS, and UBIFS on
unmodified kernels straight from git.  Various recent JFFS2 bugs and regressions
were caught using this system.

 Kconfig  |    6 ++
 Makefile |    1
 rodan.c  |  157 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 164 insertions(+)

diff -Nurp a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
--- a/drivers/mtd/nand/Kconfig	2008-04-16 19:49:44.000000000 -0700
+++ b/drivers/mtd/nand/Kconfig	2008-04-23 00:01:56.000000000 -0700
@@ -69,6 +69,12 @@ config MTD_NAND_AMS_DELTA
 	help
 	  Support for NAND flash on Amstrad E3 (Delta).
 
+config MTD_NAND_RODAN
+	tristate "NAND Flash device on Rodan extension for Mainstone II board"
+	depends on ARM && ARCH_PXA && MTD_NAND
+	help
+	  If you had to ask, you don't have one. Say 'N'.
+
 config MTD_NAND_TOTO
 	tristate "NAND Flash device on TOTO board"
 	depends on ARCH_OMAP && BROKEN
diff -Nurp a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
--- a/drivers/mtd/nand/Makefile	2008-04-16 19:49:44.000000000 -0700
+++ b/drivers/mtd/nand/Makefile	2008-04-23 00:01:56.000000000 -0700
@@ -6,6 +6,7 @@
 obj-$(CONFIG_MTD_NAND)			+= nand.o nand_ecc.o
 obj-$(CONFIG_MTD_NAND_IDS)		+= nand_ids.o
 
+obj-$(CONFIG_MTD_NAND_RODAN)		+= rodan.o
 obj-$(CONFIG_MTD_NAND_CAFE)		+= cafe_nand.o
 obj-$(CONFIG_MTD_NAND_SPIA)		+= spia.o
 obj-$(CONFIG_MTD_NAND_AMS_DELTA)	+= ams-delta.o
diff -Nurp a/drivers/mtd/nand/rodan.c b/drivers/mtd/nand/rodan.c
--- a/drivers/mtd/nand/rodan.c	1969-12-31 16:00:00.000000000 -0800
+++ b/drivers/mtd/nand/rodan.c	2008-05-02 11:41:00.000000000 -0700
@@ -0,0 +1,157 @@
+/*
+ *  drivers/mtd/nand/rodan.c
+ *
+ *  Overview:
+ *   This is a device driver for the NAND flash device found on the
+ *   Rodan extension for the Marvell PXA27X Development Platform.
+ *
+ */
+
+#include <linux/slab.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/partitions.h>
+#include <linux/io.h>
+
+/*
+ * MTD structure for NAND controller
+ */
+static struct mtd_info *rodan_mtd;
+static void __iomem *p_nand;
+
+#define NAND_PHYS_ADDR 0x14000000
+#define MEM_NAND_CMD  0x20000
+#define MEM_NAND_ADDR 0x10000
+#define MEM_NAND_DATA 0x0
+
+/*
+ * Define partitions for flash device
+ */
+#define NUM_PARTITIONS            1
+static int nr_partitions;
+const static struct mtd_partition partition_info[] = {
+	{
+	 .name = "IMFT NAND",
+	 .offset = 0,
+	 .size = 256 * 1024 * 1024}
+};
+
+#ifdef CONFIG_MTD_PARTITIONS
+const char *part_probes[] = { "cmdlinepart", NULL };
+#endif
+
+static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
+
+static struct nand_bbt_descr rodan_bbt = {
+	.options = NAND_BBT_SCANEMPTY | NAND_BBT_SCAN2NDPAGE,
+	.offs = 0,
+	.len = 2,
+	.pattern = scan_ff_pattern
+};
+
+static void rodan_hwcontrol(struct mtd_info *mtd, int cmd, unsigned int ctrl)
+{
+	register struct nand_chip *chip = mtd->priv;
+
+	if (cmd == NAND_CMD_NONE)
+		return;
+
+	if (ctrl & NAND_CLE)
+		writel(cmd & 0xFF, chip->IO_ADDR_W + MEM_NAND_CMD);
+	else
+		writel(cmd & 0xFF, chip->IO_ADDR_W + MEM_NAND_ADDR);
+}
+
+/*
+ * Main initialization routine
+ */
+int __init rodan_init(void)
+{
+	struct nand_chip *this;
+	int retval;
+	struct mtd_partition *rodan_partition_info;
+
+	/* Allocate memory for MTD device structure and private data */
+	rodan_mtd = kmalloc(sizeof(struct mtd_info) +
+			    sizeof(struct nand_chip), GFP_KERNEL);
+	if (!rodan_mtd) {
+		printk(KERN_ERR "Unable to allocate NAND MTD dev structure.\n");
+		return -ENOMEM;
+	}
+
+	/* Get pointer to private data */
+	this = (struct nand_chip *)(&rodan_mtd[1]);
+
+	/* Initialize structures */
+	memset((char *)rodan_mtd, 0, sizeof(struct mtd_info));
+	memset((char *)this, 0, sizeof(struct nand_chip));
+
+	/* Link the private data with the MTD structure */
+	rodan_mtd->priv = this;
+
+	p_nand = ioremap(NAND_PHYS_ADDR, 0x24000);
+
+	/* Set address of hardware control function */
+	this->IO_ADDR_W = p_nand + MEM_NAND_DATA;
+	this->IO_ADDR_R = p_nand + MEM_NAND_DATA;
+	this->options = NAND_BUSWIDTH_16;
+	this->cmd_ctrl = rodan_hwcontrol;
+	this->dev_ready = NULL;
+	this->chip_delay = 25;
+	this->ecc.mode = NAND_ECC_SOFT;
+	this->badblock_pattern = &rodan_bbt;
+
+	/* Scan to find existence of the device */
+	if (nand_scan(rodan_mtd, 1)) {
+		retval = -ENXIO;
+		goto outio;
+	}
+
+	/* Register the partitions */
+	rodan_mtd->name = "rodan-nand";
+	nr_partitions = parse_mtd_partitions(rodan_mtd, part_probes,
+					     &rodan_partition_info, 0);
+
+	if (nr_partitions <= 0) {
+		nr_partitions = NUM_PARTITIONS;
+		rodan_partition_info = partition_info;
+	}
+
+	/* Register the partitions */
+	add_mtd_partitions(rodan_mtd, rodan_partition_info, nr_partitions);
+
+	return 0;
+
+outio:
+	iounmap((void *)p_nand);
+	return retval;
+}
+
+module_init(rodan_init);
+
+/*
+ * Clean up routine
+ */
+#ifdef MODULE
+static void __exit rodan_cleanup(void)
+{
+	struct nand_chip *this = (struct nand_chip *)&rodan_mtd[1];
+
+	/* Release resources, unregister device */
+	nand_release(rodan_mtd);
+
+	/* Free the MTD device structure */
+	kfree(rodan_mtd);
+
+	/* Unmap */
+	iounmap((void *)p_nand);
+}
+
+module_exit(rodan_cleanup);
+#endif
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Alexey Korolev (alexey.korolev@intel.com), Intel Corp");
+MODULE_DESCRIPTION("Board-specific glue layer for NAND flash on Rodan board");



      ____________________________________________________________________________________
Be a better friend, newshound, and 
know-it-all with Yahoo! Mobile.  Try it now.  http://mobile.yahoo.com/;_ylt=Ahu06i62sR8HDtDypao8Wcj9tAcJ
