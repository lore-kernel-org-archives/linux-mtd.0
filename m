Received: from mail-we0-f170.google.com ([74.125.82.170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfnlJ-0003Qh-MV
 for linux-mtd@lists.infradead.org; Thu, 01 May 2014 09:58:42 +0000
Received: by mail-we0-f170.google.com with SMTP id w61so2896749wes.1
 for <linux-mtd@lists.infradead.org>; Thu, 01 May 2014 02:58:20 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 36/47] mtd: nand: stm_nand_bch: search for and load
 flash-resident BBT
Date: Thu,  1 May 2014 10:56:43 +0100
Message-Id: <1398938214-17847-37-git-send-email-lee.jones@linaro.org>
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

If a BBT already exists in flash, it's this function's task to locate
it and load it into the driver for local consumption.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 87 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index 1569738..2df452b 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -1148,6 +1148,93 @@ static int bch_find_ibbt_sig(struct nandi_controller *nandi,
 	return 1;
 }
 
+/* Search for and load Flash-resident BBT, updating Primary/Mirror if req'd */
+static int bch_load_bbt(struct nandi_controller *nandi,
+			struct nandi_bbt_info *bbt_info)
+{
+	unsigned int update = 0;
+	uint32_t block;
+	loff_t offs;
+	uint8_t vers;
+	char author[64];
+	int bak;
+
+	dev_dbg(nandi->dev, "looking for Flash-resident BBTs\n");
+
+	bbt_info->bbt_block[0] = 0;
+	bbt_info->bbt_block[1] = 0;
+	bbt_info->bbt_vers[0] = 0;
+	bbt_info->bbt_vers[1] = 0;
+
+	/* Look for IBBT signatures */
+	for (block = nandi->blocks_per_device - NAND_IBBT_NBLOCKS;
+	     block < nandi->blocks_per_device;
+	     block++) {
+		offs = (loff_t)block << nandi->block_shift;
+
+		if (bch_find_ibbt_sig(nandi, block, &bak, &vers, author)) {
+			dev_dbg(nandi->dev,
+				"found BBT [%s:%u] at 0x%012llx [%u] (%s)\n",
+				bbt_strs[bak], vers, offs, block,
+				author);
+
+			if (bbt_info->bbt_block[bak] == 0 ||
+			    ((int8_t)(bbt_info->bbt_vers[bak] - vers)) < 0) {
+				bbt_info->bbt_block[bak] = block;
+				bbt_info->bbt_vers[bak] = vers;
+			}
+		}
+	}
+
+	/* What have we found? */
+	if (bbt_info->bbt_block[0] == 0 && bbt_info->bbt_block[1] == 0) {
+		/* no primary, no mirror: return error */
+		return 1;
+	} else if (bbt_info->bbt_block[0] == 0) {
+		/* no primary: use mirror, update primary */
+		bak = 1;
+		update = NAND_IBBT_UPDATE_PRIMARY;
+		bbt_info->bbt_block[0] = nandi->blocks_per_device - 1;
+	} else if (bbt_info->bbt_block[1] == 0) {
+		/* no mirror: use primary, update mirror */
+		bak = 0;
+		update = NAND_IBBT_UPDATE_MIRROR;
+		bbt_info->bbt_block[1] = nandi->blocks_per_device - 1;
+	} else if (bbt_info->bbt_vers[0] == bbt_info->bbt_vers[1]) {
+		/* primary == mirror: use primary, no update required */
+		bak = 0;
+	} else if ((int8_t)(bbt_info->bbt_vers[1] -
+			    bbt_info->bbt_vers[0]) < 0) {
+		/* primary > mirror: use primary, update mirror */
+		bak = 0;
+		update = NAND_IBBT_UPDATE_MIRROR;
+	} else {
+		/* mirror > primary: use mirror, update primary */
+		bak = 1;
+		update = NAND_IBBT_UPDATE_PRIMARY;
+	}
+
+	vers = bbt_info->bbt_vers[bak];
+	block = bbt_info->bbt_block[bak];
+	offs = block << nandi->block_shift;
+	dev_info(nandi->dev, "using BBT [%s:%u] at 0x%012llx [%u]\n",
+		 bbt_strs[bak], vers, offs, block);
+
+	/* Read BBT data */
+	if (bch_read_page(nandi, offs, bbt_info->bbt) < 0) {
+		dev_err(nandi->dev,
+			"error while reading BBT %s:%u] at 0x%012llx [%u]\n",
+			bbt_strs[bak], vers, offs, block);
+		return 1;
+	}
+
+	/* Update other BBT if required */
+	if (update)
+		bch_update_bbts(nandi, bbt_info, update, vers);
+
+	return 0;
+}
+
 /*
  * Initialisation
  */
-- 
1.8.3.2
