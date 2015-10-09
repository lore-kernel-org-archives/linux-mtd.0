Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZkONr-00036q-NH
 for linux-mtd@lists.infradead.org; Fri, 09 Oct 2015 03:30:16 +0000
From: Heiko Schocher <hs@denx.de>
To: linux-kernel@vger.kernel.org
Cc: Heiko Schocher <hs@denx.de>, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Adrian Hunter <adrian.hunter@intel.com>
Subject: [PATCH] UBIFS: rename free variable
Date: Fri,  9 Oct 2015 05:29:48 +0200
Message-Id: <1444361388-12288-1-git-send-email-hs@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

rename free variable into not "free", as "free" prevents
ubifs sources compiling under U-Boot. So rename "free"
into "ifree", where it is an int.

Signed-off-by: Heiko Schocher <hs@denx.de>
---

 fs/ubifs/lprops.c | 54 +++++++++++++++++++++++++++---------------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
index a0011aa..74b9499 100644
--- a/fs/ubifs/lprops.c
+++ b/fs/ubifs/lprops.c
@@ -533,7 +533,7 @@ static int is_lprops_dirty(struct ubifs_info *c, struct ubifs_lprops *lprops)
  */
 const struct ubifs_lprops *ubifs_change_lp(struct ubifs_info *c,
 					   const struct ubifs_lprops *lp,
-					   int free, int dirty, int flags,
+					   int ifree, int dirty, int flags,
 					   int idx_gc_cnt)
 {
 	/*
@@ -555,7 +555,7 @@ const struct ubifs_lprops *ubifs_change_lp(struct ubifs_info *c,
 	ubifs_assert(!(c->lst.total_free & 7) && !(c->lst.total_dirty & 7));
 	ubifs_assert(!(c->lst.total_dead & 7) && !(c->lst.total_dark & 7));
 	ubifs_assert(!(c->lst.total_used & 7));
-	ubifs_assert(free == LPROPS_NC || free >= 0);
+	ubifs_assert(ifree == LPROPS_NC || ifree >= 0);
 	ubifs_assert(dirty == LPROPS_NC || dirty >= 0);
 
 	if (!is_lprops_dirty(c, lprops)) {
@@ -583,17 +583,17 @@ const struct ubifs_lprops *ubifs_change_lp(struct ubifs_info *c,
 		c->lst.total_used -= c->leb_size - old_spc;
 	}
 
-	if (free != LPROPS_NC) {
-		free = ALIGN(free, 8);
-		c->lst.total_free += free - lprops->free;
+	if (ifree != LPROPS_NC) {
+		ifree = ALIGN(ifree, 8);
+		c->lst.total_free += ifree - lprops->free;
 
 		/* Increase or decrease empty LEBs counter if needed */
-		if (free == c->leb_size) {
+		if (ifree == c->leb_size) {
 			if (lprops->free != c->leb_size)
 				c->lst.empty_lebs += 1;
 		} else if (lprops->free == c->leb_size)
 			c->lst.empty_lebs -= 1;
-		lprops->free = free;
+		lprops->free = ifree;
 	}
 
 	if (dirty != LPROPS_NC) {
@@ -660,7 +660,7 @@ void ubifs_get_lp_stats(struct ubifs_info *c, struct ubifs_lp_stats *lst)
  * same as in case of 'ubifs_change_lp()'. Returns zero in case of success and
  * a negative error code in case of failure.
  */
-int ubifs_change_one_lp(struct ubifs_info *c, int lnum, int free, int dirty,
+int ubifs_change_one_lp(struct ubifs_info *c, int lnum, int ifree, int dirty,
 			int flags_set, int flags_clean, int idx_gc_cnt)
 {
 	int err = 0, flags;
@@ -675,7 +675,7 @@ int ubifs_change_one_lp(struct ubifs_info *c, int lnum, int free, int dirty,
 	}
 
 	flags = (lp->flags | flags_set) & ~flags_clean;
-	lp = ubifs_change_lp(c, lp, free, dirty, flags, idx_gc_cnt);
+	lp = ubifs_change_lp(c, lp, ifree, dirty, flags, idx_gc_cnt);
 	if (IS_ERR(lp))
 		err = PTR_ERR(lp);
 
@@ -699,7 +699,7 @@ out:
  * This function is the same as 'ubifs_change_one_lp()' but @dirty is added to
  * current dirty space, not substitutes it.
  */
-int ubifs_update_one_lp(struct ubifs_info *c, int lnum, int free, int dirty,
+int ubifs_update_one_lp(struct ubifs_info *c, int lnum, int ifree, int dirty,
 			int flags_set, int flags_clean)
 {
 	int err = 0, flags;
@@ -714,7 +714,7 @@ int ubifs_update_one_lp(struct ubifs_info *c, int lnum, int free, int dirty,
 	}
 
 	flags = (lp->flags | flags_set) & ~flags_clean;
-	lp = ubifs_change_lp(c, lp, free, lp->dirty + dirty, flags, 0);
+	lp = ubifs_change_lp(c, lp, ifree, lp->dirty + dirty, flags, 0);
 	if (IS_ERR(lp))
 		err = PTR_ERR(lp);
 
@@ -1032,7 +1032,7 @@ static int scan_check_cb(struct ubifs_info *c,
 {
 	struct ubifs_scan_leb *sleb;
 	struct ubifs_scan_node *snod;
-	int cat, lnum = lp->lnum, is_idx = 0, used = 0, free, dirty, ret;
+	int cat, lnum = lp->lnum, is_idx = 0, used = 0, ifree, dirty, ret;
 	void *buf = NULL;
 
 	cat = lp->flags & LPROPS_CAT_MASK;
@@ -1154,20 +1154,20 @@ static int scan_check_cb(struct ubifs_info *c,
 		}
 	}
 
-	free = c->leb_size - sleb->endpt;
+	ifree = c->leb_size - sleb->endpt;
 	dirty = sleb->endpt - used;
 
-	if (free > c->leb_size || free < 0 || dirty > c->leb_size ||
+	if (ifree > c->leb_size || ifree < 0 || dirty > c->leb_size ||
 	    dirty < 0) {
 		ubifs_err(c, "bad calculated accounting for LEB %d: free %d, dirty %d",
-			  lnum, free, dirty);
+			  lnum, ifree, dirty);
 		goto out_destroy;
 	}
 
 	if (lp->free + lp->dirty == c->leb_size &&
-	    free + dirty == c->leb_size)
+	    ifree + dirty == c->leb_size)
 		if ((is_idx && !(lp->flags & LPROPS_INDEX)) ||
-		    (!is_idx && free == c->leb_size) ||
+		    (!is_idx && ifree == c->leb_size) ||
 		    lp->free == c->leb_size) {
 			/*
 			 * Empty or freeable LEBs could contain index
@@ -1176,12 +1176,12 @@ static int scan_check_cb(struct ubifs_info *c,
 			 * the same reason. Or it may simply not have been
 			 * unmapped.
 			 */
-			free = lp->free;
+			ifree = lp->free;
 			dirty = lp->dirty;
 			is_idx = 0;
 		    }
 
-	if (is_idx && lp->free + lp->dirty == free + dirty &&
+	if (is_idx && lp->free + lp->dirty == ifree + dirty &&
 	    lnum != c->ihead_lnum) {
 		/*
 		 * After an unclean unmount, an index LEB could have a different
@@ -1194,15 +1194,15 @@ static int scan_check_cb(struct ubifs_info *c,
 		 * write to the free space at the end of an index LEB - except
 		 * by the in-the-gaps method for which it is not a problem.
 		 */
-		free = lp->free;
+		ifree = lp->free;
 		dirty = lp->dirty;
 	}
 
-	if (lp->free != free || lp->dirty != dirty)
+	if (lp->free != ifree || lp->dirty != dirty)
 		goto out_print;
 
 	if (is_idx && !(lp->flags & LPROPS_INDEX)) {
-		if (free == c->leb_size)
+		if (ifree == c->leb_size)
 			/* Free but not unmapped LEB, it's fine */
 			is_idx = 0;
 		else {
@@ -1216,19 +1216,19 @@ static int scan_check_cb(struct ubifs_info *c,
 		goto out_print;
 	}
 
-	if (free == c->leb_size)
+	if (ifree == c->leb_size)
 		lst->empty_lebs += 1;
 
 	if (is_idx)
 		lst->idx_lebs += 1;
 
 	if (!(lp->flags & LPROPS_INDEX))
-		lst->total_used += c->leb_size - free - dirty;
-	lst->total_free += free;
+		lst->total_used += c->leb_size - ifree - dirty;
+	lst->total_free += ifree;
 	lst->total_dirty += dirty;
 
 	if (!(lp->flags & LPROPS_INDEX)) {
-		int spc = free + dirty;
+		int spc = ifree + dirty;
 
 		if (spc < c->dead_wm)
 			lst->total_dead += spc;
@@ -1242,7 +1242,7 @@ static int scan_check_cb(struct ubifs_info *c,
 
 out_print:
 	ubifs_err(c, "bad accounting of LEB %d: free %d, dirty %d flags %#x, should be free %d, dirty %d",
-		  lnum, lp->free, lp->dirty, lp->flags, free, dirty);
+		  lnum, lp->free, lp->dirty, lp->flags, ifree, dirty);
 	ubifs_dump_leb(c, lnum);
 out_destroy:
 	ubifs_scan_destroy(sleb);
-- 
2.1.0
