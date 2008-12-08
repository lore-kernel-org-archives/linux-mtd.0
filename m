Received: from [202.202.0.36] (helo=cqu.edu.cn)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L9bHk-0003z0-2b
	for linux-mtd@lists.infradead.org; Mon, 08 Dec 2008 08:16:11 +0000
Message-ID: <428724024.16671@cqu.edu.cn>
Subject: [PATCH] UBI WL-Subsystem: Improvement in prot tree
From: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Mon, 08 Dec 2008 16:15:40 +0800
Message-Id: <1228724140.2694.27.camel@localhost.localdomain>
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

Hi, all.

A new PEB protection method in UBI WL-Subsystem is implemented,
It's simpler and higher efficiency than the older prot RB-tree, I think.

1. without two prot RB-tree, there is only one prot array, But their
functions are the same.

2. no other structure needed except @ubi_wl_entry ubi_wl_prot_entry is
discarded. and we need not malloc new struct every time in
ubi_wl_get_peb() function.

3. protarray add and del operation are O(1) operations, and check over
opteration is O(n), which is better then the older prot RB-tree
implement.

>From 53e20d90cea8b27048ccaa74979c357904986a3a Mon Sep 17 00:00:00 2001
From: XiaoChuan-Xu <xiaochuan-xu@cqu.edu.cn>
Date: Mon, 8 Dec 2008 15:24:05 +0800
Subject: [PATCH] prot tree improvement

Signed-off-by: XiaoChuan-Xu <xiaochuan-xu@cqu.edu.cn>
---
 drivers/mtd/ubi/ubi.h |   48 +++++--
 drivers/mtd/ubi/wl.c  |  383
+++++++++++++++++++++++--------------------------
 2 files changed, 211 insertions(+), 220 deletions(-)

diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 1c3fa18..192ae78 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -93,9 +93,28 @@ enum {
 	UBI_IO_BITFLIPS
 };
 
+/*
+ * It's impossible that the first field of rb_node structure is equal
to 0x2
+ * and 0x3, so Ox2 is used to check whether the physical eraseblock is
in one
+ * of prot array's LISTs or not. 0x3 is used for prot array element's
mark.
+ */
+#define PROT_ARRAY_LINK 0x2
+#define PROT_ARRAY_ELEM 0x3
+
+/**
+ * struct prot_node - prot array elements and corresponding link list
node.
+ * @priv: private data when in prot array
+ * @list: link one of the prot array elements
+ */
+struct prot_node {
+	unsigned long priv;
+	struct list_head list;
+};
+
 /**
  * struct ubi_wl_entry - wear-leveling entry.
- * @rb: link in the corresponding RB-tree
+ * @u.rb: link in the corresponding (free/used) RB-tree
+ * @u.prot: node in prot array
  * @ec: erase counter
  * @pnum: physical eraseblock number
  *
@@ -104,7 +123,10 @@ enum {
  * RB-trees. See WL sub-system for details.
  */
 struct ubi_wl_entry {
-	struct rb_node rb;
+	union {
+		struct rb_node rb;
+		struct prot_node prot;
+	} u;
 	int ec;
 	int pnum;
 };
@@ -306,18 +328,19 @@ struct ubi_wl_entry;
  * @used: RB-tree of used physical eraseblocks
  * @free: RB-tree of free physical eraseblocks
  * @scrub: RB-tree of physical eraseblocks which need scrubbing
- * @prot: protection trees
- * @prot.pnum: protection tree indexed by physical eraseblock numbers
- * @prot.aec: protection tree indexed by absolute erase counter value
- * @wl_lock: protects the @used, @free, @prot, @lookuptbl, @abs_ec,
@move_from,
- *           @move_to, @move_to_put @erase_pending, @wl_scheduled, and
@works
- *           fields
+ * @prot: protection array, physical eraseblocks, should be protected,
+ *	  are listed by one of its array elements
+ * @prot_over: the index of element (list head) in the prot array, all
the
+ *	       physical eraseblocks linked should be moved to used RB-tree
in
+ *	       the next "check_protection_over" operation.
+ * @wl_lock: protects the @used, @free, @prot, @prot_over, @lookuptbl,
+ *	     @move_from, @move_to, @move_to_put @erase_pending,
@wl_scheduled
+ *	     and @works fields
  * @move_mutex: serializes eraseblock moves
  * @work_sem: sycnhronizes the WL worker with use tasks
  * @wl_scheduled: non-zero if the wear-leveling was scheduled
  * @lookuptbl: a table to quickly find a &struct ubi_wl_entry object
for any
  *             physical eraseblock
- * @abs_ec: absolute erase counter
  * @move_from: physical eraseblock from where the data is being moved
  * @move_to: physical eraseblock where the data is being moved to
  * @move_to_put: if the "to" PEB was put
@@ -392,16 +415,13 @@ struct ubi_device {
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
 	int wl_scheduled;
 	struct ubi_wl_entry **lookuptbl;
-	unsigned long long abs_ec;
 	struct ubi_wl_entry *move_from;
 	struct ubi_wl_entry *move_to;
 	int move_to_put;
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index dcb6dac..124fa5c 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -55,8 +55,50 @@
  *
  * As it was said, for the UBI sub-system all physical eraseblocks are
either
  * "free" or "used". Free eraseblock are kept in the @wl->free RB-tree,
while
- * used eraseblocks are kept in a set of different RB-trees: @wl->used,
- * @wl->prot.pnum, @wl->prot.aec, and @wl->scrub.
+ * used eraseblocks are kept in RB-trees (@wl->used, @wl->scrub) and
@wl->prot
+ * array.
+ *
+ * When the WL sub-system returns a physical eraseblock, the physical
+ * eraseblock is protected from being moved for some "time". For this
reason,
+ * the physical eraseblock is not directly moved from the @wl->free
tree to the
+ * @wl->used tree. There is one protection array in between where this
physical
+ * eraseblock is temporarily stored (@wl->prot).
+ *
+ * All this protection stuff is needed because:
+ *  o we don't want to move physical eraseblocks just after we have
given them
+ *    to the user; instead, we first want to let users fill them up
with data;
+ *
+ *  o there is a chance that the user will put the physical eraseblock
very
+ *    soon, so it makes sense not to move it for some time, but wait;
this is
+ *    especially important in case of "short term" physical
eraseblocks.
+ *
+ * Physical eraseblocks stay protected only for limited time. But the
"time" is
+ * measured in erase cycles in this case. This is implemented with help
of the
+ * cursor (@wl->prot_over). After each erasure operation, all the
physical
+ * eraseblocks, linkecd by the protection array's element pointed by
+ * @wl->prot_over, are moved from the protection array (@wl->prot) to
the
+ * @wl->used tree, and then the cursor (@wl->prot_over) increases.
+ *
+ * The so called @wl->prot "array" is not absolutely appositely, In
fact every
+ * element of the array is a list head, which links to protected
physical
+ * eraseblocks. The link list with the list head pointed by the
@wl->prot_over
+ * is "timeout" and wil be moved to used RB-tree in the next erase
operation,
+ * whereas new "get" physical eraseblocks are inserted into the list
with the
+ * list head pointed by @wl->prot_over plus protection "time".
+ *
+ * Protected physical eraseblocks are searched by physical eraseblock
number
+ * with help of the @wl->lookuptbl(when they are put). So the search
and
+ * subsequent put is O(1) operateion.
+ *
+ * Each physical eraseblock has 2 main states: free and used. The
former state
+ * corresponds to the @wl->free tree. The latter state is split up on
several
+ * sub-states:
+ * o the WL movement is allowed (@wl->used tree);
+ * o the WL movement is temporarily prohibited (@wl->prot array);
+ * o scrubbing is needed (@wl->scrub tree).
+ *
+ * Depending on the sub-state, wear-leveling entries of the used
physical
+ * eraseblocks may be kept in one of those structures.
  *
  * Note, in this implementation, we keep a small in-RAM object for each
physical
  * eraseblock. This is surely not a scalable solution. But it appears
to be good
@@ -92,6 +134,9 @@
 #define U_PROTECTION  10
 #define LT_PROTECTION 4
 
+/* the length of prot array, must be bigger than 'ST_PROTECTION' */
+#define PROT_ARRAY_LEN 17
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
- * @e: the wear-leveling entry of the physical eraseblock under
protection
- *
- * When the WL sub-system returns a physical eraseblock, the physical
- * eraseblock is protected from being moved for some "time". For this
reason,
- * the physical eraseblock is not directly moved from the @wl->free
tree to the
- * @wl->used tree. There is one more tree in between where this
physical
- * eraseblock is temporarily stored (@wl->prot).
- *
- * All this protection stuff is needed because:
- *  o we don't want to move physical eraseblocks just after we have
given them
- *    to the user; instead, we first want to let users fill them up
with data;
- *
- *  o there is a chance that the user will put the physical eraseblock
very
- *    soon, so it makes sense not to move it for some time, but wait;
this is
- *    especially important in case of "short term" physical
eraseblocks.
- *
- * Physical eraseblocks stay protected only for limited time. But the
"time" is
- * measured in erase cycles in this case. This is implemented with help
of the
- * absolute erase counter (@wl->abs_ec). When it reaches certain value,
the
- * physical eraseblocks are moved from the protection trees
(@wl->prot.*) to
- * the @wl->used tree.
- *
- * Protected physical eraseblocks are searched by physical eraseblock
number
- * (when they are put) and by the absolute erase counter (to check if
it is
- * time to move them to the @wl->used tree). So there are actually 2
RB-trees
- * storing the protected physical eraseblocks: @wl->prot.pnum and
- * @wl->prot.aec. They are referred to as the "protection" trees. The
- * first one is indexed by the physical eraseblock number. The second
one is
- * indexed by the absolute erase counter. Both trees store
- * &struct ubi_wl_prot_entry objects.
- *
- * Each physical eraseblock has 2 main states: free and used. The
former state
- * corresponds to the @wl->free tree. The latter state is split up on
several
- * sub-states:
- * o the WL movement is allowed (@wl->used tree);
- * o the WL movement is temporarily prohibited (@wl->prot.pnum and
- * @wl->prot.aec trees);
- * o scrubbing is needed (@wl->scrub tree).
- *
- * Depending on the sub-state, wear-leveling entries of the used
physical
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
+static int paranoid_check_in_prot_array(struct ubi_device *ubi,
+					struct ubi_wl_entry *e);
 #else
 #define paranoid_check_ec(ubi, pnum, ec) 0
 #define paranoid_check_in_wl_tree(e, root)
+#define paranoid_check_in_prot_array(ubi, e) 0
 #endif
 
 /**
@@ -220,7 +214,7 @@ static void wl_tree_add(struct ubi_wl_entry *e,
struct rb_root *root)
 		struct ubi_wl_entry *e1;
 
 		parent = *p;
-		e1 = rb_entry(parent, struct ubi_wl_entry, rb);
+		e1 = rb_entry(parent, struct ubi_wl_entry, u.rb);
 
 		if (e->ec < e1->ec)
 			p = &(*p)->rb_left;
@@ -235,8 +229,8 @@ static void wl_tree_add(struct ubi_wl_entry *e,
struct rb_root *root)
 		}
 	}
 
-	rb_link_node(&e->rb, parent, p);
-	rb_insert_color(&e->rb, root);
+	rb_link_node(&e->u.rb, parent, p);
+	rb_insert_color(&e->u.rb, root);
 }
 
 /**
@@ -331,7 +325,7 @@ static int in_wl_tree(struct ubi_wl_entry *e, struct
rb_root *root)
 	while (p) {
 		struct ubi_wl_entry *e1;
 
-		e1 = rb_entry(p, struct ubi_wl_entry, rb);
+		e1 = rb_entry(p, struct ubi_wl_entry, u.rb);
 
 		if (e->pnum == e1->pnum) {
 			ubi_assert(e == e1);
@@ -355,50 +349,28 @@ static int in_wl_tree(struct ubi_wl_entry *e,
struct rb_root *root)
 }
 
 /**
- * prot_tree_add - add physical eraseblock to protection trees.
+ * prot_array_add - add physical eraseblock to protection array.
  * @ubi: UBI device description object
  * @e: the physical eraseblock to add
- * @pe: protection entry object to use
- * @abs_ec: absolute erase counter value when this physical eraseblock
has
- * to be removed from the protection trees.
+ * @ec: for how many erase operations this PEB should be protected
  *
  * @wl->lock has to be locked.
  */
-static void prot_tree_add(struct ubi_device *ubi, struct ubi_wl_entry
*e,
-			  struct ubi_wl_prot_entry *pe, int abs_ec)
+static void prot_array_add(struct ubi_device *ubi, struct ubi_wl_entry
*e,
+			  int ec)
 {
-	struct rb_node **p, *parent = NULL;
-	struct ubi_wl_prot_entry *pe1;
+	int index;
 
-	pe->e = e;
-	pe->abs_ec = ubi->abs_ec + abs_ec;
+	index = ubi->prot_over + ec;
+	if (index >= PROT_ARRAY_LEN)
+		index -= PROT_ARRAY_LEN;
 
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
+	ubi_assert(index >= 0 && index < PROT_ARRAY_LEN);
 
-	p = &ubi->prot.aec.rb_node;
-	parent = NULL;
-	while (*p) {
-		parent = *p;
-		pe1 = rb_entry(parent, struct ubi_wl_prot_entry, rb_aec);
+	dbg_wl("PEB %d EC %d is added to prot array", e->pnum, e->ec);
 
-		if (pe->abs_ec < pe1->abs_ec)
-			p = &(*p)->rb_left;
-		else
-			p = &(*p)->rb_right;
-	}
-	rb_link_node(&pe->rb_aec, parent, p);
-	rb_insert_color(&pe->rb_aec, &ubi->prot.aec);
+	e->u.prot.priv = PROT_ARRAY_LINK;
+	list_add_tail(&e->u.prot.list, &ubi->prot[index].list);
 }
 
 /**
@@ -414,14 +386,14 @@ static struct ubi_wl_entry *find_wl_entry(struct
rb_root *root, int max)
 	struct rb_node *p;
 	struct ubi_wl_entry *e;
 
-	e = rb_entry(rb_first(root), struct ubi_wl_entry, rb);
+	e = rb_entry(rb_first(root), struct ubi_wl_entry, u.rb);
 	max += e->ec;
 
 	p = root->rb_node;
 	while (p) {
 		struct ubi_wl_entry *e1;
 
-		e1 = rb_entry(p, struct ubi_wl_entry, rb);
+		e1 = rb_entry(p, struct ubi_wl_entry, u.rb);
 		if (e1->ec >= max)
 			p = p->rb_left;
 		else {
@@ -445,15 +417,10 @@ int ubi_wl_get_peb(struct ubi_device *ubi, int
dtype)
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
@@ -461,16 +428,14 @@ retry:
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
 
@@ -492,12 +457,13 @@ retry:
 		 * eraseblock with erase counter greater or equivalent than the
 		 * lowest erase counter plus %WL_FREE_MAX_DIFF.
 		 */
-		first = rb_entry(rb_first(&ubi->free), struct ubi_wl_entry, rb);
-		last = rb_entry(rb_last(&ubi->free), struct ubi_wl_entry, rb);
+		first = rb_entry(rb_first(&ubi->free), struct ubi_wl_entry,
+				u.rb);
+		last = rb_entry(rb_last(&ubi->free), struct ubi_wl_entry, u.rb);
 
 		if (last->ec - first->ec < WL_FREE_MAX_DIFF)
-			e = rb_entry(ubi->free.rb_node,
-					struct ubi_wl_entry, rb);
+			e = rb_entry(ubi->free.rb_node, struct ubi_wl_entry,
+					u.rb);
 		else {
 			medium_ec = (first->ec + WL_FREE_MAX_DIFF)/2;
 			e = find_wl_entry(&ubi->free, medium_ec);
@@ -509,7 +475,7 @@ retry:
 		 * For short term data we pick a physical eraseblock with the
 		 * lowest erase counter as we expect it will be erased soon.
 		 */
-		e = rb_entry(rb_first(&ubi->free), struct ubi_wl_entry, rb);
+		e = rb_entry(rb_first(&ubi->free), struct ubi_wl_entry, u.rb);
 		protect = ST_PROTECTION;
 		break;
 	default:
@@ -523,8 +489,8 @@ retry:
 	 * be protected from being moved for some time.
 	 */
 	paranoid_check_in_wl_tree(e, &ubi->free);
-	rb_erase(&e->rb, &ubi->free);
-	prot_tree_add(ubi, e, pe, protect);
+	rb_erase(&e->u.rb, &ubi->free);
+	prot_array_add(ubi, e, protect);
 
 	dbg_wl("PEB %d EC %d, protection %d", e->pnum, e->ec, protect);
 	spin_unlock(&ubi->wl_lock);
@@ -533,40 +499,27 @@ retry:
 }
 
 /**
- * prot_tree_del - remove a physical eraseblock from the protection
trees
+ * prot_array_del - remove a physical eraseblock from the protection
array
  * @ubi: UBI device description object
  * @pnum: the physical eraseblock to remove
  *
- * This function returns PEB @pnum from the protection trees and
returns zero
+ * This function delete PEB @pnum from the protection array and returns
zero
  * in case of success and %-ENODEV if the PEB was not found in the
protection
- * trees.
+ * array.
  */
-static int prot_tree_del(struct ubi_device *ubi, int pnum)
+static int prot_array_del(struct ubi_device *ubi, int pnum)
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
+	if (!e || e->u.prot.priv != PROT_ARRAY_LINK)
+		return -ENODEV;
 
-		if (pnum < pe->e->pnum)
-			p = p->rb_left;
-		else
-			p = p->rb_right;
-	}
+	paranoid_check_in_prot_array(ubi, e);
 
-	return -ENODEV;
+	dbg_wl("PEB %d is deleted from prot array", e->pnum);
+	list_del(&e->u.prot.list);
 
-found:
-	ubi_assert(pe->e->pnum == pnum);
-	rb_erase(&pe->rb_aec, &ubi->prot.aec);
-	rb_erase(&pe->rb_pnum, &ubi->prot.pnum);
-	kfree(pe);
 	return 0;
 }
 
@@ -635,42 +588,36 @@ out_free:
  * check_protection_over - check if it is time to stop protecting some
PEBs.
  * @ubi: UBI device description object
  *
- * This function is called after each erase operation, when the
absolute erase
- * counter is incremented, to check if some physical eraseblock  have
not to be
- * protected any longer. These physical eraseblocks are moved from the
- * protection trees to the used tree.
+ * This function is called after each erase operation, to check if some
+ * physical eraseblock have not to be protected any longer. These
physical
+ * eraseblocks are moved from the protection array to the used tree.
  */
 static void check_protection_over(struct ubi_device *ubi)
 {
-	struct ubi_wl_prot_entry *pe;
-
+	struct ubi_wl_entry *e;
 	/*
 	 * There may be several protected physical eraseblock to remove,
 	 * process them all.
 	 */
 	while (1) {
 		spin_lock(&ubi->wl_lock);
-		if (!ubi->prot.aec.rb_node) {
+		if (list_empty(&ubi->prot[ubi->prot_over].list)) {
+			ubi->prot_over += 1;
+			if (ubi->prot_over >= PROT_ARRAY_LEN)
+				ubi->prot_over = 0;
 			spin_unlock(&ubi->wl_lock);
 			break;
 		}
 
-		pe = rb_entry(rb_first(&ubi->prot.aec),
-			      struct ubi_wl_prot_entry, rb_aec);
+		e = list_entry(ubi->prot[ubi->prot_over].list.next,
+			      struct ubi_wl_entry, u.prot.list);
+		list_del(&e->u.prot.list);
 
-		if (pe->abs_ec > ubi->abs_ec) {
-			spin_unlock(&ubi->wl_lock);
-			break;
-		}
+		dbg_wl("one PEB protection over, ec %d", e->ec);
 
-		dbg_wl("PEB %d protection over, abs_ec %llu, PEB abs_ec %llu",
-		       pe->e->pnum, ubi->abs_ec, pe->abs_ec);
-		rb_erase(&pe->rb_aec, &ubi->prot.aec);
-		rb_erase(&pe->rb_pnum, &ubi->prot.pnum);
-		wl_tree_add(pe->e, &ubi->used);
+		wl_tree_add(e, &ubi->used);
 		spin_unlock(&ubi->wl_lock);
 
-		kfree(pe);
 		cond_resched();
 	}
 }
@@ -740,7 +687,6 @@ static int wear_leveling_worker(struct ubi_device
*ubi, struct ubi_work *wrk,
 				int cancel)
 {
 	int err, put = 0, scrubbing = 0, protect = 0;
-	struct ubi_wl_prot_entry *uninitialized_var(pe);
 	struct ubi_wl_entry *e1, *e2;
 	struct ubi_vid_hdr *vid_hdr;
 
@@ -781,7 +727,7 @@ static int wear_leveling_worker(struct ubi_device
*ubi, struct ubi_work *wrk,
 		 * highly worn-out free physical eraseblock. If the erase
 		 * counters differ much enough, start wear-leveling.
 		 */
-		e1 = rb_entry(rb_first(&ubi->used), struct ubi_wl_entry, rb);
+		e1 = rb_entry(rb_first(&ubi->used), struct ubi_wl_entry, u.rb);
 		e2 = find_wl_entry(&ubi->free, WL_FREE_MAX_DIFF);
 
 		if (!(e2->ec - e1->ec >= UBI_WL_THRESHOLD)) {
@@ -790,21 +736,21 @@ static int wear_leveling_worker(struct ubi_device
*ubi, struct ubi_work *wrk,
 			goto out_cancel;
 		}
 		paranoid_check_in_wl_tree(e1, &ubi->used);
-		rb_erase(&e1->rb, &ubi->used);
+		rb_erase(&e1->u.rb, &ubi->used);
 		dbg_wl("move PEB %d EC %d to PEB %d EC %d",
 		       e1->pnum, e1->ec, e2->pnum, e2->ec);
 	} else {
 		/* Perform scrubbing */
 		scrubbing = 1;
-		e1 = rb_entry(rb_first(&ubi->scrub), struct ubi_wl_entry, rb);
+		e1 = rb_entry(rb_first(&ubi->scrub), struct ubi_wl_entry, u.rb);
 		e2 = find_wl_entry(&ubi->free, WL_FREE_MAX_DIFF);
 		paranoid_check_in_wl_tree(e1, &ubi->scrub);
-		rb_erase(&e1->rb, &ubi->scrub);
+		rb_erase(&e1->u.rb, &ubi->scrub);
 		dbg_wl("scrub PEB %d to PEB %d", e1->pnum, e2->pnum);
 	}
 
 	paranoid_check_in_wl_tree(e2, &ubi->free);
-	rb_erase(&e2->rb, &ubi->free);
+	rb_erase(&e2->u.rb, &ubi->free);
 	ubi->move_from = e1;
 	ubi->move_to = e2;
 	spin_unlock(&ubi->wl_lock);
@@ -854,16 +800,8 @@ static int wear_leveling_worker(struct ubi_device
*ubi, struct ubi_work *wrk,
 		 * For some reason the LEB was not moved - it might be because
 		 * the volume is being deleted. We should prevent this PEB from
 		 * being selected for wear-levelling movement for some "time",
-		 * so put it to the protection tree.
+		 * so put it to the protection array.
 		 */
-
-		dbg_wl("cancelled moving PEB %d", e1->pnum);
-		pe = kmalloc(sizeof(struct ubi_wl_prot_entry), GFP_NOFS);
-		if (!pe) {
-			err = -ENOMEM;
-			goto out_error;
-		}
-
 		protect = 1;
 	}
 
@@ -874,7 +812,7 @@ static int wear_leveling_worker(struct ubi_device
*ubi, struct ubi_work *wrk,
 
 	spin_lock(&ubi->wl_lock);
 	if (protect)
-		prot_tree_add(ubi, e1, pe, protect);
+		prot_array_add(ubi, e1, protect);
 	if (!ubi->move_to_put)
 		wl_tree_add(e2, &ubi->used);
 	else
@@ -988,7 +926,7 @@ static int ensure_wear_leveling(struct ubi_device
*ubi)
 		 * erase counter of free physical eraseblocks is greater then
 		 * %UBI_WL_THRESHOLD.
 		 */
-		e1 = rb_entry(rb_first(&ubi->used), struct ubi_wl_entry, rb);
+		e1 = rb_entry(rb_first(&ubi->used), struct ubi_wl_entry, u.rb);
 		e2 = find_wl_entry(&ubi->free, WL_FREE_MAX_DIFF);
 
 		if (!(e2->ec - e1->ec >= UBI_WL_THRESHOLD))
@@ -1050,7 +988,6 @@ static int erase_worker(struct ubi_device *ubi,
struct ubi_work *wl_wrk,
 		kfree(wl_wrk);
 
 		spin_lock(&ubi->wl_lock);
-		ubi->abs_ec += 1;
 		wl_tree_add(e, &ubi->free);
 		spin_unlock(&ubi->wl_lock);
 
@@ -1190,12 +1127,12 @@ retry:
 	} else {
 		if (in_wl_tree(e, &ubi->used)) {
 			paranoid_check_in_wl_tree(e, &ubi->used);
-			rb_erase(&e->rb, &ubi->used);
+			rb_erase(&e->u.rb, &ubi->used);
 		} else if (in_wl_tree(e, &ubi->scrub)) {
 			paranoid_check_in_wl_tree(e, &ubi->scrub);
-			rb_erase(&e->rb, &ubi->scrub);
+			rb_erase(&e->u.rb, &ubi->scrub);
 		} else {
-			err = prot_tree_del(ubi, e->pnum);
+			err = prot_array_del(ubi, pnum);
 			if (err) {
 				ubi_err("PEB %d not found", pnum);
 				ubi_ro_mode(ubi);
@@ -1255,11 +1192,11 @@ retry:
 
 	if (in_wl_tree(e, &ubi->used)) {
 		paranoid_check_in_wl_tree(e, &ubi->used);
-		rb_erase(&e->rb, &ubi->used);
+		rb_erase(&e->u.rb, &ubi->used);
 	} else {
 		int err;
 
-		err = prot_tree_del(ubi, e->pnum);
+		err = prot_array_del(ubi, e->pnum);
 		if (err) {
 			ubi_err("PEB %d not found", pnum);
 			ubi_ro_mode(ubi);
@@ -1337,11 +1274,11 @@ static void tree_destroy(struct rb_root *root)
 		else if (rb->rb_right)
 			rb = rb->rb_right;
 		else {
-			e = rb_entry(rb, struct ubi_wl_entry, rb);
+			e = rb_entry(rb, struct ubi_wl_entry, u.rb);
 
 			rb = rb_parent(rb);
 			if (rb) {
-				if (rb->rb_left == &e->rb)
+				if (rb->rb_left == &e->u.rb)
 					rb->rb_left = NULL;
 				else
 					rb->rb_right = NULL;
@@ -1436,7 +1373,7 @@ static void cancel_pending(struct ubi_device *ubi)
  */
 int ubi_wl_init_scan(struct ubi_device *ubi, struct ubi_scan_info *si)
 {
-	int err;
+	int err, i;
 	struct rb_node *rb1, *rb2;
 	struct ubi_scan_volume *sv;
 	struct ubi_scan_leb *seb, *tmp;
@@ -1444,7 +1381,6 @@ int ubi_wl_init_scan(struct ubi_device *ubi,
struct ubi_scan_info *si)
 
 
 	ubi->used = ubi->free = ubi->scrub = RB_ROOT;
-	ubi->prot.pnum = ubi->prot.aec = RB_ROOT;
 	spin_lock_init(&ubi->wl_lock);
 	mutex_init(&ubi->move_mutex);
 	init_rwsem(&ubi->work_sem);
@@ -1454,6 +1390,18 @@ int ubi_wl_init_scan(struct ubi_device *ubi,
struct ubi_scan_info *si)
 	sprintf(ubi->bgt_name, UBI_BGT_NAME_PATTERN, ubi->ubi_num);
 
 	err = -ENOMEM;
+
+	ubi->prot = kzalloc(PROT_ARRAY_LEN * sizeof(struct prot_node),
+				GFP_KERNEL);
+	if (!ubi->prot)
+		return err;
+	for (i = 0; i < PROT_ARRAY_LEN; i++) {
+		ubi->prot[i].priv = PROT_ARRAY_ELEM;
+		INIT_LIST_HEAD(&ubi->prot[i].list);
+	}
+
+	ubi->prot_over = 0;
+
 	ubi->lookuptbl = kzalloc(ubi->peb_count * sizeof(void *), GFP_KERNEL);
 	if (!ubi->lookuptbl)
 		return err;
@@ -1552,35 +1500,24 @@ out_free:
 }
 
 /**
- * protection_trees_destroy - destroy the protection RB-trees.
+ * protection_array_destroy - destroy the protection array.
  * @ubi: UBI device description object
  */
-static void protection_trees_destroy(struct ubi_device *ubi)
+static void protection_array_destroy(struct ubi_device *ubi)
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
+	for (i = 0; i < PROT_ARRAY_LEN; ++i) {
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
@@ -1591,7 +1528,7 @@ void ubi_wl_close(struct ubi_device *ubi)
 {
 	dbg_wl("close the WL sub-system");
 	cancel_pending(ubi);
-	protection_trees_destroy(ubi);
+	protection_array_destroy(ubi);
 	tree_destroy(&ubi->used);
 	tree_destroy(&ubi->free);
 	tree_destroy(&ubi->scrub);
@@ -1661,4 +1598,38 @@ static int paranoid_check_in_wl_tree(struct
ubi_wl_entry *e,
 	return 1;
 }
 
+/**
+ * paranoid_check_in_prot_array - check if wear-leveling entry is in
the prot
+ * 				  array.
+ * @ubi: UBI device description object
+ * @e: the wear-leveling entry to check
+ *
+ * This function returns zero if @e is in the @ubi->prot and %1 if it
is not.
+ */
+static int paranoid_check_in_prot_array(struct ubi_device *ubi,
+				struct ubi_wl_entry *e)
+{
+	struct ubi_wl_entry *e1 = e;
+
+	while (1) {
+		if (!e1 || e1->u.prot.priv != PROT_ARRAY_LINK) {
+			ubi_err("paranoid check failed for PEB %d, EC %d,"
+				" prot array", e->pnum, e->ec);
+			ubi_dbg_dump_stack();
+
+			return 1;
+		}
+
+		e1 = list_entry(e1->u.prot.list.next, struct ubi_wl_entry,
+				u.prot.list);
+		/*
+		 * If @e links the prot array, this condition must happens,
+		 * because every phyical eraseblock in the prot array must link
+		 * one of the circular linked lists with the list head in the
+		 * prot array.
+		 */
+		if (e1 && e1->u.prot.priv == PROT_ARRAY_ELEM)
+			return 0;
+	}
+}
 #endif /* CONFIG_MTD_UBI_DEBUG_PARANOID */
-- 
1.5.3.2



-- 
Yours sincerely
xiaochuan-xu(cqu.edu.cn)
