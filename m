Received: from smtprz15.163.net ([106.3.154.248] helo=smtp.tom.com)
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMuiC-0004mY-53
 for linux-mtd@lists.infradead.org; Wed, 14 Nov 2018 12:56:05 +0000
Received: from antispam2.tom.com (unknown [172.25.16.56])
 by freemail02.tom.com (Postfix) with ESMTP id 58AA3B00D67
 for <linux-mtd@lists.infradead.org>; Wed, 14 Nov 2018 20:55:25 +0800 (CST)
Received: from antispam2.tom.com (antispam2.tom.com [127.0.0.1])
 by antispam2.tom.com (Postfix) with ESMTP id 5360F814E9
 for <linux-mtd@lists.infradead.org>; Wed, 14 Nov 2018 20:55:25 +0800 (CST)
Received: from antispam2.tom.com ([127.0.0.1])
 by antispam2.tom.com (antispam2.tom.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HdPNRTzDzZSf for <linux-mtd@lists.infradead.org>;
 Wed, 14 Nov 2018 20:55:23 +0800 (CST)
From: Liu Xiang <liu.xiang6@zte.com.cn>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, boris.brezillon@bootlin.com,
 marek.vasut@gmail.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 richard@nod.at, liuxiang_1999@126.com, Liu Xiang <liu.xiang6@zte.com.cn>
Subject: [PATCH] mtd: spi-nor: Add 4B_OPCODES flag to is25lp256
Date: Wed, 14 Nov 2018 20:55:18 +0800
Message-Id: <1542200118-3024-1-git-send-email-liu.xiang6@zte.com.cn>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The is25lp256 supports 4-byte opcodes and quad output.

Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Liu Xiang <liu.xiang6@zte.com.cn>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 3e54e31..3eba13a 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1357,7 +1357,7 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	{ "is25lp128",  INFO(0x9d6018, 0, 64 * 1024, 256,
 			SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "is25lp256",  INFO(0x9d6019, 0, 64 * 1024, 512,
-			SECT_4K | SPI_NOR_DUAL_READ) },
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
 	{ "is25wp032",  INFO(0x9d7016, 0, 64 * 1024,  64,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25wp064",  INFO(0x9d7017, 0, 64 * 1024, 128,
-- 
1.9.1
