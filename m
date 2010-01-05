Received: from mail.solarflare.com ([216.237.3.220]
	helo=exchange.solarflare.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NSBEx-0001J1-U3
	for linux-mtd@lists.infradead.org; Tue, 05 Jan 2010 15:22:40 +0000
Subject: [PATCH 5/6] mtdblock: Replace array of block cache info with
	pointers in struct mtd_info
From: Ben Hutchings <bhutchings@solarflare.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain
Date: Tue, 05 Jan 2010 15:22:31 +0000
Message-Id: <1262704951.2837.14.camel@achroite.uk.solarflarecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is preparation for removing the static limit on the number of MTD
devices.

Signed-off-by: Ben Hutchings <bhutchings@solarflare.com>
---
This isn't terribly clean but I couldn't think of a better way to do it.
Are there any lifetime issues with this?

Ben.

 drivers/mtd/mtdblock.c  |   22 ++++++++++------------
 include/linux/mtd/mtd.h |    4 ++++
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index 9f41b1a..d680468 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -19,7 +19,7 @@
 #include <linux/mutex.h>
 

-static struct mtdblk_dev {
+struct mtdblk_dev {
 	struct mtd_info *mtd;
 	int count;
 	struct mutex cache_mutex;
@@ -27,7 +27,7 @@ static struct mtdblk_dev {
 	unsigned long cache_offset;
 	unsigned int cache_size;
 	enum { STATE_EMPTY, STATE_CLEAN, STATE_DIRTY } cache_state;
-} *mtdblks[MAX_MTD_DEVICES];
+};
 
 static struct mutex mtdblks_lock;
 
@@ -244,14 +244,14 @@ static int do_cached_read (struct mtdblk_dev *mtdblk, unsigned long pos,
 static int mtdblock_readsect(struct mtd_blktrans_dev *dev,
 			      unsigned long block, char *buf)
 {
-	struct mtdblk_dev *mtdblk = mtdblks[dev->devnum];
+	struct mtdblk_dev *mtdblk = dev->mtd->blk_dev;
 	return do_cached_read(mtdblk, block<<9, 512, buf);
 }
 
 static int mtdblock_writesect(struct mtd_blktrans_dev *dev,
 			      unsigned long block, char *buf)
 {
-	struct mtdblk_dev *mtdblk = mtdblks[dev->devnum];
+	struct mtdblk_dev *mtdblk = dev->mtd->blk_dev;
 	if (unlikely(!mtdblk->cache_data && mtdblk->cache_size)) {
 		mtdblk->cache_data = vmalloc(mtdblk->mtd->erasesize);
 		if (!mtdblk->cache_data)
@@ -268,13 +268,12 @@ static int mtdblock_open(struct mtd_blktrans_dev *mbd)
 {
 	struct mtdblk_dev *mtdblk;
 	struct mtd_info *mtd = mbd->mtd;
-	int dev = mbd->devnum;
 
 	DEBUG(MTD_DEBUG_LEVEL1,"mtdblock_open\n");
 
 	mutex_lock(&mtdblks_lock);
-	if (mtdblks[dev]) {
-		mtdblks[dev]->count++;
+	if (mtd->blk_dev) {
+		mtd->blk_dev->count++;
 		mutex_unlock(&mtdblks_lock);
 		return 0;
 	}
@@ -296,7 +295,7 @@ static int mtdblock_open(struct mtd_blktrans_dev *mbd)
 		mtdblk->cache_data = NULL;
 	}
 
-	mtdblks[dev] = mtdblk;
+	mtd->blk_dev = mtdblk;
 	mutex_unlock(&mtdblks_lock);
 
 	DEBUG(MTD_DEBUG_LEVEL1, "ok\n");
@@ -306,8 +305,7 @@ static int mtdblock_open(struct mtd_blktrans_dev *mbd)
 
 static int mtdblock_release(struct mtd_blktrans_dev *mbd)
 {
-	int dev = mbd->devnum;
-	struct mtdblk_dev *mtdblk = mtdblks[dev];
+	struct mtdblk_dev *mtdblk = mbd->mtd->blk_dev;
 
    	DEBUG(MTD_DEBUG_LEVEL1, "mtdblock_release\n");
 
@@ -319,7 +317,7 @@ static int mtdblock_release(struct mtd_blktrans_dev *mbd)
 
 	if (!--mtdblk->count) {
 		/* It was the last usage. Free the device */
-		mtdblks[dev] = NULL;
+		mtdblk->mtd->blk_dev = NULL;
 		if (mtdblk->mtd->sync)
 			mtdblk->mtd->sync(mtdblk->mtd);
 		vfree(mtdblk->cache_data);
@@ -335,7 +333,7 @@ static int mtdblock_release(struct mtd_blktrans_dev *mbd)
 
 static int mtdblock_flush(struct mtd_blktrans_dev *dev)
 {
-	struct mtdblk_dev *mtdblk = mtdblks[dev->devnum];
+	struct mtdblk_dev *mtdblk = dev->mtd->blk_dev;
 
 	mutex_lock(&mtdblk->cache_mutex);
 	write_cached_data(mtdblk);
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 0f32a9b..5c1b1ac 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -177,6 +177,10 @@ struct mtd_info {
 	 */
 	struct backing_dev_info *backing_dev_info;
 
+#if defined(CONFIG_MTD_BLOCK) || defined(CONFIG_MTD_BLOCK_MODULE)
+	/* Block device state */
+	struct mtdblk_dev *blk_dev;
+#endif
 
 	int (*read) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
 	int (*write) (struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen, const u_char *buf);
-- 
1.5.5


-- 
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
