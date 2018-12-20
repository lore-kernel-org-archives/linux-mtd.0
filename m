Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZxjQ-0000F4-F0
 for linux-mtd@lists.infradead.org; Thu, 20 Dec 2018 12:47:18 +0000
Received: by mail-lj1-x244.google.com with SMTP id s5-v6so1415175ljd.12
 for <linux-mtd@lists.infradead.org>; Thu, 20 Dec 2018 04:47:06 -0800 (PST)
From: Emil Lenngren <emil.lenngren@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Emil Lenngren <emil.lenngren@gmail.com>
Subject: [PATCH] mtd: spinand: Fix Macronix ECC Status Read
Date: Thu, 20 Dec 2018 13:46:58 +0100
Message-Id: <20181220124658.11565-1-emil.lenngren@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The datasheet specifies the upper four bits are reserved.
Testing on real hardware shows that these bits can indeed be nonzero.

Signed-off-by: Emil Lenngren <emil.lenngren@gmail.com>
---
 drivers/mtd/nand/spi/macronix.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index 98f6b9c4b6..d16b57081c 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -10,6 +10,7 @@
 #include <linux/mtd/spinand.h>
 
 #define SPINAND_MFR_MACRONIX		0xC2
+#define MACRONIX_ECCSR_MASK		0x0F
 
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
@@ -55,7 +56,12 @@ static int mx35lf1ge4ab_get_eccsr(struct spinand_device *spinand, u8 *eccsr)
 					  SPI_MEM_OP_DUMMY(1, 1),
 					  SPI_MEM_OP_DATA_IN(1, eccsr, 1));
 
-	return spi_mem_exec_op(spinand->spimem, &op);
+	int ret = spi_mem_exec_op(spinand->spimem, &op);
+	if (ret)
+		return ret;
+
+	*eccsr &= MACRONIX_ECCSR_MASK;
+	return 0;
 }
 
 static int mx35lf1ge4ab_ecc_get_status(struct spinand_device *spinand,
-- 
2.17.1
