Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S1Kw4-0007Jw-SE
 for linux-mtd@lists.infradead.org; Sat, 25 Feb 2012 16:57:30 +0000
Received: by wgbdt13 with SMTP id dt13so1915240wgb.18
 for <linux-mtd@lists.infradead.org>; Sat, 25 Feb 2012 08:57:25 -0800 (PST)
From: Fubo Chen <fubo.chen@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: Fix memory leak triggered by removal
Date: Sat, 25 Feb 2012 16:57:22 +0000
Message-ID: <4462354.EgehQQfXY4@asus>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Make sure that blk_cleanup_queue() is called in del_mtd_blktrans_dev().

Signed-off-by: Fubo Chen <fubo.chen@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/mtd_blkdevs.c |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 424ca5f..8b72f24 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -196,7 +196,7 @@ static void mtd_blktrans_request(struct request_queue *rq)
 
 	dev = rq->queuedata;
 
-	if (!dev)
+	if (unlikely(blk_queue_dead(rq)))
 		while ((req = blk_fetch_request(rq)) != NULL)
 			__blk_end_request_all(req, -ENODEV);
 	else {
@@ -469,8 +469,6 @@ error1:
 
 int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 {
-	unsigned long flags;
-
 	if (mutex_trylock(&mtd_table_mutex)) {
 		mutex_unlock(&mtd_table_mutex);
 		BUG();
@@ -488,10 +486,7 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 	kthread_stop(old->thread);
 
 	/* Kill current requests */
-	spin_lock_irqsave(&old->queue_lock, flags);
-	old->rq->queuedata = NULL;
-	blk_start_queue(old->rq);
-	spin_unlock_irqrestore(&old->queue_lock, flags);
+	blk_cleanup_queue(old->rq);
 
 	/* If the device is currently open, tell trans driver to close it,
 		then put mtd device, and don't touch it again */
-- 
1.7.7
