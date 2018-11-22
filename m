Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPoER-0000un-SN
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2018 12:37:21 +0000
From: <Tudor.Ambarus@microchip.com>
To: <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <boris.brezillon@bootlin.com>,
 <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <alexander.sverdlin@nokia.com>, <Tudor.Ambarus@microchip.com>
Subject: [PATCH] mtd: spi-nor: fix erase_type array to indicate current map
 conf
Date: Thu, 22 Nov 2018 12:36:59 +0000
Message-ID: <20181122123552.15756-1-tudor.ambarus@microchip.com>
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

Bug reported for the out-of-tree S25FS128S flash memory.

BFPT table advertises all the erase types supported by all the
possible map configurations. Update the erase_type array to indicate
which erase types are applicable to the current map configuration.

Backward compatibility test done on sst26vf064b.

Fixes: b038e8e3be72 ("mtd: spi-nor: parse SFDP Sector Map Parameter Table")
Reported-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 93c9bc8931fc..a71adcd6ddfa 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -3000,7 +3000,8 @@ static int spi_nor_init_non_uniform_erase_map(struct =
spi_nor *nor,
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
+	 * BFPT table advertises all the erase types supported by all the
+	 * possible map configurations. Update the erase_type array to indicate
+	 * which erase types are applicable to the current map configuration.
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
