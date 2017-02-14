Received: from ns.omicron.at ([212.183.10.25])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdfAU-00044g-E9
 for linux-mtd@lists.infradead.org; Tue, 14 Feb 2017 15:37:38 +0000
From: <mark.marshall@omicronenergy.com>
To: <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>,
 <cyrille.pitchen@atmel.com>, <marek.vasut@gmail.com>
CC: <markmarshall14@gmail.com>, <dwmw2@infradead.org>, <richard@nod.at>,
 <boris.brezillon@free-electrons.com>, Mark Marshall
 <mark.marshall@omicronenergy.com>
Subject: [PATCH v2 1/3] mtd: spi-nor: flash_info table, use a u64 for the ID
Date: Tue, 14 Feb 2017 16:35:51 +0100
Message-ID: <04e48a3c19a8efb9e0d1d24bccf7b44a5a4b4ce8.1487085166.git.mark.marshall@omicronenergy.com>
In-Reply-To: <cover.1487085166.git.mark.marshall@omicronenergy.com>
References: <cover.1487085166.git.mark.marshall@omicronenergy.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Mark Marshall <mark.marshall@omicronenergy.com>

The flash_info ID matching table is getting more complex as different
chips are added.  Some chips require different amounts of the response
to the RDID command to be matched.  Replace the current u8 array and
length with a u64 id and a u64 id_mask.  This allows us to simplify the
macros used to generate the flash_info table without loosing the ability
to generate "unusual" entries.

Signed-off-by: Mark Marshall <mark.marshall@omicronenergy.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 119 ++++++++++++++++++++++--------------------
 1 file changed, 62 insertions(+), 57 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 1ae872b..ab3f380 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -41,15 +41,22 @@
 #define SPI_NOR_MAX_ADDR_WIDTH	4
 
 struct flash_info {
-	char		*name;
+	const char	*name;
 
 	/*
-	 * This array stores the ID bytes.
-	 * The first three bytes are the JEDIC ID.
-	 * JEDEC ID zero means "no ID" (mostly older chips).
+	 * This u64 stores the ID bytes.
+	 * The bytes are stored in big-endian order (that is, the
+	 * first byte of the RDID result is the MSB of the value.  The
+	 * u64 is stored in host endian).
+	 * The upper three bytes are the JEDEC ID, the lower bytes are
+	 * the extension.
 	 */
-	u8		id[SPI_NOR_MAX_ID_LEN];
-	u8		id_len;
+	u64		id;
+
+	/*
+	 * An id_mask of zero means "no ID" (mostly older chips).
+	 */
+	u64		id_mask;
 
 	/* The size listed here is what works with SPINOR_OP_SE, which isn't
 	 * necessarily called a "sector" by the vendor.
@@ -87,7 +94,7 @@ struct flash_info {
 					 */
 };
 
-#define JEDEC_MFR(info)	((info)->id[0])
+#define JEDEC_MFR(info)	((u8)((info)->id >> 56) & 0xff)
 
 static const struct flash_info *spi_nor_match_id(const char *name);
 
@@ -870,55 +877,49 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	return ret;
 }
 
+#define INFO_RAW(_id, _id_mask, _sector_size, _n_sectors, _page_size, _addr_width, _flags) \
+	.id = (_id),							\
+	.id_mask = (_id_mask),						\
+	.sector_size = (_sector_size),					\
+	.n_sectors = (_n_sectors),					\
+	.page_size = (_page_size),					\
+	.addr_width = (_addr_width),					\
+	.flags = (_flags),
+
 /* Used when the "_ext_id" is two bytes at most */
 #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
-		.id = {							\
-			((_jedec_id) >> 16) & 0xff,			\
-			((_jedec_id) >> 8) & 0xff,			\
-			(_jedec_id) & 0xff,				\
-			((_ext_id) >> 8) & 0xff,			\
-			(_ext_id) & 0xff,				\
-			},						\
-		.id_len = (!(_jedec_id) ? 0 : (3 + ((_ext_id) ? 2 : 0))),	\
-		.sector_size = (_sector_size),				\
-		.n_sectors = (_n_sectors),				\
-		.page_size = 256,					\
-		.flags = (_flags),
+	INFO_RAW(!(_jedec_id) ? 0 :					\
+		 (((u64)(_jedec_id) << (64 - (8 * 3))) |		\
+		  ((u64)(_ext_id) << (64 - (40)))),			\
+		 !(_jedec_id) ? 0 :					\
+		 GENMASK_ULL(63, 64 - (8 * (3 + ((_ext_id) ? 2 : 0)))),	\
+		 (_sector_size),					\
+		 (_n_sectors),						\
+		 256,							\
+		 0,							\
+		 (_flags))
 
 #define INFO6(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
-		.id = {							\
-			((_jedec_id) >> 16) & 0xff,			\
-			((_jedec_id) >> 8) & 0xff,			\
-			(_jedec_id) & 0xff,				\
-			((_ext_id) >> 16) & 0xff,			\
-			((_ext_id) >> 8) & 0xff,			\
-			(_ext_id) & 0xff,				\
-			},						\
-		.id_len = 6,						\
-		.sector_size = (_sector_size),				\
-		.n_sectors = (_n_sectors),				\
-		.page_size = 256,					\
-		.flags = (_flags),
+	INFO_RAW((((u64)(_jedec_id) << (64 - (8 * 3))) |		\
+		  ((u64)(_ext_id) << (64 - (48)))),			\
+		 GENMASK_ULL(63, 64 - (8 * (3 + ((_ext_id) ? 3 : 0)))),	\
+		 (_sector_size),					\
+		 (_n_sectors),						\
+		 256,							\
+		 0,							\
+		 (_flags))
 
 #define CAT25_INFO(_sector_size, _n_sectors, _page_size, _addr_width, _flags)	\
-		.sector_size = (_sector_size),				\
-		.n_sectors = (_n_sectors),				\
-		.page_size = (_page_size),				\
-		.addr_width = (_addr_width),				\
-		.flags = (_flags),
+	INFO_RAW(0, 0, (_sector_size), (_n_sectors), (_page_size), (_addr_width), (_flags))
 
 #define S3AN_INFO(_jedec_id, _n_sectors, _page_size)			\
-		.id = {							\
-			((_jedec_id) >> 16) & 0xff,			\
-			((_jedec_id) >> 8) & 0xff,			\
-			(_jedec_id) & 0xff				\
-			},						\
-		.id_len = 3,						\
-		.sector_size = (8*_page_size),				\
-		.n_sectors = (_n_sectors),				\
-		.page_size = _page_size,				\
-		.addr_width = 3,					\
-		.flags = SPI_NOR_NO_FR | SPI_S3AN,
+	INFO_RAW((((u64)(_jedec_id) << (64 - (8 * 3)))),		\
+		 GENMASK_ULL(63, 64 - (8 * (3))),			\
+		 8 * (_page_size),					\
+		 (_n_sectors),						\
+		 (_page_size),						\
+		 3,							\
+		 SPI_NOR_NO_FR | SPI_S3AN)
 
 /* NOTE: double check command sets and memory organization when you add
  * more nor chips.  This current list focusses on newer chips, which
@@ -1170,24 +1171,28 @@ static const struct flash_info spi_nor_ids[] = {
 static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
 {
 	int			tmp;
-	u8			id[SPI_NOR_MAX_ID_LEN];
+	u8			id_bytes[sizeof(u64)];
+	u64			id;
 	const struct flash_info	*info;
 
-	tmp = nor->read_reg(nor, SPINOR_OP_RDID, id, SPI_NOR_MAX_ID_LEN);
+	BUILD_BUG_ON(SPI_NOR_MAX_ID_LEN > sizeof(u64));
+
+	memset(id_bytes, 0, sizeof(id_bytes));
+	tmp = nor->read_reg(nor, SPINOR_OP_RDID, id_bytes, SPI_NOR_MAX_ID_LEN);
 	if (tmp < 0) {
 		dev_dbg(nor->dev, "error %d reading JEDEC ID\n", tmp);
 		return ERR_PTR(tmp);
 	}
 
+	id = get_unaligned_be64(id_bytes);
+
 	for (tmp = 0; tmp < ARRAY_SIZE(spi_nor_ids) - 1; tmp++) {
 		info = &spi_nor_ids[tmp];
-		if (info->id_len) {
-			if (!memcmp(info->id, id, info->id_len))
-				return &spi_nor_ids[tmp];
-		}
+		if (info->id_mask && (id & info->id_mask) == info->id)
+			return info;
 	}
-	dev_err(nor->dev, "unrecognized JEDEC id bytes: %02x, %02x, %02x\n",
-		id[0], id[1], id[2]);
+	dev_err(nor->dev, "unrecognized JEDEC id bytes: %*ph\n",
+		SPI_NOR_MAX_ID_LEN, id_bytes);
 	return ERR_PTR(-ENODEV);
 }
 
@@ -1551,7 +1556,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	 * If caller has specified name of flash model that can normally be
 	 * detected using JEDEC, let's verify it.
 	 */
-	if (name && info->id_len) {
+	if (name && info->id_mask) {
 		const struct flash_info *jinfo;
 
 		jinfo = spi_nor_read_id(nor);
-- 
2.7.4
