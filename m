Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qbhj5-0000d8-3y
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 23:29:51 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 1/3] mtd: nand: ignore ECC errors for simple BBM scans
Date: Tue, 28 Jun 2011 16:28:58 -0700
Message-ID: <1309303740-9936-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1309303740-9936-1-git-send-email-computersforpeace@gmail.com>
References: <1309303740-9936-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Jim Quinlan <jim2101024@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Kevin Cernekee <cernekee@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now that nand_do_readoob() may return -EUCLEAN or -EBADMSG on ECC errors,
we need to handle the return value specially in some cases.

When scanning for simple bad block markers, reacting to an ECC error is
not very useful, as we assume that the relevant markers are still
non-0xFF for true bad blocks.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_bbt.c |   13 ++++++++++---
 1 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index f30807c..a4fcbf1 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -312,14 +312,20 @@ static int scan_read_raw_oob(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
 			ops.oobbuf = buf + len;
 			ops.datbuf = buf;
 			ops.len = len;
-			return mtd->read_oob(mtd, offs, &ops);
+			res = mtd->read_oob(mtd, offs, &ops);
+
+			/* Ignore ECC errors when checking for BBM */
+			if (res != -EUCLEAN && res != -EBADMSG)
+				return res;
+			return 0;
 		} else {
 			ops.oobbuf = buf + mtd->writesize;
 			ops.datbuf = buf;
 			ops.len = mtd->writesize;
 			res = mtd->read_oob(mtd, offs, &ops);
 
-			if (res)
+			/* Ignore ECC errors when checking for BBM */
+			if (res && res != -EUCLEAN && res != -EBADMSG)
 				return res;
 		}
 
@@ -435,7 +441,8 @@ static int scan_block_fast(struct mtd_info *mtd, struct nand_bbt_descr *bd,
 		 * byte reads for 16 bit buswidth.
 		 */
 		ret = mtd->read_oob(mtd, offs, &ops);
-		if (ret)
+		/* Ignore ECC errors when checking for BBM */
+		if (ret && ret != -EUCLEAN && ret != -EBADMSG)
 			return ret;
 
 		if (check_short_pattern(buf, bd))
-- 
1.7.0.4
