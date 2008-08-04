Received: from exprod6og109.obsmtp.com ([64.18.1.23])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KQ4U0-0008QI-4m
	for linux-mtd@lists.infradead.org; Mon, 04 Aug 2008 18:08:36 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH] mtd: m25p80.c add support for non-JEDEC ID devices
Date: Mon, 4 Aug 2008 14:08:23 -0400
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190958F55C@mi8nycmail19.Mi8.com>
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE19094F63C3@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE19094F63C3@mi8nycmail19.Mi8.com>
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

This patch was submitted previously for the 2.6.25.10 kernel. This is a
resubmit based on 2.6.26.

Please let me know if there are any issues with this patch.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>


--- m25p80.c.orig	2008-07-13 14:51:29.000000000 -0700
+++ m25p80.c	2008-08-04 10:51:23.000000000 -0700
@@ -40,6 +40,7 @@
 #define	OPCODE_BE_32K		0x52	/* Erase 32KiB block */
 #define	OPCODE_SE		0xd8	/* Sector erase (usually
64KiB) */
 #define	OPCODE_RDID		0x9f	/* Read JEDEC ID */
+#define OPCODE_RDID_NON_JEDEC	0x90	/* Read ID */
=20
 /* Status Register bits. */
 #define	SR_WIP			1	/* Write in progress */
@@ -495,13 +496,17 @@ static struct flash_info __devinitdata m
 	{ "w25x16", 0xef3015, 64 * 1024, 32, SECT_4K, },
 	{ "w25x32", 0xef3016, 64 * 1024, 64, SECT_4K, },
 	{ "w25x64", 0xef3017, 64 * 1024, 128, SECT_4K, },
+
+	/* Non JEDEC ID SST -- large erase sizes are "overlays",
"sectors" are 4K */
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
@@ -509,7 +514,8 @@ static struct flash_info *__devinit jede
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
@@ -528,6 +534,30 @@ static struct flash_info *__devinit jede
 			return info;
 	}
 	dev_err(&spi->dev, "unrecognized JEDEC id %06x\n", jedec);
+
+	/* Try reading the Non-JEDEC Manufacture/Device ID */
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
 	return NULL;
 }
 =20
