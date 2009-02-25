Received: from airmail.airvana.com ([12.6.244.135]
	helo=airmail.wirelessworld.airvananet.com)
	by casper.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LcIi6-0000lf-CC
	for linux-mtd@lists.infradead.org; Wed, 25 Feb 2009 12:18:01 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] [MTD] devices/mtd_dataflash: Add SW sector protection support
Date: Wed, 25 Feb 2009 12:17:09 -0000
Message-ID: <4B3F8896E1733D4787DDB0EA1C7FF91F7556E7@ukmail.uk.wirelessworld.airvananet.com>
From: "Mike McTernan" <mmcternan@airvana.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Michael McTernan <mmcternan@airvana.com>

The Atmel AT45DBxxxD serial DataFlash parts allow software protection of
specific device sectors.  This is detailed in section 8, "Sector
Protection" of the data sheets available on their site (e.g.
http://www.atmel.com/dyn/resources/prod_documents/doc3597.pdf).

This patch expands the device probe tables to include sector geometry
information, and issues the "enable sector protection command" after a
compatible part is found and the build is configured with
CONFIG_MTD_DATAFLASH_SWPROT.  The lock() and unlock() functions are then
implemented to allow manipulation of the "sector protection register" in
the device such that program/erase operations can be selectively allowed
or blocked.  Note that this register is subject to a limit of 10,000
erase/program cycles according to the datasheet. =20

Devices ship with erase/program access allowed for the whole device by
default, and operation of the driver is unchanged if
CONFIG_MTD_DATAFLASH_SWPROT is not set.  It should not therefore cause a
problem for existing devices to enable this option.

This has been tested with the AT45DB321d, but the probe tables updated
from data sheets such that it should work with the following parts:

  AT45DB011D =20
  AT45DB021D =09
  AT45DB041D =09
  AT45DB081D =09
  AT45DB161D =09
  AT45DB321D =09
  AT45DB642D =09

This is probably a one-off patch, so I've included it here rather than
setting up a git tree.  Apologies for that.

Signed-off-by: Michael McTernan <mmcternan@airvana.com>

--- trunk/drivers/mtd/devices/mtd_dataflash.c	2009-02-25
10:40:09.000000000 +0000
+++ linux-2.6.x/drivers/mtd/devices/mtd_dataflash.c	2009-02-25
10:49:33.000000000 +0000
@@ -3,6 +3,8 @@
  *
  * Largely derived from at91_dataflash.c:
  *  Copyright (C) 2003-2005 SAN People (Pty) Ltd
+ * Software protection support:
+ *  Copyright (C) 2009 Airvana Ltd
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License
@@ -81,6 +83,27 @@
 #define OP_WRITE_SECURITY_REVC	0x9A
 #define OP_WRITE_SECURITY	0x9B	/* revision D */

+/* enable sector protection command */
+#define OP_ENABLE_SECTOR_PROT_B0 0x3D
+#define OP_ENABLE_SECTOR_PROT_B1 0x2A
+#define OP_ENABLE_SECTOR_PROT_B2 0x7F
+#define OP_ENABLE_SECTOR_PROT_B3 0xA9
+
+/* read sector protection register command */
+#define OP_READ_SECTOR_PROT 0x32
+
+/* erase sector protection register command */
+#define OP_ERASE_SECTOR_PROT_B0 0x3D
+#define OP_ERASE_SECTOR_PROT_B1 0x2A
+#define OP_ERASE_SECTOR_PROT_B2 0x7F
+#define OP_ERASE_SECTOR_PROT_B3 0xCF
+
+/* write sector protection register command */
+#define OP_WRITE_SECTOR_PROT_B0 0x3D
+#define OP_WRITE_SECTOR_PROT_B1 0x2A
+#define OP_WRITE_SECTOR_PROT_B2 0x7F
+#define OP_WRITE_SECTOR_PROT_B3 0xFC
+

 struct dataflash {
 	uint8_t			command[4];
@@ -90,6 +113,8 @@

 	unsigned short		page_offset;	/* offset in flash
address */
 	unsigned int		page_size;	/* of bytes per page */
+	unsigned int		nr_sectors;	/* number of sectors */
+	unsigned int		sector_size;	/* nominal sector size
*/

 	struct mutex		lock;
 	struct spi_device	*spi;
@@ -139,6 +164,132 @@
 	}
 }

+/*
+ * Enable software sector protection on the device.
+ */
+static char *dataflash_enableswprot(struct spi_device *spi)
+{
+#ifdef CONFIG_MTD_DATAFLASH_SWPROT
+	static const uint8_t buf[] =3D {
+		OP_ENABLE_SECTOR_PROT_B0, OP_ENABLE_SECTOR_PROT_B1,
+		OP_ENABLE_SECTOR_PROT_B2, OP_ENABLE_SECTOR_PROT_B3 };
+
+	spi_write(spi, buf, sizeof(buf));
+
+	return ", SWP";
+#else
+	return ", (SWP)";
+#endif
+}
+
+/*
+ * Modify software protection status.
+ * This sets or clears the protection bits for sectors starting
+ * at ofs and ending at ofs + len - 1.
+ * Note: This involves a read/modify/erase/write of the sector
+ *	   protection flash.  The at45db321d.L datasheet indicates
+ *	   limit of 10,000 erase/program cycles to this area.
+ */
+static int dataflash_set_prot_registers(struct mtd_info *mtd, loff_t
ofs,
+
size_t len, bool lock)
+{
+#ifdef CONFIG_MTD_DATAFLASH_SWPROT
+	struct dataflash	*priv =3D (struct dataflash *)mtd->priv;
+	uint8_t				prot_register[priv->nr_sectors];
+	struct spi_transfer	x[2] =3D { { .tx_dma =3D 0, }, };
+	int					status =3D -EINVAL;
+	struct spi_message	msg;
+	uint8_t				*command;
+	uint64_t			sect =3D ofs;
+
+	/* Sanity checks */
+	if(!priv->sector_size)
+		return -EOPNOTSUPP;
+	if (!len)
+		return 0;
+	if (ofs < 0)
+		return -EINVAL;
+	if (ofs + len > mtd->size)
+		return -EINVAL;
+	if (do_div(sect, priv->sector_size) !=3D 0 ||
+			(len % priv->sector_size) !=3D 0)
+		return -EINVAL;
+
+	/* Read the protection registers */
+	spi_message_init(&msg);
+
+	x[0].tx_buf =3D command =3D priv->command;
+	x[0].len =3D 4;
+	spi_message_add_tail(&x[0], &msg);
+
+	x[1].rx_buf =3D prot_register;
+	x[1].len =3D priv->nr_sectors;
+	spi_message_add_tail(&x[1], &msg);
+
+	mutex_lock(&priv->lock);
+	command[0] =3D OP_READ_SECTOR_PROT;
+	command[1] =3D 0;	 /* don't care */
+	command[2] =3D 0;
+	command[3] =3D 0;
+
+	status =3D spi_sync(priv->spi, &msg);
+
+	/* Change relevant sector permissions
+	 *  REVIST: no-special handling for sector 0a and 0b, 0 is
handled
+	 *		   as a single sector of 128 pages
+	 */
+	for (sect =3D ofs; sect < ofs + len; sect +=3D priv->sector_size) {
+		uint64_t reg =3D sect;
+
+		do_div(reg, priv->sector_size);
+
+		BUG_ON(reg >=3D priv->nr_sectors);
+
+		prot_register[reg] =3D lock ? 0xff : 0x00;
+	}
+
+	/* Erase sector protection regs */
+	spi_message_init(&msg);
+
+	x[0].tx_buf =3D priv->command;
+	x[0].len =3D 4;
+	spi_message_add_tail(&x[0], &msg);
+
+	command[0] =3D OP_ERASE_SECTOR_PROT_B0;
+	command[1] =3D OP_ERASE_SECTOR_PROT_B1;
+	command[2] =3D OP_ERASE_SECTOR_PROT_B2;
+	command[3] =3D OP_ERASE_SECTOR_PROT_B3;
+
+	status =3D spi_sync(priv->spi, &msg);
+	(void) dataflash_waitready(priv->spi);
+
+	/* Write the new protection registers */
+	spi_message_init(&msg);
+
+	x[0].tx_buf =3D priv->command;
+	x[0].len =3D 4;
+	spi_message_add_tail(&x[0], &msg);
+
+	x[1].tx_buf =3D prot_register;
+	x[1].len =3D priv->nr_sectors;
+	spi_message_add_tail(&x[1], &msg);
+
+	command[0] =3D OP_WRITE_SECTOR_PROT_B0;
+	command[1] =3D OP_WRITE_SECTOR_PROT_B1;
+	command[2] =3D OP_WRITE_SECTOR_PROT_B2;
+	command[3] =3D OP_WRITE_SECTOR_PROT_B3;
+
+	status =3D spi_sync(priv->spi, &msg);
+	(void) dataflash_waitready(priv->spi);
+
+	mutex_unlock(&priv->lock);
+
+	return 0;
+#else
+	return -EOPNOTSUPP;
+#endif
+}
+
 /*
........................................................................
. */

 /*
@@ -448,6 +599,30 @@
 	return status;
 }

+/*
+ * Lock sectors of the data-flash.
+ */
+static int dataflash_lock(struct mtd_info *mtd, loff_t ofs, size_t len)
+{
+	DEBUG(MTD_DEBUG_LEVEL2, "%s: lock addr=3D0x%x len 0x%x\n",
+			spi->dev.bus_id,
+			ofs, len);
+
+	return dataflash_set_prot_registers(mtd, ofs, len, true);
+}
+
+/*
+ * Unlock sectors of the data-flash.
+ */
+static int dataflash_unlock(struct mtd_info *mtd, loff_t ofs, size_t
len)
+{
+	DEBUG(MTD_DEBUG_LEVEL2, "%s: unlock addr=3D0x%x len 0x%x\n",
+			spi->dev.bus_id,
+			ofs, len);
+
+	return dataflash_set_prot_registers(mtd, ofs, len, false);
+}
+
 /*
........................................................................
. */

 #ifdef CONFIG_MTD_DATAFLASH_OTP
@@ -630,12 +805,18 @@
  */
 static int __devinit
 add_dataflash_otp(struct spi_device *spi, char *name,
-		int nr_pages, int pagesize, int pageoffset, char
revision)
+		int nr_pages, int pagesize, int pageoffset,
+		int nr_sectors, int pages_per_sector, char revision)
 {
 	struct dataflash		*priv;
 	struct mtd_info			*device;
 	struct flash_platform_data	*pdata =3D spi->dev.platform_data;
 	char				*otp_tag =3D "";
+	char				*swp_tag =3D "";
+
+	/* enable software protection early if supported */
+	if (pages_per_sector)
+		swp_tag =3D dataflash_enableswprot(spi);

 	priv =3D kzalloc(sizeof *priv, GFP_KERNEL);
 	if (!priv)
@@ -645,6 +826,8 @@
 	priv->spi =3D spi;
 	priv->page_size =3D pagesize;
 	priv->page_offset =3D pageoffset;
+	priv->nr_sectors =3D nr_sectors;
+	priv->sector_size =3D pages_per_sector * pagesize;

 	/* name must be usable with cmdlinepart */
 	sprintf(priv->name, "spi%d.%d-%s",
@@ -662,14 +845,16 @@
 	device->erase =3D dataflash_erase;
 	device->read =3D dataflash_read;
 	device->write =3D dataflash_write;
+	device->lock =3D dataflash_lock;
+	device->unlock =3D dataflash_unlock;
 	device->priv =3D priv;

 	if (revision >=3D 'c')
 		otp_tag =3D otp_setup(device, revision);

-	dev_info(&spi->dev, "%s (%lld KBytes) pagesize %d bytes%s\n",
+	dev_info(&spi->dev, "%s (%lld KBytes) pagesize %d bytes%s%s\n",
 			name, (long long)((device->size + 1023) >> 10),
-			pagesize, otp_tag);
+			pagesize, otp_tag, swp_tag);
 	dev_set_drvdata(&spi->dev, priv);

 	if (mtd_has_partitions()) {
@@ -700,10 +885,11 @@

 static inline int __devinit
 add_dataflash(struct spi_device *spi, char *name,
-		int nr_pages, int pagesize, int pageoffset)
+		int nr_pages, int pagesize, int pageoffset,
+		int nr_sectors, int pages_per_sector)
 {
 	return add_dataflash_otp(spi, name, nr_pages, pagesize,
-			pageoffset, 0);
+			pageoffset, nr_sectors, pages_per_sector, 0);
 }

 struct flash_info {
@@ -718,6 +904,8 @@
 	unsigned	nr_pages;
 	uint16_t	pagesize;
 	uint16_t	pageoffset;
+	unsigned	nr_sectors;
+	uint16_t	pages_per_sector;

 	uint16_t	flags;
 #define SUP_POW2PS	0x0002		/* supports 2^N byte pages */
@@ -735,28 +923,28 @@
 	 * These newer chips also support 128-byte security registers
(with
 	 * 64 bytes one-time-programmable) and software
write-protection.
 	 */
-	{ "AT45DB011B",  0x1f2200, 512, 264, 9, SUP_POW2PS},
-	{ "at45db011d",  0x1f2200, 512, 256, 8, SUP_POW2PS | IS_POW2PS},
+	{ "AT45DB011B",  0x1f2200, 512,  264,   9,  0,   0, SUP_POW2PS},
+	{ "at45db011d",  0x1f2200, 512,  256,   8,  4, 128, SUP_POW2PS |
IS_POW2PS},

-	{ "AT45DB021B",  0x1f2300, 1024, 264, 9, SUP_POW2PS},
-	{ "at45db021d",  0x1f2300, 1024, 256, 8, SUP_POW2PS |
IS_POW2PS},
+	{ "AT45DB021B",  0x1f2300, 1024, 264,   9,  0,   0, SUP_POW2PS},
+	{ "at45db021d",  0x1f2300, 1024, 256,   8,  8, 128, SUP_POW2PS |
IS_POW2PS},

-	{ "AT45DB041x",  0x1f2400, 2048, 264, 9, SUP_POW2PS},
-	{ "at45db041d",  0x1f2400, 2048, 256, 8, SUP_POW2PS |
IS_POW2PS},
+	{ "AT45DB041x",  0x1f2400, 2048, 264,   9,  0,   0, SUP_POW2PS},
+	{ "at45db041d",  0x1f2400, 2048, 256,   8,  8, 256, SUP_POW2PS |
IS_POW2PS},

-	{ "AT45DB081B",  0x1f2500, 4096, 264, 9, SUP_POW2PS},
-	{ "at45db081d",  0x1f2500, 4096, 256, 8, SUP_POW2PS |
IS_POW2PS},
+	{ "AT45DB081B",  0x1f2500, 4096, 264,   9,  0,   0, SUP_POW2PS},
+	{ "at45db081d",  0x1f2500, 4096, 256,   8, 16, 256, SUP_POW2PS |
IS_POW2PS},

-	{ "AT45DB161x",  0x1f2600, 4096, 528, 10, SUP_POW2PS},
-	{ "at45db161d",  0x1f2600, 4096, 512, 9, SUP_POW2PS |
IS_POW2PS},
+	{ "AT45DB161x",  0x1f2600, 4096, 528,  10,  0,   0, SUP_POW2PS},
+	{ "at45db161d",  0x1f2600, 4096, 512,   9, 16, 256, SUP_POW2PS |
IS_POW2PS},

-	{ "AT45DB321x",  0x1f2700, 8192, 528, 10, 0},		/* rev C
*/
+	{ "AT45DB321x",  0x1f2700, 8192, 528,  10,  0,   0, 0},
/* rev C */

-	{ "AT45DB321x",  0x1f2701, 8192, 528, 10, SUP_POW2PS},
-	{ "at45db321d",  0x1f2701, 8192, 512, 9, SUP_POW2PS |
IS_POW2PS},
+	{ "AT45DB321x",  0x1f2701, 8192, 528,  10,  0,   0, SUP_POW2PS},
+	{ "at45db321d",  0x1f2701, 8192, 512,   9, 64, 128, SUP_POW2PS |
IS_POW2PS},

-	{ "AT45DB642x",  0x1f2800, 8192, 1056, 11, SUP_POW2PS},
-	{ "at45db642d",  0x1f2800, 8192, 1024, 10, SUP_POW2PS |
IS_POW2PS},
+	{ "AT45DB642x",  0x1f2800, 8192, 1056, 11,  0,   0, SUP_POW2PS},
+	{ "at45db642d",  0x1f2800, 8192, 1024, 10, 32, 256, SUP_POW2PS |
IS_POW2PS},
 };

 static struct flash_info *__devinit jedec_probe(struct spi_device *spi)
@@ -860,6 +1048,7 @@
 	if (info !=3D NULL)
 		return add_dataflash_otp(spi, info->name,
info->nr_pages,
 				info->pagesize, info->pageoffset,
+				info->nr_sectors,
info->pages_per_sector,
 				(info->flags & SUP_POW2PS) ? 'd' : 'c');

 	/*
@@ -880,27 +1069,27 @@
 	 * match f(car) for continuous reads, mode 0 or 3.
 	 */
 	switch (status & 0x3c) {
-	case 0x0c:	/* 0 0 1 1 x x */
-		status =3D add_dataflash(spi, "AT45DB011B", 512, 264, 9);
+	case 0x0c:  /* 0 0 1 1 x x */
+		status =3D add_dataflash(spi, "AT45DB011B", 512, 264, 9,
0, 0);
 		break;
-	case 0x14:	/* 0 1 0 1 x x */
-		status =3D add_dataflash(spi, "AT45DB021B", 1024, 264, 9);
+	case 0x14:  /* 0 1 0 1 x x */
+		status =3D add_dataflash(spi, "AT45DB021B", 1024, 264, 9,
0, 0);
 		break;
-	case 0x1c:	/* 0 1 1 1 x x */
-		status =3D add_dataflash(spi, "AT45DB041x", 2048, 264, 9);
+	case 0x1c:  /* 0 1 1 1 x x */
+		status =3D add_dataflash(spi, "AT45DB041x", 2048, 264, 9,
0, 0);
 		break;
-	case 0x24:	/* 1 0 0 1 x x */
-		status =3D add_dataflash(spi, "AT45DB081B", 4096, 264, 9);
+	case 0x24:  /* 1 0 0 1 x x */
+		status =3D add_dataflash(spi, "AT45DB081B", 4096, 264, 9,
0, 0);
 		break;
-	case 0x2c:	/* 1 0 1 1 x x */
-		status =3D add_dataflash(spi, "AT45DB161x", 4096, 528,
10);
+	case 0x2c:  /* 1 0 1 1 x x */
+		status =3D add_dataflash(spi, "AT45DB161x", 4096, 528, 10,
0, 0);
 		break;
-	case 0x34:	/* 1 1 0 1 x x */
-		status =3D add_dataflash(spi, "AT45DB321x", 8192, 528,
10);
+	case 0x34:  /* 1 1 0 1 x x */
+		status =3D add_dataflash(spi, "AT45DB321x", 8192, 528, 10,
0, 0);
 		break;
-	case 0x38:	/* 1 1 1 x x x */
+	case 0x38:  /* 1 1 1 x x x */
 	case 0x3c:
-		status =3D add_dataflash(spi, "AT45DB642x", 8192, 1056,
11);
+		status =3D add_dataflash(spi, "AT45DB642x", 8192, 1056,
11, 0, 0);
 		break;
 	/* obsolete AT45DB1282 not (yet?) supported */
 	default:
