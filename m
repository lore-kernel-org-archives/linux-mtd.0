Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xsta5-0008Gc-76
 for linux-mtd@lists.infradead.org; Mon, 24 Nov 2014 13:21:31 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 6/6] UBI: Fastmap: Make ubi_refill_pools() fair
Date: Mon, 24 Nov 2014 14:20:36 +0100
Message-Id: <1416835236-25185-7-git-send-email-richard@nod.at>
In-Reply-To: <1416835236-25185-1-git-send-email-richard@nod.at>
References: <1416835236-25185-1-git-send-email-richard@nod.at>
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

Currently ubi_refill_pools() first fills the first and then
the second one.
If only very few free PEBs are available the second pool can get
zero PEBs.
Change ubi_refill_pools() to distribute free PEBs fair between
all pools.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c | 77 +++++++++++++++++++++++++++-------------------------
 1 file changed, 40 insertions(+), 37 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index f028b68..c2822f7 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -583,59 +583,62 @@ static void return_unused_pool_pebs(struct ubi_device *ubi,
 }
 
 /**
- * refill_wl_pool - refills all the fastmap pool used by the
- * WL sub-system.
+ * ubi_refill_pools - refills all fastmap PEB pools.
  * @ubi: UBI device description object
  */
-static void refill_wl_pool(struct ubi_device *ubi)
+void ubi_refill_pools(struct ubi_device *ubi)
 {
+	struct ubi_fm_pool *wl_pool = &ubi->fm_wl_pool;
+	struct ubi_fm_pool *pool = &ubi->fm_pool;
 	struct ubi_wl_entry *e;
-	struct ubi_fm_pool *pool = &ubi->fm_wl_pool;
+	int enough;
 
+	spin_lock(&ubi->wl_lock);
+
+	return_unused_pool_pebs(ubi, wl_pool);
 	return_unused_pool_pebs(ubi, pool);
 
-	for (pool->size = 0; pool->size < pool->max_size; pool->size++) {
-		if (!ubi->free.rb_node ||
-		   (ubi->free_count - ubi->beb_rsvd_pebs < 5))
-			break;
+	wl_pool->size = 0;
+	pool->size = 0;
 
-		e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
-		self_check_in_wl_tree(ubi, e, &ubi->free);
-		rb_erase(&e->u.rb, &ubi->free);
-		ubi->free_count--;
+	for (;;) {
+		enough = 0;
+		if (pool->size < pool->max_size) {
+			if (!ubi->free.rb_node ||
+			   (ubi->free_count - ubi->beb_rsvd_pebs < 5))
+				break;
 
-		pool->pebs[pool->size] = e->pnum;
-	}
-	pool->used = 0;
-}
+			e = wl_get_wle(ubi);
+			if (!e)
+				break;
 
-/**
- * refill_wl_user_pool - refills all the fastmap pool used by ubi_wl_get_peb.
- * @ubi: UBI device description object
- */
-static void refill_wl_user_pool(struct ubi_device *ubi)
-{
-	struct ubi_fm_pool *pool = &ubi->fm_pool;
+			pool->pebs[pool->size] = e->pnum;
+			pool->size++;
+		} else
+			enough++;
 
-	return_unused_pool_pebs(ubi, pool);
+		if (wl_pool->size < wl_pool->max_size) {
+			if (!ubi->free.rb_node ||
+			   (ubi->free_count - ubi->beb_rsvd_pebs < 5))
+				break;
 
-	for (pool->size = 0; pool->size < pool->max_size; pool->size++) {
-		pool->pebs[pool->size] = __wl_get_peb(ubi);
-		if (pool->pebs[pool->size] < 0)
+			e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
+			self_check_in_wl_tree(ubi, e, &ubi->free);
+			rb_erase(&e->u.rb, &ubi->free);
+			ubi->free_count--;
+
+			wl_pool->pebs[wl_pool->size] = e->pnum;
+			wl_pool->size++;
+		} else
+			enough++;
+
+		if (enough == 2)
 			break;
 	}
+
+	wl_pool->used = 0;
 	pool->used = 0;
-}
 
-/**
- * ubi_refill_pools - refills all fastmap PEB pools.
- * @ubi: UBI device description object
- */
-void ubi_refill_pools(struct ubi_device *ubi)
-{
-	spin_lock(&ubi->wl_lock);
-	refill_wl_pool(ubi);
-	refill_wl_user_pool(ubi);
 	spin_unlock(&ubi->wl_lock);
 }
 
-- 
1.8.4.5
