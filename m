Received: from mailout2.samsung.com ([203.254.224.25])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1Dr4qP-0007Sa-4x
	for linux-mtd@lists.infradead.org; Fri, 08 Jul 2005 22:13:35 -0400
Received: from ep_mmp2 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0IJC00MDJ8UDK4@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Sat, 09 Jul 2005 11:13:25 +0900 (KST)
Received: from july7 ([168.219.213.193])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 HotFix 1.17 (built
	Jun 23 2003)) with ESMTPA id <0IJC000IU8UBB4@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Sat, 09 Jul 2005 11:13:25 +0900 (KST)
Date: Sat, 09 Jul 2005 11:13:25 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
In-reply-to: <1120471500.18862.65.camel@tglx.tec.linutronix.de>
To: tglx@linutronix.de
Message-id: <0IJC000IV8UBB4@mmp2.samsung.com>
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_Tn3o+r/lI21XqfYO+DPLEw)"
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

--Boundary_(ID_Tn3o+r/lI21XqfYO+DPLEw)
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT


Hi

It's new patch as your request

and I append some bufferram function to reduce unnecessary read access.

It's similay page buf in NAND.

Regards

Kyungmin Park

> 
> Some remarks:
> 
> Kconfig and Makefile need references in drivers/mtd/Kconfig and
> drivers/mtd/Makefile !!!

Yes, I'm missing

>+menu "OneNAND Flash Device Drivers (EXPERIMENTAL)"
>+	depends on MTD != n && EXPERIMENTAL
>+
>+config MTD_ONENAND
>+	tristate "OneNAND Device Support"
>	depends on MTD
>	select MTD_ONENAND_INFO

>Why do you need a seperate config option, which is just a mirror of
MTD_ONENAND ?

I don't understood. What's meaning?

> 
> +
> +        /* try the first address */
> +	omap_onenand_flash_base = 
> ioremap(OMAP_ONENAND_FLASH_START1, SZ_128K);
> 
> Why a seperate static variable ? Please use the base member of the
> private structure.

OK. I done.

> +static int onenand_dataram(struct mtd_info *mtd, int write,
> +		unsigned char *buffer, int offset, int count)
> +{
> +	struct onenand_chip *this = mtd->priv;
> +	void __iomem *src, *dest;
> +	void __iomem *dataram;
> +
> +	dataram = this->base + ONENAND_DATARAM;
> +
> +	if (ONENAND_CURRENT_BUFFERRAM(this))
> +		dataram += mtd->oobblock;
> +
> +	if (write) {
> +		src = buffer;
> +		dest = dataram + offset;
> +	} else {
> +		src = dataram + offset;
> +		dest = buffer;
> +	}
> +
> +	memcpy(dest, src, count);
> 
> 
> Can the read/write functions be seperate please ?
> Only the hardware access should be replaceable by the board driver.
> Calculations which are valid for every implementation should 
> be done in
> generic code. This reduces the code size and the error sources for
> hardware specific implementations

As your request, I create read/write_bufferram function instread of dataram
and spareram
 
> 
> +static int onenand_unlock(struct mtd_info *mtd, loff_t ofs, 
> size_t len)
> <SNIP>
> +		/* There's no return value */
> +		this->wait(mtd, FL_UNLOCKING);
> 
> Why not ?

There's no status check in locking mechanism

> 
> +		/* Sanity check */
> +		while (onenand_readw(this->base + 
> ONENAND_REG_CTRL_STATUS)
> +		    & ONENAND_CTRL_ONGO)
> +			continue;
> 
> What happens if the condition is not met ?

I think it's board bug. For safety I check it. 

> 
> +/**
> + * onenand_scan - [OneNAND Interface] Probe the OneNAND device
> + * @param mtd		MTD device structure
> + *
> + * OneNAND detection method:
> + *   Compare the the values from command with ones from register
> + */
> +static int onenand_probe(struct mtd_info *mtd)
> 
> Please make comment and function name consistent.

OK. fix it

> +/*
> + *  linux/drivers/mtd/onenand/onenand_info.c
> 
> <SNIP>
> 
> +EXPORT_SYMBOL_GPL(onenand_print_device_info);
> +EXPORT_SYMBOL_GPL(onenand_print_maf_info);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Kyungmin Park <kyungmin.park@samsung.com>");
> +MODULE_DESCRIPTION("Display OneNAND device and manufacturer ID's");
> 
> 
> Please link this with onenand_base.c. It's overkill to have those
> exports and a seperate module. The seperate nand_ids file in
> drivers/mtd/nand is solely there to make it reusable by the legacy
> DiskOnChip drivers. Once those are gone the id table will be linked to
> nand_base.c unconditionally.

I merged it 

> 
> 
> +	FL_ERASING,
> +	FL_SYNCING,
> +	FL_UNLOCKING,
> +} onenand_state_t;
> 
> Shouldnt there be a LOCK counterpart to UNLOCK ?

OK.

> 
> 
> +/*
> + * Functions to access the OneNAND IO region
> + */
> +#define onenand_readw(a)		readw(a)
> +#define onenand_writew(v,a)		writew(v, a)
> 
> Please make onenand_readw/writew functions accessible by function
> pointers along with default implementations, so the board driver can
> override them if necessary.
> 

It's just memory access function. I think no need to make a function.


--Boundary_(ID_Tn3o+r/lI21XqfYO+DPLEw)
Content-type: application/octet-stream; name=onenand-mtd.patch
Content-transfer-encoding: quoted-printable
Content-disposition: attachment; filename=onenand-mtd.patch

Index: drivers/mtd/Kconfig=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
--- 0da3933055729e361b7b9ffd523f17ac65ca1489/drivers/mtd/Kconfig  =
(mode:100644)=0A=
+++ uncommitted/drivers/mtd/Kconfig  (mode:100644)=0A=
@@ -261,5 +261,7 @@=0A=
=0A=
 source "drivers/mtd/nand/Kconfig"=0A=
=0A=
+source "drivers/mtd/onenand/Kconfig"=0A=
+=0A=
 endmenu=0A=
=0A=
Index: drivers/mtd/Makefile=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
--- 0da3933055729e361b7b9ffd523f17ac65ca1489/drivers/mtd/Makefile  =
(mode:100644)=0A=
+++ uncommitted/drivers/mtd/Makefile  (mode:100644)=0A=
@@ -24,4 +24,4 @@=0A=
 nftl-objs              :=3D nftlcore.o nftlmount.o=0A=
 inftl-objs             :=3D inftlcore.o inftlmount.o=0A=
=0A=
-obj-y          +=3D chips/ maps/ devices/ nand/=0A=
+obj-y          +=3D chips/ maps/ devices/ nand/ onenand/=0A=
Index: drivers/mtd/onenand/Kconfig=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
--- /dev/null  (tree:4b825dc642cb6eb9a060e54bf8d69288fbee4904)=0A=
+++ uncommitted/drivers/mtd/onenand/Kconfig  (mode:100644)=0A=
@@ -0,0 +1,32 @@=0A=
+#=0A=
+# linux/drivers/mtd/onenand/Kconfig=0A=
+#=0A=
+=0A=
+menu "OneNAND Flash Device Drivers (EXPERIMENTAL)"=0A=
+	depends on MTD !=3D n && EXPERIMENTAL=0A=
+=0A=
+config MTD_ONENAND=0A=
+	tristate "OneNAND Device Support"=0A=
+	depends on MTD=0A=
+	help=0A=
+	  This enables support for accessing all type of OneNAND flash=0A=
+	  devices. For further information see=0A=
+	  =
<http://www.samsung.com/Products/Semiconductor/Flash/OneNAND_TM/index.htm=
>.=0A=
+=0A=
+config MTD_ONENAND_VERIFY_WRITE=0A=
+	bool "Verify OneNAND page writes"=0A=
+	depends on MTD_ONENAND=0A=
+	help=0A=
+	  This adds an extra check when data is written to the flash. The=0A=
+	  OneNAND flash device internally checks only bits transitioning=0A=
+	  from 1 to 0. There is a rare possibility that even though the=0A=
+	  device thinks the write was successful, a bit could have been=0A=
+	  flipped accidentaly due to device wear or something else.=0A=
+=0A=
+config MTD_ONENAND_OMAP=0A=
+	tristate "OneNAND Flash device on OMAP board"=0A=
+	depends on ARM && ARCH_OMAP && MTD_ONENAND=0A=
+	help=0A=
+	  Support for OneNAND flash on TI OMAP board.=0A=
+=0A=
+endmenu=0A=
Index: drivers/mtd/onenand/Makefile=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
--- /dev/null  (tree:4b825dc642cb6eb9a060e54bf8d69288fbee4904)=0A=
+++ uncommitted/drivers/mtd/onenand/Makefile  (mode:100644)=0A=
@@ -0,0 +1,9 @@=0A=
+#=0A=
+# Makefile for the OneNAND MTD=0A=
+#=0A=
+=0A=
+# Core functionality.=0A=
+obj-$(CONFIG_MTD_ONENAND)		+=3D onenand_base.o=0A=
+=0A=
+# Board specific.=0A=
+obj-$(CONFIG_MTD_ONENAND_OMAP)		+=3D omap-onenand.o=0A=
Index: drivers/mtd/onenand/omap-onenand.c=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
--- /dev/null  (tree:4b825dc642cb6eb9a060e54bf8d69288fbee4904)=0A=
+++ uncommitted/drivers/mtd/onenand/omap-onenand.c  (mode:100644)=0A=
@@ -0,0 +1,179 @@=0A=
+/*=0A=
+ *  linux/drivers/mtd/onenand/omap-onenand.c=0A=
+ *=0A=
+ *  Copyright (c) 2005 Samsung Electronics=0A=
+ *  Kyungmin Park <kyungmin.park@samsung.com>=0A=
+ *=0A=
+ *  Derived from linux/drivers/mtd/nand/omap-nand-flash.c=0A=
+ *=0A=
+ * This program is free software; you can redistribute it and/or modify=0A=
+ * it under the terms of the GNU General Public License version 2 as=0A=
+ * published by the Free Software Foundation.=0A=
+ *=0A=
+ *  Overview:=0A=
+ *   This is a device driver for the OneNAND flash device for TI OMAP =
boards.=0A=
+ */=0A=
+=0A=
+#include <linux/slab.h>=0A=
+#include <linux/init.h>=0A=
+#include <linux/module.h>=0A=
+=0A=
+#include <linux/mtd/mtd.h>=0A=
+#include <linux/mtd/onenand.h>=0A=
+#include <linux/mtd/partitions.h>=0A=
+=0A=
+#include <asm/io.h>=0A=
+#include <asm/arch/hardware.h>=0A=
+#include <asm/arch/tc.h>=0A=
+#include <asm/sizes.h>=0A=
+=0A=
+#define OMAP_ONENAND_FLASH_START1	OMAP_CS2A_PHYS=0A=
+#define OMAP_ONENAND_FLASH_START2	OMAP_CS0_PHYS=0A=
+/*=0A=
+ * MTD structure for OMAP board=0A=
+ */=0A=
+static struct mtd_info *omap_onenand_mtd =3D NULL;=0A=
+=0A=
+/*=0A=
+ * Define partitions for flash devices=0A=
+ */=0A=
+=0A=
+#ifdef CONFIG_MTD_PARTITIONS=0A=
+static struct mtd_partition static_partition[] =3D {=0A=
+	{=0A=
+		.name		=3D "X-Loader + U-Boot",=0A=
+		.offset		=3D 0,=0A=
+		.size		=3D SZ_128K,=0A=
+		.mask_flags	=3D MTD_WRITEABLE	/* force read-only */=0A=
+ 	},=0A=
+	{=0A=
+		.name		=3D "U-Boot Environment",=0A=
+		.offset		=3D MTDPART_OFS_APPEND,=0A=
+		.size		=3D SZ_128K,=0A=
+		.mask_flags	=3D MTD_WRITEABLE	/* force read-only */=0A=
+ 	},=0A=
+	{=0A=
+		.name		=3D "kernel",=0A=
+		.offset		=3D MTDPART_OFS_APPEND,=0A=
+		.size		=3D 2 * SZ_1M=0A=
+	},=0A=
+	{=0A=
+		.name		=3D "filesystem0",=0A=
+		.offset		=3D MTDPART_OFS_APPEND,=0A=
+		.size		=3D SZ_16M,=0A=
+	},=0A=
+	{=0A=
+		.name		=3D "filesystem1",=0A=
+		.offset		=3D MTDPART_OFS_APPEND,=0A=
+		.size		=3D MTDPART_SIZ_FULL,=0A=
+	},=0A=
+};=0A=
+=0A=
+const char *part_probes[] =3D { "cmdlinepart", NULL,  };=0A=
+=0A=
+#endif=0A=
+=0A=
+/* Scan to find existance of the device at base.=0A=
+   This also allocates oob and data internal buffers */=0A=
+static char onenand_name[] =3D "onenand";=0A=
+=0A=
+/*=0A=
+ * Main initialization routine=0A=
+ */=0A=
+static int __init omap_onenand_init (void)=0A=
+{=0A=
+	struct onenand_chip *this;=0A=
+	struct mtd_partition *dynamic_partition =3D 0;=0A=
+	int err =3D 0;=0A=
+=0A=
+	/* Allocate memory for MTD device structure and private data */=0A=
+	omap_onenand_mtd =3D kmalloc (sizeof(struct mtd_info) + sizeof (struct =
onenand_chip),=0A=
+				GFP_KERNEL);=0A=
+	if (!omap_onenand_mtd) {=0A=
+		printk (KERN_WARNING "Unable to allocate OneNAND MTD device =
structure.\n");=0A=
+		err =3D -ENOMEM;=0A=
+		goto out;=0A=
+	}=0A=
+=0A=
+	/* Get pointer to private data */=0A=
+	this =3D (struct onenand_chip *) (&omap_onenand_mtd[1]);=0A=
+=0A=
+	/* Initialize structures */=0A=
+	memset((char *) omap_onenand_mtd, 0, sizeof(struct mtd_info) + =
sizeof(struct onenand_chip));=0A=
+=0A=
+	/* Link the private data with the MTD structure */=0A=
+	omap_onenand_mtd->priv =3D this;=0A=
+=0A=
+        /* try the first address */=0A=
+	this->base =3D ioremap(OMAP_ONENAND_FLASH_START1, SZ_128K);=0A=
+	omap_onenand_mtd->name =3D onenand_name;=0A=
+	if (onenand_scan(omap_onenand_mtd, 1)){=0A=
+		/* try the second address */=0A=
+		iounmap(this->base);=0A=
+		this->base =3D ioremap(OMAP_ONENAND_FLASH_START2, SZ_128K);=0A=
+		if (onenand_scan(omap_onenand_mtd, 1)) {=0A=
+			iounmap(this->base);=0A=
+                        err =3D -ENXIO;=0A=
+                        goto out_mtd;=0A=
+		}=0A=
+	}=0A=
+=0A=
+	/* Register the partitions */=0A=
+	switch (omap_onenand_mtd->size) {=0A=
+	case SZ_128M:=0A=
+	case SZ_64M:=0A=
+	case SZ_32M:=0A=
+#ifdef CONFIG_MTD_PARTITIONS=0A=
+		err =3D parse_mtd_partitions(omap_onenand_mtd, part_probes,=0A=
+					&dynamic_partition, 0);=0A=
+		if (err > 0)=0A=
+			err =3D add_mtd_partitions(omap_onenand_mtd,=0A=
+					dynamic_partition, err);=0A=
+		else if (1)=0A=
+			err =3D add_mtd_partitions(omap_onenand_mtd,=0A=
+					static_partition,=0A=
+					ARRAY_SIZE(static_partition));=0A=
+		else=0A=
+#endif=0A=
+			err =3D add_mtd_device(omap_onenand_mtd);=0A=
+		if (err)=0A=
+			goto out_buf;=0A=
+		break;=0A=
+=0A=
+	default:=0A=
+		printk(KERN_WARNING "Unsupported OneNAND device\n");=0A=
+		err =3D -ENXIO;=0A=
+		goto out_buf;=0A=
+	}=0A=
+=0A=
+	goto out;=0A=
+=0A=
+out_buf:=0A=
+	onenand_release(omap_onenand_mtd);=0A=
+	iounmap(this->base);=0A=
+out_mtd:=0A=
+	kfree(omap_onenand_mtd);=0A=
+out:=0A=
+	return err;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Clean up routine=0A=
+ */=0A=
+static void __exit omap_onenand_cleanup (void)=0A=
+{=0A=
+	struct onenand_chip *this =3D omap_onenand_mtd->priv;=0A=
+=0A=
+	/* onenand_release frees MTD partitions, MTD structure=0A=
+	   and onenand internal buffers */=0A=
+	onenand_release(omap_onenand_mtd);=0A=
+	iounmap(this->base);=0A=
+	kfree(omap_onenand_mtd);=0A=
+}=0A=
+=0A=
+module_init(omap_onenand_init);=0A=
+module_exit(omap_onenand_cleanup);=0A=
+=0A=
+MODULE_LICENSE("GPL");=0A=
+MODULE_AUTHOR("Kyungmin Park <kyungmin.park@samsung.com>");=0A=
+MODULE_DESCRIPTION("Glue layer for OneNAND flash on OMAP boards");=0A=
Index: drivers/mtd/onenand/onenand_base.c=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
--- /dev/null  (tree:4b825dc642cb6eb9a060e54bf8d69288fbee4904)=0A=
+++ uncommitted/drivers/mtd/onenand/onenand_base.c  (mode:100644)=0A=
@@ -0,0 +1,1433 @@=0A=
+/*=0A=
+ *  linux/drivers/mtd/onenand/onenand_base.c=0A=
+ *=0A=
+ *  Copyright (C) 2005 Samsung Electronics=0A=
+ *  Kyungmin Park <kyungmin.park@samsung.com>=0A=
+ *=0A=
+ * This program is free software; you can redistribute it and/or modify=0A=
+ * it under the terms of the GNU General Public License version 2 as=0A=
+ * published by the Free Software Foundation.=0A=
+ */=0A=
+=0A=
+#include <linux/config.h>=0A=
+#include <linux/kernel.h>=0A=
+#include <linux/module.h>=0A=
+#include <linux/init.h>=0A=
+=0A=
+#include <linux/mtd/mtd.h>=0A=
+#include <linux/mtd/partitions.h>=0A=
+#include <linux/mtd/onenand.h>=0A=
+=0A=
+#include <asm/io.h>=0A=
+=0A=
+/**=0A=
+ * onenand_oob_64 - oob info for large (2KB) page=0A=
+ */=0A=
+static struct nand_oobinfo onenand_oob_64 =3D {=0A=
+	.useecc		=3D MTD_NANDECC_AUTOPLACE,=0A=
+	.eccbytes	=3D 20,=0A=
+	.eccpos		=3D {=0A=
+		8, 9, 10, 11, 12,=0A=
+		24, 25, 26, 27, 28,=0A=
+		40, 41, 42, 43, 44,=0A=
+		56, 57, 58, 59, 60,=0A=
+		},=0A=
+	.oobfree	=3D {=0A=
+		{2, 3}, {14, 2}, {18, 3}, {30, 2},=0A=
+		{24, 3}, {46, 2}, {40, 3}, {62, 2} }=0A=
+};=0A=
+=0A=
+/**=0A=
+ * onenand_oob_32 - oob info for middle (1KB) page=0A=
+ */=0A=
+static struct nand_oobinfo onenand_oob_32 =3D {=0A=
+	.useecc		=3D MTD_NANDECC_AUTOPLACE,=0A=
+	.eccbytes	=3D 10,=0A=
+	.eccpos		=3D {=0A=
+		8, 9, 10, 11, 12,=0A=
+		24, 25, 26, 27, 28,=0A=
+		},=0A=
+	.oobfree	=3D { {2, 3}, {14, 2}, {18, 3}, {30, 2} }=0A=
+};=0A=
+=0A=
+static const unsigned char ffchars[] =3D {=0A=
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,=0A=
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,	/* 16 */=0A=
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,=0A=
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,	/* 32 */=0A=
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,=0A=
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,	/* 48 */=0A=
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,=0A=
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,	/* 64 */=0A=
+};=0A=
+=0A=
+/**=0A=
+ * onenand_block_address - [DEFAULT] Get block address=0A=
+ * @param device	the device id=0A=
+ * @param block		the block=0A=
+ * @return		translated block address if DDP, otherwise same=0A=
+ *=0A=
+ * Setup Start Address 1 Register (F100h)=0A=
+ */=0A=
+static int onenand_block_address(int device, int block)=0A=
+{=0A=
+	if (device & ONENAND_DEVICE_IS_DDP) {=0A=
+		/* Device Flash Core select, NAND Flash Block Address */=0A=
+		int dfs =3D 0, density, mask;=0A=
+=0A=
+		density =3D device >> ONENAND_DEVICE_DENSITY_SHIFT;=0A=
+		mask =3D (1 << (density + 6));=0A=
+=0A=
+		if (block & mask)=0A=
+			dfs =3D 1;=0A=
+=0A=
+		return (dfs << ONENAND_DDP_SHIFT) | (block & (mask - 1));=0A=
+	}=0A=
+=0A=
+	return block;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_bufferram_address - [DEFAULT] Get bufferram address=0A=
+ * @param device	the device id=0A=
+ * @param block		the block=0A=
+ * @return		set DBS value if DDP, otherwise 0=0A=
+ *=0A=
+ * Setup Start Address 2 Register (F101h) for DDP=0A=
+ */=0A=
+static int onenand_bufferram_address(int device, int block)=0A=
+{=0A=
+	if (device & ONENAND_DEVICE_IS_DDP) {=0A=
+		/* Device BufferRAM Select */=0A=
+		int dbs =3D 0, density, mask;=0A=
+=0A=
+		density =3D device >> ONENAND_DEVICE_DENSITY_SHIFT;=0A=
+		mask =3D (1 << (density + 6));=0A=
+=0A=
+		if (block & mask)=0A=
+			dbs =3D 1;=0A=
+=0A=
+		return (dbs << ONENAND_DDP_SHIFT);=0A=
+	}=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_page_address - [DEFAULT] Get page address=0A=
+ * @param page		the page address=0A=
+ * @param sector	the sector address=0A=
+ * @return		combined page and sector address=0A=
+ *=0A=
+ * Setup Start Address 8 Register (F107h)=0A=
+ */=0A=
+static int onenand_page_address(int page, int sector)=0A=
+{=0A=
+	/* Flash Page Address, Flash Sector Address */=0A=
+	int fpa, fsa;=0A=
+=0A=
+	fpa =3D page & ONENAND_FPA_MASK;=0A=
+	fsa =3D sector & ONENAND_FSA_MASK;=0A=
+=0A=
+	return ((fpa << ONENAND_FPA_SHIFT) | fsa);=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_buffer_address - [DEFAULT] Get buffer address=0A=
+ * @param dataram1	DataRAM index=0A=
+ * @param sectors	the sector address=0A=
+ * @param count		the number of sectors=0A=
+ * @return		the start buffer value=0A=
+ *=0A=
+ * Setup Start Buffer Register (F200h)=0A=
+ */=0A=
+static int onenand_buffer_address(int dataram1, int sectors, int count)=0A=
+{=0A=
+	int bsa, bsc;=0A=
+=0A=
+	/* BufferRAM Sector Address */=0A=
+	bsa =3D sectors & ONENAND_BSA_MASK;=0A=
+=0A=
+	if (dataram1)=0A=
+		bsa |=3D ONENAND_BSA_DATARAM1;	/* DataRAM1 */=0A=
+	else=0A=
+		bsa |=3D ONENAND_BSA_DATARAM0;	/* DataRAM0 */=0A=
+=0A=
+	/* BufferRAM Sector Count */=0A=
+	bsc =3D count & ONENAND_BSC_MASK;=0A=
+=0A=
+	return ((bsa << ONENAND_BSA_SHIFT) | bsc);=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_command - [DEFAULT] Send command to OneNAND device=0A=
+ * @param mtd		MTD device structure=0A=
+ * @param cmd		the command to be sent=0A=
+ * @param addr		offset to read from or write to=0A=
+ * @param len		number of bytes to read or write=0A=
+ *=0A=
+ * Send command to OneNAND device. This function is used for =
middle/large page=0A=
+ * devices (1KB/2KB Bytes per page)=0A=
+ */=0A=
+static int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr, =
size_t len)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	int value, readcmd =3D 0;=0A=
+	int block, page;=0A=
+	/* Now we use page size operation */=0A=
+	int sectors =3D 4, count =3D 4;=0A=
+=0A=
+	/* Address translation */=0A=
+	switch (cmd) {=0A=
+	case ONENAND_CMD_UNLOCK:=0A=
+	case ONENAND_CMD_LOCK:=0A=
+	case ONENAND_CMD_LOCK_TIGHT:=0A=
+		block =3D -1;=0A=
+		page =3D -1;=0A=
+		break;=0A=
+=0A=
+	case ONENAND_CMD_ERASE:=0A=
+	case ONENAND_CMD_BUFFERRAM:=0A=
+		block =3D (int) (addr >> this->erase_shift);=0A=
+		page =3D -1;=0A=
+		break;=0A=
+=0A=
+	default:=0A=
+		block =3D (int) (addr >> this->erase_shift);=0A=
+		page =3D (int) (addr >> this->page_shift);=0A=
+		page &=3D this->page_mask;=0A=
+		break;=0A=
+	}=0A=
+=0A=
+	/* NOTE: The setting order of the registers is very important! */=0A=
+	if (cmd =3D=3D ONENAND_CMD_BUFFERRAM) {=0A=
+		/* Select DataRAM for DDP */=0A=
+		value =3D onenand_bufferram_address(this->device_id, block);=0A=
+		onenand_writew(value, this->base + ONENAND_REG_START_ADDRESS2);=0A=
+=0A=
+		/* Switch to the next data buffer */=0A=
+		ONENAND_SET_NEXT_BUFFERRAM(this);=0A=
+=0A=
+		return 0;=0A=
+	}=0A=
+=0A=
+	if (block !=3D -1) {=0A=
+		/* Write 'DFS, FBA' of Flash */=0A=
+		value =3D onenand_block_address(this->device_id, block);=0A=
+		onenand_writew(value, this->base + ONENAND_REG_START_ADDRESS1);=0A=
+	}=0A=
+=0A=
+	if (page !=3D -1) {=0A=
+		int dataram;=0A=
+=0A=
+		switch (cmd) {=0A=
+		case ONENAND_CMD_READ:=0A=
+		case ONENAND_CMD_READOOB:=0A=
+			dataram =3D ONENAND_SET_NEXT_BUFFERRAM(this);=0A=
+			readcmd =3D 1;=0A=
+			break;=0A=
+=0A=
+		default:=0A=
+			dataram =3D ONENAND_CURRENT_BUFFERRAM(this);=0A=
+			break;=0A=
+		}=0A=
+=0A=
+		/* Write 'FPA, FSA' of Flash */=0A=
+		value =3D onenand_page_address(page, sectors);=0A=
+		onenand_writew(value, this->base + ONENAND_REG_START_ADDRESS8);=0A=
+=0A=
+		/* Write 'BSA, BSC' of DataRAM */=0A=
+		value =3D onenand_buffer_address(dataram, sectors, count);=0A=
+		onenand_writew(value, this->base + ONENAND_REG_START_BUFFER);=0A=
+			=0A=
+		if (readcmd) {=0A=
+			/* Select DataRAM for DDP */=0A=
+			value =3D onenand_bufferram_address(this->device_id, block);=0A=
+			onenand_writew(value, this->base + ONENAND_REG_START_ADDRESS2);=0A=
+		}=0A=
+	}=0A=
+=0A=
+	/* Interrupt clear */=0A=
+	onenand_writew(ONENAND_INT_CLEAR, this->base + ONENAND_REG_INTERRUPT);=0A=
+=0A=
+	/* Write command */=0A=
+	onenand_writew(cmd, this->base + ONENAND_REG_COMMAND);=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_wait - [DEFAULT] wait until the command is done=0A=
+ * @param mtd		MTD device structure=0A=
+ * @param state		state to select the max. timeout value=0A=
+ *=0A=
+ * Wait for command done. This applies to all OneNAND command=0A=
+ * Read can take up to 30us, erase up to 2ms and program up to 350us=0A=
+ * according to general OneNAND specs=0A=
+ */=0A=
+static int onenand_wait(struct mtd_info *mtd, int state)=0A=
+{=0A=
+	struct onenand_chip * this =3D mtd->priv;=0A=
+	unsigned long timeout;=0A=
+	unsigned int flags =3D ONENAND_INT_MASTER;=0A=
+	unsigned int interrupt =3D 0;=0A=
+	unsigned int ctrl, ecc;=0A=
+=0A=
+	/* The 10 msec is enough */=0A=
+	timeout =3D jiffies + msecs_to_jiffies(10);=0A=
+	while (time_before(jiffies, timeout)) {=0A=
+		interrupt =3D onenand_readw(this->base + ONENAND_REG_INTERRUPT);=0A=
+=0A=
+		if (interrupt & flags)=0A=
+			break;=0A=
+=0A=
+		if (state !=3D FL_READING)=0A=
+			cond_resched();=0A=
+	}=0A=
+	/* To get correct interrupt status in timeout case */=0A=
+	interrupt =3D onenand_readw(this->base + ONENAND_REG_INTERRUPT);=0A=
+=0A=
+	ctrl =3D onenand_readw(this->base + ONENAND_REG_CTRL_STATUS);=0A=
+=0A=
+	if (ctrl & ONENAND_CTRL_ERROR) {=0A=
+		DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: controller error =3D 0x%04x", =
ctrl);=0A=
+		return -EIO;=0A=
+	}=0A=
+=0A=
+	if (ctrl & ONENAND_CTRL_LOCK) {=0A=
+		DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: it's locked error =3D 0x%04x", =
ctrl);=0A=
+		return -EIO;=0A=
+	}=0A=
+=0A=
+	if (interrupt & ONENAND_INT_READ) {=0A=
+		ecc =3D onenand_readw(this->base + ONENAND_REG_ECC_STATUS);=0A=
+		if (ecc & ONENAND_ECC_2BIT_ALL) {=0A=
+			DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: ECC error =3D 0x%04x", ecc);=0A=
+			return -EBADMSG;=0A=
+		}=0A=
+	}=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_read_bufferram - [OneNAND Interface] Read the bufferram area=0A=
+ * @param mtd		MTD data structure=0A=
+ * @param area		BufferRAM area=0A=
+ * @param buffer	the databuffer to put/get data=0A=
+ * @param offset	offset to read from or write to=0A=
+ * @param count		number of bytes to read/write=0A=
+ *=0A=
+ * Read the BufferRAM area=0A=
+ */=0A=
+static int onenand_read_bufferram(struct mtd_info *mtd, int area,=0A=
+		unsigned char *buffer, int offset, size_t count)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	void __iomem *bufferram;=0A=
+=0A=
+	if (area =3D=3D DATARAM)=0A=
+		bufferram =3D this->base + ONENAND_DATARAM;=0A=
+	else if (area =3D=3D SPARERAM)=0A=
+		bufferram =3D this->base + ONENAND_SPARERAM;=0A=
+	else  =0A=
+		bufferram =3D this->base + ONENAND_BOOTRAM;=0A=
+=0A=
+	if (ONENAND_CURRENT_BUFFERRAM(this)) {=0A=
+		if (area =3D=3D DATARAM)=0A=
+			bufferram +=3D mtd->oobblock;=0A=
+		else if (area =3D=3D SPARERAM)=0A=
+			bufferram +=3D mtd->oobsize;=0A=
+	}=0A=
+=0A=
+	memcpy(buffer, bufferram + offset, count);=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_write_bufferram - [OneNAND Interface] Write the bufferram =
area=0A=
+ * @param mtd		MTD data structure=0A=
+ * @param area		BufferRAM area=0A=
+ * @param buffer	the databuffer to put/get data=0A=
+ * @param offset	offset to read from or write to=0A=
+ * @param count		number of bytes to read/write=0A=
+ *=0A=
+ * Write the BufferRAM area=0A=
+ */=0A=
+static int onenand_write_bufferram(struct mtd_info *mtd, int area,=0A=
+		const unsigned char *buffer, int offset, size_t count)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	void __iomem *bufferram;=0A=
+=0A=
+	if (area =3D=3D DATARAM)=0A=
+		bufferram =3D this->base + ONENAND_DATARAM;=0A=
+	else if (area =3D=3D SPARERAM)=0A=
+		bufferram =3D this->base + ONENAND_SPARERAM;=0A=
+	else  =0A=
+		bufferram =3D this->base + ONENAND_BOOTRAM;=0A=
+=0A=
+	if (ONENAND_CURRENT_BUFFERRAM(this)) {=0A=
+		if (area =3D=3D DATARAM)=0A=
+			bufferram +=3D mtd->oobblock;=0A=
+		else if (area =3D=3D SPARERAM)=0A=
+			bufferram +=3D mtd->oobsize;=0A=
+	}=0A=
+=0A=
+	memcpy(bufferram + offset, buffer, count);=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_check_bufferram - [GENERIC] Check BufferRAM information=0A=
+ * @param mtd		MTD data structure=0A=
+ * @param addr		address to check=0A=
+ * @return		1 if there are valid data, otherwise 0 =0A=
+ *=0A=
+ * Check bufferram if there is data we required=0A=
+ */=0A=
+static int onenand_check_bufferram(struct mtd_info *mtd, loff_t addr)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	int block, page;=0A=
+	int i;=0A=
+	=0A=
+	block =3D (int) (addr >> this->erase_shift);=0A=
+	page =3D (int) (addr >> this->page_shift);=0A=
+	page &=3D this->page_mask;=0A=
+=0A=
+	i =3D ONENAND_CURRENT_BUFFERRAM(this);=0A=
+=0A=
+	/* Is there valid data? */=0A=
+	if (this->bufferram[i].block =3D=3D block &&=0A=
+	    this->bufferram[i].page =3D=3D page &&=0A=
+	    this->bufferram[i].valid)=0A=
+		return 1;=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_update_bufferram - [GENERIC] Update BufferRAM information=0A=
+ * @param mtd		MTD data structure=0A=
+ * @param addr		address to update=0A=
+ * @param valid		valid flag=0A=
+ *=0A=
+ * Update BufferRAM information=0A=
+ */=0A=
+static int onenand_update_bufferram(struct mtd_info *mtd, loff_t addr,=0A=
+		int valid)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	int block, page;=0A=
+	int i;=0A=
+	=0A=
+	block =3D (int) (addr >> this->erase_shift);=0A=
+	page =3D (int) (addr >> this->page_shift);=0A=
+	page &=3D this->page_mask;=0A=
+=0A=
+	/* Invalidate BufferRAM */=0A=
+	for (i =3D 0; i < MAX_BUFFERRAM; i++) {=0A=
+		if (this->bufferram[i].block =3D=3D block &&=0A=
+		    this->bufferram[i].page =3D=3D page)=0A=
+			this->bufferram[i].valid =3D 0;=0A=
+	}=0A=
+=0A=
+	/* Update BufferRAM */=0A=
+	i =3D ONENAND_CURRENT_BUFFERRAM(this);=0A=
+	this->bufferram[i].block =3D block;=0A=
+	this->bufferram[i].page =3D page;=0A=
+	this->bufferram[i].valid =3D valid;=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_get_device - [GENERIC] Get chip for selected access=0A=
+ * @param mtd		MTD device structure=0A=
+ * @param new_state	the state which is requested=0A=
+ *=0A=
+ * Get the device and lock it for exclusive access=0A=
+ */=0A=
+static void onenand_get_device(struct mtd_info *mtd, int new_state)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	DECLARE_WAITQUEUE(wait, current);=0A=
+=0A=
+	/*=0A=
+	 * Grab the lock and see if the device is available=0A=
+	 */=0A=
+	while (1) {=0A=
+		spin_lock(&this->chip_lock);=0A=
+		if (this->state =3D=3D FL_READY) {=0A=
+			this->state =3D new_state;=0A=
+			spin_unlock(&this->chip_lock);=0A=
+			break;=0A=
+		}=0A=
+		set_current_state(TASK_UNINTERRUPTIBLE);=0A=
+		add_wait_queue(&this->wq, &wait);=0A=
+		spin_unlock(&this->chip_lock);=0A=
+		schedule();=0A=
+		remove_wait_queue(&this->wq, &wait);=0A=
+	}=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_release_device - [GENERIC] release chip=0A=
+ * @param mtd		MTD device structure=0A=
+ *=0A=
+ * Deselect, release chip lock and wake up anyone waiting on the device=0A=
+ */=0A=
+static void onenand_release_device(struct mtd_info *mtd)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+=0A=
+	/* Release the chip */=0A=
+	spin_lock(&this->chip_lock);=0A=
+	this->state =3D FL_READY;=0A=
+	wake_up(&this->wq);=0A=
+	spin_unlock(&this->chip_lock);=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_read_ecc - [MTD Interface] Read data with ECC=0A=
+ * @param mtd		MTD device structure=0A=
+ * @param from		offset to read from=0A=
+ * @param len		number of bytes to read=0A=
+ * @param retlen	pointer to variable to store the number of read bytes=0A=
+ * @param buf		the databuffer to put data=0A=
+ * @param oob_buf	filesystem supplied oob data buffer=0A=
+ * @param oobsel	oob selection structure=0A=
+ *=0A=
+ * OneNAND read with ECC=0A=
+ */=0A=
+static int onenand_read_ecc(struct mtd_info *mtd, loff_t from, size_t =
len,=0A=
+	size_t *retlen, u_char *buf,=0A=
+	u_char *oob_buf, struct nand_oobinfo *oobsel)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	int read =3D 0, column;=0A=
+	int thislen;=0A=
+	int ret =3D 0;=0A=
+=0A=
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_read_ecc: from =3D 0x%08x, len =3D =
%i\n", (unsigned int) from, (int) len);=0A=
+=0A=
+	/* Do not allow reads past end of device */=0A=
+	if ((from + len) > mtd->size) {=0A=
+		DEBUG(MTD_DEBUG_LEVEL0, "onenand_read_ecc: Attempt read beyond end of =
device\n");=0A=
+		*retlen =3D 0;=0A=
+		return -EINVAL;=0A=
+	}=0A=
+=0A=
+	/* Grab the lock and see if the device is available */=0A=
+	onenand_get_device(mtd, FL_READING);=0A=
+=0A=
+	/* TODO handling oob */=0A=
+=0A=
+	while (read < len) {=0A=
+		thislen =3D min_t(int, mtd->oobblock, len - read);=0A=
+=0A=
+		column =3D from & (mtd->oobblock - 1);=0A=
+		if (column + thislen > mtd->oobblock)=0A=
+			thislen =3D mtd->oobblock - column;=0A=
+=0A=
+		if (!onenand_check_bufferram(mtd, from)) {=0A=
+			this->command(mtd, ONENAND_CMD_READ, from, mtd->oobblock);=0A=
+=0A=
+			ret =3D this->wait(mtd, FL_READING);=0A=
+			/* First copy data and check return value for ECC handling */=0A=
+			onenand_update_bufferram(mtd, from, 1);=0A=
+		}=0A=
+=0A=
+		this->read_bufferram(mtd, DATARAM, buf, column, thislen);=0A=
+=0A=
+		read +=3D thislen;=0A=
+=0A=
+		if (read =3D=3D len)=0A=
+			break;=0A=
+=0A=
+		if (ret) {=0A=
+			DEBUG(MTD_DEBUG_LEVEL0, "onenand_read_ecc: read failed =3D %d\n", =
ret);=0A=
+			goto out;=0A=
+		}=0A=
+=0A=
+		from +=3D thislen;=0A=
+		buf +=3D thislen;=0A=
+	}=0A=
+=0A=
+out:=0A=
+	/* Deselect and wake up anyone waiting on the device */=0A=
+	onenand_release_device(mtd);=0A=
+=0A=
+	/*=0A=
+	 * Return success, if no ECC failures, else -EBADMSG=0A=
+	 * fs driver will take care of that, because=0A=
+	 * retlen =3D=3D desired len and result =3D=3D -EBADMSG=0A=
+	 */=0A=
+	*retlen =3D read;=0A=
+	return ret;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_read - [MTD Interface] MTD compability function for =
onenand_read_ecc=0A=
+ * @param mtd		MTD device structure=0A=
+ * @param from		offset to read from=0A=
+ * @param len		number of bytes to read=0A=
+ * @param retlen	pointer to variable to store the number of read bytes=0A=
+ * @param buf		the databuffer to put data=0A=
+ *=0A=
+ * This function simply calls onenand_read_ecc with oob buffer and =
oobsel =3D NULL=0A=
+*/=0A=
+static int onenand_read(struct mtd_info *mtd, loff_t from, size_t len,=0A=
+	size_t *retlen, u_char *buf)=0A=
+{=0A=
+	return onenand_read_ecc(mtd, from, len, retlen, buf, NULL, NULL);=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_read_oob - [MTD Interface] OneNAND read out-of-band=0A=
+ * @param mtd		MTD device structure=0A=
+ * @param from		offset to read from=0A=
+ * @param len		number of bytes to read=0A=
+ * @param retlen	pointer to variable to store the number of read bytes=0A=
+ * @param buf		the databuffer to put data=0A=
+ *=0A=
+ * OneNAND read out-of-band data from the spare area=0A=
+ */=0A=
+static int onenand_read_oob(struct mtd_info *mtd, loff_t from, size_t =
len,=0A=
+	size_t *retlen, u_char *buf)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	int read =3D 0, thislen, column;=0A=
+	int ret =3D 0;=0A=
+=0A=
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_read_oob: from =3D 0x%08x, len =3D =
%i\n", (unsigned int) from, (int) len);=0A=
+=0A=
+	/* Initialize return length value */=0A=
+	*retlen =3D 0;=0A=
+=0A=
+	/* Do not allow reads past end of device */=0A=
+	if (unlikely((from + len) > mtd->size)) {=0A=
+		DEBUG(MTD_DEBUG_LEVEL0, "onenand_read_oob: Attempt read beyond end of =
device\n");=0A=
+		return -EINVAL;=0A=
+	}=0A=
+=0A=
+	/* Grab the lock and see if the device is available */=0A=
+	onenand_get_device(mtd, FL_READING);=0A=
+=0A=
+	column =3D from & (mtd->oobsize - 1);=0A=
+=0A=
+	while (read < len) {=0A=
+		thislen =3D mtd->oobsize - column;=0A=
+		thislen =3D min_t(int, thislen, len);=0A=
+=0A=
+		this->command(mtd, ONENAND_CMD_READOOB, from, mtd->oobsize);=0A=
+=0A=
+		onenand_update_bufferram(mtd, from, 0);=0A=
+=0A=
+		ret =3D this->wait(mtd, FL_READING);=0A=
+		/* First copy data and check return value for ECC handling */=0A=
+=0A=
+		this->read_bufferram(mtd, SPARERAM, buf, column, thislen);=0A=
+=0A=
+		read +=3D thislen;=0A=
+=0A=
+		if (read =3D=3D len)=0A=
+			break;=0A=
+=0A=
+		if (ret) {=0A=
+			DEBUG(MTD_DEBUG_LEVEL0, "onenand_read_oob: read failed =3D %d\n", =
ret);=0A=
+			goto out;=0A=
+		}=0A=
+=0A=
+		buf +=3D thislen;=0A=
+=0A=
+		/* Read more? */=0A=
+		if (read < len) {=0A=
+			/* Page size */=0A=
+			from +=3D mtd->oobblock;=0A=
+			column =3D 0;=0A=
+		}=0A=
+	}=0A=
+=0A=
+out:=0A=
+	/* Deselect and wake up anyone waiting on the device */=0A=
+	onenand_release_device(mtd);=0A=
+=0A=
+	*retlen =3D read;=0A=
+	return ret;=0A=
+}=0A=
+=0A=
+#ifdef CONFIG_MTD_ONENAND_VERIFY_WRITE=0A=
+/**=0A=
+ * onenand_verify_page - [GENERIC] verify the chip contents after a =
write=0A=
+ * @param mtd		MTD device structure=0A=
+ * @param buf		the databuffer to verify=0A=
+ * @param block		block address=0A=
+ * @param page		page address=0A=
+ *=0A=
+ * Check DataRAM area directly=0A=
+ */=0A=
+static int onenand_verify_page(struct mtd_info *mtd, u_char *buf,=0A=
+	loff_t addr, int block, int page)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	void __iomem *dataram0, *dataram1;=0A=
+	int ret =3D 0;=0A=
+=0A=
+	this->command(mtd, ONENAND_CMD_READ, addr, mtd->oobblock);=0A=
+=0A=
+	ret =3D this->wait(mtd, FL_READING);=0A=
+	if (ret)=0A=
+		return ret;=0A=
+=0A=
+	onenand_update_bufferram(mtd, addr, 1);=0A=
+=0A=
+	/* Check, if the two dataram areas are same */=0A=
+	dataram0 =3D this->base + ONENAND_DATARAM;=0A=
+	dataram1 =3D dataram0 + mtd->oobblock;=0A=
+=0A=
+	if (memcmp(dataram0, dataram1, mtd->oobblock))=0A=
+		return -EBADMSG;=0A=
+	=0A=
+	return 0;=0A=
+}=0A=
+#else=0A=
+#define onenand_verify_page(...)	(0)=0A=
+#endif=0A=
+=0A=
+#define NOTALIGNED(x)	((x & (mtd->oobblock - 1)) !=3D 0)=0A=
+=0A=
+/**=0A=
+ * onenand_write_ecc - [MTD Interface] OneNAND write with ECC=0A=
+ * @param mtd		MTD device structure=0A=
+ * @param to		offset to write to=0A=
+ * @param len		number of bytes to write=0A=
+ * @param retlen	pointer to variable to store the number of written =
bytes=0A=
+ * @param buf		the data to write=0A=
+ * @param eccbuf	filesystem supplied oob data buffer=0A=
+ * @param oobsel	oob selection structure=0A=
+ *=0A=
+ * OneNAND write with ECC=0A=
+ */=0A=
+static int onenand_write_ecc(struct mtd_info *mtd, loff_t to, size_t =
len,=0A=
+	size_t *retlen, const u_char *buf,=0A=
+	u_char *eccbuf, struct nand_oobinfo *oobsel)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	int written =3D 0;=0A=
+	int ret =3D 0;=0A=
+=0A=
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_write_ecc: to =3D 0x%08x, len =3D =
%i\n", (unsigned int) to, (int) len);=0A=
+=0A=
+	/* Initialize retlen, in case of early exit */=0A=
+	*retlen =3D 0;=0A=
+=0A=
+	/* Do not allow writes past end of device */=0A=
+	if (unlikely((to + len) > mtd->size)) {=0A=
+		DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_ecc: Attempt write to past end =
of device\n");=0A=
+		return -EINVAL;=0A=
+	}=0A=
+=0A=
+	/* Reject writes, which are not page aligned */=0A=
+        if (unlikely(NOTALIGNED(to)) || unlikely(NOTALIGNED(len))) {=0A=
+                DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_ecc: Attempt to =
write not page aligned data\n");=0A=
+                return -EINVAL;=0A=
+        }=0A=
+=0A=
+	/* Grab the lock and see if the device is available */=0A=
+	onenand_get_device(mtd, FL_WRITING);=0A=
+=0A=
+	/* Loop until all data write */=0A=
+	while (written < len) {=0A=
+		int thislen =3D min_t(int, mtd->oobblock, len - written);=0A=
+=0A=
+		this->command(mtd, ONENAND_CMD_BUFFERRAM, to, mtd->oobblock);=0A=
+=0A=
+		this->write_bufferram(mtd, DATARAM, buf, 0, thislen);=0A=
+		this->write_bufferram(mtd, SPARERAM, ffchars, 0, mtd->oobsize);=0A=
+=0A=
+		this->command(mtd, ONENAND_CMD_PROG, to, mtd->oobblock);=0A=
+=0A=
+		onenand_update_bufferram(mtd, to, 1);=0A=
+=0A=
+		ret =3D this->wait(mtd, FL_WRITING);=0A=
+		if (ret) {=0A=
+			DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_ecc: write filaed %d\n", ret);=0A=
+			goto out;=0A=
+		}=0A=
+=0A=
+		written +=3D thislen;=0A=
+=0A=
+		/* Only check verify write turn on */=0A=
+		ret =3D onenand_verify_page(mtd, (u_char *) buf, to, block, page);=0A=
+		if (ret) {=0A=
+			DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_ecc: verify failed %d\n", =
ret);=0A=
+			goto out;=0A=
+		}=0A=
+=0A=
+		if (written =3D=3D len)=0A=
+			break;=0A=
+=0A=
+		to +=3D thislen;=0A=
+		buf +=3D thislen;=0A=
+	}=0A=
+=0A=
+out:=0A=
+	/* Deselect and wake up anyone waiting on the device */=0A=
+	onenand_release_device(mtd);=0A=
+=0A=
+	*retlen =3D written;=0A=
+	=0A=
+	return ret;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_write - [MTD Interface] compability function for =
onenand_write_ecc=0A=
+ * @param mtd		MTD device structure=0A=
+ * @param to		offset to write to=0A=
+ * @param len		number of bytes to write=0A=
+ * @param retlen	pointer to variable to store the number of written =
bytes=0A=
+ * @param buf		the data to write=0A=
+ *=0A=
+ * This function simply calls onenand_write_ecc=0A=
+ * with oob buffer and oobsel =3D NULL=0A=
+ */=0A=
+static int onenand_write(struct mtd_info *mtd, loff_t to, size_t len,=0A=
+	size_t *retlen, const u_char *buf)=0A=
+{=0A=
+	return onenand_write_ecc(mtd, to, len, retlen, buf, NULL, NULL);=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_write_oob - [MTD Interface] OneNAND write out-of-band=0A=
+ * @param mtd		MTD device structure=0A=
+ * @param to		offset to write to=0A=
+ * @param len		number of bytes to write=0A=
+ * @param retlen	pointer to variable to store the number of written =
bytes=0A=
+ * @param buf		the data to write=0A=
+ *=0A=
+ * OneNAND write out-of-band=0A=
+ */=0A=
+static int onenand_write_oob(struct mtd_info *mtd, loff_t to, size_t =
len,=0A=
+	size_t *retlen, const u_char *buf)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	int column, status;=0A=
+	int written =3D 0;=0A=
+=0A=
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_write_oob: to =3D 0x%08x, len =3D =
%i\n", (unsigned int) to, (int) len);=0A=
+=0A=
+	/* Initialize retlen, in case of early exit */=0A=
+	*retlen =3D 0;=0A=
+=0A=
+	/* Do not allow writes past end of device */=0A=
+	if (unlikely((to + len) > mtd->size)) {=0A=
+		DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_oob: Attempt write to past end =
of device\n");=0A=
+		return -EINVAL;=0A=
+	}=0A=
+=0A=
+	/* Grab the lock and see if the device is available */=0A=
+	onenand_get_device(mtd, FL_WRITING);=0A=
+=0A=
+	/* Loop until all data write */=0A=
+	while (written < len) {=0A=
+		int thislen =3D min_t(int, mtd->oobsize, len - written);=0A=
+=0A=
+		column =3D to & (mtd->oobsize - 1);=0A=
+=0A=
+		this->command(mtd, ONENAND_CMD_BUFFERRAM, to, mtd->oobsize);=0A=
+=0A=
+		this->write_bufferram(mtd, SPARERAM, ffchars, 0, mtd->oobsize);=0A=
+		this->write_bufferram(mtd, SPARERAM, buf, column, thislen);=0A=
+=0A=
+		this->command(mtd, ONENAND_CMD_PROGOOB, to, mtd->oobsize);=0A=
+=0A=
+		onenand_update_bufferram(mtd, to, 0);=0A=
+=0A=
+		status =3D this->wait(mtd, FL_WRITING);=0A=
+		if (status)=0A=
+			goto out;=0A=
+=0A=
+		written +=3D thislen;=0A=
+=0A=
+		if (written =3D=3D len)=0A=
+			break;=0A=
+=0A=
+		to +=3D thislen;=0A=
+		buf +=3D thislen;=0A=
+	}=0A=
+=0A=
+out:=0A=
+	/* Deselect and wake up anyone waiting on the device */=0A=
+	onenand_release_device(mtd);=0A=
+=0A=
+	*retlen =3D written;=0A=
+	=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_writev_ecc - [MTD Interface] write with iovec with ecc=0A=
+ * @param mtd		MTD device structure=0A=
+ * @param vecs		the iovectors to write=0A=
+ * @param count		number of vectors=0A=
+ * @param to		offset to write to=0A=
+ * @param retlen	pointer to variable to store the number of written =
bytes=0A=
+ * @param eccbuf	filesystem supplied oob data buffer=0A=
+ * @param oobsel	oob selection structure=0A=
+ *=0A=
+ * OneNAND write with iovec with ecc=0A=
+ */=0A=
+static int onenand_writev_ecc(struct mtd_info *mtd, const struct kvec =
*vecs,=0A=
+	unsigned long count, loff_t to, size_t *retlen,=0A=
+	u_char *eccbuf, struct nand_oobinfo *oobsel)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	unsigned char buffer[mtd->oobblock], *pbuf;=0A=
+	size_t total_len, len;=0A=
+	int i, written =3D 0;=0A=
+	int ret =3D 0;=0A=
+=0A=
+	/* Preset written len for early exit */=0A=
+	*retlen =3D 0;=0A=
+=0A=
+	/* Calculate total length of data */=0A=
+	total_len =3D 0;=0A=
+	for (i =3D 0; i < count; i++)=0A=
+		total_len +=3D vecs[i].iov_len;=0A=
+=0A=
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_writev_ecc: to =3D 0x%08x, len =3D =
%i, count =3D %ld\n", (unsigned int) to, (unsigned int) total_len, =
count);=0A=
+=0A=
+	/* Do not allow write past end of the device */=0A=
+	if (unlikely((to + total_len) > mtd->size)) {=0A=
+		DEBUG(MTD_DEBUG_LEVEL0, "onenand_writev_ecc: Attempted write past end =
of device\n");=0A=
+		return -EINVAL;=0A=
+	}=0A=
+=0A=
+	/* Reject writes, which are not page aligned */=0A=
+        if (unlikely(NOTALIGNED(to)) || =
unlikely(NOTALIGNED(total_len))) {=0A=
+                DEBUG(MTD_DEBUG_LEVEL0, "onenand_writev_ecc: Attempt to =
write not page aligned data\n");=0A=
+                return -EINVAL;=0A=
+        }=0A=
+=0A=
+	/* Grab the lock and see if the device is available */=0A=
+	onenand_get_device(mtd, FL_WRITING);=0A=
+=0A=
+	/* TODO handling oob */=0A=
+	=0A=
+	/* Loop until all keve's data has been written */=0A=
+	len =3D 0;=0A=
+	while (count) {=0A=
+		pbuf =3D buffer;=0A=
+		/* =0A=
+		 * If the given tuple is >=3D pagesize then=0A=
+		 * write it out from the iov=0A=
+		 */=0A=
+		if ((vecs->iov_len - len) >=3D mtd->oobblock) {=0A=
+			pbuf =3D vecs->iov_base + len;=0A=
+=0A=
+			len +=3D mtd->oobblock;=0A=
+=0A=
+			/* Check, if we have to switch to the next tuple */=0A=
+			if (len >=3D (int) vecs->iov_len) {=0A=
+				vecs++;=0A=
+				len =3D 0;=0A=
+				count--;=0A=
+			}=0A=
+		} else {=0A=
+			int cnt =3D 0, thislen;=0A=
+			while (cnt < mtd->oobblock) {=0A=
+				thislen =3D min_t(int, mtd->oobblock - cnt, vecs->iov_len - len);=0A=
+				memcpy(buffer + cnt, vecs->iov_base + len, thislen);=0A=
+				cnt +=3D thislen;=0A=
+				len +=3D thislen;=0A=
+=0A=
+				/* Check, if we have to switch to the next tuple */=0A=
+				if (len >=3D (int) vecs->iov_len) {=0A=
+					vecs++;=0A=
+					len =3D 0;=0A=
+					count--;=0A=
+				}=0A=
+			}=0A=
+		}=0A=
+=0A=
+		this->command(mtd, ONENAND_CMD_BUFFERRAM, to, mtd->oobblock);=0A=
+=0A=
+		this->write_bufferram(mtd, DATARAM, pbuf, 0, mtd->oobblock);=0A=
+		this->write_bufferram(mtd, SPARERAM, ffchars, 0, mtd->oobsize);=0A=
+=0A=
+		this->command(mtd, ONENAND_CMD_PROG, to, mtd->oobblock);=0A=
+=0A=
+		onenand_update_bufferram(mtd, to, 1);=0A=
+=0A=
+		ret =3D this->wait(mtd, FL_WRITING);=0A=
+		if (ret) {=0A=
+			DEBUG(MTD_DEBUG_LEVEL0, "onenand_writev_ecc: write failed %d\n", =
ret);=0A=
+			goto out;=0A=
+		}=0A=
+=0A=
+=0A=
+		/* Only check verify write turn on */=0A=
+		ret =3D onenand_verify_page(mtd, (u_char *) pbuf, to, block, page);=0A=
+		if (ret) {=0A=
+			DEBUG(MTD_DEBUG_LEVEL0, "onenand_writev_ecc: verify failed %d\n", =
ret);=0A=
+			goto out;=0A=
+		}=0A=
+=0A=
+		written +=3D mtd->oobblock;=0A=
+=0A=
+		to +=3D mtd->oobblock;=0A=
+	}=0A=
+=0A=
+out:=0A=
+	/* Deselect and wakt up anyone waiting on the device */=0A=
+	onenand_release_device(mtd);=0A=
+=0A=
+	*retlen =3D written;=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_writev - [MTD Interface] compabilty function for =
onenand_writev_ecc=0A=
+ * @param mtd		MTD device structure=0A=
+ * @param vecs		the iovectors to write=0A=
+ * @param count		number of vectors=0A=
+ * @param to		offset to write to=0A=
+ * @param retlen	pointer to variable to store the number of written =
bytes=0A=
+ *=0A=
+ * OneNAND write with kvec. This just calls the ecc function=0A=
+ */=0A=
+static int onenand_writev(struct mtd_info *mtd, const struct kvec *vecs,=0A=
+	unsigned long count, loff_t to, size_t *retlen)=0A=
+{=0A=
+	return onenand_writev_ecc(mtd, vecs, count, to, retlen, NULL, NULL);=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_erase - [MTD Interface] erase block(s)=0A=
+ * @param mtd		MTD device structure=0A=
+ * @param instr		erase instruction=0A=
+ *=0A=
+ * Erase one ore more blocks=0A=
+ */=0A=
+static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	unsigned int block_size;=0A=
+	loff_t addr;=0A=
+	int len;=0A=
+	int ret =3D 0;=0A=
+=0A=
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_erase: start =3D 0x%08x, len =3D =
%i\n", (unsigned int) instr->addr, (unsigned int) instr->len);=0A=
+=0A=
+	block_size =3D (1 << this->erase_shift);=0A=
+=0A=
+	/* Start address must align on block boundary */=0A=
+	if (unlikely(instr->addr & (block_size - 1))) {=0A=
+		DEBUG(MTD_DEBUG_LEVEL0, "onenand_erase: Unaligned address\n");=0A=
+		return -EINVAL;=0A=
+	}=0A=
+=0A=
+	/* Length must align on block boundary */=0A=
+	if (unlikely(instr->len & (block_size - 1))) {=0A=
+		DEBUG(MTD_DEBUG_LEVEL0, "onenand_erase: Length not block aligned\n");=0A=
+		return -EINVAL;=0A=
+	}=0A=
+=0A=
+	/* Do not allow erase past end of device */=0A=
+	if (unlikely((instr->len + instr->addr) > mtd->size)) {=0A=
+		DEBUG(MTD_DEBUG_LEVEL0, "onenand_erase: Erase past end of device\n");=0A=
+		return -EINVAL;=0A=
+	}=0A=
+=0A=
+	instr->fail_addr =3D 0xffffffff;=0A=
+=0A=
+	/* Grab the lock and see if the device is available */=0A=
+	onenand_get_device(mtd, FL_ERASING);=0A=
+=0A=
+	/* Loop throught the pages */=0A=
+	len =3D instr->len;=0A=
+	addr =3D instr->addr;=0A=
+=0A=
+	instr->state =3D MTD_ERASING;=0A=
+=0A=
+	while (len) {=0A=
+=0A=
+		/* TODO Check badblock */=0A=
+=0A=
+		this->command(mtd, ONENAND_CMD_ERASE, addr, block_size);=0A=
+=0A=
+		ret =3D this->wait(mtd, FL_ERASING);=0A=
+		/* Check, if it is write protected */=0A=
+		if (ret) {=0A=
+			if (ret =3D=3D -EPERM)=0A=
+				DEBUG(MTD_DEBUG_LEVEL0, "onenand_erase: Device is write =
protected!!!\n");=0A=
+			else=0A=
+				DEBUG(MTD_DEBUG_LEVEL0, "onenand_erase: Failed erase, block %d\n", =
(unsigned) (addr >> this->erase_shift));=0A=
+			instr->state =3D MTD_ERASE_FAILED;=0A=
+			instr->fail_addr =3D addr;=0A=
+			goto erase_exit;=0A=
+		}=0A=
+=0A=
+		len -=3D block_size;=0A=
+		addr +=3D block_size;=0A=
+	}=0A=
+=0A=
+	instr->state =3D MTD_ERASE_DONE;=0A=
+=0A=
+erase_exit:=0A=
+=0A=
+	ret =3D instr->state =3D=3D MTD_ERASE_DONE ? 0 : -EIO;=0A=
+	/* Do call back function */=0A=
+	if (!ret)=0A=
+		mtd_erase_callback(instr);=0A=
+=0A=
+	/* Deselect and wake up anyone waiting on the device */=0A=
+	onenand_release_device(mtd);=0A=
+=0A=
+	return ret;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_sync - [MTD Interface] sync=0A=
+ * @param mtd		MTD device structure=0A=
+ *=0A=
+ * Sync is actually a wait for chip ready function=0A=
+ */=0A=
+static void onenand_sync(struct mtd_info *mtd)=0A=
+{=0A=
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_sync: called\n");=0A=
+=0A=
+	/* Grab the lock and see if the device is available */=0A=
+	onenand_get_device(mtd, FL_SYNCING);=0A=
+=0A=
+	/* Release it and go back */=0A=
+	onenand_release_device(mtd);=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_block_isbad - [MTD Interface] Check whether the block at the =
given offset is bad=0A=
+ * @param mtd		MTD device structure=0A=
+ * @param ofs		offset relative to mtd start=0A=
+ */=0A=
+static int onenand_block_isbad(struct mtd_info *mtd, loff_t ofs)=0A=
+{=0A=
+	/*=0A=
+	 * TODO =0A=
+	 * 1. Bad block table (BBT)=0A=
+	 *   -> using NAND BBT to support JFFS2=0A=
+	 * 2. Bad block management (BBM)=0A=
+	 *   -> bad block replace scheme=0A=
+	 *=0A=
+	 * Currently we do nothing=0A=
+	 */=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_block_markbad - [MTD Interface] Mark the block at the given =
offset as bad=0A=
+ * @param mtd		MTD device structure=0A=
+ * @param ofs		offset relative to mtd start=0A=
+ */=0A=
+static int onenand_block_markbad(struct mtd_info *mtd, loff_t ofs)=0A=
+{=0A=
+	/* see above */=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_unlock - [MTD Interface] Unlock block(s)=0A=
+ * @param mtd		MTD device structure=0A=
+ * @param ofs		offset relative to mtd start=0A=
+ * @param len		number of bytes to unlock=0A=
+ *=0A=
+ * Unlock one or more blocks=0A=
+ */=0A=
+static int onenand_unlock(struct mtd_info *mtd, loff_t ofs, size_t len)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	int start, end, block, value, status;=0A=
+=0A=
+	start =3D ofs >> this->erase_shift;=0A=
+	end =3D len >> this->erase_shift;=0A=
+=0A=
+	/* Continuous lock scheme */=0A=
+	if (this->options & ONENAND_CONT_LOCK) {=0A=
+		/* Set start block address */=0A=
+		onenand_writew(start, this->base + ONENAND_REG_START_BLOCK_ADDRESS);=0A=
+		/* Set end block address */=0A=
+		onenand_writew(end - 1, this->base + ONENAND_REG_END_BLOCK_ADDRESS);=0A=
+		/* Write unlock command */=0A=
+		this->command(mtd, ONENAND_CMD_UNLOCK, 0, 0);=0A=
+=0A=
+		/* There's no return value */=0A=
+		this->wait(mtd, FL_UNLOCKING);=0A=
+=0A=
+		/* Sanity check */=0A=
+		while (onenand_readw(this->base + ONENAND_REG_CTRL_STATUS)=0A=
+		    & ONENAND_CTRL_ONGO)=0A=
+			continue;=0A=
+=0A=
+		/* Check lock status */=0A=
+		status =3D onenand_readw(this->base + ONENAND_REG_WP_STATUS);=0A=
+		if (!(status & ONENAND_WP_US))=0A=
+			printk(KERN_ERR "wp status =3D 0x%x\n", status);=0A=
+=0A=
+		return 0;=0A=
+	}=0A=
+=0A=
+	/* Block lock scheme */=0A=
+	for (block =3D start; block < end; block++) {=0A=
+		/* Set start block address */=0A=
+		onenand_writew(block, this->base + ONENAND_REG_START_BLOCK_ADDRESS);=0A=
+		/* Write unlock command */=0A=
+		this->command(mtd, ONENAND_CMD_UNLOCK, 0, 0);=0A=
+=0A=
+		/* There's no return value */=0A=
+		this->wait(mtd, FL_UNLOCKING);=0A=
+=0A=
+		/* Sanity check */=0A=
+		while (onenand_readw(this->base + ONENAND_REG_CTRL_STATUS)=0A=
+		    & ONENAND_CTRL_ONGO)=0A=
+			continue;=0A=
+=0A=
+		/* Set block address for read block status */=0A=
+		value =3D onenand_block_address(this->device_id, block);=0A=
+		onenand_writew(value, this->base + ONENAND_REG_START_ADDRESS1);=0A=
+=0A=
+		/* Check lock status */=0A=
+		status =3D onenand_readw(this->base + ONENAND_REG_WP_STATUS);=0A=
+		if (!(status & ONENAND_WP_US))=0A=
+			printk(KERN_ERR "block =3D %d, wp status =3D 0x%x\n", block, status);=0A=
+	}=0A=
+	=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_print_device_info - Print device ID=0A=
+ * @param device        device ID=0A=
+ *=0A=
+ * Print device ID=0A=
+ */=0A=
+static void onenand_print_device_info(int device)=0A=
+{=0A=
+        int vcc, demuxed, ddp, density;=0A=
+=0A=
+        vcc =3D device & ONENAND_DEVICE_VCC_MASK;=0A=
+        demuxed =3D device & ONENAND_DEVICE_IS_DEMUX;=0A=
+        ddp =3D device & ONENAND_DEVICE_IS_DDP;=0A=
+        density =3D device >> ONENAND_DEVICE_DENSITY_SHIFT;=0A=
+        printk(KERN_INFO "%sOneNAND%s %dMB %sV 16-bit (0x%02x)\n",=0A=
+                demuxed ? "" : "Muxed ",=0A=
+                ddp ? "(DDP)" : "",=0A=
+                (16 << density),=0A=
+                vcc ? "2.65/3.3" : "1.8",=0A=
+                device);=0A=
+}=0A=
+=0A=
+static const struct onenand_manufacturers onenand_manuf_ids[] =3D {=0A=
+        {ONENAND_MFR_SAMSUNG, "Samsung"},=0A=
+        {ONENAND_MFR_UNKNOWN, "Unknown"}=0A=
+};=0A=
+=0A=
+/**=0A=
+ * onenand_check_maf - Check manufacturer ID=0A=
+ * @param manuf         manufacturer ID=0A=
+ *=0A=
+ * Check manufacturer ID=0A=
+ */=0A=
+static int onenand_check_maf(int manuf)=0A=
+{=0A=
+        int i;=0A=
+=0A=
+        for (i =3D 0; onenand_manuf_ids[i].id; i++) {=0A=
+                if (manuf =3D=3D onenand_manuf_ids[i].id)=0A=
+                        break;=0A=
+        }=0A=
+=0A=
+        printk(KERN_DEBUG "OneNAND Manufacturer: %s\n",=0A=
+                onenand_manuf_ids[i].name);=0A=
+=0A=
+        return (i !=3D ONENAND_MFR_UNKNOWN);=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_probe - [OneNAND Interface] Probe the OneNAND device=0A=
+ * @param mtd		MTD device structure=0A=
+ *=0A=
+ * OneNAND detection method:=0A=
+ *   Compare the the values from command with ones from register=0A=
+ */=0A=
+static int onenand_probe(struct mtd_info *mtd)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	int bram_maf_id, bram_dev_id, maf_id, dev_id;=0A=
+	int density;=0A=
+=0A=
+	/* Send the command for reading device ID from BootRAM */=0A=
+	onenand_writew(ONENAND_CMD_READID, this->base + ONENAND_BOOTRAM);=0A=
+=0A=
+	/* Read manufacturer and device IDs from BootRAM */=0A=
+	bram_maf_id =3D onenand_readw(this->base + ONENAND_BOOTRAM + 0x0);=0A=
+	bram_dev_id =3D onenand_readw(this->base + ONENAND_BOOTRAM + 0x2);=0A=
+=0A=
+	/* Check manufacturer ID */=0A=
+	if (onenand_check_maf(bram_maf_id))=0A=
+		return -ENXIO;=0A=
+=0A=
+	/* Reset OneNAND to read default register values */=0A=
+	onenand_writew(ONENAND_CMD_RESET, this->base + ONENAND_BOOTRAM);=0A=
+=0A=
+	/* Read manufacturer and device IDs from Register */=0A=
+	maf_id =3D onenand_readw(this->base + ONENAND_REG_MANUFACTURER_ID);=0A=
+	dev_id =3D onenand_readw(this->base + ONENAND_REG_DEVICE_ID);=0A=
+=0A=
+	/* Check OneNAND device */=0A=
+	if (maf_id !=3D bram_maf_id || dev_id !=3D bram_dev_id)=0A=
+		return -ENXIO;=0A=
+=0A=
+	/* Flash device information */=0A=
+	onenand_print_device_info(dev_id);=0A=
+	this->device_id =3D dev_id;=0A=
+=0A=
+	density =3D dev_id >> ONENAND_DEVICE_DENSITY_SHIFT;=0A=
+	this->chipsize =3D (16 << density) << 20;=0A=
+=0A=
+	/* OneNAND page size & block size */=0A=
+	/* The data buffer size is equal to page size */=0A=
+	mtd->oobblock =3D onenand_readw(this->base + =
ONENAND_REG_DATA_BUFFER_SIZE);=0A=
+	mtd->oobsize =3D mtd->oobblock >> 5;=0A=
+	/* Pagers per block is always 64 in OneNAND */=0A=
+	mtd->erasesize =3D mtd->oobblock << 6;=0A=
+=0A=
+	this->erase_shift =3D ffs(mtd->erasesize) - 1;=0A=
+	this->page_shift =3D ffs(mtd->oobblock) - 1;=0A=
+	this->ppb_shift =3D (this->erase_shift - this->page_shift);=0A=
+	this->page_mask =3D (mtd->erasesize / mtd->oobblock) - 1;=0A=
+=0A=
+	/* REVIST: Multichip handling */=0A=
+=0A=
+	mtd->size =3D this->chipsize;=0A=
+=0A=
+	/* Version ID */=0A=
+	this->version_id =3D onenand_readw(this->base + =
ONENAND_REG_VERSION_ID);=0A=
+	printk(KERN_DEBUG "OneNAND version =3D 0x%04x\n", this->version_id);=0A=
+=0A=
+	/* Lock scheme */=0A=
+	if (density <=3D ONENAND_DEVICE_DENSITY_512Mb &&=0A=
+	    !(this->version_id >> ONENAND_VERSION_PROCESS_SHIFT)) {=0A=
+		printk(KERN_INFO "Lock scheme is Continues Lock\n");=0A=
+		this->options |=3D ONENAND_CONT_LOCK;=0A=
+	}=0A=
+	=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+=0A=
+/**=0A=
+ * onenand_scan - [OneNAND Interface] Scan for the OneNAND device=0A=
+ * @param mtd		MTD device structure=0A=
+ * @param maxchips	Number of chips to scan for=0A=
+ *=0A=
+ * This fills out all the not initialized function pointers=0A=
+ * with the defaults.=0A=
+ * The flash ID is read and the mtd/chip structures are=0A=
+ * filled with the appropriate values.=0A=
+ */=0A=
+int onenand_scan(struct mtd_info *mtd, int maxchips)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+=0A=
+	if (!this->command)=0A=
+		this->command =3D onenand_command;=0A=
+	if (!this->wait)=0A=
+		this->wait =3D onenand_wait;=0A=
+=0A=
+	if (!this->read_bufferram)=0A=
+		this->read_bufferram =3D onenand_read_bufferram;=0A=
+	if (!this->write_bufferram)=0A=
+		this->write_bufferram =3D onenand_write_bufferram;=0A=
+=0A=
+	if (onenand_probe(mtd))=0A=
+		return -ENXIO;=0A=
+=0A=
+	this->state =3D FL_READY;=0A=
+	init_waitqueue_head(&this->wq);=0A=
+	spin_lock_init(&this->chip_lock);=0A=
+=0A=
+	switch (mtd->oobsize) {=0A=
+	case 64:=0A=
+		this->autooob =3D &onenand_oob_64;=0A=
+		break;=0A=
+=0A=
+	case 32:=0A=
+		this->autooob =3D &onenand_oob_32;=0A=
+		break;=0A=
+=0A=
+	default:=0A=
+		printk(KERN_WARNING "No OOB scheme defined for oobsize %d\n",=0A=
+			mtd->oobsize);=0A=
+		/* To prevent kernel oops */=0A=
+		this->autooob =3D &onenand_oob_32;=0A=
+		break;=0A=
+	}=0A=
+=0A=
+	memcpy(&mtd->oobinfo, this->autooob, sizeof(mtd->oobinfo));=0A=
+	=0A=
+	/* Fill in remaining MTD driver data */=0A=
+	mtd->type =3D MTD_NANDFLASH;=0A=
+	mtd->flags =3D MTD_CAP_NANDFLASH | MTD_ECC;=0A=
+	mtd->ecctype =3D MTD_ECC_SW;=0A=
+	mtd->erase =3D onenand_erase;=0A=
+	mtd->point =3D NULL;=0A=
+	mtd->unpoint =3D NULL;=0A=
+	mtd->read =3D onenand_read;=0A=
+	mtd->write =3D onenand_write;=0A=
+	mtd->read_ecc =3D onenand_read_ecc;=0A=
+	mtd->write_ecc =3D onenand_write_ecc;=0A=
+	mtd->read_oob =3D onenand_read_oob;=0A=
+	mtd->write_oob =3D onenand_write_oob;=0A=
+	mtd->readv =3D NULL;=0A=
+	mtd->readv_ecc =3D NULL;=0A=
+	mtd->writev =3D onenand_writev;=0A=
+	mtd->writev_ecc =3D onenand_writev_ecc;=0A=
+	mtd->sync =3D onenand_sync;=0A=
+	mtd->lock =3D NULL;=0A=
+	mtd->unlock =3D onenand_unlock;=0A=
+	mtd->suspend =3D NULL;=0A=
+	mtd->resume =3D NULL;=0A=
+	mtd->block_isbad =3D onenand_block_isbad;=0A=
+	mtd->block_markbad =3D onenand_block_markbad;=0A=
+	mtd->owner =3D THIS_MODULE;=0A=
+=0A=
+	/* Unlock whole block */=0A=
+	mtd->unlock(mtd, 0x0, this->chipsize);=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_release - [OneNAND Interface] Free resources held by the =
OneNAND device=0A=
+ * @param mtd		MTD device structure=0A=
+ */=0A=
+void onenand_release(struct mtd_info *mtd)=0A=
+{=0A=
+#ifdef CONFIG_MTD_PARTITIONS=0A=
+	/* Deregister partitions */=0A=
+	del_mtd_partitions (mtd);=0A=
+#endif=0A=
+	/* Deregister the device */=0A=
+	del_mtd_device (mtd);=0A=
+}=0A=
+=0A=
+EXPORT_SYMBOL(onenand_scan);=0A=
+EXPORT_SYMBOL(onenand_release);=0A=
+=0A=
+MODULE_LICENSE("GPL");=0A=
+MODULE_AUTHOR("Kyungmin Park <kyungmin.park@samsung.com>");=0A=
+MODULE_DESCRIPTION("Generic OneNAND flash driver code");=0A=
Index: include/linux/mtd/onenand.h=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
--- /dev/null  (tree:4b825dc642cb6eb9a060e54bf8d69288fbee4904)=0A=
+++ uncommitted/include/linux/mtd/onenand.h  (mode:100644)=0A=
@@ -0,0 +1,147 @@=0A=
+/*=0A=
+ *  linux/include/linux/mtd/onenand.h=0A=
+ *=0A=
+ *  Copyright (C) 2005 Samsung Electronics=0A=
+ *  Kyungmin Park <kyungmin.park@samsung.com>=0A=
+ *=0A=
+ * This program is free software; you can redistribute it and/or modify=0A=
+ * it under the terms of the GNU General Public License version 2 as=0A=
+ * published by the Free Software Foundation.=0A=
+ */=0A=
+=0A=
+#ifndef __LINUX_MTD_ONENAND_H=0A=
+#define __LINUX_MTD_ONENAND_H=0A=
+=0A=
+#include <linux/config.h>=0A=
+#include <linux/kernel.h>=0A=
+#include <linux/spinlock.h>=0A=
+#include <linux/mtd/mtd.h>=0A=
+#include <linux/mtd/onenand_regs.h>=0A=
+=0A=
+#define MAX_BUFFERRAM		2=0A=
+=0A=
+/* Scan and identify a OneNAND device */=0A=
+extern int onenand_scan(struct mtd_info *mtd, int max_chips);=0A=
+/* Free resources held by the OneNAND device */=0A=
+extern void onenand_release(struct mtd_info *mtd);=0A=
+=0A=
+/* OneNAND BufferRAM */=0A=
+enum {=0A=
+	BOOTRAM,=0A=
+	DATARAM,=0A=
+	SPARERAM,=0A=
+};=0A=
+=0A=
+/**=0A=
+ * onenand_state_t - chip states=0A=
+ * Enumeration for OneNAND flash chip state=0A=
+ */=0A=
+typedef enum {=0A=
+	FL_READY,=0A=
+	FL_READING,=0A=
+	FL_WRITING,=0A=
+	FL_ERASING,=0A=
+	FL_SYNCING,=0A=
+	FL_UNLOCKING,=0A=
+	FL_LOCKING,=0A=
+} onenand_state_t;=0A=
+=0A=
+/**=0A=
+ * struct onenand_bufferram - OneNAND BufferRAM Data=0A=
+ * @param block		block number in BufferRAM=0A=
+ * @param page		page number in BufferRAM=0A=
+ * @param valid		valid flag=0A=
+ */=0A=
+struct onenand_bufferram {=0A=
+	int block;=0A=
+	int page;=0A=
+	int valid;=0A=
+};=0A=
+=0A=
+/**=0A=
+ * struct onenand_chip - OneNAND Private Flash Chip Data=0A=
+ * @param base		[BOARDSPECIFIC] address to access OneNAND=0A=
+ * @param chipsize	[INTERN] the size of one chip for multichip arrays=0A=
+ * @param device_id	[INTERN] device ID=0A=
+ * @param verstion_id	[INTERN] version ID=0A=
+ * @param options	[BOARDSPECIFIC] various chip options. They can partly =
be set to inform onenand_scan about=0A=
+ * @param erase_shift	[INTERN] number of address bits in a block=0A=
+ * @param page_shift	[INTERN] number of address bits in a page=0A=
+ * @param ppb_shift	[INTERN] number of address bits in a pages per block=0A=
+ * @param page_mask	[INTERN] a page per block mask=0A=
+ * @param bufferam_index	[INTERN] BufferRAM index=0A=
+ * @param bufferam	[INTERN] BufferRAM info=0A=
+ * @param command	[REPLACEABLE] hardwarespecific function for writing =
commands to the chip=0A=
+ * @param wait		[REPLACEABLE] hardwarespecific function for wait on =
ready=0A=
+ * @param read_bufferram	[REPLACEABLE] hardwarespecific function for =
BufferRAM Area=0A=
+ * @param write_bufferram	[REPLACEABLE] hardwarespecific function for =
BufferRAM Area=0A=
+ * @param chip_lock	[INTERN] spinlock used to protect access to this =
structure and the chip=0A=
+ * @param wq		[INTERN] wait queue to sleep on if a OneNAND operation is =
in progress=0A=
+ * @param state		[INTERN] the current state of the OneNAND device=0A=
+ * @param autooob	[REPLACEABLE] the default (auto)placement scheme=0A=
+ * @param priv		[OPTIONAL] pointer to private chip date=0A=
+ */=0A=
+struct onenand_chip {=0A=
+	void __iomem		*base;=0A=
+	unsigned int		chipsize;=0A=
+	unsigned int		device_id;=0A=
+	unsigned int		version_id;=0A=
+	unsigned int		options;=0A=
+=0A=
+	unsigned int		erase_shift;=0A=
+	unsigned int		page_shift;=0A=
+	unsigned int		ppb_shift;	/* Pages per block shift */=0A=
+	unsigned int		page_mask;=0A=
+=0A=
+	unsigned int		bufferram_index;=0A=
+	struct onenand_bufferram	bufferram[MAX_BUFFERRAM];=0A=
+=0A=
+	int (*command)(struct mtd_info *mtd, int cmd, loff_t address, size_t =
len);=0A=
+	int (*wait)(struct mtd_info *mtd, int state);=0A=
+	int (*read_bufferram)(struct mtd_info *mtd, int area,=0A=
+			unsigned char *buffer, int offset, size_t count);=0A=
+	int (*write_bufferram)(struct mtd_info *mtd, int area,=0A=
+			const unsigned char *buffer, int offset, size_t count);=0A=
+=0A=
+	spinlock_t		chip_lock;=0A=
+	wait_queue_head_t	wq;=0A=
+	onenand_state_t		state;=0A=
+=0A=
+	struct nand_oobinfo	*autooob;=0A=
+=0A=
+	void			*priv;=0A=
+};=0A=
+=0A=
+#define ONENAND_CURRENT_BUFFERRAM(this)		(this->bufferram_index)=0A=
+#define ONENAND_NEXT_BUFFERRAM(this)		(this->bufferram_index ^ 1)=0A=
+#define ONENAND_SET_NEXT_BUFFERRAM(this)	(this->bufferram_index ^=3D 1)=0A=
+=0A=
+/*=0A=
+ * Macros to access the OneNAND IO region=0A=
+ */=0A=
+#define onenand_readw(a)		readw(a)=0A=
+#define onenand_writew(v,a)		writew(v, a)=0A=
+=0A=
+/*=0A=
+ * Options bits=0A=
+ */=0A=
+#define ONENAND_CONT_LOCK		(0x0001)=0A=
+=0A=
+=0A=
+/*=0A=
+ * OneNAND Flash Manufacturer ID Codes=0A=
+ */=0A=
+#define ONENAND_MFR_SAMSUNG	0xec=0A=
+#define ONENAND_MFR_UNKNOWN	0x00=0A=
+=0A=
+/**=0A=
+ * struct nand_manufacturers - NAND Flash Manufacturer ID Structure=0A=
+ * @param name:		Manufacturer name=0A=
+ * @param id:		manufacturer ID code of device.=0A=
+*/=0A=
+struct onenand_manufacturers {=0A=
+        int id;=0A=
+        char *name;=0A=
+};=0A=
+=0A=
+#endif	/* __LINUX_MTD_ONENAND_H */=0A=
Index: include/linux/mtd/onenand_regs.h=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
--- /dev/null  (tree:4b825dc642cb6eb9a060e54bf8d69288fbee4904)=0A=
+++ uncommitted/include/linux/mtd/onenand_regs.h  (mode:100644)=0A=
@@ -0,0 +1,167 @@=0A=
+/*=0A=
+ *  linux/include/linux/mtd/onenand_regs.h=0A=
+ *=0A=
+ *  OneNAND Register header file=0A=
+ *=0A=
+ *  Copyright (C) 2005 Samsung Electronics=0A=
+ *=0A=
+ * This program is free software; you can redistribute it and/or modify=0A=
+ * it under the terms of the GNU General Public License version 2 as=0A=
+ * published by the Free Software Foundation.=0A=
+ */=0A=
+=0A=
+#ifndef __ONENAND_REG_H=0A=
+#define __ONENAND_REG_H=0A=
+=0A=
+/* Memory Address Map Translation (Word order) */=0A=
+#define ONENAND_MEMORY_MAP(x)		((x) << 1)=0A=
+=0A=
+/*=0A=
+ * External BufferRAM area=0A=
+ */=0A=
+#define	ONENAND_BOOTRAM			ONENAND_MEMORY_MAP(0x0000)=0A=
+#define	ONENAND_DATARAM			ONENAND_MEMORY_MAP(0x0200)=0A=
+#define	ONENAND_SPARERAM		ONENAND_MEMORY_MAP(0x8010)=0A=
+=0A=
+/*=0A=
+ * OneNAND Registers=0A=
+ */=0A=
+#define ONENAND_REG_MANUFACTURER_ID	ONENAND_MEMORY_MAP(0xF000)=0A=
+#define ONENAND_REG_DEVICE_ID		ONENAND_MEMORY_MAP(0xF001)=0A=
+#define ONENAND_REG_VERSION_ID		ONENAND_MEMORY_MAP(0xF002)=0A=
+#define ONENAND_REG_DATA_BUFFER_SIZE	ONENAND_MEMORY_MAP(0xF003)=0A=
+#define ONENAND_REG_BOOT_BUFFER_SIZE	ONENAND_MEMORY_MAP(0xF004)=0A=
+#define ONENAND_REG_NUM_BUFFERS		ONENAND_MEMORY_MAP(0xF005)=0A=
+#define ONENAND_REG_TECHNOLOGY		ONENAND_MEMORY_MAP(0xF006)=0A=
+=0A=
+#define ONENAND_REG_START_ADDRESS1	ONENAND_MEMORY_MAP(0xF100)=0A=
+#define ONENAND_REG_START_ADDRESS2	ONENAND_MEMORY_MAP(0xF101)=0A=
+#define ONENAND_REG_START_ADDRESS3	ONENAND_MEMORY_MAP(0xF102)=0A=
+#define ONENAND_REG_START_ADDRESS4	ONENAND_MEMORY_MAP(0xF103)=0A=
+#define ONENAND_REG_START_ADDRESS5	ONENAND_MEMORY_MAP(0xF104)=0A=
+#define ONENAND_REG_START_ADDRESS6	ONENAND_MEMORY_MAP(0xF105)=0A=
+#define ONENAND_REG_START_ADDRESS7	ONENAND_MEMORY_MAP(0xF106)=0A=
+#define ONENAND_REG_START_ADDRESS8	ONENAND_MEMORY_MAP(0xF107)=0A=
+=0A=
+#define ONENAND_REG_START_BUFFER	ONENAND_MEMORY_MAP(0xF200)=0A=
+#define ONENAND_REG_COMMAND		ONENAND_MEMORY_MAP(0xF220)=0A=
+#define ONENAND_REG_SYS_CFG1		ONENAND_MEMORY_MAP(0xF221)=0A=
+#define ONENAND_REG_SYS_CFG2		ONENAND_MEMORY_MAP(0xF222)=0A=
+#define ONENAND_REG_CTRL_STATUS		ONENAND_MEMORY_MAP(0xF240)=0A=
+#define ONENAND_REG_INTERRUPT		ONENAND_MEMORY_MAP(0xF241)=0A=
+#define ONENAND_REG_START_BLOCK_ADDRESS	ONENAND_MEMORY_MAP(0xF24C)=0A=
+#define ONENAND_REG_END_BLOCK_ADDRESS	ONENAND_MEMORY_MAP(0xF24D)=0A=
+#define ONENAND_REG_WP_STATUS		ONENAND_MEMORY_MAP(0xF24E)=0A=
+=0A=
+#define ONENAND_REG_ECC_STATUS		ONENAND_MEMORY_MAP(0xFF00)=0A=
+#define ONENAND_REG_ECC_M0		ONENAND_MEMORY_MAP(0xFF01)=0A=
+#define ONENAND_REG_ECC_S0		ONENAND_MEMORY_MAP(0xFF02)=0A=
+#define ONENAND_REG_ECC_M1		ONENAND_MEMORY_MAP(0xFF03)=0A=
+#define ONENAND_REG_ECC_S1		ONENAND_MEMORY_MAP(0xFF04)=0A=
+#define ONENAND_REG_ECC_M2		ONENAND_MEMORY_MAP(0xFF05)=0A=
+#define ONENAND_REG_ECC_S2		ONENAND_MEMORY_MAP(0xFF06)=0A=
+#define ONENAND_REG_ECC_M3		ONENAND_MEMORY_MAP(0xFF07)=0A=
+#define ONENAND_REG_ECC_S3		ONENAND_MEMORY_MAP(0xFF08)=0A=
+=0A=
+/*=0A=
+ * Device ID Register F001h (R)=0A=
+ */=0A=
+#define ONENAND_DEVICE_DENSITY_SHIFT	(4)=0A=
+#define ONENAND_DEVICE_IS_DDP		(1 << 3)=0A=
+#define ONENAND_DEVICE_IS_DEMUX		(1 << 2)=0A=
+#define ONENAND_DEVICE_VCC_MASK		(0x3)=0A=
+=0A=
+#define ONENAND_DEVICE_DENSITY_512Mb	(0x002)=0A=
+=0A=
+/*=0A=
+ * Version ID Register F002h (R)=0A=
+ */=0A=
+#define ONENAND_VERSION_PROCESS_SHIFT	(8)=0A=
+=0A=
+/*=0A=
+ * Start Address 1 F100h (R/W)=0A=
+ */=0A=
+#define ONENAND_DDP_SHIFT		(15)=0A=
+=0A=
+/*=0A=
+ * Start Address 8 F107h (R/W)=0A=
+ */=0A=
+#define ONENAND_FPA_MASK		(0x3f)=0A=
+#define ONENAND_FPA_SHIFT		(2)=0A=
+#define ONENAND_FSA_MASK		(0x03)=0A=
+=0A=
+/*=0A=
+ * Start Buffer Register F200h (R/W)=0A=
+ */=0A=
+#define ONENAND_BSA_MASK		(0x03)=0A=
+#define ONENAND_BSA_SHIFT		(8)=0A=
+#define ONENAND_BSA_BOOTRAM		(0 << 2)=0A=
+#define ONENAND_BSA_DATARAM0		(2 << 2)=0A=
+#define ONENAND_BSA_DATARAM1		(3 << 2)=0A=
+#define ONENAND_BSC_MASK		(0x03)=0A=
+=0A=
+/*=0A=
+ * Command Register F220h (R/W)=0A=
+ */=0A=
+#define ONENAND_CMD_READ		(0x00)=0A=
+#define ONENAND_CMD_READOOB		(0x13)=0A=
+#define ONENAND_CMD_PROG		(0x80)=0A=
+#define ONENAND_CMD_PROGOOB		(0x1A)=0A=
+#define ONENAND_CMD_UNLOCK		(0x23)=0A=
+#define ONENAND_CMD_LOCK		(0x2A)=0A=
+#define ONENAND_CMD_LOCK_TIGHT		(0x2C)=0A=
+#define ONENAND_CMD_ERASE		(0x94)=0A=
+#define ONENAND_CMD_RESET		(0xF0)=0A=
+#define ONENAND_CMD_READID		(0x90)=0A=
+=0A=
+/* NOTE: Those are not *REAL* commands */=0A=
+#define ONENAND_CMD_BUFFERRAM		(0x1978)=0A=
+=0A=
+/*=0A=
+ * System Configuration 1 Register F221h (R, R/W)=0A=
+ */=0A=
+#define ONENAND_SYS_CFG1_SYNC_READ	(1 << 15)=0A=
+#define ONENAND_SYS_CFG1_BRL		(1 << 12)=0A=
+#define ONENAND_SYS_CFG1_BL		(1 << 9)=0A=
+#define ONENAND_SYS_CFG1_NO_ECC		(1 << 8)=0A=
+#define ONENAND_SYS_CFG1_RDY		(1 << 7)=0A=
+#define ONENAND_SYS_CFG1_INT		(1 << 6)=0A=
+#define ONENAND_SYS_CFG1_IOBE		(1 << 5)=0A=
+#define ONENAND_SYS_CFG1_RDY_CONF	(1 << 4)=0A=
+=0A=
+/*=0A=
+ * Controller Status Register F240h (R)=0A=
+ */=0A=
+#define ONENAND_CTRL_ONGO		(1 << 15)=0A=
+#define ONENAND_CTRL_LOCK		(1 << 14)=0A=
+#define ONENAND_CTRL_LOAD		(1 << 13)=0A=
+#define ONENAND_CTRL_PROGRAM		(1 << 12)=0A=
+#define ONENAND_CTRL_ERASE		(1 << 11)=0A=
+#define ONENAND_CTRL_ERROR		(1 << 10)=0A=
+#define ONENAND_CTRL_RSTB		(1 << 7)=0A=
+=0A=
+/*=0A=
+ * Interrupt Status Register F241h (R)=0A=
+ */=0A=
+#define ONENAND_INT_MASTER		(1 << 15)=0A=
+#define ONENAND_INT_READ		(1 << 7)=0A=
+#define ONENAND_INT_WRITE		(1 << 6)=0A=
+#define ONENAND_INT_ERASE		(1 << 5)=0A=
+#define ONENAND_INT_RESET		(1 << 4)=0A=
+#define ONENAND_INT_CLEAR		(0 << 0)=0A=
+=0A=
+/*=0A=
+ * NAND Flash Write Protection Status Register F24Eh (R)=0A=
+ */=0A=
+#define ONENAND_WP_US			(1 << 2)=0A=
+#define ONENAND_WP_LS			(1 << 1)=0A=
+#define ONENAND_WP_LTS			(1 << 0)=0A=
+=0A=
+/*=0A=
+ * ECC Status Reigser FF00h (R)=0A=
+ */=0A=
+#define ONENAND_ECC_1BIT		(1 << 0)=0A=
+#define ONENAND_ECC_2BIT		(1 << 1)=0A=
+#define ONENAND_ECC_2BIT_ALL		(0xAAAA)=0A=
+=0A=
+#endif	/* __ONENAND_REG_H */=0A=

--Boundary_(ID_Tn3o+r/lI21XqfYO+DPLEw)--
