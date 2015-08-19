Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRvJg-0000jz-92
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 04:49:36 +0000
From: Archit Taneja <architt@codeaurora.org>
To: linux-mtd@lists.infradead.org, dehrenberg@google.com, cernekee@gmail.com,
 computersforpeace@gmail.com, sboyd@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, agross@codeaurora.org,
 linux-kernel@vger.kernel.org, Archit Taneja <architt@codeaurora.org>
Subject: [PATCH v4 1/5] mtd: nand: Create a BBT flag to access bad block
 markers in raw mode
Date: Wed, 19 Aug 2015 10:19:02 +0530
Message-Id: <1439959746-25498-2-git-send-email-architt@codeaurora.org>
In-Reply-To: <1439959746-25498-1-git-send-email-architt@codeaurora.org>
References: <1438578498-32254-1-git-send-email-architt@codeaurora.org>
 <1439959746-25498-1-git-send-email-architt@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some controllers can access the factory bad block marker from OOB only
when they read it in raw mode. When ECC is enabled, these controllers
discard reading/writing bad block markers, preventing access to them
altogether.

The bbt driver assumes MTD_OPS_PLACE_OOB when scanning for bad blocks.
This results in the nand driver's ecc->read_oob() op to be called, which
works with ECC enabled.

Create a new BBT option flag that tells nand_bbt to force the mode to
MTD_OPS_RAW. This would result in the correct op being called for the
underlying nand controller driver.

Reviewed-by: Andy Gross <agross@codeaurora.org>
Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
 drivers/mtd/nand/nand_base.c | 6 +++++-
 drivers/mtd/nand/nand_bbt.c  | 6 +++++-
 include/linux/mtd/bbm.h      | 7 +++++++
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ceb68ca..0a0c524 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -394,7 +394,11 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	} else {
 		ops.len = ops.ooblen = 1;
 	}
-	ops.mode = MTD_OPS_PLACE_OOB;
+
+	if (unlikely(chip->bbt_options & NAND_BBT_ACCESS_BBM_RAW))
+		ops.mode = MTD_OPS_RAW;
+	else
+		ops.mode = MTD_OPS_PLACE_OOB;
 
 	/* Write to first/last page(s) if necessary */
 	if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 63a1a36..f2d89c9 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -420,7 +420,11 @@ static int scan_block_fast(struct mtd_info *mtd, struct nand_bbt_descr *bd,
 	ops.oobbuf = buf;
 	ops.ooboffs = 0;
 	ops.datbuf = NULL;
-	ops.mode = MTD_OPS_PLACE_OOB;
+
+	if (unlikely(bd->options & NAND_BBT_ACCESS_BBM_RAW))
+		ops.mode = MTD_OPS_RAW;
+	else
+		ops.mode = MTD_OPS_PLACE_OOB;
 
 	for (j = 0; j < numpages; j++) {
 		/*
diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h
index 36bb6a5..f67f84a 100644
--- a/include/linux/mtd/bbm.h
+++ b/include/linux/mtd/bbm.h
@@ -116,6 +116,13 @@ struct nand_bbt_descr {
 #define NAND_BBT_NO_OOB_BBM	0x00080000
 
 /*
+ * Force MTD_OPS_RAW mode when trying to access bad block markes from OOB. To
+ * be used by controllers which can access BBM only when ECC is disabled, i.e,
+ * when in RAW access mode
+ */
+#define NAND_BBT_ACCESS_BBM_RAW	0x00100000
+
+/*
  * Flag set by nand_create_default_bbt_descr(), marking that the nand_bbt_descr
  * was allocated dynamicaly and must be freed in nand_release(). Has no meaning
  * in nand_chip.bbt_options.
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
