Received: from smtprz15.163.net ([106.3.154.248] helo=smtp.tom.com)
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ftDMi-0001pY-Ek
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2018 14:47:10 +0000
Received: from antispam1.tom.com (unknown [172.25.16.55])
 by freemail01.tom.com (Postfix) with ESMTP id 3D7871C80DF8
 for <linux-mtd@lists.infradead.org>; Fri, 24 Aug 2018 22:41:46 +0800 (CST)
Received: from antispam1.tom.com (antispam1.tom.com [127.0.0.1])
 by antispam1.tom.com (Postfix) with ESMTP id 3785610013B1
 for <linux-mtd@lists.infradead.org>; Fri, 24 Aug 2018 22:41:46 +0800 (CST)
Received: from antispam1.tom.com ([127.0.0.1])
 by antispam1.tom.com (antispam1.tom.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vKRv5tJE3AtE for <linux-mtd@lists.infradead.org>;
 Fri, 24 Aug 2018 22:41:45 +0800 (CST)
From: Liu Xiang <liu.xiang6@zte.com.cn>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, marek.vasut@gmail.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@bootlin.com, richard@nod.at,
 liuxiang_1999@126.com, Liu Xiang <liu.xiang6@zte.com.cn>
Subject: [PATCH] mtd: spi-nor: Add 4-byte address support for is25lp256
Date: Fri, 24 Aug 2018 22:41:41 +0800
Message-Id: <1535121701-2925-1-git-send-email-liu.xiang6@zte.com.cn>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The is25lp256 supports 4-byte opcodes and quad output.
In is25lp256, the DWORD1 of JEDEC Basic Flash Parameter Header
is 0xfff920e5. So the DWORD1[18:17] Address Bytes bits are 0b00,
means that 3-Byte only addressing. Now this limits nor->addr_width
to 3 and makes it inpossible to access the address above 16MB.
I think the size of flash is the most important judgement for
nor->addr_width. Once the size is larger than 16MB, nor->addr_width
must be 4. This can avoid the bad situation that manufacturer sets
incorrect value of register.

Signed-off-by: Liu Xiang <liu.xiang6@zte.com.cn>
---
 drivers/mtd/spi-nor/spi-nor.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d9c368c..0203b09 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1065,7 +1065,7 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	{ "is25lp128",  INFO(0x9d6018, 0, 64 * 1024, 256,
 			SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "is25lp256",  INFO(0x9d6019, 0, 64 * 1024, 512,
-			SECT_4K | SPI_NOR_DUAL_READ) },
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
 	{ "is25wp032",  INFO(0x9d7016, 0, 64 * 1024,  64,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25wp064",  INFO(0x9d7017, 0, 64 * 1024, 128,
@@ -2926,16 +2926,16 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (ret)
 		return ret;
 
-	if (nor->addr_width) {
-		/* already configured from SFDP */
-	} else if (info->addr_width) {
-		nor->addr_width = info->addr_width;
-	} else if (mtd->size > 0x1000000) {
+	if (mtd->size > 0x1000000) {
 		/* enable 4-byte addressing if the device exceeds 16MiB */
 		nor->addr_width = 4;
 		if (JEDEC_MFR(info) == SNOR_MFR_SPANSION ||
-		    info->flags & SPI_NOR_4B_OPCODES)
+			info->flags & SPI_NOR_4B_OPCODES)
 			spi_nor_set_4byte_opcodes(nor, info);
+	} else if (nor->addr_width) {
+		/* already configured from SFDP */
+	} else if (info->addr_width) {
+		nor->addr_width = info->addr_width;
 	} else {
 		nor->addr_width = 3;
 	}
-- 
1.9.1
