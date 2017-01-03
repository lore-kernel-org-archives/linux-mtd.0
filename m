Received: from mx1.riseup.net ([198.252.153.129])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cOE0A-0008Pk-16
 for linux-mtd@lists.infradead.org; Tue, 03 Jan 2017 01:34:59 +0000
Received: from piha.riseup.net (unknown [10.0.1.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "*.riseup.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (verified OK))
 by mx1.riseup.net (Postfix) with ESMTPS id 354A01A051A
 for <linux-mtd@lists.infradead.org>; Tue,  3 Jan 2017 01:34:35 +0000 (UTC)
From: Victor Shyba <victor1984@riseup.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: Add lock/unlock support for f25l32pa
Date: Mon,  2 Jan 2017 22:34:30 -0300
Message-Id: <1483407270-4323-1-git-send-email-victor1984@riseup.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This chip has write protection enabled on power-up,
so this flag is necessary to support write operations.

Signed-off-by: Victor Shyba <victor1984@riseup.net>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index da7cd69..f325925 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -821,7 +821,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "en25s64",	INFO(0x1c3817, 0, 64 * 1024,  128, SECT_4K) },
 
 	/* ESMT */
-	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64, SECT_4K) },
+	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64, SECT_4K | SPI_NOR_HAS_LOCK) },
 
 	/* Everspin */
 	{ "mr25h256", CAT25_INFO( 32 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
-- 
2.7.4
