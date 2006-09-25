Received: from relais.videotron.ca ([24.201.245.36])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GRs0R-00046C-KL
	for linux-mtd@lists.infradead.org; Mon, 25 Sep 2006 16:04:33 +0100
Received: from aramis.lan.raphnet.net ([69.70.153.243])
	by VL-MH-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0J6500I1BLP1NG70@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Mon, 25 Sep 2006 11:00:37 -0400 (EDT)
Date: Mon, 25 Sep 2006 10:57:27 -0400
From: Raphael Assenat <raph@raphnet.net>
Subject: Re: [PATCH] cmx270-nand: Make CMDLINE_PARTS usable
In-reply-to: <4517D4AB.2060706@8d.com>
To: Raphael Assenat <raph@8d.com>
Message-id: <20060925145726.GI7749@aramis.lan.raphnet.net>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <4507FE99.3030106@8d.com>
	<1158917790.24527.664.camel@pmac.infradead.org> <4513F01D.80608@8d.com>
	<1158936240.24527.733.camel@pmac.infradead.org>
	<4517D4AB.2060706@8d.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 25, 2006 at 09:07:55AM -0400, Raphael Assenat wrote:
> David Woodhouse wrote:
> > On Fri, 2006-09-22 at 10:15 -0400, Raphael Assenat wrote:
> > 
> >>Oh, sorry. My patch applies over the patch Mike Rapoport sent to the list on July 18
> >>([PATCH] [MTD] CM-x270 NAND flash support), which I thought was already accepted. Was 
> >>there anything wrong with it? Maybe you just missed it...
> >>
> >>I also sent a patch to the list on July 21 which added NAND flash support for the cm-x255 
> >>boards ([PATCH] Add support for NAND flash on cm-x255) but received no feedback. I can 
> >>resend it if you wish.
> > 
> > 
> > July and August weren't really a good time for sending stuff that you
> > expect me to pay attention to; sorry. Yes -- please retest and resend.
Here comes the resend.

This patch adds support for the NAND flash present on Compulab's cm-x255
boards. Since Compulab chose to discontinue cm-x255 support, I decided
to submit and support this driver myself.

Note: This is the driver I wrote as part of my Compulab kernel fork
project (see http://raph.people.8d.com/armcore_kernel.php). It is not
based on the driver Mike posted to the list.

Applies to 2.6.18

Signed-off-by: Raphael Assenat <raph@8d.com>

diff -Nru linux-2.6.18-rc2/drivers/mtd/nand/Kconfig linux-2.6.18-rc2-mtd/drivers/mtd/nand/Kconfig
--- linux-2.6.18-rc2/drivers/mtd/nand/Kconfig	2006-07-17 15:19:57.000000000 -0400
+++ linux-2.6.18-rc2-mtd/drivers/mtd/nand/Kconfig	2006-07-21 14:36:03.000000000 -0400
@@ -239,4 +239,11 @@
 	  The simulator may simulate various NAND flash chips for the
 	  MTD nand layer.
 
+config MTD_NAND_CM_X255
+	tristate "Support for NAND Flash on Compulab cm-x255"
+	depends on MTD_NAND && MACH_CM_X255
+	help
+	  This enables the driver for the NAND flash present
+	  on the cm-x255 board from Compulab.
+
 endmenu
diff -Nru linux-2.6.18-rc2/drivers/mtd/nand/Makefile linux-2.6.18-rc2-mtd/drivers/mtd/nand/Makefile
--- linux-2.6.18-rc2/drivers/mtd/nand/Makefile	2006-07-17 15:19:57.000000000 -0400
+++ linux-2.6.18-rc2-mtd/drivers/mtd/nand/Makefile	2006-07-21 14:36:31.000000000 -0400
@@ -22,5 +22,6 @@
 obj-$(CONFIG_MTD_NAND_NANDSIM)		+= nandsim.o
 obj-$(CONFIG_MTD_NAND_CS553X)		+= cs553x_nand.o
 obj-$(CONFIG_MTD_NAND_NDFC)		+= ndfc.o
+obj-$(CONFIG_MTD_NAND_CM_X255)		+= cm-x255.o
 
 nand-objs = nand_base.o nand_bbt.o
diff -Nru linux-2.6.18-rc2/drivers/mtd/nand/cm-x255.c linux-2.6.18-rc2-mtd/drivers/mtd/nand/cm-x255.c
--- linux-2.6.18-rc2/drivers/mtd/nand/cm-x255.c	1969-12-31 19:00:00.000000000 -0500
+++ linux-2.6.18-rc2-mtd/drivers/mtd/nand/cm-x255.c	2006-07-21 15:02:02.000000000 -0400
@@ -0,0 +1,183 @@
+/*
+ * drivers/mtd/nand/cm-x255.c
+ *
+ * Copyright (c) 2006, 8D Technologies inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ *  Overview:
+ *   This is a device driver for the NAND flash device found on the
+ *   cm-x255 compulab sbc (formerly known as armcore).
+ *   
+ *  Changelog:
+ *  - April 2006, Raphael Assenat <raph@8d.com>:
+ * 	Creation of the driver.
+ * 	   
+ *  - Jul 18, 2006: Raphael Assenat <raph@8d.com>:
+ * 	Updates for 2.6.18
+ */
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/partitions.h>
+#include <linux/delay.h>
+#include <asm/hardware.h>
+#include <asm/io.h>
+#include <asm/arch/pxa-regs.h>
+#include <asm/arch/cm-x255.h>
+
+#define GPIO_NAND_CS	5
+#define GPIO_NAND_ALE	4
+#define GPIO_NAND_CLE	3
+#define GPIO_NAND_RB	10
+
+#define DRAIN_WRITE_BUFFER() do { \
+	asm volatile ("mcr p15, 0, r0, c7, c10, 4\n":::"r0"); \
+	dummy=*((volatile unsigned char*)UNCACHED_ADDR); \
+	} while(0)
+
+static struct mtd_info *armcore_mtd = NULL;
+static void __iomem *armcore_nand_io_base;
+static long armcore_nand_phys_base = 0x04000000;
+
+#define DEFAULT_NUM_PARTITIONS 1
+static int nr_partitions;
+static struct mtd_partition armcore_default_partition_info[] = {
+	{
+	.name = "rootfs",
+	.offset = 0,
+	.size = MTDPART_SIZ_FULL,
+	},
+};
+
+static void armcore_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, 
+						unsigned int ctrl)
+{
+	struct nand_chip *chip = mtd->priv;	
+	unsigned char dummy;
+
+	DRAIN_WRITE_BUFFER();
+
+	if (ctrl & NAND_CTRL_CHANGE)
+	{
+		if (ctrl & NAND_NCE) 
+			GPCR(GPIO_NAND_CS) = GPIO_bit(GPIO_NAND_CS); 
+		else
+			GPSR(GPIO_NAND_CS) = GPIO_bit(GPIO_NAND_CS); 
+
+		if (ctrl & NAND_CLE)
+			GPSR(GPIO_NAND_CLE) = GPIO_bit(GPIO_NAND_CLE); 
+		else
+			GPCR(GPIO_NAND_CLE) = GPIO_bit(GPIO_NAND_CLE); 
+
+		if (ctrl & NAND_ALE)
+			GPSR(GPIO_NAND_ALE) = GPIO_bit(GPIO_NAND_ALE); 
+		else
+			GPCR(GPIO_NAND_ALE) = GPIO_bit(GPIO_NAND_ALE); 
+
+	}
+	
+	DRAIN_WRITE_BUFFER();
+
+	if (cmd != NAND_CMD_NONE)
+		writeb(cmd, chip->IO_ADDR_W);
+}
+
+static int armcore_nand_device_ready(struct mtd_info *mtd)
+{
+	return GPLR(GPIO_NAND_RB) & GPIO_bit(GPIO_NAND_RB);
+}
+
+#ifdef CONFIG_MTD_PARTITIONS
+const char *part_probes[] = { "cmdlinepart", NULL };
+#endif
+
+int __init armcore_nand_init(void)
+{
+	struct nand_chip *this;
+	struct mtd_partition* armcore_partition_info;
+	int err = 0;
+
+	pxa_gpio_mode(GPIO_NAND_RB);
+	pxa_gpio_mode(GPIO_NAND_CS | GPIO_OUT | GPIO_DFLT_HIGH);
+	pxa_gpio_mode(GPIO_NAND_ALE | GPIO_OUT | GPIO_DFLT_LOW);
+	pxa_gpio_mode(GPIO_NAND_CLE | GPIO_OUT | GPIO_DFLT_LOW);
+	
+	/* Allocate memory for MTD device structure and private data */	
+	armcore_mtd = kmalloc(	sizeof(struct mtd_info) + 
+				sizeof(struct nand_chip), 
+						GFP_KERNEL);
+	if (!armcore_mtd) {
+		printk(KERN_WARNING 
+		"Unable to allocate cm-x255 nand mtd device structure.\n");
+		err = -ENOMEM;
+		goto out;
+	}
+
+	/* map physical adress */
+	armcore_nand_io_base = ioremap(armcore_nand_phys_base, 0x100);
+	if (!armcore_nand_io_base) {
+		printk(KERN_WARNING "ioremap for cm-x255 NAND chip failed\n");
+		err = -EIO;
+		goto out_mtd;
+	}
+
+	/* Get pointer to private data */
+	this = (struct nand_chip *) (&armcore_mtd[1]);
+
+	/* Initialize structures */
+	memset((char *) armcore_mtd, 0, sizeof(struct mtd_info));
+	memset((char *) this, 0, sizeof(struct nand_chip));
+
+	/* Link the private data with the MTD structure */
+	armcore_mtd->priv = this;
+
+	this->IO_ADDR_R = armcore_nand_io_base;	
+	this->IO_ADDR_W = armcore_nand_io_base;	
+	this->cmd_ctrl = armcore_nand_cmd_ctrl;
+	this->dev_ready = armcore_nand_device_ready;
+	this->chip_delay = 15;
+	this->ecc.mode = NAND_ECC_SOFT;
+
+	/* Scan to find existance of the device */
+	if (nand_scan(armcore_mtd, 1)) {
+		printk(KERN_WARNING 
+			"nand_scan() failed to scan cm-x255 nand flash\n");
+		err = -ENXIO;
+		goto out_ior;
+	}
+
+	/* Register the partitions */
+	armcore_mtd->name = "armcore-nand";
+	nr_partitions = parse_mtd_partitions(armcore_mtd, part_probes,
+						&armcore_partition_info, 0);
+	if (nr_partitions <= 0) {
+		nr_partitions = DEFAULT_NUM_PARTITIONS;
+		armcore_partition_info = armcore_default_partition_info;
+	}
+
+	add_mtd_partitions(armcore_mtd, armcore_partition_info, nr_partitions);	
+	
+	goto out;
+
+out_ior:
+	iounmap((void*) armcore_nand_io_base);
+out_mtd:
+	kfree(armcore_mtd);
+out:
+	return err;
+}
+module_init(armcore_nand_init);
+
+static void __exit armcore_nand_cleanup(void)
+{
+	nand_release(armcore_mtd);
+	iounmap((void*)armcore_nand_io_base);
+	kfree(armcore_mtd);
+}
+module_exit(armcore_nand_cleanup);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Raphael Assenat <raph@8d.com>");
+MODULE_DESCRIPTION("NAND flash driver for cm-x255 boards");
