Received: from webbox1416.server-home.net ([77.236.96.61])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RkanG-0001tY-Ta
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 12:27:11 +0000
From: Alexander Stein <alexander.stein@systec-electronic.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] Only call mtd->sync() method in mtdblock_release if
 opened for write.
Date: Tue, 10 Jan 2012 13:26:58 +0100
Message-Id: <1326198418-8996-1-git-send-email-alexander.stein@systec-electronic.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Alexander Stein <alexander.stein@systec-electronic.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
---
 drivers/mtd/mtd_blkdevs.c    |    1 +
 drivers/mtd/mtdblock.c       |    7 +++++--
 include/linux/mtd/blktrans.h |    1 +
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index ed8b5e7..e8aac1d 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -234,6 +234,7 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 	if (ret)
 		goto error_release;
 
+	dev->file_mode = mode;
 unlock:
 	mutex_unlock(&dev->lock);
 	blktrans_dev_put(dev);
diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index 7c1dc90..3904df1 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -321,8 +321,11 @@ static int mtdblock_release(struct mtd_blktrans_dev *mbd)
 	mutex_unlock(&mtdblk->cache_mutex);
 
 	if (!--mtdblk->count) {
-		/* It was the last usage. Free the cache */
-		if (mbd->mtd->sync)
+		/*
+		 * It was the last usage. Free the cache
+		 * But only sync if opened writeable
+		 */
+		if ((mbd->file_mode & FMODE_WRITE) && mbd->mtd->sync)
 			mbd->mtd->sync(mbd->mtd);
 		vfree(mtdblk->cache_data);
 	}
diff --git a/include/linux/mtd/blktrans.h b/include/linux/mtd/blktrans.h
index 1bbd9f2..ed270bd 100644
--- a/include/linux/mtd/blktrans.h
+++ b/include/linux/mtd/blktrans.h
@@ -47,6 +47,7 @@ struct mtd_blktrans_dev {
 	struct request_queue *rq;
 	spinlock_t queue_lock;
 	void *priv;
+	fmode_t file_mode;
 };
 
 struct mtd_blktrans_ops {
-- 
1.7.3.4
