Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLsQH-0003Z2-R8
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 07:41:09 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4G7eTFQ011093
	for <linux-mtd@lists.infradead.org>; Mon, 16 May 2011 10:41:00 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 03/20] UBIFS: simplify lprops debugging check
Date: Mon, 16 May 2011 10:44:22 +0300
Message-Id: <1305531879-19311-4-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1305531879-19311-1-git-send-email-dedekind1@gmail.com>
References: <1305531879-19311-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Now we return all errors from 'scan_check_cb()' directly, so we do not need
'struct scan_check_data' any more, and this patch removes it.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/lprops.c |   48 +++++++++++++++---------------------------------
 1 files changed, 15 insertions(+), 33 deletions(-)

diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
index ac4521a..77c541b 100644
--- a/fs/ubifs/lprops.c
+++ b/fs/ubifs/lprops.c
@@ -1007,21 +1007,11 @@ out:
 }
 
 /**
- * struct scan_check_data - data provided to scan callback function.
- * @lst: LEB properties statistics
- * @err: error code
- */
-struct scan_check_data {
-	struct ubifs_lp_stats lst;
-	int err;
-};
-
-/**
  * scan_check_cb - scan callback.
  * @c: the UBIFS file-system description object
  * @lp: LEB properties to scan
  * @in_tree: whether the LEB properties are in main memory
- * @data: information passed to and from the caller of the scan
+ * @lst: lprops statistics to update
  *
  * This function returns a code that indicates whether the scan should continue
  * (%LPT_SCAN_CONTINUE), whether the LEB properties should be added to the tree
@@ -1030,11 +1020,10 @@ struct scan_check_data {
  */
 static int scan_check_cb(struct ubifs_info *c,
 			 const struct ubifs_lprops *lp, int in_tree,
-			 struct scan_check_data *data)
+			 struct ubifs_lp_stats *lst)
 {
 	struct ubifs_scan_leb *sleb;
 	struct ubifs_scan_node *snod;
-	struct ubifs_lp_stats *lst = &data->lst;
 	int cat, lnum = lp->lnum, is_idx = 0, used = 0, free, dirty, ret;
 	void *buf = NULL;
 
@@ -1267,8 +1256,7 @@ out:
 int dbg_check_lprops(struct ubifs_info *c)
 {
 	int i, err;
-	struct scan_check_data data;
-	struct ubifs_lp_stats *lst = &data.lst;
+	struct ubifs_lp_stats lst;
 
 	if (!(ubifs_chk_flags & UBIFS_CHK_LPROPS))
 		return 0;
@@ -1283,29 +1271,23 @@ int dbg_check_lprops(struct ubifs_info *c)
 			return err;
 	}
 
-	memset(lst, 0, sizeof(struct ubifs_lp_stats));
-
-	data.err = 0;
+	memset(&lst, 0, sizeof(struct ubifs_lp_stats));
 	err = ubifs_lpt_scan_nolock(c, c->main_first, c->leb_cnt - 1,
 				    (ubifs_lpt_scan_callback)scan_check_cb,
-				    &data);
+				    &lst);
 	if (err && err != -ENOSPC)
 		goto out;
-	if (data.err) {
-		err = data.err;
-		goto out;
-	}
 
-	if (lst->empty_lebs != c->lst.empty_lebs ||
-	    lst->idx_lebs != c->lst.idx_lebs ||
-	    lst->total_free != c->lst.total_free ||
-	    lst->total_dirty != c->lst.total_dirty ||
-	    lst->total_used != c->lst.total_used) {
+	if (lst.empty_lebs != c->lst.empty_lebs ||
+	    lst.idx_lebs != c->lst.idx_lebs ||
+	    lst.total_free != c->lst.total_free ||
+	    lst.total_dirty != c->lst.total_dirty ||
+	    lst.total_used != c->lst.total_used) {
 		ubifs_err("bad overall accounting");
 		ubifs_err("calculated: empty_lebs %d, idx_lebs %d, "
 			  "total_free %lld, total_dirty %lld, total_used %lld",
-			  lst->empty_lebs, lst->idx_lebs, lst->total_free,
-			  lst->total_dirty, lst->total_used);
+			  lst.empty_lebs, lst.idx_lebs, lst.total_free,
+			  lst.total_dirty, lst.total_used);
 		ubifs_err("read from lprops: empty_lebs %d, idx_lebs %d, "
 			  "total_free %lld, total_dirty %lld, total_used %lld",
 			  c->lst.empty_lebs, c->lst.idx_lebs, c->lst.total_free,
@@ -1314,11 +1296,11 @@ int dbg_check_lprops(struct ubifs_info *c)
 		goto out;
 	}
 
-	if (lst->total_dead != c->lst.total_dead ||
-	    lst->total_dark != c->lst.total_dark) {
+	if (lst.total_dead != c->lst.total_dead ||
+	    lst.total_dark != c->lst.total_dark) {
 		ubifs_err("bad dead/dark space accounting");
 		ubifs_err("calculated: total_dead %lld, total_dark %lld",
-			  lst->total_dead, lst->total_dark);
+			  lst.total_dead, lst.total_dark);
 		ubifs_err("read from lprops: total_dead %lld, total_dark %lld",
 			  c->lst.total_dead, c->lst.total_dark);
 		err = -EINVAL;
-- 
1.7.2.3
