Received: from [202.202.0.36] (helo=cqu.edu.cn)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KJ4Zi-0000B1-Dx
	for linux-mtd@lists.infradead.org; Wed, 16 Jul 2008 10:49:36 +0000
Message-ID: <416205113.03852@cqu.edu.cn>
Subject: [PATCH][UBI]:Remove the prot tree from the WL unit
From: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Jul 2008 18:49:07 +0800
Message-Id: <1216205347.2782.63.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

This is the patch you asked for.
Only the prot tree and a few comments were modified.
Please check it. and I'll test it a bit later.

>From 3df5422ade6d77cfa763ca0e1e8374b984982fee Mon Sep 17 00:00:00 2001
From: XiaoChuan-Xu <xiaochuan-xu@cqu.edu.cn>
Date: Wed, 16 Jul 2008 18:12:13 +0800
Subject: [PATCH] Remove the prot tree from the WL unit

Signed-off-by: XiaoChuan-Xu <xiaochuan-xu@cqu.edu.cn>
---
 drivers/mtd/ubi/ubi.h |    9 +--
 drivers/mtd/ubi/wl.c  |  295 ++-----------------------------------------------
 2 files changed, 13 insertions(+), 291 deletions(-)

diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 940f6b7..8d61247 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -286,10 +286,7 @@ struct ubi_wl_entry;
  * @used: RB-tree of used physical eraseblocks
  * @free: RB-tree of free physical eraseblocks
  * @scrub: RB-tree of physical eraseblocks which need scrubbing
- * @prot: protection trees
- * @prot.pnum: protection tree indexed by physical eraseblock numbers
- * @prot.aec: protection tree indexed by absolute erase counter value
- * @wl_lock: protects the @used, @free, @prot, @lookuptbl, @abs_ec, @move_from,
+ * @wl_lock: protects the @used, @free, @lookuptbl, @abs_ec, @move_from,
  *           @move_to, @move_to_put @erase_pending, @wl_scheduled, and @works
  *           fields
  * @move_mutex: serializes eraseblock moves
@@ -369,10 +366,6 @@ struct ubi_device {
 	struct rb_root used;
 	struct rb_root free;
 	struct rb_root scrub;
-	struct {
-		struct rb_root pnum;
-		struct rb_root aec;
-	} prot;
 	spinlock_t wl_lock;
 	struct mutex move_mutex;
 	struct rw_semaphore work_sem;
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index cc8fe29..bdac635 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -54,8 +54,7 @@
  *
  * As it was said, for the UBI unit all physical eraseblocks are either "free"
  * or "used". Free eraseblock are kept in the @wl->free RB-tree, while used
- * eraseblocks are kept in a set of different RB-trees: @wl->used,
- * @wl->prot.pnum, @wl->prot.aec, and @wl->scrub.
+ * eraseblocks are kept in the @wl->used.
  *
  * Note, in this implementation, we keep a small in-RAM object for each physical
  * eraseblock. This is surely not a scalable solution. But it appears to be good
@@ -83,14 +82,6 @@
 #define WL_RESERVED_PEBS 1
 
 /*
- * How many erase cycles are short term, unknown, and long term physical
- * eraseblocks protected.
- */
-#define ST_PROTECTION 16
-#define U_PROTECTION  10
-#define LT_PROTECTION 4
-
-/*
  * Maximum difference between two erase counters. If this threshold is
  * exceeded, the WL unit starts moving data from used physical eraseblocks with
  * low erase counter to free physical eraseblocks with high erase counter.
@@ -117,60 +108,6 @@
 #define WL_MAX_FAILURES 32
 
 /**
- * struct ubi_wl_prot_entry - PEB protection entry.
- * @rb_pnum: link in the @wl->prot.pnum RB-tree
- * @rb_aec: link in the @wl->prot.aec RB-tree
- * @abs_ec: the absolute erase counter value when the protection ends
- * @e: the wear-leveling entry of the physical eraseblock under protection
- *
- * When the WL unit returns a physical eraseblock, the physical eraseblock is
- * protected from being moved for some "time". For this reason, the physical
- * eraseblock is not directly moved from the @wl->free tree to the @wl->used
- * tree. There is one more tree in between where this physical eraseblock is
- * temporarily stored (@wl->prot).
- *
- * All this protection stuff is needed because:
- *  o we don't want to move physical eraseblocks just after we have given them
- *    to the user; instead, we first want to let users fill them up with data;
- *
- *  o there is a chance that the user will put the physical eraseblock very
- *    soon, so it makes sense not to move it for some time, but wait; this is
- *    especially important in case of "short term" physical eraseblocks.
- *
- * Physical eraseblocks stay protected only for limited time. But the "time" is
- * measured in erase cycles in this case. This is implemented with help of the
- * absolute erase counter (@wl->abs_ec). When it reaches certain value, the
- * physical eraseblocks are moved from the protection trees (@wl->prot.*) to
- * the @wl->used tree.
- *
- * Protected physical eraseblocks are searched by physical eraseblock number
- * (when they are put) and by the absolute erase counter (to check if it is
- * time to move them to the @wl->used tree). So there are actually 2 RB-trees
- * storing the protected physical eraseblocks: @wl->prot.pnum and
- * @wl->prot.aec. They are referred to as the "protection" trees. The
- * first one is indexed by the physical eraseblock number. The second one is
- * indexed by the absolute erase counter. Both trees store
- * &struct ubi_wl_prot_entry objects.
- *
- * Each physical eraseblock has 2 main states: free and used. The former state
- * corresponds to the @wl->free tree. The latter state is split up on several
- * sub-states:
- * o the WL movement is allowed (@wl->used tree);
- * o the WL movement is temporarily prohibited (@wl->prot.pnum and
- * @wl->prot.aec trees);
- * o scrubbing is needed (@wl->scrub tree).
- *
- * Depending on the sub-state, wear-leveling entries of the used physical
- * eraseblocks may be kept in one of those trees.
- */
-struct ubi_wl_prot_entry {
-	struct rb_node rb_pnum;
-	struct rb_node rb_aec;
-	unsigned long long abs_ec;
-	struct ubi_wl_entry *e;
-};
-
-/**
  * struct ubi_work - UBI work description data structure.
  * @list: a link in the list of pending works
  * @func: worker function
@@ -353,53 +290,6 @@ static int in_wl_tree(struct ubi_wl_entry *e, struct rb_root *root)
 }
 
 /**
- * prot_tree_add - add physical eraseblock to protection trees.
- * @ubi: UBI device description object
- * @e: the physical eraseblock to add
- * @pe: protection entry object to use
- * @abs_ec: absolute erase counter value when this physical eraseblock has
- * to be removed from the protection trees.
- *
- * @wl->lock has to be locked.
- */
-static void prot_tree_add(struct ubi_device *ubi, struct ubi_wl_entry *e,
-			  struct ubi_wl_prot_entry *pe, int abs_ec)
-{
-	struct rb_node **p, *parent = NULL;
-	struct ubi_wl_prot_entry *pe1;
-
-	pe->e = e;
-	pe->abs_ec = ubi->abs_ec + abs_ec;
-
-	p = &ubi->prot.pnum.rb_node;
-	while (*p) {
-		parent = *p;
-		pe1 = rb_entry(parent, struct ubi_wl_prot_entry, rb_pnum);
-
-		if (e->pnum < pe1->e->pnum)
-			p = &(*p)->rb_left;
-		else
-			p = &(*p)->rb_right;
-	}
-	rb_link_node(&pe->rb_pnum, parent, p);
-	rb_insert_color(&pe->rb_pnum, &ubi->prot.pnum);
-
-	p = &ubi->prot.aec.rb_node;
-	parent = NULL;
-	while (*p) {
-		parent = *p;
-		pe1 = rb_entry(parent, struct ubi_wl_prot_entry, rb_aec);
-
-		if (pe->abs_ec < pe1->abs_ec)
-			p = &(*p)->rb_left;
-		else
-			p = &(*p)->rb_right;
-	}
-	rb_link_node(&pe->rb_aec, parent, p);
-	rb_insert_color(&pe->rb_aec, &ubi->prot.aec);
-}
-
-/**
  * find_wl_entry - find wear-leveling entry closest to certain erase counter.
  * @root: the RB-tree where to look for
  * @max: highest possible erase counter
@@ -441,17 +331,12 @@ static struct ubi_wl_entry *find_wl_entry(struct rb_root *root, int max)
  */
 int ubi_wl_get_peb(struct ubi_device *ubi, int dtype)
 {
-	int err, protect, medium_ec;
+	int err, medium_ec;
 	struct ubi_wl_entry *e, *first, *last;
-	struct ubi_wl_prot_entry *pe;
 
 	ubi_assert(dtype == UBI_LONGTERM || dtype == UBI_SHORTTERM ||
 		   dtype == UBI_UNKNOWN);
 
-	pe = kmalloc(sizeof(struct ubi_wl_prot_entry), GFP_NOFS);
-	if (!pe)
-		return -ENOMEM;
-
 retry:
 	spin_lock(&ubi->wl_lock);
 	if (!ubi->free.rb_node) {
@@ -481,7 +366,6 @@ retry:
 			 * erase counter plus %WL_FREE_MAX_DIFF.
 			 */
 			e = find_wl_entry(&ubi->free, WL_FREE_MAX_DIFF);
-			protect = LT_PROTECTION;
 			break;
 		case UBI_UNKNOWN:
 			/*
@@ -503,7 +387,6 @@ retry:
 				medium_ec = (first->ec + WL_FREE_MAX_DIFF)/2;
 				e = find_wl_entry(&ubi->free, medium_ec);
 			}
-			protect = U_PROTECTION;
 			break;
 		case UBI_SHORTTERM:
 			/*
@@ -513,67 +396,26 @@ retry:
 			 */
 			e = rb_entry(rb_first(&ubi->free),
 				     struct ubi_wl_entry, rb);
-			protect = ST_PROTECTION;
 			break;
 		default:
-			protect = 0;
 			e = NULL;
 			BUG();
 	}
 
 	/*
-	 * Move the physical eraseblock to the protection trees where it will
-	 * be protected from being moved for some time.
+	 * Move the physical eraseblock to the used tree.
 	 */
 	paranoid_check_in_wl_tree(e, &ubi->free);
 	rb_erase(&e->rb, &ubi->free);
-	prot_tree_add(ubi, e, pe, protect);
+	wl_tree_add(e, &ubi->used);
 
-	dbg_wl("PEB %d EC %d, protection %d", e->pnum, e->ec, protect);
+	dbg_wl("get PEB %d EC %d", e->pnum, e->ec);
 	spin_unlock(&ubi->wl_lock);
 
 	return e->pnum;
 }
 
 /**
- * prot_tree_del - remove a physical eraseblock from the protection trees
- * @ubi: UBI device description object
- * @pnum: the physical eraseblock to remove
- *
- * This function returns PEB @pnum from the protection trees and returns zero
- * in case of success and %-ENODEV if the PEB was not found in the protection
- * trees.
- */
-static int prot_tree_del(struct ubi_device *ubi, int pnum)
-{
-	struct rb_node *p;
-	struct ubi_wl_prot_entry *pe = NULL;
-
-	p = ubi->prot.pnum.rb_node;
-	while (p) {
-
-		pe = rb_entry(p, struct ubi_wl_prot_entry, rb_pnum);
-
-		if (pnum == pe->e->pnum)
-			goto found;
-
-		if (pnum < pe->e->pnum)
-			p = p->rb_left;
-		else
-			p = p->rb_right;
-	}
-
-	return -ENODEV;
-
-found:
-	ubi_assert(pe->e->pnum == pnum);
-	rb_erase(&pe->rb_aec, &ubi->prot.aec);
-	rb_erase(&pe->rb_pnum, &ubi->prot.pnum);
-	kfree(pe);
-	return 0;
-}
-
-/**
  * sync_erase - synchronously erase a physical eraseblock.
  * @ubi: UBI device description object
  * @e: the the physical eraseblock to erase
@@ -634,51 +476,6 @@ out_free:
 }
 
 /**
- * check_protection_over - check if it is time to stop protecting some
- * physical eraseblocks.
- * @ubi: UBI device description object
- *
- * This function is called after each erase operation, when the absolute erase
- * counter is incremented, to check if some physical eraseblock  have not to be
- * protected any longer. These physical eraseblocks are moved from the
- * protection trees to the used tree.
- */
-static void check_protection_over(struct ubi_device *ubi)
-{
-	struct ubi_wl_prot_entry *pe;
-
-	/*
-	 * There may be several protected physical eraseblock to remove,
-	 * process them all.
-	 */
-	while (1) {
-		spin_lock(&ubi->wl_lock);
-		if (!ubi->prot.aec.rb_node) {
-			spin_unlock(&ubi->wl_lock);
-			break;
-		}
-
-		pe = rb_entry(rb_first(&ubi->prot.aec),
-			      struct ubi_wl_prot_entry, rb_aec);
-
-		if (pe->abs_ec > ubi->abs_ec) {
-			spin_unlock(&ubi->wl_lock);
-			break;
-		}
-
-		dbg_wl("PEB %d protection over, abs_ec %llu, PEB abs_ec %llu",
-		       pe->e->pnum, ubi->abs_ec, pe->abs_ec);
-		rb_erase(&pe->rb_aec, &ubi->prot.aec);
-		rb_erase(&pe->rb_pnum, &ubi->prot.pnum);
-		wl_tree_add(pe->e, &ubi->used);
-		spin_unlock(&ubi->wl_lock);
-
-		kfree(pe);
-		cond_resched();
-	}
-}
-
-/**
  * schedule_ubi_work - schedule a work.
  * @ubi: UBI device description object
  * @wrk: the work to schedule
@@ -743,7 +540,6 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 				int cancel)
 {
 	int err, put = 0, scrubbing = 0, protect = 0;
-	struct ubi_wl_prot_entry *uninitialized_var(pe);
 	struct ubi_wl_entry *e1, *e2;
 	struct ubi_vid_hdr *vid_hdr;
 
@@ -768,10 +564,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 		 * the queue to be erased. Cancel movement - it will be
 		 * triggered again when a free physical eraseblock appears.
 		 *
-		 * No used physical eraseblocks? They must be temporarily
-		 * protected from being moved. They will be moved to the
-		 * @ubi->used tree later and the wear-leveling will be
-		 * triggered again.
+		 * No used physical eraseblocks?. cancel this wl worker.
 		 */
 		dbg_wl("cancel WL, a list is empty: free %d, used %d",
 		       !ubi->free.rb_node, !ubi->used.rb_node);
@@ -855,25 +648,17 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 
 		/*
 		 * For some reason the LEB was not moved - it might be because
-		 * the volume is being deleted. We should prevent this PEB from
-		 * being selected for wear-levelling movement for some "time",
-		 * so put it to the protection tree.
+		 * the volume is being deleted. Nothing we can do but insert
+		 * this PEB back to used tree.
 		 */
 
 		dbg_wl("cancelled moving PEB %d", e1->pnum);
-		pe = kmalloc(sizeof(struct ubi_wl_prot_entry), GFP_NOFS);
-		if (!pe) {
-			err = -ENOMEM;
-			goto out_error;
-		}
 
 		protect = 1;
 	}
 
 	ubi_free_vid_hdr(ubi, vid_hdr);
 	spin_lock(&ubi->wl_lock);
-	if (protect)
-		prot_tree_add(ubi, e1, pe, protect);
 	if (!ubi->move_to_put)
 		wl_tree_add(e2, &ubi->used);
 	else
@@ -897,8 +682,8 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 		err = schedule_erase(ubi, e1, 0);
 		if (err)
 			goto out_error;
-	}
-
+	} else
+		wl_tree_add(e1, &ubi->used);
 
 	dbg_wl("done");
 	mutex_unlock(&ubi->move_mutex);
@@ -1053,13 +838,9 @@ static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
 		wl_tree_add(e, &ubi->free);
 		spin_unlock(&ubi->wl_lock);
 
-		/*
-		 * One more erase operation has happened, take care about protected
-		 * physical eraseblocks.
+		/* One more erase operation has happened,
+		 * take care about wear-leveling
 		 */
-		check_protection_over(ubi);
-
-		/* And take care about wear-leveling */
 		err = ensure_wear_leveling(ubi);
 		return err;
 	}
@@ -1193,14 +974,6 @@ retry:
 		} else if (in_wl_tree(e, &ubi->scrub)) {
 			paranoid_check_in_wl_tree(e, &ubi->scrub);
 			rb_erase(&e->rb, &ubi->scrub);
-		} else {
-			err = prot_tree_del(ubi, e->pnum);
-			if (err) {
-				ubi_err("PEB %d not found", pnum);
-				ubi_ro_mode(ubi);
-				spin_unlock(&ubi->wl_lock);
-				return err;
-			}
 		}
 	}
 	spin_unlock(&ubi->wl_lock);
@@ -1255,16 +1028,6 @@ retry:
 	if (in_wl_tree(e, &ubi->used)) {
 		paranoid_check_in_wl_tree(e, &ubi->used);
 		rb_erase(&e->rb, &ubi->used);
-	} else {
-		int err;
-
-		err = prot_tree_del(ubi, e->pnum);
-		if (err) {
-			ubi_err("PEB %d not found", pnum);
-			ubi_ro_mode(ubi);
-			spin_unlock(&ubi->wl_lock);
-			return err;
-		}
 	}
 
 	wl_tree_add(e, &ubi->scrub);
@@ -1443,7 +1206,6 @@ int ubi_wl_init_scan(struct ubi_device *ubi, struct ubi_scan_info *si)
 
 
 	ubi->used = ubi->free = ubi->scrub = RB_ROOT;
-	ubi->prot.pnum = ubi->prot.aec = RB_ROOT;
 	spin_lock_init(&ubi->wl_lock);
 	mutex_init(&ubi->move_mutex);
 	init_rwsem(&ubi->work_sem);
@@ -1551,38 +1313,6 @@ out_free:
 }
 
 /**
- * protection_trees_destroy - destroy the protection RB-trees.
- * @ubi: UBI device description object
- */
-static void protection_trees_destroy(struct ubi_device *ubi)
-{
-	struct rb_node *rb;
-	struct ubi_wl_prot_entry *pe;
-
-	rb = ubi->prot.aec.rb_node;
-	while (rb) {
-		if (rb->rb_left)
-			rb = rb->rb_left;
-		else if (rb->rb_right)
-			rb = rb->rb_right;
-		else {
-			pe = rb_entry(rb, struct ubi_wl_prot_entry, rb_aec);
-
-			rb = rb_parent(rb);
-			if (rb) {
-				if (rb->rb_left == &pe->rb_aec)
-					rb->rb_left = NULL;
-				else
-					rb->rb_right = NULL;
-			}
-
-			kmem_cache_free(ubi_wl_entry_slab, pe->e);
-			kfree(pe);
-		}
-	}
-}
-
-/**
  * ubi_wl_close - close the wear-leveling unit.
  * @ubi: UBI device description object
  */
@@ -1591,7 +1321,6 @@ void ubi_wl_close(struct ubi_device *ubi)
 	dbg_wl("close the UBI wear-leveling unit");
 
 	cancel_pending(ubi);
-	protection_trees_destroy(ubi);
 	tree_destroy(&ubi->used);
 	tree_destroy(&ubi->free);
 	tree_destroy(&ubi->scrub);
-- 
1.5.3.2


-- 
yours Sincerely,

xiaochuan-xu (许小川)
