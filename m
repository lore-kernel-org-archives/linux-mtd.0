Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZuTTH-0005I2-DR
 for linux-mtd@lists.infradead.org; Thu, 05 Nov 2015 22:57:33 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, alex@nextthing.co,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 1/5] UBI: Introduce prepare_erase_work()
Date: Thu,  5 Nov 2015 23:56:53 +0100
Message-Id: <1446764217-15021-2-git-send-email-richard@nod.at>
In-Reply-To: <1446764217-15021-1-git-send-email-richard@nod.at>
References: <1446764217-15021-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Split ubi_work creation and scheduling code such that
we can re-use the creation code where we schedule ubi work
on our own.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c | 40 +++++++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index eb4489f9..beaf3c4 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -569,29 +569,26 @@ static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
 			int shutdown);
 
 /**
- * schedule_erase - schedule an erase work.
+ * prepare_erase_work - prepare an erase work.
  * @ubi: UBI device description object
  * @e: the WL entry of the physical eraseblock to erase
  * @vol_id: the volume ID that last used this PEB
  * @lnum: the last used logical eraseblock number for the PEB
  * @torture: if the physical eraseblock has to be tortured
  *
- * This function returns zero in case of success and a %-ENOMEM in case of
- * failure.
+ * This function returns a struct ubi_work in case of success
+ * and an ERR_PTR(%-ENOMEM) in case of failure.
  */
-static int schedule_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
-			  int vol_id, int lnum, int torture)
+static struct ubi_work *prepare_erase_work(struct ubi_wl_entry *e, int vol_id,
+					   int lnum, int torture)
 {
 	struct ubi_work *wl_wrk;
 
 	ubi_assert(e);
 
-	dbg_wl("schedule erasure of PEB %d, EC %d, torture %d",
-	       e->pnum, e->ec, torture);
-
 	wl_wrk = kmalloc(sizeof(struct ubi_work), GFP_NOFS);
 	if (!wl_wrk)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	wl_wrk->func = &erase_worker;
 	wl_wrk->e = e;
@@ -599,6 +596,31 @@ static int schedule_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
 	wl_wrk->lnum = lnum;
 	wl_wrk->torture = torture;
 
+	return wl_wrk;
+}
+
+/**
+ * schedule_erase - schedule an erase work.
+ * @ubi: UBI device description object
+ * @e: the WL entry of the physical eraseblock to erase
+ * @vol_id: the volume ID that last used this PEB
+ * @lnum: the last used logical eraseblock number for the PEB
+ * @torture: if the physical eraseblock has to be tortured
+ *
+ * This function returns zero in case of success and a %-ENOMEM in case of
+ * failure.
+ */
+static int schedule_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
+			  int vol_id, int lnum, int torture)
+{
+	struct ubi_work *wl_wrk = prepare_erase_work(e, vol_id, lnum, torture);
+
+	dbg_wl("schedule erasure of PEB %d, EC %d, torture %d",
+	       e->pnum, e->ec, torture);
+
+	if (IS_ERR(wl_wrk))
+		return PTR_ERR(wl_wrk);
+
 	schedule_ubi_work(ubi, wl_wrk);
 	return 0;
 }
-- 
1.8.4.5
