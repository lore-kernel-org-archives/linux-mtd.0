Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qtpt4-0001BL-Rb
	for linux-mtd@lists.infradead.org; Wed, 17 Aug 2011 23:51:07 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [RFC 1/5] mtd: support MTD_MODE_RAW for writing OOB
Date: Wed, 17 Aug 2011 16:50:25 -0700
Message-ID: <1313625029-19546-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Mike Frysinger <vapier.adi@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
	b35362@freescale.com, linux-mtd@lists.infradead.org,
	Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtd_do_write_oob does not pass information about whether to write in RAW
mode to the lower layers (e.g., NAND). We should pass MTD_OOB_RAW or
MTD_OOB_PLACE based on the MTD file mode.

This fixes issues with `nandwrite -n' and the MEMWRITEOOB[64] ioctls.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtdchar.c        |    3 ++-
 drivers/mtd/nand/nand_base.c |    9 ++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index a75d555..7ca4361 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -391,6 +391,7 @@ static int mtd_do_writeoob(struct file *file, struct mtd_info *mtd,
 	uint64_t start, uint32_t length, void __user *ptr,
 	uint32_t __user *retp)
 {
+	struct mtd_file_info *mfi = file->private_data;
 	struct mtd_oob_ops ops;
 	uint32_t retlen;
 	int ret = 0;
@@ -412,7 +413,7 @@ static int mtd_do_writeoob(struct file *file, struct mtd_info *mtd,
 	ops.ooblen = length;
 	ops.ooboffs = start & (mtd->oobsize - 1);
 	ops.datbuf = NULL;
-	ops.mode = MTD_OOB_PLACE;
+	ops.mode = (mfi->mode == MTD_MODE_RAW) ? MTD_OOB_RAW : MTD_OOB_PLACE;
 
 	if (ops.ooboffs && ops.ooblen > (mtd->oobsize - ops.ooboffs))
 		return -EINVAL;
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index d2ee68a..e2b1c90 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2401,7 +2401,14 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 		chip->pagebuf = -1;
 
 	nand_fill_oob(mtd, ops->oobbuf, ops->ooblen, ops);
-	status = chip->ecc.write_oob(mtd, chip, page & chip->pagemask);
+
+	if (ops->mode == MTD_OOB_RAW) {
+		status = 0;
+		chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
+		chip->ecc.write_page_raw(mtd, chip, NULL);
+	} else {
+		status = chip->ecc.write_oob(mtd, chip, page & chip->pagemask);
+	}
 
 	if (status)
 		return status;
-- 
1.7.0.4
