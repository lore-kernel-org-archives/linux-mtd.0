Received: from mail-pa0-x243.google.com ([2607:f8b0:400e:c03::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQQm7-0002YZ-MR
 for linux-mtd@lists.infradead.org; Tue, 02 Feb 2016 02:33:08 +0000
Received: by mail-pa0-x243.google.com with SMTP id ho8so738402pac.3
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2016 18:32:43 -0800 (PST)
From: Bean Huo <jackyard88@gmail.com>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com
Cc: beanhuo@micron.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, zszubbocsev@micron.com,
 peterpandong@micron.com
Subject: [PATCH v2 09/17] drivers:mtd:ubi:get PEB according to specfied plane
 number
Date: Tue,  2 Feb 2016 02:30:44 +0000
Message-Id: <1454380252-16170-10-git-send-email-jackyard88@gmail.com>
In-Reply-To: <1454380252-16170-1-git-send-email-jackyard88@gmail.com>
References: <1454380252-16170-1-git-send-email-jackyard88@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Bean Huo <beanhuo@micron.com>

This patch is to add new functions in order to get one free PEB according
to specified plane number. Currently, bakvol only support parallel
nand with dual plane.

Signed-off-by: BeanHuo <beanhuo@micron.com>
---
 drivers/mtd/ubi/wl.c | 140 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 275d9fb..de8e348 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -140,6 +140,7 @@ static int self_check_in_wl_tree(const struct ubi_device *ubi,
 				 struct ubi_wl_entry *e, struct rb_root *root);
 static int self_check_in_pq(const struct ubi_device *ubi,
 			    struct ubi_wl_entry *e);
+static int produce_free_peb(struct ubi_device *ubi);
 
 /**
  * wl_tree_add - add a wear-leveling entry to a WL RB-tree.
@@ -341,6 +342,47 @@ static struct ubi_wl_entry *find_wl_entry(struct ubi_device *ubi,
 	return e;
 }
 
+static struct ubi_wl_entry *find_wl_plane_entry(struct ubi_device *ubi,
+				struct rb_root *root, int diff, int plane)
+{
+	struct rb_node *p;
+	struct ubi_wl_entry *e, *prev_e = NULL, *bk_e = NULL;
+	int max;
+
+	e = rb_entry(rb_first(root), struct ubi_wl_entry, u.rb);
+	max = e->ec + diff;
+
+	p = root->rb_node;
+	while (p) {
+		struct ubi_wl_entry *e1;
+
+		e1 = rb_entry(p, struct ubi_wl_entry, u.rb);
+		if (e1->ec >= max)
+			p = p->rb_left;
+		else {
+			p = p->rb_right;
+			if (e->pnum%2 == plane)
+				prev_e = e;
+
+			e = e1;
+
+			if (e1->pnum%2 == plane)
+				bk_e = e1;
+		}
+	}
+
+	/**
+	*If no fastmap has been written and this WL entry can be used
+	* as anchor PEB, hold it back and return the second best WL entry
+	* such that fastmap can use the anchor PEB later.
+	**/
+	if (prev_e && !ubi->fm_disabled &&
+	    !ubi->fm && bk_e->pnum < UBI_FM_MAX_START)
+		return prev_e;
+
+	return bk_e;
+}
+
 /**
  * find_mean_wl_entry - find wear-leveling entry with medium erase counter.
  * @ubi: UBI device description object
@@ -371,6 +413,32 @@ static struct ubi_wl_entry *find_mean_wl_entry(struct ubi_device *ubi,
 	return e;
 }
 
+static struct ubi_wl_entry *find_mean_plane_wl_entry(struct ubi_device *ubi,
+						struct rb_root *root, int plane)
+{
+	struct ubi_wl_entry *e, *first, *last;
+	struct rb_node *rb;
+
+	rb = root->rb_node;
+	first = rb_entry(rb_first(root), struct ubi_wl_entry, u.rb);
+	last = rb_entry(rb_last(root), struct ubi_wl_entry, u.rb);
+
+	if (last->ec - first->ec < WL_FREE_MAX_DIFF) {
+		/* Currently, bakvol doesn't support fastmap */
+		while (rb) {
+			e = rb_entry(rb, struct ubi_wl_entry, u.rb);
+			if (e->pnum%2 == plane)
+				break;
+			rb = rb_next(rb);
+		/* Only returns specified plane peb */
+			e = NULL;
+		}
+	} else
+		e = find_wl_plane_entry(ubi, root, WL_FREE_MAX_DIFF/2, plane);
+
+	return e;
+}
+
 /**
  * wl_get_wle - get a mean wl entry to be used by ubi_wl_get_peb() or
  * refill_wl_user_pool().
@@ -403,6 +471,38 @@ static struct ubi_wl_entry *wl_get_wle(struct ubi_device *ubi)
 }
 
 /**
+ * wl_get_wle_plane - get a mean wl entry to be used by ubi_wl_get_plane_peb() or
+ * refill_wl_user_pool().
+ * @ubi: UBI device description object
+ * @plane: plane number
+ *
+ * This function returns a a wear leveling entry in case of success and
+ * NULL in case of failure.
+ */
+static struct ubi_wl_entry *wl_get_plane_wle(struct ubi_device *ubi, int plane)
+{
+	struct ubi_wl_entry *e;
+
+	e = find_mean_plane_wl_entry(ubi, &ubi->free, plane);
+	if (!e) {
+		ubi_err(ubi, "get mean plane eraseblocks failed");
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
+/**
  * prot_queue_del - remove a physical eraseblock from the protection queue.
  * @ubi: UBI device description object
  * @pnum: the physical eraseblock to remove
@@ -1751,6 +1851,7 @@ static int self_check_in_pq(const struct ubi_device *ubi,
 	dump_stack();
 	return -EINVAL;
 }
+
 #ifndef CONFIG_MTD_UBI_FASTMAP
 static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi)
 {
@@ -1839,6 +1940,45 @@ retry:
 
 	return e->pnum;
 }
+
+int ubi_wl_get_plane_peb(struct ubi_device *ubi, int plane)
+{
+	int err;
+	struct ubi_wl_entry *e;
+
+retry:
+	spin_lock(&ubi->wl_lock);
+	if (!ubi->free.rb_node) {
+		if (ubi->works_count == 0) {
+			ubi_err(ubi, "no free eraseblocks");
+			ubi_assert(list_empty(&ubi->works));
+			spin_unlock(&ubi->wl_lock);
+			return -ENOSPC;
+		}
+
+		err = produce_free_peb(ubi);
+		if (err < 0) {
+			spin_unlock(&ubi->wl_lock);
+			return err;
+		}
+		spin_unlock(&ubi->wl_lock);
+		goto retry;
+
+	}
+	e = wl_get_plane_wle(ubi, plane);
+	prot_queue_add(ubi, e);
+	spin_unlock(&ubi->wl_lock);
+
+	err = ubi_self_check_all_ff(ubi, e->pnum, ubi->vid_hdr_aloffset,
+				    ubi->peb_size - ubi->vid_hdr_aloffset);
+	if (err) {
+		ubi_err(ubi, "new PEB %d does not contain all 0xFF bytes", e->pnum);
+		return err;
+	}
+
+	return e->pnum;
+}
+
 #else
 #include "fastmap-wl.c"
 #endif
-- 
1.9.1
