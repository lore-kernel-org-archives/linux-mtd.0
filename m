Received: from sysam.it ([5.39.81.93])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e5IOO-0001HD-Iz
 for linux-mtd@lists.infradead.org; Thu, 19 Oct 2017 21:30:19 +0000
From: Angelo Dureghello <angelo@sysam.it>
To: linux-mtd@lists.infradead.org
Cc: Angelo Dureghello <angelo@sysam.it>
Subject: [PATCH] mtd: spi-nor: add support for ISSI is25lp128
Date: Thu, 19 Oct 2017 23:29:52 +0200
Message-Id: <20171019212952.12049-1-angelo@sysam.it>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Angelo Dureghello <angelo@sysam.it>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 19c000722cbc..88cd10a0ee9e 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1005,6 +1005,7 @@ static const struct flash_info spi_nor_ids[] = {
 
 	/* ISSI */
 	{ "is25cd512", INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
+	{ "is25lp128", INFO(0x9d6018, 0, 64 * 1024,   256, SECT_4K) },
 
 	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
-- 
2.14.1
