Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1faLRs-0004l6-HY
 for linux-mtd@lists.infradead.org; Tue, 03 Jul 2018 13:34:30 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: stable@vger.kernel.org
Cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-msm@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [BACKPORT PATCH] mtd: nand: fix return value check for bad block
 status
Date: Tue,  3 Jul 2018 19:04:05 +0530
Message-Id: <1530624845-28319-1-git-send-email-absahu@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

commit e9893e6fa932f42c90c4ac5849fa9aa0f0f00a34 upstream.

Positive return value from read_oob() is making false BAD
blocks. For some of the NAND controllers, OOB bytes will be
protected with ECC and read_oob() will return number of bitflips.
If there is any bitflip in ECC protected OOB bytes for BAD block
status page, then that block is getting treated as BAD.

Fixes: c120e75e0e7d ("mtd: nand: use read_oob() instead of cmdfunc() for bad block check")
Cc: <stable@vger.kernel.org>
Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
[backported to 4.14.y]
Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---

This is backported patch for failed patch mentioned in
https://www.spinics.net/lists/stable/msg245833.html
The failure happened due to file rename.

 drivers/mtd/nand/nand_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 528e04f..d410de3 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
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
