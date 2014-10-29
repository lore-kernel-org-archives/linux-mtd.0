Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjSeK-0006Sl-KI
 for linux-mtd@lists.infradead.org; Wed, 29 Oct 2014 12:46:56 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 08/35] UBI: Split __wl_get_peb()
Date: Wed, 29 Oct 2014 13:45:31 +0100
Message-Id: <1414586758-9972-9-git-send-email-richard@nod.at>
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

Make it two functions, wl_get_wle() and wl_get_peb().
wl_get_peb() works exactly like __wl_get_peb() but wl_get_wle()
does not call produce_free_peb().
While refilling the fastmap user pool we cannot release ubi->wl_lock
as produce_free_peb() does.
Hence the fastmap logic uses now wl_get_wle().

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c | 48 +++++++++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 5f8d2ff..95bb12b 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -502,7 +502,30 @@ out:
  * This function returns a physical eraseblock in case of success and a
  * negative error code in case of failure.
  */
-static int __wl_get_peb(struct ubi_device *ubi)
+static struct ubi_wl_entry *wl_get_wle(struct ubi_device *ubi)
+{
+	struct ubi_wl_entry *e;
+
+	e = find_mean_wl_entry(ubi, &ubi->free);
+	if (!e) {
+		ubi_err("no free eraseblocks");
+		return NULL;
+	}
+
+	self_check_in_wl_tree(ubi, e, &ubi->free);
+
+	/*
+	 * Move the physical eraseblock to the protection queue where it will
+	 * be protected from being moved for some time.
+	 */
+	rb_erase(&e->u.rb, &ubi->free);
+	ubi->free_count--;
+	dbg_wl("PEB %d EC %d", e->pnum, e->ec);
+
+	return e;
+}
+
+static int wl_get_peb(struct ubi_device *ubi)
 {
 	int err;
 	struct ubi_wl_entry *e;
@@ -519,29 +542,12 @@ retry:
 		if (err < 0)
 			return err;
 		goto retry;
-	}
 
-	e = find_mean_wl_entry(ubi, &ubi->free);
-	if (!e) {
-		ubi_err("no free eraseblocks");
-		return -ENOSPC;
 	}
 
-	self_check_in_wl_tree(ubi, e, &ubi->free);
-
-	/*
-	 * Move the physical eraseblock to the protection queue where it will
-	 * be protected from being moved for some time.
-	 */
-	rb_erase(&e->u.rb, &ubi->free);
-	ubi->free_count--;
-	dbg_wl("PEB %d EC %d", e->pnum, e->ec);
-#ifndef CONFIG_MTD_UBI_FASTMAP
-	/* We have to enqueue e only if fastmap is disabled,
-	 * is fastmap enabled prot_queue_add() will be called by
-	 * ubi_wl_get_peb() after removing e from the pool. */
+	e = wl_get_wle(ubi);
 	prot_queue_add(ubi, e);
-#endif
+
 	return e->pnum;
 }
 
@@ -699,7 +705,7 @@ int ubi_wl_get_peb(struct ubi_device *ubi)
 	int peb, err;
 
 	spin_lock(&ubi->wl_lock);
-	peb = __wl_get_peb(ubi);
+	peb = wl_get_peb(ubi);
 	spin_unlock(&ubi->wl_lock);
 
 	if (peb < 0)
-- 
1.8.4.5
