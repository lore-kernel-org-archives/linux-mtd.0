Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YcC69-0003RT-JY
 for linux-mtd@lists.infradead.org; Sun, 29 Mar 2015 12:13:51 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/4] UBI: Introduce prepare_erase_work()
Date: Sun, 29 Mar 2015 14:13:15 +0200
Message-Id: <1427631197-23610-3-git-send-email-richard@nod.at>
In-Reply-To: <1427631197-23610-1-git-send-email-richard@nod.at>
References: <1427631197-23610-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, boris.brezillon@free-electrons.com,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
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
index cefc767..13594e9 100644
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
