Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cPUBE-000195-SI
 for linux-mtd@lists.infradead.org; Fri, 06 Jan 2017 13:03:39 +0000
Received: by mail-lf0-x242.google.com with SMTP id j75so5992111lfe.3
 for <linux-mtd@lists.infradead.org>; Fri, 06 Jan 2017 05:03:14 -0800 (PST)
From: Marcin Krzeminski <mar.krzeminski@gmail.com>
To: cyrille.pitchen@atmel.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, mar.krzeminski@gmail.com
Subject: [PATCH v3 1/2] mtd: spi-nor: Fix whole chip erasing for stacked chips.
Date: Fri,  6 Jan 2017 14:03:00 +0100
Message-Id: <20170106130302.8074-2-mar.krzeminski@gmail.com>
In-Reply-To: <20170106130302.8074-1-mar.krzeminski@gmail.com>
References: <20170106130302.8074-1-mar.krzeminski@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Curretly it is possible to disable chip erase for spi-nor driver.
Some modern stacked (multi die) flash chips does not support chip
erase opcode at all but spi-nor framework need to cope with them too.
This commit extend exising functionality to allow disable
chip erase for a single flash chip.

Signed-off-by: Marcin Krzeminski <mar.krzeminski@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 15fb8af..b6656b2 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -81,6 +81,7 @@ struct flash_info {
 					 * because it has the same value as
 					 * ATMEL flashes)
 					*/
+#define NO_CHIP_ERASE	BIT(10) /* Chip does not support chip erase */
 };
 
 #define JEDEC_MFR(info)	((info)->id[0])
@@ -1545,6 +1546,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 		nor->flags |= SNOR_F_USE_FSR;
 	if (info->flags & SPI_NOR_HAS_TB)
 		nor->flags |= SNOR_F_HAS_SR_TB;
+	if (info->flags & NO_CHIP_ERASE)
+		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
 
 #ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
 	/* prefer "small sector" erase if possible */
-- 
2.9.3
