Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdlZZ-00034W-Ab
 for linux-mtd@lists.infradead.org; Tue, 14 Feb 2017 22:27:47 +0000
Received: by mail-ot0-x241.google.com with SMTP id t47so4016970ota.0
 for <linux-mtd@lists.infradead.org>; Tue, 14 Feb 2017 14:27:24 -0800 (PST)
From: "L. D. Pinney" <ldpinney@gmail.com>
To: Linux MTD Development List <linux-mtd@lists.infradead.org>
Cc: "L . D . Pinney" <ldpinney@gmail.com>
Subject: [PATCH v2] mtd: spi-nor: Add support for ESMT F25L32QA and F25L64QA
Date: Tue, 14 Feb 2017 16:27:13 -0600
Message-Id: <20170214222713.30913-1-ldpinney@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add Support for the ESMT F25L32QA and F25L64QA
These are 4MB and 8MB SPI-NOR Chips from Elite Semiconductor Memory Technology

Signed-off-by: L. D. Pinney <ldpinney@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 70e52ffc2203..205efab4746c 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -960,6 +960,8 @@ static const struct flash_info spi_nor_ids[] = {
 
 	/* ESMT */
 	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64, SECT_4K | SPI_NOR_HAS_LOCK) },
+	{ "f25l32qa", INFO(0x8c4116, 0, 64 * 1024, 64, SECT_4K | SPI_NOR_HAS_LOCK) },
+	{ "f25l64qa", INFO(0x8c4117, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_HAS_LOCK) },
 
 	/* Everspin */
 	{ "mr25h256", CAT25_INFO( 32 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
