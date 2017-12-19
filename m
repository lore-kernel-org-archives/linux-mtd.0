Received: from mail-db5eur01on0129.outbound.protection.outlook.com
 ([104.47.2.129] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eRIEB-0004sc-Rn
 for linux-mtd@lists.infradead.org; Tue, 19 Dec 2017 13:46:41 +0000
From: Romain Porte <romain.porte@nokia.com>
To: <cyrille.pitchen@wedev4u.fr>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <alexander.sverdlin@nokia.com>, <pascal.fabreges@nokia.com>, Romain Porte
 <romain.porte@nokia.com>
Subject: [PATCH] mtd: spi-nor: Added ISSI is25lp080d support
Date: Tue, 19 Dec 2017 14:43:25 +0100
Message-ID: <20171219134325.3315-1-romain.porte@nokia.com>
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

This patch adds support for a new ISSI 1MB SPI NOR chip that was tested in our
lab. Datasheet is available at: http://www.issi.com/WW/pdf/25LP-WP080D.pdf

Tested-by: Pascal Fabreges <pascal.fabreges@nokia.com>
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index bc266f70a15b..92cd62f02176 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1021,6 +1021,7 @@ static const struct flash_info spi_nor_ids[] = {
 
 	/* ISSI */
 	{ "is25cd512", INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
+	{ "is25lp080d", INFO(0x9d6014, 0, 64 * 1024,  16, SECT_4K) },
 
 	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
-- 
2.11.0
