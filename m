Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZifW-0004Qy-R1
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2011 12:06:00 +0000
Received: by wyf23 with SMTP id 23so1542162wyf.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Jun 2011 05:05:53 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: =?UTF-8?q?=5BPATCH=202/5=5D=20mtd/nand=3A=20drop=20edb7312=20support?=
Date: Thu, 23 Jun 2011 16:05:28 +0400
Message-Id: <1308830731-5698-3-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1308830731-5698-1-git-send-email-dbaryshkov@gmail.com>
References: <1308830731-5698-1-git-send-email-dbaryshkov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

EDB7312 isn't supported by mainline kernel, so drop it now.
If the board support will ever be submitted to mainline,
one can revert this commit.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/nand/Kconfig   |    7 --
 drivers/mtd/nand/Makefile  |    1 -
 drivers/mtd/nand/edb7312.c |  188 --------------------------------------------
 3 files changed, 0 insertions(+), 196 deletions(-)
 delete mode 100644 drivers/mtd/nand/edb7312.c

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 4c34252..17235d0 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -83,13 +83,6 @@ config MTD_NAND_DENALI_SCRATCH_REG_ADDR
           scratch register here to enable this feature. On Intel Moorestown
           boards, the scratch register is at 0xFF108018.
 
-config MTD_NAND_EDB7312
-	tristate "Support for Cirrus Logic EBD7312 evaluation board"
-	depends on ARCH_EDB7312
-	help
-	  This enables the driver for the Cirrus Logic EBD7312 evaluation
-	  board to access the onboard NAND Flash.
-
 config MTD_NAND_H1900
 	tristate "iPAQ H1900 flash"
 	depends on ARCH_PXA
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 5745d83..c9334e9 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -13,7 +13,6 @@ obj-$(CONFIG_MTD_NAND_SPIA)		+= spia.o
 obj-$(CONFIG_MTD_NAND_AMS_DELTA)	+= ams-delta.o
 obj-$(CONFIG_MTD_NAND_AUTCPU12)		+= autcpu12.o
 obj-$(CONFIG_MTD_NAND_DENALI)		+= denali.o
-obj-$(CONFIG_MTD_NAND_EDB7312)		+= edb7312.o
 obj-$(CONFIG_MTD_NAND_AU1550)		+= au1550nd.o
 obj-$(CONFIG_MTD_NAND_BF5XX)		+= bf5xx_nand.o
 obj-$(CONFIG_MTD_NAND_PPCHAMELEONEVB)	+= ppchameleonevb.o
diff --git a/drivers/mtd/nand/edb7312.c b/drivers/mtd/nand/edb7312.c
deleted file mode 100644
index 0b1bb91..0000000
--- a/drivers/mtd/nand/edb7312.c
+++ /dev/null
@@ -1,188 +0,0 @@
-/*
- *  drivers/mtd/nand/edb7312.c
- *
- *  Copyright (C) 2002 Marius Gröger (mag@sysgo.de)
- *
- *  Derived from drivers/mtd/nand/autcpu12.c
- *       Copyright (c) 2001 Thomas Gleixner (gleixner@autronix.de)
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- *  Overview:
- *   This is a device driver for the NAND flash device found on the
- *   CLEP7312 board which utilizes the Toshiba TC58V64AFT part. This is
- *   a 64Mibit (8MiB x 8 bits) NAND flash device.
- */
-
-#include <linux/slab.h>
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/nand.h>
-#include <linux/mtd/partitions.h>
-#include <asm/io.h>
-#include <mach/hardware.h>	/* for CLPS7111_VIRT_BASE */
-#include <asm/sizes.h>
-#include <asm/hardware/clps7111.h>
-
-/*
- * MTD structure for EDB7312 board
- */
-static struct mtd_info *ep7312_mtd = NULL;
-
-/*
- * Values specific to the EDB7312 board (used with EP7312 processor)
- */
-#define EP7312_FIO_PBASE 0x10000000	/* Phys address of flash */
-#define EP7312_PXDR	0x0001	/*
-				 * IO offset to Port B data register
-				 * where the CLE, ALE and NCE pins
-				 * are wired to.
-				 */
-#define EP7312_PXDDR	0x0041	/*
-				 * IO offset to Port B data direction
-				 * register so we can control the IO
-				 * lines.
-				 */
-
-/*
- * Module stuff
- */
-
-static unsigned long ep7312_fio_pbase = EP7312_FIO_PBASE;
-static void __iomem *ep7312_pxdr = (void __iomem *)EP7312_PXDR;
-static void __iomem *ep7312_pxddr = (void __iomem *)EP7312_PXDDR;
-
-/*
- * Define static partitions for flash device
- */
-static struct mtd_partition partition_info[] = {
-	{.name = "EP7312 Nand Flash",
-	 .offset = 0,
-	 .size = 8 * 1024 * 1024}
-};
-
-#define NUM_PARTITIONS 1
-
-/*
- *	hardware specific access to control-lines
- *
- *	NAND_NCE: bit 0 -> bit 6 (bit 7 = 1)
- *	NAND_CLE: bit 1 -> bit 4
- *	NAND_ALE: bit 2 -> bit 5
- */
-static void ep7312_hwcontrol(struct mtd_info *mtd, int cmd, unsigned int ctrl)
-{
-	struct nand_chip *chip = mtd->priv;
-
-	if (ctrl & NAND_CTRL_CHANGE) {
-		unsigned char bits = 0x80;
-
-		bits |= (ctrl & (NAND_CLE | NAND_ALE)) << 3;
-		bits |= (ctrl & NAND_NCE) ? 0x00 : 0x40;
-
-		clps_writeb((clps_readb(ep7312_pxdr)  & 0xF0) | bits,
-			    ep7312_pxdr);
-	}
-	if (cmd != NAND_CMD_NONE)
-		writeb(cmd, chip->IO_ADDR_W);
-}
-
-/*
- *	read device ready pin
- */
-static int ep7312_device_ready(struct mtd_info *mtd)
-{
-	return 1;
-}
-
-/*
- * Main initialization routine
- */
-static int __init ep7312_init(void)
-{
-	struct nand_chip *this;
-	void __iomem *ep7312_fio_base;
-
-	/* Allocate memory for MTD device structure and private data */
-	ep7312_mtd = kmalloc(sizeof(struct mtd_info) + sizeof(struct nand_chip), GFP_KERNEL);
-	if (!ep7312_mtd) {
-		printk("Unable to allocate EDB7312 NAND MTD device structure.\n");
-		return -ENOMEM;
-	}
-
-	/* map physical address */
-	ep7312_fio_base = ioremap(ep7312_fio_pbase, SZ_1K);
-	if (!ep7312_fio_base) {
-		printk("ioremap EDB7312 NAND flash failed\n");
-		kfree(ep7312_mtd);
-		return -EIO;
-	}
-
-	/* Get pointer to private data */
-	this = (struct nand_chip *)(&ep7312_mtd[1]);
-
-	/* Initialize structures */
-	memset(ep7312_mtd, 0, sizeof(struct mtd_info));
-	memset(this, 0, sizeof(struct nand_chip));
-
-	/* Link the private data with the MTD structure */
-	ep7312_mtd->priv = this;
-	ep7312_mtd->owner = THIS_MODULE;
-
-	/*
-	 * Set GPIO Port B control register so that the pins are configured
-	 * to be outputs for controlling the NAND flash.
-	 */
-	clps_writeb(0xf0, ep7312_pxddr);
-
-	/* insert callbacks */
-	this->IO_ADDR_R = ep7312_fio_base;
-	this->IO_ADDR_W = ep7312_fio_base;
-	this->cmd_ctrl = ep7312_hwcontrol;
-	this->dev_ready = ep7312_device_ready;
-	/* 15 us command delay time */
-	this->chip_delay = 15;
-
-	/* Scan to find existence of the device */
-	if (nand_scan(ep7312_mtd, 1)) {
-		iounmap((void *)ep7312_fio_base);
-		kfree(ep7312_mtd);
-		return -ENXIO;
-	}
-	ep7312_mtd->name = "edb7312-nand";
-
-	/* Register the partitions */
-	mtd_device_register(ep7312_mtd, NULL, 0,
-			partition_info, NUM_PARTITIONS);
-
-	/* Return happy */
-	return 0;
-}
-
-module_init(ep7312_init);
-
-/*
- * Clean up routine
- */
-static void __exit ep7312_cleanup(void)
-{
-	struct nand_chip *this = (struct nand_chip *)&ep7312_mtd[1];
-
-	/* Release resources, unregister device */
-	nand_release(ap7312_mtd);
-
-	/* Release io resource */
-	iounmap(this->IO_ADDR_R);
-
-	/* Free the MTD device structure */
-	kfree(ep7312_mtd);
-}
-
-module_exit(ep7312_cleanup);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Marius Groeger <mag@sysgo.de>");
-MODULE_DESCRIPTION("MTD map driver for Cogent EDB7312 board");
-- 
1.7.5.3
