Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bcz5K-0005I5-CJ
 for linux-mtd@lists.infradead.org; Thu, 25 Aug 2016 18:09:03 +0000
Received: by mail-oi0-x244.google.com with SMTP id t127so5202548oie.1
 for <linux-mtd@lists.infradead.org>; Thu, 25 Aug 2016 11:08:41 -0700 (PDT)
From: "L. D. Pinney" <ldpinney@gmail.com>
To: Linux MTD development <linux-mtd@lists.infradead.org>
Cc: "L . D . Pinney" <ldpinney@gmail.com>
Subject: [PATCH] mtd: spi-nor: add support for ESMT_f25l32qa and ESMT_f25l64qa
Date: Thu, 25 Aug 2016 13:07:56 -0500
Message-Id: <1472148476-12467-1-git-send-email-ldpinney@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add Support for the ESMT_F25L32QA and ESMT_F25L64QA
These are 4MB and 8MB SPI NOR Chips from Elite Semiconductor Memory Technology

Signed-off-by: L. D. Pinney <ldpinney@gmail.com>
---

 drivers/mtd/spi-nor/spi-nor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d0fc165..8f213ec 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -821,6 +821,8 @@ static const struct flash_info spi_nor_ids[] = {
 
 	/* ESMT */
 	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64, SECT_4K) },
+	{ "f25l32qa", INFO(0x8c4116, 0, 64 * 1024, 64, SECT_4K) },
+	{ "f25l64qa", INFO(0x8c4117, 0, 64 * 1024, 128, SECT_4K) },
 
 	/* Everspin */
 	{ "mr25h256", CAT25_INFO( 32 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
