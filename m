Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fT1g9-00059j-0s
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2018 09:02:59 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Abhishek Sahu <absahu@codeaurora.org>, <stable@vger.kernel.org>
Subject: [PATCH] mtd: rawnand: fix return value check for bad block status
Date: Wed, 13 Jun 2018 14:32:36 +0530
Message-Id: <1528880556-20348-1-git-send-email-absahu@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Positive return value from read_oob() is making false BAD
blocks. For some of the NAND controllers, OOB bytes will be
protected with ECC and read_oob() will return number of bitflips.
If there is any bitflip in ECC protected OOB bytes for BAD block
status page, then that block is getting treated as BAD.

Fixes: c120e75e0e7d ("mtd: nand: use read_oob() instead of cmdfunc() for bad block check")
Cc: <stable@vger.kernel.org>
Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/raw/nand_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index f28c3a5..4a73f73 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -440,7 +440,7 @@ static int nand_block_bad(struct mtd_info *mtd, loff_t ofs)
 
 	for (; page < page_end; page++) {
 		res = chip->ecc.read_oob(mtd, chip, page);
-		if (res)
+		if (res < 0)
 			return res;
 
 		bad = chip->oob_poi[chip->badblockpos];
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc.
is a member of Code Aurora Forum, hosted by The Linux Foundation
