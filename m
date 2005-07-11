Received: from mailout2.samsung.com ([203.254.224.25])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DrnTx-0001CZ-DV
	for linux-mtd@lists.infradead.org; Sun, 10 Jul 2005 21:53:26 -0400
Received: from ep_mmp2 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0IJF00HYWX8GMC@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 11 Jul 2005 10:53:04 +0900 (KST)
Received: from july7 ([168.219.213.193])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 HotFix 1.17 (built
	Jun 23 2003)) with ESMTPA id <0IJF00I3CX8FG2@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 11 Jul 2005 10:53:04 +0900 (KST)
Date: Mon, 11 Jul 2005 10:53:05 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
In-reply-to: <1120900240.26713.191.camel@tglx.tec.linutronix.de>
To: tglx@linutronix.de
Message-id: <0IJF00I3DX8FG2@mmp2.samsung.com>
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_3epKk6sgi8lwrvAZ1NWRJA)"
Cc: linux-mtd@lists.infradead.org
Subject: RE: [PATCH] OneNAND MTD support
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

--Boundary_(ID_3epKk6sgi8lwrvAZ1NWRJA)
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT

Hi 

Thank you for comments and advice.

Here's new patch.

Regards

Kyungmin Park

> > > +static int onenand_unlock(struct mtd_info *mtd, loff_t ofs, 
> > There's no status check in locking mechanism
> 
> Hmm. So all the status errors checked in onenand_wait() will never
> happen here ?
> 
> > > 
> > > +		/* Sanity check */
> > > +		while (onenand_readw(this->base + 
> > > ONENAND_REG_CTRL_STATUS)
> > > +		    & ONENAND_CTRL_ONGO)
> > > +			continue;
> > > 
> > > What happens if the condition is not met ?
> > 
> > I think it's board bug. For safety I check it. 
> 
> Then some kind of timeout is definitely appropriate. You will 
> endup in a
> dead loop when the condition is not met due to the bug.

In OneNAND after operation done, The interrupt and controller status is
updated simultaneously.
So it's no problem checking controller status.
If the problem occurs, It's chip bug.

> 
> > > +/*
> > > + * Functions to access the OneNAND IO region
> > > + */
> > > +#define onenand_readw(a)		readw(a)
> > > +#define onenand_writew(v,a)		writew(v, a)
> > > 
> > > Please make onenand_readw/writew functions accessible by function
> > > pointers along with default implementations, so the board 
> driver can
> > > override them if necessary.
> > > 
> > 
> > It's just memory access function. I think no need to make a 
> function.
> 
> Yes, on your board. It turned out to be a good choice to turn 
> _all_ the
> functions which access hardware into function pointers. People design
> weird hardware and the overhead of the function pointer based 
> access is
> minimal. Keeping it your way, one has to replace 4 complex functions
> (command, wait, read/ write) instead of providing 4 small and simple
> ones.

OK. I do it

> 
> +config MTD_ONENAND_OMAP
> +	tristate "OneNAND Flash device on OMAP board"
> +	depends on ARM && ARCH_OMAP && MTD_ONENAND
> 
> "depends on ARCH_OMAP && MTD_ONENAND" is enough, as ARCH_OMAP already
> depends on ARM

It's derived from omap-nand-flash.c, But it's not sended to MTD.
OK. I done

> 
> 
> +++ uncommitted/drivers/mtd/onenand/omap-onenand.c  
> +	default:
> +		printk(KERN_WARNING "Unsupported OneNAND device\n");
> +		err = -ENXIO;
> +		goto out_buf;
> +	}
> +
> +	goto out;
> 
> 	return 0; 
> This is the normal return path. Below is error exit (cleanup)

OK

> 
> +++ uncommitted/drivers/mtd/onenand/onenand_base.c  (mode:100644)
> +static int onenand_read_bufferram(struct mtd_info *mtd, int area,
> +		unsigned char *buffer, int offset, size_t count)
> +{
> +	struct onenand_chip *this = mtd->priv;
> +	void __iomem *bufferram;
> +
> +	if (area == DATARAM)
> +		bufferram = this->base + ONENAND_DATARAM;
> +	else if (area == SPARERAM)
> +		bufferram = this->base + ONENAND_SPARERAM;
> +	else  
> +		bufferram = this->base + ONENAND_BOOTRAM;
> +
> +	if (ONENAND_CURRENT_BUFFERRAM(this)) {
> +		if (area == DATARAM)
> +			bufferram += mtd->oobblock;
> +		else if (area == SPARERAM)
> +			bufferram += mtd->oobsize;
> +	}
> +
> +	memcpy(buffer, bufferram + offset, count);
> +
> +	return 0;
> +}
> 
> area can be a direct offset (ONENAND_DATARAM, ONENAND_SPARERAM,
> ONENAND_BOOTRAM), so you can just write: bufferram = 
> this->base + area;
> 
> 
> +static int onenand_write_bufferram(struct mtd_info *mtd, int area,
> +		const unsigned char *buffer, int offset, size_t count)
> +{
> 
> Same as onenand_read_bufferram

Yes It is more natual. why I don't know this method :)

> 
> +	if (ONENAND_CURRENT_BUFFERRAM(this)) {
> +		if (area == DATARAM)
> +			bufferram += mtd->oobblock;
> +		else if (area == SPARERAM)
> +			bufferram += mtd->oobsize;
> +	}
> 
> Please make this a inline function used in read/write_bufferram

I done.

> 
> +EXPORT_SYMBOL(onenand_scan);
> +EXPORT_SYMBOL(onenand_release);
> 
> Would you mind to change those exports to EXPORT_SYMBOL_GPL ?

In fact I not sure and also don't know license issue. 
If we develop the some commercial mtd user software then can we use mtd
device code exported with GPL? Is there no problem?

> 
> +++ uncommitted/include/linux/mtd/onenand_regs.h  (mode:100644)
> 
> +/* Memory Address Map Translation (Word order) */
> +#define ONENAND_MEMORY_MAP(x)		((x) << 1)
> 
> Is this considered to be a general rule, i.e. is this the 
> only valid way
> to address the chip ? 

To comply with Spec. In Spec. most register addresses are written in word
e.g., Interrupt status registers is 0xf241h
#define ONENAND_REG_INTERRUPT          ONENAND_MEMORY_MAP(0xF241)

> 
> +struct onenand_chip {
> +	void __iomem		*base;
> +	unsigned int		chipsize;
> +	unsigned int		device_id;
> +	unsigned int		version_id;
> +	unsigned int		options;
> 
> Are device_id and version_id necessary for anything else than 
> scan ? If
> no, please remove.
> 

device_id necessary to control DDP chip. But I'm not yet tested with DDP
chip.
version_id is not necessary. removed. 

--Boundary_(ID_3epKk6sgi8lwrvAZ1NWRJA)
Content-type: application/octet-stream; name=onenand-mtd.patch
Content-transfer-encoding: quoted-printable
Content-disposition: attachment; filename=onenand-mtd.patch

Index: drivers/mtd/Kconfig
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- 19f75ba1af6b4b16744159e62fbb7decab5553ef/drivers/mtd/Kconfig  =
(mode:100644)
+++ uncommitted/drivers/mtd/Kconfig  (mode:100644)
@@ -261,5 +261,7 @@

 source "drivers/mtd/nand/Kconfig"

+source "drivers/mtd/onenand/Kconfig"
+
 endmenu

Index: drivers/mtd/Makefile
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- 19f75ba1af6b4b16744159e62fbb7decab5553ef/drivers/mtd/Makefile  =
(mode:100644)
+++ uncommitted/drivers/mtd/Makefile  (mode:100644)
@@ -24,4 +24,4 @@
 nftl-objs              :=3D nftlcore.o nftlmount.o
 inftl-objs             :=3D inftlcore.o inftlmount.o

-obj-y          +=3D chips/ maps/ devices/ nand/
+obj-y          +=3D chips/ maps/ devices/ nand/ onenand/
Index: drivers/mtd/onenand/Kconfig
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- /dev/null  (tree:4b825dc642cb6eb9a060e54bf8d69288fbee4904)
+++ uncommitted/drivers/mtd/onenand/Kconfig  (mode:100644)
@@ -0,0 +1,32 @@
+#
+# linux/drivers/mtd/onenand/Kconfig
+#
+
+menu "OneNAND Flash Device Drivers (EXPERIMENTAL)"
+	depends on MTD !=3D n && EXPERIMENTAL
+
+config MTD_ONENAND
+	tristate "OneNAND Device Support"
+	depends on MTD
+	help
+	  This enables support for accessing all type of OneNAND flash
+	  devices. For further information see
+	  =
<http://www.samsung.com/Products/Semiconductor/Flash/OneNAND_TM/index.htm=
>.
+
+config MTD_ONENAND_VERIFY_WRITE
+	bool "Verify OneNAND page writes"
+	depends on MTD_ONENAND
+	help
+	  This adds an extra check when data is written to the flash. The
+	  OneNAND flash device internally checks only bits transitioning
+	  from 1 to 0. There is a rare possibility that even though the
+	  device thinks the write was successful, a bit could have been
+	  flipped accidentaly due to device wear or something else.
+
+config MTD_ONENAND_OMAP
+	tristate "OneNAND Flash device on OMAP board"
+	depends on ARCH_OMAP && MTD_ONENAND
+	help
+	  Support for OneNAND flash on TI OMAP board.
+
+endmenu
Index: drivers/mtd/onenand/Makefile
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- /dev/null  (tree:4b825dc642cb6eb9a060e54bf8d69288fbee4904)
+++ uncommitted/drivers/mtd/onenand/Makefile  (mode:100644)
@@ -0,0 +1,9 @@
+#
+# Makefile for the OneNAND MTD
+#
+
+# Core functionality.
+obj-$(CONFIG_MTD_ONENAND)		+=3D onenand_base.o
+
+# Board specific.
+obj-$(CONFIG_MTD_ONENAND_OMAP)		+=3D omap-onenand.o
Index: drivers/mtd/onenand/omap-onenand.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- /dev/null  (tree:4b825dc642cb6eb9a060e54bf8d69288fbee4904)
+++ uncommitted/drivers/mtd/onenand/omap-onenand.c  (mode:100644)
@@ -0,0 +1,179 @@
+/*
+ *  linux/drivers/mtd/onenand/omap-onenand.c
+ *
+ *  Copyright (c) 2005 Samsung Electronics
+ *  Kyungmin Park <kyungmin.park@samsung.com>
+ *
+ *  Derived from linux/drivers/mtd/nand/omap-nand-flash.c
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ *  Overview:
+ *   This is a device driver for the OneNAND flash device for TI OMAP =
boards.
+ */
+
+#include <linux/slab.h>
+#include <linux/init.h>
+#include <linux/module.h>
+
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/onenand.h>
+#include <linux/mtd/partitions.h>
+
+#include <asm/io.h>
+#include <asm/arch/hardware.h>
+#include <asm/arch/tc.h>
+#include <asm/sizes.h>
+
+#define OMAP_ONENAND_FLASH_START1	OMAP_CS2A_PHYS
+#define OMAP_ONENAND_FLASH_START2	OMAP_CS0_PHYS
+/*
+ * MTD structure for OMAP board
+ */
+static struct mtd_info *omap_onenand_mtd =3D NULL;
+
+/*
+ * Define partitions for flash devices
+ */
+
+#ifdef CONFIG_MTD_PARTITIONS
+static struct mtd_partition static_partition[] =3D {
+	{
+		.name		=3D "X-Loader + U-Boot",
+		.offset		=3D 0,
+		.size		=3D SZ_128K,
+		.mask_flags	=3D MTD_WRITEABLE	/* force read-only */
+ 	},
+	{
+		.name		=3D "U-Boot Environment",
+		.offset		=3D MTDPART_OFS_APPEND,
+		.size		=3D SZ_128K,
+		.mask_flags	=3D MTD_WRITEABLE	/* force read-only */
+ 	},
+	{
+		.name		=3D "kernel",
+		.offset		=3D MTDPART_OFS_APPEND,
+		.size		=3D 2 * SZ_1M
+	},
+	{
+		.name		=3D "filesystem0",
+		.offset		=3D MTDPART_OFS_APPEND,
+		.size		=3D SZ_16M,
+	},
+	{
+		.name		=3D "filesystem1",
+		.offset		=3D MTDPART_OFS_APPEND,
+		.size		=3D MTDPART_SIZ_FULL,
+	},
+};
+
+const char *part_probes[] =3D { "cmdlinepart", NULL,  };
+
+#endif
+
+/* Scan to find existance of the device at base.
+   This also allocates oob and data internal buffers */
+static char onenand_name[] =3D "onenand";
+
+/*
+ * Main initialization routine
+ */
+static int __init omap_onenand_init (void)
+{
+	struct onenand_chip *this;
+	struct mtd_partition *dynamic_partition =3D 0;
+	int err =3D 0;
+
+	/* Allocate memory for MTD device structure and private data */
+	omap_onenand_mtd =3D kmalloc (sizeof(struct mtd_info) + sizeof (struct =
onenand_chip),
+				GFP_KERNEL);
+	if (!omap_onenand_mtd) {
+		printk (KERN_WARNING "Unable to allocate OneNAND MTD device =
structure.\n");
+		err =3D -ENOMEM;
+		goto out;
+	}
+
+	/* Get pointer to private data */
+	this =3D (struct onenand_chip *) (&omap_onenand_mtd[1]);
+
+	/* Initialize structures */
+	memset((char *) omap_onenand_mtd, 0, sizeof(struct mtd_info) + =
sizeof(struct onenand_chip));
+
+	/* Link the private data with the MTD structure */
+	omap_onenand_mtd->priv =3D this;
+
+        /* try the first address */
+	this->base =3D ioremap(OMAP_ONENAND_FLASH_START1, SZ_128K);
+	omap_onenand_mtd->name =3D onenand_name;
+	if (onenand_scan(omap_onenand_mtd, 1)){
+		/* try the second address */
+		iounmap(this->base);
+		this->base =3D ioremap(OMAP_ONENAND_FLASH_START2, SZ_128K);
+		if (onenand_scan(omap_onenand_mtd, 1)) {
+			iounmap(this->base);
+                        err =3D -ENXIO;
+                        goto out_mtd;
+		}
+	}
+
+	/* Register the partitions */
+	switch (omap_onenand_mtd->size) {
+	case SZ_128M:
+	case SZ_64M:
+	case SZ_32M:
+#ifdef CONFIG_MTD_PARTITIONS
+		err =3D parse_mtd_partitions(omap_onenand_mtd, part_probes,
+					&dynamic_partition, 0);
+		if (err > 0)
+			err =3D add_mtd_partitions(omap_onenand_mtd,
+					dynamic_partition, err);
+		else if (1)
+			err =3D add_mtd_partitions(omap_onenand_mtd,
+					static_partition,
+					ARRAY_SIZE(static_partition));
+		else
+#endif
+			err =3D add_mtd_device(omap_onenand_mtd);
+		if (err)
+			goto out_buf;
+		break;
+
+	default:
+		printk(KERN_WARNING "Unsupported OneNAND device\n");
+		err =3D -ENXIO;
+		goto out_buf;
+	}
+
+	return 0;
+
+out_buf:
+	onenand_release(omap_onenand_mtd);
+	iounmap(this->base);
+out_mtd:
+	kfree(omap_onenand_mtd);
+out:
+	return err;
+}
+
+/*
+ * Clean up routine
+ */
+static void __exit omap_onenand_cleanup (void)
+{
+	struct onenand_chip *this =3D omap_onenand_mtd->priv;
+
+	/* onenand_release frees MTD partitions, MTD structure
+	   and onenand internal buffers */
+	onenand_release(omap_onenand_mtd);
+	iounmap(this->base);
+	kfree(omap_onenand_mtd);
+}
+
+module_init(omap_onenand_init);
+module_exit(omap_onenand_cleanup);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Kyungmin Park <kyungmin.park@samsung.com>");
+MODULE_DESCRIPTION("Glue layer for OneNAND flash on OMAP boards");
Index: drivers/mtd/onenand/onenand_base.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- /dev/null  (tree:4b825dc642cb6eb9a060e54bf8d69288fbee4904)
+++ uncommitted/drivers/mtd/onenand/onenand_base.c  (mode:100644)
@@ -0,0 +1,1464 @@
+/*
+ *  linux/drivers/mtd/onenand/onenand_base.c
+ *
+ *  Copyright (C) 2005 Samsung Electronics
+ *  Kyungmin Park <kyungmin.park@samsung.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/config.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
+#include <linux/mtd/onenand.h>
+
+#include <asm/io.h>
+
+/**
+ * onenand_oob_64 - oob info for large (2KB) page
+ */
+static struct nand_oobinfo onenand_oob_64 =3D {
+	.useecc		=3D MTD_NANDECC_AUTOPLACE,
+	.eccbytes	=3D 20,
+	.eccpos		=3D {
+		8, 9, 10, 11, 12,
+		24, 25, 26, 27, 28,
+		40, 41, 42, 43, 44,
+		56, 57, 58, 59, 60,
+		},
+	.oobfree	=3D {
+		{2, 3}, {14, 2}, {18, 3}, {30, 2},
+		{24, 3}, {46, 2}, {40, 3}, {62, 2} }
+};
+
+/**
+ * onenand_oob_32 - oob info for middle (1KB) page
+ */
+static struct nand_oobinfo onenand_oob_32 =3D {
+	.useecc		=3D MTD_NANDECC_AUTOPLACE,
+	.eccbytes	=3D 10,
+	.eccpos		=3D {
+		8, 9, 10, 11, 12,
+		24, 25, 26, 27, 28,
+		},
+	.oobfree	=3D { {2, 3}, {14, 2}, {18, 3}, {30, 2} }
+};
+
+static const unsigned char ffchars[] =3D {
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,	/* 16 */
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,	/* 32 */
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,	/* 48 */
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,	/* 64 */
+};
+
+/**
+ * onenand_readw - [OneNAND Interface] Read OneNAND register
+ * @param addr		address to read
+ *
+ * Read OneNAND register
+ */
+static unsigned short onenand_readw(void __iomem *addr)
+{
+	return readw(addr);
+}
+
+/**
+ * onenand_writew - [OneNAND Interface] Write OneNAND register with =
value
+ * @param value		value to write
+ * @param addr		address to write
+ *
+ * Write OneNAND register with value
+ */
+static void onenand_writew(unsigned short value, void __iomem *addr)
+{
+	writew(value, addr);
+}
+
+/**
+ * onenand_block_address - [DEFAULT] Get block address
+ * @param device	the device id
+ * @param block		the block
+ * @return		translated block address if DDP, otherwise same
+ *
+ * Setup Start Address 1 Register (F100h)
+ */
+static int onenand_block_address(int device, int block)
+{
+	if (device & ONENAND_DEVICE_IS_DDP) {
+		/* Device Flash Core select, NAND Flash Block Address */
+		int dfs =3D 0, density, mask;
+
+		density =3D device >> ONENAND_DEVICE_DENSITY_SHIFT;
+		mask =3D (1 << (density + 6));
+
+		if (block & mask)
+			dfs =3D 1;
+
+		return (dfs << ONENAND_DDP_SHIFT) | (block & (mask - 1));
+	}
+
+	return block;
+}
+
+/**
+ * onenand_bufferram_address - [DEFAULT] Get bufferram address
+ * @param device	the device id
+ * @param block		the block
+ * @return		set DBS value if DDP, otherwise 0
+ *
+ * Setup Start Address 2 Register (F101h) for DDP
+ */
+static int onenand_bufferram_address(int device, int block)
+{
+	if (device & ONENAND_DEVICE_IS_DDP) {
+		/* Device BufferRAM Select */
+		int dbs =3D 0, density, mask;
+
+		density =3D device >> ONENAND_DEVICE_DENSITY_SHIFT;
+		mask =3D (1 << (density + 6));
+
+		if (block & mask)
+			dbs =3D 1;
+
+		return (dbs << ONENAND_DDP_SHIFT);
+	}
+
+	return 0;
+}
+
+/**
+ * onenand_page_address - [DEFAULT] Get page address
+ * @param page		the page address
+ * @param sector	the sector address
+ * @return		combined page and sector address
+ *
+ * Setup Start Address 8 Register (F107h)
+ */
+static int onenand_page_address(int page, int sector)
+{
+	/* Flash Page Address, Flash Sector Address */
+	int fpa, fsa;
+
+	fpa =3D page & ONENAND_FPA_MASK;
+	fsa =3D sector & ONENAND_FSA_MASK;
+
+	return ((fpa << ONENAND_FPA_SHIFT) | fsa);
+}
+
+/**
+ * onenand_buffer_address - [DEFAULT] Get buffer address
+ * @param dataram1	DataRAM index
+ * @param sectors	the sector address
+ * @param count		the number of sectors
+ * @return		the start buffer value
+ *
+ * Setup Start Buffer Register (F200h)
+ */
+static int onenand_buffer_address(int dataram1, int sectors, int count)
+{
+	int bsa, bsc;
+
+	/* BufferRAM Sector Address */
+	bsa =3D sectors & ONENAND_BSA_MASK;
+
+	if (dataram1)
+		bsa |=3D ONENAND_BSA_DATARAM1;	/* DataRAM1 */
+	else
+		bsa |=3D ONENAND_BSA_DATARAM0;	/* DataRAM0 */
+
+	/* BufferRAM Sector Count */
+	bsc =3D count & ONENAND_BSC_MASK;
+
+	return ((bsa << ONENAND_BSA_SHIFT) | bsc);
+}
+
+/**
+ * onenand_command - [DEFAULT] Send command to OneNAND device
+ * @param mtd		MTD device structure
+ * @param cmd		the command to be sent
+ * @param addr		offset to read from or write to
+ * @param len		number of bytes to read or write
+ *
+ * Send command to OneNAND device. This function is used for =
middle/large page
+ * devices (1KB/2KB Bytes per page)
+ */
+static int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr, =
size_t len)
+{
+	struct onenand_chip *this =3D mtd->priv;
+	int value, readcmd =3D 0;
+	int block, page;
+	/* Now we use page size operation */
+	int sectors =3D 4, count =3D 4;
+
+	/* Address translation */
+	switch (cmd) {
+	case ONENAND_CMD_UNLOCK:
+	case ONENAND_CMD_LOCK:
+	case ONENAND_CMD_LOCK_TIGHT:
+		block =3D -1;
+		page =3D -1;
+		break;
+
+	case ONENAND_CMD_ERASE:
+	case ONENAND_CMD_BUFFERRAM:
+		block =3D (int) (addr >> this->erase_shift);
+		page =3D -1;
+		break;
+
+	default:
+		block =3D (int) (addr >> this->erase_shift);
+		page =3D (int) (addr >> this->page_shift);
+		page &=3D this->page_mask;
+		break;
+	}
+
+	/* NOTE: The setting order of the registers is very important! */
+	if (cmd =3D=3D ONENAND_CMD_BUFFERRAM) {
+		/* Select DataRAM for DDP */
+		value =3D onenand_bufferram_address(this->device_id, block);
+		this->write_word(value, this->base + ONENAND_REG_START_ADDRESS2);
+
+		/* Switch to the next data buffer */
+		ONENAND_SET_NEXT_BUFFERRAM(this);
+
+		return 0;
+	}
+
+	if (block !=3D -1) {
+		/* Write 'DFS, FBA' of Flash */
+		value =3D onenand_block_address(this->device_id, block);
+		this->write_word(value, this->base + ONENAND_REG_START_ADDRESS1);
+	}
+
+	if (page !=3D -1) {
+		int dataram;
+
+		switch (cmd) {
+		case ONENAND_CMD_READ:
+		case ONENAND_CMD_READOOB:
+			dataram =3D ONENAND_SET_NEXT_BUFFERRAM(this);
+			readcmd =3D 1;
+			break;
+
+		default:
+			dataram =3D ONENAND_CURRENT_BUFFERRAM(this);
+			break;
+		}
+
+		/* Write 'FPA, FSA' of Flash */
+		value =3D onenand_page_address(page, sectors);
+		this->write_word(value, this->base + ONENAND_REG_START_ADDRESS8);
+
+		/* Write 'BSA, BSC' of DataRAM */
+		value =3D onenand_buffer_address(dataram, sectors, count);
+		this->write_word(value, this->base + ONENAND_REG_START_BUFFER);
+		=09
+		if (readcmd) {
+			/* Select DataRAM for DDP */
+			value =3D onenand_bufferram_address(this->device_id, block);
+			this->write_word(value, this->base + ONENAND_REG_START_ADDRESS2);
+		}
+	}
+
+	/* Interrupt clear */
+	this->write_word(ONENAND_INT_CLEAR, this->base + =
ONENAND_REG_INTERRUPT);
+
+	/* Write command */
+	this->write_word(cmd, this->base + ONENAND_REG_COMMAND);
+
+	return 0;
+}
+
+/**
+ * onenand_wait - [DEFAULT] wait until the command is done
+ * @param mtd		MTD device structure
+ * @param state		state to select the max. timeout value
+ *
+ * Wait for command done. This applies to all OneNAND command
+ * Read can take up to 30us, erase up to 2ms and program up to 350us
+ * according to general OneNAND specs
+ */
+static int onenand_wait(struct mtd_info *mtd, int state)
+{
+	struct onenand_chip * this =3D mtd->priv;
+	unsigned long timeout;
+	unsigned int flags =3D ONENAND_INT_MASTER;
+	unsigned int interrupt =3D 0;
+	unsigned int ctrl, ecc;
+
+	/* The 10 msec is enough */
+	timeout =3D jiffies + msecs_to_jiffies(10);
+	while (time_before(jiffies, timeout)) {
+		interrupt =3D this->read_word(this->base + ONENAND_REG_INTERRUPT);
+
+		if (interrupt & flags)
+			break;
+
+		if (state !=3D FL_READING)
+			cond_resched();
+	}
+	/* To get correct interrupt status in timeout case */
+	interrupt =3D this->read_word(this->base + ONENAND_REG_INTERRUPT);
+
+	ctrl =3D this->read_word(this->base + ONENAND_REG_CTRL_STATUS);
+
+	if (ctrl & ONENAND_CTRL_ERROR) {
+		DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: controller error =3D 0x%04x", =
ctrl);
+		return -EIO;
+	}
+
+	if (ctrl & ONENAND_CTRL_LOCK) {
+		DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: it's locked error =3D 0x%04x", =
ctrl);
+		return -EIO;
+	}
+
+	if (interrupt & ONENAND_INT_READ) {
+		ecc =3D this->read_word(this->base + ONENAND_REG_ECC_STATUS);
+		if (ecc & ONENAND_ECC_2BIT_ALL) {
+			DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: ECC error =3D 0x%04x", ecc);
+			return -EBADMSG;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * onenand_bufferram_offset - [DEFAULT] BufferRAM offset
+ * @param mtd		MTD data structure
+ * @param area		BufferRAM area
+ * @return		offset given area
+ *
+ * Return BufferRAM offset given area
+ */
+static inline int onenand_bufferram_offset(struct mtd_info *mtd, int =
area)
+{
+	struct onenand_chip *this =3D mtd->priv;
+
+	if (ONENAND_CURRENT_BUFFERRAM(this)) {
+		if (area =3D=3D ONENAND_DATARAM)
+			return mtd->oobblock;
+		if (area =3D=3D ONENAND_SPARERAM)
+			return mtd->oobsize;
+	}
+
+	return 0;
+}
+
+/**
+ * onenand_read_bufferram - [OneNAND Interface] Read the bufferram area
+ * @param mtd		MTD data structure
+ * @param area		BufferRAM area
+ * @param buffer	the databuffer to put/get data
+ * @param offset	offset to read from or write to
+ * @param count		number of bytes to read/write
+ *
+ * Read the BufferRAM area
+ */
+static int onenand_read_bufferram(struct mtd_info *mtd, int area,
+		unsigned char *buffer, int offset, size_t count)
+{
+	struct onenand_chip *this =3D mtd->priv;
+	void __iomem *bufferram;
+
+	bufferram =3D this->base + area;
+
+	bufferram +=3D onenand_bufferram_offset(mtd, area);
+
+	memcpy(buffer, bufferram + offset, count);
+
+	return 0;
+}
+
+/**
+ * onenand_write_bufferram - [OneNAND Interface] Write the bufferram =
area
+ * @param mtd		MTD data structure
+ * @param area		BufferRAM area
+ * @param buffer	the databuffer to put/get data
+ * @param offset	offset to read from or write to
+ * @param count		number of bytes to read/write
+ *
+ * Write the BufferRAM area
+ */
+static int onenand_write_bufferram(struct mtd_info *mtd, int area,
+		const unsigned char *buffer, int offset, size_t count)
+{
+	struct onenand_chip *this =3D mtd->priv;
+	void __iomem *bufferram;
+
+	bufferram =3D this->base + area;
+
+	bufferram +=3D onenand_bufferram_offset(mtd, area);
+
+	memcpy(bufferram + offset, buffer, count);
+
+	return 0;
+}
+
+/**
+ * onenand_check_bufferram - [GENERIC] Check BufferRAM information
+ * @param mtd		MTD data structure
+ * @param addr		address to check
+ * @return		1 if there are valid data, otherwise 0=20
+ *
+ * Check bufferram if there is data we required
+ */
+static int onenand_check_bufferram(struct mtd_info *mtd, loff_t addr)
+{
+	struct onenand_chip *this =3D mtd->priv;
+	int block, page;
+	int i;
+=09
+	block =3D (int) (addr >> this->erase_shift);
+	page =3D (int) (addr >> this->page_shift);
+	page &=3D this->page_mask;
+
+	i =3D ONENAND_CURRENT_BUFFERRAM(this);
+
+	/* Is there valid data? */
+	if (this->bufferram[i].block =3D=3D block &&
+	    this->bufferram[i].page =3D=3D page &&
+	    this->bufferram[i].valid)
+		return 1;
+
+	return 0;
+}
+
+/**
+ * onenand_update_bufferram - [GENERIC] Update BufferRAM information
+ * @param mtd		MTD data structure
+ * @param addr		address to update
+ * @param valid		valid flag
+ *
+ * Update BufferRAM information
+ */
+static int onenand_update_bufferram(struct mtd_info *mtd, loff_t addr,
+		int valid)
+{
+	struct onenand_chip *this =3D mtd->priv;
+	int block, page;
+	int i;
+=09
+	block =3D (int) (addr >> this->erase_shift);
+	page =3D (int) (addr >> this->page_shift);
+	page &=3D this->page_mask;
+
+	/* Invalidate BufferRAM */
+	for (i =3D 0; i < MAX_BUFFERRAM; i++) {
+		if (this->bufferram[i].block =3D=3D block &&
+		    this->bufferram[i].page =3D=3D page)
+			this->bufferram[i].valid =3D 0;
+	}
+
+	/* Update BufferRAM */
+	i =3D ONENAND_CURRENT_BUFFERRAM(this);
+	this->bufferram[i].block =3D block;
+	this->bufferram[i].page =3D page;
+	this->bufferram[i].valid =3D valid;
+
+	return 0;
+}
+
+/**
+ * onenand_get_device - [GENERIC] Get chip for selected access
+ * @param mtd		MTD device structure
+ * @param new_state	the state which is requested
+ *
+ * Get the device and lock it for exclusive access
+ */
+static void onenand_get_device(struct mtd_info *mtd, int new_state)
+{
+	struct onenand_chip *this =3D mtd->priv;
+	DECLARE_WAITQUEUE(wait, current);
+
+	/*
+	 * Grab the lock and see if the device is available
+	 */
+	while (1) {
+		spin_lock(&this->chip_lock);
+		if (this->state =3D=3D FL_READY) {
+			this->state =3D new_state;
+			spin_unlock(&this->chip_lock);
+			break;
+		}
+		set_current_state(TASK_UNINTERRUPTIBLE);
+		add_wait_queue(&this->wq, &wait);
+		spin_unlock(&this->chip_lock);
+		schedule();
+		remove_wait_queue(&this->wq, &wait);
+	}
+}
+
+/**
+ * onenand_release_device - [GENERIC] release chip
+ * @param mtd		MTD device structure
+ *
+ * Deselect, release chip lock and wake up anyone waiting on the device
+ */
+static void onenand_release_device(struct mtd_info *mtd)
+{
+	struct onenand_chip *this =3D mtd->priv;
+
+	/* Release the chip */
+	spin_lock(&this->chip_lock);
+	this->state =3D FL_READY;
+	wake_up(&this->wq);
+	spin_unlock(&this->chip_lock);
+}
+
+/**
+ * onenand_read_ecc - [MTD Interface] Read data with ECC
+ * @param mtd		MTD device structure
+ * @param from		offset to read from
+ * @param len		number of bytes to read
+ * @param retlen	pointer to variable to store the number of read bytes
+ * @param buf		the databuffer to put data
+ * @param oob_buf	filesystem supplied oob data buffer
+ * @param oobsel	oob selection structure
+ *
+ * OneNAND read with ECC
+ */
+static int onenand_read_ecc(struct mtd_info *mtd, loff_t from, size_t =
len,
+	size_t *retlen, u_char *buf,
+	u_char *oob_buf, struct nand_oobinfo *oobsel)
+{
+	struct onenand_chip *this =3D mtd->priv;
+	int read =3D 0, column;
+	int thislen;
+	int ret =3D 0;
+
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_read_ecc: from =3D 0x%08x, len =3D =
%i\n", (unsigned int) from, (int) len);
+
+	/* Do not allow reads past end of device */
+	if ((from + len) > mtd->size) {
+		DEBUG(MTD_DEBUG_LEVEL0, "onenand_read_ecc: Attempt read beyond end of =
device\n");
+		*retlen =3D 0;
+		return -EINVAL;
+	}
+
+	/* Grab the lock and see if the device is available */
+	onenand_get_device(mtd, FL_READING);
+
+	/* TODO handling oob */
+
+	while (read < len) {
+		thislen =3D min_t(int, mtd->oobblock, len - read);
+
+		column =3D from & (mtd->oobblock - 1);
+		if (column + thislen > mtd->oobblock)
+			thislen =3D mtd->oobblock - column;
+
+		if (!onenand_check_bufferram(mtd, from)) {
+			this->command(mtd, ONENAND_CMD_READ, from, mtd->oobblock);
+
+			ret =3D this->wait(mtd, FL_READING);
+			/* First copy data and check return value for ECC handling */
+			onenand_update_bufferram(mtd, from, 1);
+		}
+
+		this->read_bufferram(mtd, ONENAND_DATARAM, buf, column, thislen);
+
+		read +=3D thislen;
+
+		if (read =3D=3D len)
+			break;
+
+		if (ret) {
+			DEBUG(MTD_DEBUG_LEVEL0, "onenand_read_ecc: read failed =3D %d\n", =
ret);
+			goto out;
+		}
+
+		from +=3D thislen;
+		buf +=3D thislen;
+	}
+
+out:
+	/* Deselect and wake up anyone waiting on the device */
+	onenand_release_device(mtd);
+
+	/*
+	 * Return success, if no ECC failures, else -EBADMSG
+	 * fs driver will take care of that, because
+	 * retlen =3D=3D desired len and result =3D=3D -EBADMSG
+	 */
+	*retlen =3D read;
+	return ret;
+}
+
+/**
+ * onenand_read - [MTD Interface] MTD compability function for =
onenand_read_ecc
+ * @param mtd		MTD device structure
+ * @param from		offset to read from
+ * @param len		number of bytes to read
+ * @param retlen	pointer to variable to store the number of read bytes
+ * @param buf		the databuffer to put data
+ *
+ * This function simply calls onenand_read_ecc with oob buffer and =
oobsel =3D NULL
+*/
+static int onenand_read(struct mtd_info *mtd, loff_t from, size_t len,
+	size_t *retlen, u_char *buf)
+{
+	return onenand_read_ecc(mtd, from, len, retlen, buf, NULL, NULL);
+}
+
+/**
+ * onenand_read_oob - [MTD Interface] OneNAND read out-of-band
+ * @param mtd		MTD device structure
+ * @param from		offset to read from
+ * @param len		number of bytes to read
+ * @param retlen	pointer to variable to store the number of read bytes
+ * @param buf		the databuffer to put data
+ *
+ * OneNAND read out-of-band data from the spare area
+ */
+static int onenand_read_oob(struct mtd_info *mtd, loff_t from, size_t =
len,
+	size_t *retlen, u_char *buf)
+{
+	struct onenand_chip *this =3D mtd->priv;
+	int read =3D 0, thislen, column;
+	int ret =3D 0;
+
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_read_oob: from =3D 0x%08x, len =3D =
%i\n", (unsigned int) from, (int) len);
+
+	/* Initialize return length value */
+	*retlen =3D 0;
+
+	/* Do not allow reads past end of device */
+	if (unlikely((from + len) > mtd->size)) {
+		DEBUG(MTD_DEBUG_LEVEL0, "onenand_read_oob: Attempt read beyond end of =
device\n");
+		return -EINVAL;
+	}
+
+	/* Grab the lock and see if the device is available */
+	onenand_get_device(mtd, FL_READING);
+
+	column =3D from & (mtd->oobsize - 1);
+
+	while (read < len) {
+		thislen =3D mtd->oobsize - column;
+		thislen =3D min_t(int, thislen, len);
+
+		this->command(mtd, ONENAND_CMD_READOOB, from, mtd->oobsize);
+
+		onenand_update_bufferram(mtd, from, 0);
+
+		ret =3D this->wait(mtd, FL_READING);
+		/* First copy data and check return value for ECC handling */
+
+		this->read_bufferram(mtd, ONENAND_SPARERAM, buf, column, thislen);
+
+		read +=3D thislen;
+
+		if (read =3D=3D len)
+			break;
+
+		if (ret) {
+			DEBUG(MTD_DEBUG_LEVEL0, "onenand_read_oob: read failed =3D %d\n", =
ret);
+			goto out;
+		}
+
+		buf +=3D thislen;
+
+		/* Read more? */
+		if (read < len) {
+			/* Page size */
+			from +=3D mtd->oobblock;
+			column =3D 0;
+		}
+	}
+
+out:
+	/* Deselect and wake up anyone waiting on the device */
+	onenand_release_device(mtd);
+
+	*retlen =3D read;
+	return ret;
+}
+
+#ifdef CONFIG_MTD_ONENAND_VERIFY_WRITE
+/**
+ * onenand_verify_page - [GENERIC] verify the chip contents after a =
write
+ * @param mtd		MTD device structure
+ * @param buf		the databuffer to verify
+ * @param block		block address
+ * @param page		page address
+ *
+ * Check DataRAM area directly
+ */
+static int onenand_verify_page(struct mtd_info *mtd, u_char *buf,
+	loff_t addr, int block, int page)
+{
+	struct onenand_chip *this =3D mtd->priv;
+	void __iomem *dataram0, *dataram1;
+	int ret =3D 0;
+
+	this->command(mtd, ONENAND_CMD_READ, addr, mtd->oobblock);
+
+	ret =3D this->wait(mtd, FL_READING);
+	if (ret)
+		return ret;
+
+	onenand_update_bufferram(mtd, addr, 1);
+
+	/* Check, if the two dataram areas are same */
+	dataram0 =3D this->base + ONENAND_DATARAM;
+	dataram1 =3D dataram0 + mtd->oobblock;
+
+	if (memcmp(dataram0, dataram1, mtd->oobblock))
+		return -EBADMSG;
+=09
+	return 0;
+}
+#else
+#define onenand_verify_page(...)	(0)
+#endif
+
+#define NOTALIGNED(x)	((x & (mtd->oobblock - 1)) !=3D 0)
+
+/**
+ * onenand_write_ecc - [MTD Interface] OneNAND write with ECC
+ * @param mtd		MTD device structure
+ * @param to		offset to write to
+ * @param len		number of bytes to write
+ * @param retlen	pointer to variable to store the number of written =
bytes
+ * @param buf		the data to write
+ * @param eccbuf	filesystem supplied oob data buffer
+ * @param oobsel	oob selection structure
+ *
+ * OneNAND write with ECC
+ */
+static int onenand_write_ecc(struct mtd_info *mtd, loff_t to, size_t =
len,
+	size_t *retlen, const u_char *buf,
+	u_char *eccbuf, struct nand_oobinfo *oobsel)
+{
+	struct onenand_chip *this =3D mtd->priv;
+	int written =3D 0;
+	int ret =3D 0;
+
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_write_ecc: to =3D 0x%08x, len =3D =
%i\n", (unsigned int) to, (int) len);
+
+	/* Initialize retlen, in case of early exit */
+	*retlen =3D 0;
+
+	/* Do not allow writes past end of device */
+	if (unlikely((to + len) > mtd->size)) {
+		DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_ecc: Attempt write to past end =
of device\n");
+		return -EINVAL;
+	}
+
+	/* Reject writes, which are not page aligned */
+        if (unlikely(NOTALIGNED(to)) || unlikely(NOTALIGNED(len))) {
+                DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_ecc: Attempt to =
write not page aligned data\n");
+                return -EINVAL;
+        }
+
+	/* Grab the lock and see if the device is available */
+	onenand_get_device(mtd, FL_WRITING);
+
+	/* Loop until all data write */
+	while (written < len) {
+		int thislen =3D min_t(int, mtd->oobblock, len - written);
+
+		this->command(mtd, ONENAND_CMD_BUFFERRAM, to, mtd->oobblock);
+
+		this->write_bufferram(mtd, ONENAND_DATARAM, buf, 0, thislen);
+		this->write_bufferram(mtd, ONENAND_SPARERAM, ffchars, 0, =
mtd->oobsize);
+
+		this->command(mtd, ONENAND_CMD_PROG, to, mtd->oobblock);
+
+		onenand_update_bufferram(mtd, to, 1);
+
+		ret =3D this->wait(mtd, FL_WRITING);
+		if (ret) {
+			DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_ecc: write filaed %d\n", =
ret);
+			goto out;
+		}
+
+		written +=3D thislen;
+
+		/* Only check verify write turn on */
+		ret =3D onenand_verify_page(mtd, (u_char *) buf, to, block, page);
+		if (ret) {
+			DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_ecc: verify failed %d\n", =
ret);
+			goto out;
+		}
+
+		if (written =3D=3D len)
+			break;
+
+		to +=3D thislen;
+		buf +=3D thislen;
+	}
+
+out:
+	/* Deselect and wake up anyone waiting on the device */
+	onenand_release_device(mtd);
+
+	*retlen =3D written;
+=09
+	return ret;
+}
+
+/**
+ * onenand_write - [MTD Interface] compability function for =
onenand_write_ecc
+ * @param mtd		MTD device structure
+ * @param to		offset to write to
+ * @param len		number of bytes to write
+ * @param retlen	pointer to variable to store the number of written =
bytes
+ * @param buf		the data to write
+ *
+ * This function simply calls onenand_write_ecc
+ * with oob buffer and oobsel =3D NULL
+ */
+static int onenand_write(struct mtd_info *mtd, loff_t to, size_t len,
+	size_t *retlen, const u_char *buf)
+{
+	return onenand_write_ecc(mtd, to, len, retlen, buf, NULL, NULL);
+}
+
+/**
+ * onenand_write_oob - [MTD Interface] OneNAND write out-of-band
+ * @param mtd		MTD device structure
+ * @param to		offset to write to
+ * @param len		number of bytes to write
+ * @param retlen	pointer to variable to store the number of written =
bytes
+ * @param buf		the data to write
+ *
+ * OneNAND write out-of-band
+ */
+static int onenand_write_oob(struct mtd_info *mtd, loff_t to, size_t =
len,
+	size_t *retlen, const u_char *buf)
+{
+	struct onenand_chip *this =3D mtd->priv;
+	int column, status;
+	int written =3D 0;
+
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_write_oob: to =3D 0x%08x, len =3D =
%i\n", (unsigned int) to, (int) len);
+
+	/* Initialize retlen, in case of early exit */
+	*retlen =3D 0;
+
+	/* Do not allow writes past end of device */
+	if (unlikely((to + len) > mtd->size)) {
+		DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_oob: Attempt write to past end =
of device\n");
+		return -EINVAL;
+	}
+
+	/* Grab the lock and see if the device is available */
+	onenand_get_device(mtd, FL_WRITING);
+
+	/* Loop until all data write */
+	while (written < len) {
+		int thislen =3D min_t(int, mtd->oobsize, len - written);
+
+		column =3D to & (mtd->oobsize - 1);
+
+		this->command(mtd, ONENAND_CMD_BUFFERRAM, to, mtd->oobsize);
+
+		this->write_bufferram(mtd, ONENAND_SPARERAM, ffchars, 0, =
mtd->oobsize);
+		this->write_bufferram(mtd, ONENAND_SPARERAM, buf, column, thislen);
+
+		this->command(mtd, ONENAND_CMD_PROGOOB, to, mtd->oobsize);
+
+		onenand_update_bufferram(mtd, to, 0);
+
+		status =3D this->wait(mtd, FL_WRITING);
+		if (status)
+			goto out;
+
+		written +=3D thislen;
+
+		if (written =3D=3D len)
+			break;
+
+		to +=3D thislen;
+		buf +=3D thislen;
+	}
+
+out:
+	/* Deselect and wake up anyone waiting on the device */
+	onenand_release_device(mtd);
+
+	*retlen =3D written;
+=09
+	return 0;
+}
+
+/**
+ * onenand_writev_ecc - [MTD Interface] write with iovec with ecc
+ * @param mtd		MTD device structure
+ * @param vecs		the iovectors to write
+ * @param count		number of vectors
+ * @param to		offset to write to
+ * @param retlen	pointer to variable to store the number of written =
bytes
+ * @param eccbuf	filesystem supplied oob data buffer
+ * @param oobsel	oob selection structure
+ *
+ * OneNAND write with iovec with ecc
+ */
+static int onenand_writev_ecc(struct mtd_info *mtd, const struct kvec =
*vecs,
+	unsigned long count, loff_t to, size_t *retlen,
+	u_char *eccbuf, struct nand_oobinfo *oobsel)
+{
+	struct onenand_chip *this =3D mtd->priv;
+	unsigned char buffer[mtd->oobblock], *pbuf;
+	size_t total_len, len;
+	int i, written =3D 0;
+	int ret =3D 0;
+
+	/* Preset written len for early exit */
+	*retlen =3D 0;
+
+	/* Calculate total length of data */
+	total_len =3D 0;
+	for (i =3D 0; i < count; i++)
+		total_len +=3D vecs[i].iov_len;
+
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_writev_ecc: to =3D 0x%08x, len =3D =
%i, count =3D %ld\n", (unsigned int) to, (unsigned int) total_len, =
count);
+
+	/* Do not allow write past end of the device */
+	if (unlikely((to + total_len) > mtd->size)) {
+		DEBUG(MTD_DEBUG_LEVEL0, "onenand_writev_ecc: Attempted write past end =
of device\n");
+		return -EINVAL;
+	}
+
+	/* Reject writes, which are not page aligned */
+        if (unlikely(NOTALIGNED(to)) || =
unlikely(NOTALIGNED(total_len))) {
+                DEBUG(MTD_DEBUG_LEVEL0, "onenand_writev_ecc: Attempt to =
write not page aligned data\n");
+                return -EINVAL;
+        }
+
+	/* Grab the lock and see if the device is available */
+	onenand_get_device(mtd, FL_WRITING);
+
+	/* TODO handling oob */
+=09
+	/* Loop until all keve's data has been written */
+	len =3D 0;
+	while (count) {
+		pbuf =3D buffer;
+		/*=20
+		 * If the given tuple is >=3D pagesize then
+		 * write it out from the iov
+		 */
+		if ((vecs->iov_len - len) >=3D mtd->oobblock) {
+			pbuf =3D vecs->iov_base + len;
+
+			len +=3D mtd->oobblock;
+
+			/* Check, if we have to switch to the next tuple */
+			if (len >=3D (int) vecs->iov_len) {
+				vecs++;
+				len =3D 0;
+				count--;
+			}
+		} else {
+			int cnt =3D 0, thislen;
+			while (cnt < mtd->oobblock) {
+				thislen =3D min_t(int, mtd->oobblock - cnt, vecs->iov_len - len);
+				memcpy(buffer + cnt, vecs->iov_base + len, thislen);
+				cnt +=3D thislen;
+				len +=3D thislen;
+
+				/* Check, if we have to switch to the next tuple */
+				if (len >=3D (int) vecs->iov_len) {
+					vecs++;
+					len =3D 0;
+					count--;
+				}
+			}
+		}
+
+		this->command(mtd, ONENAND_CMD_BUFFERRAM, to, mtd->oobblock);
+
+		this->write_bufferram(mtd, ONENAND_DATARAM, pbuf, 0, mtd->oobblock);
+		this->write_bufferram(mtd, ONENAND_SPARERAM, ffchars, 0, =
mtd->oobsize);
+
+		this->command(mtd, ONENAND_CMD_PROG, to, mtd->oobblock);
+
+		onenand_update_bufferram(mtd, to, 1);
+
+		ret =3D this->wait(mtd, FL_WRITING);
+		if (ret) {
+			DEBUG(MTD_DEBUG_LEVEL0, "onenand_writev_ecc: write failed %d\n", =
ret);
+			goto out;
+		}
+
+
+		/* Only check verify write turn on */
+		ret =3D onenand_verify_page(mtd, (u_char *) pbuf, to, block, page);
+		if (ret) {
+			DEBUG(MTD_DEBUG_LEVEL0, "onenand_writev_ecc: verify failed %d\n", =
ret);
+			goto out;
+		}
+
+		written +=3D mtd->oobblock;
+
+		to +=3D mtd->oobblock;
+	}
+
+out:
+	/* Deselect and wakt up anyone waiting on the device */
+	onenand_release_device(mtd);
+
+	*retlen =3D written;
+
+	return 0;
+}
+
+/**
+ * onenand_writev - [MTD Interface] compabilty function for =
onenand_writev_ecc
+ * @param mtd		MTD device structure
+ * @param vecs		the iovectors to write
+ * @param count		number of vectors
+ * @param to		offset to write to
+ * @param retlen	pointer to variable to store the number of written =
bytes
+ *
+ * OneNAND write with kvec. This just calls the ecc function
+ */
+static int onenand_writev(struct mtd_info *mtd, const struct kvec =
*vecs,
+	unsigned long count, loff_t to, size_t *retlen)
+{
+	return onenand_writev_ecc(mtd, vecs, count, to, retlen, NULL, NULL);
+}
+
+/**
+ * onenand_erase - [MTD Interface] erase block(s)
+ * @param mtd		MTD device structure
+ * @param instr		erase instruction
+ *
+ * Erase one ore more blocks
+ */
+static int onenand_erase(struct mtd_info *mtd, struct erase_info =
*instr)
+{
+	struct onenand_chip *this =3D mtd->priv;
+	unsigned int block_size;
+	loff_t addr;
+	int len;
+	int ret =3D 0;
+
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_erase: start =3D 0x%08x, len =3D =
%i\n", (unsigned int) instr->addr, (unsigned int) instr->len);
+
+	block_size =3D (1 << this->erase_shift);
+
+	/* Start address must align on block boundary */
+	if (unlikely(instr->addr & (block_size - 1))) {
+		DEBUG(MTD_DEBUG_LEVEL0, "onenand_erase: Unaligned address\n");
+		return -EINVAL;
+	}
+
+	/* Length must align on block boundary */
+	if (unlikely(instr->len & (block_size - 1))) {
+		DEBUG(MTD_DEBUG_LEVEL0, "onenand_erase: Length not block aligned\n");
+		return -EINVAL;
+	}
+
+	/* Do not allow erase past end of device */
+	if (unlikely((instr->len + instr->addr) > mtd->size)) {
+		DEBUG(MTD_DEBUG_LEVEL0, "onenand_erase: Erase past end of device\n");
+		return -EINVAL;
+	}
+
+	instr->fail_addr =3D 0xffffffff;
+
+	/* Grab the lock and see if the device is available */
+	onenand_get_device(mtd, FL_ERASING);
+
+	/* Loop throught the pages */
+	len =3D instr->len;
+	addr =3D instr->addr;
+
+	instr->state =3D MTD_ERASING;
+
+	while (len) {
+
+		/* TODO Check badblock */
+
+		this->command(mtd, ONENAND_CMD_ERASE, addr, block_size);
+
+		ret =3D this->wait(mtd, FL_ERASING);
+		/* Check, if it is write protected */
+		if (ret) {
+			if (ret =3D=3D -EPERM)
+				DEBUG(MTD_DEBUG_LEVEL0, "onenand_erase: Device is write =
protected!!!\n");
+			else
+				DEBUG(MTD_DEBUG_LEVEL0, "onenand_erase: Failed erase, block %d\n", =
(unsigned) (addr >> this->erase_shift));
+			instr->state =3D MTD_ERASE_FAILED;
+			instr->fail_addr =3D addr;
+			goto erase_exit;
+		}
+
+		len -=3D block_size;
+		addr +=3D block_size;
+	}
+
+	instr->state =3D MTD_ERASE_DONE;
+
+erase_exit:
+
+	ret =3D instr->state =3D=3D MTD_ERASE_DONE ? 0 : -EIO;
+	/* Do call back function */
+	if (!ret)
+		mtd_erase_callback(instr);
+
+	/* Deselect and wake up anyone waiting on the device */
+	onenand_release_device(mtd);
+
+	return ret;
+}
+
+/**
+ * onenand_sync - [MTD Interface] sync
+ * @param mtd		MTD device structure
+ *
+ * Sync is actually a wait for chip ready function
+ */
+static void onenand_sync(struct mtd_info *mtd)
+{
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_sync: called\n");
+
+	/* Grab the lock and see if the device is available */
+	onenand_get_device(mtd, FL_SYNCING);
+
+	/* Release it and go back */
+	onenand_release_device(mtd);
+}
+
+/**
+ * onenand_block_isbad - [MTD Interface] Check whether the block at the =
given offset is bad
+ * @param mtd		MTD device structure
+ * @param ofs		offset relative to mtd start
+ */
+static int onenand_block_isbad(struct mtd_info *mtd, loff_t ofs)
+{
+	/*
+	 * TODO=20
+	 * 1. Bad block table (BBT)
+	 *   -> using NAND BBT to support JFFS2
+	 * 2. Bad block management (BBM)
+	 *   -> bad block replace scheme
+	 *
+	 * Currently we do nothing
+	 */
+	return 0;
+}
+
+/**
+ * onenand_block_markbad - [MTD Interface] Mark the block at the given =
offset as bad
+ * @param mtd		MTD device structure
+ * @param ofs		offset relative to mtd start
+ */
+static int onenand_block_markbad(struct mtd_info *mtd, loff_t ofs)
+{
+	/* see above */
+	return 0;
+}
+
+/**
+ * onenand_unlock - [MTD Interface] Unlock block(s)
+ * @param mtd		MTD device structure
+ * @param ofs		offset relative to mtd start
+ * @param len		number of bytes to unlock
+ *
+ * Unlock one or more blocks
+ */
+static int onenand_unlock(struct mtd_info *mtd, loff_t ofs, size_t len)
+{
+	struct onenand_chip *this =3D mtd->priv;
+	int start, end, block, value, status;
+
+	start =3D ofs >> this->erase_shift;
+	end =3D len >> this->erase_shift;
+
+	/* Continuous lock scheme */
+	if (this->options & ONENAND_CONT_LOCK) {
+		/* Set start block address */
+		this->write_word(start, this->base + =
ONENAND_REG_START_BLOCK_ADDRESS);
+		/* Set end block address */
+		this->write_word(end - 1, this->base + =
ONENAND_REG_END_BLOCK_ADDRESS);
+		/* Write unlock command */
+		this->command(mtd, ONENAND_CMD_UNLOCK, 0, 0);
+
+		/* There's no return value */
+		this->wait(mtd, FL_UNLOCKING);
+
+		/* Sanity check */
+		while (this->read_word(this->base + ONENAND_REG_CTRL_STATUS)
+		    & ONENAND_CTRL_ONGO)
+			continue;
+
+		/* Check lock status */
+		status =3D this->read_word(this->base + ONENAND_REG_WP_STATUS);
+		if (!(status & ONENAND_WP_US))
+			printk(KERN_ERR "wp status =3D 0x%x\n", status);
+
+		return 0;
+	}
+
+	/* Block lock scheme */
+	for (block =3D start; block < end; block++) {
+		/* Set start block address */
+		this->write_word(block, this->base + =
ONENAND_REG_START_BLOCK_ADDRESS);
+		/* Write unlock command */
+		this->command(mtd, ONENAND_CMD_UNLOCK, 0, 0);
+
+		/* There's no return value */
+		this->wait(mtd, FL_UNLOCKING);
+
+		/* Sanity check */
+		while (this->read_word(this->base + ONENAND_REG_CTRL_STATUS)
+		    & ONENAND_CTRL_ONGO)
+			continue;
+
+		/* Set block address for read block status */
+		value =3D onenand_block_address(this->device_id, block);
+		this->write_word(value, this->base + ONENAND_REG_START_ADDRESS1);
+
+		/* Check lock status */
+		status =3D this->read_word(this->base + ONENAND_REG_WP_STATUS);
+		if (!(status & ONENAND_WP_US))
+			printk(KERN_ERR "block =3D %d, wp status =3D 0x%x\n", block, =
status);
+	}
+=09
+	return 0;
+}
+
+/**
+ * onenand_print_device_info - Print device ID
+ * @param device        device ID
+ *
+ * Print device ID
+ */
+static void onenand_print_device_info(int device)
+{
+        int vcc, demuxed, ddp, density;
+
+        vcc =3D device & ONENAND_DEVICE_VCC_MASK;
+        demuxed =3D device & ONENAND_DEVICE_IS_DEMUX;
+        ddp =3D device & ONENAND_DEVICE_IS_DDP;
+        density =3D device >> ONENAND_DEVICE_DENSITY_SHIFT;
+        printk(KERN_INFO "%sOneNAND%s %dMB %sV 16-bit (0x%02x)\n",
+                demuxed ? "" : "Muxed ",
+                ddp ? "(DDP)" : "",
+                (16 << density),
+                vcc ? "2.65/3.3" : "1.8",
+                device);
+}
+
+static const struct onenand_manufacturers onenand_manuf_ids[] =3D {
+        {ONENAND_MFR_SAMSUNG, "Samsung"},
+        {ONENAND_MFR_UNKNOWN, "Unknown"}
+};
+
+/**
+ * onenand_check_maf - Check manufacturer ID
+ * @param manuf         manufacturer ID
+ *
+ * Check manufacturer ID
+ */
+static int onenand_check_maf(int manuf)
+{
+        int i;
+
+        for (i =3D 0; onenand_manuf_ids[i].id; i++) {
+                if (manuf =3D=3D onenand_manuf_ids[i].id)
+                        break;
+        }
+
+        printk(KERN_DEBUG "OneNAND Manufacturer: %s\n",
+                onenand_manuf_ids[i].name);
+
+        return (i !=3D ONENAND_MFR_UNKNOWN);
+}
+
+/**
+ * onenand_probe - [OneNAND Interface] Probe the OneNAND device
+ * @param mtd		MTD device structure
+ *
+ * OneNAND detection method:
+ *   Compare the the values from command with ones from register
+ */
+static int onenand_probe(struct mtd_info *mtd)
+{
+	struct onenand_chip *this =3D mtd->priv;
+	int bram_maf_id, bram_dev_id, maf_id, dev_id;
+	int version_id;
+	int density;
+
+	/* Send the command for reading device ID from BootRAM */
+	this->write_word(ONENAND_CMD_READID, this->base + ONENAND_BOOTRAM);
+
+	/* Read manufacturer and device IDs from BootRAM */
+	bram_maf_id =3D this->read_word(this->base + ONENAND_BOOTRAM + 0x0);
+	bram_dev_id =3D this->read_word(this->base + ONENAND_BOOTRAM + 0x2);
+
+	/* Check manufacturer ID */
+	if (onenand_check_maf(bram_maf_id))
+		return -ENXIO;
+
+	/* Reset OneNAND to read default register values */
+	this->write_word(ONENAND_CMD_RESET, this->base + ONENAND_BOOTRAM);
+
+	/* Read manufacturer and device IDs from Register */
+	maf_id =3D this->read_word(this->base + ONENAND_REG_MANUFACTURER_ID);
+	dev_id =3D this->read_word(this->base + ONENAND_REG_DEVICE_ID);
+
+	/* Check OneNAND device */
+	if (maf_id !=3D bram_maf_id || dev_id !=3D bram_dev_id)
+		return -ENXIO;
+
+	/* Flash device information */
+	onenand_print_device_info(dev_id);
+	this->device_id =3D dev_id;
+
+	density =3D dev_id >> ONENAND_DEVICE_DENSITY_SHIFT;
+	this->chipsize =3D (16 << density) << 20;
+
+	/* OneNAND page size & block size */
+	/* The data buffer size is equal to page size */
+	mtd->oobblock =3D this->read_word(this->base + =
ONENAND_REG_DATA_BUFFER_SIZE);
+	mtd->oobsize =3D mtd->oobblock >> 5;
+	/* Pagers per block is always 64 in OneNAND */
+	mtd->erasesize =3D mtd->oobblock << 6;
+
+	this->erase_shift =3D ffs(mtd->erasesize) - 1;
+	this->page_shift =3D ffs(mtd->oobblock) - 1;
+	this->ppb_shift =3D (this->erase_shift - this->page_shift);
+	this->page_mask =3D (mtd->erasesize / mtd->oobblock) - 1;
+
+	/* REVIST: Multichip handling */
+
+	mtd->size =3D this->chipsize;
+
+	/* Version ID */
+	version_id =3D this->read_word(this->base + ONENAND_REG_VERSION_ID);
+	printk(KERN_DEBUG "OneNAND version =3D 0x%04x\n", version_id);
+
+	/* Lock scheme */
+	if (density <=3D ONENAND_DEVICE_DENSITY_512Mb &&
+	    !(version_id >> ONENAND_VERSION_PROCESS_SHIFT)) {
+		printk(KERN_INFO "Lock scheme is Continues Lock\n");
+		this->options |=3D ONENAND_CONT_LOCK;
+	}
+=09
+	return 0;
+}
+
+
+/**
+ * onenand_scan - [OneNAND Interface] Scan for the OneNAND device
+ * @param mtd		MTD device structure
+ * @param maxchips	Number of chips to scan for
+ *
+ * This fills out all the not initialized function pointers
+ * with the defaults.
+ * The flash ID is read and the mtd/chip structures are
+ * filled with the appropriate values.
+ */
+int onenand_scan(struct mtd_info *mtd, int maxchips)
+{
+	struct onenand_chip *this =3D mtd->priv;
+
+	if (!this->read_word)
+		this->read_word =3D onenand_readw;
+	if (!this->write_word)
+		this->write_word =3D onenand_writew;
+
+	if (!this->command)
+		this->command =3D onenand_command;
+	if (!this->wait)
+		this->wait =3D onenand_wait;
+
+	if (!this->read_bufferram)
+		this->read_bufferram =3D onenand_read_bufferram;
+	if (!this->write_bufferram)
+		this->write_bufferram =3D onenand_write_bufferram;
+
+	if (onenand_probe(mtd))
+		return -ENXIO;
+
+	this->state =3D FL_READY;
+	init_waitqueue_head(&this->wq);
+	spin_lock_init(&this->chip_lock);
+
+	switch (mtd->oobsize) {
+	case 64:
+		this->autooob =3D &onenand_oob_64;
+		break;
+
+	case 32:
+		this->autooob =3D &onenand_oob_32;
+		break;
+
+	default:
+		printk(KERN_WARNING "No OOB scheme defined for oobsize %d\n",
+			mtd->oobsize);
+		/* To prevent kernel oops */
+		this->autooob =3D &onenand_oob_32;
+		break;
+	}
+
+	memcpy(&mtd->oobinfo, this->autooob, sizeof(mtd->oobinfo));
+=09
+	/* Fill in remaining MTD driver data */
+	mtd->type =3D MTD_NANDFLASH;
+	mtd->flags =3D MTD_CAP_NANDFLASH | MTD_ECC;
+	mtd->ecctype =3D MTD_ECC_SW;
+	mtd->erase =3D onenand_erase;
+	mtd->point =3D NULL;
+	mtd->unpoint =3D NULL;
+	mtd->read =3D onenand_read;
+	mtd->write =3D onenand_write;
+	mtd->read_ecc =3D onenand_read_ecc;
+	mtd->write_ecc =3D onenand_write_ecc;
+	mtd->read_oob =3D onenand_read_oob;
+	mtd->write_oob =3D onenand_write_oob;
+	mtd->readv =3D NULL;
+	mtd->readv_ecc =3D NULL;
+	mtd->writev =3D onenand_writev;
+	mtd->writev_ecc =3D onenand_writev_ecc;
+	mtd->sync =3D onenand_sync;
+	mtd->lock =3D NULL;
+	mtd->unlock =3D onenand_unlock;
+	mtd->suspend =3D NULL;
+	mtd->resume =3D NULL;
+	mtd->block_isbad =3D onenand_block_isbad;
+	mtd->block_markbad =3D onenand_block_markbad;
+	mtd->owner =3D THIS_MODULE;
+
+	/* Unlock whole block */
+	mtd->unlock(mtd, 0x0, this->chipsize);
+
+	return 0;
+}
+
+/**
+ * onenand_release - [OneNAND Interface] Free resources held by the =
OneNAND device
+ * @param mtd		MTD device structure
+ */
+void onenand_release(struct mtd_info *mtd)
+{
+#ifdef CONFIG_MTD_PARTITIONS
+	/* Deregister partitions */
+	del_mtd_partitions (mtd);
+#endif
+	/* Deregister the device */
+	del_mtd_device (mtd);
+}
+
+EXPORT_SYMBOL(onenand_scan);
+EXPORT_SYMBOL(onenand_release);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Kyungmin Park <kyungmin.park@samsung.com>");
+MODULE_DESCRIPTION("Generic OneNAND flash driver code");
Index: include/linux/mtd/onenand.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- /dev/null  (tree:4b825dc642cb6eb9a060e54bf8d69288fbee4904)
+++ uncommitted/include/linux/mtd/onenand.h  (mode:100644)
@@ -0,0 +1,137 @@
+/*
+ *  linux/include/linux/mtd/onenand.h
+ *
+ *  Copyright (C) 2005 Samsung Electronics
+ *  Kyungmin Park <kyungmin.park@samsung.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __LINUX_MTD_ONENAND_H
+#define __LINUX_MTD_ONENAND_H
+
+#include <linux/config.h>
+#include <linux/kernel.h>
+#include <linux/spinlock.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/onenand_regs.h>
+
+#define MAX_BUFFERRAM		2
+
+/* Scan and identify a OneNAND device */
+extern int onenand_scan(struct mtd_info *mtd, int max_chips);
+/* Free resources held by the OneNAND device */
+extern void onenand_release(struct mtd_info *mtd);
+
+/**
+ * onenand_state_t - chip states
+ * Enumeration for OneNAND flash chip state
+ */
+typedef enum {
+	FL_READY,
+	FL_READING,
+	FL_WRITING,
+	FL_ERASING,
+	FL_SYNCING,
+	FL_UNLOCKING,
+	FL_LOCKING,
+} onenand_state_t;
+
+/**
+ * struct onenand_bufferram - OneNAND BufferRAM Data
+ * @param block		block address in BufferRAM
+ * @param page		page address in BufferRAM
+ * @param valid		valid flag
+ */
+struct onenand_bufferram {
+	int block;
+	int page;
+	int valid;
+};
+
+/**
+ * struct onenand_chip - OneNAND Private Flash Chip Data
+ * @param base		[BOARDSPECIFIC] address to access OneNAND
+ * @param chipsize	[INTERN] the size of one chip for multichip arrays
+ * @param device_id	[INTERN] device ID
+ * @param verstion_id	[INTERN] version ID
+ * @param options	[BOARDSPECIFIC] various chip options. They can partly =
be set to inform onenand_scan about
+ * @param erase_shift	[INTERN] number of address bits in a block
+ * @param page_shift	[INTERN] number of address bits in a page
+ * @param ppb_shift	[INTERN] number of address bits in a pages per =
block
+ * @param page_mask	[INTERN] a page per block mask
+ * @param bufferam_index	[INTERN] BufferRAM index
+ * @param bufferam	[INTERN] BufferRAM info
+ * @param readw		[REPLACEABLE] hardware specific function for read =
short
+ * @param writew	[REPLACEABLE] hardware specific function for write =
short
+ * @param command	[REPLACEABLE] hardware specific function for writing =
commands to the chip
+ * @param wait		[REPLACEABLE] hardware specific function for wait on =
ready
+ * @param read_bufferram	[REPLACEABLE] hardware specific function for =
BufferRAM Area
+ * @param write_bufferram	[REPLACEABLE] hardware specific function for =
BufferRAM Area
+ * @param chip_lock	[INTERN] spinlock used to protect access to this =
structure and the chip
+ * @param wq		[INTERN] wait queue to sleep on if a OneNAND operation is =
in progress
+ * @param state		[INTERN] the current state of the OneNAND device
+ * @param autooob	[REPLACEABLE] the default (auto)placement scheme
+ * @param priv		[OPTIONAL] pointer to private chip date
+ */
+struct onenand_chip {
+	void __iomem		*base;
+	unsigned int		chipsize;
+	unsigned int		device_id;
+	unsigned int		options;
+
+	unsigned int		erase_shift;
+	unsigned int		page_shift;
+	unsigned int		ppb_shift;	/* Pages per block shift */
+	unsigned int		page_mask;
+
+	unsigned int		bufferram_index;
+	struct onenand_bufferram	bufferram[MAX_BUFFERRAM];
+
+	int (*command)(struct mtd_info *mtd, int cmd, loff_t address, size_t =
len);
+	int (*wait)(struct mtd_info *mtd, int state);
+	int (*read_bufferram)(struct mtd_info *mtd, int area,
+			unsigned char *buffer, int offset, size_t count);
+	int (*write_bufferram)(struct mtd_info *mtd, int area,
+			const unsigned char *buffer, int offset, size_t count);
+	unsigned short (*read_word)(void __iomem *addr);
+	void (*write_word)(unsigned short value, void __iomem *addr);
+
+	spinlock_t		chip_lock;
+	wait_queue_head_t	wq;
+	onenand_state_t		state;
+
+	struct nand_oobinfo	*autooob;
+
+	void			*priv;
+};
+
+#define ONENAND_CURRENT_BUFFERRAM(this)		(this->bufferram_index)
+#define ONENAND_NEXT_BUFFERRAM(this)		(this->bufferram_index ^ 1)
+#define ONENAND_SET_NEXT_BUFFERRAM(this)	(this->bufferram_index ^=3D 1)
+
+/*
+ * Options bits
+ */
+#define ONENAND_CONT_LOCK		(0x0001)
+
+
+/*
+ * OneNAND Flash Manufacturer ID Codes
+ */
+#define ONENAND_MFR_SAMSUNG	0xec
+#define ONENAND_MFR_UNKNOWN	0x00
+
+/**
+ * struct nand_manufacturers - NAND Flash Manufacturer ID Structure
+ * @param name:		Manufacturer name
+ * @param id:		manufacturer ID code of device.
+*/
+struct onenand_manufacturers {
+        int id;
+        char *name;
+};
+
+#endif	/* __LINUX_MTD_ONENAND_H */
Index: include/linux/mtd/onenand_regs.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- /dev/null  (tree:4b825dc642cb6eb9a060e54bf8d69288fbee4904)
+++ uncommitted/include/linux/mtd/onenand_regs.h  (mode:100644)
@@ -0,0 +1,167 @@
+/*
+ *  linux/include/linux/mtd/onenand_regs.h
+ *
+ *  OneNAND Register header file
+ *
+ *  Copyright (C) 2005 Samsung Electronics
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __ONENAND_REG_H
+#define __ONENAND_REG_H
+
+/* Memory Address Map Translation (Word order) */
+#define ONENAND_MEMORY_MAP(x)		((x) << 1)
+
+/*
+ * External BufferRAM area
+ */
+#define	ONENAND_BOOTRAM			ONENAND_MEMORY_MAP(0x0000)
+#define	ONENAND_DATARAM			ONENAND_MEMORY_MAP(0x0200)
+#define	ONENAND_SPARERAM		ONENAND_MEMORY_MAP(0x8010)
+
+/*
+ * OneNAND Registers
+ */
+#define ONENAND_REG_MANUFACTURER_ID	ONENAND_MEMORY_MAP(0xF000)
+#define ONENAND_REG_DEVICE_ID		ONENAND_MEMORY_MAP(0xF001)
+#define ONENAND_REG_VERSION_ID		ONENAND_MEMORY_MAP(0xF002)
+#define ONENAND_REG_DATA_BUFFER_SIZE	ONENAND_MEMORY_MAP(0xF003)
+#define ONENAND_REG_BOOT_BUFFER_SIZE	ONENAND_MEMORY_MAP(0xF004)
+#define ONENAND_REG_NUM_BUFFERS		ONENAND_MEMORY_MAP(0xF005)
+#define ONENAND_REG_TECHNOLOGY		ONENAND_MEMORY_MAP(0xF006)
+
+#define ONENAND_REG_START_ADDRESS1	ONENAND_MEMORY_MAP(0xF100)
+#define ONENAND_REG_START_ADDRESS2	ONENAND_MEMORY_MAP(0xF101)
+#define ONENAND_REG_START_ADDRESS3	ONENAND_MEMORY_MAP(0xF102)
+#define ONENAND_REG_START_ADDRESS4	ONENAND_MEMORY_MAP(0xF103)
+#define ONENAND_REG_START_ADDRESS5	ONENAND_MEMORY_MAP(0xF104)
+#define ONENAND_REG_START_ADDRESS6	ONENAND_MEMORY_MAP(0xF105)
+#define ONENAND_REG_START_ADDRESS7	ONENAND_MEMORY_MAP(0xF106)
+#define ONENAND_REG_START_ADDRESS8	ONENAND_MEMORY_MAP(0xF107)
+
+#define ONENAND_REG_START_BUFFER	ONENAND_MEMORY_MAP(0xF200)
+#define ONENAND_REG_COMMAND		ONENAND_MEMORY_MAP(0xF220)
+#define ONENAND_REG_SYS_CFG1		ONENAND_MEMORY_MAP(0xF221)
+#define ONENAND_REG_SYS_CFG2		ONENAND_MEMORY_MAP(0xF222)
+#define ONENAND_REG_CTRL_STATUS		ONENAND_MEMORY_MAP(0xF240)
+#define ONENAND_REG_INTERRUPT		ONENAND_MEMORY_MAP(0xF241)
+#define ONENAND_REG_START_BLOCK_ADDRESS	ONENAND_MEMORY_MAP(0xF24C)
+#define ONENAND_REG_END_BLOCK_ADDRESS	ONENAND_MEMORY_MAP(0xF24D)
+#define ONENAND_REG_WP_STATUS		ONENAND_MEMORY_MAP(0xF24E)
+
+#define ONENAND_REG_ECC_STATUS		ONENAND_MEMORY_MAP(0xFF00)
+#define ONENAND_REG_ECC_M0		ONENAND_MEMORY_MAP(0xFF01)
+#define ONENAND_REG_ECC_S0		ONENAND_MEMORY_MAP(0xFF02)
+#define ONENAND_REG_ECC_M1		ONENAND_MEMORY_MAP(0xFF03)
+#define ONENAND_REG_ECC_S1		ONENAND_MEMORY_MAP(0xFF04)
+#define ONENAND_REG_ECC_M2		ONENAND_MEMORY_MAP(0xFF05)
+#define ONENAND_REG_ECC_S2		ONENAND_MEMORY_MAP(0xFF06)
+#define ONENAND_REG_ECC_M3		ONENAND_MEMORY_MAP(0xFF07)
+#define ONENAND_REG_ECC_S3		ONENAND_MEMORY_MAP(0xFF08)
+
+/*
+ * Device ID Register F001h (R)
+ */
+#define ONENAND_DEVICE_DENSITY_SHIFT	(4)
+#define ONENAND_DEVICE_IS_DDP		(1 << 3)
+#define ONENAND_DEVICE_IS_DEMUX		(1 << 2)
+#define ONENAND_DEVICE_VCC_MASK		(0x3)
+
+#define ONENAND_DEVICE_DENSITY_512Mb	(0x002)
+
+/*
+ * Version ID Register F002h (R)
+ */
+#define ONENAND_VERSION_PROCESS_SHIFT	(8)
+
+/*
+ * Start Address 1 F100h (R/W)
+ */
+#define ONENAND_DDP_SHIFT		(15)
+
+/*
+ * Start Address 8 F107h (R/W)
+ */
+#define ONENAND_FPA_MASK		(0x3f)
+#define ONENAND_FPA_SHIFT		(2)
+#define ONENAND_FSA_MASK		(0x03)
+
+/*
+ * Start Buffer Register F200h (R/W)
+ */
+#define ONENAND_BSA_MASK		(0x03)
+#define ONENAND_BSA_SHIFT		(8)
+#define ONENAND_BSA_BOOTRAM		(0 << 2)
+#define ONENAND_BSA_DATARAM0		(2 << 2)
+#define ONENAND_BSA_DATARAM1		(3 << 2)
+#define ONENAND_BSC_MASK		(0x03)
+
+/*
+ * Command Register F220h (R/W)
+ */
+#define ONENAND_CMD_READ		(0x00)
+#define ONENAND_CMD_READOOB		(0x13)
+#define ONENAND_CMD_PROG		(0x80)
+#define ONENAND_CMD_PROGOOB		(0x1A)
+#define ONENAND_CMD_UNLOCK		(0x23)
+#define ONENAND_CMD_LOCK		(0x2A)
+#define ONENAND_CMD_LOCK_TIGHT		(0x2C)
+#define ONENAND_CMD_ERASE		(0x94)
+#define ONENAND_CMD_RESET		(0xF0)
+#define ONENAND_CMD_READID		(0x90)
+
+/* NOTE: Those are not *REAL* commands */
+#define ONENAND_CMD_BUFFERRAM		(0x1978)
+
+/*
+ * System Configuration 1 Register F221h (R, R/W)
+ */
+#define ONENAND_SYS_CFG1_SYNC_READ	(1 << 15)
+#define ONENAND_SYS_CFG1_BRL		(1 << 12)
+#define ONENAND_SYS_CFG1_BL		(1 << 9)
+#define ONENAND_SYS_CFG1_NO_ECC		(1 << 8)
+#define ONENAND_SYS_CFG1_RDY		(1 << 7)
+#define ONENAND_SYS_CFG1_INT		(1 << 6)
+#define ONENAND_SYS_CFG1_IOBE		(1 << 5)
+#define ONENAND_SYS_CFG1_RDY_CONF	(1 << 4)
+
+/*
+ * Controller Status Register F240h (R)
+ */
+#define ONENAND_CTRL_ONGO		(1 << 15)
+#define ONENAND_CTRL_LOCK		(1 << 14)
+#define ONENAND_CTRL_LOAD		(1 << 13)
+#define ONENAND_CTRL_PROGRAM		(1 << 12)
+#define ONENAND_CTRL_ERASE		(1 << 11)
+#define ONENAND_CTRL_ERROR		(1 << 10)
+#define ONENAND_CTRL_RSTB		(1 << 7)
+
+/*
+ * Interrupt Status Register F241h (R)
+ */
+#define ONENAND_INT_MASTER		(1 << 15)
+#define ONENAND_INT_READ		(1 << 7)
+#define ONENAND_INT_WRITE		(1 << 6)
+#define ONENAND_INT_ERASE		(1 << 5)
+#define ONENAND_INT_RESET		(1 << 4)
+#define ONENAND_INT_CLEAR		(0 << 0)
+
+/*
+ * NAND Flash Write Protection Status Register F24Eh (R)
+ */
+#define ONENAND_WP_US			(1 << 2)
+#define ONENAND_WP_LS			(1 << 1)
+#define ONENAND_WP_LTS			(1 << 0)
+
+/*
+ * ECC Status Reigser FF00h (R)
+ */
+#define ONENAND_ECC_1BIT		(1 << 0)
+#define ONENAND_ECC_2BIT		(1 << 1)
+#define ONENAND_ECC_2BIT_ALL		(0xAAAA)
+
+#endif	/* __ONENAND_REG_H */

--Boundary_(ID_3epKk6sgi8lwrvAZ1NWRJA)--
