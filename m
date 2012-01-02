Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rhgqx-0003TG-Ev
 for linux-mtd@lists.infradead.org; Mon, 02 Jan 2012 12:19:01 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 15/17] mtd: introduce mtd_can_have_bb helper
Date: Mon,  2 Jan 2012 14:20:45 +0200
Message-Id: <1325506847-23470-16-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1325506847-23470-1-git-send-email-dedekind1@gmail.com>
References: <1325506847-23470-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

This patch introduces new 'mtd_can_have_bb()' helper function which checks
whether the flash can have bad eraseblocks. Then it changes all the
direct 'mtd->block_isbad' use cases with 'mtd_can_have_bb()'.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdchar.c               |    5 +----
 drivers/mtd/mtdconcat.c             |    2 +-
 drivers/mtd/mtdoops.c               |    4 ++--
 drivers/mtd/mtdswap.c               |    4 ++--
 drivers/mtd/nftlcore.c              |    2 +-
 drivers/mtd/redboot.c               |    4 ++--
 drivers/mtd/tests/mtd_readtest.c    |    3 +--
 drivers/mtd/tests/mtd_speedtest.c   |    3 +--
 drivers/mtd/tests/mtd_stresstest.c  |    3 +--
 drivers/mtd/tests/mtd_torturetest.c |    2 +-
 drivers/mtd/ubi/build.c             |    2 +-
 include/linux/mtd/mtd.h             |    7 +++++++
 12 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 92da621..64efcbf 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -867,10 +867,7 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 
 		if (copy_from_user(&offs, argp, sizeof(loff_t)))
 			return -EFAULT;
-		if (!mtd->block_isbad)
-			ret = -EOPNOTSUPP;
-		else
-			return mtd_block_isbad(mtd, offs);
+		return mtd_block_isbad(mtd, offs);
 		break;
 	}
 
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index aaafb5e..fbf3cb1 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -647,7 +647,7 @@ static int concat_block_isbad(struct mtd_info *mtd, loff_t ofs)
 	struct mtd_concat *concat = CONCAT(mtd);
 	int i, res = 0;
 
-	if (!concat->subdev[0]->block_isbad)
+	if (!mtd_can_have_bb(concat->subdev[0]))
 		return res;
 
 	if (ofs > mtd->size)
diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index c8540b8..a4c8f67 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -169,7 +169,7 @@ static void mtdoops_workfunc_erase(struct work_struct *work)
 			cxt->nextpage = 0;
 	}
 
-	while (mtd->block_isbad) {
+	while (mtd_can_have_bb(mtd)) {
 		ret = mtd_block_isbad(mtd, cxt->nextpage * record_size);
 		if (!ret)
 			break;
@@ -257,7 +257,7 @@ static void find_next_position(struct mtdoops_context *cxt)
 	size_t retlen;
 
 	for (page = 0; page < cxt->oops_pages; page++) {
-		if (mtd->block_isbad &&
+		if (mtd_can_have_bb(mtd) &&
 		    mtd_block_isbad(mtd, page * record_size))
 			continue;
 		/* Assume the page is used */
diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index fe4426c..3fc8cb2 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -343,7 +343,7 @@ static int mtdswap_read_markers(struct mtdswap_dev *d, struct swap_eb *eb)
 	offset = mtdswap_eb_offset(d, eb);
 
 	/* Check first if the block is bad. */
-	if (d->mtd->block_isbad && mtd_block_isbad(d->mtd, offset))
+	if (mtd_can_have_bb(d->mtd) && mtd_block_isbad(d->mtd, offset))
 		return MTDSWAP_SCANNED_BAD;
 
 	ops.ooblen = 2 * d->mtd->ecclayout->oobavail;
@@ -1058,7 +1058,7 @@ static unsigned int mtdswap_badblocks(struct mtd_info *mtd, uint64_t size)
 
 	badcnt = 0;
 
-	if (mtd->block_isbad)
+	if (mtd_can_have_bb(mtd))
 		for (offset = 0; offset < size; offset += mtd->erasesize)
 			if (mtd_block_isbad(mtd, offset))
 				badcnt++;
diff --git a/drivers/mtd/nftlcore.c b/drivers/mtd/nftlcore.c
index 8847e60..a75382a 100644
--- a/drivers/mtd/nftlcore.c
+++ b/drivers/mtd/nftlcore.c
@@ -56,7 +56,7 @@ static void nftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	if (memcmp(mtd->name, "DiskOnChip", 10))
 		return;
 
-	if (!mtd->block_isbad) {
+	if (!mtd_can_have_bb(mtd)) {
 		printk(KERN_ERR
 "NFTL no longer supports the old DiskOnChip drivers loaded via docprobe.\n"
 "Please use the new diskonchip driver under the NAND subsystem.\n");
diff --git a/drivers/mtd/redboot.c b/drivers/mtd/redboot.c
index 09bb81e..48970c1 100644
--- a/drivers/mtd/redboot.c
+++ b/drivers/mtd/redboot.c
@@ -78,7 +78,7 @@ static int parse_redboot_partitions(struct mtd_info *master,
 
 	if ( directory < 0 ) {
 		offset = master->size + directory * master->erasesize;
-		while (master->block_isbad && 
+		while (mtd_can_have_bb(master) &&
 		       mtd_block_isbad(master, offset)) {
 			if (!offset) {
 			nogood:
@@ -89,7 +89,7 @@ static int parse_redboot_partitions(struct mtd_info *master,
 		}
 	} else {
 		offset = directory * master->erasesize;
-		while (master->block_isbad && 
+		while (mtd_can_have_bb(master) &&
 		       mtd_block_isbad(master, offset)) {
 			offset += master->erasesize;
 			if (offset == master->size)
diff --git a/drivers/mtd/tests/mtd_readtest.c b/drivers/mtd/tests/mtd_readtest.c
index 4228eb4..121aba1 100644
--- a/drivers/mtd/tests/mtd_readtest.c
+++ b/drivers/mtd/tests/mtd_readtest.c
@@ -148,8 +148,7 @@ static int scan_for_bad_eraseblocks(void)
 		return -ENOMEM;
 	}
 
-	/* NOR flash does not implement block_isbad */
-	if (mtd->block_isbad == NULL)
+	if (!mtd_can_have_bb(mtd))
 		return 0;
 
 	printk(PRINT_PREF "scanning for bad eraseblocks\n");
diff --git a/drivers/mtd/tests/mtd_speedtest.c b/drivers/mtd/tests/mtd_speedtest.c
index 4d2ed5c..2aec4f3 100644
--- a/drivers/mtd/tests/mtd_speedtest.c
+++ b/drivers/mtd/tests/mtd_speedtest.c
@@ -336,8 +336,7 @@ static int scan_for_bad_eraseblocks(void)
 		return -ENOMEM;
 	}
 
-	/* NOR flash does not implement block_isbad */
-	if (mtd->block_isbad == NULL)
+	if (!mtd_can_have_bb(mtd))
 		goto out;
 
 	printk(PRINT_PREF "scanning for bad eraseblocks\n");
diff --git a/drivers/mtd/tests/mtd_stresstest.c b/drivers/mtd/tests/mtd_stresstest.c
index 399aa2b..7b33f22 100644
--- a/drivers/mtd/tests/mtd_stresstest.c
+++ b/drivers/mtd/tests/mtd_stresstest.c
@@ -227,8 +227,7 @@ static int scan_for_bad_eraseblocks(void)
 		return -ENOMEM;
 	}
 
-	/* NOR flash does not implement block_isbad */
-	if (mtd->block_isbad == NULL)
+	if (!mtd_can_have_bb(mtd))
 		return 0;
 
 	printk(PRINT_PREF "scanning for bad eraseblocks\n");
diff --git a/drivers/mtd/tests/mtd_torturetest.c b/drivers/mtd/tests/mtd_torturetest.c
index 557105f..b65861b 100644
--- a/drivers/mtd/tests/mtd_torturetest.c
+++ b/drivers/mtd/tests/mtd_torturetest.c
@@ -290,7 +290,7 @@ static int __init tort_init(void)
 	 * Check if there is a bad eraseblock among those we are going to test.
 	 */
 	memset(&bad_ebs[0], 0, sizeof(int) * ebcnt);
-	if (mtd->block_isbad) {
+	if (mtd_can_have_bb(mtd)) {
 		for (i = eb; i < eb + ebcnt; i++) {
 			err = mtd_block_isbad(mtd, (loff_t)i * mtd->erasesize);
 
diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 6c3fb5a..115749f 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -664,7 +664,7 @@ static int io_init(struct ubi_device *ubi)
 	ubi->peb_count  = mtd_div_by_eb(ubi->mtd->size, ubi->mtd);
 	ubi->flash_size = ubi->mtd->size;
 
-	if (ubi->mtd->block_isbad && ubi->mtd->block_markbad)
+	if (mtd_can_have_bb(ubi->mtd))
 		ubi->bad_allowed = 1;
 
 	if (ubi->mtd->type == MTD_NORFLASH) {
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 0893707..7e35755 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -440,6 +440,8 @@ static inline void mtd_resume(struct mtd_info *mtd)
 
 static inline int mtd_block_isbad(struct mtd_info *mtd, loff_t ofs)
 {
+	if (!mtd->block_isbad)
+		return -EOPNOTSUPP;
 	return mtd->block_isbad(mtd, ofs);
 }
 
@@ -483,6 +485,11 @@ static inline int mtd_has_oob(const struct mtd_info *mtd)
 	return mtd->read_oob && mtd->write_oob;
 }
 
+static inline int mtd_can_have_bb(const struct mtd_info *mtd)
+{
+	return !!mtd->block_isbad;
+}
+
 	/* Kernel-side ioctl definitions */
 
 struct mtd_partition;
-- 
1.7.7.3
