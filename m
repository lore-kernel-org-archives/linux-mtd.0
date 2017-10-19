Received: from mx1.emlix.com ([46.4.235.150])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e55wu-0007KJ-Gk
 for linux-mtd@lists.infradead.org; Thu, 19 Oct 2017 08:13:09 +0000
Received: from mailer.emlix.com (unknown [80.150.94.234])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mx1.emlix.com (Postfix) with ESMTPS id 79B1525F3EA
 for <linux-mtd@lists.infradead.org>; Thu, 19 Oct 2017 10:12:40 +0200 (CEST)
From: Philipp Puschmann <pp@emlix.com>
To: linux-mtd@lists.infradead.org
Cc: pp@emlix.com
Subject: [PATCH 1/2] mtd: spi-nor: fix style issue
Date: Thu, 19 Oct 2017 10:12:31 +0200
Message-Id: <20171019081231.5394-1-pp@emlix.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fixed a space coding style issue, found via checkpatch.

Signed-off-by: Philipp Puschmann <pp@emlix.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 19c000722cbc..386de64e5a86 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -964,7 +964,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "f25l64qa", INFO(0x8c4117, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_HAS_LOCK) },
 
 	/* Everspin */
-	{ "mr25h256", CAT25_INFO( 32 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
+	{ "mr25h256", CAT25_INFO(32 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
 	{ "mr25h10",  CAT25_INFO(128 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
 	{ "mr25h40",  CAT25_INFO(512 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
 
-- 
2.14.1
