Received: from the.ipv6.earth.li ([2001:1b40:0:1000:c1c9:c842:0:1]
	helo=the.earth.li)
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1FY3is-0005fI-Qw
	for linux-mtd@lists.infradead.org; Mon, 24 Apr 2006 12:15:50 -0400
Received: from noodles by the.earth.li with local (Exim 4.50)
	id 1FY3ij-0007T4-VA
	for linux-mtd@lists.infradead.org; Mon, 24 Apr 2006 17:15:29 +0100
Date: Mon, 24 Apr 2006 17:15:29 +0100
From: Jonathan McDowell <noodles@earth.li>
To: linux-mtd@lists.infradead.org
Message-ID: <20060424161529.GR7570@earth.li>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [PATCH/RFC] Add Amstrad Delta NAND support.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The patch below adds support for the NAND device on the Amstrad Delta.
This is a 32MB 8bit Toshiba device, with the data bus connected to the
OMAP MPUIO pins and ALE, CLE, NCE, NRE, NWE and NWP all connected to the
Delta's latch2 16bit latch.

I'm submitting this purely for comments at this stage. While I have
tested it (booting fine with the NAND as / and able to read/write to it
ok) and had a report from another user that it works fine for them I
would appreciate any opinions you may have about the code.

In particular I'm using "udelay(1);" in the read/write routines to wait
for the bus to settle after setting the read/write enable lines. Really
I want "ndelay(40);", but ndelay doesn't seem to be implemented on ARM,
except in terms of udelay. Can I get away with udelay(0.04)? Should I be
doing something else entirely?

-----
diff -rupN -X linux-2.6.16-omap2/Documentation/dontdiff linux-2.6.16-e3-04/drivers/mtd/nand/ams-delta.c linux-2.6.16-e3-05/drivers/mtd/nand/ams-delta.c
--- linux-2.6.16-e3-04/drivers/mtd/nand/ams-delta.c	1970-01-01 01:00:00.000000000 +0100
+++ linux-2.6.16-e3-05/drivers/mtd/nand/ams-delta.c	2006-04-07 22:16:07.478356500 +0100
@@ -0,0 +1,243 @@
+/*
+ *  drivers/mtd/nand/ams-delta.c
+ *
+ *  Copyright (C) 2006 Jonathan McDowell <noodles@earth.li>
+ *
+ *  Derived from drivers/mtd/toto.c
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ *  Overview:
+ *   This is a device driver for the NAND flash device found on the
+ *   Amstrad E3 (Delta).
+ */
+
+#include <linux/slab.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/delay.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/partitions.h>
+#include <asm/io.h>
+#include <asm/arch/hardware.h>
+#include <asm/sizes.h>
+#include <asm/arch/gpio.h>
+#include <asm/arch/board-ams-delta.h>
+
+/*
+ * MTD structure for E3 (Delta)
+ */
+static struct mtd_info *ams_delta_mtd = NULL;
+
+#define NAND_MASK (AMS_DELTA_LATCH2_NAND_NRE | AMS_DELTA_LATCH2_NAND_NWE | AMS_DELTA_LATCH2_NAND_CLE | AMS_DELTA_LATCH2_NAND_ALE | AMS_DELTA_LATCH2_NAND_NCE | AMS_DELTA_LATCH2_NAND_NWP)
+
+#define T_NAND_CTL_CLRALE(iob) ams_delta_latch2_write(AMS_DELTA_LATCH2_NAND_ALE, 0)
+#define T_NAND_CTL_SETALE(iob) ams_delta_latch2_write(AMS_DELTA_LATCH2_NAND_ALE, AMS_DELTA_LATCH2_NAND_ALE)
+#define T_NAND_CTL_CLRCLE(iob) ams_delta_latch2_write(AMS_DELTA_LATCH2_NAND_CLE, 0)
+#define T_NAND_CTL_SETCLE(iob) ams_delta_latch2_write(AMS_DELTA_LATCH2_NAND_CLE, AMS_DELTA_LATCH2_NAND_CLE)
+#define T_NAND_CTL_SETNCE(iob) ams_delta_latch2_write(AMS_DELTA_LATCH2_NAND_NCE, 0)
+#define T_NAND_CTL_CLRNCE(iob) ams_delta_latch2_write(AMS_DELTA_LATCH2_NAND_NCE, AMS_DELTA_LATCH2_NAND_NCE)
+
+/*
+ * Define partitions for flash devices
+ */
+
+static struct mtd_partition partition_info[] = {
+	{ .name		= "Kernel",
+	  .offset	= 0,
+	  .size		= 3 * SZ_1M + SZ_512K },
+	{ .name		= "u-boot",
+	  .offset	= 3 * SZ_1M + SZ_512K,
+	  .size		= SZ_256K },
+	{ .name		= "u-boot params",
+	  .offset	= 3 * SZ_1M + SZ_512K + SZ_256K,
+	  .size		= SZ_256K },
+	{ .name		= "Amstrad LDR",
+	  .offset	= 4 * SZ_1M,
+	  .size		= SZ_256K },
+	{ .name		= "File system",
+	  .offset	= 4 * SZ_1M + 1 * SZ_256K,
+	  .size		= 27 * SZ_1M },
+	{ .name		= "PBL reserved",
+	  .offset	= 32 * SZ_1M - 3 * SZ_256K,
+	  .size		=  3 * SZ_256K },
+};
+
+/*
+ *	hardware specific access to control-lines
+*/
+
+static void ams_delta_hwcontrol(struct mtd_info *mtd, int cmd)
+{
+	switch(cmd){
+
+		case NAND_CTL_SETCLE: T_NAND_CTL_SETCLE(cmd); break;
+		case NAND_CTL_CLRCLE: T_NAND_CTL_CLRCLE(cmd); break;
+
+		case NAND_CTL_SETALE: T_NAND_CTL_SETALE(cmd); break;
+		case NAND_CTL_CLRALE: T_NAND_CTL_CLRALE(cmd); break;
+
+		case NAND_CTL_SETNCE: T_NAND_CTL_SETNCE(cmd); break;
+		case NAND_CTL_CLRNCE: T_NAND_CTL_CLRNCE(cmd); break;
+	}
+}
+
+static void ams_delta_write_byte(struct mtd_info *mtd, u_char byte)
+{
+	struct nand_chip *this = mtd->priv;
+
+	omap_writew(0, (OMAP_MPUIO_BASE + OMAP_MPUIO_IO_CNTL));
+	omap_writew(byte, this->IO_ADDR_W);
+	ams_delta_latch2_write(AMS_DELTA_LATCH2_NAND_NWE, 0);
+	udelay(1);
+	ams_delta_latch2_write(AMS_DELTA_LATCH2_NAND_NWE,
+			AMS_DELTA_LATCH2_NAND_NWE);
+}
+
+static u_char ams_delta_read_byte(struct mtd_info *mtd)
+{
+	u_char res;
+	struct nand_chip *this = mtd->priv;
+
+	ams_delta_latch2_write(AMS_DELTA_LATCH2_NAND_NRE, 0);
+	udelay(1);
+	omap_writew(~0, (OMAP_MPUIO_BASE + OMAP_MPUIO_IO_CNTL));
+	res = omap_readw(this->IO_ADDR_R);
+	ams_delta_latch2_write(AMS_DELTA_LATCH2_NAND_NRE,
+			AMS_DELTA_LATCH2_NAND_NRE);
+
+	return res;
+}
+
+/*
+ * These 3 functions are basically identical to the ones in nand_base.c, but
+ * we have to call our read_byte/write_byte functions instead of readb/writeb
+ * directly. I submitted a patch to MTD to move this to nand_base.c, but it
+ * was deemed too intrusive.
+ */
+static void ams_delta_write_buf(struct mtd_info *mtd, const u_char *buf,
+		int len)
+{
+	int i;
+
+	for (i=0; i<len; i++)
+		ams_delta_write_byte(mtd, buf[i]);
+}
+
+static void ams_delta_read_buf(struct mtd_info *mtd, u_char *buf, int len)
+{
+	int i;
+
+	for (i=0; i<len; i++)
+		buf[i] = ams_delta_read_byte(mtd);
+}
+
+static int ams_delta_verify_buf(struct mtd_info *mtd, const u_char *buf,
+		int len)
+{
+	int i;
+
+	for (i=0; i<len; i++)
+		if (buf[i] != ams_delta_read_byte(mtd))
+			return -EFAULT;
+
+	return 0;
+}
+
+static int ams_delta_nand_ready(struct mtd_info *mtd)
+{
+	return omap_get_gpio_datain(AMS_DELTA_GPIO_PIN_NAND_RB);
+}
+
+/*
+ * Main initialization routine
+ */
+int __init ams_delta_init (void)
+{
+	struct nand_chip *this;
+	int err = 0;
+
+	/* Allocate memory for MTD device structure and private data */
+	ams_delta_mtd = kmalloc (sizeof(struct mtd_info) +
+					sizeof (struct nand_chip), GFP_KERNEL);
+	if (!ams_delta_mtd) {
+		printk (KERN_WARNING
+			"Unable to allocate E3 NAND MTD device structure.\n");
+		err = -ENOMEM;
+		goto out;
+	}
+
+	/* Get pointer to private data */
+	this = (struct nand_chip *) (&ams_delta_mtd[1]);
+
+	/* Initialize structures */
+	memset((char *) ams_delta_mtd, 0, sizeof(struct mtd_info));
+	memset((char *) this, 0, sizeof(struct nand_chip));
+
+	/* Link the private data with the MTD structure */
+	ams_delta_mtd->priv = this;
+
+	/* Set address of NAND IO lines */
+	this->IO_ADDR_R = (OMAP_MPUIO_BASE + OMAP_MPUIO_INPUT_LATCH);
+	this->IO_ADDR_W = (OMAP_MPUIO_BASE + OMAP_MPUIO_OUTPUT);
+	this->read_byte = ams_delta_read_byte;
+	this->write_byte = ams_delta_write_byte;
+	this->write_buf = ams_delta_write_buf;
+	this->read_buf = ams_delta_read_buf;
+	this->verify_buf = ams_delta_verify_buf;
+	this->hwcontrol = ams_delta_hwcontrol;
+	if (!omap_request_gpio(AMS_DELTA_GPIO_PIN_NAND_RB)) {
+		this->dev_ready = ams_delta_nand_ready;
+	} else {
+		this->dev_ready = NULL;
+		printk(KERN_NOTICE
+			"Couldn't request gpio for Delta NAND ready.\n");
+	}
+	/* 25 us command delay time */
+	this->chip_delay = 30;
+	this->eccmode = NAND_ECC_SOFT;
+
+	/* Set chip enabled, but  */
+	ams_delta_latch2_write(NAND_MASK, AMS_DELTA_LATCH2_NAND_NRE | \
+			AMS_DELTA_LATCH2_NAND_NWE | \
+			AMS_DELTA_LATCH2_NAND_NCE | AMS_DELTA_LATCH2_NAND_NWP);
+
+        /* Scan to find existance of the device */
+	if (nand_scan (ams_delta_mtd, 1)) {
+		err = -ENXIO;
+		goto out_mtd;
+	}
+
+	/* Register the partitions */
+	add_mtd_partitions(ams_delta_mtd, partition_info,
+			ARRAY_SIZE(partition_info));
+
+	goto out;
+
+out_mtd:
+	kfree (ams_delta_mtd);
+out:
+	return err;
+}
+
+module_init(ams_delta_init);
+
+/*
+ * Clean up routine
+ */
+static void __exit ams_delta_cleanup (void)
+{
+	/* Release resources, unregister device */
+	nand_release (ams_delta_mtd);
+
+	/* Free the MTD device structure */
+	kfree (ams_delta_mtd);
+}
+module_exit(ams_delta_cleanup);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Jonathan McDowell <noodles@earth.li>");
+MODULE_DESCRIPTION("Glue layer for NAND flash on Amstrad E3 (Delta)");
diff -rupN -X linux-2.6.16-omap2/Documentation/dontdiff linux-2.6.16-e3-04/drivers/mtd/nand/Kconfig linux-2.6.16-e3-05/drivers/mtd/nand/Kconfig
--- linux-2.6.16-e3-04/drivers/mtd/nand/Kconfig	2006-04-05 22:34:46.335154000 +0100
+++ linux-2.6.16-e3-05/drivers/mtd/nand/Kconfig	2006-04-07 17:47:38.526328000 +0100
@@ -55,6 +55,12 @@ config MTD_NAND_OMAP
 	help
 	  Support for NAND flash on Texas Instruments H3/H2/P2 platforms.
 
+config MTD_NAND_AMS_DELTA
+	tristate "NAND Flash device on Amstrad E3"
+	depends on MACH_AMS_DELTA && MTD_NAND
+	help
+	  Support for NAND flash on Amstrad E3 (Delta).
+
 config MTD_NAND_TOTO
 	tristate "NAND Flash device on TOTO board"
 	depends on ARCH_OMAP && MTD_NAND
diff -rupN -X linux-2.6.16-omap2/Documentation/dontdiff linux-2.6.16-e3-04/drivers/mtd/nand/Makefile linux-2.6.16-e3-05/drivers/mtd/nand/Makefile
--- linux-2.6.16-e3-04/drivers/mtd/nand/Makefile	2006-04-05 22:34:46.339154250 +0100
+++ linux-2.6.16-e3-05/drivers/mtd/nand/Makefile	2006-04-07 17:47:38.526328000 +0100
@@ -7,6 +7,7 @@ obj-$(CONFIG_MTD_NAND)			+= nand.o nand_
 obj-$(CONFIG_MTD_NAND_IDS)		+= nand_ids.o
 
 obj-$(CONFIG_MTD_NAND_SPIA)		+= spia.o
+obj-$(CONFIG_MTD_NAND_AMS_DELTA)	+= ams-delta.o
 obj-$(CONFIG_MTD_NAND_TOTO)		+= toto.o
 obj-$(CONFIG_MTD_NAND_AUTCPU12)		+= autcpu12.o
 obj-$(CONFIG_MTD_NAND_EDB7312)		+= edb7312.o
-----

J.

-- 
                 /------------------------------------\
                 |        noodles is not pasta        |
                 \------------------------------------/
