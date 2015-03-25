Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YalRE-00013N-Qi
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2015 13:33:42 +0000
From: Richard Weinberger <richard@nod.at>
To: computersforpeace@gmail.com
Subject: [PATCH] mtd: nand: Remove in vain memset() in nand_onfi_get_features()
Date: Wed, 25 Mar 2015 14:33:09 +0100
Message-Id: <1427290389-14495-1-git-send-email-richard@nod.at>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As all four bytes are written in any case the memset() is in vain.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nand_base.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index df7eb4f..030a043 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2909,9 +2909,6 @@ static int nand_onfi_get_features(struct mtd_info *mtd, struct nand_chip *chip,
 	      & ONFI_OPT_CMD_SET_GET_FEATURES))
 		return -EINVAL;
 
-	/* clear the sub feature parameters */
-	memset(subfeature_param, 0, ONFI_SUBFEATURE_PARAM_LEN);
-
 	chip->cmdfunc(mtd, NAND_CMD_GET_FEATURES, addr, -1);
 	for (i = 0; i < ONFI_SUBFEATURE_PARAM_LEN; ++i)
 		*subfeature_param++ = chip->read_byte(mtd);
-- 
1.8.4.5
