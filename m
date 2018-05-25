Received: from mail.izt-labs.de ([82.135.25.162])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fME1L-0002JN-P0
 for linux-mtd@lists.infradead.org; Fri, 25 May 2018 14:48:48 +0000
Received: from localhost (unknown [127.0.0.1])
 by mail.izt-labs.de (Postfix) with ESMTP id C3F14A7383
 for <linux-mtd@lists.infradead.org>; Fri, 25 May 2018 14:48:25 +0000 (UTC)
Received: from mail.izt-labs.de ([127.0.0.1])
 by localhost (iztmail-dmz.izt-technologies.de [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id 12890-05 for <linux-mtd@lists.infradead.org>;
 Fri, 25 May 2018 16:48:16 +0200 (CEST)
Received: from mail.izt.loc (mail.izt.loc [10.61.1.130])
 by mail.izt-labs.de (Postfix) with ESMTP id E9780A734A
 for <linux-mtd@lists.infradead.org>; Fri, 25 May 2018 16:48:16 +0200 (CEST)
Received: from ppcx2.izt.loc (ppcx2.izt.loc [10.61.1.187])
 (Authenticated sender: phn)
 by mail.izt.loc (Postfix) with ESMTP id E32901D3DF
 for <linux-mtd@lists.infradead.org>; Fri, 25 May 2018 16:48:16 +0200 (CEST)
Date: Fri, 25 May 2018 16:48:11 +0200
From: Johannes Poehlmann <johannes.poehlmann@izt-labs.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] new NOR flash winbond w25q16jv, jedec code 0xef7015
Message-ID: <20180525144811.GA27270@ppcx2.izt.loc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Copy values from jedec code 0xef4015, which is also the jedec code
of Winbond w25q16db. w25q16jv is presented as follow up type in the
data sheet. w25q16jv works with this patch.

Signed-off-by: Johannes Poehlmann <johannes.poehlmann@izt-labs.de>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 5bfa36e..9bac67b 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1188,6 +1188,7 @@ static const struct flash_info spi_nor_ids[] = {
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 	},
+	{ "w25q16jv", INFO(0xef7015, 0, 64 * 1024,  32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "w25x32", INFO(0xef3016, 0, 64 * 1024,  64, SECT_4K) },
 	{ "w25q20cl", INFO(0xef4012, 0, 64 * 1024,  4, SECT_4K) },
 	{ "w25q20bw", INFO(0xef5012, 0, 64 * 1024,  4, SECT_4K) },
-- 
2.1.4
