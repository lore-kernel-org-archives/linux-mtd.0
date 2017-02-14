Received: from ns.omicron.at ([212.183.10.25])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdfAU-00046L-CZ
 for linux-mtd@lists.infradead.org; Tue, 14 Feb 2017 15:37:46 +0000
From: <mark.marshall@omicronenergy.com>
To: <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>,
 <cyrille.pitchen@atmel.com>, <marek.vasut@gmail.com>
CC: <markmarshall14@gmail.com>, <dwmw2@infradead.org>, <richard@nod.at>,
 <boris.brezillon@free-electrons.com>, Mark Marshall
 <mark.marshall@omicronenergy.com>
Subject: [PATCH v2 2/3] mtd: spi-nor: Use more explicit macros to generate the
 flash_info table
Date: Tue, 14 Feb 2017 16:35:52 +0100
Message-ID: <3a073e55867081d8218710bdec36845a542121e2.1487085166.git.mark.marshall@omicronenergy.com>
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

Now that we are storing the RDID id as a u64 we can try to reduce the
number of special INFO macros that we need, but also add the possibility
of setting all of the fields of the structure, if we need to.

Signed-off-by: Mark Marshall <mark.marshall@omicronenergy.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 374 +++++++++++++++++++++---------------------
 1 file changed, 190 insertions(+), 184 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index ab3f380..467dc93 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -886,36 +886,42 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	.addr_width = (_addr_width),					\
 	.flags = (_flags),
 
-/* Used when the "_ext_id" is two bytes at most */
-#define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
-	INFO_RAW(!(_jedec_id) ? 0 :					\
-		 (((u64)(_jedec_id) << (64 - (8 * 3))) |		\
-		  ((u64)(_ext_id) << (64 - (40)))),			\
-		 !(_jedec_id) ? 0 :					\
-		 GENMASK_ULL(63, 64 - (8 * (3 + ((_ext_id) ? 2 : 0)))),	\
-		 (_sector_size),					\
-		 (_n_sectors),						\
-		 256,							\
-		 0,							\
-		 (_flags))
+/*
+ * This is used to produce the "id" and "id_mask" fields.  The
+ * _jedec_id is expected to be a 24 bit number containing the first
+ * three octets of the RDID response, in "big endian" order (that is,
+ * the first octet of the RDID response is in the MS position).
+ *
+ * If more of the RDID response should be checked than these octets
+ * should be in _ext_id, and should be _ext_len octets long, again, in
+ * "big endian" order.
+ *
+ * NB. This macro expands into something like "X, Z", which is
+ * expected to become the first two parameters to INFO_RAW.
+ */
+#define JEDEC_ID(_jedec_id, _ext_id, _ext_len)				\
+	(((u64)(_jedec_id) << (64 - (8 * 3))) |				\
+	 ((u64)(_ext_id) << (64 - (8 * (3 + (_ext_len)))))),		\
+	GENMASK_ULL(63, 64 - (8 * (3 + (_ext_len))))
+
+#define NONE_ID() 0, 0
 
-#define INFO6(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
-	INFO_RAW((((u64)(_jedec_id) << (64 - (8 * 3))) |		\
-		  ((u64)(_ext_id) << (64 - (48)))),			\
-		 GENMASK_ULL(63, 64 - (8 * (3 + ((_ext_id) ? 3 : 0)))),	\
+/* Used to provide information for a standard JEDEC device. */
+#define INFO(_ID, _sector_size, _n_sectors, _flags)			\
+	INFO_RAW(_ID,							\
 		 (_sector_size),					\
 		 (_n_sectors),						\
 		 256,							\
 		 0,							\
 		 (_flags))
 
-#define CAT25_INFO(_sector_size, _n_sectors, _page_size, _addr_width, _flags)	\
-	INFO_RAW(0, 0, (_sector_size), (_n_sectors), (_page_size), (_addr_width), (_flags))
+/* Used to provide the full information about a device. */
+#define INFO_FULL(_ID, _sector_size, _n_sectors, _pg_sz, _addr_width, _flags) \
+	INFO_RAW(_ID, (_sector_size), (_n_sectors), (_pg_sz), (_addr_width), (_flags))
 
-#define S3AN_INFO(_jedec_id, _n_sectors, _page_size)			\
-	INFO_RAW((((u64)(_jedec_id) << (64 - (8 * 3)))),		\
-		 GENMASK_ULL(63, 64 - (8 * (3))),			\
-		 8 * (_page_size),					\
+#define INFO_S3AN(_ID, _n_sectors, _page_size)				\
+	INFO_RAW(_ID,							\
+		 8*(_page_size),					\
 		 (_n_sectors),						\
 		 (_page_size),						\
 		 3,							\
@@ -934,237 +940,237 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
  */
 static const struct flash_info spi_nor_ids[] = {
 	/* Atmel -- some are (confusingly) marketed as "DataFlash" */
-	{ "at25fs010",  INFO(0x1f6601, 0, 32 * 1024,   4, SECT_4K) },
-	{ "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8, SECT_4K) },
+	{ "at25fs010",  INFO(JEDEC_ID(0x1f6601, 0, 0), 32 * 1024,   4, SECT_4K) },
+	{ "at25fs040",  INFO(JEDEC_ID(0x1f6604, 0, 0), 64 * 1024,   8, SECT_4K) },
 
-	{ "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8, SECT_4K) },
-	{ "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64, SECT_4K) },
-	{ "at25df321a", INFO(0x1f4701, 0, 64 * 1024,  64, SECT_4K) },
-	{ "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128, SECT_4K) },
+	{ "at25df041a", INFO(JEDEC_ID(0x1f4401, 0, 0), 64 * 1024,   8, SECT_4K) },
+	{ "at25df321",  INFO(JEDEC_ID(0x1f4700, 0, 0), 64 * 1024,  64, SECT_4K) },
+	{ "at25df321a", INFO(JEDEC_ID(0x1f4701, 0, 0), 64 * 1024,  64, SECT_4K) },
+	{ "at25df641",  INFO(JEDEC_ID(0x1f4800, 0, 0), 64 * 1024, 128, SECT_4K) },
 
-	{ "at26f004",   INFO(0x1f0400, 0, 64 * 1024,  8, SECT_4K) },
-	{ "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16, SECT_4K) },
-	{ "at26df161a", INFO(0x1f4601, 0, 64 * 1024, 32, SECT_4K) },
-	{ "at26df321",  INFO(0x1f4700, 0, 64 * 1024, 64, SECT_4K) },
+	{ "at26f004",   INFO(JEDEC_ID(0x1f0400, 0, 0), 64 * 1024,  8, SECT_4K) },
+	{ "at26df081a", INFO(JEDEC_ID(0x1f4501, 0, 0), 64 * 1024, 16, SECT_4K) },
+	{ "at26df161a", INFO(JEDEC_ID(0x1f4601, 0, 0), 64 * 1024, 32, SECT_4K) },
+	{ "at26df321",  INFO(JEDEC_ID(0x1f4700, 0, 0), 64 * 1024, 64, SECT_4K) },
 
-	{ "at45db081d", INFO(0x1f2500, 0, 64 * 1024, 16, SECT_4K) },
+	{ "at45db081d", INFO(JEDEC_ID(0x1f2500, 0, 0), 64 * 1024, 16, SECT_4K) },
 
 	/* EON -- en25xxx */
-	{ "en25f32",    INFO(0x1c3116, 0, 64 * 1024,   64, SECT_4K) },
-	{ "en25p32",    INFO(0x1c2016, 0, 64 * 1024,   64, 0) },
-	{ "en25q32b",   INFO(0x1c3016, 0, 64 * 1024,   64, 0) },
-	{ "en25p64",    INFO(0x1c2017, 0, 64 * 1024,  128, 0) },
-	{ "en25q64",    INFO(0x1c3017, 0, 64 * 1024,  128, SECT_4K) },
-	{ "en25qh128",  INFO(0x1c7018, 0, 64 * 1024,  256, 0) },
-	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  512, 0) },
-	{ "en25s64",	INFO(0x1c3817, 0, 64 * 1024,  128, SECT_4K) },
+	{ "en25f32",    INFO(JEDEC_ID(0x1c3116, 0, 0), 64 * 1024,   64, SECT_4K) },
+	{ "en25p32",    INFO(JEDEC_ID(0x1c2016, 0, 0), 64 * 1024,   64, 0) },
+	{ "en25q32b",   INFO(JEDEC_ID(0x1c3016, 0, 0), 64 * 1024,   64, 0) },
+	{ "en25p64",    INFO(JEDEC_ID(0x1c2017, 0, 0), 64 * 1024,  128, 0) },
+	{ "en25q64",    INFO(JEDEC_ID(0x1c3017, 0, 0), 64 * 1024,  128, SECT_4K) },
+	{ "en25qh128",  INFO(JEDEC_ID(0x1c7018, 0, 0), 64 * 1024,  256, 0) },
+	{ "en25qh256",  INFO(JEDEC_ID(0x1c7019, 0, 0), 64 * 1024,  512, 0) },
+	{ "en25s64",	INFO(JEDEC_ID(0x1c3817, 0, 0), 64 * 1024,  128, SECT_4K) },
 
 	/* ESMT */
-	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64, SECT_4K | SPI_NOR_HAS_LOCK) },
+	{ "f25l32pa", INFO(JEDEC_ID(0x8c2016, 0, 0), 64 * 1024, 64, SECT_4K | SPI_NOR_HAS_LOCK) },
 
 	/* Everspin */
-	{ "mr25h256", CAT25_INFO( 32 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
-	{ "mr25h10",  CAT25_INFO(128 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
-	{ "mr25h40",  CAT25_INFO(512 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
+	{ "mr25h256", INFO_FULL(NONE_ID(),  32 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
+	{ "mr25h10",  INFO_FULL(NONE_ID(), 128 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
+	{ "mr25h40",  INFO_FULL(NONE_ID(), 512 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
 
 	/* Fujitsu */
-	{ "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1, SPI_NOR_NO_ERASE) },
+	{ "mb85rs1mt", INFO(JEDEC_ID(0x047f27, 0, 0), 128 * 1024, 1, SPI_NOR_NO_ERASE) },
 
 	/* GigaDevice */
 	{
-		"gd25q16", INFO(0xc84015, 0, 64 * 1024,  32,
+		"gd25q16", INFO(JEDEC_ID(0xc84015, 0, 0), 64 * 1024,  32,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 	},
 	{
-		"gd25q32", INFO(0xc84016, 0, 64 * 1024,  64,
+		"gd25q32", INFO(JEDEC_ID(0xc84016, 0, 0), 64 * 1024,  64,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 	},
 	{
-		"gd25q64", INFO(0xc84017, 0, 64 * 1024, 128,
+		"gd25q64", INFO(JEDEC_ID(0xc84017, 0, 0), 64 * 1024, 128,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 	},
 	{
-		"gd25lq64c", INFO(0xc86017, 0, 64 * 1024, 128,
+		"gd25lq64c", INFO(JEDEC_ID(0xc86017, 0, 0), 64 * 1024, 128,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 	},
 	{
-		"gd25q128", INFO(0xc84018, 0, 64 * 1024, 256,
+		"gd25q128", INFO(JEDEC_ID(0xc84018, 0, 0), 64 * 1024, 256,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 	},
 
 	/* Intel/Numonyx -- xxxs33b */
-	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, 0) },
-	{ "320s33b",  INFO(0x898912, 0, 64 * 1024,  64, 0) },
-	{ "640s33b",  INFO(0x898913, 0, 64 * 1024, 128, 0) },
+	{ "160s33b",  INFO(JEDEC_ID(0x898911, 0, 0), 64 * 1024,  32, 0) },
+	{ "320s33b",  INFO(JEDEC_ID(0x898912, 0, 0), 64 * 1024,  64, 0) },
+	{ "640s33b",  INFO(JEDEC_ID(0x898913, 0, 0), 64 * 1024, 128, 0) },
 
 	/* ISSI */
-	{ "is25cd512", INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
+	{ "is25cd512", INFO(JEDEC_ID(0x7f9d20, 0, 0), 32 * 1024,   2, SECT_4K) },
 
 	/* Macronix */
-	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
-	{ "mx25l2005a",  INFO(0xc22012, 0, 64 * 1024,   4, SECT_4K) },
-	{ "mx25l4005a",  INFO(0xc22013, 0, 64 * 1024,   8, SECT_4K) },
-	{ "mx25l8005",   INFO(0xc22014, 0, 64 * 1024,  16, 0) },
-	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
-	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
-	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
-	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
-	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
-	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
-	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
-	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
-	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, SECT_4K) },
-	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
-	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_QUAD_READ) },
-	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
+	{ "mx25l512e",   INFO(JEDEC_ID(0xc22010, 0, 0), 64 * 1024,   1, SECT_4K) },
+	{ "mx25l2005a",  INFO(JEDEC_ID(0xc22012, 0, 0), 64 * 1024,   4, SECT_4K) },
+	{ "mx25l4005a",  INFO(JEDEC_ID(0xc22013, 0, 0), 64 * 1024,   8, SECT_4K) },
+	{ "mx25l8005",   INFO(JEDEC_ID(0xc22014, 0, 0), 64 * 1024,  16, 0) },
+	{ "mx25l1606e",  INFO(JEDEC_ID(0xc22015, 0, 0), 64 * 1024,  32, SECT_4K) },
+	{ "mx25l3205d",  INFO(JEDEC_ID(0xc22016, 0, 0), 64 * 1024,  64, SECT_4K) },
+	{ "mx25l3255e",  INFO(JEDEC_ID(0xc29e16, 0, 0), 64 * 1024,  64, SECT_4K) },
+	{ "mx25l6405d",  INFO(JEDEC_ID(0xc22017, 0, 0), 64 * 1024, 128, SECT_4K) },
+	{ "mx25u6435f",  INFO(JEDEC_ID(0xc22537, 0, 0), 64 * 1024, 128, SECT_4K) },
+	{ "mx25l12805d", INFO(JEDEC_ID(0xc22018, 0, 0), 64 * 1024, 256, 0) },
+	{ "mx25l12855e", INFO(JEDEC_ID(0xc22618, 0, 0), 64 * 1024, 256, 0) },
+	{ "mx25l25635e", INFO(JEDEC_ID(0xc22019, 0, 0), 64 * 1024, 512, 0) },
+	{ "mx25u25635f", INFO(JEDEC_ID(0xc22539, 0, 0), 64 * 1024, 512, SECT_4K) },
+	{ "mx25l25655e", INFO(JEDEC_ID(0xc22619, 0, 0), 64 * 1024, 512, 0) },
+	{ "mx66l51235l", INFO(JEDEC_ID(0xc2201a, 0, 0), 64 * 1024, 1024, SPI_NOR_QUAD_READ) },
+	{ "mx66l1g55g",  INFO(JEDEC_ID(0xc2261b, 0, 0), 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
 
 	/* Micron */
-	{ "n25q016a",	 INFO(0x20bb15, 0, 64 * 1024,   32, SECT_4K | SPI_NOR_QUAD_READ) },
-	{ "n25q032",	 INFO(0x20ba16, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
-	{ "n25q032a",	 INFO(0x20bb16, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
-	{ "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
-	{ "n25q064a",    INFO(0x20bb17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
-	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
-	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
-	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
-	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
-	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
-	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
-	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
+	{ "n25q016a",	 INFO(JEDEC_ID(0x20bb15, 0, 0), 64 * 1024,   32, SECT_4K | SPI_NOR_QUAD_READ) },
+	{ "n25q032",	 INFO(JEDEC_ID(0x20ba16, 0, 0), 64 * 1024,   64, SPI_NOR_QUAD_READ) },
+	{ "n25q032a",	 INFO(JEDEC_ID(0x20bb16, 0, 0), 64 * 1024,   64, SPI_NOR_QUAD_READ) },
+	{ "n25q064",     INFO(JEDEC_ID(0x20ba17, 0, 0), 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
+	{ "n25q064a",    INFO(JEDEC_ID(0x20bb17, 0, 0), 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
+	{ "n25q128a11",  INFO(JEDEC_ID(0x20bb18, 0, 0), 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
+	{ "n25q128a13",  INFO(JEDEC_ID(0x20ba18, 0, 0), 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
+	{ "n25q256a",    INFO(JEDEC_ID(0x20ba19, 0, 0), 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
+	{ "n25q512a",    INFO(JEDEC_ID(0x20bb20, 0, 0), 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
+	{ "n25q512ax3",  INFO(JEDEC_ID(0x20ba20, 0, 0), 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
+	{ "n25q00",      INFO(JEDEC_ID(0x20ba21, 0, 0), 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
+	{ "n25q00a",     INFO(JEDEC_ID(0x20bb21, 0, 0), 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
 
 	/* PMC */
-	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
-	{ "pm25lv010",   INFO(0,        0, 32 * 1024,    4, SECT_4K_PMC) },
-	{ "pm25lq032",   INFO(0x7f9d46, 0, 64 * 1024,   64, SECT_4K) },
+	{ "pm25lv512",   INFO_FULL(NONE_ID(), 32 * 1024,    2, 256, 0, SECT_4K_PMC) },
+	{ "pm25lv010",   INFO_FULL(NONE_ID(), 32 * 1024,    4, 256, 0, SECT_4K_PMC) },
+	{ "pm25lq032",   INFO(JEDEC_ID(0x7f9d46, 0, 0), 64 * 1024,   64, SECT_4K) },
 
 	/* Spansion -- single (large) sector size only, at least
 	 * for the chips listed here (without boot sectors).
 	 */
-	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, 0) },
-	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
-	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
-	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
-	{ "s25fl128s",	INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8, 0) },
-	{ "s25sl008a",  INFO(0x010213,      0,  64 * 1024,  16, 0) },
-	{ "s25sl016a",  INFO(0x010214,      0,  64 * 1024,  32, 0) },
-	{ "s25sl032a",  INFO(0x010215,      0,  64 * 1024,  64, 0) },
-	{ "s25sl064a",  INFO(0x010216,      0,  64 * 1024, 128, 0) },
-	{ "s25fl004k",  INFO(0xef4013,      0,  64 * 1024,   8, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25fl008k",  INFO(0xef4014,      0,  64 * 1024,  16, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25fl016k",  INFO(0xef4015,      0,  64 * 1024,  32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128, SECT_4K) },
-	{ "s25fl116k",  INFO(0x014015,      0,  64 * 1024,  32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25fl132k",  INFO(0x014016,      0,  64 * 1024,  64, SECT_4K) },
-	{ "s25fl164k",  INFO(0x014017,      0,  64 * 1024, 128, SECT_4K) },
-	{ "s25fl204k",  INFO(0x014013,      0,  64 * 1024,   8, SECT_4K | SPI_NOR_DUAL_READ) },
-	{ "s25fl208k",  INFO(0x014014,      0,  64 * 1024,  16, SECT_4K | SPI_NOR_DUAL_READ) },
+	{ "s25sl032p",  INFO(JEDEC_ID(0x010215, 0x4d00, 2),  64 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25sl064p",  INFO(JEDEC_ID(0x010216, 0x4d00, 2),  64 * 1024, 128, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25fl256s0", INFO(JEDEC_ID(0x010219, 0x4d00, 2), 256 * 1024, 128, 0) },
+	{ "s25fl256s1", INFO(JEDEC_ID(0x010219, 0x4d01, 2),  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25fl512s",  INFO(JEDEC_ID(0x010220, 0x4d00, 2), 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s70fl01gs",  INFO(JEDEC_ID(0x010221, 0x4d00, 2), 256 * 1024, 256, 0) },
+	{ "s25sl12800", INFO(JEDEC_ID(0x012018, 0x0300, 2), 256 * 1024,  64, 0) },
+	{ "s25sl12801", INFO(JEDEC_ID(0x012018, 0x0301, 2),  64 * 1024, 256, 0) },
+	{ "s25fl128s",	INFO(JEDEC_ID(0x012018, 0x4d0180, 3), 64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25fl129p0", INFO(JEDEC_ID(0x012018, 0x4d00, 2), 256 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25fl129p1", INFO(JEDEC_ID(0x012018, 0x4d01, 2),  64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25sl004a",  INFO(JEDEC_ID(0x010212, 0, 0),  64 * 1024,   8, 0) },
+	{ "s25sl008a",  INFO(JEDEC_ID(0x010213, 0, 0),  64 * 1024,  16, 0) },
+	{ "s25sl016a",  INFO(JEDEC_ID(0x010214, 0, 0),  64 * 1024,  32, 0) },
+	{ "s25sl032a",  INFO(JEDEC_ID(0x010215, 0, 0),  64 * 1024,  64, 0) },
+	{ "s25sl064a",  INFO(JEDEC_ID(0x010216, 0, 0),  64 * 1024, 128, 0) },
+	{ "s25fl004k",  INFO(JEDEC_ID(0xef4013, 0, 0),  64 * 1024,   8, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25fl008k",  INFO(JEDEC_ID(0xef4014, 0, 0),  64 * 1024,  16, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25fl016k",  INFO(JEDEC_ID(0xef4015, 0, 0),  64 * 1024,  32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25fl064k",  INFO(JEDEC_ID(0xef4017, 0, 0),  64 * 1024, 128, SECT_4K) },
+	{ "s25fl116k",  INFO(JEDEC_ID(0x014015, 0, 0),  64 * 1024,  32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25fl132k",  INFO(JEDEC_ID(0x014016, 0, 0),  64 * 1024,  64, SECT_4K) },
+	{ "s25fl164k",  INFO(JEDEC_ID(0x014017, 0, 0),  64 * 1024, 128, SECT_4K) },
+	{ "s25fl204k",  INFO(JEDEC_ID(0x014013, 0, 0),  64 * 1024,   8, SECT_4K | SPI_NOR_DUAL_READ) },
+	{ "s25fl208k",  INFO(JEDEC_ID(0x014014, 0, 0),  64 * 1024,  16, SECT_4K | SPI_NOR_DUAL_READ) },
 
 	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
-	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
-	{ "sst25vf080b", INFO(0xbf258e, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
-	{ "sst25vf016b", INFO(0xbf2541, 0, 64 * 1024, 32, SECT_4K | SST_WRITE) },
-	{ "sst25vf032b", INFO(0xbf254a, 0, 64 * 1024, 64, SECT_4K | SST_WRITE) },
-	{ "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128, SECT_4K) },
-	{ "sst25wf512",  INFO(0xbf2501, 0, 64 * 1024,  1, SECT_4K | SST_WRITE) },
-	{ "sst25wf010",  INFO(0xbf2502, 0, 64 * 1024,  2, SECT_4K | SST_WRITE) },
-	{ "sst25wf020",  INFO(0xbf2503, 0, 64 * 1024,  4, SECT_4K | SST_WRITE) },
-	{ "sst25wf020a", INFO(0x621612, 0, 64 * 1024,  4, SECT_4K) },
-	{ "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K) },
-	{ "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
-	{ "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
+	{ "sst25vf040b", INFO(JEDEC_ID(0xbf258d, 0, 0), 64 * 1024,  8, SECT_4K | SST_WRITE) },
+	{ "sst25vf080b", INFO(JEDEC_ID(0xbf258e, 0, 0), 64 * 1024, 16, SECT_4K | SST_WRITE) },
+	{ "sst25vf016b", INFO(JEDEC_ID(0xbf2541, 0, 0), 64 * 1024, 32, SECT_4K | SST_WRITE) },
+	{ "sst25vf032b", INFO(JEDEC_ID(0xbf254a, 0, 0), 64 * 1024, 64, SECT_4K | SST_WRITE) },
+	{ "sst25vf064c", INFO(JEDEC_ID(0xbf254b, 0, 0), 64 * 1024, 128, SECT_4K) },
+	{ "sst25wf512",  INFO(JEDEC_ID(0xbf2501, 0, 0), 64 * 1024,  1, SECT_4K | SST_WRITE) },
+	{ "sst25wf010",  INFO(JEDEC_ID(0xbf2502, 0, 0), 64 * 1024,  2, SECT_4K | SST_WRITE) },
+	{ "sst25wf020",  INFO(JEDEC_ID(0xbf2503, 0, 0), 64 * 1024,  4, SECT_4K | SST_WRITE) },
+	{ "sst25wf020a", INFO(JEDEC_ID(0x621612, 0, 0), 64 * 1024,  4, SECT_4K) },
+	{ "sst25wf040b", INFO(JEDEC_ID(0x621613, 0, 0), 64 * 1024,  8, SECT_4K) },
+	{ "sst25wf040",  INFO(JEDEC_ID(0xbf2504, 0, 0), 64 * 1024,  8, SECT_4K | SST_WRITE) },
+	{ "sst25wf080",  INFO(JEDEC_ID(0xbf2505, 0, 0), 64 * 1024, 16, SECT_4K | SST_WRITE) },
 
 	/* ST Microelectronics -- newer production may have feature updates */
-	{ "m25p05",  INFO(0x202010,  0,  32 * 1024,   2, 0) },
-	{ "m25p10",  INFO(0x202011,  0,  32 * 1024,   4, 0) },
-	{ "m25p20",  INFO(0x202012,  0,  64 * 1024,   4, 0) },
-	{ "m25p40",  INFO(0x202013,  0,  64 * 1024,   8, 0) },
-	{ "m25p80",  INFO(0x202014,  0,  64 * 1024,  16, 0) },
-	{ "m25p16",  INFO(0x202015,  0,  64 * 1024,  32, 0) },
-	{ "m25p32",  INFO(0x202016,  0,  64 * 1024,  64, 0) },
-	{ "m25p64",  INFO(0x202017,  0,  64 * 1024, 128, 0) },
-	{ "m25p128", INFO(0x202018,  0, 256 * 1024,  64, 0) },
-
-	{ "m25p05-nonjedec",  INFO(0, 0,  32 * 1024,   2, 0) },
-	{ "m25p10-nonjedec",  INFO(0, 0,  32 * 1024,   4, 0) },
-	{ "m25p20-nonjedec",  INFO(0, 0,  64 * 1024,   4, 0) },
-	{ "m25p40-nonjedec",  INFO(0, 0,  64 * 1024,   8, 0) },
-	{ "m25p80-nonjedec",  INFO(0, 0,  64 * 1024,  16, 0) },
-	{ "m25p16-nonjedec",  INFO(0, 0,  64 * 1024,  32, 0) },
-	{ "m25p32-nonjedec",  INFO(0, 0,  64 * 1024,  64, 0) },
-	{ "m25p64-nonjedec",  INFO(0, 0,  64 * 1024, 128, 0) },
-	{ "m25p128-nonjedec", INFO(0, 0, 256 * 1024,  64, 0) },
-
-	{ "m45pe10", INFO(0x204011,  0, 64 * 1024,    2, 0) },
-	{ "m45pe80", INFO(0x204014,  0, 64 * 1024,   16, 0) },
-	{ "m45pe16", INFO(0x204015,  0, 64 * 1024,   32, 0) },
-
-	{ "m25pe20", INFO(0x208012,  0, 64 * 1024,  4,       0) },
-	{ "m25pe80", INFO(0x208014,  0, 64 * 1024, 16,       0) },
-	{ "m25pe16", INFO(0x208015,  0, 64 * 1024, 32, SECT_4K) },
-
-	{ "m25px16",    INFO(0x207115,  0, 64 * 1024, 32, SECT_4K) },
-	{ "m25px32",    INFO(0x207116,  0, 64 * 1024, 64, SECT_4K) },
-	{ "m25px32-s0", INFO(0x207316,  0, 64 * 1024, 64, SECT_4K) },
-	{ "m25px32-s1", INFO(0x206316,  0, 64 * 1024, 64, SECT_4K) },
-	{ "m25px64",    INFO(0x207117,  0, 64 * 1024, 128, 0) },
-	{ "m25px80",    INFO(0x207114,  0, 64 * 1024, 16, 0) },
+	{ "m25p05",  INFO(JEDEC_ID(0x202010, 0, 0),  32 * 1024,   2, 0) },
+	{ "m25p10",  INFO(JEDEC_ID(0x202011, 0, 0),  32 * 1024,   4, 0) },
+	{ "m25p20",  INFO(JEDEC_ID(0x202012, 0, 0),  64 * 1024,   4, 0) },
+	{ "m25p40",  INFO(JEDEC_ID(0x202013, 0, 0),  64 * 1024,   8, 0) },
+	{ "m25p80",  INFO(JEDEC_ID(0x202014, 0, 0),  64 * 1024,  16, 0) },
+	{ "m25p16",  INFO(JEDEC_ID(0x202015, 0, 0),  64 * 1024,  32, 0) },
+	{ "m25p32",  INFO(JEDEC_ID(0x202016, 0, 0),  64 * 1024,  64, 0) },
+	{ "m25p64",  INFO(JEDEC_ID(0x202017, 0, 0),  64 * 1024, 128, 0) },
+	{ "m25p128", INFO(JEDEC_ID(0x202018, 0, 0), 256 * 1024,  64, 0) },
+
+	{ "m25p05-nonjedec",  INFO_FULL(NONE_ID(),  32 * 1024,   2, 256, 0, 0) },
+	{ "m25p10-nonjedec",  INFO_FULL(NONE_ID(),  32 * 1024,   4, 256, 0, 0) },
+	{ "m25p20-nonjedec",  INFO_FULL(NONE_ID(),  64 * 1024,   4, 256, 0, 0) },
+	{ "m25p40-nonjedec",  INFO_FULL(NONE_ID(),  64 * 1024,   8, 256, 0, 0) },
+	{ "m25p80-nonjedec",  INFO_FULL(NONE_ID(),  64 * 1024,  16, 256, 0, 0) },
+	{ "m25p16-nonjedec",  INFO_FULL(NONE_ID(),  64 * 1024,  32, 256, 0, 0) },
+	{ "m25p32-nonjedec",  INFO_FULL(NONE_ID(),  64 * 1024,  64, 256, 0, 0) },
+	{ "m25p64-nonjedec",  INFO_FULL(NONE_ID(),  64 * 1024, 128, 256, 0, 0) },
+	{ "m25p128-nonjedec", INFO_FULL(NONE_ID(), 256 * 1024,  64, 256, 0, 0) },
+
+	{ "m45pe10", INFO(JEDEC_ID(0x204011, 0, 0), 64 * 1024,    2, 0) },
+	{ "m45pe80", INFO(JEDEC_ID(0x204014, 0, 0), 64 * 1024,   16, 0) },
+	{ "m45pe16", INFO(JEDEC_ID(0x204015, 0, 0), 64 * 1024,   32, 0) },
+
+	{ "m25pe20", INFO(JEDEC_ID(0x208012, 0, 0), 64 * 1024,  4,       0) },
+	{ "m25pe80", INFO(JEDEC_ID(0x208014, 0, 0), 64 * 1024, 16,       0) },
+	{ "m25pe16", INFO(JEDEC_ID(0x208015, 0, 0), 64 * 1024, 32, SECT_4K) },
+
+	{ "m25px16",    INFO(JEDEC_ID(0x207115, 0, 0), 64 * 1024, 32, SECT_4K) },
+	{ "m25px32",    INFO(JEDEC_ID(0x207116, 0, 0), 64 * 1024, 64, SECT_4K) },
+	{ "m25px32-s0", INFO(JEDEC_ID(0x207316, 0, 0), 64 * 1024, 64, SECT_4K) },
+	{ "m25px32-s1", INFO(JEDEC_ID(0x206316, 0, 0), 64 * 1024, 64, SECT_4K) },
+	{ "m25px64",    INFO(JEDEC_ID(0x207117, 0, 0), 64 * 1024, 128, 0) },
+	{ "m25px80",    INFO(JEDEC_ID(0x207114, 0, 0), 64 * 1024, 16, 0) },
 
 	/* Winbond -- w25x "blocks" are 64K, "sectors" are 4KiB */
-	{ "w25x05", INFO(0xef3010, 0, 64 * 1024,  1,  SECT_4K) },
-	{ "w25x10", INFO(0xef3011, 0, 64 * 1024,  2,  SECT_4K) },
-	{ "w25x20", INFO(0xef3012, 0, 64 * 1024,  4,  SECT_4K) },
-	{ "w25x40", INFO(0xef3013, 0, 64 * 1024,  8,  SECT_4K) },
-	{ "w25x80", INFO(0xef3014, 0, 64 * 1024,  16, SECT_4K) },
-	{ "w25x16", INFO(0xef3015, 0, 64 * 1024,  32, SECT_4K) },
-	{ "w25x32", INFO(0xef3016, 0, 64 * 1024,  64, SECT_4K) },
-	{ "w25q32", INFO(0xef4016, 0, 64 * 1024,  64, SECT_4K) },
+	{ "w25x05", INFO(JEDEC_ID(0xef3010, 0, 0), 64 * 1024,  1,  SECT_4K) },
+	{ "w25x10", INFO(JEDEC_ID(0xef3011, 0, 0), 64 * 1024,  2,  SECT_4K) },
+	{ "w25x20", INFO(JEDEC_ID(0xef3012, 0, 0), 64 * 1024,  4,  SECT_4K) },
+	{ "w25x40", INFO(JEDEC_ID(0xef3013, 0, 0), 64 * 1024,  8,  SECT_4K) },
+	{ "w25x80", INFO(JEDEC_ID(0xef3014, 0, 0), 64 * 1024,  16, SECT_4K) },
+	{ "w25x16", INFO(JEDEC_ID(0xef3015, 0, 0), 64 * 1024,  32, SECT_4K) },
+	{ "w25x32", INFO(JEDEC_ID(0xef3016, 0, 0), 64 * 1024,  64, SECT_4K) },
+	{ "w25q32", INFO(JEDEC_ID(0xef4016, 0, 0), 64 * 1024,  64, SECT_4K) },
 	{
-		"w25q32dw", INFO(0xef6016, 0, 64 * 1024,  64,
+		"w25q32dw", INFO(JEDEC_ID(0xef6016, 0, 0), 64 * 1024,  64,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 	},
-	{ "w25x64", INFO(0xef3017, 0, 64 * 1024, 128, SECT_4K) },
-	{ "w25q64", INFO(0xef4017, 0, 64 * 1024, 128, SECT_4K) },
+	{ "w25x64", INFO(JEDEC_ID(0xef3017, 0, 0), 64 * 1024, 128, SECT_4K) },
+	{ "w25q64", INFO(JEDEC_ID(0xef4017, 0, 0), 64 * 1024, 128, SECT_4K) },
 	{
-		"w25q64dw", INFO(0xef6017, 0, 64 * 1024, 128,
+		"w25q64dw", INFO(JEDEC_ID(0xef6017, 0, 0), 64 * 1024, 128,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 	},
 	{
-		"w25q128fw", INFO(0xef6018, 0, 64 * 1024, 256,
+		"w25q128fw", INFO(JEDEC_ID(0xef6018, 0, 0), 64 * 1024, 256,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 	},
-	{ "w25q80", INFO(0xef5014, 0, 64 * 1024,  16, SECT_4K) },
-	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
-	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },
-	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K) },
+	{ "w25q80",   INFO(JEDEC_ID(0xef5014, 0, 0), 64 * 1024,  16, SECT_4K) },
+	{ "w25q80bl", INFO(JEDEC_ID(0xef4014, 0, 0), 64 * 1024,  16, SECT_4K) },
+	{ "w25q128",  INFO(JEDEC_ID(0xef4018, 0, 0), 64 * 1024, 256, SECT_4K) },
+	{ "w25q256",  INFO(JEDEC_ID(0xef4019, 0, 0), 64 * 1024, 512, SECT_4K) },
 
 	/* Catalyst / On Semiconductor -- non-JEDEC */
-	{ "cat25c11", CAT25_INFO(  16, 8, 16, 1, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
-	{ "cat25c03", CAT25_INFO(  32, 8, 16, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
-	{ "cat25c09", CAT25_INFO( 128, 8, 32, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
-	{ "cat25c17", CAT25_INFO( 256, 8, 32, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
-	{ "cat25128", CAT25_INFO(2048, 8, 64, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
+	{ "cat25c11", INFO_FULL(NONE_ID(),   16, 8, 16, 1, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
+	{ "cat25c03", INFO_FULL(NONE_ID(),   32, 8, 16, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
+	{ "cat25c09", INFO_FULL(NONE_ID(),  128, 8, 32, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
+	{ "cat25c17", INFO_FULL(NONE_ID(),  256, 8, 32, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
+	{ "cat25128", INFO_FULL(NONE_ID(), 2048, 8, 64, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
 
 	/* Xilinx S3AN Internal Flash */
-	{ "3S50AN", S3AN_INFO(0x1f2200, 64, 264) },
-	{ "3S200AN", S3AN_INFO(0x1f2400, 256, 264) },
-	{ "3S400AN", S3AN_INFO(0x1f2400, 256, 264) },
-	{ "3S700AN", S3AN_INFO(0x1f2500, 512, 264) },
-	{ "3S1400AN", S3AN_INFO(0x1f2600, 512, 528) },
+	{ "3S50AN",   INFO_S3AN(JEDEC_ID(0x1f2200, 0, 0), 64, 264) },
+	{ "3S200AN",  INFO_S3AN(JEDEC_ID(0x1f2400, 0, 0), 256, 264) },
+	{ "3S400AN",  INFO_S3AN(JEDEC_ID(0x1f2400, 0, 0), 256, 264) },
+	{ "3S700AN",  INFO_S3AN(JEDEC_ID(0x1f2500, 0, 0), 512, 264) },
+	{ "3S1400AN", INFO_S3AN(JEDEC_ID(0x1f2600, 0, 0), 512, 528) },
 	{ },
 };
 
-- 
2.7.4
