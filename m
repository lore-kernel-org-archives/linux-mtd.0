Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Re9Zv-0005IH-7j
 for linux-mtd@lists.infradead.org; Fri, 23 Dec 2011 18:10:50 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 11/28] mtd: introduce mtd_write_oob interface
Date: Fri, 23 Dec 2011 20:11:03 +0200
Message-Id: <1324663880-22477-12-git-send-email-dedekind1@gmail.com>
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
 drivers/mtd/inftlcore.c           |    4 ++--
 drivers/mtd/mtdchar.c             |    6 +++---
 drivers/mtd/mtdconcat.c           |    2 +-
 drivers/mtd/mtdpart.c             |    2 +-
 drivers/mtd/mtdswap.c             |    4 ++--
 drivers/mtd/nand/nand_bbt.c       |    2 +-
 drivers/mtd/nand/sm_common.c      |    2 +-
 drivers/mtd/nftlcore.c            |    4 ++--
 drivers/mtd/sm_ftl.c              |    2 +-
 drivers/mtd/tests/mtd_oobtest.c   |   10 +++++-----
 drivers/staging/spectra/lld_mtd.c |    6 +++---
 fs/jffs2/wbuf.c                   |    2 +-
 include/linux/mtd/mtd.h           |   12 ++++++++----
 13 files changed, 31 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/inftlcore.c b/drivers/mtd/inftlcore.c
index 07646e1..28646c9 100644
--- a/drivers/mtd/inftlcore.c
+++ b/drivers/mtd/inftlcore.c
@@ -178,7 +178,7 @@ int inftl_write_oob(struct mtd_info *mtd, loff_t offs, size_t len,
 	ops.oobbuf = buf;
 	ops.datbuf = NULL;
 
-	res = mtd->write_oob(mtd, offs & ~(mtd->writesize - 1), &ops);
+	res = mtd_write_oob(mtd, offs & ~(mtd->writesize - 1), &ops);
 	*retlen = ops.oobretlen;
 	return res;
 }
@@ -199,7 +199,7 @@ static int inftl_write(struct mtd_info *mtd, loff_t offs, size_t len,
 	ops.datbuf = buf;
 	ops.len = len;
 
-	res = mtd->write_oob(mtd, offs & ~(mtd->writesize - 1), &ops);
+	res = mtd_write_oob(mtd, offs & ~(mtd->writesize - 1), &ops);
 	*retlen = ops.retlen;
 	return res;
 }
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index daccfb1..39d4424 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -325,7 +325,7 @@ static ssize_t mtdchar_write(struct file *file, const char __user *buf, size_t c
 			ops.ooboffs = 0;
 			ops.len = len;
 
-			ret = mtd->write_oob(mtd, *ppos, &ops);
+			ret = mtd_write_oob(mtd, *ppos, &ops);
 			retlen = ops.retlen;
 			break;
 		}
@@ -426,7 +426,7 @@ static int mtdchar_writeoob(struct file *file, struct mtd_info *mtd,
 		return PTR_ERR(ops.oobbuf);
 
 	start &= ~((uint64_t)mtd->writesize - 1);
-	ret = mtd->write_oob(mtd, start, &ops);
+	ret = mtd_write_oob(mtd, start, &ops);
 
 	if (ops.oobretlen > 0xFFFFFFFFU)
 		ret = -EOVERFLOW;
@@ -609,7 +609,7 @@ static int mtdchar_write_ioctl(struct mtd_info *mtd,
 		ops.oobbuf = NULL;
 	}
 
-	ret = mtd->write_oob(mtd, (loff_t)req.start, &ops);
+	ret = mtd_write_oob(mtd, (loff_t)req.start, &ops);
 
 	kfree(ops.datbuf);
 	kfree(ops.oobbuf);
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index cf35642..3d9c1ff 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -333,7 +333,7 @@ concat_write_oob(struct mtd_info *mtd, loff_t to, struct mtd_oob_ops *ops)
 		if (to + devops.len > subdev->size)
 			devops.len = subdev->size - to;
 
-		err = subdev->write_oob(subdev, to, &devops);
+		err = mtd_write_oob(subdev, to, &devops);
 		ops->retlen += devops.oobretlen;
 		if (err)
 			return err;
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 6fdc74e..8a46cd2 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -217,7 +217,7 @@ static int part_write_oob(struct mtd_info *mtd, loff_t to,
 		return -EINVAL;
 	if (ops->datbuf && to + ops->len > mtd->size)
 		return -EINVAL;
-	return part->master->write_oob(part->master, to + part->offset, ops);
+	return mtd_write_oob(part->master, to + part->offset, ops);
 }
 
 static int part_write_user_prot_reg(struct mtd_info *mtd, loff_t from,
diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index 0f0ab18..8579739 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -403,7 +403,7 @@ static int mtdswap_write_marker(struct mtdswap_dev *d, struct swap_eb *eb,
 		offset = mtdswap_eb_offset(d, eb) + d->mtd->writesize;
 	}
 
-	ret = d->mtd->write_oob(d->mtd, offset , &ops);
+	ret = mtd_write_oob(d->mtd, offset, &ops);
 
 	if (ret) {
 		dev_warn(d->dev, "Write OOB failed for block at %08llx "
@@ -946,7 +946,7 @@ static unsigned int mtdswap_eblk_passes(struct mtdswap_dev *d,
 			patt = mtdswap_test_patt(test + i);
 			memset(d->page_buf, patt, mtd->writesize);
 			memset(d->oob_buf, patt, mtd->ecclayout->oobavail);
-			ret = mtd->write_oob(mtd, pos, &ops);
+			ret = mtd_write_oob(mtd, pos, &ops);
 			if (ret)
 				goto error;
 
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index fcab50e..20a112f 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -350,7 +350,7 @@ static int scan_write_bbt(struct mtd_info *mtd, loff_t offs, size_t len,
 	ops.oobbuf = oob;
 	ops.len = len;
 
-	return mtd->write_oob(mtd, offs, &ops);
+	return mtd_write_oob(mtd, offs, &ops);
 }
 
 static u32 bbt_get_ver_offs(struct mtd_info *mtd, struct nand_bbt_descr *td)
diff --git a/drivers/mtd/nand/sm_common.c b/drivers/mtd/nand/sm_common.c
index 32ae5af..774c3c2 100644
--- a/drivers/mtd/nand/sm_common.c
+++ b/drivers/mtd/nand/sm_common.c
@@ -55,7 +55,7 @@ static int sm_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	ops.datbuf = NULL;
 
 
-	ret = mtd->write_oob(mtd, ofs, &ops);
+	ret = mtd_write_oob(mtd, ofs, &ops);
 	if (ret < 0 || ops.oobretlen != SM_OOB_SIZE) {
 		printk(KERN_NOTICE
 			"sm_common: can't mark sector at %i as bad\n",
diff --git a/drivers/mtd/nftlcore.c b/drivers/mtd/nftlcore.c
index 7497f5e..8847e60 100644
--- a/drivers/mtd/nftlcore.c
+++ b/drivers/mtd/nftlcore.c
@@ -174,7 +174,7 @@ int nftl_write_oob(struct mtd_info *mtd, loff_t offs, size_t len,
 	ops.oobbuf = buf;
 	ops.datbuf = NULL;
 
-	res = mtd->write_oob(mtd, offs & ~mask, &ops);
+	res = mtd_write_oob(mtd, offs & ~mask, &ops);
 	*retlen = ops.oobretlen;
 	return res;
 }
@@ -198,7 +198,7 @@ static int nftl_write(struct mtd_info *mtd, loff_t offs, size_t len,
 	ops.datbuf = buf;
 	ops.len = len;
 
-	res = mtd->write_oob(mtd, offs & ~mask, &ops);
+	res = mtd_write_oob(mtd, offs & ~mask, &ops);
 	*retlen = ops.retlen;
 	return res;
 }
diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index 748aa44..4ec2af7 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -343,7 +343,7 @@ static int sm_write_sector(struct sm_ftl *ftl,
 	ops.ooblen = SM_OOB_SIZE;
 	ops.oobbuf = (void *)oob;
 
-	ret = mtd->write_oob(mtd, sm_mkoffset(ftl, zone, block, boffset), &ops);
+	ret = mtd_write_oob(mtd, sm_mkoffset(ftl, zone, block, boffset), &ops);
 
 	/* Now we assume that hardware will catch write bitflip errors */
 	/* If you are paranoid, use CONFIG_MTD_NAND_VERIFY_WRITE */
diff --git a/drivers/mtd/tests/mtd_oobtest.c b/drivers/mtd/tests/mtd_oobtest.c
index 962d27a..8111388 100644
--- a/drivers/mtd/tests/mtd_oobtest.c
+++ b/drivers/mtd/tests/mtd_oobtest.c
@@ -139,7 +139,7 @@ static int write_eraseblock(int ebnum)
 		ops.ooboffs   = use_offset;
 		ops.datbuf    = NULL;
 		ops.oobbuf    = writebuf;
-		err = mtd->write_oob(mtd, addr, &ops);
+		err = mtd_write_oob(mtd, addr, &ops);
 		if (err || ops.oobretlen != use_len) {
 			printk(PRINT_PREF "error: writeoob failed at %#llx\n",
 			       (long long)addr);
@@ -524,7 +524,7 @@ static int __init mtd_oobtest_init(void)
 	ops.oobbuf    = writebuf;
 	printk(PRINT_PREF "attempting to start write past end of OOB\n");
 	printk(PRINT_PREF "an error is expected...\n");
-	err = mtd->write_oob(mtd, addr0, &ops);
+	err = mtd_write_oob(mtd, addr0, &ops);
 	if (err) {
 		printk(PRINT_PREF "error occurred as expected\n");
 		err = 0;
@@ -568,7 +568,7 @@ static int __init mtd_oobtest_init(void)
 		ops.oobbuf    = writebuf;
 		printk(PRINT_PREF "attempting to write past end of device\n");
 		printk(PRINT_PREF "an error is expected...\n");
-		err = mtd->write_oob(mtd, mtd->size - mtd->writesize, &ops);
+		err = mtd_write_oob(mtd, mtd->size - mtd->writesize, &ops);
 		if (err) {
 			printk(PRINT_PREF "error occurred as expected\n");
 			err = 0;
@@ -612,7 +612,7 @@ static int __init mtd_oobtest_init(void)
 		ops.oobbuf    = writebuf;
 		printk(PRINT_PREF "attempting to write past end of device\n");
 		printk(PRINT_PREF "an error is expected...\n");
-		err = mtd->write_oob(mtd, mtd->size - mtd->writesize, &ops);
+		err = mtd_write_oob(mtd, mtd->size - mtd->writesize, &ops);
 		if (err) {
 			printk(PRINT_PREF "error occurred as expected\n");
 			err = 0;
@@ -670,7 +670,7 @@ static int __init mtd_oobtest_init(void)
 			ops.ooboffs   = 0;
 			ops.datbuf    = NULL;
 			ops.oobbuf    = writebuf;
-			err = mtd->write_oob(mtd, addr, &ops);
+			err = mtd_write_oob(mtd, addr, &ops);
 			if (err)
 				goto out;
 			if (i % 256 == 0)
diff --git a/drivers/staging/spectra/lld_mtd.c b/drivers/staging/spectra/lld_mtd.c
index ed8e5f0..4aa48dd 100644
--- a/drivers/staging/spectra/lld_mtd.c
+++ b/drivers/staging/spectra/lld_mtd.c
@@ -411,9 +411,9 @@ u16 mtd_Write_Page_Main_Spare(u8 *write_data, u32 Block,
 		ops.ooblen = BTSIG_BYTES;
 		ops.ooboffs = 0;
 
-		ret = spectra_mtd->write_oob(spectra_mtd,
-					     (Block * spectra_mtd->erasesize) + (Page * spectra_mtd->writesize),
-					     &ops);
+		ret = mtd_write_oob(spectra_mtd,
+				    (Block * spectra_mtd->erasesize) + (Page * spectra_mtd->writesize),
+				    &ops);
 		if (ret) {
 			printk(KERN_ERR "%s failed %d\n", __func__, ret);
 			return FAIL;
diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index efc0cb3..eae5be4 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -1101,7 +1101,7 @@ int jffs2_write_nand_cleanmarker(struct jffs2_sb_info *c,
 	ops.len = ops.ooboffs = ops.retlen = ops.oobretlen = 0;
 	ops.datbuf = NULL;
 
-	ret = c->mtd->write_oob(c->mtd, jeb->offset, &ops);
+	ret = mtd_write_oob(c->mtd, jeb->offset, &ops);
 	if (ret || ops.oobretlen != ops.ooblen) {
 		printk(KERN_ERR "cannot write OOB for EB at %08x, requested %zd"
 				" bytes, read %zd bytes, error %d\n",
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 0db8d87..abbc96a 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -190,16 +190,14 @@ struct mtd_info {
 			    size_t *retlen, const u_char *buf);
 	int (*read_oob) (struct mtd_info *mtd, loff_t from,
 			 struct mtd_oob_ops *ops);
+	int (*write_oob) (struct mtd_info *mtd, loff_t to,
+			  struct mtd_oob_ops *ops);
 
 	/* Backing device capabilities for this device
 	 * - provides mmap capabilities
 	 */
 	struct backing_dev_info *backing_dev_info;
 
-
-	int (*write_oob) (struct mtd_info *mtd, loff_t to,
-			 struct mtd_oob_ops *ops);
-
 	/*
 	 * Methods to access the protection register area, present in some
 	 * flash devices. The user data is one time programmable but the
@@ -326,6 +324,12 @@ static inline int mtd_read_oob(struct mtd_info *mtd, loff_t from,
 	return mtd->read_oob(mtd, from, ops);
 }
 
+static inline int mtd_write_oob(struct mtd_info *mtd, loff_t to,
+				struct mtd_oob_ops *ops)
+{
+	return mtd->write_oob(mtd, to, ops);
+}
+
 static inline struct mtd_info *dev_to_mtd(struct device *dev)
 {
 	return dev ? dev_get_drvdata(dev) : NULL;
-- 
1.7.7.3
