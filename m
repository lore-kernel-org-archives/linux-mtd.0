Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QBgaX-0007xN-O5
	for linux-mtd@lists.infradead.org; Mon, 18 Apr 2011 05:01:30 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: mtd_blkdevs: fix error path in blktrans_open
Date: Mon, 18 Apr 2011 08:04:56 +0300
Message-Id: <1303103096-4958-1-git-send-email-dedekind1@gmail.com>
Cc: Mike Turner <admin@islandsoftware.co.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

The 'blktrans_open()' does not handle possible '__get_mtd_device()' failures
because it does not check the error code. Moreover, the 'dev->tr->open()'
failures are not handled correctly because in this case the function just
goes ahead and gets the mtd device but returns an error. Instead, it should
_not_ try to get the mtd device, then it should put back the module and kref.

This patch fixes the issue. Note, I only compile-test it but did not test.
This patch was inspired bug report about a similar issue in 2.6.34 kernels
sent by Mike Turner <admin@islandsoftware.co.uk> to the MTD mailing list:

http://lists.infradead.org/pipermail/linux-mtd/2011-April/034980.html

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/mtd_blkdevs.c |   24 +++++++++++++++++++++---
 1 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index a534e1f..ca38569 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -221,15 +221,33 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 	kref_get(&dev->ref);
 	__module_get(dev->tr->owner);
 
-	if (dev->mtd) {
-		ret = dev->tr->open ? dev->tr->open(dev) : 0;
-		__get_mtd_device(dev->mtd);
+	if (!dev->mtd)
+		goto unlock;
+
+	if (dev->tr->open) {
+		ret = dev->tr->open(dev);
+		if (ret)
+			goto error_put;
 	}
 
+	ret = __get_mtd_device(dev->mtd);
+	if (ret)
+		goto error_release;
+
 unlock:
 	mutex_unlock(&dev->lock);
 	blktrans_dev_put(dev);
 	return ret;
+
+error_release:
+	if (dev->tr->release)
+		dev->tr->release(dev);
+error_put:
+	module_put(dev->tr->owner);
+	kref_put(&dev->ref, blktrans_dev_release);
+	mutex_unlock(&dev->lock);
+	blktrans_dev_put(dev);
+	return ret;
 }
 
 static int blktrans_release(struct gendisk *disk, fmode_t mode)
-- 
1.7.4.2
