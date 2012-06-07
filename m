Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Scbhn-0001j8-QH
 for linux-mtd@lists.infradead.org; Thu, 07 Jun 2012 12:20:48 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Subject: [PATCH] UBI: correct ubi_wl_flush locking
Date: Thu,  7 Jun 2012 15:22:04 +0300
Message-Id: <1339071724-12321-1-git-send-email-dedekind1@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Commit "62f38455 UBI: modify ubi_wl_flush function to clear work queue for a lnum"
takes the 'work_sem' semaphore in write mode for the entire loop, which is not
very good because it will block other workers for potentially long time. We do
not need to have it in write mode - read mode is enough, and we do not need to
hole it over the entire loop. So this patch turns changes the locking: takes
'work_sem' in read mode and pushes it down to the loop.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---

Joel, please verify this - I will merge it upstream soon.

 drivers/mtd/ubi/wl.c |   17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 9df100a..b6be644 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1262,11 +1262,11 @@ int ubi_wl_flush(struct ubi_device *ubi, int vol_id, int lnum)
 	dbg_wl("flush pending work for LEB %d:%d (%d pending works)",
 	       vol_id, lnum, ubi->works_count);
 
-	down_write(&ubi->work_sem);
 	while (found) {
 		struct ubi_work *wrk;
 		found = 0;
 
+		down_read(&ubi->work_sem);
 		spin_lock(&ubi->wl_lock);
 		list_for_each_entry(wrk, &ubi->works, list) {
 			if ((vol_id == UBI_ALL || wrk->vol_id == vol_id) &&
@@ -1277,18 +1277,27 @@ int ubi_wl_flush(struct ubi_device *ubi, int vol_id, int lnum)
 				spin_unlock(&ubi->wl_lock);
 
 				err = wrk->func(ubi, wrk, 0);
-				if (err)
-					goto out;
+				if (err) {
+					up_read(&ubi->work_sem);
+					return err;
+				}
+
 				spin_lock(&ubi->wl_lock);
 				found = 1;
 				break;
 			}
 		}
 		spin_unlock(&ubi->wl_lock);
+		up_read(&ubi->work_sem);
 	}
 
-out:
+	/*
+	 * Make sure all the works which have been done in parallel are
+	 * finished.
+	 */
+	down_write(&ubi->work_sem);
 	up_write(&ubi->work_sem);
+
 	return err;
 }
 
-- 
1.7.10
