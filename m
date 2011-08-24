Received: from mail-pz0-f41.google.com ([209.85.210.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QwKl9-0000An-2K
	for linux-mtd@lists.infradead.org; Wed, 24 Aug 2011 21:13:16 +0000
Received: by mail-pz0-f41.google.com with SMTP id 4so1999386pzk.28
	for <linux-mtd@lists.infradead.org>;
	Wed, 24 Aug 2011 14:13:14 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 1/2] mtd: support writing OOB without ECC
Date: Wed, 24 Aug 2011 14:12:23 -0700
Message-Id: <1314220344-10986-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1314220344-10986-1-git-send-email-computersforpeace@gmail.com>
References: <1314220344-10986-1-git-send-email-computersforpeace@gmail.com>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
	Kevin Cernekee <cernekee@gmail.com>, Jim Quinlan <jim2101024@gmail.com>,
	linux-mtd@lists.infradead.org, liu.h.jason@gmail.com,
	Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This fixes issues with `nandwrite -n -o' and the MEMWRITEOOB[64] ioctls
on hardware that writes ECC when writing OOB. The problem arises as
follows: `nandwrite -n' can write page data to flash without applying
ECC, but when used with the `-o' option, ECC is applied (incorrectly),
contrary to the `--noecc' option.

I found that this is the case because my hardware computes and writes
ECC data to flash upon either OOB write or page write. Thus, to support
a proper "no ECC" write, my driver must know when we're performing a raw
OOB write vs. a normal ECC OOB write. However, MTD does not pass any raw
mode information to the write_oob functions.  This patch addresses the
problems by:

1) Passing MTD_OOB_RAW down to lower layers, instead of just defaulting
   to MTD_OOB_PLACE
2) Handling MTD_OOB_RAW within the NAND layer's `nand_do_write_oob'
3) Adding a new (replaceable) function pointer in struct ecc_ctrl; this
   function should support writing OOB without ECC data. Current
   hardware often can use the same OOB write function when writing
   either with or without ECC

This was tested with nandsim as well as on actual SLC NAND.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtdchar.c        |    3 ++-
 drivers/mtd/nand/nand_base.c |   11 ++++++++++-
 include/linux/mtd/nand.h     |    3 +++
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index b206254..bcb7f05 100644
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
 	ops.ooboffs = start & (mtd->writesize - 1);
 	ops.datbuf = NULL;
-	ops.mode = MTD_OOB_PLACE;
+	ops.mode = (mfi->mode == MTD_MODE_RAW) ? MTD_OOB_RAW : MTD_OOB_PLACE;
 
 	if (ops.ooboffs && ops.ooblen > (mtd->oobsize - ops.ooboffs))
 		return -EINVAL;
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index d2ee68a..2ab8aa3 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2401,7 +2401,12 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 		chip->pagebuf = -1;
 
 	nand_fill_oob(mtd, ops->oobbuf, ops->ooblen, ops);
-	status = chip->ecc.write_oob(mtd, chip, page & chip->pagemask);
+
+	if (ops->mode == MTD_OOB_RAW) {
+		status = chip->ecc.write_oob_raw(mtd, chip, page & chip->pagemask);
+	} else {
+		status = chip->ecc.write_oob(mtd, chip, page & chip->pagemask);
+	}
 
 	if (status)
 		return status;
@@ -3377,6 +3382,10 @@ int nand_scan_tail(struct mtd_info *mtd)
 		BUG();
 	}
 
+	/* For many systems, the standard OOB write also works for raw */
+	if (!chip->ecc.write_oob_raw)
+		chip->ecc.write_oob_raw = chip->ecc.write_oob;
+
 	/*
 	 * The number of bytes available for a client to place data into
 	 * the out of band area.
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 85fef68..5f3fdd9 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -340,6 +340,7 @@ struct nand_hw_control {
  * @read_subpage:	function to read parts of the page covered by ECC.
  * @write_page:	function to write a page according to the ECC generator
  *		requirements.
+ * @write_oob_raw:	function to write chip OOB data without ECC
  * @read_oob:	function to read chip OOB data
  * @write_oob:	function to write chip OOB data
  */
@@ -368,6 +369,8 @@ struct nand_ecc_ctrl {
 			uint32_t offs, uint32_t len, uint8_t *buf);
 	void (*write_page)(struct mtd_info *mtd, struct nand_chip *chip,
 			const uint8_t *buf);
+	int (*write_oob_raw)(struct mtd_info *mtd, struct nand_chip *chip,
+			int page);
 	int (*read_oob)(struct mtd_info *mtd, struct nand_chip *chip, int page,
 			int sndcmd);
 	int (*write_oob)(struct mtd_info *mtd, struct nand_chip *chip,
-- 
1.7.5.4
