Received: from smtp02.icteam.com ([80.76.69.28])
 by casper.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YkVJX-0000pt-QB
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2015 10:22:00 +0000
From: Giuseppe Cantavenera <giuseppe.cantavenera.ext@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: fix: avoid race condition when accessing mtd->usecount
Date: Tue, 21 Apr 2015 12:20:22 +0200
Message-Id: <1429611622-2652-1-git-send-email-giuseppe.cantavenera.ext@nokia.com>
Cc: Giuseppe Cantavenera <giuseppe.cantavenera.ext@nokia.com>,
 lorenzo.restelli.ext@nokia.com, stable@vger.kernel.org,
 alexander.sverdlin@nokia.com, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On A MIPS 32-cores machine a BUG_ON was triggered because some acesses to
mtd->usecount were done without taking mtd_table_mutex.
kernel: Call Trace:
kernel: [<ffffffff80401818>] __put_mtd_device+0x20/0x50
kernel: [<ffffffff804086f4>] blktrans_release+0x8c/0xd8
kernel: [<ffffffff802577e0>] __blkdev_put+0x1a8/0x200
kernel: [<ffffffff802579a4>] blkdev_close+0x1c/0x30
kernel: [<ffffffff8022006c>] __fput+0xac/0x250
kernel: [<ffffffff80171208>] task_work_run+0xd8/0x120
kernel: [<ffffffff8012c23c>] work_notifysig+0x10/0x18
kernel:
kernel:
        Code: 2442ffff  ac8202d8  000217fe <00020336> dc820128  10400003
               00000000  0040f809  00000000
kernel: ---[ end trace 080fbb4579b47a73 ]---

Fixed by taking the mutex in blktrans_open and by using the protected
version of put_mtd_device in blktrans_release and del_mtd_blktrans_dev

Cc: stable@vger.kernel.org
Cc: alexander.sverdlin@nokia.com
Signed-off-by: Giuseppe Cantavenera <giuseppe.cantavenera.ext@nokia.com>
Acked-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
 drivers/mtd/mtd_blkdevs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 2b0c5287..3a9f138 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -213,7 +213,9 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 			goto error_put;
 	}
 
+	mutex_lock(&mtd_table_mutex);
 	ret = __get_mtd_device(dev->mtd);
+	mutex_unlock(&mtd_table_mutex);
 	if (ret)
 		goto error_release;
 	dev->file_mode = mode;
@@ -253,7 +255,7 @@ static void blktrans_release(struct gendisk *disk, fmode_t mode)
 	if (dev->mtd) {
 		if (dev->tr->release)
 			dev->tr->release(dev);
-		__put_mtd_device(dev->mtd);
+		put_mtd_device(dev->mtd);
 	}
 unlock:
 	mutex_unlock(&dev->lock);
@@ -484,7 +486,7 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 	if (old->open) {
 		if (old->tr->release)
 			old->tr->release(old);
-		__put_mtd_device(old->mtd);
+		put_mtd_device(old->mtd);
 	}
 
 	old->mtd = NULL;
--
1.9.1
