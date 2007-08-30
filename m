Received: from [210.94.41.89] (helo=party)
	by pentafluge.infradead.org with esmtpsa (Exim 4.63 #1 (Red Hat Linux))
	id 1IQe0f-00067r-F2
	for linux-mtd@lists.infradead.org; Thu, 30 Aug 2007 08:00:10 +0100
Date: Thu, 30 Aug 2007 15:59:55 +0900
From: Kyungmin Park <kmpark@infradead.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] Use variable blksize for mtdblock
Message-ID: <20070830065955.GA8478@party>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[MTD] Use variable blksize for mtdblock

Even though we can assign the blksize, some codes are hard-coded.
It makes the problem, if you change the blksize.
Also others mtd user have same problem.

If we increase the blksize to PAGE_SIZE, it has better performance than before
Of course, we can use it as before as SECTOR_SIZE

Here's performance gain with same configuration and hardware.

* blksize = 4096
/ # time dd if=/dev/mtdblock3 of=/dev/null
32768+0 records in
32768+0 records out
real    0m 1.80s
user    0m 0.05s
sys     0m 0.55s

* blksize = 512
/ # time dd if=/dev/mtdblock3 of=/dev/null
32768+0 records in
32768+0 records out
real    0m 2.07s
user    0m 0.06s
sys     0m 0.38s

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index 952da30..a908355 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -245,13 +245,15 @@ static int mtdblock_readsect(struct mtd_blktrans_dev *dev,
 			      unsigned long block, char *buf)
 {
 	struct mtdblk_dev *mtdblk = mtdblks[dev->devnum];
-	return do_cached_read(mtdblk, block<<9, 512, buf);
+	struct mtd_blktrans_ops *tr = dev->tr;
+	return do_cached_read(mtdblk, block<<tr->blkshift, tr->blksize, buf);
 }
 
 static int mtdblock_writesect(struct mtd_blktrans_dev *dev,
 			      unsigned long block, char *buf)
 {
 	struct mtdblk_dev *mtdblk = mtdblks[dev->devnum];
+	struct mtd_blktrans_ops *tr = dev->tr;
 	if (unlikely(!mtdblk->cache_data && mtdblk->cache_size)) {
 		mtdblk->cache_data = vmalloc(mtdblk->mtd->erasesize);
 		if (!mtdblk->cache_data)
@@ -261,7 +263,7 @@ static int mtdblock_writesect(struct mtd_blktrans_dev *dev,
 		 * return -EAGAIN sometimes, but why bother?
 		 */
 	}
-	return do_cached_write(mtdblk, block<<9, 512, buf);
+	return do_cached_write(mtdblk, block<<tr->blkshift, tr->blksize, buf);
 }
 
 static int mtdblock_open(struct mtd_blktrans_dev *mbd)
@@ -346,7 +348,7 @@ static void mtdblock_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	dev->mtd = mtd;
 	dev->devnum = mtd->index;
 
-	dev->size = mtd->size >> 9;
+	dev->size = mtd->size >> tr->blkshift;
 	dev->tr = tr;
 
 	if (!(mtd->flags & MTD_WRITEABLE))
