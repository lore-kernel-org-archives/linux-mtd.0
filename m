Received: from mail-wg0-f41.google.com ([74.125.82.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSMbv-0002Bs-I5
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 08:21:36 +0000
Received: by mail-wg0-f41.google.com with SMTP id n12so78370wgh.0
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 01:21:05 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 25/47] mtd: nand: stm_nand_bch: bad block marking helpers
Date: Tue, 25 Mar 2014 08:19:42 +0000
Message-Id: <1395735604-26706-26-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
References: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
Cc: angus.clark@st.com, kernel@stlinux.com, lee.jones@linaro.org,
 linux-mtd@lists.infradead.org, pekon@ti.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
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
index 5bcaabbc..e1c71be 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -495,6 +495,35 @@ static uint8_t bch_write_page(struct nandi_controller *nandi,
 	return status;
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
