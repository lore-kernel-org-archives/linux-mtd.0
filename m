Received: from mail-ea0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TXsjr-00055T-KJ
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2012 12:03:41 +0000
Received: by mail-ea0-f177.google.com with SMTP id n13so2357999eaa.36
 for <linux-mtd@lists.infradead.org>; Mon, 12 Nov 2012 04:03:39 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH V2 3/6] mtd: bcm47xxnflash: init NAND on BCM4706
Date: Mon, 12 Nov 2012 13:03:22 +0100
Message-Id: <1352721805-14064-4-git-send-email-zajec5@gmail.com>
In-Reply-To: <1352721805-14064-1-git-send-email-zajec5@gmail.com>
References: <1352721805-14064-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/nand/bcm47xxnflash/Makefile      |    1 +
 drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c |  109 ++++++++++++++++++++++++++
 2 files changed, 110 insertions(+), 0 deletions(-)
 create mode 100644 drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c

diff --git a/drivers/mtd/nand/bcm47xxnflash/Makefile b/drivers/mtd/nand/bcm47xxnflash/Makefile
index 1d0693a..4f688f9 100644
--- a/drivers/mtd/nand/bcm47xxnflash/Makefile
+++ b/drivers/mtd/nand/bcm47xxnflash/Makefile
@@ -1,3 +1,4 @@
 bcm47xxnflash-y				+= main.o
+bcm47xxnflash-				+= ops_bcm4706.o
 
 obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xxnflash.o
diff --git a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
new file mode 100644
index 0000000..ae8a793
--- /dev/null
+++ b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
@@ -0,0 +1,109 @@
+/*
+ * BCM47XX NAND flash driver
+ *
+ * Copyright (C) 2012 Rafał Miłecki <zajec5@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/bcma/bcma.h>
+
+#include "bcm47xxnflash.h"
+
+/**************************************************
+ * Various helpers
+ **************************************************/
+
+static inline u8 bcm47xxnflash_ops_bcm4706_ns_to_cycle(u16 ns, u16 clock)
+{
+	return ((ns * 1000 * clock) / 1000000) + 1;
+}
+
+/**************************************************
+ * NAND chip ops
+ **************************************************/
+
+/* Default nand_select_chip calls cmd_ctrl, which is not used in BCM4706 */
+static void bcm47xxnflash_ops_bcm4706_select_chip(struct mtd_info *mtd,
+						  int chip)
+{
+	return;
+}
+
+/**************************************************
+ * Init
+ **************************************************/
+
+int bcm47xxnflash_ops_bcm4706_init(struct bcm47xxnflash *b47n)
+{
+	int err;
+	u32 freq;
+	u16 clock;
+	u8 w0, w1, w2, w3, w4;
+
+	unsigned long chipsize; /* MiB */
+	u8 tbits, col_bits, col_size, row_bits, row_bsize;
+	u32 val;
+
+	b47n->nand_chip.select_chip = bcm47xxnflash_ops_bcm4706_select_chip;
+	b47n->nand_chip.ecc.mode = NAND_ECC_NONE; /* TODO: implement ECC */
+
+	/* Enable NAND flash access */
+	bcma_cc_set32(b47n->cc, BCMA_CC_4706_FLASHSCFG,
+		      BCMA_CC_4706_FLASHSCFG_NF1);
+
+	/* Configure wait counters */
+	if (b47n->cc->status & BCMA_CC_CHIPST_4706_PKG_OPTION) {
+		freq = 100000000;
+	} else {
+		freq = bcma_chipco_pll_read(b47n->cc, 4);
+		freq = (freq * 0xFFF) >> 3;
+		freq = (freq * 25000000) >> 3;
+	}
+	clock = freq / 1000000;
+	w0 = bcm47xxnflash_ops_bcm4706_ns_to_cycle(15, clock);
+	w1 = bcm47xxnflash_ops_bcm4706_ns_to_cycle(20, clock);
+	w2 = bcm47xxnflash_ops_bcm4706_ns_to_cycle(10, clock);
+	w3 = bcm47xxnflash_ops_bcm4706_ns_to_cycle(10, clock);
+	w4 = bcm47xxnflash_ops_bcm4706_ns_to_cycle(100, clock);
+	bcma_cc_write32(b47n->cc, BCMA_CC_NFLASH_WAITCNT0,
+			(w4 << 24 | w3 << 18 | w2 << 12 | w1 << 6 | w0));
+
+	/* Scan NAND */
+	err = nand_scan(&b47n->mtd, 1);
+	if (err) {
+		pr_err("Could not scan NAND flash: %d\n", err);
+		goto exit;
+	}
+
+	/* Configure FLASH */
+	chipsize = b47n->nand_chip.chipsize >> 20;
+	tbits = ffs(chipsize); /* find first bit set */
+	if (!tbits || tbits != fls(chipsize)) {
+		pr_err("Invalid flash size: 0x%lX\n", chipsize);
+		err = -ENOTSUPP;
+		goto exit;
+	}
+	tbits += 19; /* Broadcom increases *index* by 20, we increase *pos* */
+
+	col_bits = b47n->nand_chip.page_shift + 1;
+	col_size = (col_bits + 7) / 8;
+
+	row_bits = tbits - col_bits + 1;
+	row_bsize = (row_bits + 7) / 8;
+
+	val = ((row_bsize - 1) << 6) | ((col_size - 1) << 4) | 2;
+	bcma_cc_write32(b47n->cc, BCMA_CC_NFLASH_CONF, val);
+
+exit:
+	if (err)
+		bcma_cc_mask32(b47n->cc, BCMA_CC_4706_FLASHSCFG,
+			       ~BCMA_CC_4706_FLASHSCFG_NF1);
+	return err;
+}
-- 
1.7.7
