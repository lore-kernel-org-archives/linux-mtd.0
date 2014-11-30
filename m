Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xv3Pv-0002QO-Ln
 for linux-mtd@lists.infradead.org; Sun, 30 Nov 2014 12:15:58 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 3/6] UBI: Fix stale pointers in ubi->lookuptbl
Date: Sun, 30 Nov 2014 13:15:25 +0100
Message-Id: <1417349728-9070-4-git-send-email-richard@nod.at>
In-Reply-To: <1417349728-9070-1-git-send-email-richard@nod.at>
References: <1417349728-9070-1-git-send-email-richard@nod.at>
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

In some error paths the WL sub-system gives up on a PEB
and frees it's ubi_wl_entry struct but does not set
the entry in ubi->lookuptbl to NULL.
Fastmap can stumble over such a stale pointer as it uses
ubi->lookuptbl to find all PEBs.

Fix this by introducing a new helper function which free()s
a WL entry and removes the reference from the lookup table.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c | 47 +++++++++++++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 4565419..b122bdb 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -216,6 +216,20 @@ static void wl_tree_add(struct ubi_wl_entry *e, struct rb_root *root)
 }
 
 /**
+ * wl_tree_destroy - destroy a wear-leveling entry.
+ * @ubi: UBI device description object
+ * @e: the wear-leveling entry to add
+ *
+ * This function destroys a wear leveling entry and removes
+ * the reference from the lookup table.
+ */
+static void wl_entry_destroy(struct ubi_device *ubi, struct ubi_wl_entry *e)
+{
+	ubi->lookuptbl[e->pnum] = NULL;
+	kmem_cache_free(ubi_wl_entry_slab, e);
+}
+
+/**
  * do_work - do one pending work.
  * @ubi: UBI device description object
  *
@@ -1261,7 +1275,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 	err = do_sync_erase(ubi, e1, vol_id, lnum, 0);
 	if (err) {
 		if (e2)
-			kmem_cache_free(ubi_wl_entry_slab, e2);
+			wl_entry_destroy(ubi, e2);
 		goto out_ro;
 	}
 
@@ -1329,8 +1343,8 @@ out_error:
 	spin_unlock(&ubi->wl_lock);
 
 	ubi_free_vid_hdr(ubi, vid_hdr);
-	kmem_cache_free(ubi_wl_entry_slab, e1);
-	kmem_cache_free(ubi_wl_entry_slab, e2);
+	wl_entry_destroy(ubi, e1);
+	wl_entry_destroy(ubi, e2);
 
 out_ro:
 	ubi_ro_mode(ubi);
@@ -1472,7 +1486,7 @@ static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
 	if (shutdown) {
 		dbg_wl("cancel erasure of PEB %d EC %d", pnum, e->ec);
 		kfree(wl_wrk);
-		kmem_cache_free(ubi_wl_entry_slab, e);
+		wl_entry_destroy(ubi, e);
 		return 0;
 	}
 
@@ -1518,7 +1532,7 @@ static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
 		return err;
 	}
 
-	kmem_cache_free(ubi_wl_entry_slab, e);
+	wl_entry_destroy(ubi, e);
 	if (err != -EIO)
 		/*
 		 * If this is not %-EIO, we have no idea what to do. Scheduling
@@ -1810,9 +1824,10 @@ int ubi_wl_flush(struct ubi_device *ubi, int vol_id, int lnum)
 
 /**
  * tree_destroy - destroy an RB-tree.
+ * @ubi: UBI device description object
  * @root: the root of the tree to destroy
  */
-static void tree_destroy(struct rb_root *root)
+static void tree_destroy(struct ubi_device *ubi, struct rb_root *root)
 {
 	struct rb_node *rb;
 	struct ubi_wl_entry *e;
@@ -1834,7 +1849,7 @@ static void tree_destroy(struct rb_root *root)
 					rb->rb_right = NULL;
 			}
 
-			kmem_cache_free(ubi_wl_entry_slab, e);
+			wl_entry_destroy(ubi, e);
 		}
 	}
 }
@@ -1965,7 +1980,7 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		ubi_assert(!ubi_is_fm_block(ubi, e->pnum));
 		ubi->lookuptbl[e->pnum] = e;
 		if (schedule_erase(ubi, e, aeb->vol_id, aeb->lnum, 0)) {
-			kmem_cache_free(ubi_wl_entry_slab, e);
+			wl_entry_destroy(ubi, e);
 			goto out_free;
 		}
 
@@ -2059,9 +2074,9 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 
 out_free:
 	shutdown_work(ubi);
-	tree_destroy(&ubi->used);
-	tree_destroy(&ubi->free);
-	tree_destroy(&ubi->scrub);
+	tree_destroy(ubi, &ubi->used);
+	tree_destroy(ubi, &ubi->free);
+	tree_destroy(ubi, &ubi->scrub);
 	kfree(ubi->lookuptbl);
 	return err;
 }
@@ -2078,7 +2093,7 @@ static void protection_queue_destroy(struct ubi_device *ubi)
 	for (i = 0; i < UBI_PROT_QUEUE_LEN; ++i) {
 		list_for_each_entry_safe(e, tmp, &ubi->pq[i], u.list) {
 			list_del(&e->u.list);
-			kmem_cache_free(ubi_wl_entry_slab, e);
+			wl_entry_destroy(ubi, e);
 		}
 	}
 }
@@ -2110,10 +2125,10 @@ void ubi_wl_close(struct ubi_device *ubi)
 	ubi_fastmap_close(ubi);
 	shutdown_work(ubi);
 	protection_queue_destroy(ubi);
-	tree_destroy(&ubi->used);
-	tree_destroy(&ubi->erroneous);
-	tree_destroy(&ubi->free);
-	tree_destroy(&ubi->scrub);
+	tree_destroy(ubi, &ubi->used);
+	tree_destroy(ubi, &ubi->erroneous);
+	tree_destroy(ubi, &ubi->free);
+	tree_destroy(ubi, &ubi->scrub);
 	kfree(ubi->lookuptbl);
 }
 
-- 
1.8.4.5
