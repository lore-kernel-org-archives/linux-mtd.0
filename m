Received: from exprod6og107.obsmtp.com ([64.18.1.208])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LQ2cu-0001Dh-Bg
	for linux-mtd@lists.infradead.org; Thu, 22 Jan 2009 16:41:59 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: mtd: m25p80.c add support for non-JEDEC ID devices
Date: Thu, 22 Jan 2009 11:41:15 -0500
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909010C953E@mi8nycmail19.Mi8.com>
From: "hartleys" <hartleys@visionengravers.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support to the m25p80 driver for non-JEDEC ID devices.

Some SPI flash chips do not support the "Read JEDEC ID" command and end
up returning all 0xff's.  The following patch detects this and trys
probing the chip using the "Read Manufacture/Device ID" command.

This patch has been tested on an EP93xx based ARM platform with a
SST25LF020A 2Mbit SPI Serial Flash device.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 7c3fc76..0834a55 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -43,6 +43,7 @@
 #define	OPCODE_CHIP_ERASE	0xc7	/* Erase whole flash
chip */
 #define	OPCODE_SE		0xd8	/* Sector erase (usually
64KiB) */
 #define	OPCODE_RDID		0x9f	/* Read JEDEC ID */
+#define	OPCODE_RDID_NON_JEDEC	0x90	/* Read non-JEDEC ID */
=20
 /* Status Register bits. */
 #define	SR_WIP			1	/* Write in progress */
@@ -546,12 +547,16 @@ static struct flash_info __devinitdata m25p_data
[] =3D {
 	{ "w25x16", 0xef3015, 0, 64 * 1024, 32, SECT_4K, },
 	{ "w25x32", 0xef3016, 0, 64 * 1024, 64, SECT_4K, },
 	{ "w25x64", 0xef3017, 0, 64 * 1024, 128, SECT_4K, },
+
+	/* Non JEDEC ID SST -- large erase sizes are "overlays",
"sectors" are 4K */
+	{ "sst25lf020a", 0xbf43, 0, 32 * 1024, 8, SECT_4K, },
+	{ "sst25lf040a", 0xbf44, 0, 32 * 1024, 16, SECT_4K, },
 };
=20
 static struct flash_info *__devinit jedec_probe(struct spi_device *spi)
 {
 	int			tmp;
-	u8			code =3D OPCODE_RDID;
+	u8			code[4];
 	u8			id[5];
 	u32			jedec;
 	u16                     ext_jedec;
@@ -561,7 +566,8 @@ static struct flash_info *__devinit
jedec_probe(struct spi_device *spi)
 	 * string for after vendor-specific data, after the three bytes
 	 * we use here.  Supporting some chips might require using it.
 	 */
-	tmp =3D spi_write_then_read(spi, &code, 1, id, 5);
+	code[0] =3D OPCODE_RDID;
+	tmp =3D spi_write_then_read(spi, code, 1, id, 5);
 	if (tmp < 0) {
 		DEBUG(MTD_DEBUG_LEVEL0, "%s: error %d reading JEDEC
ID\n",
 			dev_name(&spi->dev), tmp);
@@ -585,6 +591,31 @@ static struct flash_info *__devinit
jedec_probe(struct spi_device *spi)
 		}
 	}
 	dev_err(&spi->dev, "unrecognized JEDEC id %06x\n", jedec);
+
+	/* Try reading the non-JEDEC Manufacture/Device ID */
+	code[0] =3D OPCODE_RDID_NON_JEDEC;
+	code[1] =3D 0x00;
+	code[2] =3D 0x00;
+	code[3] =3D 0x00;
+	tmp =3D spi_write_then_read(spi, code, 4, id, 2);
+	if (tmp < 0) {
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: error %d reading ID\n",
+			spi->dev.bus_id, tmp);
+		return NULL;
+	}
+
+	jedec =3D id[0];
+	jedec =3D jedec << 8;
+	jedec |=3D id[1];
+
+	for (tmp =3D 0, info =3D m25p_data;
+			tmp < ARRAY_SIZE(m25p_data);
+			tmp++, info++) {
+		if (info->jedec_id =3D=3D jedec)
+			return info;
+	}
+	dev_err(&spi->dev, "unrecognized id %04x\n", jedec);
+
 	return NULL;
 }
 =20
