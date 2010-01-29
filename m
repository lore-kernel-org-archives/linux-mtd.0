Received: from exchange.solarflare.com ([216.237.3.220])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NaxvM-0007rB-Ct
	for linux-mtd@lists.infradead.org; Fri, 29 Jan 2010 20:58:42 +0000
Subject: [PATCHv3 5/9] mtdblock: Dynamically allocate cache info structures
From: Ben Hutchings <bhutchings@solarflare.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1264798537.2785.25.camel@achroite.uk.solarflarecom.com>
References: <1264798537.2785.25.camel@achroite.uk.solarflarecom.com>
Content-Type: text/plain
Date: Fri, 29 Jan 2010 20:58:37 +0000
Message-Id: <1264798717.2785.34.camel@achroite.uk.solarflarecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-net-drivers@solarflare.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since we allocate struct mtd_blktrans_dev for each block device, we
can add our own structure members to the end.  Therefore embed
struct mtd_blktrans_dev in struct mtdblk_dev and remove the static
array of struct mtdblk_dev.  Also remove the redundant pointer to
struct mtd_info.

This is preparation for removing the static limit on the number of MTD
devices.

Signed-off-by: Ben Hutchings <bhutchings@solarflare.com>
---
 drivers/mtd/mtdblock.c |   74 ++++++++++++++++++++----------------------------
 1 files changed, 31 insertions(+), 43 deletions(-)

diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index 9f41b1a..69f6bf2 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -19,15 +19,15 @@
 #include <linux/mutex.h>
 

-static struct mtdblk_dev {
-	struct mtd_info *mtd;
+struct mtdblk_dev {
+	struct mtd_blktrans_dev mbd;
 	int count;
 	struct mutex cache_mutex;
 	unsigned char *cache_data;
 	unsigned long cache_offset;
 	unsigned int cache_size;
 	enum { STATE_EMPTY, STATE_CLEAN, STATE_DIRTY } cache_state;
-} *mtdblks[MAX_MTD_DEVICES];
+};
 
 static struct mutex mtdblks_lock;
 
@@ -98,7 +98,7 @@ static int erase_write (struct mtd_info *mtd, unsigned long pos,
 
 static int write_cached_data (struct mtdblk_dev *mtdblk)
 {
-	struct mtd_info *mtd = mtdblk->mtd;
+	struct mtd_info *mtd = mtdblk->mbd.mtd;
 	int ret;
 
 	if (mtdblk->cache_state != STATE_DIRTY)
@@ -128,7 +128,7 @@ static int write_cached_data (struct mtdblk_dev *mtdblk)
 static int do_cached_write (struct mtdblk_dev *mtdblk, unsigned long pos,
 			    int len, const char *buf)
 {
-	struct mtd_info *mtd = mtdblk->mtd;
+	struct mtd_info *mtd = mtdblk->mbd.mtd;
 	unsigned int sect_size = mtdblk->cache_size;
 	size_t retlen;
 	int ret;
@@ -198,7 +198,7 @@ static int do_cached_write (struct mtdblk_dev *mtdblk, unsigned long pos,
 static int do_cached_read (struct mtdblk_dev *mtdblk, unsigned long pos,
 			   int len, char *buf)
 {
-	struct mtd_info *mtd = mtdblk->mtd;
+	struct mtd_info *mtd = mtdblk->mbd.mtd;
 	unsigned int sect_size = mtdblk->cache_size;
 	size_t retlen;
 	int ret;
@@ -244,16 +244,16 @@ static int do_cached_read (struct mtdblk_dev *mtdblk, unsigned long pos,
 static int mtdblock_readsect(struct mtd_blktrans_dev *dev,
 			      unsigned long block, char *buf)
 {
-	struct mtdblk_dev *mtdblk = mtdblks[dev->devnum];
+	struct mtdblk_dev *mtdblk = container_of(dev, struct mtdblk_dev, mbd);
 	return do_cached_read(mtdblk, block<<9, 512, buf);
 }
 
 static int mtdblock_writesect(struct mtd_blktrans_dev *dev,
 			      unsigned long block, char *buf)
 {
-	struct mtdblk_dev *mtdblk = mtdblks[dev->devnum];
+	struct mtdblk_dev *mtdblk = container_of(dev, struct mtdblk_dev, mbd);
 	if (unlikely(!mtdblk->cache_data && mtdblk->cache_size)) {
-		mtdblk->cache_data = vmalloc(mtdblk->mtd->erasesize);
+		mtdblk->cache_data = vmalloc(mtdblk->mbd.mtd->erasesize);
 		if (!mtdblk->cache_data)
 			return -EINTR;
 		/* -EINTR is not really correct, but it is the best match
@@ -266,37 +266,26 @@ static int mtdblock_writesect(struct mtd_blktrans_dev *dev,
 
 static int mtdblock_open(struct mtd_blktrans_dev *mbd)
 {
-	struct mtdblk_dev *mtdblk;
-	struct mtd_info *mtd = mbd->mtd;
-	int dev = mbd->devnum;
+	struct mtdblk_dev *mtdblk = container_of(mbd, struct mtdblk_dev, mbd);
 
 	DEBUG(MTD_DEBUG_LEVEL1,"mtdblock_open\n");
 
 	mutex_lock(&mtdblks_lock);
-	if (mtdblks[dev]) {
-		mtdblks[dev]->count++;
+	if (mtdblk->count) {
+		mtdblk->count++;
 		mutex_unlock(&mtdblks_lock);
 		return 0;
 	}
 
 	/* OK, it's not open. Create cache info for it */
-	mtdblk = kzalloc(sizeof(struct mtdblk_dev), GFP_KERNEL);
-	if (!mtdblk) {
-		mutex_unlock(&mtdblks_lock);
-		return -ENOMEM;
-	}
-
 	mtdblk->count = 1;
-	mtdblk->mtd = mtd;
-
 	mutex_init(&mtdblk->cache_mutex);
 	mtdblk->cache_state = STATE_EMPTY;
-	if ( !(mtdblk->mtd->flags & MTD_NO_ERASE) && mtdblk->mtd->erasesize) {
-		mtdblk->cache_size = mtdblk->mtd->erasesize;
+	if (!(mbd->mtd->flags & MTD_NO_ERASE) && mbd->mtd->erasesize) {
+		mtdblk->cache_size = mbd->mtd->erasesize;
 		mtdblk->cache_data = NULL;
 	}
 
-	mtdblks[dev] = mtdblk;
 	mutex_unlock(&mtdblks_lock);
 
 	DEBUG(MTD_DEBUG_LEVEL1, "ok\n");
@@ -306,8 +295,7 @@ static int mtdblock_open(struct mtd_blktrans_dev *mbd)
 
 static int mtdblock_release(struct mtd_blktrans_dev *mbd)
 {
-	int dev = mbd->devnum;
-	struct mtdblk_dev *mtdblk = mtdblks[dev];
+	struct mtdblk_dev *mtdblk = container_of(mbd, struct mtdblk_dev, mbd);
 
    	DEBUG(MTD_DEBUG_LEVEL1, "mtdblock_release\n");
 
@@ -318,12 +306,10 @@ static int mtdblock_release(struct mtd_blktrans_dev *mbd)
 	mutex_unlock(&mtdblk->cache_mutex);
 
 	if (!--mtdblk->count) {
-		/* It was the last usage. Free the device */
-		mtdblks[dev] = NULL;
-		if (mtdblk->mtd->sync)
-			mtdblk->mtd->sync(mtdblk->mtd);
+		/* It was the last usage. Free the cache */
+		if (mbd->mtd->sync)
+			mbd->mtd->sync(mbd->mtd);
 		vfree(mtdblk->cache_data);
-		kfree(mtdblk);
 	}
 
 	mutex_unlock(&mtdblks_lock);
@@ -335,40 +321,42 @@ static int mtdblock_release(struct mtd_blktrans_dev *mbd)
 
 static int mtdblock_flush(struct mtd_blktrans_dev *dev)
 {
-	struct mtdblk_dev *mtdblk = mtdblks[dev->devnum];
+	struct mtdblk_dev *mtdblk = container_of(dev, struct mtdblk_dev, mbd);
 
 	mutex_lock(&mtdblk->cache_mutex);
 	write_cached_data(mtdblk);
 	mutex_unlock(&mtdblk->cache_mutex);
 
-	if (mtdblk->mtd->sync)
-		mtdblk->mtd->sync(mtdblk->mtd);
+	if (dev->mtd->sync)
+		dev->mtd->sync(dev->mtd);
 	return 0;
 }
 
 static void mtdblock_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 {
-	struct mtd_blktrans_dev *dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	struct mtdblk_dev *dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 
 	if (!dev)
 		return;
 
-	dev->mtd = mtd;
-	dev->devnum = mtd->index;
+	dev->mbd.mtd = mtd;
+	dev->mbd.devnum = mtd->index;
 
-	dev->size = mtd->size >> 9;
-	dev->tr = tr;
+	dev->mbd.size = mtd->size >> 9;
+	dev->mbd.tr = tr;
 
 	if (!(mtd->flags & MTD_WRITEABLE))
-		dev->readonly = 1;
+		dev->mbd.readonly = 1;
 
-	add_mtd_blktrans_dev(dev);
+	add_mtd_blktrans_dev(&dev->mbd);
 }
 
 static void mtdblock_remove_dev(struct mtd_blktrans_dev *dev)
 {
+	struct mtdblk_dev *mtdblk = container_of(dev, struct mtdblk_dev, mbd);
+
 	del_mtd_blktrans_dev(dev);
-	kfree(dev);
+	kfree(mtdblk);
 }
 
 static struct mtd_blktrans_ops mtdblock_tr = {
-- 
1.5.5


-- 
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
