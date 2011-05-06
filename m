Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QIMet-0000Qe-39
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 15:09:36 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH] UBIFS: share the next_log_lnum helper
Date: Fri,  6 May 2011 18:13:25 +0300
Message-Id: <1304694805-32335-1-git-send-email-dedekind1@gmail.com>
Cc: "Matthew L. Creech" <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

We'll need to use the 'next_log_lnum()' helper function from log.c in the fixup
code, so let's move it to misc.h. IOW, this is a preparation to the following
free space fixup changes.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/log.c  |   28 +++++++---------------------
 fs/ubifs/misc.h |   17 +++++++++++++++++
 2 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/fs/ubifs/log.c b/fs/ubifs/log.c
index 40fa780..affea94 100644
--- a/fs/ubifs/log.c
+++ b/fs/ubifs/log.c
@@ -100,20 +100,6 @@ struct ubifs_wbuf *ubifs_get_wbuf(struct ubifs_info *c, int lnum)
 }
 
 /**
- * next_log_lnum - switch to the next log LEB.
- * @c: UBIFS file-system description object
- * @lnum: current log LEB
- */
-static inline int next_log_lnum(const struct ubifs_info *c, int lnum)
-{
-	lnum += 1;
-	if (lnum > c->log_last)
-		lnum = UBIFS_LOG_LNUM;
-
-	return lnum;
-}
-
-/**
  * empty_log_bytes - calculate amount of empty space in the log.
  * @c: UBIFS file-system description object
  */
@@ -257,7 +243,7 @@ int ubifs_add_bud_to_log(struct ubifs_info *c, int jhead, int lnum, int offs)
 	ref->jhead = cpu_to_le32(jhead);
 
 	if (c->lhead_offs > c->leb_size - c->ref_node_alsz) {
-		c->lhead_lnum = next_log_lnum(c, c->lhead_lnum);
+		c->lhead_lnum = ubifs_next_log_lnum(c, c->lhead_lnum);
 		c->lhead_offs = 0;
 	}
 
@@ -425,7 +411,7 @@ int ubifs_log_start_commit(struct ubifs_info *c, int *ltail_lnum)
 
 	/* Switch to the next log LEB */
 	if (c->lhead_offs) {
-		c->lhead_lnum = next_log_lnum(c, c->lhead_lnum);
+		c->lhead_lnum = ubifs_next_log_lnum(c, c->lhead_lnum);
 		c->lhead_offs = 0;
 	}
 
@@ -446,7 +432,7 @@ int ubifs_log_start_commit(struct ubifs_info *c, int *ltail_lnum)
 
 	c->lhead_offs += len;
 	if (c->lhead_offs == c->leb_size) {
-		c->lhead_lnum = next_log_lnum(c, c->lhead_lnum);
+		c->lhead_lnum = ubifs_next_log_lnum(c, c->lhead_lnum);
 		c->lhead_offs = 0;
 	}
 
@@ -533,7 +519,7 @@ int ubifs_log_post_commit(struct ubifs_info *c, int old_ltail_lnum)
 	}
 	mutex_lock(&c->log_mutex);
 	for (lnum = old_ltail_lnum; lnum != c->ltail_lnum;
-	     lnum = next_log_lnum(c, lnum)) {
+	     lnum = ubifs_next_log_lnum(c, lnum)) {
 		dbg_log("unmap log LEB %d", lnum);
 		err = ubifs_leb_unmap(c, lnum);
 		if (err)
@@ -642,7 +628,7 @@ static int add_node(struct ubifs_info *c, void *buf, int *lnum, int *offs,
 		err = ubifs_leb_change(c, *lnum, buf, sz, UBI_SHORTTERM);
 		if (err)
 			return err;
-		*lnum = next_log_lnum(c, *lnum);
+		*lnum = ubifs_next_log_lnum(c, *lnum);
 		*offs = 0;
 	}
 	memcpy(buf + *offs, node, len);
@@ -712,7 +698,7 @@ int ubifs_consolidate_log(struct ubifs_info *c)
 		ubifs_scan_destroy(sleb);
 		if (lnum == c->lhead_lnum)
 			break;
-		lnum = next_log_lnum(c, lnum);
+		lnum = ubifs_next_log_lnum(c, lnum);
 	}
 	if (offs) {
 		int sz = ALIGN(offs, c->min_io_size);
@@ -732,7 +718,7 @@ int ubifs_consolidate_log(struct ubifs_info *c)
 	/* Unmap remaining LEBs */
 	lnum = write_lnum;
 	do {
-		lnum = next_log_lnum(c, lnum);
+		lnum = ubifs_next_log_lnum(c, lnum);
 		err = ubifs_leb_unmap(c, lnum);
 		if (err)
 			return err;
diff --git a/fs/ubifs/misc.h b/fs/ubifs/misc.h
index c3de04d..0b5296a 100644
--- a/fs/ubifs/misc.h
+++ b/fs/ubifs/misc.h
@@ -340,4 +340,21 @@ static inline void ubifs_release_lprops(struct ubifs_info *c)
 	mutex_unlock(&c->lp_mutex);
 }
 
+/**
+ * ubifs_next_log_lnum - switch to the next log LEB.
+ * @c: UBIFS file-system description object
+ * @lnum: current log LEB
+ *
+ * This helper function returns the log LEB number which goes next after LEB
+ * 'lnum'.
+ */
+static inline int ubifs_next_log_lnum(const struct ubifs_info *c, int lnum)
+{
+	lnum += 1;
+	if (lnum > c->log_last)
+		lnum = UBIFS_LOG_LNUM;
+
+	return lnum;
+}
+
 #endif /* __UBIFS_MISC_H__ */
-- 
1.7.2.3
