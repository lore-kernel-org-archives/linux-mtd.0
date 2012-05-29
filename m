Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SZMme-0002hk-MQ
 for linux-mtd@lists.infradead.org; Tue, 29 May 2012 13:48:25 +0000
Received: by laap9 with SMTP id p9so3298917laa.36
 for <linux-mtd@lists.infradead.org>; Tue, 29 May 2012 06:48:22 -0700 (PDT)
Date: Tue, 29 May 2012 16:48:11 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Subject: [PATCH] ubi: fastmap: harmonize medium erase-counter seek algorithm
Message-ID: <20120529164811.5e86b190@pixies.home.jungo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Heinz.Egger@linutronix.de, tglx@linutronix.de,
 linux-mtd@lists.infradead.org, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently, there are two different locations where a wear-leveling entry
with a medium erase counter is looked-for, with the same search algorithm
duplicated.

Harmonize this by introducing a common function 'find_mean_wl_entry'.

Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
---
Compile tested.
Applies to branch fastmap on linux-ubi.

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 7d34495..6727b6c 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -386,6 +386,29 @@ static struct ubi_wl_entry *find_wl_entry(struct rb_root *root, int diff)
 }
 
 /**
+ * find_mean_wl_entry - find wear-leveling entry with medium erase counter.
+ * @root: the RB-tree where to look for
+ *
+ * This function looks for a wear leveling entry with medium erase counter,
+ * but not greater or equivalent than the lowest erase counter plus
+ * %WL_FREE_MAX_DIFF/2.
+ */
+static struct ubi_wl_entry *find_mean_wl_entry(struct rb_root *root)
+{
+	struct ubi_wl_entry *e, *first, *last;
+
+	first = rb_entry(rb_first(root), struct ubi_wl_entry, u.rb);
+	last = rb_entry(rb_last(root), struct ubi_wl_entry, u.rb);
+
+	if (last->ec - first->ec < WL_FREE_MAX_DIFF)
+		e = rb_entry(root->rb_node, struct ubi_wl_entry, u.rb);
+	else
+		e = find_wl_entry(root, WL_FREE_MAX_DIFF/2);
+
+	return e;
+}
+
+/**
  * find_early_wl_entry - find wear-leveling entry with the lowest pnum.
  * @root: the RB-tree where to look for
  * @max_pnum: highest possible pnum
@@ -419,7 +442,7 @@ static struct ubi_wl_entry *find_early_wl_entry(struct rb_root *root,
 int ubi_wl_get_fm_peb(struct ubi_device *ubi, int max_pnum)
 {
 	int ret = -ENOSPC;
-	struct ubi_wl_entry *e, *first, *last;
+	struct ubi_wl_entry *e;
 
 	if (!ubi->free.rb_node) {
 		ubi_err("no free eraseblocks");
@@ -427,18 +450,9 @@ int ubi_wl_get_fm_peb(struct ubi_device *ubi, int max_pnum)
 		goto out;
 	}
 
-	if (max_pnum < 0) {
-		first = rb_entry(rb_first(&ubi->free),
-			struct ubi_wl_entry, u.rb);
-		last = rb_entry(rb_last(&ubi->free),
-			struct ubi_wl_entry, u.rb);
-
-		if (last->ec - first->ec < WL_FREE_MAX_DIFF)
-			e = rb_entry(ubi->free.rb_node,
-				struct ubi_wl_entry, u.rb);
-		else
-			e = find_wl_entry(&ubi->free, WL_FREE_MAX_DIFF/2);
-	} else
+	if (max_pnum < 0)
+		e = find_mean_wl_entry(&ubi->free);
+	else
 		e = find_early_wl_entry(&ubi->free, max_pnum);
 
 	if (!e)
@@ -464,7 +478,7 @@ out:
 static int __ubi_wl_get_peb(struct ubi_device *ubi)
 {
 	int err;
-	struct ubi_wl_entry *e, *first, *last;
+	struct ubi_wl_entry *e;
 
 retry:
 	spin_lock(&ubi->wl_lock);
@@ -483,13 +497,7 @@ retry:
 		goto retry;
 	}
 
-	first = rb_entry(rb_first(&ubi->free), struct ubi_wl_entry, u.rb);
-	last = rb_entry(rb_last(&ubi->free), struct ubi_wl_entry, u.rb);
-
-	if (last->ec - first->ec < WL_FREE_MAX_DIFF)
-		e = rb_entry(ubi->free.rb_node, struct ubi_wl_entry, u.rb);
-	else
-		e = find_wl_entry(&ubi->free, WL_FREE_MAX_DIFF/2);
+	e = find_mean_wl_entry(&ubi->free);
 
 	self_check_in_wl_tree(ubi, e, &ubi->free);
