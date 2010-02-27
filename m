Received: from mail-fx0-f214.google.com ([209.85.220.214])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NlAbA-0000Zd-QK
	for linux-mtd@lists.infradead.org; Sat, 27 Feb 2010 00:32:05 +0000
Received: by fxm6 with SMTP id 6so695799fxm.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Feb 2010 16:31:57 -0800 (PST)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] MTD: blktrans: do blk_cleanup_queue when it is really safe to
	do so
Date: Sat, 27 Feb 2010 02:31:51 +0200
Message-Id: <1267230711-13894-1-git-send-email-maximlevitsky@gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Maxim Levitsky <maximlevitsky@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I was calling it in del_mtd_blktrans_dev, but ->request_fn could
still be running at that point, thus defer this call
to blktrans_dev_release

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/mtd_blkdevs.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

This fixes the problem I described in former patch
(no matter how well sotware is tested, there must be bugs...)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index e32c49c..03e19c1 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -32,6 +32,7 @@ void blktrans_dev_release(struct kref *kref)
 		container_of(kref, struct mtd_blktrans_dev, ref);
 
 	dev->disk->private_data = NULL;
+	blk_cleanup_queue(dev->rq);
 	put_disk(dev->disk);
 	list_del(&dev->list);
 	kfree(dev);
@@ -423,7 +424,6 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 	old->rq->queuedata = NULL;
 	blk_start_queue(old->rq);
 	spin_unlock_irqrestore(&old->queue_lock, flags);
-	blk_cleanup_queue(old->rq);
 
 	/* Ask trans driver for release to the mtd device */
 	mutex_lock(&old->lock);
-- 
1.6.3.3
