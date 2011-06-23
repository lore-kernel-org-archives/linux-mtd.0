Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QZtbL-0008AN-CU
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2011 23:46:24 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH] mtd: nand: handle ECC errors in OOB
Date: Thu, 23 Jun 2011 16:45:24 -0700
Message-ID: <1308872724-6196-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Jim Quinlan <jim2101024@gmail.com>, linux-mtd@lists.infradead.org,
	Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, Kevin Cernekee <cernekee@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

While the standard NAND OOB functions do not do ECC on the spare area,
it is possible for a driver to supply its own OOB ECC functions (e.g., HW
ECC). nand_do_read_oob should act like nand_do_read_ops in checking the
ECC stats and returning -EBADMSG or -EUCLEAN on uncorrectable errors or
correctable bitflips, respectively. These error codes could be used in
flash-based BBT code or in YAFFS, for example.

Doing this, however, messes with the behavior of mtd_do_readoob. Now,
mtd_do_readoob should check whether we had -EUCLEAN or -EBADMSG errors
and discard those as "non-fatal" so that the ioctls can still succeed
with (possibly uncorrected) data.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtdchar.c        |   15 +++++++++++++++
 drivers/mtd/nand/nand_base.c |    9 ++++++++-
 2 files changed, 23 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 3f92731..8a45525 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -472,6 +472,21 @@ static int mtd_do_readoob(struct mtd_info *mtd, uint64_t start,
 		ret = -EFAULT;
 
 	kfree(ops.oobbuf);
+
+	/*
+	 * NAND returns -EBADMSG on ECC errors, but it returns the OOB
+	 * data. For our userspace tools it is important to dump areas
+	 * with ECC errors!
+	 * For kernel internal usage it also might return -EUCLEAN
+	 * to signal the caller that a bitflip has occured and has
+	 * been corrected by the ECC algorithm.
+	 *
+	 * Note: most NAND ECC algorithms do not calculate ECC
+	 * for the OOB area.
+	 */
+	if (ret == -EUCLEAN || ret == -EBADMSG)
+		return 0;
+
 	return ret;
 }
 
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a46e9bb..f0ba2da 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1761,6 +1761,7 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 {
 	int page, realpage, chipnr, sndcmd = 1;
 	struct nand_chip *chip = mtd->priv;
+	struct mtd_ecc_stats stats;
 	int blkcheck = (1 << (chip->phys_erase_shift - chip->page_shift)) - 1;
 	int readlen = ops->ooblen;
 	int len;
@@ -1769,6 +1770,8 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 	DEBUG(MTD_DEBUG_LEVEL3, "%s: from = 0x%08Lx, len = %i\n",
 			__func__, (unsigned long long)from, readlen);
 
+	stats = mtd->ecc_stats;
+
 	if (ops->mode == MTD_OOB_AUTO)
 		len = chip->ecc.layout->oobavail;
 	else
@@ -1838,7 +1841,11 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 	}
 
 	ops->oobretlen = ops->ooblen;
-	return 0;
+
+	if (mtd->ecc_stats.failed - stats.failed)
+		return -EBADMSG;
+
+	return  mtd->ecc_stats.corrected - stats.corrected ? -EUCLEAN : 0;
 }
 
 /**
-- 
1.7.0.4
