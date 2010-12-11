Received: from hera.kernel.org ([140.211.167.34])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PRSfz-0005si-Su
	for linux-mtd@lists.infradead.org; Sat, 11 Dec 2010 16:52:04 +0000
From: Tejun Heo <tj@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 27/30] mtd: don't use flush_scheduled_work()
Date: Sat, 11 Dec 2010 17:51:44 +0100
Message-Id: <1292086307-19211-28-git-send-email-tj@kernel.org>
In-Reply-To: <1292086307-19211-1-git-send-email-tj@kernel.org>
References: <1292086307-19211-1-git-send-email-tj@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

flush_scheduled_work() is deprecated and scheduled to be removed.
Directly flush cxt->work_{erase|write} on removal instead.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
This is part of a series to remove flush_scheduled_work() usage to
prepare for deprecation of flush_scheduled_work().  Patches in this
series are self contained and mostly straight-forward.

Please feel free to take it into the appropriate tree, or just ack it.
In the latter case, I'll merge the patch through the workqueue tree
during the next merge window.

If you're seeing this patch for the second time, it's because the
commit hasn't showed up in mainline yet.  Please let me know what
should be done.

Thank you.

 drivers/mtd/mtdoops.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 1ee72f3..8b10273 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -396,7 +396,8 @@ static void mtdoops_notify_remove(struct mtd_info *mtd)
 		printk(KERN_WARNING "mtdoops: could not unregister kmsg_dumper\n");
 
 	cxt->mtd = NULL;
-	flush_scheduled_work();
+	flush_work_sync(&cxt->work_erase);
+	flush_work_sync(&cxt->work_write);
 }
 
 
-- 
1.7.1
