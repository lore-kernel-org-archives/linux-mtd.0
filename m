Received: from mail-we0-f177.google.com ([74.125.82.177])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSMcQ-0002ES-Ls
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 08:21:59 +0000
Received: by mail-we0-f177.google.com with SMTP id u57so79450wes.36
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 01:21:36 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 41/47] mtd: nand: stm_nand_bch: MTD mark and check for bad
 blocks (BCH)
Date: Tue, 25 Mar 2014 08:19:58 +0000
Message-Id: <1395735604-26706-42-git-send-email-lee.jones@linaro.org>
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

Use the local BBM helpers to check for and mark bad blocks.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 51 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index 55f4a4c..38658b8 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -1218,6 +1218,55 @@ static int flex_do_write_ops(struct nandi_controller *nandi,
 	return 0;
 }
 
+static int bch_mtd_block_isbad(struct mtd_info *mtd, loff_t offs)
+{
+	struct nand_chip *chip = mtd->priv;
+	struct nandi_controller *nandi = chip->priv;
+
+	uint32_t block;
+
+	/* Check for invalid offset */
+	if (offs > mtd->size)
+		return -EINVAL;
+
+	block = offs >> nandi->block_shift;
+
+	/* Protect blocks reserved for BBTs */
+	if (block >= (nandi->blocks_per_device - NAND_IBBT_NBLOCKS))
+		return 1;
+
+	return bbt_is_block_bad(nandi->info.bbt_info.bbt, block);
+}
+
+static int bch_mtd_block_markbad(struct mtd_info *mtd, loff_t offs)
+{
+	struct nand_chip *chip = mtd->priv;
+	struct nandi_controller *nandi = chip->priv;
+
+	uint32_t block;
+	int ret;
+
+	/* Is block already considered bad? (will also catch invalid offsets) */
+	ret = mtd_block_isbad(mtd, offs);
+	if (ret < 0)
+		return ret;
+	if (ret == 1)
+		return 0;
+
+	/* Mark bad */
+	block = offs >> nandi->block_shift;
+	bbt_set_block_mark(nandi->info.bbt_info.bbt, block, BBT_MARK_BAD_WEAR);
+
+	/* Update BBTs, incrementing bbt_vers */
+	nand_get_device(mtd, FL_WRITING);
+	ret = bch_update_bbts(nandi, &nandi->info.bbt_info,
+			      NAND_IBBT_UPDATE_BOTH,
+			      nandi->info.bbt_info.bbt_vers[0] + 1);
+	nand_release_device(mtd);
+
+	return ret;
+}
+
 static int bch_mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	struct nand_chip *chip = mtd->priv;
@@ -1405,6 +1454,8 @@ static void nandi_set_mtd_defaults(struct nandi_controller *nandi,
 	mtd->subpage_sft = 0;
 
 	mtd->_erase = bch_mtd_erase;
+	mtd->_block_isbad = bch_mtd_block_isbad;
+	mtd->_block_markbad = bch_mtd_block_markbad;
 
 	mtd->_point = NULL;
 	mtd->_unpoint = NULL;
-- 
1.8.3.2
