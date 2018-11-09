Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLA5k-0001Qh-Ad
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2018 16:57:30 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@bootlin.com>, <marek.vasut@gmail.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <yogeshnarayan.gaur@nxp.com>, <cyrille.pitchen@wedev4u.fr>,
 <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 3/5] mtd: spi-nor: don't overwrite errno in
 spi_nor_get_map_in_use()
Date: Fri, 9 Nov 2018 16:56:52 +0000
Message-ID: <20181109165644.30534-4-tudor.ambarus@microchip.com>
References: <20181109165644.30534-1-tudor.ambarus@microchip.com>
In-Reply-To: <20181109165644.30534-1-tudor.ambarus@microchip.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Don't overwrite the errno from spi_nor_read_raw().

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 98e433e8e4c2..04a1c5b825e6 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2861,11 +2861,13 @@ static u8 spi_nor_smpt_read_dummy(const struct spi_=
nor *nor, const u32 settings)
  * @nor:	pointer to a 'struct spi_nor'
  * @smpt:	pointer to the sector map parameter table
  * @smpt_len:	sector map parameter table length
+ *
+ * Return: pointer to the map in use, ERR_PTR(-errno) otherwise.
  */
 static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *s=
mpt,
 					 u8 smpt_len)
 {
-	const u32 *ret =3D NULL;
+	const u32 *ret;
 	u32 addr;
 	int err;
 	u8 i;
@@ -2889,8 +2891,10 @@ static const u32 *spi_nor_get_map_in_use(struct spi_=
nor *nor, const u32 *smpt,
 		addr =3D smpt[i + 1];
=20
 		err =3D spi_nor_read_raw(nor, addr, 1, &data_byte);
-		if (err)
+		if (err) {
+			ret =3D ERR_PTR(err);
 			goto out;
+		}
=20
 		/*
 		 * Build an index value that is used to select the Sector Map
@@ -2906,6 +2910,7 @@ static const u32 *spi_nor_get_map_in_use(struct spi_n=
or *nor, const u32 *smpt,
 	 *
 	 * Find the matching configuration map.
 	 */
+	ret =3D ERR_PTR(-EINVAL);
 	while (i < smpt_len) {
 		if (SMPT_MAP_ID(smpt[i]) =3D=3D map_id) {
 			ret =3D smpt + i;
@@ -3046,8 +3051,8 @@ static int spi_nor_parse_smpt(struct spi_nor *nor,
 		smpt[i] =3D le32_to_cpu(smpt[i]);
=20
 	sector_map =3D spi_nor_get_map_in_use(nor, smpt, smpt_header->length);
-	if (!sector_map) {
-		ret =3D -EINVAL;
+	if (IS_ERR(sector_map)) {
+		ret =3D PTR_ERR(sector_map);
 		goto out;
 	}
=20
--=20
2.9.4
