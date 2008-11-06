Received: from exprod6og116.obsmtp.com ([64.18.1.37])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Ky7UR-00061h-5w
	for linux-mtd@lists.infradead.org; Thu, 06 Nov 2008 16:13:47 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH] mtd: m25p80.c add support for non-JEDEC ID devices
Date: Thu, 6 Nov 2008 11:13:39 -0500
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909C92033@mi8nycmail19.Mi8.com>
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE1909B55FFA@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE1909AEEF6B@mi8nycmail19.Mi8.com><1224330021.6770.1350.camel@macbook.infradead.org>
	<BD79186B4FD85F4B8E60E381CAEE1909B55FFA@mi8nycmail19.Mi8.com>
From: "hartleys" <hartleys@visionengravers.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday, October 19, 2008 12:32 PM, hartleys wrote:
>>> This patch allows the m25p80 driver to support non-JEDEC ID devices.
>>>=20
>>> It has been tested on an EP93xx based ARM platform with a
SST25LF020A
>>>
>>> 2Mbit SPI Serial Flash device.
>>>=20
>>> Any comments would be appreciated.
>>
>> Looks sane, but could I have an updated copy against the current git=20
>> tree please?
>
> I assume you meant the current mtd git tree.
>
> Here is the updated patch based on a:
>
> $ git clone
> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
linux-2.6
> $ git-clone --reference linux-2.6 git://git.infradead.org/mtd-2.6
>=20
> Hope this one is better.
>
> Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

Did this patch look better?

I see the current mtd git tree has another change.

static inline int write_enable(struct m25p *flash)
{
	u8	code =3D OPCODE_WREN;

-	return spi_write(flash->spi, &code, 1);
+	return spi_write_then_read(flash->spi, &code, 1, NULL, 0);
}

Do I need to create another updated patch?

Thanks,
Hartley

---

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 697a3a2..f75c70f 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -42,6 +42,7 @@
 #define	OPCODE_BE		0xc7	/* Erase whole flash
block */
 #define	OPCODE_SE		0xd8	/* Sector erase (usually
64KiB) */
 #define	OPCODE_RDID		0x9f	/* Read JEDEC ID */
+#define	OPCODE_RDID_NON_JEDEC	0x90	/* Read non-JEDEC ID */
=20
 /* Status Register bits. */
 #define	SR_WIP			1	/* Write in progress */
@@ -542,12 +543,16 @@ static struct flash_info __devinitdata m25p_data
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
@@ -557,6 +562,7 @@ static struct flash_info *__devinit
jedec_probe(struct spi_device *spi)
 	 * string for after vendor-specific data, after the three bytes
 	 * we use here.  Supporting some chips might require using it.
 	 */
+	code[0] =3D OPCODE_RDID;
 	tmp =3D spi_write_then_read(spi, &code, 1, id, 5);
 	if (tmp < 0) {
 		DEBUG(MTD_DEBUG_LEVEL0, "%s: error %d reading JEDEC
ID\n", @@ -580,6 +586,31 @@ static struct flash_info *__devinit
jedec_probe(struct spi_device *spi)
 			return info;
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

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
