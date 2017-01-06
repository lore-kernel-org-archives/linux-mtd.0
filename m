Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cPYAy-000589-2s
 for linux-mtd@lists.infradead.org; Fri, 06 Jan 2017 17:19:37 +0000
Received: by mail-lf0-x244.google.com with SMTP id j75so6523725lfe.3
 for <linux-mtd@lists.infradead.org>; Fri, 06 Jan 2017 09:19:15 -0800 (PST)
From: Marcin Krzeminski <mar.krzeminski@gmail.com>
To: cyrille.pitchen@atmel.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, mar.krzeminski@gmail.com
Subject: [PATCH v4 1/2] mtd: spi-nor: Fix whole chip erasing for stacked chips.
Date: Fri,  6 Jan 2017 18:19:00 +0100
Message-Id: <20170106171901.27565-2-mar.krzeminski@gmail.com>
In-Reply-To: <20170106171901.27565-1-mar.krzeminski@gmail.com>
References: <20170106171901.27565-1-mar.krzeminski@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently it is possible to disable chip erase for spi-nor driver.
Some modern stacked (multi die) flash chips do not support chip
erase opcode at all but spi-nor framework needs to cope with them too.
This commit extends existing functionality to allow disable
chip erase for a single flash chip.

Signed-off-by: Marcin Krzeminski <mar.krzeminski@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 2a643a1..595de54 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -85,6 +85,7 @@ struct flash_info {
 					 * Use dedicated 4byte address op codes
 					 * to support memory size above 128Mib.
 					 */
+#define NO_CHIP_ERASE		BIT(12) /* Chip does not support chip erase */
 };
 
 #define JEDEC_MFR(info)	((info)->id[0])
@@ -1621,6 +1622,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 		nor->flags |= SNOR_F_USE_FSR;
 	if (info->flags & SPI_NOR_HAS_TB)
 		nor->flags |= SNOR_F_HAS_SR_TB;
+	if (info->flags & NO_CHIP_ERASE)
+		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
 
 #ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
 	/* prefer "small sector" erase if possible */
-- 
2.9.3
