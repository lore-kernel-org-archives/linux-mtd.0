Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NSdjd-0005LQ-7R
	for linux-mtd@lists.infradead.org; Wed, 06 Jan 2010 21:48:13 +0000
Received: by fxm22 with SMTP id 22so20326760fxm.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Jan 2010 13:48:08 -0800 (PST)
Subject: [PATCH 4/9] mtd-make mtdtrans thread suspend friendly
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: linux-kernel <linux-kernel@vger.kernel.org>
In-Reply-To: <1262814216.14552.22.camel@maxim-laptop>
References: <1262814216.14552.22.camel@maxim-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 06 Jan 2010 23:48:05 +0200
Message-ID: <1262814485.14552.27.camel@maxim-laptop>
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

>From 23892d5e002d63b7980742fa5445443547fcf8cf Mon Sep 17 00:00:00 2001
From: Maxim Levitsky <maximlevitsky@gmail.com>
Date: Tue, 5 Jan 2010 23:25:19 +0200
Subject: [PATCH 4/9] mtd-make mtdtrans thread suspend friendly

Signed-of-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/mtd_blkdevs.c |   15 +++++++--------
 1 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 6af4673..7070d35 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -20,6 +20,7 @@
 #include <linux/init.h>
 #include <linux/mutex.h>
 #include <linux/kthread.h>
+#include <linux/freezer.h>
 #include <asm/uaccess.h>
 
 #include "mtdcore.h"
@@ -79,37 +80,35 @@ static int mtd_blktrans_thread(void *arg)
 
 	/* we might get involved when memory gets low, so use PF_MEMALLOC */
 	current->flags |= PF_MEMALLOC;
-
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
