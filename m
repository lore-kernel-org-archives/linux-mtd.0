Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XBJ0Y-0004tI-NC
 for linux-mtd@lists.infradead.org; Sun, 27 Jul 2014 07:36:39 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH] UBI: ubi_wl_flush(): Use list_for_each_entry_safe()
Date: Sun, 27 Jul 2014 09:35:48 +0200
Message-Id: <1406446548-5790-1-git-send-email-richard@nod.at>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use the _safe variant because we're iterating over
a list where items get deleted and freed.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 0f3425d..20f491713 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1718,12 +1718,12 @@ int ubi_wl_flush(struct ubi_device *ubi, int vol_id, int lnum)
 	       vol_id, lnum, ubi->works_count);
 
 	while (found) {
-		struct ubi_work *wrk;
+		struct ubi_work *wrk, *tmp;
 		found = 0;
 
 		down_read(&ubi->work_sem);
 		spin_lock(&ubi->wl_lock);
-		list_for_each_entry(wrk, &ubi->works, list) {
+		list_for_each_entry_safe(wrk, tmp, &ubi->works, list) {
 			if ((vol_id == UBI_ALL || wrk->vol_id == vol_id) &&
 			    (lnum == UBI_ALL || wrk->lnum == lnum)) {
 				list_del(&wrk->list);
-- 
2.0.1
