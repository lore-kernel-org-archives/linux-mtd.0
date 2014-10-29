Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjSeK-0006Sm-Jv
 for linux-mtd@lists.infradead.org; Wed, 29 Oct 2014 12:46:55 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 07/35] UBI: Fastmap: Fix races in ubi_wl_get_peb()
Date: Wed, 29 Oct 2014 13:45:30 +0100
Message-Id: <1414586758-9972-8-git-send-email-richard@nod.at>
In-Reply-To: <1414586758-9972-1-git-send-email-richard@nod.at>
References: <1414586758-9972-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, tlinder@codeaurora.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ubi_wl_get_peb() has two problems, it reads the pool
size and usage counters without any protection.
While reading one value would be perfectly fine it reads multiple
values and compares them. This is racy and can lead to incorrect
pool handling.
Furthermore ubi_update_fastmap() is called without wl_lock held,
before incrementing the used counter it needs to be checked again.
It could happen that another thread consumed all PEBs from the
pool and the counter goes beyond ->size.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index a06e31e..5f8d2ff 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -626,24 +626,34 @@ void ubi_refill_pools(struct ubi_device *ubi)
  */
 int ubi_wl_get_peb(struct ubi_device *ubi)
 {
-	int ret;
+	int ret, retried = 0;
 	struct ubi_fm_pool *pool = &ubi->fm_pool;
 	struct ubi_fm_pool *wl_pool = &ubi->fm_wl_pool;
 
-	if (!pool->size || !wl_pool->size || pool->used == pool->size ||
-	    wl_pool->used == wl_pool->size)
+again:
+	spin_lock(&ubi->wl_lock);
+	if (!pool->size || !wl_pool->size || pool->used >= pool->size ||
+	    wl_pool->used >= wl_pool->size) {
+		spin_unlock(&ubi->wl_lock);
 		ubi_update_fastmap(ubi);
-
-	/* we got not a single free PEB */
-	if (!pool->size)
-		ret = -ENOSPC;
-	else {
 		spin_lock(&ubi->wl_lock);
-		ret = pool->pebs[pool->used++];
-		prot_queue_add(ubi, ubi->lookuptbl[ret]);
+	}
+
+	if (pool->used >= pool->size || !pool->size) {
 		spin_unlock(&ubi->wl_lock);
+		if (retried) {
+			ubi_err("Unable to get a free PEB from user WL pool");
+			ret = -ENOSPC;
+			goto out;
+		}
+		retried = 1;
+		goto again;
 	}
 
+	ret = pool->pebs[pool->used++];
+	prot_queue_add(ubi, ubi->lookuptbl[ret]);
+	spin_unlock(&ubi->wl_lock);
+out:
 	return ret;
 }
 
-- 
1.8.4.5
