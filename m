Received: from ns.omicron.at ([212.183.10.25])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cW1XS-0007yA-IJ
 for linux-mtd@lists.infradead.org; Tue, 24 Jan 2017 13:53:36 +0000
From: <mark.marshall@omicronenergy.com>
To: <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <markmarshall14@gmail.com>, <cyrille.pitchen@atmel.com>,
 <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <boris.brezillon@free-electrons.com>, <richard@nod.at>, Mark Marshall
 <mark.marshall@omicronenergy.com>
Subject: [PATCH] m25p80: Use a 512 byte page size for Spansion flash s25fl512s
Date: Tue, 24 Jan 2017 14:52:09 +0100
Message-ID: <1485265929-24020-1-git-send-email-mark.marshall@omicronenergy.com>
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

The s25fl512s flash from Spansion has a 512 byte write page size,
which means that we can write 512 bytes at a time (instead of 256).

This single change makes writing to the flash about 2x faster.

Signed-off-by: Mark Marshall <mark.marshall@omicronenergy.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index da7cd69..c9ac0bf 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -775,6 +775,21 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 		.page_size = 256,					\
 		.flags = (_flags),
 
+/* Used to set a custom (non 256) page_size */
+#define INFOP(_jedec_id, _ext_id, _sector_size, _n_sectors, _pg_sz, _flags) \
+		.id = {							\
+			((_jedec_id) >> 16) & 0xff,			\
+			((_jedec_id) >> 8) & 0xff,			\
+			(_jedec_id) & 0xff,				\
+			((_ext_id) >> 8) & 0xff,			\
+			(_ext_id) & 0xff,				\
+			},						\
+		.id_len = (!(_jedec_id) ? 0 : (3 + ((_ext_id) ? 2 : 0))), \
+		.sector_size = (_sector_size),				\
+		.n_sectors = (_n_sectors),				\
+		.page_size = (_pg_sz),					\
+		.flags = (_flags),					\
+
 #define CAT25_INFO(_sector_size, _n_sectors, _page_size, _addr_width, _flags)	\
 		.sector_size = (_sector_size),				\
 		.n_sectors = (_n_sectors),				\
@@ -905,7 +920,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, 0) },
 	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25fl512s",  INFOP(0x010220, 0x4d00, 256 * 1024, 256, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
 	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
-- 
2.7.4
