Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PO9E5-0006Sa-9i
	for linux-mtd@lists.infradead.org; Thu, 02 Dec 2010 13:29:34 +0000
From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: onenand: bugfix for 2x mode bad block handling
Date: Thu,  2 Dec 2010 15:28:38 +0200
Message-Id: <1291296518-31566-1-git-send-email-roman.tereshonkov@nokia.com>
Cc: kyungmin.park@samsung.com, dwmw2@infradead.org,
	Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This bug becomes visible in 2x mode when chip->writesize
is different from mtd->writesize (= 2 * chip->writesize).
At this case the bad block information is read from
the first and the third physical pages instead of
the first and the second as specification states.

Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
---
 drivers/mtd/onenand/onenand_bbt.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_bbt.c b/drivers/mtd/onenand/onenand_bbt.c
index 01ab5b3..905209b 100644
--- a/drivers/mtd/onenand/onenand_bbt.c
+++ b/drivers/mtd/onenand/onenand_bbt.c
@@ -91,13 +91,15 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 		for (j = 0; j < len; j++) {
 			/* No need to read pages fully,
 			 * just read required OOB bytes */
-			ret = onenand_bbt_read_oob(mtd, from + j * mtd->writesize + bd->offs, &ops);
+			ret = onenand_bbt_read_oob(mtd,
+				from + j * this->writesize + bd->offs, &ops);
 
 			/* If it is a initial bad block, just ignore it */
 			if (ret == ONENAND_BBT_READ_FATAL_ERROR)
 				return -EIO;
 
-			if (ret || check_short_pattern(&buf[j * scanlen], scanlen, mtd->writesize, bd)) {
+			if (ret || check_short_pattern(&buf[j * scanlen],
+					       scanlen, this->writesize, bd)) {
 				bbm->bbt[i >> 3] |= 0x03 << (i & 0x6);
 				printk(KERN_WARNING "Bad eraseblock %d at 0x%08x\n",
 					i >> 1, (unsigned int) from);
-- 
1.7.0.4
