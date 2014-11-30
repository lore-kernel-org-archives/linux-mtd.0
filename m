Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xv3U9-0005aY-Px
 for linux-mtd@lists.infradead.org; Sun, 30 Nov 2014 12:20:20 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 5/6] UBI: Fastmap: Introduce may_reserve_for_fm()
Date: Sun, 30 Nov 2014 13:19:47 +0100
Message-Id: <1417349988-9238-6-git-send-email-richard@nod.at>
In-Reply-To: <1417349988-9238-1-git-send-email-richard@nod.at>
References: <1417349988-9238-1-git-send-email-richard@nod.at>
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

...and kill another #ifdef.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap-wl.c | 19 +++++++++++++++++++
 drivers/mtd/ubi/wl.c         |  7 +------
 drivers/mtd/ubi/wl.h         |  8 ++++++++
 3 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index 88a400c..c471753 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -359,3 +359,22 @@ static void ubi_fastmap_close(struct ubi_device *ubi)
 	}
 	kfree(ubi->fm);
 }
+
+/**
+ * may_reserve_for_fm - tests whether a PEB shall be reserved for fastmap.
+ * See find_mean_wl_entry()
+ *
+ * @ubi: UBI device description object
+ * @e: physical eraseblock to return
+ * @root: RB tree to test against.
+ */
+static struct ubi_wl_entry *may_reserve_for_fm(struct ubi_device *ubi,
+					   struct ubi_wl_entry *e,
+					   struct rb_root *root) {
+	if (e && !ubi->fm_disabled && !ubi->fm &&
+	    e->pnum < UBI_FM_MAX_START)
+		e = rb_entry(rb_next(root->rb_node),
+			     struct ubi_wl_entry, u.rb);
+
+	return e;
+}
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index d84546b..c51c4e8 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -361,15 +361,10 @@ static struct ubi_wl_entry *find_mean_wl_entry(struct ubi_device *ubi,
 	if (last->ec - first->ec < WL_FREE_MAX_DIFF) {
 		e = rb_entry(root->rb_node, struct ubi_wl_entry, u.rb);
 
-#ifdef CONFIG_MTD_UBI_FASTMAP
 		/* If no fastmap has been written and this WL entry can be used
 		 * as anchor PEB, hold it back and return the second best
 		 * WL entry such that fastmap can use the anchor PEB later. */
-		if (e && !ubi->fm_disabled && !ubi->fm &&
-		    e->pnum < UBI_FM_MAX_START)
-			e = rb_entry(rb_next(root->rb_node),
-				     struct ubi_wl_entry, u.rb);
-#endif
+		e = may_reserve_for_fm(ubi, e, root);
 	} else
 		e = find_wl_entry(ubi, root, WL_FREE_MAX_DIFF/2);
 
diff --git a/drivers/mtd/ubi/wl.h b/drivers/mtd/ubi/wl.h
index 4046ccf..fbc2d8e 100644
--- a/drivers/mtd/ubi/wl.h
+++ b/drivers/mtd/ubi/wl.h
@@ -13,6 +13,9 @@ static inline void ubi_fastmap_init(struct ubi_device *ubi, int *count)
 	*count += (ubi->fm_size / ubi->leb_size) * 2;
 	INIT_WORK(&ubi->fm_work, update_fastmap_work_fn);
 }
+static struct ubi_wl_entry *may_reserve_for_fm(struct ubi_device *ubi,
+					       struct ubi_wl_entry *e,
+					       struct rb_root *root);
 #else /* !CONFIG_MTD_UBI_FASTMAP */
 static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi);
 static inline int is_fm_block(struct ubi_device *ubi, int pnum)
@@ -21,5 +24,10 @@ static inline int is_fm_block(struct ubi_device *ubi, int pnum)
 }
 static inline void ubi_fastmap_close(struct ubi_device *ubi) { }
 static inline void ubi_fastmap_init(struct ubi_device *ubi, int *count) { }
+static struct ubi_wl_entry *may_reserve_for_fm(struct ubi_device *ubi,
+					       struct ubi_wl_entry *e,
+					       struct rb_root *root) {
+	return e;
+}
 #endif /* CONFIG_MTD_UBI_FASTMAP */
 #endif /* UBI_WL_H */
-- 
1.8.4.5
