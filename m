Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRGH2-0003bx-9k
 for linux-mtd@lists.infradead.org; Mon, 26 Nov 2018 12:46:01 +0000
From: <Tudor.Ambarus@microchip.com>
To: <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <boris.brezillon@bootlin.com>,
 <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <alexander.sverdlin@nokia.com>, <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2] mtd: spi-nor: fix erase_type array to indicate current map
 conf
Date: Mon, 26 Nov 2018 12:45:44 +0000
Message-ID: <20181126124531.17548-1-tudor.ambarus@microchip.com>
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

From: Tudor Ambarus <tudor.ambarus@microchip.com>

BFPT advertises all the erase types supported by all the possible
map configurations. Mask out the erase types that are not supported
by the current map configuration.

Backward compatibility test done on sst26vf064b.

Fixes: b038e8e3be72 ("mtd: spi-nor: parse SFDP Sector Map Parameter Table")
Reported-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
v2:
- drop const qualifier
- update commit message and comment

 drivers/mtd/spi-nor/spi-nor.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 93c9bc8931fc..1fdd2834fbcb 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2995,12 +2995,13 @@ static int spi_nor_init_non_uniform_erase_map(struc=
t spi_nor *nor,
 					      const u32 *smpt)
 {
 	struct spi_nor_erase_map *map =3D &nor->erase_map;
-	const struct spi_nor_erase_type *erase =3D map->erase_type;
+	struct spi_nor_erase_type *erase =3D map->erase_type;
 	struct spi_nor_erase_region *region;
 	u64 offset;
 	u32 region_count;
 	int i, j;
-	u8 erase_type, uniform_erase_type;
+	u8 uniform_erase_type, save_uniform_erase_type;
+	u8 erase_type, regions_erase_type;
=20
 	region_count =3D SMPT_MAP_REGION_COUNT(*smpt);
 	/*
@@ -3014,6 +3015,7 @@ static int spi_nor_init_non_uniform_erase_map(struct =
spi_nor *nor,
 	map->regions =3D region;
=20
 	uniform_erase_type =3D 0xff;
+	regions_erase_type =3D 0;
 	offset =3D 0;
 	/* Populate regions. */
 	for (i =3D 0; i < region_count; i++) {
@@ -3030,13 +3032,38 @@ static int spi_nor_init_non_uniform_erase_map(struc=
t spi_nor *nor,
 		 */
 		uniform_erase_type &=3D erase_type;
=20
+		/*
+		 * regions_erase_type mask will indicate all the erase types
+		 * supported in this configuration map.
+		 */
+		regions_erase_type |=3D erase_type;
+
 		offset =3D (region[i].offset & ~SNOR_ERASE_FLAGS_MASK) +
 			 region[i].size;
 	}
=20
+	save_uniform_erase_type =3D map->uniform_erase_type;
 	map->uniform_erase_type =3D spi_nor_sort_erase_mask(map,
 							  uniform_erase_type);
=20
+	if (!regions_erase_type) {
+		/*
+		 * Roll back to the previous uniform_erase_type mask, SMPT is
+		 * broken.
+		 */
+		map->uniform_erase_type =3D save_uniform_erase_type;
+		return -EINVAL;
+	}
+
+	/*
+	 * BFPT advertises all the erase types supported by all the possible
+	 * map configurations. Mask out the erase types that are not supported
+	 * by the current map configuration.
+	 */
+	for (i =3D 0; i < SNOR_ERASE_TYPE_MAX; i++)
+		if (!(regions_erase_type & BIT(erase[i].idx)))
+			spi_nor_set_erase_type(&erase[i], 0, 0xFF);
+
 	spi_nor_region_mark_end(&region[i - 1]);
=20
 	return 0;
--=20
2.9.4
