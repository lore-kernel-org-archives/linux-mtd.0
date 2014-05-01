Received: from mail-wi0-f169.google.com ([209.85.212.169])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wfnl2-0003Cb-At
 for linux-mtd@lists.infradead.org; Thu, 01 May 2014 09:58:24 +0000
Received: by mail-wi0-f169.google.com with SMTP id hi5so449589wib.2
 for <linux-mtd@lists.infradead.org>; Thu, 01 May 2014 02:58:06 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 28/47] mtd: nand: stm_nand_bch: bad block marking helpers
Date: Thu,  1 May 2014 10:56:35 +0100
Message-Id: <1398938214-17847-29-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1398938214-17847-1-git-send-email-lee.jones@linaro.org>
References: <1398938214-17847-1-git-send-email-lee.jones@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, kernel@stlinux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bad Block Markers (BBMs) keep track of unusable/unsuitable memory
blocks which can prevent unnecessary data loss. These helpers aid in
reading and writing to/from the Bad Block Tables (BBTs) where the BBMs
are stored.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index 83faffe..27a87a3 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -712,6 +712,35 @@ static int bch_write(struct mtd_info *mtd, struct nand_chip *chip,
 	return 0;
 }
 
+/*
+ * Bad Block Tables/Bad Block Markers
+ */
+#define BBT_MARK_BAD_FACTORY	0x0
+#define BBT_MARK_BAD_WEAR	0x1
+#define BBT_MARK_GOOD		0x3
+
+static void bbt_set_block_mark(uint8_t *bbt, uint32_t block, uint8_t mark)
+{
+	unsigned int byte = block >> 2;
+	unsigned int shift = (block & 0x3) << 1;
+
+	bbt[byte] &= ~(0x3 << shift);
+	bbt[byte] |= ((mark & 0x3) << shift);
+}
+
+static uint8_t bbt_get_block_mark(uint8_t *bbt, uint32_t block)
+{
+	unsigned int byte = block >> 2;
+	unsigned int shift = (block & 0x3) << 1;
+
+	return (bbt[byte] >> shift) & 0x3;
+}
+
+static int bbt_is_block_bad(uint8_t *bbt, uint32_t block)
+{
+	return bbt_get_block_mark(bbt, block) == BBT_MARK_GOOD ? 0 : 1;
+}
+
 /* Scan block for IBBT signature */
 static int bch_find_ibbt_sig(struct nandi_controller *nandi,
 			     uint32_t block, int *bak, uint8_t *vers,
-- 
1.8.3.2
