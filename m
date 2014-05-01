Received: from mail-wi0-f181.google.com ([209.85.212.181])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfnlO-0003TV-3c
 for linux-mtd@lists.infradead.org; Thu, 01 May 2014 09:58:46 +0000
Received: by mail-wi0-f181.google.com with SMTP id f8so403956wiw.14
 for <linux-mtd@lists.infradead.org>; Thu, 01 May 2014 02:58:24 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 38/47] mtd: nand: stm_nand_bch: dump bad blocks
Date: Thu,  1 May 2014 10:56:45 +0100
Message-Id: <1398938214-17847-39-git-send-email-lee.jones@linaro.org>
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

Inform the user of any known bad blocks during initialisation.
Conversely, if there aren't any known bad blocks, let the user know
the good news.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index a06dca8..6aaa118 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -1259,6 +1259,28 @@ static int bch_scan_bbt(struct mtd_info *mtd)
 	return 0;
 }
 
+static void nandi_dump_bad_blocks(struct nandi_controller *nandi)
+{
+	int bad_count = 0;
+	uint32_t block;
+	uint8_t *bbt = nandi->info.bbt_info.bbt;
+	uint8_t mark;
+
+	pr_info("BBT:\n");
+	for (block = 0; block < nandi->blocks_per_device; block++) {
+		mark = bbt_get_block_mark(bbt, block);
+		if (mark != BBT_MARK_GOOD) {
+			pr_info("\t\tBlock 0x%08x [%05u] marked bad [%s]\n",
+				block << nandi->block_shift, block,
+				(mark == BBT_MARK_BAD_FACTORY) ?
+				"Factory" : "Wear");
+			bad_count++;
+		}
+	}
+	if (bad_count == 0)
+		pr_info("\t\tNo bad blocks listed in BBT\n");
+}
+
 /*
  * Initialisation
  */
@@ -2021,6 +2043,8 @@ static int stm_nand_bch_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	nandi_dump_bad_blocks(nandi);
+
 	return 0;
 }
 
-- 
1.8.3.2
