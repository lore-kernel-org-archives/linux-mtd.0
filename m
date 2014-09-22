Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XVzG1-0003U9-31
 for linux-mtd@lists.infradead.org; Mon, 22 Sep 2014 08:46:05 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 3/3] UBI: Fix possible deadlock in erase_worker()
Date: Mon, 22 Sep 2014 10:45:36 +0200
Message-Id: <1411375536-20067-3-git-send-email-richard@nod.at>
In-Reply-To: <1411375536-20067-1-git-send-email-richard@nod.at>
References: <1411375536-20067-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If sync_erase() fails with EINTR, ENOMEM, EAGAIN or
EBUSY erase_worker() re-schedules the failed work.
This will lead to a deadlock because erase_worker() is called
with work_sem held in read mode. And schedule_erase() will take
this lock again.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 253ec9b..637ffff 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1421,8 +1421,6 @@ static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
 {
 	struct ubi_wl_entry *e = wl_wrk->e;
 	int pnum = e->pnum;
-	int vol_id = wl_wrk->vol_id;
-	int lnum = wl_wrk->lnum;
 	int err, available_consumed = 0;
 
 	if (shutdown) {
@@ -1459,21 +1457,15 @@ static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
 	}
 
 	ubi_err("failed to erase PEB %d, error %d", pnum, err);
-	kfree(wl_wrk);
 
 	if (err == -EINTR || err == -ENOMEM || err == -EAGAIN ||
 	    err == -EBUSY) {
-		int err1;
-
 		/* Re-schedule the LEB for erasure */
-		err1 = schedule_erase(ubi, e, vol_id, lnum, 0);
-		if (err1) {
-			err = err1;
-			goto out_ro;
-		}
+		__schedule_ubi_work(ubi, wl_wrk);
 		return err;
 	}
 
+	kfree(wl_wrk);
 	kmem_cache_free(ubi_wl_entry_slab, e);
 	if (err != -EIO)
 		/*
-- 
1.8.4.5
