Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNiCi-0005Sg-PD
 for linux-mtd@lists.infradead.org; Fri, 16 Nov 2018 17:46:54 +0000
From: <Tudor.Ambarus@microchip.com>
To: <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <boris.brezillon@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2] mtd: spi-nor: fix selection of uniform erase type in
 flexible conf
Date: Fri, 16 Nov 2018 17:46:37 +0000
Message-ID: <20181116174624.10817-1-tudor.ambarus@microchip.com>
References: <3c2c7a76-c7da-5c6e-0bb3-8963132f79d4@microchip.com>
In-Reply-To: <3c2c7a76-c7da-5c6e-0bb3-8963132f79d4@microchip.com>
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

There are uniform, non-uniform and flexible erase flash configurations.

The non-uniform erase types, are the erase types that can _not_ erase
the entire flash by their own.

As the code was, in case flashes had flexible erase capabilities
(support both uniform and non-uniform erase types in the same flash
configuration) and supported multiple uniform erase type sizes, the
code did not sort the uniform erase types, and could select a wrong
erase type size.

Sort the uniform erase mask in case of flexible erase flash
configurations, in order to select the best uniform erase type size.

Uniform, non-uniform, and flexible configurations with just a valid
uniform erase type, are not affected by this change.

Uniform erase tested on mx25l3273fm2i-08g and sst26vf064B-104i/sn.
Non uniform erase tested on sst26vf064B-104i/sn.

Fixes: 5390a8df769e ("mtd: spi-nor: add support to non-uniform SFDP SPI NOR=
 flash memories")
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
v2: drop uneeded change

 drivers/mtd/spi-nor/spi-nor.c | 47 +++++++++++++++++++++++++++++++++------=
----
 1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 69784b3b8ca1..4c7e4dc25006 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2529,6 +2529,34 @@ static int spi_nor_map_cmp_erase_type(const void *l,=
 const void *r)
 }
=20
 /**
+ * spi_nor_sort_erase_mask() - sort erase mask
+ * @map:	the erase map of the SPI NOR
+ * @erase_mask:	the erase type mask to be sorted
+ *
+ * Replicate the sort done for the map's erase types in BFPT: sort the era=
se
+ * mask in ascending order with the smallest erase type size starting from
+ * BIT(0) in the sorted erase mask.
+ *
+ * Return: sorted erase mask.
+ */
+static u8 spi_nor_sort_erase_mask(struct spi_nor_erase_map *map, u8 erase_=
mask)
+{
+	struct spi_nor_erase_type *erase_type =3D map->erase_type;
+	int i;
+	u8 sorted_erase_mask =3D 0;
+
+	if (!erase_mask)
+		return 0;
+
+	/* Replicate the sort done for the map's erase types. */
+	for (i =3D 0; i < SNOR_ERASE_TYPE_MAX; i++)
+		if (erase_type[i].size && erase_mask & BIT(erase_type[i].idx))
+			sorted_erase_mask |=3D BIT(i);
+
+	return sorted_erase_mask;
+}
+
+/**
  * spi_nor_regions_sort_erase_types() - sort erase types in each region
  * @map:	the erase map of the SPI NOR
  *
@@ -2543,19 +2571,13 @@ static int spi_nor_map_cmp_erase_type(const void *l=
, const void *r)
 static void spi_nor_regions_sort_erase_types(struct spi_nor_erase_map *map=
)
 {
 	struct spi_nor_erase_region *region =3D map->regions;
-	struct spi_nor_erase_type *erase_type =3D map->erase_type;
-	int i;
 	u8 region_erase_mask, sorted_erase_mask;
=20
 	while (region) {
 		region_erase_mask =3D region->offset & SNOR_ERASE_TYPE_MASK;
=20
-		/* Replicate the sort done for the map's erase types. */
-		sorted_erase_mask =3D 0;
-		for (i =3D 0; i < SNOR_ERASE_TYPE_MAX; i++)
-			if (erase_type[i].size &&
-			    region_erase_mask & BIT(erase_type[i].idx))
-				sorted_erase_mask |=3D BIT(i);
+		sorted_erase_mask =3D spi_nor_sort_erase_mask(map,
+							    region_erase_mask);
=20
 		/* Overwrite erase mask. */
 		region->offset =3D (region->offset & ~SNOR_ERASE_TYPE_MASK) |
@@ -2985,7 +3007,7 @@ static int spi_nor_init_non_uniform_erase_map(struct =
spi_nor *nor,
 	u64 offset;
 	u32 region_count;
 	int i, j;
-	u8 erase_type;
+	u8 erase_type, uniform_erase_type;
=20
 	region_count =3D SMPT_MAP_REGION_COUNT(*smpt);
 	/*
@@ -2998,7 +3020,7 @@ static int spi_nor_init_non_uniform_erase_map(struct =
spi_nor *nor,
 		return -ENOMEM;
 	map->regions =3D region;
=20
-	map->uniform_erase_type =3D 0xff;
+	uniform_erase_type =3D 0xff;
 	offset =3D 0;
 	/* Populate regions. */
 	for (i =3D 0; i < region_count; i++) {
@@ -3013,12 +3035,15 @@ static int spi_nor_init_non_uniform_erase_map(struc=
t spi_nor *nor,
 		 * Save the erase types that are supported in all regions and
 		 * can erase the entire flash memory.
 		 */
-		map->uniform_erase_type &=3D erase_type;
+		uniform_erase_type &=3D erase_type;
=20
 		offset =3D (region[i].offset & ~SNOR_ERASE_FLAGS_MASK) +
 			 region[i].size;
 	}
=20
+	map->uniform_erase_type =3D spi_nor_sort_erase_mask(map,
+							  uniform_erase_type);
+
 	spi_nor_region_mark_end(&region[i - 1]);
=20
 	return 0;
--=20
2.9.4
