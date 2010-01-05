From: H Hartley Sweeten <hartleys@visionengravers.com>
To: ARM Kernel <linux-arm-kernel@lists.infradead.org>,
	"linux-mtd" <linux-mtd@lists.infradead.org>,
	ARM Kernel <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 2/2] Remove now-defunct ts7250 nand driver
Date: Tue, 5 Jan 2010 14:59:58 -0700
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <201001051459.58621.hartleys@visionengravers.com>
Cc: joff@embeddedarm.com, mcrapet@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The ts72xx platform has been updated to use the generic platform nand
driver (plat_nand.c).  This removes the now-defunct ts7250.c nand driver.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Matthieu Crapet <mcrapet@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Jesse Off <joff@embeddedARM.com>

=2D--

diff --git a/arch/arm/mach-ep93xx/include/mach/ts72xx.h b/arch/arm/mach-ep9=
3xx/include/mach/ts72xx.h
index 3bd934e..61c0e13 100644
=2D-- a/arch/arm/mach-ep93xx/include/mach/ts72xx.h
+++ b/arch/arm/mach-ep93xx/include/mach/ts72xx.h
@@ -9,9 +9,6 @@
  * febff000	22000000	4K	model number register
  * febfe000	22400000	4K	options register
  * febfd000	22800000	4K	options register #2
=2D * febfc000	[67]0000000	4K	NAND data register
=2D * febfb000	[67]0400000	4K	NAND control register
=2D * febfa000	[67]0800000	4K	NAND busy register
  * febf9000	10800000	4K	TS-5620 RTC index register
  * febf8000	11700000	4K	TS-5620 RTC data register
  */
@@ -41,22 +38,6 @@
 #define TS72XX_OPTIONS2_TS9420_BOOT	0x02
=20
=20
=2D#define TS72XX_NAND1_DATA_PHYS_BASE	0x60000000
=2D#define TS72XX_NAND2_DATA_PHYS_BASE	0x70000000
=2D#define TS72XX_NAND_DATA_VIRT_BASE	0xfebfc000
=2D#define TS72XX_NAND_DATA_SIZE		0x00001000
=2D
=2D#define TS72XX_NAND1_CONTROL_PHYS_BASE	0x60400000
=2D#define TS72XX_NAND2_CONTROL_PHYS_BASE	0x70400000
=2D#define TS72XX_NAND_CONTROL_VIRT_BASE	0xfebfb000
=2D#define TS72XX_NAND_CONTROL_SIZE	0x00001000
=2D
=2D#define TS72XX_NAND1_BUSY_PHYS_BASE	0x60800000
=2D#define TS72XX_NAND2_BUSY_PHYS_BASE	0x70800000
=2D#define TS72XX_NAND_BUSY_VIRT_BASE	0xfebfa000
=2D#define TS72XX_NAND_BUSY_SIZE		0x00001000
=2D
=2D
 #define TS72XX_RTC_INDEX_VIRT_BASE	0xfebf9000
 #define TS72XX_RTC_INDEX_PHYS_BASE	0x10800000
 #define TS72XX_RTC_INDEX_SIZE		0x00001000
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 677cd53..48c727f 100644
=2D-- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -95,12 +95,6 @@ config MTD_NAND_OMAP_PREFETCH_DMA
 	 or in DMA interrupt mode.
 	 Say y for DMA mode or MPU mode will be used
=20
=2Dconfig MTD_NAND_TS7250
=2D	tristate "NAND Flash device on TS-7250 board"
=2D	depends on MACH_TS72XX
=2D	help
=2D	  Support for NAND flash on Technologic Systems TS-7250 platform.
=2D
 config MTD_NAND_IDS
 	tristate
=20
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 1407bd1..fedf10d 100644
=2D-- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -19,7 +19,6 @@ obj-$(CONFIG_MTD_NAND_DISKONCHIP)	+=3D diskonchip.o
 obj-$(CONFIG_MTD_NAND_H1900)		+=3D h1910.o
 obj-$(CONFIG_MTD_NAND_RTC_FROM4)	+=3D rtc_from4.o
 obj-$(CONFIG_MTD_NAND_SHARPSL)		+=3D sharpsl.o
=2Dobj-$(CONFIG_MTD_NAND_TS7250)		+=3D ts7250.o
 obj-$(CONFIG_MTD_NAND_NANDSIM)		+=3D nandsim.o
 obj-$(CONFIG_MTD_NAND_CS553X)		+=3D cs553x_nand.o
 obj-$(CONFIG_MTD_NAND_NDFC)		+=3D ndfc.o
diff --git a/drivers/mtd/nand/ts7250.c b/drivers/mtd/nand/ts7250.c
deleted file mode 100644
index 0f5562a..0000000
=2D-- a/drivers/mtd/nand/ts7250.c
+++ /dev/null
@@ -1,207 +0,0 @@
=2D/*
=2D * drivers/mtd/nand/ts7250.c
=2D *
=2D * Copyright (C) 2004 Technologic Systems (support@embeddedARM.com)
=2D *
=2D * Derived from drivers/mtd/nand/edb7312.c
=2D *   Copyright (C) 2004 Marius Gr=F6ger (mag@sysgo.de)
=2D *
=2D * Derived from drivers/mtd/nand/autcpu12.c
=2D *   Copyright (c) 2001 Thomas Gleixner (gleixner@autronix.de)
=2D *
=2D * This program is free software; you can redistribute it and/or modify
=2D * it under the terms of the GNU General Public License version 2 as
=2D * published by the Free Software Foundation.
=2D *
=2D * Overview:
=2D *   This is a device driver for the NAND flash device found on the
=2D *   TS-7250 board which utilizes a Samsung 32 Mbyte part.
=2D */
=2D
=2D#include <linux/slab.h>
=2D#include <linux/module.h>
=2D#include <linux/init.h>
=2D#include <linux/mtd/mtd.h>
=2D#include <linux/mtd/nand.h>
=2D#include <linux/mtd/partitions.h>
=2D#include <linux/io.h>
=2D
=2D#include <mach/hardware.h>
=2D#include <mach/ts72xx.h>
=2D
=2D#include <asm/sizes.h>
=2D#include <asm/mach-types.h>
=2D
=2D/*
=2D * MTD structure for TS7250 board
=2D */
=2Dstatic struct mtd_info *ts7250_mtd =3D NULL;
=2D
=2D#ifdef CONFIG_MTD_PARTITIONS
=2Dstatic const char *part_probes[] =3D { "cmdlinepart", NULL };
=2D
=2D#define NUM_PARTITIONS 3
=2D
=2D/*
=2D * Define static partitions for flash device
=2D */
=2Dstatic struct mtd_partition partition_info32[] =3D {
=2D	{
=2D		.name		=3D "TS-BOOTROM",
=2D		.offset		=3D 0x00000000,
=2D		.size		=3D 0x00004000,
=2D	}, {
=2D		.name		=3D "Linux",
=2D		.offset		=3D 0x00004000,
=2D		.size		=3D 0x01d00000,
=2D	}, {
=2D		.name		=3D "RedBoot",
=2D		.offset		=3D 0x01d04000,
=2D		.size		=3D 0x002fc000,
=2D	},
=2D};
=2D
=2D/*
=2D * Define static partitions for flash device
=2D */
=2Dstatic struct mtd_partition partition_info128[] =3D {
=2D	{
=2D		.name		=3D "TS-BOOTROM",
=2D		.offset		=3D 0x00000000,
=2D		.size		=3D 0x00004000,
=2D	}, {
=2D		.name		=3D "Linux",
=2D		.offset		=3D 0x00004000,
=2D		.size		=3D 0x07d00000,
=2D	}, {
=2D		.name		=3D "RedBoot",
=2D		.offset		=3D 0x07d04000,
=2D		.size		=3D 0x002fc000,
=2D	},
=2D};
=2D#endif
=2D
=2D
=2D/*
=2D *	hardware specific access to control-lines
=2D *
=2D *	ctrl:
=2D *	NAND_NCE: bit 0 -> bit 2
=2D *	NAND_CLE: bit 1 -> bit 1
=2D *	NAND_ALE: bit 2 -> bit 0
=2D */
=2Dstatic void ts7250_hwcontrol(struct mtd_info *mtd, int cmd, unsigned int=
 ctrl)
=2D{
=2D	struct nand_chip *chip =3D mtd->priv;
=2D
=2D	if (ctrl & NAND_CTRL_CHANGE) {
=2D		unsigned long addr =3D TS72XX_NAND_CONTROL_VIRT_BASE;
=2D		unsigned char bits;
=2D
=2D		bits =3D (ctrl & NAND_NCE) << 2;
=2D		bits |=3D ctrl & NAND_CLE;
=2D		bits |=3D (ctrl & NAND_ALE) >> 2;
=2D
=2D		__raw_writeb((__raw_readb(addr) & ~0x7) | bits, addr);
=2D	}
=2D
=2D	if (cmd !=3D NAND_CMD_NONE)
=2D		writeb(cmd, chip->IO_ADDR_W);
=2D}
=2D
=2D/*
=2D *	read device ready pin
=2D */
=2Dstatic int ts7250_device_ready(struct mtd_info *mtd)
=2D{
=2D	return __raw_readb(TS72XX_NAND_BUSY_VIRT_BASE) & 0x20;
=2D}
=2D
=2D/*
=2D * Main initialization routine
=2D */
=2Dstatic int __init ts7250_init(void)
=2D{
=2D	struct nand_chip *this;
=2D	const char *part_type =3D 0;
=2D	int mtd_parts_nb =3D 0;
=2D	struct mtd_partition *mtd_parts =3D 0;
=2D
=2D	if (!machine_is_ts72xx() || board_is_ts7200())
=2D		return -ENXIO;
=2D
=2D	/* Allocate memory for MTD device structure and private data */
=2D	ts7250_mtd =3D kmalloc(sizeof(struct mtd_info) + sizeof(struct nand_chi=
p), GFP_KERNEL);
=2D	if (!ts7250_mtd) {
=2D		printk("Unable to allocate TS7250 NAND MTD device structure.\n");
=2D		return -ENOMEM;
=2D	}
=2D
=2D	/* Get pointer to private data */
=2D	this =3D (struct nand_chip *)(&ts7250_mtd[1]);
=2D
=2D	/* Initialize structures */
=2D	memset(ts7250_mtd, 0, sizeof(struct mtd_info));
=2D	memset(this, 0, sizeof(struct nand_chip));
=2D
=2D	/* Link the private data with the MTD structure */
=2D	ts7250_mtd->priv =3D this;
=2D	ts7250_mtd->owner =3D THIS_MODULE;
=2D
=2D	/* insert callbacks */
=2D	this->IO_ADDR_R =3D (void *)TS72XX_NAND_DATA_VIRT_BASE;
=2D	this->IO_ADDR_W =3D (void *)TS72XX_NAND_DATA_VIRT_BASE;
=2D	this->cmd_ctrl =3D ts7250_hwcontrol;
=2D	this->dev_ready =3D ts7250_device_ready;
=2D	this->chip_delay =3D 15;
=2D	this->ecc.mode =3D NAND_ECC_SOFT;
=2D
=2D	printk("Searching for NAND flash...\n");
=2D	/* Scan to find existence of the device */
=2D	if (nand_scan(ts7250_mtd, 1)) {
=2D		kfree(ts7250_mtd);
=2D		return -ENXIO;
=2D	}
=2D#ifdef CONFIG_MTD_PARTITIONS
=2D	ts7250_mtd->name =3D "ts7250-nand";
=2D	mtd_parts_nb =3D parse_mtd_partitions(ts7250_mtd, part_probes, &mtd_par=
ts, 0);
=2D	if (mtd_parts_nb > 0)
=2D		part_type =3D "command line";
=2D	else
=2D		mtd_parts_nb =3D 0;
=2D#endif
=2D	if (mtd_parts_nb =3D=3D 0) {
=2D		mtd_parts =3D partition_info32;
=2D		if (ts7250_mtd->size >=3D (128 * 0x100000))
=2D			mtd_parts =3D partition_info128;
=2D		mtd_parts_nb =3D NUM_PARTITIONS;
=2D		part_type =3D "static";
=2D	}
=2D
=2D	/* Register the partitions */
=2D	printk(KERN_NOTICE "Using %s partition definition\n", part_type);
=2D	add_mtd_partitions(ts7250_mtd, mtd_parts, mtd_parts_nb);
=2D
=2D	/* Return happy */
=2D	return 0;
=2D}
=2D
=2Dmodule_init(ts7250_init);
=2D
=2D/*
=2D * Clean up routine
=2D */
=2Dstatic void __exit ts7250_cleanup(void)
=2D{
=2D	/* Unregister the device */
=2D	del_mtd_device(ts7250_mtd);
=2D
=2D	/* Free the MTD device structure */
=2D	kfree(ts7250_mtd);
=2D}
=2D
=2Dmodule_exit(ts7250_cleanup);
=2D
=2DMODULE_LICENSE("GPL");
=2DMODULE_AUTHOR("Jesse Off <joff@embeddedARM.com>");
=2DMODULE_DESCRIPTION("MTD map driver for Technologic Systems TS-7250 board=
");
