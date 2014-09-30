Message-ID: <1412043317.9388.84.camel@decadent.org.uk>
Subject: [PATCH v2 3/5] spi-nor: Make spi_nor_scan() take a chip type name,
 not an spi_device_id
From: Ben Hutchings <ben@decadent.org.uk>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 30 Sep 2014 03:15:17 +0100
In-Reply-To: <1412043222.9388.81.camel@decadent.org.uk>
References: <1412043222.9388.81.camel@decadent.org.uk>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-88sgi5Snfvw6h7Vzw61D"
Mime-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Ian Campbell <ijc@hellion.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Huang Shijie <shijie8@gmail.com>, linux-arm-kernel@lists.infradead.org,
 debian-kernel <debian-kernel@lists.debian.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-88sgi5Snfvw6h7Vzw61D
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Drivers currently call spi_nor_match_id() and then spi_nor_scan().
This adds a dependency on struct spi_device_id which we want to
avoid.  Make spi_nor_scan() do it for them.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 drivers/mtd/devices/m25p80.c      | 13 +++++--------
 drivers/mtd/spi-nor/fsl-quadspi.c |  7 +------
 drivers/mtd/spi-nor/spi-nor.c     | 13 +++++++++----
 include/linux/mtd/spi-nor.h       | 20 ++------------------
 4 files changed, 17 insertions(+), 36 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 204bec1..d9578b9 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -193,7 +193,7 @@ static int m25p_probe(struct spi_device *spi)
 {
 	struct mtd_part_parser_data	ppdata;
 	struct flash_platform_data	*data;
-	const struct spi_device_id *id =3D NULL;
+	const char *name =3D NULL;
 	struct m25p *flash;
 	struct spi_nor *nor;
 	enum read_mode mode =3D SPI_NOR_NORMAL;
@@ -236,16 +236,13 @@ static int m25p_probe(struct spi_device *spi)
 	 * If that's the case, respect "type" and ignore a "name".
 	 */
 	if (data && data->type)
-		id =3D spi_nor_match_id(data->type);
+		name =3D data->type;
=20
 	/* If we didn't get name from platform, simply use "modalias". */
-	if (!id) {
-		id =3D spi_nor_match_id(spi_get_device_id(spi)->name);
-		if (WARN_ON(!id))
-			return -ENODEV;
-	}
+	if (!name)
+		name =3D spi_get_device_id(spi)->name;
=20
-	ret =3D spi_nor_scan(nor, id, mode);
+	ret =3D spi_nor_scan(nor, name, mode);
 	if (ret)
 		return ret;
=20
diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-qu=
adspi.c
index 8d659a2..d5269a2 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -881,7 +881,6 @@ static int fsl_qspi_probe(struct platform_device *pdev)
=20
 	/* iterate the subnodes. */
 	for_each_available_child_of_node(dev->of_node, np) {
-		const struct spi_device_id *id;
 		char modalias[40];
=20
 		/* skip the holes */
@@ -909,10 +908,6 @@ static int fsl_qspi_probe(struct platform_device *pdev=
)
 		if (of_modalias_node(np, modalias, sizeof(modalias)) < 0)
 			goto map_failed;
=20
-		id =3D spi_nor_match_id(modalias);
-		if (!id)
-			goto map_failed;
-
 		ret =3D of_property_read_u32(np, "spi-max-frequency",
 				&q->clk_rate);
 		if (ret < 0)
@@ -921,7 +916,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 		/* set the chip address for READID */
 		fsl_qspi_set_base_addr(q, nor);
=20
-		ret =3D spi_nor_scan(nor, id, SPI_NOR_QUAD);
+		ret =3D spi_nor_scan(nor, modalias, SPI_NOR_QUAD);
 		if (ret)
 			goto map_failed;
=20
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index c2f0573..171c665 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -28,6 +28,8 @@
=20
 #define JEDEC_MFR(_jedec_id)	((_jedec_id) >> 16)
=20
+static const struct spi_device_id *spi_nor_match_id(const char *name);
+
 /*
  * Read the status register, returning its value in the location
  * Return the status register value.
@@ -908,9 +910,9 @@ static int spi_nor_check(struct spi_nor *nor)
 	return 0;
 }
=20
-int spi_nor_scan(struct spi_nor *nor, const struct spi_device_id *id,
-			enum read_mode mode)
+int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mod=
e)
 {
+	const struct spi_device_id	*id =3D NULL;
 	struct flash_info		*info;
 	struct device *dev =3D nor->dev;
 	struct mtd_info *mtd =3D nor->mtd;
@@ -922,6 +924,10 @@ int spi_nor_scan(struct spi_nor *nor, const struct spi=
_device_id *id,
 	if (ret)
 		return ret;
=20
+	id =3D spi_nor_match_id(name);
+	if (!id)
+		return -ENODEV;
+
 	info =3D (void *)id->driver_data;
=20
 	if (info->jedec_id) {
@@ -1110,7 +1116,7 @@ int spi_nor_scan(struct spi_nor *nor, const struct sp=
i_device_id *id,
 }
 EXPORT_SYMBOL_GPL(spi_nor_scan);
=20
-const struct spi_device_id *spi_nor_match_id(const char *name)
+static const struct spi_device_id *spi_nor_match_id(const char *name)
 {
 	const struct spi_device_id *id =3D spi_nor_ids;
=20
@@ -1121,7 +1127,6 @@ const struct spi_device_id *spi_nor_match_id(const ch=
ar *name)
 	}
 	return NULL;
 }
-EXPORT_SYMBOL_GPL(spi_nor_match_id);
=20
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Huang Shijie <shijie8@gmail.com>");
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 66af67a..c48ad49 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -184,31 +184,15 @@ struct spi_nor {
 /**
  * spi_nor_scan() - scan the SPI NOR
  * @nor:	the spi_nor structure
- * @id:		the spi_device_id provided by the driver
+ * @name:	the chip type name
  * @mode:	the read mode supported by the driver
  *
  * The drivers can use this fuction to scan the SPI NOR.
  * In the scanning, it will try to get all the necessary information to
  * fill the mtd_info{} and the spi_nor{}.
  *
- * The board may assigns a spi_device_id with @id which be used to compare=
d with
- * the spi_device_id detected by the scanning.
- *
  * Return: 0 for success, others for failure.
  */
-int spi_nor_scan(struct spi_nor *nor, const struct spi_device_id *id,
-			enum read_mode mode);
-
-/**
- * spi_nor_match_id() - find the spi_device_id by the name
- * @name:	the name of the spi_device_id
- *
- * The drivers use this function to find the spi_device_id
- * specified by the @name.
- *
- * Return: returns the right spi_device_id pointer on success,
- *         and returns NULL on failure.
- */
-const struct spi_device_id *spi_nor_match_id(const char *name);
+int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mod=
e);
=20
 #endif


--=20
Ben Hutchings
The two most common things in the universe are hydrogen and stupidity.

--=-88sgi5Snfvw6h7Vzw61D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUAVCoSNee/yOyVhhEJAQrpixAAhQqqM8vfA26jginx3J59MXsQ0B4uegr5
e2ogCVQmJWwXx4zELhbi6vgSUIKXazrEqldRWYo4k9If9iBKFYTIRXkvznqxuV0X
tDxZ0hjprSCKe1GkxePbFchsFqHgslSp8gSLp+X+IiAAXI4Kieu2Y/g30G4hNA6h
y8h7ZnEwj8bF71VhxaZvvRQo9KgktEX0a7gISZiKut543tqh49+UCDqPZAjf/kNI
OTROeal588u/9fQxf5WCaylnt8hnahgbeH1lP32fJI/G0/xbWTSUheeS9tOFFtQ4
6Pyi9tSljLXlgX+Qd/SoWI+s9BOxfo2oPwX8phQiB9TrYlEBu8O6GdYfOzXi5OfG
ac41Go/aNJCfumHfkig3F9zw3/f0bqFwOyLhuHCltrXZ/ZHnfUjkU0h7/zxzWMIZ
DkOaOzoTDreM9jNlSpOS/uL0H3E7w1GKfGKShwcRS7ERhnTkx+G8S4ijhvHitI30
bHltPjSax9UbsyJGWUFDLN+fGUgHGZb89EaFwo4PW/U890Hho0PgVt6oOGjcTChX
8KJ0iLga293wPVZlDP5sRXvaeoJGrw2Lpz3A+ClVUI+4NIJs/v5ukNRBiVUMmOEM
+2CYykWhFB8CCx3lBgol+ewGuBSpVd20FYjJ7/XzL2n4WzZwnT+B0KYPwXH1N7Td
yYZk6IDQrgg=
=dqOH
-----END PGP SIGNATURE-----

--=-88sgi5Snfvw6h7Vzw61D--
