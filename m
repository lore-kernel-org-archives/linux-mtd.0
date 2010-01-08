Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTGRo-000089-IC
	for linux-mtd@lists.infradead.org; Fri, 08 Jan 2010 15:08:25 +0000
Received: by fxm22 with SMTP id 22so21924117fxm.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Jan 2010 07:08:19 -0800 (PST)
Subject: [PATCH 4/9] MTD: make mtdtrans thread freezable.
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: linux-kernel <linux-kernel@vger.kernel.org>
In-Reply-To: <1262963092.12577.14.camel@maxim-laptop>
References: <1262963092.12577.14.camel@maxim-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 08 Jan 2010 17:08:16 +0200
Message-ID: <1262963296.12577.18.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: joern <joern@logfs.org>, linux-mtd <linux-mtd@lists.infradead.org>,
	Alex Dubov <oakad@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From e8648ebdc31d65556fccb340e4c16edc43017cf1 Mon Sep 17 00:00:00 2001
From: Maxim Levitsky <maximlevitsky@gmail.com>
Date: Fri, 8 Jan 2010 15:52:18 +0200
Subject: [PATCH 4/9] MTD: make mtdtrans thread freezable.

This makes the mtd blktrans thread enter the freezer in between accesses
to nand device.
This will ensure that we aren't suspending the system in the middle
of page read/write and even worse erase, which is a bad idea.

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/mtd_blkdevs.c |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 04a875f..db996d6 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -20,6 +20,7 @@
 #include <linux/init.h>
 #include <linux/mutex.h>
 #include <linux/kthread.h>
+#include <linux/freezer.h>
 #include <asm/uaccess.h>
 
 #include "mtdcore.h"
@@ -79,36 +80,35 @@ static int mtd_blktrans_thread(void *arg)
 	struct request_queue *rq = dev->rq;
 	struct request *req = NULL;
 
-	spin_lock_irq(rq->queue_lock);
+	set_freezable();
 
 	while (!kthread_should_stop()) {
 		int res;
 
+		try_to_freeze();
+
+		spin_lock_irq(rq->queue_lock);
 		if (!req && !(req = blk_fetch_request(rq))) {
 			set_current_state(TASK_INTERRUPTIBLE);
 			spin_unlock_irq(rq->queue_lock);
 			schedule();
-			spin_lock_irq(rq->queue_lock);
 			continue;
 		}
-
 		spin_unlock_irq(rq->queue_lock);
 
+
 		mutex_lock(&dev->lock);
 		res = do_blktrans_request(dev->tr, dev, req);
 		mutex_unlock(&dev->lock);
 
 		spin_lock_irq(rq->queue_lock);
-
 		if (!__blk_end_request_cur(req, res))
 			req = NULL;
+		spin_unlock_irq(rq->queue_lock);
 	}
 
 	if (req)
 		__blk_end_request_all(req, -EIO);
-
-	spin_unlock_irq(rq->queue_lock);
-
 	return 0;
 }
 
-- 
1.6.3.3
