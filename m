Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Re9aC-0005S9-L6
 for linux-mtd@lists.infradead.org; Fri, 23 Dec 2011 18:11:09 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 25/28] mtd: introduce mtd_resume interface
Date: Fri, 23 Dec 2011 20:11:17 +0200
Message-Id: <1324663880-22477-26-git-send-email-dedekind1@gmail.com>
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
 arch/cris/arch-v32/drivers/axisflashmap.c |    3 +--
 drivers/mtd/inftlmount.c                  |    3 ++-
 drivers/mtd/mtdchar.c                     |    2 +-
 drivers/mtd/mtdconcat.c                   |    2 +-
 drivers/mtd/mtdoops.c                     |    4 ++--
 drivers/mtd/mtdpart.c                     |    5 ++---
 drivers/mtd/mtdswap.c                     |    4 ++--
 drivers/mtd/nftlmount.c                   |    3 ++-
 drivers/mtd/redboot.c                     |    4 ++--
 drivers/mtd/ssfdc.c                       |    4 ++--
 drivers/mtd/tests/mtd_oobtest.c           |    2 +-
 drivers/mtd/tests/mtd_pagetest.c          |    2 +-
 drivers/mtd/tests/mtd_readtest.c          |    2 +-
 drivers/mtd/tests/mtd_speedtest.c         |    2 +-
 drivers/mtd/tests/mtd_stresstest.c        |    2 +-
 drivers/mtd/tests/mtd_subpagetest.c       |    2 +-
 drivers/mtd/tests/mtd_torturetest.c       |    3 +--
 drivers/mtd/ubi/io.c                      |    2 +-
 fs/jffs2/scan.c                           |    2 +-
 fs/logfs/dev_mtd.c                        |    4 ++--
 include/linux/mtd/mtd.h                   |    7 ++++++-
 21 files changed, 34 insertions(+), 30 deletions(-)

diff --git a/arch/cris/arch-v32/drivers/axisflashmap.c b/arch/cris/arch-v32/drivers/axisflashmap.c
index 011bddb..b34438e 100644
--- a/arch/cris/arch-v32/drivers/axisflashmap.c
+++ b/arch/cris/arch-v32/drivers/axisflashmap.c
@@ -404,8 +404,7 @@ static int __init init_axis_flash(void)
 		 */
 		int blockstat;
 		do {
-			blockstat = main_mtd->block_isbad(main_mtd,
-				ptable_sector);
+			blockstat = mtd_block_isbad(main_mtd, ptable_sector);
 			if (blockstat < 0)
 				ptable_sector = 0; /* read error */
 			else if (blockstat)
diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index 9bfbca5..3851940 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -306,7 +306,8 @@ static int find_boot_record(struct INFTLrecord *inftl)
 			/* If any of the physical eraseblocks are bad, don't
 			   use the unit. */
 			for (physblock = 0; physblock < inftl->EraseSize; physblock += inftl->mbd.mtd->erasesize) {
-				if (inftl->mbd.mtd->block_isbad(inftl->mbd.mtd, i * inftl->EraseSize + physblock))
+				if (mtd_block_isbad(inftl->mbd.mtd,
+						    i * inftl->EraseSize + physblock))
 					inftl->PUtable[i] = BLOCK_RESERVED;
 			}
 		}
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 46b6a8b..8132fe9 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -886,7 +886,7 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 		if (!mtd->block_isbad)
 			ret = -EOPNOTSUPP;
 		else
-			return mtd->block_isbad(mtd, offs);
+			return mtd_block_isbad(mtd, offs);
 		break;
 	}
 
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 4b7f825..d0db5e6 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -667,7 +667,7 @@ static int concat_block_isbad(struct mtd_info *mtd, loff_t ofs)
 			continue;
 		}
 
-		res = subdev->block_isbad(subdev, ofs);
+		res = mtd_block_isbad(subdev, ofs);
 		break;
 	}
 
diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 7be2018..bc43d2f 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -170,7 +170,7 @@ static void mtdoops_workfunc_erase(struct work_struct *work)
 	}
 
 	while (mtd->block_isbad) {
-		ret = mtd->block_isbad(mtd, cxt->nextpage * record_size);
+		ret = mtd_block_isbad(mtd, cxt->nextpage * record_size);
 		if (!ret)
 			break;
 		if (ret < 0) {
@@ -254,7 +254,7 @@ static void find_next_position(struct mtdoops_context *cxt)
 
 	for (page = 0; page < cxt->oops_pages; page++) {
 		if (mtd->block_isbad &&
-		    mtd->block_isbad(mtd, page * record_size))
+		    mtd_block_isbad(mtd, page * record_size))
 			continue;
 		/* Assume the page is used */
 		mark_page_used(cxt, page);
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 8610750..0e7dfc7 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -322,7 +322,7 @@ static int part_block_isbad(struct mtd_info *mtd, loff_t ofs)
 	if (ofs >= mtd->size)
 		return -EINVAL;
 	ofs += part->offset;
-	return part->master->block_isbad(part->master, ofs);
+	return mtd_block_isbad(part->master, ofs);
 }
 
 static int part_block_markbad(struct mtd_info *mtd, loff_t ofs)
@@ -553,8 +553,7 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 		uint64_t offs = 0;
 
 		while (offs < slave->mtd.size) {
-			if (master->block_isbad(master,
-						offs + slave->offset))
+			if (mtd_block_isbad(master, offs + slave->offset))
 				slave->mtd.ecc_stats.badblocks++;
 			offs += slave->mtd.erasesize;
 		}
diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index cb794e7..87aa0a6 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -343,7 +343,7 @@ static int mtdswap_read_markers(struct mtdswap_dev *d, struct swap_eb *eb)
 	offset = mtdswap_eb_offset(d, eb);
 
 	/* Check first if the block is bad. */
-	if (d->mtd->block_isbad && d->mtd->block_isbad(d->mtd, offset))
+	if (d->mtd->block_isbad && mtd_block_isbad(d->mtd, offset))
 		return MTDSWAP_SCANNED_BAD;
 
 	ops.ooblen = 2 * d->mtd->ecclayout->oobavail;
@@ -1061,7 +1061,7 @@ static unsigned int mtdswap_badblocks(struct mtd_info *mtd, uint64_t size)
 
 	if (mtd->block_isbad)
 		for (offset = 0; offset < size; offset += mtd->erasesize)
-			if (mtd->block_isbad(mtd, offset))
+			if (mtd_block_isbad(mtd, offset))
 				badcnt++;
 
 	return badcnt;
diff --git a/drivers/mtd/nftlmount.c b/drivers/mtd/nftlmount.c
index b068dc8..156af9f 100644
--- a/drivers/mtd/nftlmount.c
+++ b/drivers/mtd/nftlmount.c
@@ -242,7 +242,8 @@ The new DiskOnChip driver already scanned the bad block table.  Just query it.
 			if (buf[i & (SECTORSIZE - 1)] != 0xff)
 				nftl->ReplUnitTable[i] = BLOCK_RESERVED;
 #endif
-			if (nftl->mbd.mtd->block_isbad(nftl->mbd.mtd, i * nftl->EraseSize))
+			if (mtd_block_isbad(nftl->mbd.mtd,
+					    i * nftl->EraseSize))
 				nftl->ReplUnitTable[i] = BLOCK_RESERVED;
 		}
 
diff --git a/drivers/mtd/redboot.c b/drivers/mtd/redboot.c
index 623d9b8..09bb81e 100644
--- a/drivers/mtd/redboot.c
+++ b/drivers/mtd/redboot.c
@@ -79,7 +79,7 @@ static int parse_redboot_partitions(struct mtd_info *master,
 	if ( directory < 0 ) {
 		offset = master->size + directory * master->erasesize;
 		while (master->block_isbad && 
-		       master->block_isbad(master, offset)) {
+		       mtd_block_isbad(master, offset)) {
 			if (!offset) {
 			nogood:
 				printk(KERN_NOTICE "Failed to find a non-bad block to check for RedBoot partition table\n");
@@ -90,7 +90,7 @@ static int parse_redboot_partitions(struct mtd_info *master,
 	} else {
 		offset = directory * master->erasesize;
 		while (master->block_isbad && 
-		       master->block_isbad(master, offset)) {
+		       mtd_block_isbad(master, offset)) {
 			offset += master->erasesize;
 			if (offset == master->size)
 				goto nogood;
diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index 0e68813..ab2a52a 100644
--- a/drivers/mtd/ssfdc.c
+++ b/drivers/mtd/ssfdc.c
@@ -122,7 +122,7 @@ static int get_valid_cis_sector(struct mtd_info *mtd)
 	 * is not SSFDC formatted
 	 */
 	for (k = 0, offset = 0; k < 4; k++, offset += mtd->erasesize) {
-		if (!mtd->block_isbad(mtd, offset)) {
+		if (mtd_block_isbad(mtd, offset)) {
 			ret = mtd_read(mtd, offset, SECTOR_SIZE, &retlen,
 				       sect_buf);
 
@@ -255,7 +255,7 @@ static int build_logical_block_map(struct ssfdcr_record *ssfdc)
 	for (phys_block = ssfdc->cis_block + 1; phys_block < ssfdc->map_len;
 			phys_block++) {
 		offset = (unsigned long)phys_block * ssfdc->erase_size;
-		if (mtd->block_isbad(mtd, offset))
+		if (mtd_block_isbad(mtd, offset))
 			continue;	/* skip bad blocks */
 
 		ret = read_raw_oob(mtd, offset, oob_buf);
diff --git a/drivers/mtd/tests/mtd_oobtest.c b/drivers/mtd/tests/mtd_oobtest.c
index 8111388..ed9b628 100644
--- a/drivers/mtd/tests/mtd_oobtest.c
+++ b/drivers/mtd/tests/mtd_oobtest.c
@@ -329,7 +329,7 @@ static int is_block_bad(int ebnum)
 	int ret;
 	loff_t addr = ebnum * mtd->erasesize;
 
-	ret = mtd->block_isbad(mtd, addr);
+	ret = mtd_block_isbad(mtd, addr);
 	if (ret)
 		printk(PRINT_PREF "block %d is bad\n", ebnum);
 	return ret;
diff --git a/drivers/mtd/tests/mtd_pagetest.c b/drivers/mtd/tests/mtd_pagetest.c
index 83da97e..8024eaf 100644
--- a/drivers/mtd/tests/mtd_pagetest.c
+++ b/drivers/mtd/tests/mtd_pagetest.c
@@ -469,7 +469,7 @@ static int is_block_bad(int ebnum)
 	loff_t addr = ebnum * mtd->erasesize;
 	int ret;
 
-	ret = mtd->block_isbad(mtd, addr);
+	ret = mtd_block_isbad(mtd, addr);
 	if (ret)
 		printk(PRINT_PREF "block %d is bad\n", ebnum);
 	return ret;
diff --git a/drivers/mtd/tests/mtd_readtest.c b/drivers/mtd/tests/mtd_readtest.c
index 5eaeada..ad5fd0d 100644
--- a/drivers/mtd/tests/mtd_readtest.c
+++ b/drivers/mtd/tests/mtd_readtest.c
@@ -132,7 +132,7 @@ static int is_block_bad(int ebnum)
 	loff_t addr = ebnum * mtd->erasesize;
 	int ret;
 
-	ret = mtd->block_isbad(mtd, addr);
+	ret = mtd_block_isbad(mtd, addr);
 	if (ret)
 		printk(PRINT_PREF "block %d is bad\n", ebnum);
 	return ret;
diff --git a/drivers/mtd/tests/mtd_speedtest.c b/drivers/mtd/tests/mtd_speedtest.c
index c7b18e1..ecb2878 100644
--- a/drivers/mtd/tests/mtd_speedtest.c
+++ b/drivers/mtd/tests/mtd_speedtest.c
@@ -296,7 +296,7 @@ static int is_block_bad(int ebnum)
 	loff_t addr = ebnum * mtd->erasesize;
 	int ret;
 
-	ret = mtd->block_isbad(mtd, addr);
+	ret = mtd_block_isbad(mtd, addr);
 	if (ret)
 		printk(PRINT_PREF "block %d is bad\n", ebnum);
 	return ret;
diff --git a/drivers/mtd/tests/mtd_stresstest.c b/drivers/mtd/tests/mtd_stresstest.c
index f8aac4b..4789c0e 100644
--- a/drivers/mtd/tests/mtd_stresstest.c
+++ b/drivers/mtd/tests/mtd_stresstest.c
@@ -132,7 +132,7 @@ static int is_block_bad(int ebnum)
 	loff_t addr = ebnum * mtd->erasesize;
 	int ret;
 
-	ret = mtd->block_isbad(mtd, addr);
+	ret = mtd_block_isbad(mtd, addr);
 	if (ret)
 		printk(PRINT_PREF "block %d is bad\n", ebnum);
 	return ret;
diff --git a/drivers/mtd/tests/mtd_subpagetest.c b/drivers/mtd/tests/mtd_subpagetest.c
index b90c010..4b873d4 100644
--- a/drivers/mtd/tests/mtd_subpagetest.c
+++ b/drivers/mtd/tests/mtd_subpagetest.c
@@ -344,7 +344,7 @@ static int is_block_bad(int ebnum)
 	loff_t addr = ebnum * mtd->erasesize;
 	int ret;
 
-	ret = mtd->block_isbad(mtd, addr);
+	ret = mtd_block_isbad(mtd, addr);
 	if (ret)
 		printk(PRINT_PREF "block %d is bad\n", ebnum);
 	return ret;
diff --git a/drivers/mtd/tests/mtd_torturetest.c b/drivers/mtd/tests/mtd_torturetest.c
index dd34a51..30c4ed9 100644
--- a/drivers/mtd/tests/mtd_torturetest.c
+++ b/drivers/mtd/tests/mtd_torturetest.c
@@ -292,8 +292,7 @@ static int __init tort_init(void)
 	memset(&bad_ebs[0], 0, sizeof(int) * ebcnt);
 	if (mtd->block_isbad) {
 		for (i = eb; i < eb + ebcnt; i++) {
-			err = mtd->block_isbad(mtd,
-					       (loff_t)i * mtd->erasesize);
+			err = mtd_block_isbad(mtd, (loff_t)i * mtd->erasesize);
 
 			if (err < 0) {
 				printk(PRINT_PREF "block_isbad() returned %d "
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 8d832fc..a1b683a 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -634,7 +634,7 @@ int ubi_io_is_bad(const struct ubi_device *ubi, int pnum)
 	if (ubi->bad_allowed) {
 		int ret;
 
-		ret = mtd->block_isbad(mtd, (loff_t)pnum * ubi->peb_size);
+		ret = mtd_block_isbad(mtd, (loff_t)pnum * ubi->peb_size);
 		if (ret < 0)
 			ubi_err("error %d while checking if PEB %d is bad",
 				ret, pnum);
diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index 72f3960..83e1665 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -455,7 +455,7 @@ static int jffs2_scan_eraseblock (struct jffs2_sb_info *c, struct jffs2_eraseblo
 	if (jffs2_cleanmarker_oob(c)) {
 		int ret;
 
-		if (c->mtd->block_isbad(c->mtd, jeb->offset))
+		if (mtd_block_isbad(c->mtd, jeb->offset))
 			return BLK_STATE_BADBLOCK;
 
 		ret = jffs2_check_nand_cleanmarker(c, jeb);
diff --git a/fs/logfs/dev_mtd.c b/fs/logfs/dev_mtd.c
index 0ca7a07..136c736 100644
--- a/fs/logfs/dev_mtd.c
+++ b/fs/logfs/dev_mtd.c
@@ -157,7 +157,7 @@ static struct page *logfs_mtd_find_first_sb(struct super_block *sb, u64 *ofs)
 		return NULL;
 
 	*ofs = 0;
-	while (mtd->block_isbad(mtd, *ofs)) {
+	while (mtd_block_isbad(mtd, *ofs)) {
 		*ofs += mtd->erasesize;
 		if (*ofs >= mtd->size)
 			return NULL;
@@ -177,7 +177,7 @@ static struct page *logfs_mtd_find_last_sb(struct super_block *sb, u64 *ofs)
 		return NULL;
 
 	*ofs = mtd->size - mtd->erasesize;
-	while (mtd->block_isbad(mtd, *ofs)) {
+	while (mtd_block_isbad(mtd, *ofs)) {
 		*ofs -= mtd->erasesize;
 		if (*ofs <= 0)
 			return NULL;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index d6b4aa1..a307ad0 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -210,6 +210,7 @@ struct mtd_info {
 	int (*lock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
 	int (*unlock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
 	int (*is_locked) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
+	int (*block_isbad) (struct mtd_info *mtd, loff_t ofs);
 	int (*suspend) (struct mtd_info *mtd);
 	void (*resume) (struct mtd_info *mtd);
 
@@ -219,7 +220,6 @@ struct mtd_info {
 	struct backing_dev_info *backing_dev_info;
 
 	/* Bad block management functions */
-	int (*block_isbad) (struct mtd_info *mtd, loff_t ofs);
 	int (*block_markbad) (struct mtd_info *mtd, loff_t ofs);
 
 	struct notifier_block reboot_notifier;  /* default mode before reboot */
@@ -406,6 +406,11 @@ static inline void mtd_resume(struct mtd_info *mtd)
 	mtd->resume(mtd);
 }
 
+static inline int mtd_block_isbad(struct mtd_info *mtd, loff_t ofs)
+{
+	return mtd->block_isbad(mtd, ofs);
+}
+
 static inline struct mtd_info *dev_to_mtd(struct device *dev)
 {
 	return dev ? dev_get_drvdata(dev) : NULL;
-- 
1.7.7.3
