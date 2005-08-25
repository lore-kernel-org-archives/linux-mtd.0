Received: from mailout2.samsung.com ([203.254.224.25])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E8RIB-00031w-4p
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2005 19:38:05 -0400
Received: from ep_mmp1 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0ILS00GUNXN3RR@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 26 Aug 2005 08:37:51 +0900 (KST)
Received: from july7 ([168.219.213.193])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0ILS00E1DXN24U@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 26 Aug 2005 08:37:51 +0900 (KST)
Date: Fri, 26 Aug 2005 08:37:51 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
In-reply-to: <430D873B.1050108@in2soft.de>
To: 'Bernhard Priewasser' <bernhard.priewasser@in2soft.de>
Message-id: <0ILS00E1EXN24U@mmp1.samsung.com>
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_7xGYIUDsATwziC2M4dGl5A)"
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

--Boundary_(ID_7xGYIUDsATwziC2M4dGl5A)
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT

I'm sorry to bother you

It's my mistake. I'm not delete block, and page parameters.
At first implementation I used the block and page address scheme instead of
virtual address.

Simply delete block and page parameters.

And here's one total patch including previous three patches plus some minor
patches.

If do you have any question. Please let me know

Thanks

Kyungmin Park

> -----Original Message-----
> From: Bernhard Priewasser [mailto:bernhard.priewasser@in2soft.de] 
> Sent: Thursday, August 25, 2005 5:54 PM
> To: kyungmin.park@samsung.com; linux-mtd@lists.infradead.org
> Subject: Re: [PATCH] OneNAND MTD support
> 
> Hi Kyungmin,
> 
> when turning the "Verify OneNAND page write" on (make 
> xconfig), OneNAND 
> module does not compile:
> 
> drivers/mtd/onenand/onenand_base.c: In function `onenand_write_ecc':
> drivers/mtd/onenand/onenand_base.c:819: error: `block' 
> undeclared (first 
> use in this function)
> drivers/mtd/onenand/onenand_base.c:819: error: (Each undeclared 
> identifier is reported only once
> drivers/mtd/onenand/onenand_base.c:819: error: for each function it 
> appears in.)
> drivers/mtd/onenand/onenand_base.c:819: error: `page' 
> undeclared (first 
> use in this function)
> drivers/mtd/onenand/onenand_base.c: In function `onenand_writev_ecc':
> drivers/mtd/onenand/onenand_base.c:1028: error: `block' undeclared 
> (first use in this function)
> drivers/mtd/onenand/onenand_base.c:1028: error: `page' 
> undeclared (first 
> use in this function)
> make[3]: *** [drivers/mtd/onenand/onenand_base.o] Error 1
> make[2]: *** [drivers/mtd/onenand] Error 2
> make[1]: *** [drivers/mtd] Error 2
> make: *** [drivers] Error 2
> 
> Where should onenand_write_ecc() get block and page from?
> 
> Bernhard
> 
> 

--Boundary_(ID_7xGYIUDsATwziC2M4dGl5A)
Content-type: application/octet-stream; name=onenand-050826.patch
Content-transfer-encoding: quoted-printable
Content-disposition: attachment; filename=onenand-050826.patch

diff --git a/drivers/mtd/onenand/Kconfig b/drivers/mtd/onenand/Kconfig=0A=
--- a/drivers/mtd/onenand/Kconfig=0A=
+++ b/drivers/mtd/onenand/Kconfig=0A=
@@ -29,4 +29,10 @@ config MTD_ONENAND_OMAP=0A=
 	help=0A=
 	  Support for OneNAND flash on TI OMAP board.=0A=
 =0A=
+config MTD_ONENAND_SYNC_READ=0A=
+	bool "OneNAND Sync. Burst Read Support"=0A=
+	depends on ARCH_OMAP=0A=
+	help=0A=
+	  This enables support for Sync. Burst Read.=0A=
+=0A=
 endmenu=0A=
diff --git a/drivers/mtd/onenand/Makefile b/drivers/mtd/onenand/Makefile=0A=
--- a/drivers/mtd/onenand/Makefile=0A=
+++ b/drivers/mtd/onenand/Makefile=0A=
@@ -3,7 +3,9 @@=0A=
 #=0A=
 =0A=
 # Core functionality.=0A=
-obj-$(CONFIG_MTD_ONENAND)		+=3D onenand_base.o=0A=
+obj-$(CONFIG_MTD_ONENAND)		+=3D onenand.o=0A=
 =0A=
 # Board specific.=0A=
 obj-$(CONFIG_MTD_ONENAND_OMAP)		+=3D omap-onenand.o=0A=
+=0A=
+onenand-objs =3D onenand_base.o onenand_bbt.o=0A=
diff --git a/drivers/mtd/onenand/omap-onenand.c =
b/drivers/mtd/onenand/omap-onenand.c=0A=
--- a/drivers/mtd/onenand/omap-onenand.c=0A=
+++ b/drivers/mtd/onenand/omap-onenand.c=0A=
@@ -4,174 +4,143 @@=0A=
  *  Copyright (c) 2005 Samsung Electronics=0A=
  *  Kyungmin Park <kyungmin.park@samsung.com>=0A=
  *=0A=
- *  Derived from linux/drivers/mtd/nand/omap-nand-flash.c=0A=
- *=0A=
  * This program is free software; you can redistribute it and/or modify=0A=
  * it under the terms of the GNU General Public License version 2 as=0A=
  * published by the Free Software Foundation.=0A=
  *=0A=
  *  Overview:=0A=
- *   This is a device driver for the OneNAND flash device for TI OMAP =
boards.=0A=
+ *   This is a device driver for the OneNAND flash for OMAP boards.=0A=
  */=0A=
 =0A=
-#include <linux/slab.h>=0A=
-#include <linux/init.h>=0A=
+#include <linux/device.h>=0A=
 #include <linux/module.h>=0A=
+#include <linux/init.h>=0A=
 #include <linux/mtd/mtd.h>=0A=
 #include <linux/mtd/onenand.h>=0A=
 #include <linux/mtd/partitions.h>=0A=
 =0A=
 #include <asm/io.h>=0A=
-#include <asm/arch/hardware.h>=0A=
-#include <asm/arch/tc.h>=0A=
-#include <asm/sizes.h>=0A=
-=0A=
-#define OMAP_ONENAND_FLASH_START1	OMAP_CS2A_PHYS=0A=
-#define OMAP_ONENAND_FLASH_START2	OMAP_CS0_PHYS=0A=
-/*=0A=
- * MTD structure for OMAP board=0A=
- */=0A=
-static struct mtd_info *omap_onenand_mtd =3D NULL;=0A=
+#include <asm/mach/flash.h>=0A=
 =0A=
-/*=0A=
- * Define partitions for flash devices=0A=
- */=0A=
+#define DRIVER_NAME	"onenand"=0A=
 =0A=
-#ifdef CONFIG_MTD_PARTITIONS=0A=
-static struct mtd_partition static_partition[] =3D {=0A=
-	{=0A=
-		.name		=3D "X-Loader + U-Boot",=0A=
-		.offset		=3D 0,=0A=
-		.size		=3D SZ_128K,=0A=
-		.mask_flags	=3D MTD_WRITEABLE	/* force read-only */=0A=
- 	},=0A=
-	{=0A=
-		.name		=3D "U-Boot Environment",=0A=
-		.offset		=3D MTDPART_OFS_APPEND,=0A=
-		.size		=3D SZ_128K,=0A=
-		.mask_flags	=3D MTD_WRITEABLE	/* force read-only */=0A=
- 	},=0A=
-	{=0A=
-		.name		=3D "kernel",=0A=
-		.offset		=3D MTDPART_OFS_APPEND,=0A=
-		.size		=3D 2 * SZ_1M=0A=
-	},=0A=
-	{=0A=
-		.name		=3D "filesystem0",=0A=
-		.offset		=3D MTDPART_OFS_APPEND,=0A=
-		.size		=3D SZ_16M,=0A=
-	},=0A=
-	{=0A=
-		.name		=3D "filesystem1",=0A=
-		.offset		=3D MTDPART_OFS_APPEND,=0A=
-		.size		=3D MTDPART_SIZ_FULL,=0A=
-	},=0A=
-};=0A=
-=0A=
-const char *part_probes[] =3D { "cmdlinepart", NULL,  };=0A=
 =0A=
+#ifdef CONFIG_MTD_PARTITIONS=0A=
+static const char *part_probes[] =3D { "cmdlinepart", NULL,  };=0A=
 #endif=0A=
 =0A=
-/* Scan to find existance of the device at base.=0A=
-   This also allocates oob and data internal buffers */=0A=
-static char onenand_name[] =3D "onenand";=0A=
+struct omap_onenand_info {=0A=
+	struct mtd_info		mtd;=0A=
+	struct mtd_partition	*parts;=0A=
+	struct onenand_chip	onenand;=0A=
+};=0A=
 =0A=
-/*=0A=
- * Main initialization routine=0A=
- */=0A=
-static int __init omap_onenand_init (void)=0A=
+static int __devinit omap_onenand_probe(struct device *dev)=0A=
 {=0A=
-	struct onenand_chip *this;=0A=
-	struct mtd_partition *dynamic_partition =3D 0;=0A=
-	int err =3D 0;=0A=
-=0A=
-	/* Allocate memory for MTD device structure and private data */=0A=
-	omap_onenand_mtd =3D kmalloc (sizeof(struct mtd_info) + sizeof (struct =
onenand_chip),=0A=
-				GFP_KERNEL);=0A=
-	if (!omap_onenand_mtd) {=0A=
-		printk (KERN_WARNING "Unable to allocate OneNAND MTD device =
structure.\n");=0A=
-		err =3D -ENOMEM;=0A=
-		goto out;=0A=
+	struct omap_onenand_info *info;=0A=
+	struct platform_device *pdev =3D to_platform_device(dev);=0A=
+	struct onenand_platform_data *pdata =3D pdev->dev.platform_data;=0A=
+	struct resource *res =3D pdev->resource;=0A=
+	unsigned long size =3D res->end - res->start + 1;=0A=
+	int err;=0A=
+=0A=
+	info =3D kmalloc(sizeof(struct omap_onenand_info), GFP_KERNEL);=0A=
+	if (!info)=0A=
+		return -ENOMEM;=0A=
+=0A=
+	memset(info, 0, sizeof(struct omap_onenand_info));=0A=
+=0A=
+	if (!request_mem_region(res->start, size, dev->driver->name)) {=0A=
+		err =3D -EBUSY;=0A=
+		goto out_free_info;=0A=
 	}=0A=
 =0A=
-	/* Get pointer to private data */=0A=
-	this =3D (struct onenand_chip *) (&omap_onenand_mtd[1]);=0A=
+	info->onenand.base =3D ioremap(res->start, size);=0A=
+	if (!info->onenand.base) {=0A=
+		err =3D -ENOMEM;=0A=
+		goto out_release_mem_region;=0A=
+	}=0A=
 =0A=
-	/* Initialize structures */=0A=
-	memset((char *) omap_onenand_mtd, 0, sizeof(struct mtd_info) + =
sizeof(struct onenand_chip));=0A=
+	info->onenand.mmcontrol =3D pdata->mmcontrol;=0A=
 =0A=
-	/* Link the private data with the MTD structure */=0A=
-	omap_onenand_mtd->priv =3D this;=0A=
+	info->mtd.name =3D pdev->dev.bus_id;=0A=
+	info->mtd.priv =3D &info->onenand;=0A=
+	info->mtd.owner =3D THIS_MODULE;=0A=
 =0A=
-        /* try the first address */=0A=
-	this->base =3D ioremap(OMAP_ONENAND_FLASH_START1, SZ_128K);=0A=
-	omap_onenand_mtd->name =3D onenand_name;=0A=
-	if (onenand_scan(omap_onenand_mtd, 1)){=0A=
-		/* try the second address */=0A=
-		iounmap(this->base);=0A=
-		this->base =3D ioremap(OMAP_ONENAND_FLASH_START2, SZ_128K);=0A=
-		if (onenand_scan(omap_onenand_mtd, 1)) {=0A=
-			iounmap(this->base);=0A=
-                        err =3D -ENXIO;=0A=
-                        goto out_mtd;=0A=
-		}=0A=
+	if (onenand_scan(&info->mtd, 1)) {=0A=
+		err =3D -ENXIO;=0A=
+		goto out_iounmap;=0A=
 	}=0A=
 =0A=
-	/* Register the partitions */=0A=
-	switch (omap_onenand_mtd->size) {=0A=
-	case SZ_128M:=0A=
-	case SZ_64M:=0A=
-	case SZ_32M:=0A=
 #ifdef CONFIG_MTD_PARTITIONS=0A=
-		err =3D parse_mtd_partitions(omap_onenand_mtd, part_probes,=0A=
-					&dynamic_partition, 0);=0A=
-		if (err > 0)=0A=
-			err =3D add_mtd_partitions(omap_onenand_mtd,=0A=
-					dynamic_partition, err);=0A=
-		else if (1)=0A=
-			err =3D add_mtd_partitions(omap_onenand_mtd,=0A=
-					static_partition,=0A=
-					ARRAY_SIZE(static_partition));=0A=
-		else=0A=
+	err =3D parse_mtd_partitions(&info->mtd, part_probes, &info->parts, 0);=0A=
+	if (err > 0)=0A=
+		add_mtd_partitions(&info->mtd, info->parts, err);=0A=
+	else if (err < 0 && pdata->parts)=0A=
+		add_mtd_partitions(&info->mtd, pdata->parts, pdata->nr_parts);=0A=
+	else=0A=
 #endif=0A=
-			err =3D add_mtd_device(omap_onenand_mtd);=0A=
-		if (err)=0A=
-			goto out_buf;=0A=
-		break;=0A=
+		err =3D add_mtd_device(&info->mtd);=0A=
 =0A=
-	default:=0A=
-		printk(KERN_WARNING "Unsupported OneNAND device\n");=0A=
-		err =3D -ENXIO;=0A=
-		goto out_buf;=0A=
-	}=0A=
+	dev_set_drvdata(&pdev->dev, info);=0A=
 =0A=
 	return 0;=0A=
 =0A=
-out_buf:=0A=
-	onenand_release(omap_onenand_mtd);=0A=
-	iounmap(this->base);=0A=
-out_mtd:=0A=
-	kfree(omap_onenand_mtd);=0A=
-out:=0A=
+out_iounmap:=0A=
+	iounmap(info->onenand.base);=0A=
+out_release_mem_region:=0A=
+	release_mem_region(res->start, size);=0A=
+out_free_info:=0A=
+	kfree(info);=0A=
+=0A=
 	return err;=0A=
 }=0A=
 =0A=
-/*=0A=
- * Clean up routine=0A=
- */=0A=
-static void __exit omap_onenand_cleanup (void)=0A=
+static int __devexit omap_onenand_remove(struct device *dev)=0A=
+{=0A=
+	struct platform_device *pdev =3D to_platform_device(dev);=0A=
+	struct omap_onenand_info *info =3D dev_get_drvdata(&pdev->dev);=0A=
+	struct resource *res =3D pdev->resource;=0A=
+	unsigned long size =3D res->end - res->start + 1;=0A=
+=0A=
+	dev_set_drvdata(&pdev->dev, NULL);=0A=
+=0A=
+	if (info) {=0A=
+		if (info->parts)=0A=
+			del_mtd_partitions(&info->mtd);=0A=
+		else=0A=
+			del_mtd_device(&info->mtd);=0A=
+=0A=
+		onenand_release(&info->mtd);=0A=
+		release_mem_region(res->start, size);=0A=
+		iounmap(info->onenand.base);=0A=
+		kfree(info);=0A=
+	}=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+static struct device_driver omap_onenand_driver =3D {=0A=
+	.name		=3D DRIVER_NAME,=0A=
+	.bus		=3D &platform_bus_type,=0A=
+	.probe		=3D omap_onenand_probe,=0A=
+	.remove		=3D __devexit_p(omap_onenand_remove),=0A=
+};=0A=
+=0A=
+MODULE_ALIAS(DRIVER_NAME);=0A=
+=0A=
+static int __init omap_onenand_init(void)=0A=
 {=0A=
-	struct onenand_chip *this =3D omap_onenand_mtd->priv;=0A=
+	return driver_register(&omap_onenand_driver);=0A=
+}=0A=
 =0A=
-	/* onenand_release frees MTD partitions, MTD structure=0A=
-	   and onenand internal buffers */=0A=
-	onenand_release(omap_onenand_mtd);=0A=
-	iounmap(this->base);=0A=
-	kfree(omap_onenand_mtd);=0A=
+static void __exit omap_onenand_exit(void)=0A=
+{=0A=
+	driver_unregister(&omap_onenand_driver);=0A=
 }=0A=
 =0A=
 module_init(omap_onenand_init);=0A=
-module_exit(omap_onenand_cleanup);=0A=
+module_exit(omap_onenand_exit);=0A=
 =0A=
 MODULE_LICENSE("GPL");=0A=
 MODULE_AUTHOR("Kyungmin Park <kyungmin.park@samsung.com>");=0A=
diff --git a/drivers/mtd/onenand/onenand_base.c =
b/drivers/mtd/onenand/onenand_base.c=0A=
--- a/drivers/mtd/onenand/onenand_base.c=0A=
+++ b/drivers/mtd/onenand/onenand_base.c=0A=
@@ -311,19 +311,21 @@ static int onenand_wait(struct mtd_info =0A=
 	ctrl =3D this->read_word(this->base + ONENAND_REG_CTRL_STATUS);=0A=
 =0A=
 	if (ctrl & ONENAND_CTRL_ERROR) {=0A=
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: controller error =3D 0x%04x", =
ctrl);=0A=
-		return -EIO;=0A=
+		/* It maybe occur at initial bad block */=0A=
+		DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: controller error =3D =
0x%04x\n", ctrl);=0A=
+		/* Clear other interrupt bits for preventing ECC error */=0A=
+		interrupt &=3D ONENAND_INT_MASTER;=0A=
 	}=0A=
 =0A=
 	if (ctrl & ONENAND_CTRL_LOCK) {=0A=
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: it's locked error =3D 0x%04x", =
ctrl);=0A=
-		return -EIO;=0A=
+		DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: it's locked error =3D =
0x%04x\n", ctrl);=0A=
+		return -EACCES;=0A=
 	}=0A=
 =0A=
 	if (interrupt & ONENAND_INT_READ) {=0A=
 		ecc =3D this->read_word(this->base + ONENAND_REG_ECC_STATUS);=0A=
 		if (ecc & ONENAND_ECC_2BIT_ALL) {=0A=
-			DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: ECC error =3D 0x%04x", ecc);=0A=
+			DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: ECC error =3D 0x%04x\n", ecc);=0A=
 			return -EBADMSG;=0A=
 		}=0A=
 	}=0A=
@@ -379,6 +381,35 @@ static int onenand_read_bufferram(struct=0A=
 }=0A=
 =0A=
 /**=0A=
+ * onenand_sync_read_bufferram - [OneNAND Interface] Read the bufferram =
area with Sync. Burst mode=0A=
+ * @param mtd		MTD data structure=0A=
+ * @param area		BufferRAM area=0A=
+ * @param buffer	the databuffer to put/get data=0A=
+ * @param offset	offset to read from or write to=0A=
+ * @param count		number of bytes to read/write=0A=
+ *=0A=
+ * Read the BufferRAM area with Sync. Burst Mode=0A=
+ */=0A=
+static int onenand_sync_read_bufferram(struct mtd_info *mtd, int area,=0A=
+		unsigned char *buffer, int offset, size_t count)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	void __iomem *bufferram;=0A=
+=0A=
+	bufferram =3D this->base + area;=0A=
+=0A=
+	bufferram +=3D onenand_bufferram_offset(mtd, area);=0A=
+=0A=
+	this->mmcontrol(mtd, ONENAND_SYS_CFG1_SYNC_READ);=0A=
+=0A=
+	memcpy(buffer, bufferram + offset, count);=0A=
+=0A=
+	this->mmcontrol(mtd, 0);=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/**=0A=
  * onenand_write_bufferram - [OneNAND Interface] Write the bufferram =
area=0A=
  * @param mtd		MTD data structure=0A=
  * @param area		BufferRAM area=0A=
@@ -688,13 +719,11 @@ out:=0A=
  * onenand_verify_page - [GENERIC] verify the chip contents after a =
write=0A=
  * @param mtd		MTD device structure=0A=
  * @param buf		the databuffer to verify=0A=
- * @param block		block address=0A=
- * @param page		page address=0A=
  *=0A=
  * Check DataRAM area directly=0A=
  */=0A=
 static int onenand_verify_page(struct mtd_info *mtd, u_char *buf,=0A=
-	loff_t addr, int block, int page)=0A=
+	loff_t addr)=0A=
 {=0A=
 	struct onenand_chip *this =3D mtd->priv;=0A=
 	void __iomem *dataram0, *dataram1;=0A=
@@ -785,7 +814,7 @@ static int onenand_write_ecc(struct mtd_=0A=
 		written +=3D thislen;=0A=
 =0A=
 		/* Only check verify write turn on */=0A=
-		ret =3D onenand_verify_page(mtd, (u_char *) buf, to, block, page);=0A=
+		ret =3D onenand_verify_page(mtd, (u_char *) buf, to);=0A=
 		if (ret) {=0A=
 			DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_ecc: verify failed %d\n", =
ret);=0A=
 			goto out;=0A=
@@ -909,7 +938,7 @@ static int onenand_writev_ecc(struct mtd=0A=
 	u_char *eccbuf, struct nand_oobinfo *oobsel)=0A=
 {=0A=
 	struct onenand_chip *this =3D mtd->priv;=0A=
-	unsigned char buffer[mtd->oobblock], *pbuf;=0A=
+	unsigned char buffer[MAX_ONENAND_PAGESIZE], *pbuf;=0A=
 	size_t total_len, len;=0A=
 	int i, written =3D 0;=0A=
 	int ret =3D 0;=0A=
@@ -994,7 +1023,7 @@ static int onenand_writev_ecc(struct mtd=0A=
 =0A=
 =0A=
 		/* Only check verify write turn on */=0A=
-		ret =3D onenand_verify_page(mtd, (u_char *) pbuf, to, block, page);=0A=
+		ret =3D onenand_verify_page(mtd, (u_char *) pbuf, to);=0A=
 		if (ret) {=0A=
 			DEBUG(MTD_DEBUG_LEVEL0, "onenand_writev_ecc: verify failed %d\n", =
ret);=0A=
 			goto out;=0A=
@@ -1031,6 +1060,25 @@ static int onenand_writev(struct mtd_inf=0A=
 }=0A=
 =0A=
 /**=0A=
+ * onenand_block_checkbad - [GENERIC] Check if a block is marked bad=0A=
+ * @param mtd		MTD device structure=0A=
+ * @param ofs		offset from device start=0A=
+ * @param getchip	0, if the chip is already selected=0A=
+ * @param allowbbt	1, if its allowed to access the bbt area=0A=
+ *=0A=
+ * Check, if the block is bad. Either by reading the bad block table or=0A=
+ * calling of the scan function.=0A=
+ */=0A=
+static int onenand_block_checkbad(struct mtd_info *mtd, loff_t ofs, int =
getchip, int allowbbt)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	struct bbm_info *bbm =3D this->bbm;=0A=
+=0A=
+	/* Return info from the table */=0A=
+	return bbm->isbad_bbt(mtd, ofs, allowbbt);=0A=
+}=0A=
+=0A=
+/**=0A=
  * onenand_erase - [MTD Interface] erase block(s)=0A=
  * @param mtd		MTD device structure=0A=
  * @param instr		erase instruction=0A=
@@ -1080,7 +1128,12 @@ static int onenand_erase(struct mtd_info=0A=
 =0A=
 	while (len) {=0A=
 =0A=
-		/* TODO Check badblock */=0A=
+		/* Check if we have a bad block, we do not erase bad blocks */=0A=
+		if (onenand_block_checkbad(mtd, addr, 0, 0)) {=0A=
+			printk (KERN_WARNING "onenand_erase: attempt to erase a bad block at =
addr 0x%08x\n", (unsigned int) addr);=0A=
+			instr->state =3D MTD_ERASE_FAILED;=0A=
+			goto erase_exit;=0A=
+		}=0A=
 =0A=
 		this->command(mtd, ONENAND_CMD_ERASE, addr, block_size);=0A=
 =0A=
@@ -1132,34 +1185,70 @@ static void onenand_sync(struct mtd_info=0A=
 	onenand_release_device(mtd);=0A=
 }=0A=
 =0A=
+=0A=
 /**=0A=
  * onenand_block_isbad - [MTD Interface] Check whether the block at the =
given offset is bad=0A=
  * @param mtd		MTD device structure=0A=
  * @param ofs		offset relative to mtd start=0A=
+ *=0A=
+ * Check whether the block is bad=0A=
  */=0A=
 static int onenand_block_isbad(struct mtd_info *mtd, loff_t ofs)=0A=
 {=0A=
-	/*=0A=
-	 * TODO =0A=
-	 * 1. Bad block table (BBT)=0A=
-	 *   -> using NAND BBT to support JFFS2=0A=
-	 * 2. Bad block management (BBM)=0A=
-	 *   -> bad block replace scheme=0A=
-	 *=0A=
-	 * Currently we do nothing=0A=
-	 */=0A=
-	return 0;=0A=
+	/* Check for invalid offset */=0A=
+	if (ofs > mtd->size)=0A=
+		return -EINVAL;=0A=
+=0A=
+	return onenand_block_checkbad(mtd, ofs, 1, 0);=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_default_block_markbad - [DEFAULT] mark a block bad=0A=
+ * @param mtd		MTD device structure=0A=
+ * @param ofs		offset from device start=0A=
+ *=0A=
+ * This is the default implementation, which can be overridden by=0A=
+ * a hardware specific driver.=0A=
+ */=0A=
+static int onenand_default_block_markbad(struct mtd_info *mtd, loff_t =
ofs)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	struct bbm_info *bbm =3D this->bbm;=0A=
+	u_char buf[2] =3D {0, 0};=0A=
+	size_t retlen;=0A=
+	int block;=0A=
+=0A=
+	/* Get block number */=0A=
+	block =3D ((int) ofs) >> bbm->bbt_erase_shift;=0A=
+        if (bbm->bbt)=0A=
+                bbm->bbt[block >> 2] |=3D 0x01 << ((block & 0x03) << 1);=0A=
+=0A=
+        /* We write two bytes, so we dont have to mess with 16 bit =
access */=0A=
+        ofs +=3D mtd->oobsize + (bbm->badblockpos & ~0x01);=0A=
+        return mtd->write_oob(mtd, ofs , 2, &retlen, buf);=0A=
 }=0A=
 =0A=
 /**=0A=
  * onenand_block_markbad - [MTD Interface] Mark the block at the given =
offset as bad=0A=
  * @param mtd		MTD device structure=0A=
  * @param ofs		offset relative to mtd start=0A=
+ *=0A=
+ * Mark the block as bad=0A=
  */=0A=
 static int onenand_block_markbad(struct mtd_info *mtd, loff_t ofs)=0A=
 {=0A=
-	/* see above */=0A=
-	return 0;=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	int ret;=0A=
+=0A=
+	ret =3D onenand_block_isbad(mtd, ofs);=0A=
+	if (ret) {=0A=
+		/* If it was bad already, return success and do nothing */=0A=
+		if (ret > 0)=0A=
+			return 0;=0A=
+		return ret;=0A=
+	}=0A=
+=0A=
+	return this->block_markbad(mtd, ofs);=0A=
 }=0A=
 =0A=
 /**=0A=
@@ -1273,8 +1362,8 @@ static int onenand_check_maf(int manuf)=0A=
                         break;=0A=
         }=0A=
 =0A=
-        printk(KERN_DEBUG "OneNAND Manufacturer: %s\n",=0A=
-                onenand_manuf_ids[i].name);=0A=
+        printk(KERN_DEBUG "OneNAND Manufacturer: %s (0x%0x)\n",=0A=
+                onenand_manuf_ids[i].name, manuf);=0A=
 =0A=
         return (i !=3D ONENAND_MFR_UNKNOWN);=0A=
 }=0A=
@@ -1382,9 +1471,20 @@ int onenand_scan(struct mtd_info *mtd, i=0A=
 	if (!this->write_bufferram)=0A=
 		this->write_bufferram =3D onenand_write_bufferram;=0A=
 =0A=
+	if (!this->block_markbad)=0A=
+		this->block_markbad =3D onenand_default_block_markbad;=0A=
+	if (!this->scan_bbt)=0A=
+		this->scan_bbt =3D onenand_default_bbt;=0A=
+=0A=
 	if (onenand_probe(mtd))=0A=
 		return -ENXIO;=0A=
 =0A=
+	/* Set Sync. Burst Read after probing */=0A=
+	if (this->mmcontrol) {=0A=
+		printk(KERN_INFO "OneNAND Sync. Burst Read support\n");=0A=
+		this->read_bufferram =3D onenand_sync_read_bufferram;=0A=
+	}=0A=
+=0A=
 	this->state =3D FL_READY;=0A=
 	init_waitqueue_head(&this->wq);=0A=
 	spin_lock_init(&this->chip_lock);=0A=
@@ -1437,7 +1537,7 @@ int onenand_scan(struct mtd_info *mtd, i=0A=
 	/* Unlock whole block */=0A=
 	mtd->unlock(mtd, 0x0, this->chipsize);=0A=
 =0A=
-	return 0;=0A=
+	return this->scan_bbt(mtd);=0A=
 }=0A=
 =0A=
 /**=0A=
diff --git a/drivers/mtd/onenand/onenand_bbt.c =
b/drivers/mtd/onenand/onenand_bbt.c=0A=
new file mode 100644=0A=
--- /dev/null=0A=
+++ b/drivers/mtd/onenand/onenand_bbt.c=0A=
@@ -0,0 +1,246 @@=0A=
+/*=0A=
+ *  linux/drivers/mtd/onenand/onenand_bbt.c=0A=
+ *=0A=
+ *  Bad Block Table support for the OneNAND driver=0A=
+ *=0A=
+ *  Copyright(c) 2005 Samsung Electronics=0A=
+ *  Kyungmin Park <kyungmin.park@samsung.com>=0A=
+ *=0A=
+ *  Derived from nand_bbt.c=0A=
+ *=0A=
+ *  TODO:=0A=
+ *    Split BBT core and chip specific BBT.=0A=
+ */=0A=
+=0A=
+#include <linux/slab.h>=0A=
+#include <linux/mtd/mtd.h>=0A=
+#include <linux/mtd/onenand.h>=0A=
+#include <linux/mtd/compatmac.h>=0A=
+=0A=
+/**=0A=
+ * check_short_pattern - [GENERIC] check if a pattern is in the buffer=0A=
+ * @param buf		the buffer to search=0A=
+ * @param len		the length of buffer to search=0A=
+ * @param paglen	the pagelength=0A=
+ * @param td		search pattern descriptor=0A=
+ *=0A=
+ * Check for a pattern at the given place. Used to search bad block=0A=
+ * tables and good / bad block identifiers. Same as check_pattern, but=0A=
+ * no optional empty check and the pattern is expected to start=0A=
+ * at offset 0.=0A=
+ *=0A=
+ */=0A=
+static int check_short_pattern(uint8_t *buf, int len, int paglen, =
struct nand_bbt_descr *td)=0A=
+{=0A=
+	int i;=0A=
+	uint8_t *p =3D buf;=0A=
+=0A=
+	/* Compare the pattern */=0A=
+	for (i =3D 0; i < td->len; i++) {=0A=
+		if (p[i] !=3D td->pattern[i])=0A=
+			return -1;=0A=
+	}=0A=
+        return 0;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * create_bbt - [GENERIC] Create a bad block table by scanning the =
device=0A=
+ * @param mtd		MTD device structure=0A=
+ * @param buf		temporary buffer=0A=
+ * @param bd		descriptor for the good/bad block search pattern=0A=
+ * @param chip		create the table for a specific chip, -1 read all chips.=0A=
+ *              Applies only if NAND_BBT_PERCHIP option is set=0A=
+ *=0A=
+ * Create a bad block table by scanning the device=0A=
+ * for the given good/bad block identify pattern=0A=
+ */=0A=
+static int create_bbt(struct mtd_info *mtd, uint8_t *buf, struct =
nand_bbt_descr *bd, int chip)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	struct bbm_info *bbm =3D this->bbm;=0A=
+	int i, j, numblocks, len, scanlen;=0A=
+	int startblock;=0A=
+	loff_t from;=0A=
+	size_t readlen, ooblen;=0A=
+=0A=
+	printk(KERN_INFO "Scanning device for bad blocks\n");=0A=
+=0A=
+	len =3D 1;=0A=
+=0A=
+	/* We need only read few bytes from the OOB area */=0A=
+	scanlen =3D ooblen =3D 0;=0A=
+	readlen =3D bd->len;=0A=
+=0A=
+	/* chip =3D=3D -1 case only */=0A=
+	/* Note that numblocks is 2 * (real numblocks) here;=0A=
+	 * see i +=3D 2 below as it makses shifting and masking less painful=0A=
+	 */=0A=
+	numblocks =3D mtd->size >> (bbm->bbt_erase_shift - 1);=0A=
+	startblock =3D 0;=0A=
+	from =3D 0;=0A=
+=0A=
+	for (i =3D startblock; i < numblocks; ) {=0A=
+		int ret;=0A=
+=0A=
+		for (j =3D 0; j < len; j++) {=0A=
+			size_t retlen;=0A=
+=0A=
+			/* No need to read pages fully,=0A=
+			 * just read required OOB bytes */=0A=
+			ret =3D mtd->read_oob(mtd, from + j * mtd->oobblock + bd->offs,=0A=
+						readlen, &retlen, &buf[0]);=0A=
+=0A=
+			if (ret)=0A=
+				return ret;=0A=
+=0A=
+			if (check_short_pattern(&buf[j * scanlen], scanlen, mtd->oobblock, =
bd)) {=0A=
+				bbm->bbt[i >> 3] |=3D 0x03 << (i & 0x6);=0A=
+				printk(KERN_WARNING "Bad eraseblock %d at 0x%08x\n",=0A=
+					i >> 1, (unsigned int) from);=0A=
+				break;=0A=
+			}=0A=
+		}=0A=
+		i +=3D 2;=0A=
+		from +=3D (1 << bbm->bbt_erase_shift);=0A=
+	}=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+=0A=
+/**=0A=
+ * onenand_memory_bbt - [GENERIC] create a memory based bad block table=0A=
+ * @param mtd		MTD device structure=0A=
+ * @param bd		descriptor for the good/bad block search pattern=0A=
+ *=0A=
+ * The function creates a memory based bbt by scanning the device=0A=
+ * for manufacturer / software marked good / bad blocks=0A=
+ */=0A=
+static inline int onenand_memory_bbt (struct mtd_info *mtd, struct =
nand_bbt_descr *bd)=0A=
+{=0A=
+	unsigned char data_buf[MAX_ONENAND_PAGESIZE];=0A=
+=0A=
+        bd->options &=3D ~NAND_BBT_SCANEMPTY;=0A=
+        return create_bbt(mtd, data_buf, bd, -1);=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_isbad_bbt - [OneNAND Interface] Check if a block is bad=0A=
+ * @param mtd		MTD device structure=0A=
+ * @param offs		offset in the device=0A=
+ * @param allowbbt	allow access to bad block table region=0A=
+ */=0A=
+static int onenand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int =
allowbbt)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	struct bbm_info *bbm =3D this->bbm;=0A=
+	int block;=0A=
+	uint8_t res;=0A=
+=0A=
+	/* Get block number * 2 */=0A=
+	block =3D (int) (offs >> (bbm->bbt_erase_shift - 1));=0A=
+	res =3D (bbm->bbt[block >> 3] >> (block & 0x06)) & 0x03;=0A=
+=0A=
+	DEBUG(MTD_DEBUG_LEVEL2, "onenand_isbad_bbt: bbt info for offs 0x%08x: =
(block %d) 0x%02x\n",=0A=
+		(unsigned int) offs, block >> 1, res);=0A=
+=0A=
+	switch ((int) res) {=0A=
+	case 0x00:	return 0;=0A=
+	case 0x01:	return 1;=0A=
+	case 0x02:	return allowbbt ? 0 : 1;=0A=
+	}=0A=
+=0A=
+	return 1;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_scan_bbt - [OneNAND Interface] scan, find, read and maybe =
create bad block table(s)=0A=
+ * @param mtd		MTD device structure=0A=
+ * @param bd		descriptor for the good/bad block search pattern=0A=
+ *=0A=
+ * The function checks, if a bad block table(s) is/are already=0A=
+ * available. If not it scans the device for manufacturer=0A=
+ * marked good / bad blocks and writes the bad block table(s) to=0A=
+ * the selected place.=0A=
+ *=0A=
+ * The bad block table memory is allocated here. It must be freed=0A=
+ * by calling the onenand_free_bbt function.=0A=
+ *=0A=
+ */=0A=
+int onenand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	struct bbm_info *bbm =3D this->bbm;=0A=
+	int len, ret =3D 0;=0A=
+=0A=
+	len =3D mtd->size >> (this->erase_shift + 2);=0A=
+	/* Allocate memory (2bit per block) */=0A=
+	bbm->bbt =3D kmalloc(len, GFP_KERNEL);=0A=
+	if (!bbm->bbt) {=0A=
+		printk(KERN_ERR "onenand_scan_bbt: Out of memory\n");=0A=
+		return -ENOMEM;=0A=
+	}=0A=
+	/* Clear the memory bad block table */=0A=
+	memset(bbm->bbt, 0x00, len);=0A=
+=0A=
+	/* Set the bad block position */=0A=
+	bbm->badblockpos =3D ONENAND_BADBLOCK_POS;=0A=
+=0A=
+	/* Set erase shift */=0A=
+	bbm->bbt_erase_shift =3D this->erase_shift;=0A=
+=0A=
+	if (!bbm->isbad_bbt)=0A=
+		bbm->isbad_bbt =3D onenand_isbad_bbt;=0A=
+=0A=
+	/* Scan the device to build a memory based bad block table */=0A=
+	if ((ret =3D onenand_memory_bbt(mtd, bd))) {=0A=
+		printk(KERN_ERR "onenand_scan_bbt: Can't scan flash and build the =
RAM-based BBT\n");=0A=
+		kfree(bbm->bbt);=0A=
+		bbm->bbt =3D NULL;=0A=
+	}=0A=
+=0A=
+	return ret;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Define some generic bad / good block scan pattern which are used=0A=
+ * while scanning a device for factory marked good / bad blocks.=0A=
+ */=0A=
+static uint8_t scan_ff_pattern[] =3D { 0xff, 0xff };=0A=
+=0A=
+static struct nand_bbt_descr largepage_memorybased =3D {=0A=
+	.options =3D 0,=0A=
+	.offs =3D 0,=0A=
+	.len =3D 2,=0A=
+	.pattern =3D scan_ff_pattern,=0A=
+};=0A=
+=0A=
+/**=0A=
+ * onenand_default_bbt - [OneNAND Interface] Select a default bad block =
table for the device=0A=
+ * @param mtd		MTD device structure=0A=
+ *=0A=
+ * This function selects the default bad block table=0A=
+ * support for the device and calls the onenand_scan_bbt function=0A=
+ */=0A=
+int onenand_default_bbt(struct mtd_info *mtd)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	struct bbm_info *bbm;=0A=
+=0A=
+	this->bbm =3D kmalloc(sizeof(struct bbm_info), GFP_KERNEL);=0A=
+	if (!this->bbm)=0A=
+		return -ENOMEM;=0A=
+=0A=
+	bbm =3D this->bbm;=0A=
+=0A=
+	memset(bbm, 0, sizeof(struct bbm_info));=0A=
+=0A=
+	/* 1KB page has same configuration as 2KB page */=0A=
+	if (!bbm->badblock_pattern)=0A=
+		bbm->badblock_pattern =3D &largepage_memorybased;=0A=
+=0A=
+	return onenand_scan_bbt(mtd, bbm->badblock_pattern);=0A=
+}=0A=
+=0A=
+EXPORT_SYMBOL(onenand_scan_bbt);=0A=
+EXPORT_SYMBOL(onenand_default_bbt);=0A=
diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h=0A=
new file mode 100644=0A=
--- /dev/null=0A=
+++ b/include/linux/mtd/bbm.h=0A=
@@ -0,0 +1,122 @@=0A=
+/*=0A=
+ *  linux/include/linux/mtd/bbm.h=0A=
+ *=0A=
+ *  NAND family Bad Block Management (BBM) header file=0A=
+ *    - Bad Block Table (BBT) implementation=0A=
+ *=0A=
+ *  Copyright (c) 2005 Samsung Electronics=0A=
+ *  Kyungmin Park <kyungmin.park@samsung.com>=0A=
+ *=0A=
+ *  Copyright (c) 2000-2005=0A=
+ *  Thomas Gleixner <tglx@linuxtronix.de>=0A=
+ *=0A=
+ */=0A=
+#ifndef __LINUX_MTD_BBM_H=0A=
+#define __LINUX_MTD_BBM_H=0A=
+=0A=
+/* The maximum number of NAND chips in an array */=0A=
+#define NAND_MAX_CHIPS		8=0A=
+=0A=
+/**=0A=
+ * struct nand_bbt_descr - bad block table descriptor=0A=
+ * @param options	options for this descriptor=0A=
+ * @param pages		the page(s) where we find the bbt, used with=0A=
+ * 			option BBT_ABSPAGE when bbt is searched,=0A=
+ * 			then we store the found bbts pages here.=0A=
+ *			Its an array and supports up to 8 chips now=0A=
+ * @param offs		offset of the pattern in the oob area of the page=0A=
+ * @param veroffs	offset of the bbt version counter in the oob are of =
the page=0A=
+ * @param version	version read from the bbt page during scan=0A=
+ * @param len		length of the pattern, if 0 no pattern check is performed=0A=
+ * @param maxblocks	maximum number of blocks to search for a bbt. This =
number of=0A=
+ *			blocks is reserved at the end of the device =0A=
+ *			where the tables are written.=0A=
+ * @param reserved_block_code	if non-0, this pattern denotes a reserved=0A=
+ *			(rather than bad) block in the stored bbt=0A=
+ * @param pattern	pattern to identify bad block table or factory marked=0A=
+ *			good / bad blocks, can be NULL, if len =3D 0=0A=
+ *=0A=
+ * Descriptor for the bad block table marker and the descriptor for the=0A=
+ * pattern which identifies good and bad blocks. The assumption is made=0A=
+ * that the pattern and the version count are always located in the oob =
area=0A=
+ * of the first block.=0A=
+ */=0A=
+struct nand_bbt_descr {=0A=
+	int options;=0A=
+	int pages[NAND_MAX_CHIPS];=0A=
+	int offs;=0A=
+	int veroffs;=0A=
+	uint8_t version[NAND_MAX_CHIPS];=0A=
+	int len;=0A=
+	int maxblocks;=0A=
+	int reserved_block_code;=0A=
+	uint8_t *pattern;=0A=
+};=0A=
+=0A=
+/* Options for the bad block table descriptors */=0A=
+=0A=
+/* The number of bits used per block in the bbt on the device */=0A=
+#define NAND_BBT_NRBITS_MSK	0x0000000F=0A=
+#define NAND_BBT_1BIT		0x00000001=0A=
+#define NAND_BBT_2BIT		0x00000002=0A=
+#define NAND_BBT_4BIT		0x00000004=0A=
+#define NAND_BBT_8BIT		0x00000008=0A=
+/* The bad block table is in the last good block of the device */=0A=
+#define NAND_BBT_LASTBLOCK	0x00000010=0A=
+/* The bbt is at the given page, else we must scan for the bbt */=0A=
+#define NAND_BBT_ABSPAGE	0x00000020=0A=
+/* The bbt is at the given page, else we must scan for the bbt */=0A=
+#define NAND_BBT_SEARCH		0x00000040=0A=
+/* bbt is stored per chip on multichip devices */=0A=
+#define NAND_BBT_PERCHIP	0x00000080=0A=
+/* bbt has a version counter at offset veroffs */=0A=
+#define NAND_BBT_VERSION	0x00000100=0A=
+/* Create a bbt if none axists */=0A=
+#define NAND_BBT_CREATE		0x00000200=0A=
+/* Search good / bad pattern through all pages of a block */=0A=
+#define NAND_BBT_SCANALLPAGES	0x00000400=0A=
+/* Scan block empty during good / bad block scan */=0A=
+#define NAND_BBT_SCANEMPTY	0x00000800=0A=
+/* Write bbt if neccecary */=0A=
+#define NAND_BBT_WRITE		0x00001000=0A=
+/* Read and write back block contents when writing bbt */=0A=
+#define NAND_BBT_SAVECONTENT	0x00002000=0A=
+/* Search good / bad pattern on the first and the second page */=0A=
+#define NAND_BBT_SCAN2NDPAGE	0x00004000=0A=
+=0A=
+/* The maximum number of blocks to scan for a bbt */=0A=
+#define NAND_BBT_SCAN_MAXBLOCKS	4=0A=
+=0A=
+/*=0A=
+ * Constants for oob configuration=0A=
+ */=0A=
+#define ONENAND_BADBLOCK_POS	0=0A=
+=0A=
+/**=0A=
+ * struct bbt_info - [GENERIC] Bad Block Table data structure=0A=
+ * @param bbt_erase_shift	[INTERN] number of address bits in a bbt entry=0A=
+ * @param badblockpos		[INTERN] position of the bad block marker in the =
oob area=0A=
+ * @param bbt			[INTERN] bad block table pointer=0A=
+ * @param badblock_pattern	[REPLACEABLE] bad block scan pattern used =
for initial bad block scan=0A=
+ * @param priv			[OPTIONAL] pointer to private bbm date=0A=
+ */=0A=
+struct bbm_info {=0A=
+	int bbt_erase_shift;=0A=
+	int badblockpos;=0A=
+	int options;=0A=
+=0A=
+	uint8_t *bbt;=0A=
+=0A=
+	int (*isbad_bbt)(struct mtd_info *mtd, loff_t ofs, int allowbbt);=0A=
+=0A=
+	/* TODO Add more NAND specific fileds */=0A=
+	struct nand_bbt_descr *badblock_pattern;=0A=
+=0A=
+	void *priv;=0A=
+};=0A=
+=0A=
+/* OneNAND BBT interface */=0A=
+extern int onenand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr =
*bd);=0A=
+extern int onenand_default_bbt(struct mtd_info *mtd);=0A=
+=0A=
+#endif	/* __LINUX_MTD_BBM_H */=0A=
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h=0A=
--- a/include/linux/mtd/onenand.h=0A=
+++ b/include/linux/mtd/onenand.h=0A=
@@ -14,8 +14,10 @@=0A=
 =0A=
 #include <linux/spinlock.h>=0A=
 #include <linux/mtd/onenand_regs.h>=0A=
+#include <linux/mtd/bbm.h>=0A=
 =0A=
 #define MAX_BUFFERRAM		2=0A=
+#define MAX_ONENAND_PAGESIZE	(2048 + 64)=0A=
 =0A=
 /* Scan and identify a OneNAND device */=0A=
 extern int onenand_scan(struct mtd_info *mtd, int max_chips);=0A=
@@ -67,10 +69,14 @@ struct onenand_bufferram {=0A=
  * @param wait		[REPLACEABLE] hardware specific function for wait on =
ready=0A=
  * @param read_bufferram	[REPLACEABLE] hardware specific function for =
BufferRAM Area=0A=
  * @param write_bufferram	[REPLACEABLE] hardware specific function for =
BufferRAM Area=0A=
+ * @param read_word	[REPLACEABLE] hardware specific function for read =
register of OneNAND=0A=
+ * @param write_word	[REPLACEABLE] hardware specific function for write =
register of OneNAND=0A=
+ * @param scan_bbt	[REPLACEALBE] hardware specific function for scaning =
Bad block Table=0A=
  * @param chip_lock	[INTERN] spinlock used to protect access to this =
structure and the chip=0A=
  * @param wq		[INTERN] wait queue to sleep on if a OneNAND operation is =
in progress=0A=
  * @param state		[INTERN] the current state of the OneNAND device=0A=
  * @param autooob	[REPLACEABLE] the default (auto)placement scheme=0A=
+ * @param bbm		[REPLACEABLE] pointer to Bad Block Management =0A=
  * @param priv		[OPTIONAL] pointer to private chip date=0A=
  */=0A=
 struct onenand_chip {=0A=
@@ -95,6 +101,9 @@ struct onenand_chip {=0A=
 			const unsigned char *buffer, int offset, size_t count);=0A=
 	unsigned short (*read_word)(void __iomem *addr);=0A=
 	void (*write_word)(unsigned short value, void __iomem *addr);=0A=
+	void (*mmcontrol)(struct mtd_info *mtd, int sync_read);=0A=
+	int (*block_markbad)(struct mtd_info *mtd, loff_t ofs);=0A=
+	int (*scan_bbt)(struct mtd_info *mtd);=0A=
 =0A=
 	spinlock_t		chip_lock;=0A=
 	wait_queue_head_t	wq;=0A=
@@ -102,13 +111,23 @@ struct onenand_chip {=0A=
 =0A=
 	struct nand_oobinfo	*autooob;=0A=
 =0A=
+	void 			*bbm;=0A=
+=0A=
 	void			*priv;=0A=
 };=0A=
 =0A=
+/*=0A=
+ * Helper macros=0A=
+ */=0A=
 #define ONENAND_CURRENT_BUFFERRAM(this)		(this->bufferram_index)=0A=
 #define ONENAND_NEXT_BUFFERRAM(this)		(this->bufferram_index ^ 1)=0A=
 #define ONENAND_SET_NEXT_BUFFERRAM(this)	(this->bufferram_index ^=3D 1)=0A=
 =0A=
+#define ONENAND_GET_SYS_CFG1(this)					\=0A=
+	(this->read_word(this->base + ONENAND_REG_SYS_CFG1))=0A=
+#define ONENAND_SET_SYS_CFG1(v, this)					\=0A=
+	(this->write_word(v, this->base + ONENAND_REG_SYS_CFG1))=0A=
+=0A=
 /*=0A=
  * Options bits=0A=
  */=0A=
diff --git a/include/linux/mtd/onenand_regs.h =
b/include/linux/mtd/onenand_regs.h=0A=
--- a/include/linux/mtd/onenand_regs.h=0A=
+++ b/include/linux/mtd/onenand_regs.h=0A=
@@ -121,8 +121,21 @@=0A=
  * System Configuration 1 Register F221h (R, R/W)=0A=
  */=0A=
 #define ONENAND_SYS_CFG1_SYNC_READ	(1 << 15)=0A=
-#define ONENAND_SYS_CFG1_BRL		(1 << 12)=0A=
-#define ONENAND_SYS_CFG1_BL		(1 << 9)=0A=
+#define ONENAND_SYS_CFG1_BRL_7		(7 << 12)=0A=
+#define ONENAND_SYS_CFG1_BRL_6		(6 << 12)=0A=
+#define ONENAND_SYS_CFG1_BRL_5		(5 << 12)=0A=
+#define ONENAND_SYS_CFG1_BRL_4		(4 << 12)=0A=
+#define ONENAND_SYS_CFG1_BRL_3		(3 << 12)=0A=
+#define ONENAND_SYS_CFG1_BRL_10		(2 << 12)=0A=
+#define ONENAND_SYS_CFG1_BRL_9		(1 << 12)=0A=
+#define ONENAND_SYS_CFG1_BRL_8		(0 << 12)=0A=
+#define ONENAND_SYS_CFG1_BRL_SHIFT	(12)=0A=
+#define ONENAND_SYS_CFG1_BL_32		(4 << 9)=0A=
+#define ONENAND_SYS_CFG1_BL_16		(3 << 9)=0A=
+#define ONENAND_SYS_CFG1_BL_8		(2 << 9)=0A=
+#define ONENAND_SYS_CFG1_BL_4		(1 << 9)=0A=
+#define ONENAND_SYS_CFG1_BL_CONT	(0 << 9)=0A=
+#define ONENAND_SYS_CFG1_BL_SHIFT	(9)=0A=
 #define ONENAND_SYS_CFG1_NO_ECC		(1 << 8)=0A=
 #define ONENAND_SYS_CFG1_RDY		(1 << 7)=0A=
 #define ONENAND_SYS_CFG1_INT		(1 << 6)=0A=
diff --git a/include/asm-arm/mach/flash.h b/include/asm-arm/mach/flash.h=0A=
--- a/include/asm-arm/mach/flash.h=0A=
+++ b/include/asm-arm/mach/flash.h=0A=
@@ -11,6 +11,7 @@=0A=
 #define ASMARM_MACH_FLASH_H=0A=
=0A=
 struct mtd_partition;=0A=
+struct mtd_info;=0A=
=0A=
 /*=0A=
  * map_name:   the map probe function name=0A=
@@ -31,4 +32,16 @@ struct flash_platform_data {=0A=
        unsigned int    nr_parts;=0A=
 };=0A=
=0A=
+/**=0A=
+ * struct onenand_platform_data - platform data describing OneNAND =
flash banks=0A=
+ * @param mmcontrol    Handle memroy control for Sync. Burst Read=0A=
+ * @param parts                optional array of mtd_partitions for =
static partioning=0A=
+ * @param nr_parts     number of mtd_partitions for static partitioning=0A=
+ */=0A=
+struct onenand_platform_data {=0A=
+       void            (*mmcontrol)(struct mtd_info *mtd, int =
sync_read);=0A=
+       struct mtd_partition *parts;=0A=
+       unsigned int    nr_parts;=0A=
+};=0A=
+=0A=
 #endif=0A=

--Boundary_(ID_7xGYIUDsATwziC2M4dGl5A)--
