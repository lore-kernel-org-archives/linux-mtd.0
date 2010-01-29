Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NasBx-0000xv-Fu
	for linux-mtd@lists.infradead.org; Fri, 29 Jan 2010 14:51:30 +0000
Received: by mail-bw0-f212.google.com with SMTP id 4so1893029bwz.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Jan 2010 06:51:25 -0800 (PST)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH 06/16] blktrans: flush all requests before we remove the device
Date: Fri, 29 Jan 2010 16:50:53 +0200
Message-Id: <1264776663-7042-7-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <1264776663-7042-1-git-send-email-maximlevitsky@gmail.com>
References: <1264776663-7042-1-git-send-email-maximlevitsky@gmail.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Flush all requests, so we can be sure we don't deadlock the system later
when we remove the disk queue.

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/mtd_blkdevs.c |   14 +++++++++++++-
 1 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 841c6ae..a65eb07 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -115,7 +115,13 @@ static int mtd_blktrans_thread(void *arg)
 static void mtd_blktrans_request(struct request_queue *rq)
 {
 	struct mtd_blktrans_dev *dev = rq->queuedata;
-	wake_up_process(dev->thread);
+	struct request *req = NULL;
+
+	if (dev->deleted)
+		while ((req = blk_fetch_request(rq)) != NULL)
+			__blk_end_request_all(req, -ENODEV);
+	else
+		wake_up_process(dev->thread);
 }
 
 
@@ -358,6 +364,8 @@ error1:
 
 int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 {
+	unsigned long flags;
+
 	if (mutex_trylock(&mtd_table_mutex)) {
 		mutex_unlock(&mtd_table_mutex);
 		BUG();
@@ -368,7 +376,11 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 	/* stop new requests to arrive */
 	del_gendisk(old->disk);
 
+	/* flush current requests */
+	spin_lock_irqsave(&old->queue_lock, flags);
 	old->deleted = 1;
+	blk_start_queue(old->rq);
+	spin_unlock_irqrestore(&old->queue_lock, flags);
 
 	/* Stop the thread */
 	kthread_stop(old->thread);
-- 
1.6.3.3
