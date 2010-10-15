Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P6m5x-0000we-U3
	for linux-mtd@lists.infradead.org; Fri, 15 Oct 2010 15:21:26 +0000
Received: by mail-bw0-f49.google.com with SMTP id 7so1638853bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Oct 2010 08:21:21 -0700 (PDT)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 2/5] MTD: blktrans: kill the BKL.
Date: Fri, 15 Oct 2010 17:20:44 +0200
Message-Id: <1287156047-17439-3-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <1287156047-17439-1-git-send-email-maximlevitsky@gmail.com>
References: <1287156047-17439-1-git-send-email-maximlevitsky@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Maciej Rutecki <maciej.rutecki@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It not needed, because I already added locking for all fops
methods.

Signed-off-by: Maxim Levitsky
---
 drivers/mtd/mtd_blkdevs.c |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 352831b..040c2d9 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -181,7 +181,6 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 	if (!dev)
 		return -ERESTARTSYS; /* FIXME: busy loop! -arnd*/
 
-	lock_kernel();
 	mutex_lock(&dev->lock);
 
 	if (dev->open++)
@@ -198,7 +197,6 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 unlock:
 	mutex_unlock(&dev->lock);
 	blktrans_dev_put(dev);
-	unlock_kernel();
 	return ret;
 }
 
@@ -210,7 +208,6 @@ static int blktrans_release(struct gendisk *disk, fmode_t mode)
 	if (!dev)
 		return ret;
 
-	lock_kernel();
 	mutex_lock(&dev->lock);
 
 	if (--dev->open)
@@ -226,7 +223,6 @@ static int blktrans_release(struct gendisk *disk, fmode_t mode)
 unlock:
 	mutex_unlock(&dev->lock);
 	blktrans_dev_put(dev);
-	unlock_kernel();
 	return ret;
 }
 
@@ -259,7 +255,6 @@ static int blktrans_ioctl(struct block_device *bdev, fmode_t mode,
 	if (!dev)
 		return ret;
 
-	lock_kernel();
 	mutex_lock(&dev->lock);
 
 	if (!dev->mtd)
@@ -274,7 +269,6 @@ static int blktrans_ioctl(struct block_device *bdev, fmode_t mode,
 	}
 unlock:
 	mutex_unlock(&dev->lock);
-	unlock_kernel();
 	blktrans_dev_put(dev);
 	return ret;
 }
-- 
1.7.1
