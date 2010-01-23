Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NYToE-0005j0-NF
	for linux-mtd@lists.infradead.org; Sat, 23 Jan 2010 00:25:07 +0000
Received: by bwz4 with SMTP id 4so1646175bwz.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Jan 2010 16:25:01 -0800 (PST)
Subject: [PATCH 6/8] blktrans: flush all requests before we remove the device
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
In-Reply-To: <1264205925.31827.3.camel@maxim-laptop>
References: <1264205925.31827.3.camel@maxim-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 23 Jan 2010 02:24:58 +0200
Message-ID: <1264206298.31827.10.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Alex Dubov <oakad@yahoo.com>, joern <joern@logfs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 6d5a70a18bea40bfc354e73d7fde5042465fc534 Mon Sep 17 00:00:00 2001
From: Maxim Levitsky <maximlevitsky@gmail.com>
Date: Sat, 23 Jan 2010 02:09:11 +0200
Subject: [PATCH 6/8] blktrans: flush all requests before we remove the device

Flush all requests, so we can be sure we don't deadlock the system later
when we remove the disk queue.

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/mtd_blkdevs.c |   14 +++++++++++++-
 1 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index f165115..33bdef1 100644
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
 

@@ -359,6 +365,8 @@ error1:
 
 int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 {
+	unsigned long flags;
+
 	if (mutex_trylock(&mtd_table_mutex)) {
 		mutex_unlock(&mtd_table_mutex);
 		BUG();
@@ -369,7 +377,11 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
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
