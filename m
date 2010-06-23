Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1ORWgu-00012H-Fi
	for linux-mtd@lists.infradead.org; Wed, 23 Jun 2010 20:37:01 +0000
From: "Brian Norris" <norris@broadcom.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd/nand: Edit macro flag for BBT scan of last page in block
Date: Wed, 23 Jun 2010 13:36:02 -0700
Message-ID: <1277325362-13326-1-git-send-email-norris@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

NAND_BB_LAST_PAGE used to be in nand.h, but it pertained to bad block
management and so belongs next to NAND_BBT_SCAN2NDPAGE in bbm.h. Also,
its previous flag value (0x00000400) conflicted with NAND_BBT_SCANALLPAGES
so I changed its value to 0x00008000. All uses of the name were modified to
provide consistency with other "NAND_BBT_*" flags.

Signed-off-by: Brian Norris <norris@broadcom.com>
---
 drivers/mtd/nand/nand_base.c |    6 +++---
 drivers/mtd/nand/nand_bbt.c  |    2 +-
 include/linux/mtd/bbm.h      |    2 ++
 include/linux/mtd/nand.h     |    2 --
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 4a7b864..e6cf9ae 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -347,7 +347,7 @@ static int nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
 	struct nand_chip *chip = mtd->priv;
 	u16 bad;
 
-	if (chip->options & NAND_BB_LAST_PAGE)
+	if (chip->options & NAND_BBT_SCANLASTPAGE)
 		ofs += mtd->erasesize - mtd->writesize;
 
 	page = (int)(ofs >> chip->page_shift) & chip->pagemask;
@@ -399,7 +399,7 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	uint8_t buf[2] = { 0, 0 };
 	int block, ret;
 
-	if (chip->options & NAND_BB_LAST_PAGE)
+	if (chip->options & NAND_BBT_SCANLASTPAGE)
 		ofs += mtd->erasesize - mtd->writesize;
 
 	/* Get block number */
@@ -2946,7 +2946,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	if ((chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
 			(*maf_id == NAND_MFR_SAMSUNG ||
 			 *maf_id == NAND_MFR_HYNIX))
-		chip->options |= NAND_BB_LAST_PAGE;
+		chip->options |= NAND_BBT_SCANLASTPAGE;
 
 	/* Check for AND chips with 4 page planes */
 	if (chip->options & NAND_4PAGE_ARRAY)
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index ad97c0c..71d83be 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -432,7 +432,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 		from = (loff_t)startblock << (this->bbt_erase_shift - 1);
 	}
 
-	if (this->options & NAND_BB_LAST_PAGE)
+	if (this->options & NAND_BBT_SCANLASTPAGE)
 		from += mtd->erasesize - (mtd->writesize * len);
 
 	for (i = startblock; i < numblocks;) {
diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h
index 9c3757c..8ad0b86 100644
--- a/include/linux/mtd/bbm.h
+++ b/include/linux/mtd/bbm.h
@@ -82,6 +82,8 @@ struct nand_bbt_descr {
 #define NAND_BBT_SAVECONTENT	0x00002000
 /* Search good / bad pattern on the first and the second page */
 #define NAND_BBT_SCAN2NDPAGE	0x00004000
+/* Search good / bad pattern on the last page of the eraseblock */
+#define NAND_BBT_SCANLASTPAGE	0x00008000
 
 /* The maximum number of blocks to scan for a bbt */
 #define NAND_BBT_SCAN_MAXBLOCKS	4
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index a81b185..50f3aa0 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -181,8 +181,6 @@ typedef enum {
 #define NAND_NO_READRDY		0x00000100
 /* Chip does not allow subpage writes */
 #define NAND_NO_SUBPAGE_WRITE	0x00000200
-/* Chip stores bad block marker on the last page of the eraseblock */
-#define NAND_BB_LAST_PAGE	0x00000400
 
 /* Device is one of 'new' xD cards that expose fake nand command set */
 #define NAND_BROKEN_XD		0x00000400
-- 
1.7.1
