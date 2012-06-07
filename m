Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SchX9-00023Y-J7
 for linux-mtd@lists.infradead.org; Thu, 07 Jun 2012 18:34:12 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: ignore ecc errors during bbt reads
Date: Thu,  7 Jun 2012 11:32:08 -0700
Message-Id: <1339093928-17545-1-git-send-email-mikedunn@newsguy.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ignore ecc errors in the scan_read_raw_oob() function.  Also removed code that
is now redundant.

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---
 drivers/mtd/nand/nand_bbt.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 30d1319..585da44 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -319,7 +319,8 @@ static int scan_read_raw_oob(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
 
 		res = mtd_read_oob(mtd, offs, &ops);
 
-		if (res)
+		/* Ignore ECC errors when checking for BBM */
+		if (res && !mtd_is_bitflip_or_eccerr(res))
 			return res;
 
 		buf += mtd->oobsize + mtd->writesize;
@@ -406,8 +407,7 @@ static int scan_block_full(struct mtd_info *mtd, struct nand_bbt_descr *bd,
 	int ret, j;
 
 	ret = scan_read_raw_oob(mtd, buf, offs, readlen);
-	/* Ignore ECC errors when checking for BBM */
-	if (ret && !mtd_is_bitflip_or_eccerr(ret))
+	if (ret)
 		return ret;
 
 	for (j = 0; j < len; j++, buf += scanlen) {
-- 
1.7.3.4
