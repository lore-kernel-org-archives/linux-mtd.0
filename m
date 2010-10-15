Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P6m63-0000we-Gn
	for linux-mtd@lists.infradead.org; Fri, 15 Oct 2010 15:21:34 +0000
Received: by mail-bw0-f49.google.com with SMTP id 7so1638853bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Oct 2010 08:21:27 -0700 (PDT)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 3/5] MTD: blktrans: fix a race vs kthread_stop.
Date: Fri, 15 Oct 2010 17:20:45 +0200
Message-Id: <1287156047-17439-4-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <1287156047-17439-1-git-send-email-maximlevitsky@gmail.com>
References: <1287156047-17439-1-git-send-email-maximlevitsky@gmail.com>
Cc: Maxim Levitsky <maximlevisky@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org,
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

There is small race window that could make kthread_stop hang forever.
I found that while hacking the IR subsystem.

Signed-off-by: Maxim Levitsky <maximlevisky@gmail.com>
---
 drivers/mtd/mtd_blkdevs.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 040c2d9..a919587 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -133,6 +133,10 @@ static int mtd_blktrans_thread(void *arg)
 
 		if (!req && !(req = blk_fetch_request(rq))) {
 			set_current_state(TASK_INTERRUPTIBLE);
+
+			if (kthread_should_stop())
+				set_current_state(TASK_RUNNING);
+
 			spin_unlock_irq(rq->queue_lock);
 			schedule();
 			spin_lock_irq(rq->queue_lock);
-- 
1.7.1
