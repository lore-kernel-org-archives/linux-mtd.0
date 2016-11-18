Received: from mail-eopbgr30139.outbound.protection.outlook.com
 ([40.107.3.139] helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c7geS-0004oq-O6
 for linux-mtd@lists.infradead.org; Fri, 18 Nov 2016 10:44:15 +0000
From: <marcin.krzeminski@nokia.com>
To: <linux-mtd@lists.infradead.org>
CC: <rfsw-patches@mlist.nokia.com>, <cyrille.pitchen@atmel.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <marek.vasut@gmail.com>
Subject: [PATCH v2 3/3] mtd: spi-nor: Enable die erase for Micron 1GiB
Date: Fri, 18 Nov 2016 11:42:49 +0100
Message-ID: <1479465769-28276-4-git-send-email-marcin.krzeminski@nokia.com>
In-Reply-To: <1479465769-28276-1-git-send-email-marcin.krzeminski@nokia.com>
References: <1479465769-28276-1-git-send-email-marcin.krzeminski@nokia.com>
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

From: Marcin Krzeminski <marcin.krzeminski@nokia.com>

Micron N25Q00 and MT25Q00 share same JEDEC Id,
but it seem can be properly recognized by second
ext_jedec id byte.

This commits extends n25q00 ids by adding ext
bytes and also adds mt25q00 family.
For MT25Q00 family, the number of dies is two, N25Q00
has it four. Logic to support that is added.

Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 5fc809e..eb7fdb5 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -218,6 +218,28 @@ static inline int set_4byte(struct spi_nor *nor, const struct flash_info *info,
 		return nor->write_reg(nor, SPINOR_OP_BRWR, nor->cmd_buf, 1);
 	}
 }
+
+static void spi_nor_die_cnt(struct spi_nor *nor,
+		const struct flash_info *info)
+{
+	switch (JEDEC_MFR(info)) {
+	case SNOR_MFR_MICRON:
+		/* 1GiB devices */
+		if (info->id[2] == 0x21) {
+			/* MT25Q00 has 2 dies N25Q00 has 4 */
+			if (info->id[4] & BIT(6))
+				nor->die_cnt = 2;
+			else
+				nor->die_cnt = 4;
+		} else
+			nor->die_cnt = 0;
+	break;
+	default:
+		nor->die_cnt = 0;
+		break;
+	}
+}
+
 static inline int spi_nor_sr_ready(struct spi_nor *nor)
 {
 	int sr = read_sr(nor);
@@ -979,8 +1001,14 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
 	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
-	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
-	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
+	{ "n25q00",      INFO(0x20ba21, 0x1000, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | DIE_ERASE) },
+	{ "n25q00a",     INFO(0x20bb21, 0x1000, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | DIE_ERASE) },
+	{ "n25q00",      INFO(0x20ba21, 0x1004, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | DIE_ERASE) },
+	{ "n25q00a",     INFO(0x20bb21, 0x1004, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | DIE_ERASE) },
+	{ "mt25ql01g",   INFO(0x20ba21, 0x1044, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | DIE_ERASE) },
+	{ "mt25qu01g",   INFO(0x20bb21, 0x1044, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | DIE_ERASE) },
+	{ "mt25ql01g",   INFO(0x20ba21, 0x1040, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | DIE_ERASE) },
+	{ "mt25qu01g",   INFO(0x20bb21, 0x1040, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | DIE_ERASE) },
 
 	/* PMC */
 	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
@@ -1488,6 +1516,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 		nor->flags |= SNOR_F_USE_FSR;
 	if (info->flags & SPI_NOR_HAS_TB)
 		nor->flags |= SNOR_F_HAS_SR_TB;
+	if (info->flags & DIE_ERASE) {
+		nor->flags |= SNOR_F_DIE_ERASE;
+		spi_nor_die_cnt(nor, info);
+	}
 
 #ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
 	/* prefer "small sector" erase if possible */
-- 
2.7.4
