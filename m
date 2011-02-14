Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PozEm-00020z-8Y
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2011 14:17:14 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p1EEH9RJ008249
	for <linux-mtd@lists.infradead.org>; Mon, 14 Feb 2011 16:17:09 +0200
From: Jarkko Lavinen <jarkko.lavinen@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] mtd_blkdevs: Add background processing support
Date: Mon, 14 Feb 2011 16:16:09 +0200
Message-Id: <1297692971-7399-2-git-send-email-jarkko.lavinen@nokia.com>
In-Reply-To: <1297692971-7399-1-git-send-email-jarkko.lavinen@nokia.com>
References: <1297692971-7399-1-git-send-email-jarkko.lavinen@nokia.com>
Cc: Jarkko Lavinen <jarkko.lavinen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a new background method into mtd_blktrans_ops, add background support
into mtd_blktrans_thread(), and add mtd_blktrans_cease_background().

If the mtd blktrans dev has the background support, the thread will
call backgroudn function when the request queue becomes empty. The background
operation may run as long as needs to until
mtd_blktrans_cease_background() tells to stop.

Signed-off-by: Jarkko Lavinen <jarkko.lavinen@nokia.com>
---
 drivers/mtd/mtd_blkdevs.c    |   26 ++++++++++++++++++++++++++
 include/linux/mtd/blktrans.h |    2 ++
 2 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index cb20c67..69d8c27 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -119,11 +119,22 @@ static int do_blktrans_request(struct mtd_blktrans_ops *tr,
 	}
 }
 
+int mtd_blktrans_cease_background(struct mtd_blktrans_dev *dev)
+{
+	if (kthread_should_stop())
+		return 1;
+
+	return !elv_queue_empty(dev->rq);
+}
+EXPORT_SYMBOL_GPL(mtd_blktrans_cease_background);
+
 static int mtd_blktrans_thread(void *arg)
 {
 	struct mtd_blktrans_dev *dev = arg;
+	struct mtd_blktrans_ops *tr = dev->tr;
 	struct request_queue *rq = dev->rq;
 	struct request *req = NULL;
+	int background_done = 0;
 
 	spin_lock_irq(rq->queue_lock);
 
@@ -131,6 +142,19 @@ static int mtd_blktrans_thread(void *arg)
 		int res;
 
 		if (!req && !(req = blk_fetch_request(rq))) {
+			if (tr->background && !background_done) {
+				spin_unlock_irq(rq->queue_lock);
+				mutex_lock(&dev->lock);
+				tr->background(dev);
+				mutex_unlock(&dev->lock);
+				spin_lock_irq(rq->queue_lock);
+				/*
+				 * Do background processing just once per idle
+				 * period.
+				 */
+				background_done = 1;
+				continue;
+			}
 			set_current_state(TASK_INTERRUPTIBLE);
 
 			if (kthread_should_stop())
@@ -152,6 +176,8 @@ static int mtd_blktrans_thread(void *arg)
 
 		if (!__blk_end_request_cur(req, res))
 			req = NULL;
+
+		background_done = 0;
 	}
 
 	if (req)
diff --git a/include/linux/mtd/blktrans.h b/include/linux/mtd/blktrans.h
index 26529eb..66bec4b 100644
--- a/include/linux/mtd/blktrans.h
+++ b/include/linux/mtd/blktrans.h
@@ -62,6 +62,7 @@ struct mtd_blktrans_ops {
 		     unsigned long block, char *buffer);
 	int (*discard)(struct mtd_blktrans_dev *dev,
 		       unsigned long block, unsigned nr_blocks);
+	void (*background)(struct mtd_blktrans_dev *dev);
 
 	/* Block layer ioctls */
 	int (*getgeo)(struct mtd_blktrans_dev *dev, struct hd_geometry *geo);
@@ -85,6 +86,7 @@ extern int register_mtd_blktrans(struct mtd_blktrans_ops *tr);
 extern int deregister_mtd_blktrans(struct mtd_blktrans_ops *tr);
 extern int add_mtd_blktrans_dev(struct mtd_blktrans_dev *dev);
 extern int del_mtd_blktrans_dev(struct mtd_blktrans_dev *dev);
+extern int mtd_blktrans_cease_background(struct mtd_blktrans_dev *dev);
 
 
 #endif /* __MTD_TRANS_H__ */
-- 
1.7.2.3
