Received: from smtp.newsguy.com ([74.209.136.69])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RVC5x-0002NW-4M
 for linux-mtd@lists.infradead.org; Tue, 29 Nov 2011 01:02:51 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/5] backport mtd api change to mtd infrastructure
Date: Mon, 28 Nov 2011 17:02:16 -0800
Message-Id: <1322528536-19700-1-git-send-email-mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Mike Dunn <mikedunn@newsguy.com>,
 Scott Branden <sbranden@broadcom.com>, Wan ZongShun <mcuos.com@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Sukumar Ghorai <s-ghorai@ti.com>,
 Manuel Lauss <manuel.lauss@googlemail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Vimal Singh <vimal.newwork@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 Jiandong Zheng <jdzheng@broadcom.com>, Andres Salomon <dilinger@queued.net>,
 Olof Johansson <olof@lixom.net>, Jamie Iles <jamie@jamieiles.com>,
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

Backport of the api change to the critical mtd infrastructure code.

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---
 drivers/mtd/mtdblock.c              |   11 +++++++--
 drivers/mtd/mtdblock_ro.c           |    4 ++-
 drivers/mtd/mtdchar.c               |   16 +++++++++----
 drivers/mtd/mtdconcat.c             |   12 +++++++---
 drivers/mtd/mtdoops.c               |    4 ++-
 drivers/mtd/mtdpart.c               |    4 +-
 drivers/mtd/mtdswap.c               |    7 ++++-
 drivers/mtd/tests/mtd_pagetest.c    |   40 ++++++++++++++++++++++------------
 drivers/mtd/tests/mtd_readtest.c    |    4 ++-
 drivers/mtd/tests/mtd_speedtest.c   |   12 +++++++---
 drivers/mtd/tests/mtd_stresstest.c  |    3 +-
 drivers/mtd/tests/mtd_subpagetest.c |   13 +++++++---
 drivers/mtd/tests/mtd_torturetest.c |    3 +-
 13 files changed, 90 insertions(+), 43 deletions(-)

diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index 7c1dc90..ada714d 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -182,10 +182,13 @@ static int do_cached_write (struct mtdblk_dev *mtdblk, unsigned long pos,
 
 			if (mtdblk->cache_state == STATE_EMPTY ||
 			    mtdblk->cache_offset != sect_start) {
+				unsigned int max_bitflips;
+
 				/* fill the cache with the current sector */
 				mtdblk->cache_state = STATE_EMPTY;
 				ret = mtd->read(mtd, sect_start, sect_size,
-						&retlen, mtdblk->cache_data);
+						&retlen, mtdblk->cache_data,
+						&max_bitflips);
 				if (ret)
 					return ret;
 				if (retlen != sect_size)
@@ -217,12 +220,13 @@ static int do_cached_read (struct mtdblk_dev *mtdblk, unsigned long pos,
 	unsigned int sect_size = mtdblk->cache_size;
 	size_t retlen;
 	int ret;
+	unsigned int max_bitflips;
 
 	pr_debug("mtdblock: read on \"%s\" at 0x%lx, size 0x%x\n",
 			mtd->name, pos, len);
 
 	if (!sect_size)
-		return mtd->read(mtd, pos, len, &retlen, buf);
+		return mtd->read(mtd, pos, len, &retlen, buf, &max_bitflips);
 
 	while (len > 0) {
 		unsigned long sect_start = (pos/sect_size)*sect_size;
@@ -241,7 +245,8 @@ static int do_cached_read (struct mtdblk_dev *mtdblk, unsigned long pos,
 		    mtdblk->cache_offset == sect_start) {
 			memcpy (buf, mtdblk->cache_data + offset, size);
 		} else {
-			ret = mtd->read(mtd, pos, size, &retlen, buf);
+			ret = mtd->read(mtd, pos, size, &retlen, buf,
+					&max_bitflips);
 			if (ret)
 				return ret;
 			if (retlen != size)
diff --git a/drivers/mtd/mtdblock_ro.c b/drivers/mtd/mtdblock_ro.c
index 0470a6e..1f55e7d 100644
--- a/drivers/mtd/mtdblock_ro.c
+++ b/drivers/mtd/mtdblock_ro.c
@@ -29,8 +29,10 @@ static int mtdblock_readsect(struct mtd_blktrans_dev *dev,
 			      unsigned long block, char *buf)
 {
 	size_t retlen;
+	unsigned int max_bitflips;
 
-	if (dev->mtd->read(dev->mtd, (block * 512), 512, &retlen, buf))
+	if (dev->mtd->read(dev->mtd, (block * 512), 512, &retlen, buf,
+			   &max_bitflips))
 		return 1;
 	return 0;
 }
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index e7dc732..fce2e0d 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -194,6 +194,7 @@ static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t
 	int len;
 	size_t size = count;
 	char *kbuf;
+	unsigned int max_bitflips;
 
 	pr_debug("MTD_read\n");
 
@@ -231,14 +232,17 @@ static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t
 			break;
 		}
 		default:
-			ret = mtd->read(mtd, *ppos, len, &retlen, kbuf);
+			ret = mtd->read(mtd, *ppos, len, &retlen, kbuf,
+					&max_bitflips);
 		}
 		/* Nand returns -EBADMSG on ECC errors, but it returns
 		 * the data. For our userspace tools it is important
 		 * to dump areas with ECC errors!
 		 * For kernel internal usage it also might return -EUCLEAN
-		 * to signal the caller that a bitflip has occurred and has
-		 * been corrected by the ECC algorithm.
+		 * to signal the caller that one or more bitflips have occurred
+		 * and have been corrected by the ECC algorithm.  The highest
+		 * number of corrected bits in a single page is returned in the
+		 * max_bitflips arg.
 		 * Userspace software which accesses NAND this way
 		 * must be aware of the fact that it deals with NAND
 		 */
@@ -484,8 +488,10 @@ static int mtd_do_readoob(struct file *file, struct mtd_info *mtd,
 	 * data. For our userspace tools it is important to dump areas
 	 * with ECC errors!
 	 * For kernel internal usage it also might return -EUCLEAN
-	 * to signal the caller that a bitflip has occured and has
-	 * been corrected by the ECC algorithm.
+	 * to signal the caller that one or more bitflips have occurred
+	 * and have been corrected by the ECC algorithm.  The highest
+	 * number of corrected bits in a single page is returned in
+	 * ops.max_bitflips.
 	 *
 	 * Note: currently the standard NAND function, nand_read_oob_std,
 	 * does not calculate ECC for the OOB area, so do not rely on
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 6df4d4d..1754447 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -66,17 +66,18 @@ struct mtd_concat {
 
 static int
 concat_read(struct mtd_info *mtd, loff_t from, size_t len,
-	    size_t * retlen, u_char * buf)
+	    size_t *retlen, u_char *buf, unsigned int *max_bitflips)
 {
 	struct mtd_concat *concat = CONCAT(mtd);
 	int ret = 0, err;
 	int i;
 
-	*retlen = 0;
+	*retlen = *max_bitflips = 0;
 
 	for (i = 0; i < concat->num_subdev; i++) {
 		struct mtd_info *subdev = concat->subdev[i];
 		size_t size, retsize;
+		unsigned int dev_max_bitflips;
 
 		if (from >= subdev->size) {
 			/* Not destined for this subdev */
@@ -91,7 +92,9 @@ concat_read(struct mtd_info *mtd, loff_t from, size_t len,
 			/* Entire transaction goes into this subdev */
 			size = len;
 
-		err = subdev->read(subdev, from, size, &retsize, buf);
+		err = subdev->read(subdev, from, size, &retsize, buf,
+				   &dev_max_bitflips);
+		*max_bitflips = max(*max_bitflips, dev_max_bitflips);
 
 		/* Save information about bitflips! */
 		if (unlikely(err)) {
@@ -259,7 +262,7 @@ concat_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
 	struct mtd_oob_ops devops = *ops;
 	int i, err, ret = 0;
 
-	ops->retlen = ops->oobretlen = 0;
+	ops->retlen = ops->oobretlen = ops->max_bitflips = 0;
 
 	for (i = 0; i < concat->num_subdev; i++) {
 		struct mtd_info *subdev = concat->subdev[i];
@@ -276,6 +279,7 @@ concat_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
 		err = subdev->read_oob(subdev, from, &devops);
 		ops->retlen += devops.retlen;
 		ops->oobretlen += devops.oobretlen;
+		ops->max_bitflips = max(ops->max_bitflips, devops.max_bitflips);
 
 		/* Save information about bitflips! */
 		if (unlikely(err)) {
diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 1e2fa62..8e6a72e 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -253,10 +253,12 @@ static void find_next_position(struct mtdoops_context *cxt)
 	size_t retlen;
 
 	for (page = 0; page < cxt->oops_pages; page++) {
+		unsigned int max_bitflips;
+
 		/* Assume the page is used */
 		mark_page_used(cxt, page);
 		ret = mtd->read(mtd, page * record_size, MTDOOPS_HEADER_SIZE,
-				&retlen, (u_char *) &count[0]);
+				&retlen, (u_char *) &count[0], &max_bitflips);
 		if (retlen != MTDOOPS_HEADER_SIZE ||
 				(ret < 0 && !mtd_is_bitflip(ret))) {
 			printk(KERN_ERR "mtdoops: read failure at %ld (%td of %d read), err %d\n",
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index a0bd2de..68eac92 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -58,7 +58,7 @@ struct mtd_part {
  */
 
 static int part_read(struct mtd_info *mtd, loff_t from, size_t len,
-		size_t *retlen, u_char *buf)
+		     size_t *retlen, u_char *buf, unsigned int *max_bitflips)
 {
 	struct mtd_part *part = PART(mtd);
 	struct mtd_ecc_stats stats;
@@ -71,7 +71,7 @@ static int part_read(struct mtd_info *mtd, loff_t from, size_t len,
 	else if (from + len > mtd->size)
 		len = mtd->size - from;
 	res = part->master->read(part->master, from + part->offset,
-				   len, retlen, buf);
+				 len, retlen, buf, max_bitflips);
 	if (unlikely(res)) {
 		if (mtd_is_bitflip(res))
 			mtd->ecc_stats.corrected += part->master->ecc_stats.corrected - stats.corrected;
diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index bd9590c..d489161 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -730,13 +730,15 @@ static int mtdswap_move_block(struct mtdswap_dev *d, unsigned int oldblock,
 	size_t retlen;
 	unsigned int page, retries;
 	loff_t readpos;
+	unsigned int max_bitflips;
 
 	page = d->revmap[oldblock];
 	readpos = (loff_t) oldblock << PAGE_SHIFT;
 	retries = 0;
 
 retry:
-	ret = mtd->read(mtd, readpos, PAGE_SIZE, &retlen, d->page_buf);
+	ret = mtd->read(mtd, readpos, PAGE_SIZE, &retlen, d->page_buf,
+			&max_bitflips);
 
 	if (ret < 0 && !mtd_is_bitflip(ret)) {
 		oldeb = d->eb_data + oldblock / d->pages_per_eblk;
@@ -1135,6 +1137,7 @@ static int mtdswap_readsect(struct mtd_blktrans_dev *dev,
 	struct swap_eb *eb;
 	size_t retlen;
 	int ret;
+	unsigned int max_bitflips;
 
 	d->sect_read_count++;
 
@@ -1161,7 +1164,7 @@ static int mtdswap_readsect(struct mtd_blktrans_dev *dev,
 	retries = 0;
 
 retry:
-	ret = mtd->read(mtd, readpos, PAGE_SIZE, &retlen, buf);
+	ret = mtd->read(mtd, readpos, PAGE_SIZE, &retlen, buf, &max_bitflips);
 
 	d->mtd_read_count++;
 	if (mtd_is_bitflip(ret)) {
diff --git a/drivers/mtd/tests/mtd_pagetest.c b/drivers/mtd/tests/mtd_pagetest.c
index afafb69..543e363 100644
--- a/drivers/mtd/tests/mtd_pagetest.c
+++ b/drivers/mtd/tests/mtd_pagetest.c
@@ -126,8 +126,11 @@ static int verify_eraseblock(int ebnum)
 
 	set_random_data(writebuf, mtd->erasesize);
 	for (j = 0; j < pgcnt - 1; ++j, addr += pgsize) {
+		unsigned int max_bitflips;
+
 		/* Do a read to set the internal dataRAMs to different data */
-		err = mtd->read(mtd, addr0, bufsize, &read, twopages);
+		err = mtd->read(mtd, addr0, bufsize, &read, twopages,
+				&max_bitflips);
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
@@ -135,7 +138,8 @@ static int verify_eraseblock(int ebnum)
 			       (long long)addr0);
 			return err;
 		}
-		err = mtd->read(mtd, addrn - bufsize, bufsize, &read, twopages);
+		err = mtd->read(mtd, addrn - bufsize, bufsize, &read, twopages,
+				&max_bitflips);
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
@@ -145,7 +149,8 @@ static int verify_eraseblock(int ebnum)
 		}
 		memset(twopages, 0, bufsize);
 		read = 0;
-		err = mtd->read(mtd, addr, bufsize, &read, twopages);
+		err = mtd->read(mtd, addr, bufsize, &read, twopages,
+				&max_bitflips);
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
@@ -161,9 +166,11 @@ static int verify_eraseblock(int ebnum)
 	}
 	/* Check boundary between eraseblocks */
 	if (addr <= addrn - pgsize - pgsize && !bbt[ebnum + 1]) {
+		unsigned int max_bitflips;
 		unsigned long oldnext = next;
 		/* Do a read to set the internal dataRAMs to different data */
-		err = mtd->read(mtd, addr0, bufsize, &read, twopages);
+		err = mtd->read(mtd, addr0, bufsize, &read, twopages,
+				&max_bitflips);
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
@@ -171,7 +178,8 @@ static int verify_eraseblock(int ebnum)
 			       (long long)addr0);
 			return err;
 		}
-		err = mtd->read(mtd, addrn - bufsize, bufsize, &read, twopages);
+		err = mtd->read(mtd, addrn - bufsize, bufsize, &read, twopages,
+				&max_bitflips);
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
@@ -181,7 +189,8 @@ static int verify_eraseblock(int ebnum)
 		}
 		memset(twopages, 0, bufsize);
 		read = 0;
-		err = mtd->read(mtd, addr, bufsize, &read, twopages);
+		err = mtd->read(mtd, addr, bufsize, &read, twopages,
+				&max_bitflips);
 		if (mtd_is_bitflip(err))
 			err = 0;
 		if (err || read != bufsize) {
@@ -207,6 +216,7 @@ static int crosstest(void)
 	int err = 0, i;
 	loff_t addr, addr0, addrn;
 	unsigned char *pp1, *pp2, *pp3, *pp4;
+	unsigned int max_bitflips;
 
 	printk(PRINT_PREF "crosstest\n");
 	pp1 = kmalloc(pgsize * 4, GFP_KERNEL);
@@ -230,7 +240,7 @@ static int crosstest(void)
 	/* Read 2nd-to-last page to pp1 */
 	read = 0;
 	addr = addrn - pgsize - pgsize;
-	err = mtd->read(mtd, addr, pgsize, &read, pp1);
+	err = mtd->read(mtd, addr, pgsize, &read, pp1, &max_bitflips);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
@@ -243,7 +253,7 @@ static int crosstest(void)
 	/* Read 3rd-to-last page to pp1 */
 	read = 0;
 	addr = addrn - pgsize - pgsize - pgsize;
-	err = mtd->read(mtd, addr, pgsize, &read, pp1);
+	err = mtd->read(mtd, addr, pgsize, &read, pp1, &max_bitflips);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
@@ -257,7 +267,7 @@ static int crosstest(void)
 	read = 0;
 	addr = addr0;
 	printk(PRINT_PREF "reading page at %#llx\n", (long long)addr);
-	err = mtd->read(mtd, addr, pgsize, &read, pp2);
+	err = mtd->read(mtd, addr, pgsize, &read, pp2, &max_bitflips);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
@@ -271,7 +281,7 @@ static int crosstest(void)
 	read = 0;
 	addr = addrn - pgsize;
 	printk(PRINT_PREF "reading page at %#llx\n", (long long)addr);
-	err = mtd->read(mtd, addr, pgsize, &read, pp3);
+	err = mtd->read(mtd, addr, pgsize, &read, pp3, &max_bitflips);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
@@ -285,7 +295,7 @@ static int crosstest(void)
 	read = 0;
 	addr = addr0;
 	printk(PRINT_PREF "reading page at %#llx\n", (long long)addr);
-	err = mtd->read(mtd, addr, pgsize, &read, pp4);
+	err = mtd->read(mtd, addr, pgsize, &read, pp4, &max_bitflips);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
@@ -313,6 +323,7 @@ static int erasecrosstest(void)
 	int err = 0, i, ebnum, ebnum2;
 	loff_t addr0;
 	char *readbuf = twopages;
+	unsigned int max_bitflips;
 
 	printk(PRINT_PREF "erasecrosstest\n");
 
@@ -344,7 +355,7 @@ static int erasecrosstest(void)
 
 	printk(PRINT_PREF "reading 1st page of block %d\n", ebnum);
 	memset(readbuf, 0, pgsize);
-	err = mtd->read(mtd, addr0, pgsize, &read, readbuf);
+	err = mtd->read(mtd, addr0, pgsize, &read, readbuf, &max_bitflips);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
@@ -382,7 +393,7 @@ static int erasecrosstest(void)
 
 	printk(PRINT_PREF "reading 1st page of block %d\n", ebnum);
 	memset(readbuf, 0, pgsize);
-	err = mtd->read(mtd, addr0, pgsize, &read, readbuf);
+	err = mtd->read(mtd, addr0, pgsize, &read, readbuf, &max_bitflips);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
@@ -408,6 +419,7 @@ static int erasetest(void)
 	size_t read = 0, written = 0;
 	int err = 0, i, ebnum, ok = 1;
 	loff_t addr0;
+	unsigned int max_bitflips;
 
 	printk(PRINT_PREF "erasetest\n");
 
@@ -438,7 +450,7 @@ static int erasetest(void)
 		return err;
 
 	printk(PRINT_PREF "reading 1st page of block %d\n", ebnum);
-	err = mtd->read(mtd, addr0, pgsize, &read, twopages);
+	err = mtd->read(mtd, addr0, pgsize, &read, twopages, &max_bitflips);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (err || read != pgsize) {
diff --git a/drivers/mtd/tests/mtd_readtest.c b/drivers/mtd/tests/mtd_readtest.c
index 550fe51..01e372e 100644
--- a/drivers/mtd/tests/mtd_readtest.c
+++ b/drivers/mtd/tests/mtd_readtest.c
@@ -51,8 +51,10 @@ static int read_eraseblock_by_page(int ebnum)
 	void *oobbuf = iobuf1;
 
 	for (i = 0; i < pgcnt; i++) {
+		unsigned int max_bitflips;
+
 		memset(buf, 0 , pgcnt);
-		ret = mtd->read(mtd, addr, pgsize, &read, buf);
+		ret = mtd->read(mtd, addr, pgsize, &read, buf, &max_bitflips);
 		if (ret == -EUCLEAN)
 			ret = 0;
 		if (ret || read != pgsize) {
diff --git a/drivers/mtd/tests/mtd_speedtest.c b/drivers/mtd/tests/mtd_speedtest.c
index 493b367..58ddac9 100644
--- a/drivers/mtd/tests/mtd_speedtest.c
+++ b/drivers/mtd/tests/mtd_speedtest.c
@@ -213,8 +213,9 @@ static int read_eraseblock(int ebnum)
 	size_t read = 0;
 	int err = 0;
 	loff_t addr = ebnum * mtd->erasesize;
+	unsigned int max_bitflips;
 
-	err = mtd->read(mtd, addr, mtd->erasesize, &read, iobuf);
+	err = mtd->read(mtd, addr, mtd->erasesize, &read, iobuf, &max_bitflips);
 	/* Ignore corrected ECC errors */
 	if (mtd_is_bitflip(err))
 		err = 0;
@@ -235,7 +236,9 @@ static int read_eraseblock_by_page(int ebnum)
 	void *buf = iobuf;
 
 	for (i = 0; i < pgcnt; i++) {
-		err = mtd->read(mtd, addr, pgsize, &read, buf);
+		unsigned int max_bitflips;
+
+		err = mtd->read(mtd, addr, pgsize, &read, buf, &max_bitflips);
 		/* Ignore corrected ECC errors */
 		if (mtd_is_bitflip(err))
 			err = 0;
@@ -259,9 +262,10 @@ static int read_eraseblock_by_2pages(int ebnum)
 	int i, n = pgcnt / 2, err = 0;
 	loff_t addr = ebnum * mtd->erasesize;
 	void *buf = iobuf;
+	unsigned int max_bitflips;
 
 	for (i = 0; i < n; i++) {
-		err = mtd->read(mtd, addr, sz, &read, buf);
+		err = mtd->read(mtd, addr, sz, &read, buf, &max_bitflips);
 		/* Ignore corrected ECC errors */
 		if (mtd_is_bitflip(err))
 			err = 0;
@@ -276,7 +280,7 @@ static int read_eraseblock_by_2pages(int ebnum)
 		buf += sz;
 	}
 	if (pgcnt % 2) {
-		err = mtd->read(mtd, addr, pgsize, &read, buf);
+		err = mtd->read(mtd, addr, pgsize, &read, buf, &max_bitflips);
 		/* Ignore corrected ECC errors */
 		if (mtd_is_bitflip(err))
 			err = 0;
diff --git a/drivers/mtd/tests/mtd_stresstest.c b/drivers/mtd/tests/mtd_stresstest.c
index 52ffd91..62fa2da 100644
--- a/drivers/mtd/tests/mtd_stresstest.c
+++ b/drivers/mtd/tests/mtd_stresstest.c
@@ -145,6 +145,7 @@ static int do_read(void)
 	int offs = rand_offs();
 	int len = rand_len(offs), err;
 	loff_t addr;
+	unsigned int max_bitflips;
 
 	if (bbt[eb + 1]) {
 		if (offs >= mtd->erasesize)
@@ -153,7 +154,7 @@ static int do_read(void)
 			len = mtd->erasesize - offs;
 	}
 	addr = eb * mtd->erasesize + offs;
-	err = mtd->read(mtd, addr, len, &read, readbuf);
+	err = mtd->read(mtd, addr, len, &read, readbuf, &max_bitflips);
 	if (mtd_is_bitflip(err))
 		err = 0;
 	if (unlikely(err || read != len)) {
diff --git a/drivers/mtd/tests/mtd_subpagetest.c b/drivers/mtd/tests/mtd_subpagetest.c
index 1a05bfa..0c5f2bd 100644
--- a/drivers/mtd/tests/mtd_subpagetest.c
+++ b/drivers/mtd/tests/mtd_subpagetest.c
@@ -189,6 +189,7 @@ static void print_subpage(unsigned char *p)
 
 static int verify_eraseblock(int ebnum)
 {
+	unsigned int max_bitflips;
 	size_t read = 0;
 	int err = 0;
 	loff_t addr = ebnum * mtd->erasesize;
@@ -196,7 +197,7 @@ static int verify_eraseblock(int ebnum)
 	set_random_data(writebuf, subpgsize);
 	clear_data(readbuf, subpgsize);
 	read = 0;
-	err = mtd->read(mtd, addr, subpgsize, &read, readbuf);
+	err = mtd->read(mtd, addr, subpgsize, &read, readbuf, &max_bitflips);
 	if (unlikely(err || read != subpgsize)) {
 		if (mtd_is_bitflip(err) && read == subpgsize) {
 			printk(PRINT_PREF "ECC correction at %#llx\n",
@@ -224,7 +225,7 @@ static int verify_eraseblock(int ebnum)
 	set_random_data(writebuf, subpgsize);
 	clear_data(readbuf, subpgsize);
 	read = 0;
-	err = mtd->read(mtd, addr, subpgsize, &read, readbuf);
+	err = mtd->read(mtd, addr, subpgsize, &read, readbuf, &max_bitflips);
 	if (unlikely(err || read != subpgsize)) {
 		if (mtd_is_bitflip(err) && read == subpgsize) {
 			printk(PRINT_PREF "ECC correction at %#llx\n",
@@ -252,6 +253,7 @@ static int verify_eraseblock(int ebnum)
 
 static int verify_eraseblock2(int ebnum)
 {
+	unsigned int max_bitflips;
 	size_t read = 0;
 	int err = 0, k;
 	loff_t addr = ebnum * mtd->erasesize;
@@ -262,7 +264,8 @@ static int verify_eraseblock2(int ebnum)
 		set_random_data(writebuf, subpgsize * k);
 		clear_data(readbuf, subpgsize * k);
 		read = 0;
-		err = mtd->read(mtd, addr, subpgsize * k, &read, readbuf);
+		err = mtd->read(mtd, addr, subpgsize * k, &read, readbuf,
+				&max_bitflips);
 		if (unlikely(err || read != subpgsize * k)) {
 			if (mtd_is_bitflip(err) && read == subpgsize * k) {
 				printk(PRINT_PREF "ECC correction at %#llx\n",
@@ -287,6 +290,7 @@ static int verify_eraseblock2(int ebnum)
 
 static int verify_eraseblock_ff(int ebnum)
 {
+	unsigned int max_bitflips;
 	uint32_t j;
 	size_t read = 0;
 	int err = 0;
@@ -296,7 +300,8 @@ static int verify_eraseblock_ff(int ebnum)
 	for (j = 0; j < mtd->erasesize / subpgsize; ++j) {
 		clear_data(readbuf, subpgsize);
 		read = 0;
-		err = mtd->read(mtd, addr, subpgsize, &read, readbuf);
+		err = mtd->read(mtd, addr, subpgsize, &read, readbuf,
+				&max_bitflips);
 		if (unlikely(err || read != subpgsize)) {
 			if (mtd_is_bitflip(err) && read == subpgsize) {
 				printk(PRINT_PREF "ECC correction at %#llx\n",
diff --git a/drivers/mtd/tests/mtd_torturetest.c b/drivers/mtd/tests/mtd_torturetest.c
index 03ab649..8c988b8 100644
--- a/drivers/mtd/tests/mtd_torturetest.c
+++ b/drivers/mtd/tests/mtd_torturetest.c
@@ -126,6 +126,7 @@ static inline int erase_eraseblock(int ebnum)
  */
 static inline int check_eraseblock(int ebnum, unsigned char *buf)
 {
+	unsigned int max_bitflips;
 	int err, retries = 0;
 	size_t read = 0;
 	loff_t addr = ebnum * mtd->erasesize;
@@ -137,7 +138,7 @@ static inline int check_eraseblock(int ebnum, unsigned char *buf)
 	}
 
 retry:
-	err = mtd->read(mtd, addr, len, &read, check_buf);
+	err = mtd->read(mtd, addr, len, &read, check_buf, &max_bitflips);
 	if (mtd_is_bitflip(err))
 		printk(PRINT_PREF "single bit flip occurred at EB %d "
 		       "MTD reported that it was fixed.\n", ebnum);
-- 
1.7.3.4
