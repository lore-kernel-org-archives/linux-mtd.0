Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MoFyY-0008Uj-1z
	for linux-mtd@lists.infradead.org; Thu, 17 Sep 2009 12:20:42 +0000
Received: from vaebh106.NOE.Nokia.com (vaebh106.europe.nokia.com
	[10.160.244.32])
	by mgw-mx06.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	n8HCJvnd027881
	for <linux-mtd@lists.infradead.org>; Thu, 17 Sep 2009 15:20:21 +0300
From: Artem Bityutskiy <dedekind@infradead.org>
To: Adrian Hunter <Adrian.Hunter@nokia.com>
Subject: [PATCH 4/5] UBIFS: improve lprops dump
Date: Thu, 17 Sep 2009 15:19:55 +0300
Message-Id: <1253189996-14191-5-git-send-email-dedekind@infradead.org>
In-Reply-To: <1253189996-14191-1-git-send-email-dedekind@infradead.org>
References: <1253189996-14191-1-git-send-email-dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Improve 'dbg_dump_lprop()' and print dark and dead space there,
decode flags, and journal heads.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c  |   87 +++++++++++++++++++++++++++++++++++++++++++++++++++--
 fs/ubifs/lprops.c |   27 +++++++---------
 fs/ubifs/ubifs.h  |    1 +
 3 files changed, 97 insertions(+), 18 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 9690004..fd3f07e 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -663,9 +663,90 @@ void dbg_dump_budg(struct ubifs_info *c)
 
 void dbg_dump_lprop(const struct ubifs_info *c, const struct ubifs_lprops *lp)
 {
-	printk(KERN_DEBUG "LEB %d lprops: free %d, dirty %d (used %d), "
-	       "flags %#x\n", lp->lnum, lp->free, lp->dirty,
-	       c->leb_size - lp->free - lp->dirty, lp->flags);
+	int i, spc, dark = 0, dead = 0;
+	struct rb_node *rb;
+	struct ubifs_bud *bud;
+
+	spc = lp->free + lp->dirty;
+	if (spc < c->dead_wm)
+		dead = spc;
+	else
+		dark = ubifs_calc_dark(c, spc);
+
+	if (lp->flags & LPROPS_INDEX)
+		printk(KERN_DEBUG "LEB %-7d free %-8d dirty %-8d used %-8d "
+		       "free + dirty %-8d flags %#x (", lp->lnum, lp->free,
+		       lp->dirty, c->leb_size - spc, spc, lp->flags);
+	else
+		printk(KERN_DEBUG "LEB %-7d free %-8d dirty %-8d used %-8d "
+		       "free + dirty %-8d dark %-4d dead %-4d nodes fit %-3d "
+		       "flags %#-4x (", lp->lnum, lp->free, lp->dirty,
+		       c->leb_size - spc, spc, dark, dead,
+		       (int)(spc / UBIFS_MAX_NODE_SZ), lp->flags);
+
+	if (lp->flags & LPROPS_TAKEN) {
+		if (lp->flags & LPROPS_INDEX)
+			printk(KERN_CONT "index, taken");
+		else
+			printk(KERN_CONT "taken");
+	} else {
+		const char *s;
+
+		if (lp->flags & LPROPS_INDEX) {
+			switch (lp->flags & LPROPS_CAT_MASK) {
+			case LPROPS_DIRTY_IDX:
+				s = "dirty index";
+				break;
+			case LPROPS_FRDI_IDX:
+				s = "freeable index";
+				break;
+			default:
+				s = "index";
+			}
+		} else {
+			switch (lp->flags & LPROPS_CAT_MASK) {
+			case LPROPS_UNCAT:
+				s = "not categorized";
+				break;
+			case LPROPS_DIRTY:
+				s = "dirty";
+				break;
+			case LPROPS_FREE:
+				s = "free";
+				break;
+			case LPROPS_EMPTY:
+				s = "empty";
+				break;
+			case LPROPS_FREEABLE:
+				s = "freeable";
+				break;
+			default:
+				s = NULL;
+				break;
+			}
+		}
+		printk(KERN_CONT "%s", s);
+	}
+
+	for (rb = rb_first((struct rb_root *)&c->buds); rb; rb = rb_next(rb)) {
+		bud = rb_entry(rb, struct ubifs_bud, rb);
+		if (bud->lnum == lp->lnum) {
+			int head = 0;
+			for (i = 0; i < c->jhead_cnt; i++) {
+				if (lp->lnum == c->jheads[i].wbuf.lnum) {
+					printk(KERN_CONT ", jhead %s",
+					       dbg_jhead(i));
+					head = 1;
+				}
+			}
+			if (!head)
+				printk(KERN_CONT ", bud of jhead %s",
+				       dbg_jhead(bud->jhead));
+		}
+	}
+	if (lp->lnum == c->gc_lnum)
+		printk(KERN_CONT ", GC LEB");
+	printk(KERN_CONT ")\n");
 }
 
 void dbg_dump_lprops(struct ubifs_info *c)
diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
index 89b355a..4d4ca38 100644
--- a/fs/ubifs/lprops.c
+++ b/fs/ubifs/lprops.c
@@ -461,21 +461,18 @@ static void change_category(struct ubifs_info *c, struct ubifs_lprops *lprops)
 }
 
 /**
- * calc_dark - calculate LEB dark space size.
+ * ubifs_calc_dark - calculate LEB dark space size.
  * @c: the UBIFS file-system description object
  * @spc: amount of free and dirty space in the LEB
  *
- * This function calculates amount of dark space in an LEB which has @spc bytes
- * of free and dirty space. Returns the calculations result.
+ * This function calculates and returns amount of dark space in an LEB which
+ * has @spc bytes of free and dirty space.
  *
- * Dark space is the space which is not always usable - it depends on which
- * nodes are written in which order. E.g., if an LEB has only 512 free bytes,
- * it is dark space, because it cannot fit a large data node. So UBIFS cannot
- * count on this LEB and treat these 512 bytes as usable because it is not true
- * if, for example, only big chunks of uncompressible data will be written to
- * the FS.
+ * UBIFS is trying to account the space which might not be usable, and this
+ * space is called "dark space". For example, if an LEB has only %512 free
+ * bytes, it is dark space, because it cannot fit a large data node.
  */
-static int calc_dark(struct ubifs_info *c, int spc)
+int ubifs_calc_dark(const struct ubifs_info *c, int spc)
 {
 	ubifs_assert(!(spc & 7));
 
@@ -575,7 +572,7 @@ const struct ubifs_lprops *ubifs_change_lp(struct ubifs_info *c,
 		if (old_spc < c->dead_wm)
 			c->lst.total_dead -= old_spc;
 		else
-			c->lst.total_dark -= calc_dark(c, old_spc);
+			c->lst.total_dark -= ubifs_calc_dark(c, old_spc);
 
 		c->lst.total_used -= c->leb_size - old_spc;
 	}
@@ -616,7 +613,7 @@ const struct ubifs_lprops *ubifs_change_lp(struct ubifs_info *c,
 		if (new_spc < c->dead_wm)
 			c->lst.total_dead += new_spc;
 		else
-			c->lst.total_dark += calc_dark(c, new_spc);
+			c->lst.total_dark += ubifs_calc_dark(c, new_spc);
 
 		c->lst.total_used += c->leb_size - new_spc;
 	}
@@ -1107,7 +1104,7 @@ static int scan_check_cb(struct ubifs_info *c,
 				  "- continuing checking");
 			lst->empty_lebs += 1;
 			lst->total_free += c->leb_size;
-			lst->total_dark += calc_dark(c, c->leb_size);
+			lst->total_dark += ubifs_calc_dark(c, c->leb_size);
 			return LPT_SCAN_CONTINUE;
 		}
 
@@ -1117,7 +1114,7 @@ static int scan_check_cb(struct ubifs_info *c,
 				  "- continuing checking");
 			lst->total_free  += lp->free;
 			lst->total_dirty += lp->dirty;
-			lst->total_dark  +=  calc_dark(c, c->leb_size);
+			lst->total_dark  +=  ubifs_calc_dark(c, c->leb_size);
 			return LPT_SCAN_CONTINUE;
 		}
 		data->err = PTR_ERR(sleb);
@@ -1235,7 +1232,7 @@ static int scan_check_cb(struct ubifs_info *c,
 		if (spc < c->dead_wm)
 			lst->total_dead += spc;
 		else
-			lst->total_dark += calc_dark(c, spc);
+			lst->total_dark += ubifs_calc_dark(c, spc);
 	}
 
 	ubifs_scan_destroy(sleb);
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 8ca441f..b2d9763 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1674,6 +1674,7 @@ const struct ubifs_lprops *ubifs_fast_find_free(struct ubifs_info *c);
 const struct ubifs_lprops *ubifs_fast_find_empty(struct ubifs_info *c);
 const struct ubifs_lprops *ubifs_fast_find_freeable(struct ubifs_info *c);
 const struct ubifs_lprops *ubifs_fast_find_frdi_idx(struct ubifs_info *c);
+int ubifs_calc_dark(const struct ubifs_info *c, int spc);
 
 /* file.c */
 int ubifs_fsync(struct file *file, struct dentry *dentry, int datasync);
-- 
1.6.2.5
