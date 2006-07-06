Received: from mail.linux-boards.com ([62.90.235.247])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FySLb-00052H-4L
	for linux-mtd@lists.infradead.org; Thu, 06 Jul 2006 07:49:02 -0400
Received: from [10.1.1.70] (mike [10.1.1.70])
	by mail.linux-boards.com (8.12.5/8.12.8) with ESMTP id k66Bfr00013117
	for <linux-mtd@lists.infradead.org>; Thu, 6 Jul 2006 14:41:54 +0300
Message-ID: <44AD06B5.7060708@compulab.co.il>
Date: Thu, 06 Jul 2006 14:48:53 +0200
From: Mike Rapoport <mike@compulab.co.il>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] CM-x2xx NAND flash support
Content-Type: multipart/mixed; boundary="------------090405010808090807040704"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------090405010808090807040704
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

This patch provides MTD support for NAND flash devices on CM-x2xx modules.

Signed-off-by: Mike Rapoport <mike@compulab.co.il>

-- 
Sincerely yours,
Mike Rapoport


--------------090405010808090807040704
Content-Type: text/x-diff;
 name="cm_x2xx_mtd.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline;
 filename="cm_x2xx_mtd.patch"

 drivers/mtd/nand/Kconfig       |    8 +
 drivers/mtd/nand/Makefile      |    2 
 drivers/mtd/nand/cmx255-nand.c |  247 ++++++++++++++++++++++++++++++++++++
 drivers/mtd/nand/cmx270-nand.c |  273 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 530 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 3db77ee..f0f264e 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -232,6 +232,14 @@ config MTD_NAND_CS553X
 
 	  If you say "m", the module will be called "cs553x_nand.ko".
 
+config MTD_NAND_CM_X255
+	tristate "Support for NAND Flash on CM-X255 modules"
+	depends on MTD_NAND && CM_X255
+
+config MTD_NAND_CM_X270
+	tristate "Support for NAND Flash on CM-X270 modules"
+	depends on MTD_NAND && CM_X270
+
 config MTD_NAND_NANDSIM
 	tristate "Support for NAND Flash Simulator"
 	depends on MTD_NAND && MTD_PARTITIONS
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index f747593..c88e9ca 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -22,5 +22,7 @@ obj-$(CONFIG_MTD_NAND_TS7250)		+= ts7250
 obj-$(CONFIG_MTD_NAND_NANDSIM)		+= nandsim.o
 obj-$(CONFIG_MTD_NAND_CS553X)		+= cs553x_nand.o
 obj-$(CONFIG_MTD_NAND_NDFC)		+= ndfc.o
+obj-$(CONFIG_MTD_NAND_CM_X255)		+= cmx255-nand.o
+obj-$(CONFIG_MTD_NAND_CM_X270)		+= cmx270-nand.o
 
 nand-objs = nand_base.o nand_bbt.o
diff --git a/drivers/mtd/nand/cmx255-nand.c b/drivers/mtd/nand/cmx255-nand.c
new file mode 100644
index 0000000..e556531
--- /dev/null
+++ b/drivers/mtd/nand/cmx255-nand.c
@@ -0,0 +1,247 @@
+/*
+ *  linux/drivers/mtd/nand/cmx255-nand.c
+ *
+ *  Copyright (C) 2006 Compulab, Ltd. (mike@compulab.co.il)
+ *
+ *  Derived from drivers/mtd/nand/h1910.c
+ *       Copyright (C) 2002 Marius Gröger (mag@sysgo.de)
+ *       Copyright (c) 2001 Thomas Gleixner (gleixner@autronix.de)
+ *
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ *  Overview:
+ *   This is a device driver for the NAND flash device found on the
+ *   CM-X255 board.
+ */
+
+#include <linux/slab.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/partitions.h>
+
+#include <asm/io.h>
+#include <asm/irq.h>
+#include <asm/arch/pxa-regs.h>
+
+/* NAND control pins */
+#define GPIO_NAND_CLE	3
+#define GPIO_NAND_ALE	4
+#define GPIO_NAND_CS	5
+#define GPIO_NAND_RB	10
+/*
+ * MTD structure for CM-X255 board
+ */
+static struct mtd_info *cmx255_nand_mtd = NULL;
+
+/*
+ * Module stuff
+ */
+
+#ifdef CONFIG_MTD_PARTITIONS
+/*
+ * Define static partitions for flash device
+ */
+static struct mtd_partition partition_info[] = {
+	{
+		.name	= "cmx255-0",
+		.offset	= 0,
+		.size	= MTDPART_SIZ_FULL
+	}
+};
+#define NUM_PARTITIONS (ARRAY_SIZE(partition_info))
+#endif
+
+#define DRAIN_WB() \
+	do { \
+		unsigned char dummy; \
+		asm volatile ("mcr p15, 0, r0, c7, c10, 4":::"r0"); \
+		dummy=*((unsigned char*)UNCACHED_ADDR); \
+	} while(0);
+
+/*  NAND device signal level interface  */
+static inline void nand_cs_on(void)
+{
+	GPCR(GPIO_NAND_CS) = GPIO_bit(GPIO_NAND_CS);
+}
+
+static void nand_cs_off(void)
+{
+	DRAIN_WB();
+
+	GPSR(GPIO_NAND_CS) = GPIO_bit(GPIO_NAND_CS);
+}
+
+static inline void nand_ale_on(void)
+{
+	GPSR(GPIO_NAND_ALE) = GPIO_bit(GPIO_NAND_ALE);
+}
+
+static inline void nand_ale_off(void)
+{
+	GPCR(GPIO_NAND_ALE) = GPIO_bit(GPIO_NAND_ALE);
+}
+
+static inline void nand_cle_on(void)
+{
+	GPSR(GPIO_NAND_CLE) = GPIO_bit(GPIO_NAND_CLE);
+}
+
+static inline void nand_cle_off(void)
+{
+	GPCR(GPIO_NAND_CLE) = GPIO_bit(GPIO_NAND_CLE);
+}
+
+/*
+ *	hardware specific access to control-lines
+ */
+static void cmx255_hwcontrol(struct mtd_info *mtd, int dat,
+			     unsigned int ctrl)
+{
+	struct nand_chip* this = (struct nand_chip *) (mtd->priv);
+	unsigned int nandaddr = (unsigned int)this->IO_ADDR_W;
+
+	DRAIN_WB();
+
+	if ( ctrl & NAND_CTRL_CHANGE ) {
+		if ( ctrl & NAND_NCE ) /* CE should be changed */
+			nand_cs_on();
+		else
+			nand_cs_off();
+		if ( ctrl & NAND_ALE ) /* ALE should be changed */
+			nand_ale_on();
+		else
+			nand_ale_off();
+		if ( ctrl & NAND_CLE ) /* CLE should be changed */
+			nand_cle_on();
+		else 
+			nand_cle_off();
+	}
+	this->IO_ADDR_W = (void*)nandaddr;
+
+	DRAIN_WB();
+
+	if ( dat != NAND_CMD_NONE )
+		writel(dat, this->IO_ADDR_W);
+}
+
+/*
+ *	read device ready pin
+ */
+static int cmx255_device_ready(struct mtd_info *mtd)
+{
+	DRAIN_WB();
+	return GPLR(GPIO_NAND_RB) & GPIO_bit(GPIO_NAND_RB);
+}
+
+/*
+ * Main initialization routine
+ */
+static int __init cmx255_init (void)
+{
+	struct nand_chip *this;
+	const char *part_type = 0;
+	int mtd_parts_nb = 0;
+	struct mtd_partition *mtd_parts = 0;
+	static unsigned int nandaddr = 0;
+	int retval = 0;
+
+	/* Allocate memory for MTD device structure and private data */
+	cmx255_nand_mtd = kmalloc(sizeof(struct mtd_info) +
+				    sizeof(struct nand_chip),
+				    GFP_KERNEL);
+	if (!cmx255_nand_mtd) {
+		printk("Unable to allocate CM-X255 MTD device structure.\n");
+		retval = -ENOMEM;
+		goto out;
+	}
+
+	nandaddr = (unsigned int)ioremap(PXA_CS1_PHYS, 0x100);
+	if ( !nandaddr ) {
+		printk("Unable to ioremap NAND device");
+		retval = -EINVAL;
+		goto err1;
+	}
+
+	/* Get pointer to private data */
+	this = (struct nand_chip *) (&cmx255_nand_mtd[1]);
+
+	/* Initialize structures */
+	memset((char *) cmx255_nand_mtd, 0, sizeof(struct mtd_info));
+	memset((char *) this, 0, sizeof(struct nand_chip));
+
+	/* Link the private data with the MTD structure */
+	cmx255_nand_mtd->owner = THIS_MODULE;
+	cmx255_nand_mtd->priv = this;
+
+	/* insert callbacks */
+	this->IO_ADDR_R = (void __iomem *)nandaddr;
+	this->IO_ADDR_W = (void __iomem *)nandaddr;
+	this->cmd_ctrl = cmx255_hwcontrol;
+	this->dev_ready = cmx255_device_ready;
+
+	/* 20 us command delay time */
+	this->chip_delay = 20;
+	this->ecc.mode = NAND_ECC_SOFT;
+
+	/* Scan to find existence of the device */
+	if (nand_scan (cmx255_nand_mtd, 1)) {
+		printk(KERN_NOTICE "No NAND device\n");
+		retval = -ENXIO;
+		goto err2;
+	}
+
+#ifdef CONFIG_MTD_CMDLINE_PARTS
+	mtd_parts_nb = parse_cmdline_partitions(cmx255_nand_mtd, &mtd_parts,
+						"cmx255");
+	if (mtd_parts_nb > 0)
+		part_type = "command line";
+	else
+		mtd_parts_nb = 0;
+#endif
+	if (mtd_parts_nb == 0)
+	{
+		mtd_parts = partition_info;
+		mtd_parts_nb = NUM_PARTITIONS;
+		part_type = "static";
+	}
+
+	/* Register the partitions */
+	printk(KERN_NOTICE "Using %s partition definition\n", part_type);
+	add_mtd_partitions(cmx255_nand_mtd, mtd_parts, mtd_parts_nb);
+
+  err2:
+	iounmap((void*)nandaddr);
+  err1:
+	kfree(cmx255_nand_mtd);
+  out:
+	/* Return happy */
+	return retval;
+}
+module_init(cmx255_init);
+
+/*
+ * Clean up routine
+ */
+static void __exit cmx255_cleanup (void)
+{
+	struct nand_chip *this;
+
+	this = (struct nand_chip *) (&cmx255_nand_mtd[1]);
+	iounmap(this->IO_ADDR_R);
+
+	/* Release resources, unregister device */
+	nand_release (cmx255_nand_mtd);
+
+	/* Free the MTD device structure */
+	kfree (cmx255_nand_mtd);
+}
+module_exit(cmx255_cleanup);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Mike Rapoport <mike at compulab dot co dot il>");
+MODULE_DESCRIPTION("NAND flash driver for Compulab CM-X255 Module");
diff --git a/drivers/mtd/nand/cmx270-nand.c b/drivers/mtd/nand/cmx270-nand.c
new file mode 100644
index 0000000..ffedaec
--- /dev/null
+++ b/drivers/mtd/nand/cmx270-nand.c
@@ -0,0 +1,273 @@
+/*
+ *  linux/drivers/mtd/nand/cmx270-nand.c
+ *
+ *  Copyright (C) 2006 Compulab, Ltd.
+ *  Mike Rapoport <mike@compulab.co.il>
+ *
+ *  Derived from drivers/mtd/nand/h1910.c
+ *       Copyright (C) 2002 Marius Gröger (mag@sysgo.de)
+ *       Copyright (c) 2001 Thomas Gleixner (gleixner@autronix.de)
+ *
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ *  Overview:
+ *   This is a device driver for the NAND flash device found on the
+ *   CM-X270 board.
+ */
+
+#include <linux/slab.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/partitions.h>
+
+#include <asm/io.h>
+#include <asm/irq.h>
+
+#include <asm/arch/hardware.h>
+#include <asm/arch/pxa-regs.h>
+
+#define GPIO_NAND_CS	(11)
+#define GPIO_NAND_RB	(89)
+
+#define DRAIN_WB() \
+	do { \
+		unsigned char dummy; \
+		asm volatile ("mcr p15, 0, r0, c7, c10, 4":::"r0"); \
+		dummy=*((unsigned char*)UNCACHED_ADDR); \
+	} while(0);
+
+/*
+ * MTD structure for CM-X270 board
+ */
+static struct mtd_info *cmx270_nand_mtd = NULL;
+
+/*
+ * Module stuff
+ */
+
+#ifdef CONFIG_MTD_PARTITIONS
+/*
+ * Define static partitions for flash device
+ */
+static struct mtd_partition partition_info[] = {
+	{
+		.name	= "cmx270-0",
+		.offset	= 0,
+		.size	= MTDPART_SIZ_FULL
+	}
+};
+#define NUM_PARTITIONS (ARRAY_SIZE(partition_info))
+
+#endif
+
+
+static 	u_char cmx270_read_byte(struct mtd_info *mtd)
+{
+	struct nand_chip *this = mtd->priv;
+	return (readl(this->IO_ADDR_R) >> 16);
+}
+
+static void cmx270_write_byte(struct mtd_info *mtd, u_char byte)
+{
+	struct nand_chip *this = mtd->priv;
+	writel((byte << 16), this->IO_ADDR_W);
+}
+
+static void cmx270_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
+{
+	int i;
+	struct nand_chip *this = mtd->priv;
+
+	for (i=0; i<len; i++) {
+		writel((*buf++ << 16), this->IO_ADDR_W);
+	}
+}
+
+static void cmx270_read_buf(struct mtd_info *mtd, u_char *buf, int len)
+{
+	int i;
+	struct nand_chip *this = mtd->priv;
+
+	for (i=0; i<len; i++) {
+		*buf++ = readl(this->IO_ADDR_R) >> 16;
+	}
+}
+
+static int cmx270_verify_buf(struct mtd_info *mtd, const u_char *buf, int len)
+{
+	int i;
+	struct nand_chip *this = mtd->priv;
+
+	for (i=0; i<len; i++) {
+		if ( buf[i] != (u_char)(readl(this->IO_ADDR_R) >> 16) )
+			return -EFAULT;
+	}
+
+	return 0;
+}
+
+static inline void nand_cs_on(void)
+{
+	GPCR(GPIO_NAND_CS) = GPIO_bit(GPIO_NAND_CS);
+}
+
+static void nand_cs_off(void)
+{
+	DRAIN_WB();
+
+	GPSR(GPIO_NAND_CS) = GPIO_bit(GPIO_NAND_CS);
+}
+
+/*
+ *	hardware specific access to control-lines
+ */
+static void cmx270_hwcontrol(struct mtd_info *mtd, int dat,
+			     unsigned int ctrl)
+{
+	struct nand_chip* this = (struct nand_chip *) (mtd->priv);
+	unsigned int nandaddr = (unsigned int)this->IO_ADDR_W;
+
+	DRAIN_WB();
+
+	if ( ctrl & NAND_CTRL_CHANGE ) {
+		if ( ctrl & NAND_ALE ) /* ALE should be changed */
+			nandaddr |=  (1 << 3);
+		else
+			nandaddr &= ~(1 << 3);
+		if ( ctrl & NAND_CLE ) /* CLE should be changed */
+			nandaddr |=  (1 << 2);
+		else 
+			nandaddr &= ~(1 << 2);
+		if ( ctrl & NAND_NCE ) /* CE should be changed */
+			nand_cs_on();
+		else
+			nand_cs_off();
+	}
+	this->IO_ADDR_W = (void*)nandaddr;
+	DRAIN_WB();
+	if ( dat != NAND_CMD_NONE )
+		cmx270_write_byte(mtd, dat);
+	DRAIN_WB();
+}
+
+/*
+ *	read device ready pin
+ */
+static int cmx270_device_ready(struct mtd_info *mtd)
+{
+	DRAIN_WB();
+	return ( GPLR(GPIO_NAND_RB) & GPIO_bit(GPIO_NAND_RB) );
+}
+
+/*
+ * Main initialization routine
+ */
+static int __init cmx270_init (void)
+{
+	struct nand_chip *this;
+	const char *part_type = 0;
+	int mtd_parts_nb = 0;
+	struct mtd_partition *mtd_parts = 0;
+	unsigned int nandaddr = 0;
+
+	/* Allocate memory for MTD device structure and private data */
+	cmx270_nand_mtd = kmalloc(sizeof(struct mtd_info) +
+				  sizeof(struct nand_chip),
+				  GFP_KERNEL);
+	mb();
+	if (!cmx270_nand_mtd) {
+		printk("Unable to allocate CM-X270 NAND MTD device structure.\n");
+		return -ENOMEM;
+	}
+
+	nandaddr = (unsigned int)ioremap(PXA_CS1_PHYS, 12);
+	if ( !nandaddr ) {
+		printk("Unable to ioremap NAND device");
+		return -EINVAL;
+	}
+
+	/* Get pointer to private data */
+	this = (struct nand_chip *) (&cmx270_nand_mtd[1]);
+
+	/* Initialize structures */
+	memset((char *) cmx270_nand_mtd, 0, sizeof(struct mtd_info));
+	memset((char *) this, 0, sizeof(struct nand_chip));
+
+	/* Link the private data with the MTD structure */
+	cmx270_nand_mtd->owner = THIS_MODULE;
+	cmx270_nand_mtd->priv = this;
+
+	/* insert callbacks */
+	this->IO_ADDR_R = (void __iomem *)nandaddr;
+	this->IO_ADDR_W = (void __iomem *)nandaddr;
+	this->cmd_ctrl = cmx270_hwcontrol;
+	this->dev_ready = cmx270_device_ready;	/* unknown whether that was correct or not so we will just do it like this */
+
+	/* 15 us command delay time */
+	this->chip_delay = 20;
+	this->ecc.mode = NAND_ECC_SOFT;
+
+	/* read/write functions */
+	this->read_byte = cmx270_read_byte;
+	this->read_buf = cmx270_read_buf;
+	this->write_buf = cmx270_write_buf;
+	this->verify_buf = cmx270_verify_buf;
+
+	/* Scan to find existence of the device */
+	if (nand_scan (cmx270_nand_mtd, 1)) {
+		printk(KERN_NOTICE "No NAND device\n");
+		iounmap((void*)nandaddr);
+		kfree (cmx270_nand_mtd);
+		return -ENXIO;
+	}
+
+#ifdef CONFIG_MTD_CMDLINE_PARTS
+	mtd_parts_nb = parse_cmdline_partitions(cmx270_nand_mtd, &mtd_parts,
+						"cmx270");
+	if (mtd_parts_nb > 0)
+		part_type = "command line";
+	else
+		mtd_parts_nb = 0;
+#endif
+	if (mtd_parts_nb == 0)
+	{
+		mtd_parts = partition_info;
+		mtd_parts_nb = NUM_PARTITIONS;
+		part_type = "static";
+	}
+
+	/* Register the partitions */
+	printk(KERN_NOTICE "Using %s partition definition\n", part_type);
+	add_mtd_partitions(cmx270_nand_mtd, mtd_parts, mtd_parts_nb);
+
+	/* Return happy */
+	return 0;
+}
+module_init(cmx270_init);
+
+/*
+ * Clean up routine
+ */
+static void __exit cmx270_cleanup (void)
+{
+	struct nand_chip *this;
+
+	this = (struct nand_chip *) (&cmx270_nand_mtd[1]);
+	iounmap(this->IO_ADDR_R);
+
+	/* Release resources, unregister device */
+	nand_release (cmx270_nand_mtd);
+
+	/* Free the MTD device structure */
+	kfree (cmx270_nand_mtd);
+}
+module_exit(cmx270_cleanup);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Mike Rapoport <mike at compulab dot co dot il>");
+MODULE_DESCRIPTION("NAND flash driver for Compulab CM-X270 Module");

--------------090405010808090807040704--
