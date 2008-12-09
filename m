Received: from [202.202.0.36] (helo=cqu.edu.cn)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LA11w-00064J-ED
	for linux-mtd@lists.infradead.org; Tue, 09 Dec 2008 11:45:35 +0000
Message-ID: <428822985.23006@cqu.edu.cn>
Subject: [PATCH 2/4] UBI WL-Subsys: Improvement in prot tree
From: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Tue, 09 Dec 2008 19:44:54 +0800
Message-Id: <1228823094.2753.14.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 9e4a9b537f4681118fe7472a0f9c3b45a2a54fe0 Mon Sep 17 00:00:00 2001
From: Xiaochuan-Xu <xiaochuan-xu@cqu.edu.cn>
Date: Tue, 9 Dec 2008 19:08:47 +0800
Subject: [PATCH] Improvement in the prot RB tree

In this implement, protection lists are used to replace of
the current prot RB-tree. By means of link lists, the new
protection mothed is simpler and higher efficient.

Signed-off-by: Xiaochuan-Xu <xiaochuan-xu@cqu.edu.cn>
---
 drivers/mtd/ubi/ubi.h |   40 +++++--
 drivers/mtd/ubi/wl.c  |  330 ++++++++++++++++++++++--------------------------
 2 files changed, 181 insertions(+), 189 deletions(-)

diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 46a4763..7072aa5 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -93,9 +93,28 @@ enum {
 	UBI_IO_BITFLIPS
 };
 
+/*
+ * It's impossible that the first field of rb_node structure is equal to 0x2
+ * and 0x3, so Ox2 is used to check whether the physical eraseblock is in one
+ * of prot lists or not. 0x3 is used for prot list head's mark.
+ */
+#define PROT_LIST_NODE 0x2
+#define PROT_LIST_HEAD 0x3
+
+/**
+ * struct prot_node - prot link list's node.
+ * @priv: private data when in prot list
+ * @list: link one of the prot list node
+ */
+struct prot_node {
+	unsigned long priv;
+	struct list_head list;
+};
+
 /**
  * struct ubi_wl_entry - wear-leveling entry.
  * @u.rb: link in the corresponding (free/used) RB-tree
+ * @u.prot: node in prot list
  * @ec: erase counter
  * @pnum: physical eraseblock number
  *
@@ -106,6 +125,7 @@ enum {
 struct ubi_wl_entry {
 	union {
 		struct rb_node rb;
+		struct prot_node prot;
 	} u;
 	int ec;
 	int pnum;
@@ -308,12 +328,14 @@ struct ubi_wl_entry;
  * @used: RB-tree of used physical eraseblocks
  * @free: RB-tree of free physical eraseblocks
  * @scrub: RB-tree of physical eraseblocks which need scrubbing
- * @prot: protection trees
- * @prot.pnum: protection tree indexed by physical eraseblock numbers
- * @prot.aec: protection tree indexed by absolute erase counter value
- * @wl_lock: protects the @used, @free, @prot, @lookuptbl, @abs_ec, @move_from,
- *           @move_to, @move_to_put @erase_pending, @wl_scheduled, and @works
- *           fields
+ * @prot: protection link lists, physical eraseblocks, should be protected,
+ *	  are listed by one of its list
+ * @prot_over: the index of element (list head) in the prot lists, all the
+ *	       physical eraseblocks linked should be moved to used RB-tree in
+ *	       the next "check_protection_over" operation.
+ * @wl_lock: protects the @used, @free, @prot, @prot_over, @lookuptbl,
+ *	     @move_from, @move_to, @move_to_put @erase_pending, @wl_scheduled
+ *	     and @works fields
  * @move_mutex: serializes eraseblock moves
  * @work_sem: sycnhronizes the WL worker with use tasks
  * @wl_scheduled: non-zero if the wear-leveling was scheduled
@@ -394,10 +416,8 @@ struct ubi_device {
 	struct rb_root used;
 	struct rb_root free;
 	struct rb_root scrub;
-	struct {
-		struct rb_root pnum;
-		struct rb_root aec;
-	} prot;
+	struct prot_node *prot;
+	int prot_over;
 	spinlock_t wl_lock;
 	struct mutex move_mutex;
 	struct rw_semaphore work_sem;
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 0279bf9..c92bd86 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -55,8 +55,50 @@
  *
  * As it was said, for the UBI sub-system all physical eraseblocks are either
  * "free" or "used". Free eraseblock are kept in the @wl->free RB-tree, while
- * used eraseblocks are kept in a set of different RB-trees: @wl->used,
- * @wl->prot.pnum, @wl->prot.aec, and @wl->scrub.
+ * used eraseblocks are kept in RB-trees (@wl->used, @wl->scrub) and @wl->prot
+ * lists.
+ *
+ * When the WL sub-system returns a physical eraseblock, the physical
+ * eraseblock is protected from being moved for some "time". For this reason,
+ * the physical eraseblock is not directly moved from the @wl->free tree to the
+ * @wl->used tree. There are serveral protection lists in between where this
+ * physical eraseblock is temporarily stored (@wl->prot).
+ *
+ * All this protection stuff is needed because:
+ *  o we don't want to move physical eraseblocks just after we have given them
+ *    to the user; instead, we first want to let users fill them up with data;
+ *
+ *  o there is a chance that the user will put the physical eraseblock very
+ *    soon, so it makes sense not to move it for some time, but wait; this is
+ *    especially important in case of "short term" physical eraseblocks.
+ *
+ * Physical eraseblocks stay protected only for limited time. But the "time" is
+ * measured in erase cycles in this case. This is implemented with help of the
+ * cursor (@wl->prot_over). After each erasure operation, all the physical
+ * eraseblocks, linkecd by the @wl->prot array's element pointed by
+ * @wl->prot_over, are moved from the protection list to the @wl->used tree,
+ * and then the cursor (@wl->prot_over) increases.
+ *
+ * The so called @wl->prot "array" is not absolutely appositely, In fact every
+ * element of the array is a list head, which links to protected physical
+ * eraseblocks. The link list with the list head pointed by the @wl->prot_over
+ * is "timeout" and wil be moved to used RB-tree in the next erase operation,
+ * whereas new "get" physical eraseblocks are inserted into the list with the
+ * list head pointed by @wl->prot_over plus protection "time".
+ *
+ * Protected physical eraseblocks are searched by physical eraseblock number
+ * with help of the @wl->lookuptbl(when they are put). So the search and
+ * subsequent put is O(1) operateion.
+ *
+ * Each physical eraseblock has 2 main states: free and used. The former state
+ * corresponds to the @wl->free tree. The latter state is split up on several
+ * sub-states:
+ * o the WL movement is allowed (@wl->used tree);
+ * o the WL movement is temporarily prohibited (@wl->prot lists);
+ * o scrubbing is needed (@wl->scrub tree).
+ *
+ * Depending on the sub-state, wear-leveling entries of the used physical
+ * eraseblocks may be kept in one of those structures.
  *
  * Note, in this implementation, we keep a small in-RAM object for each physical
  * eraseblock. This is surely not a scalable solution. But it appears to be good
@@ -92,6 +134,9 @@
 #define U_PROTECTION  10
 #define LT_PROTECTION 4
 
+/* Number of prot lists, must be bigger than 'ST_PROTECTION' */
+#define PROT_LISTS_LEN (ST_PROTECTION+1)
+
 /*
  * Maximum difference between two erase counters. If this threshold is
  * exceeded, the WL sub-system starts moving data from used physical
@@ -120,60 +165,6 @@
 #define WL_MAX_FAILURES 32
 
 /**
- * struct ubi_wl_prot_entry - PEB protection entry.
- * @rb_pnum: link in the @wl->prot.pnum RB-tree
- * @rb_aec: link in the @wl->prot.aec RB-tree
- * @abs_ec: the absolute erase counter value when the protection ends
- * @e: the wear-leveling entry of the physical eraseblock under protection
- *
- * When the WL sub-system returns a physical eraseblock, the physical
- * eraseblock is protected from being moved for some "time". For this reason,
- * the physical eraseblock is not directly moved from the @wl->free tree to the
- * @wl->used tree. There is one more tree in between where this physical
- * eraseblock is temporarily stored (@wl->prot).
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
@@ -198,9 +189,12 @@ struct ubi_work {
 static int paranoid_check_ec(struct ubi_device *ubi, int pnum, int ec);
 static int paranoid_check_in_wl_tree(struct ubi_wl_entry *e,
 				     struct rb_root *root);
+static int paranoid_check_in_prot_lists(struct ubi_device *ubi,
+					struct ubi_wl_entry *e);
 #else
 #define paranoid_check_ec(ubi, pnum, ec) 0
 #define paranoid_check_in_wl_tree(e, root)
+#define paranoid_check_in_prot_lists(ubi, e) 0
 #endif
 
 /**
@@ -355,49 +349,28 @@ static int in_wl_tree(struct ubi_wl_entry *e, struct rb_root *root)
 }
 
 /**
- * prot_tree_add - add physical eraseblock to protection trees.
+ * prot_list_add - add physical eraseblock to one of protection list.
  * @ubi: UBI device description object
  * @e: the physical eraseblock to add
- * @pe: protection entry object to use
  * @ec: for how many erase operations this PEB should be protected
  *
  * @wl->lock has to be locked.
  */
-static void prot_tree_add(struct ubi_device *ubi, struct ubi_wl_entry *e,
-			  struct ubi_wl_prot_entry *pe, int ec)
+static void prot_list_add(struct ubi_device *ubi, struct ubi_wl_entry *e,
+			  int ec)
 {
-	struct rb_node **p, *parent = NULL;
-	struct ubi_wl_prot_entry *pe1;
-
-	pe->e = e;
-	pe->abs_ec = ubi->abs_ec + ec;
+	int index;
 
-	p = &ubi->prot.pnum.rb_node;
-	while (*p) {
-		parent = *p;
-		pe1 = rb_entry(parent, struct ubi_wl_prot_entry, rb_pnum);
+	index = ubi->prot_over + ec;
+	if (index >= PROT_LISTS_LEN)
+		index -= PROT_LISTS_LEN;
 
-		if (e->pnum < pe1->e->pnum)
-			p = &(*p)->rb_left;
-		else
-			p = &(*p)->rb_right;
-	}
-	rb_link_node(&pe->rb_pnum, parent, p);
-	rb_insert_color(&pe->rb_pnum, &ubi->prot.pnum);
+	ubi_assert(index >= 0 && index < PROT_LISTS_LEN);
 
-	p = &ubi->prot.aec.rb_node;
-	parent = NULL;
-	while (*p) {
-		parent = *p;
-		pe1 = rb_entry(parent, struct ubi_wl_prot_entry, rb_aec);
+	dbg_wl("PEB %d EC %d is added to a prot list", e->pnum, e->ec);
 
-		if (pe->abs_ec < pe1->abs_ec)
-			p = &(*p)->rb_left;
-		else
-			p = &(*p)->rb_right;
-	}
-	rb_link_node(&pe->rb_aec, parent, p);
-	rb_insert_color(&pe->rb_aec, &ubi->prot.aec);
+	e->u.prot.priv = PROT_LIST_NODE;
+	list_add_tail(&e->u.prot.list, &ubi->prot[index].list);
 }
 
 /**
@@ -444,15 +417,10 @@ int ubi_wl_get_peb(struct ubi_device *ubi, int dtype)
 {
 	int err, protect, medium_ec;
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
@@ -460,16 +428,14 @@ retry:
 			ubi_assert(list_empty(&ubi->works));
 			ubi_err("no free eraseblocks");
 			spin_unlock(&ubi->wl_lock);
-			kfree(pe);
 			return -ENOSPC;
 		}
 		spin_unlock(&ubi->wl_lock);
 
 		err = produce_free_peb(ubi);
-		if (err < 0) {
-			kfree(pe);
+		if (err < 0)
 			return err;
-		}
+
 		goto retry;
 	}
 
@@ -524,7 +490,7 @@ retry:
 	 */
 	paranoid_check_in_wl_tree(e, &ubi->free);
 	rb_erase(&e->u.rb, &ubi->free);
-	prot_tree_add(ubi, e, pe, protect);
+	prot_list_add(ubi, e, protect);
 
 	dbg_wl("PEB %d EC %d, protection %d", e->pnum, e->ec, protect);
 	spin_unlock(&ubi->wl_lock);
@@ -533,40 +499,26 @@ retry:
 }
 
 /**
- * prot_tree_del - remove a physical eraseblock from the protection trees
+ * prot_list_del - remove a physical eraseblock from a protection list
  * @ubi: UBI device description object
  * @pnum: the physical eraseblock to remove
  *
- * This function returns PEB @pnum from the protection trees and returns zero
- * in case of success and %-ENODEV if the PEB was not found in the protection
- * trees.
+ * This function deletes PEB @pnum from one protection list and returns zero
+ * in case of success and %-ENODEV if the PEB was not found in protection lists.
  */
-static int prot_tree_del(struct ubi_device *ubi, int pnum)
+static int prot_list_del(struct ubi_device *ubi, int pnum)
 {
-	struct rb_node *p;
-	struct ubi_wl_prot_entry *pe = NULL;
-
-	p = ubi->prot.pnum.rb_node;
-	while (p) {
-
-		pe = rb_entry(p, struct ubi_wl_prot_entry, rb_pnum);
+	struct ubi_wl_entry *e;
 
-		if (pnum == pe->e->pnum)
-			goto found;
+	e = ubi->lookuptbl[pnum];
+	if (!e || e->u.prot.priv != PROT_LIST_NODE)
+		return -ENODEV;
 
-		if (pnum < pe->e->pnum)
-			p = p->rb_left;
-		else
-			p = p->rb_right;
-	}
+	paranoid_check_in_prot_lists(ubi, e);
 
-	return -ENODEV;
+	dbg_wl("PEB %d is deleted from one prot list", e->pnum);
+	list_del(&e->u.prot.list);
 
-found:
-	ubi_assert(pe->e->pnum == pnum);
-	rb_erase(&pe->rb_aec, &ubi->prot.aec);
-	rb_erase(&pe->rb_pnum, &ubi->prot.pnum);
-	kfree(pe);
 	return 0;
 }
 
@@ -635,14 +587,13 @@ out_free:
  * check_protection_over - check if it is time to stop protecting some PEBs.
  * @ubi: UBI device description object
  *
- * This function is called after each erase operation, when the absolute erase
- * counter is incremented, to check if some physical eraseblock  have not to be
- * protected any longer. These physical eraseblocks are moved from the
- * protection trees to the used tree.
+ * This function is called after each erase operation, to check if some
+ * physical eraseblock have not to be protected any longer. These physical
+ * eraseblocks are moved from the protection list to the used RB-tree.
  */
 static void check_protection_over(struct ubi_device *ubi)
 {
-	struct ubi_wl_prot_entry *pe;
+	struct ubi_wl_entry *e;
 
 	/*
 	 * There may be several protected physical eraseblock to remove,
@@ -650,27 +601,23 @@ static void check_protection_over(struct ubi_device *ubi)
 	 */
 	while (1) {
 		spin_lock(&ubi->wl_lock);
-		if (!ubi->prot.aec.rb_node) {
+		if (list_empty(&ubi->prot[ubi->prot_over].list)) {
+			ubi->prot_over += 1;
+			if (ubi->prot_over >= PROT_LISTS_LEN)
+				ubi->prot_over = 0;
 			spin_unlock(&ubi->wl_lock);
 			break;
 		}
 
-		pe = rb_entry(rb_first(&ubi->prot.aec),
-			      struct ubi_wl_prot_entry, rb_aec);
+		e = list_entry(ubi->prot[ubi->prot_over].list.next,
+			      struct ubi_wl_entry, u.prot.list);
 
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
+		list_del(&e->u.prot.list);
+		wl_tree_add(e, &ubi->used);
 		spin_unlock(&ubi->wl_lock);
 
-		kfree(pe);
+		dbg_wl("PEB %d protection over, move to used tree", e->ec);
+
 		cond_resched();
 	}
 }
@@ -740,7 +687,6 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 				int cancel)
 {
 	int err, scrubbing = 0, torture = 0;
-	struct ubi_wl_prot_entry *uninitialized_var(pe);
 	struct ubi_wl_entry *e1, *e2;
 	struct ubi_vid_hdr *vid_hdr;
 
@@ -857,23 +803,17 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 		 * The LEB has not been moved because the volume is being
 		 * deleted or the PEB has been put meanwhile. We should prevent
 		 * this PEB from being selected for wear-leveling movement
-		 * again, so put it to the protection tree.
+		 * again, so put it to a protection list.
 		 */
 
 		dbg_wl("canceled moving PEB %d", e1->pnum);
 		ubi_assert(err == 1);
 
-		pe = kmalloc(sizeof(struct ubi_wl_prot_entry), GFP_NOFS);
-		if (!pe) {
-			err = -ENOMEM;
-			goto out_error;
-		}
-
 		ubi_free_vid_hdr(ubi, vid_hdr);
 		vid_hdr = NULL;
 
 		spin_lock(&ubi->wl_lock);
-		prot_tree_add(ubi, e1, pe, U_PROTECTION);
+		prot_list_add(ubi, e1, U_PROTECTION);
 		ubi_assert(!ubi->move_to_put);
 		ubi->move_from = ubi->move_to = NULL;
 		ubi->wl_scheduled = 0;
@@ -1220,7 +1160,7 @@ retry:
 			paranoid_check_in_wl_tree(e, &ubi->scrub);
 			rb_erase(&e->u.rb, &ubi->scrub);
 		} else {
-			err = prot_tree_del(ubi, e->pnum);
+			err = prot_list_del(ubi, e->pnum);
 			if (err) {
 				ubi_err("PEB %d not found", pnum);
 				ubi_ro_mode(ubi);
@@ -1461,15 +1401,13 @@ static void cancel_pending(struct ubi_device *ubi)
  */
 int ubi_wl_init_scan(struct ubi_device *ubi, struct ubi_scan_info *si)
 {
-	int err;
+	int err, i;
 	struct rb_node *rb1, *rb2;
 	struct ubi_scan_volume *sv;
 	struct ubi_scan_leb *seb, *tmp;
 	struct ubi_wl_entry *e;
 
-
 	ubi->used = ubi->free = ubi->scrub = RB_ROOT;
-	ubi->prot.pnum = ubi->prot.aec = RB_ROOT;
 	spin_lock_init(&ubi->wl_lock);
 	mutex_init(&ubi->move_mutex);
 	init_rwsem(&ubi->work_sem);
@@ -1479,6 +1417,18 @@ int ubi_wl_init_scan(struct ubi_device *ubi, struct ubi_scan_info *si)
 	sprintf(ubi->bgt_name, UBI_BGT_NAME_PATTERN, ubi->ubi_num);
 
 	err = -ENOMEM;
+
+	ubi->prot = kzalloc(PROT_LISTS_LEN * sizeof(struct prot_node),
+				GFP_KERNEL);
+	if (!ubi->prot)
+		return err;
+	for (i = 0; i < PROT_LISTS_LEN; i++) {
+		ubi->prot[i].priv = PROT_LIST_HEAD;
+		INIT_LIST_HEAD(&ubi->prot[i].list);
+	}
+
+	ubi->prot_over = 0;
+
 	ubi->lookuptbl = kzalloc(ubi->peb_count * sizeof(void *), GFP_KERNEL);
 	if (!ubi->lookuptbl)
 		return err;
@@ -1577,35 +1527,24 @@ out_free:
 }
 
 /**
- * protection_trees_destroy - destroy the protection RB-trees.
+ * protection_lists_destroy - destroy the protection RB-trees.
  * @ubi: UBI device description object
  */
-static void protection_trees_destroy(struct ubi_device *ubi)
+static void protection_lists_destroy(struct ubi_device *ubi)
 {
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
+	int i;
+	struct ubi_wl_entry *e;
 
-			kmem_cache_free(ubi_wl_entry_slab, pe->e);
-			kfree(pe);
+	for (i = 0; i < PROT_LISTS_LEN; ++i) {
+		while (!list_empty(&ubi->prot[i].list)) {
+			e = list_entry(ubi->prot[i].list.next,
+					struct ubi_wl_entry, u.prot.list);
+			list_del(&e->u.prot.list);
+			kmem_cache_free(ubi_wl_entry_slab, e);
 		}
 	}
+
+	kfree(ubi->prot);
 }
 
 /**
@@ -1616,7 +1555,7 @@ void ubi_wl_close(struct ubi_device *ubi)
 {
 	dbg_wl("close the WL sub-system");
 	cancel_pending(ubi);
-	protection_trees_destroy(ubi);
+	protection_lists_destroy(ubi);
 	tree_destroy(&ubi->used);
 	tree_destroy(&ubi->free);
 	tree_destroy(&ubi->scrub);
@@ -1686,4 +1625,37 @@ static int paranoid_check_in_wl_tree(struct ubi_wl_entry *e,
 	return 1;
 }
 
+/**
+ * paranoid_check_in_prot_lists - check if wear-leveling entry is inprot lists.
+ * @ubi: UBI device description object
+ * @e: the wear-leveling entry to check
+ *
+ * This function returns zero if @e is in the @ubi->prot and %1 if it is not.
+ */
+static int paranoid_check_in_prot_lists(struct ubi_device *ubi,
+				struct ubi_wl_entry *e)
+{
+	struct ubi_wl_entry *e1 = e;
+
+	while (1) {
+		if (!e1 || e1->u.prot.priv != PROT_LIST_NODE) {
+			ubi_err("paranoid check failed for PEB %d, EC %d,"
+				" prot lists", e->pnum, e->ec);
+			ubi_dbg_dump_stack();
+
+			return 1;
+		}
+
+		e1 = list_entry(e1->u.prot.list.next, struct ubi_wl_entry,
+				u.prot.list);
+		/*
+		 * If @e links the prot lists, this condition must happens,
+		 * because every phyical eraseblock in the prot lists must link
+		 * one of the circular linked lists with the list head in the
+		 * @wl->prot array.
+		 */
+		if (e1 && e1->u.prot.priv == PROT_LIST_HEAD)
+			return 0;
+	}
+}
 #endif /* CONFIG_MTD_UBI_DEBUG_PARANOID */
-- 
1.5.3.2


-- 
Yours sincerely
xiaochuan-xu(cqu.edu.cn)
