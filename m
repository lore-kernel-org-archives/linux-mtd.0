Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MfwHF-0004aP-Ba
	for linux-mtd@lists.infradead.org; Tue, 25 Aug 2009 13:41:38 +0000
Received: from vaebh106.NOE.Nokia.com (vaebh106.europe.nokia.com
	[10.160.244.32])
	by mgw-mx03.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	n7PDfLNo024803
	for <linux-mtd@lists.infradead.org>; Tue, 25 Aug 2009 16:41:22 +0300
From: Artem Bityutskiy <dedekind@infradead.org>
To: Adrian Hunter <Adrian.Hunter@nokia.com>
Subject: [PATCH 1/2] UBIFS: do not print scary error messages needlessly
Date: Tue, 25 Aug 2009 16:41:13 +0300
Message-Id: <1251207674-14299-1-git-send-email-dedekind@infradead.org>
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

At the moment UBIFS print large and scary error messages and
flash dumps in case of nearly any corruption, even if it is
a recoverable corruption. For example, if the master node is
corrupted, ubifs_scan() prints error dumps, then UBIFS recovers
just fine and goes on.

This patch makes UBIFS print scary error messages only in
real cases, which are not recoverable. It adds 'quiet' argument
to the 'ubifs_scan()' function, so the caller may ask 'ubi_scan()'
not to print error messages if the caller is able to do recovery.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c      |    2 +-
 fs/ubifs/gc.c         |    2 +-
 fs/ubifs/log.c        |    2 +-
 fs/ubifs/lprops.c     |    2 +-
 fs/ubifs/master.c     |    4 ++--
 fs/ubifs/orphan.c     |    4 ++--
 fs/ubifs/recovery.c   |    4 ++--
 fs/ubifs/replay.c     |    6 +++---
 fs/ubifs/scan.c       |   32 ++++++++++++++++++++++----------
 fs/ubifs/tnc_commit.c |    2 +-
 fs/ubifs/ubifs.h      |    2 +-
 11 files changed, 37 insertions(+), 25 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index ce2cd83..8183ee0 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -724,7 +724,7 @@ void dbg_dump_leb(const struct ubifs_info *c, int lnum)
 
 	printk(KERN_DEBUG "(pid %d) start dumping LEB %d\n",
 	       current->pid, lnum);
-	sleb = ubifs_scan(c, lnum, 0, c->dbg->buf);
+	sleb = ubifs_scan(c, lnum, 0, c->dbg->buf, 0);
 	if (IS_ERR(sleb)) {
 		ubifs_err("scan error %d", (int)PTR_ERR(sleb));
 		return;
diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index f0f5f15..618c270 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -529,7 +529,7 @@ int ubifs_garbage_collect_leb(struct ubifs_info *c, struct ubifs_lprops *lp)
 	 * We scan the entire LEB even though we only really need to scan up to
 	 * (c->leb_size - lp->free).
 	 */
-	sleb = ubifs_scan(c, lnum, 0, c->sbuf);
+	sleb = ubifs_scan(c, lnum, 0, c->sbuf, 0);
 	if (IS_ERR(sleb))
 		return PTR_ERR(sleb);
 
diff --git a/fs/ubifs/log.c b/fs/ubifs/log.c
index 56e3377..60dcf6c 100644
--- a/fs/ubifs/log.c
+++ b/fs/ubifs/log.c
@@ -695,7 +695,7 @@ int ubifs_consolidate_log(struct ubifs_info *c)
 	lnum = c->ltail_lnum;
 	write_lnum = lnum;
 	while (1) {
-		sleb = ubifs_scan(c, lnum, 0, c->sbuf);
+		sleb = ubifs_scan(c, lnum, 0, c->sbuf, 0);
 		if (IS_ERR(sleb)) {
 			err = PTR_ERR(sleb);
 			goto out_free;
diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
index 4cdd284..00f19b4 100644
--- a/fs/ubifs/lprops.c
+++ b/fs/ubifs/lprops.c
@@ -1096,7 +1096,7 @@ static int scan_check_cb(struct ubifs_info *c,
 		}
 	}
 
-	sleb = ubifs_scan(c, lnum, 0, c->dbg->buf);
+	sleb = ubifs_scan(c, lnum, 0, c->dbg->buf, 0);
 	if (IS_ERR(sleb)) {
 		/*
 		 * After an unclean unmount, empty and freeable LEBs
diff --git a/fs/ubifs/master.c b/fs/ubifs/master.c
index a88f338..6f95a16 100644
--- a/fs/ubifs/master.c
+++ b/fs/ubifs/master.c
@@ -40,7 +40,7 @@ static int scan_for_master(struct ubifs_info *c)
 
 	lnum = UBIFS_MST_LNUM;
 
-	sleb = ubifs_scan(c, lnum, 0, c->sbuf);
+	sleb = ubifs_scan(c, lnum, 0, c->sbuf, 1);
 	if (IS_ERR(sleb))
 		return PTR_ERR(sleb);
 	nodes_cnt = sleb->nodes_cnt;
@@ -56,7 +56,7 @@ static int scan_for_master(struct ubifs_info *c)
 
 	lnum += 1;
 
-	sleb = ubifs_scan(c, lnum, 0, c->sbuf);
+	sleb = ubifs_scan(c, lnum, 0, c->sbuf, 1);
 	if (IS_ERR(sleb))
 		return PTR_ERR(sleb);
 	if (sleb->nodes_cnt != nodes_cnt)
diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index 152a7b3..3119af3 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -670,7 +670,7 @@ static int kill_orphans(struct ubifs_info *c)
 		struct ubifs_scan_leb *sleb;
 
 		dbg_rcvry("LEB %d", lnum);
-		sleb = ubifs_scan(c, lnum, 0, c->sbuf);
+		sleb = ubifs_scan(c, lnum, 0, c->sbuf, 1);
 		if (IS_ERR(sleb)) {
 			sleb = ubifs_recover_leb(c, lnum, 0, c->sbuf, 0);
 			if (IS_ERR(sleb)) {
@@ -899,7 +899,7 @@ static int dbg_scan_orphans(struct ubifs_info *c, struct check_info *ci)
 	for (lnum = c->orph_first; lnum <= c->orph_last; lnum++) {
 		struct ubifs_scan_leb *sleb;
 
-		sleb = ubifs_scan(c, lnum, 0, c->dbg->buf);
+		sleb = ubifs_scan(c, lnum, 0, c->dbg->buf, 0);
 		if (IS_ERR(sleb)) {
 			err = PTR_ERR(sleb);
 			break;
diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index e5f6cf8..f94ddf7 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -286,7 +286,7 @@ int ubifs_recover_master_node(struct ubifs_info *c)
 		mst = mst2;
 	}
 
-	dbg_rcvry("recovered master node from LEB %d",
+	ubifs_msg("recovered master node from LEB %d",
 		  (mst == mst1 ? UBIFS_MST_LNUM : UBIFS_MST_LNUM + 1));
 
 	memcpy(c->mst_node, mst, UBIFS_MST_NODE_SZ);
@@ -790,7 +790,7 @@ struct ubifs_scan_leb *ubifs_recover_log_leb(struct ubifs_info *c, int lnum,
 		 * We can only recover at the end of the log, so check that the
 		 * next log LEB is empty or out of date.
 		 */
-		sleb = ubifs_scan(c, next_lnum, 0, sbuf);
+		sleb = ubifs_scan(c, next_lnum, 0, sbuf, 0);
 		if (IS_ERR(sleb))
 			return sleb;
 		if (sleb->nodes_cnt) {
diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 2970500..5c2d6d7 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -506,7 +506,7 @@ static int replay_bud(struct ubifs_info *c, int lnum, int offs, int jhead,
 	if (c->need_recovery)
 		sleb = ubifs_recover_leb(c, lnum, offs, c->sbuf, jhead != GCHD);
 	else
-		sleb = ubifs_scan(c, lnum, offs, c->sbuf);
+		sleb = ubifs_scan(c, lnum, offs, c->sbuf, 0);
 	if (IS_ERR(sleb))
 		return PTR_ERR(sleb);
 
@@ -836,8 +836,8 @@ static int replay_log_leb(struct ubifs_info *c, int lnum, int offs, void *sbuf)
 	const struct ubifs_cs_node *node;
 
 	dbg_mnt("replay log LEB %d:%d", lnum, offs);
-	sleb = ubifs_scan(c, lnum, offs, sbuf);
-	if (IS_ERR(sleb) ) {
+	sleb = ubifs_scan(c, lnum, offs, sbuf, c->need_recovery);
+	if (IS_ERR(sleb)) {
 		if (PTR_ERR(sleb) != -EUCLEAN || !c->need_recovery)
 			return PTR_ERR(sleb);
 		sleb = ubifs_recover_log_leb(c, lnum, offs, sbuf);
diff --git a/fs/ubifs/scan.c b/fs/ubifs/scan.c
index 892ebfe..96c5253 100644
--- a/fs/ubifs/scan.c
+++ b/fs/ubifs/scan.c
@@ -108,10 +108,9 @@ int ubifs_scan_a_node(const struct ubifs_info *c, void *buf, int len, int lnum,
 
 		/* Make the node pads to 8-byte boundary */
 		if ((node_len + pad_len) & 7) {
-			if (!quiet) {
+			if (!quiet)
 				dbg_err("bad padding length %d - %d",
 					offs, offs + node_len + pad_len);
-			}
 			return SCANNED_A_BAD_PAD_NODE;
 		}
 
@@ -253,15 +252,19 @@ void ubifs_scanned_corruption(const struct ubifs_info *c, int lnum, int offs,
  * @c: UBIFS file-system description object
  * @lnum: logical eraseblock number
  * @offs: offset to start at (usually zero)
- * @sbuf: scan buffer (must be c->leb_size)
+ * @sbuf: scan buffer (must be of @c->leb_size bytes in size)
+ * @quiet: print no messages
  *
  * This function scans LEB number @lnum and returns complete information about
  * its contents. Returns the scaned information in case of success and,
  * %-EUCLEAN if the LEB neads recovery, and other negative error codes in case
  * of failure.
+ *
+ * If @quiet is non-zero, this function does not print large and scary
+ * error messages and flash dumps in case of errors.
  */
 struct ubifs_scan_leb *ubifs_scan(const struct ubifs_info *c, int lnum,
-				  int offs, void *sbuf)
+				  int offs, void *sbuf, int quiet)
 {
 	void *buf = sbuf + offs;
 	int err, len = c->leb_size - offs;
@@ -280,7 +283,7 @@ struct ubifs_scan_leb *ubifs_scan(const struct ubifs_info *c, int lnum,
 
 		cond_resched();
 
-		ret = ubifs_scan_a_node(c, buf, len, lnum, offs, 0);
+		ret = ubifs_scan_a_node(c, buf, len, lnum, offs, quiet);
 		if (ret > 0) {
 			/* Padding bytes or a valid padding node */
 			offs += ret;
@@ -320,7 +323,9 @@ struct ubifs_scan_leb *ubifs_scan(const struct ubifs_info *c, int lnum,
 	}
 
 	if (offs % c->min_io_size) {
-		ubifs_err("empty space starts at non-aligned offset %d", offs);
+		if (!quiet)
+			ubifs_err("empty space starts at non-aligned offset %d",
+				  offs);
 		goto corrupted;;
 	}
 
@@ -331,18 +336,25 @@ struct ubifs_scan_leb *ubifs_scan(const struct ubifs_info *c, int lnum,
 			break;
 	for (; len; offs++, buf++, len--)
 		if (*(uint8_t *)buf != 0xff) {
-			ubifs_err("corrupt empty space at LEB %d:%d",
-				  lnum, offs);
+			if (!quiet)
+				ubifs_err("corrupt empty space at LEB %d:%d",
+					  lnum, offs);
 			goto corrupted;
 		}
 
 	return sleb;
 
 corrupted:
-	ubifs_scanned_corruption(c, lnum, offs, buf);
+	if (!quiet) {
+		ubifs_scanned_corruption(c, lnum, offs, buf);
+		ubifs_err("LEB %d scanning failed", lnum);
+	}
 	err = -EUCLEAN;
+	ubifs_scan_destroy(sleb);
+	return ERR_PTR(err);
+
 error:
-	ubifs_err("LEB %d scanning failed", lnum);
+	ubifs_err("LEB %d scanning failed, error %d", lnum, err);
 	ubifs_scan_destroy(sleb);
 	return ERR_PTR(err);
 }
diff --git a/fs/ubifs/tnc_commit.c b/fs/ubifs/tnc_commit.c
index fde8d12..53288e5 100644
--- a/fs/ubifs/tnc_commit.c
+++ b/fs/ubifs/tnc_commit.c
@@ -245,7 +245,7 @@ static int layout_leb_in_gaps(struct ubifs_info *c, int *p)
 	 * it is more comprehensive and less efficient than is needed for this
 	 * purpose.
 	 */
-	sleb = ubifs_scan(c, lnum, 0, c->ileb_buf);
+	sleb = ubifs_scan(c, lnum, 0, c->ileb_buf, 0);
 	c->ileb_len = 0;
 	if (IS_ERR(sleb))
 		return PTR_ERR(sleb);
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index a293490..9782e7c 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1451,7 +1451,7 @@ int ubifs_sync_wbufs_by_inode(struct ubifs_info *c, struct inode *inode);
 
 /* scan.c */
 struct ubifs_scan_leb *ubifs_scan(const struct ubifs_info *c, int lnum,
-				  int offs, void *sbuf);
+				  int offs, void *sbuf, int quiet);
 void ubifs_scan_destroy(struct ubifs_scan_leb *sleb);
 int ubifs_scan_a_node(const struct ubifs_info *c, void *buf, int len, int lnum,
 		      int offs, int quiet);
-- 
1.6.2.5
