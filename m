Received: from mail-wg0-x234.google.com ([2a00:1450:400c:c00::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YlxXB-00052z-5d
 for linux-mtd@lists.infradead.org; Sat, 25 Apr 2015 10:42:06 +0000
Received: by wgen6 with SMTP id n6so73182713wge.3
 for <linux-mtd@lists.infradead.org>; Sat, 25 Apr 2015 03:41:43 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: Properly set SECT_4K for recently added flashes
Date: Sat, 25 Apr 2015 12:41:30 +0200
Message-Id: <1429958490-17182-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Huang Shijie <shijie.huang@intel.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Shengzhou Liu <shengzhou.liu@freescale.com>,
 Knut Wohlrab <knut.wohlrab@de.bosch.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Few recently added entries are missing SECT_4K flag despite of these
flashes supporting 4 KiB erase sectors and 0x20 erase command.
Also add a comment to help avoiding such mistakes in the future.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
Cc: Knut Wohlrab <knut.wohlrab@de.bosch.com>
Cc: Huang Shijie <shijie.huang@intel.com>
Cc: Shengzhou Liu <shengzhou.liu@freescale.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index cd173e5..7a6a373 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -513,6 +513,13 @@ static int spi_nor_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 /* NOTE: double check command sets and memory organization when you add
  * more nor chips.  This current list focusses on newer chips, which
  * have been converging on command sets which including JEDEC ID.
+ *
+ * All newly added entries should describe *hardware* and should use SECT_4K
+ * (or SECT_4K_PMC) if hardware supports erasing 4 KiB sectors. For usage
+ * scenarios excluding small sectors there is config option that can be
+ * disabled: CONFIG_MTD_SPI_NOR_USE_4K_SECTORS.
+ * For historical (and compatibility) reasons (before we got above config) some
+ * old entries may be missing 4K flag.
  */
 static const struct spi_device_id spi_nor_ids[] = {
 	/* Atmel -- some are (confusingly) marketed as "DataFlash" */
@@ -538,7 +545,7 @@ static const struct spi_device_id spi_nor_ids[] = {
 	{ "en25q64",    INFO(0x1c3017, 0, 64 * 1024,  128, SECT_4K) },
 	{ "en25qh128",  INFO(0x1c7018, 0, 64 * 1024,  256, 0) },
 	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  512, 0) },
-	{ "en25s64",	INFO(0x1c3817, 0, 64 * 1024,  128, 0) },
+	{ "en25s64",	INFO(0x1c3817, 0, 64 * 1024,  128, SECT_4K) },
 
 	/* ESMT */
 	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64, SECT_4K) },
@@ -602,7 +609,7 @@ static const struct spi_device_id spi_nor_ids[] = {
 	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
 	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
-	{ "s25fl128s",	INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_QUAD_READ) },
+	{ "s25fl128s",	INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64, 0) },
 	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, 0) },
 	{ "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8, 0) },
@@ -613,7 +620,7 @@ static const struct spi_device_id spi_nor_ids[] = {
 	{ "s25fl008k",  INFO(0xef4014,      0,  64 * 1024,  16, SECT_4K) },
 	{ "s25fl016k",  INFO(0xef4015,      0,  64 * 1024,  32, SECT_4K) },
 	{ "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128, SECT_4K) },
-	{ "s25fl132k",  INFO(0x014016,      0,  64 * 1024,  64, 0) },
+	{ "s25fl132k",  INFO(0x014016,      0,  64 * 1024,  64, SECT_4K) },
 	{ "s25fl164k",  INFO(0x014017,      0,  64 * 1024, 128, SECT_4K) },
 
 	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
-- 
1.8.4.5
