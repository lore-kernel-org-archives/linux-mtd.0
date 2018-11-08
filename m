Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKi9k-0004A7-Q2
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2018 11:07:26 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@bootlin.com>, <marek.vasut@gmail.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <yogeshnarayan.gaur@nxp.com>, <cyrille.pitchen@wedev4u.fr>,
 <Tudor.Ambarus@microchip.com>
Subject: [PATCH 2/7] mtd: spi-nor: fix iteration over smpt array
Date: Thu, 8 Nov 2018 11:07:09 +0000
Message-ID: <20181108110653.21063-3-tudor.ambarus@microchip.com>
References: <20181108110653.21063-1-tudor.ambarus@microchip.com>
In-Reply-To: <20181108110653.21063-1-tudor.ambarus@microchip.com>
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

Iterate over smpt array using its starting address and length
instead of the blindly iterations that used data found in the array.

This prevents possible memory accesses outside of the smpt array
boundaries in case software, or manufacturers, misrepresent smpt
array fields.

Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 39 +++++++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 2cdf96013689..59dcedb08691 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2860,12 +2860,15 @@ static u8 spi_nor_smpt_read_dummy(const struct spi_=
nor *nor, const u32 settings)
  * spi_nor_get_map_in_use() - get the configuration map in use
  * @nor:	pointer to a 'struct spi_nor'
  * @smpt:	pointer to the sector map parameter table
+ * @smpt_len:	sector map parameter table length
  */
-static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *s=
mpt)
+static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *s=
mpt,
+					 u8 smpt_len)
 {
 	const u32 *ret =3D NULL;
-	u32 i, addr;
+	u32 addr;
 	int err;
+	u8 i;
 	u8 addr_width, read_opcode, read_dummy;
 	u8 read_data_mask, data_byte, map_id;
=20
@@ -2874,9 +2877,10 @@ static const u32 *spi_nor_get_map_in_use(struct spi_=
nor *nor, const u32 *smpt)
 	read_opcode =3D nor->read_opcode;
=20
 	map_id =3D 0;
-	i =3D 0;
 	/* Determine if there are any optional Detection Command Descriptors */
-	while (!(smpt[i] & SMPT_DESC_TYPE_MAP)) {
+	for (i =3D 0; i < smpt_len; i +=3D 2) {
+		if (smpt[i] & SMPT_DESC_TYPE_MAP)
+			break;
 		read_data_mask =3D SMPT_CMD_READ_DATA(smpt[i]);
 		nor->addr_width =3D spi_nor_smpt_addr_width(nor, smpt[i]);
 		nor->read_dummy =3D spi_nor_smpt_read_dummy(nor, smpt[i]);
@@ -2892,18 +2896,33 @@ static const u32 *spi_nor_get_map_in_use(struct spi=
_nor *nor, const u32 *smpt)
 		 * Configuration that is currently in use.
 		 */
 		map_id =3D map_id << 1 | !!(data_byte & read_data_mask);
-		i =3D i + 2;
 	}
=20
-	/* Find the matching configuration map */
-	while (SMPT_MAP_ID(smpt[i]) !=3D map_id) {
+	/*
+	 * If command descriptors are provided, they always precede map
+	 * descriptors in the table. There is no need to start the iteration
+	 * over smpt array all over again.
+	 *
+	 * Find the matching configuration map.
+	 */
+	while (i < smpt_len) {
+		if (SMPT_MAP_ID(smpt[i]) =3D=3D map_id) {
+			ret =3D smpt + i;
+			break;
+		}
+
+		/*
+		 * If there are no more configuration map descriptors and no
+		 * configuration ID matched the configuration identifier, the
+		 * sector address map is unknown.
+		 */
 		if (smpt[i] & SMPT_DESC_END)
-			goto out;
+			break;
+
 		/* increment the table index to the next map */
 		i +=3D SMPT_MAP_REGION_COUNT(smpt[i]) + 1;
 	}
=20
-	ret =3D smpt + i;
 	/* fall through */
 out:
 	nor->addr_width =3D addr_width;
@@ -3025,7 +3044,7 @@ static int spi_nor_parse_smpt(struct spi_nor *nor,
 	for (i =3D 0; i < smpt_header->length; i++)
 		smpt[i] =3D le32_to_cpu(smpt[i]);
=20
-	sector_map =3D spi_nor_get_map_in_use(nor, smpt);
+	sector_map =3D spi_nor_get_map_in_use(nor, smpt, smpt_header->length);
 	if (!sector_map) {
 		ret =3D -EINVAL;
 		goto out;
--=20
2.9.4
