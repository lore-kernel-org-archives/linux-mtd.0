Received: from exprod6og106.obsmtp.com ([64.18.1.191])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KMQFl-0006zQ-7F
	for linux-mtd@lists.infradead.org; Fri, 25 Jul 2008 16:34:49 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] mtd: m25p80.c add support for non-JEDEC ID devices
Date: Fri, 25 Jul 2008 12:34:17 -0400
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19094F63C3@mi8nycmail19.Mi8.com>
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

The following patch adds support for the SST 2 Mbit / 4 Mbit SPI Serial
Flash devices (SST25LF020A/SST25LF040A).

These devices do not support the JEDEC-Read-ID command but they do have
a Read-ID command. There are probably other SPI serial flash devices
there that could be used with the same patch.


Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>


--- orig/linux-2.6.25.10/drivers/mtd/devices/m25p80.c	2008-07-02
20:46:47.000000000 -0700
+++
/home/bigguiness/buildroot/project_build_arm/ep9307/linux-2.6.25.10/driv
ers/mtd/devices/m25p80.c	2008-07-24 15:10:33.000000000 -0700
@@ -40,6 +40,7 @@
 #define	OPCODE_BE_32K		0x52	/* Erase 32KiB block */
 #define	OPCODE_SE		0xd8	/* Sector erase (usually
64KiB) */
 #define	OPCODE_RDID		0x9f	/* Read JEDEC ID */
+#define OPCODE_RDID_90		0x90	/* Read ID */
=20
 /* Status Register bits. */
 #define	SR_WIP			1	/* Write in progress */
@@ -481,13 +482,17 @@ static struct flash_info __devinitdata m
 	{ "w25x16", 0xef3015, 64 * 1024, 32, SECT_4K, },
 	{ "w25x32", 0xef3016, 64 * 1024, 64, SECT_4K, },
 	{ "w25x64", 0xef3017, 64 * 1024, 128, SECT_4K, },
+
+	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
+	{ "sst25lf020a", 0xbf43, 32 * 1024, 8, SECT_4K, },
+	{ "sst25lf040a", 0xbf44, 32 * 1024, 16, SECT_4K, },
 };
=20
 static struct flash_info *__devinit jedec_probe(struct spi_device *spi)
 {
 	int			tmp;
-	u8			code =3D OPCODE_RDID;
-	u8			id[3];
+	u8			code[4];
+	u8			id[4];
 	u32			jedec;
 	struct flash_info	*info;
=20
@@ -495,7 +500,8 @@ static struct flash_info *__devinit jede
 	 * string for after vendor-specific data, after the three bytes
 	 * we use here.  Supporting some chips might require using it.
 	 */
-	tmp =3D spi_write_then_read(spi, &code, 1, id, 3);
+	code[0] =3D OPCODE_RDID;
+	tmp =3D spi_write_then_read(spi, code, 1, id, 3);
 	if (tmp < 0) {
 		DEBUG(MTD_DEBUG_LEVEL0, "%s: error %d reading JEDEC
ID\n",
 			spi->dev.bus_id, tmp);
@@ -514,6 +520,30 @@ static struct flash_info *__devinit jede
 			return info;
 	}
 	dev_err(&spi->dev, "unrecognized JEDEC id %06x\n", jedec);
+
+	/* Try reading the Manufacture/Device ID with the alternate
opcode */
+	code[0] =3D OPCODE_RDID_90;
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
 	return NULL;
 }
 =20
