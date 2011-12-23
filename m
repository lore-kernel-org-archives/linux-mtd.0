Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Re9aE-0005Ho-B5
 for linux-mtd@lists.infradead.org; Fri, 23 Dec 2011 18:11:10 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 26/28] mtd: introduce mtd_block_markbad interface
Date: Fri, 23 Dec 2011 20:11:18 +0200
Message-Id: <1324663880-22477-27-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1324663880-22477-1-git-send-email-dedekind1@gmail.com>
References: <1324663880-22477-1-git-send-email-dedekind1@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/inftlmount.c               |    2 +-
 drivers/mtd/mtdchar.c                  |    2 +-
 drivers/mtd/mtdconcat.c                |    2 +-
 drivers/mtd/mtdoops.c                  |    2 +-
 drivers/mtd/mtdpart.c                  |    2 +-
 drivers/mtd/mtdswap.c                  |    2 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    2 +-
 drivers/mtd/nand/nand_base.c           |    2 +-
 drivers/mtd/nand/nandsim.c             |    2 +-
 drivers/mtd/nftlmount.c                |    2 +-
 drivers/mtd/onenand/onenand_base.c     |    2 +-
 drivers/mtd/ubi/io.c                   |    2 +-
 fs/jffs2/wbuf.c                        |    2 +-
 include/linux/mtd/mtd.h                |    9 ++++++---
 14 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index 3851940..4adc037 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -424,7 +424,7 @@ int INFTL_formatblock(struct INFTLrecord *inftl, int block)
 fail:
 	/* could not format, update the bad block table (caller is responsible
 	   for setting the PUtable to BLOCK_RESERVED on failure) */
-	inftl->mbd.mtd->block_markbad(inftl->mbd.mtd, instr->addr);
+	mtd_block_markbad(inftl->mbd.mtd, instr->addr);
 	return -1;
 }
 
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 8132fe9..0a8bf82 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -899,7 +899,7 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 		if (!mtd->block_markbad)
 			ret = -EOPNOTSUPP;
 		else
-			return mtd->block_markbad(mtd, offs);
+			return mtd_block_markbad(mtd, offs);
 		break;
 	}
 
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index d0db5e6..f694b51 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -693,7 +693,7 @@ static int concat_block_markbad(struct mtd_info *mtd, loff_t ofs)
 			continue;
 		}
 
-		err = subdev->block_markbad(subdev, ofs);
+		err = mtd_block_markbad(subdev, ofs);
 		if (!err)
 			mtd->ecc_stats.badblocks++;
 		break;
diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index bc43d2f..69532a3 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -200,7 +200,7 @@ badblock:
 	}
 
 	if (mtd->block_markbad && ret == -EIO) {
-		ret = mtd->block_markbad(mtd, cxt->nextpage * record_size);
+		ret = mtd_block_markbad(mtd, cxt->nextpage * record_size);
 		if (ret < 0) {
 			printk(KERN_ERR "mtdoops: block_markbad failed, aborting\n");
 			return;
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 0e7dfc7..a3d44c3 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -335,7 +335,7 @@ static int part_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	if (ofs >= mtd->size)
 		return -EINVAL;
 	ofs += part->offset;
-	res = part->master->block_markbad(part->master, ofs);
+	res = mtd_block_markbad(part->master, ofs);
 	if (!res)
 		mtd->ecc_stats.badblocks++;
 	return res;
diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index 87aa0a6..4441c08 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -279,7 +279,7 @@ static int mtdswap_handle_badblock(struct mtdswap_dev *d, struct swap_eb *eb)
 
 	offset = mtdswap_eb_offset(d, eb);
 	dev_warn(d->dev, "Marking bad block at %08llx\n", offset);
-	ret = d->mtd->block_markbad(d->mtd, offset);
+	ret = mtd_block_markbad(d->mtd, offset);
 
 	if (ret) {
 		dev_warn(d->dev, "Mark block bad failed for block at %08llx "
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 493ec2f..1e9ea83 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1379,7 +1379,7 @@ static int __devinit mx23_boot_init(struct gpmi_nand_data  *this)
 		 */
 		if (block_mark != 0xff) {
 			dev_dbg(dev, "Transcribing mark in block %u\n", block);
-			ret = chip->block_markbad(mtd, byte);
+			ret = mtd_block_markbad(mtd, byte);
 			if (ret)
 				dev_err(dev, "Failed to mark block bad with "
 							"ret %d\n", ret);
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 35b4565..28b49b6 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2740,7 +2740,7 @@ static int nand_block_markbad(struct mtd_info *mtd, loff_t ofs)
 		return ret;
 	}
 
-	return chip->block_markbad(mtd, ofs);
+	return mtd_block_markbad(mtd, ofs);
 }
 
 /**
diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 34c03be..261f478 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -737,7 +737,7 @@ static int parse_badblocks(struct nandsim *ns, struct mtd_info *mtd)
 			return -EINVAL;
 		}
 		offset = erase_block_no * ns->geom.secsz;
-		if (mtd->block_markbad(mtd, offset)) {
+		if (mtd_block_markbad(mtd, offset)) {
 			NS_ERR("invalid badblocks.\n");
 			return -EINVAL;
 		}
diff --git a/drivers/mtd/nftlmount.c b/drivers/mtd/nftlmount.c
index 156af9f..51b9d6a 100644
--- a/drivers/mtd/nftlmount.c
+++ b/drivers/mtd/nftlmount.c
@@ -356,7 +356,7 @@ int NFTL_formatblock(struct NFTLrecord *nftl, int block)
 fail:
 	/* could not format, update the bad block table (caller is responsible
 	   for setting the ReplUnitTable to BLOCK_RESERVED on failure) */
-	nftl->mbd.mtd->block_markbad(nftl->mbd.mtd, instr->addr);
+	mtd_block_markbad(nftl->mbd.mtd, instr->addr);
 	return -1;
 }
 
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index a839473..dd278a2 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -2645,7 +2645,7 @@ static int onenand_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	}
 
 	onenand_get_device(mtd, FL_WRITING);
-	ret = this->block_markbad(mtd, ofs);
+	ret = mtd_block_markbad(mtd, ofs);
 	onenand_release_device(mtd);
 	return ret;
 }
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index a1b683a..5cde4e5 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -669,7 +669,7 @@ int ubi_io_mark_bad(const struct ubi_device *ubi, int pnum)
 	if (!ubi->bad_allowed)
 		return 0;
 
-	err = mtd->block_markbad(mtd, (loff_t)pnum * ubi->peb_size);
+	err = mtd_block_markbad(mtd, (loff_t)pnum * ubi->peb_size);
 	if (err)
 		ubi_err("cannot mark PEB %d bad, error %d", pnum, err);
 	return err;
diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index eae5be4..fd96b75 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -1134,7 +1134,7 @@ int jffs2_write_nand_badblock(struct jffs2_sb_info *c, struct jffs2_eraseblock *
 		return 1; // What else can we do?
 
 	printk(KERN_WARNING "JFFS2: marking eraseblock at %08x\n as bad", bad_offset);
-	ret = c->mtd->block_markbad(c->mtd, bad_offset);
+	ret = mtd_block_markbad(c->mtd, bad_offset);
 
 	if (ret) {
 		D1(printk(KERN_WARNING "jffs2_write_nand_badblock(): Write failed for block at %08x: error %d\n", jeb->offset, ret));
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index a307ad0..64aa54f 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -211,6 +211,7 @@ struct mtd_info {
 	int (*unlock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
 	int (*is_locked) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
 	int (*block_isbad) (struct mtd_info *mtd, loff_t ofs);
+	int (*block_markbad) (struct mtd_info *mtd, loff_t ofs);
 	int (*suspend) (struct mtd_info *mtd);
 	void (*resume) (struct mtd_info *mtd);
 
@@ -219,9 +220,6 @@ struct mtd_info {
 	 */
 	struct backing_dev_info *backing_dev_info;
 
-	/* Bad block management functions */
-	int (*block_markbad) (struct mtd_info *mtd, loff_t ofs);
-
 	struct notifier_block reboot_notifier;  /* default mode before reboot */
 
 	/* ECC status information */
@@ -411,6 +409,11 @@ static inline int mtd_block_isbad(struct mtd_info *mtd, loff_t ofs)
 	return mtd->block_isbad(mtd, ofs);
 }
 
+static inline int mtd_block_markbad(struct mtd_info *mtd, loff_t ofs)
+{
+	return mtd->block_markbad(mtd, ofs);
+}
+
 static inline struct mtd_info *dev_to_mtd(struct device *dev)
 {
 	return dev ? dev_get_drvdata(dev) : NULL;
-- 
1.7.7.3
