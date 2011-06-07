Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QU3Gi-0000wB-DN
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 20:52:57 +0000
Received: by gyh20 with SMTP id 20so2759614gyh.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 13:52:53 -0700 (PDT)
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] UBIFS: optionally return partial LEB scan results
Date: Tue,  7 Jun 2011 16:52:47 -0400
Message-Id: <1307479967-3909-1-git-send-email-mlcreech@gmail.com>
Cc: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ubifs_scan() currently returns -EUCLEAN when it encounters corrupted data
while scanning a LEB.  This is usually the right thing to do, but it prevents
us from debugging certain kinds of corruption, since ubifs_scan() is called
from dbg_dump_leb().

Add a flag which makes ubifs_scan() return partial node data when corruption
is encountered, and use that flag in dbg_dump_leb().

Signed-off-by: Matthew L. Creech <mlcreech@gmail.com>
---
 fs/ubifs/debug.c      |    2 +-
 fs/ubifs/gc.c         |    2 +-
 fs/ubifs/log.c        |    2 +-
 fs/ubifs/lprops.c     |    2 +-
 fs/ubifs/master.c     |    4 ++--
 fs/ubifs/orphan.c     |    4 ++--
 fs/ubifs/recovery.c   |    2 +-
 fs/ubifs/replay.c     |    4 ++--
 fs/ubifs/scan.c       |   16 ++++++++++++----
 fs/ubifs/tnc_commit.c |    2 +-
 fs/ubifs/ubifs.h      |    2 +-
 11 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 26d4c61..d6239d2 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -898,7 +898,7 @@ void dbg_dump_leb(const struct ubifs_info *c, int lnum)
 		return;
 	}
 
-	sleb = ubifs_scan(c, lnum, 0, buf, 0);
+	sleb = ubifs_scan(c, lnum, 0, buf, 0, 1);
 	if (IS_ERR(sleb)) {
 		ubifs_err("scan error %d", (int)PTR_ERR(sleb));
 		goto out;
diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index ded29f6..5266dc6 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -513,7 +513,7 @@ int ubifs_garbage_collect_leb(struct ubifs_info *c, struct ubifs_lprops *lp)
 	 * We scan the entire LEB even though we only really need to scan up to
 	 * (c->leb_size - lp->free).
 	 */
-	sleb = ubifs_scan(c, lnum, 0, c->sbuf, 0);
+	sleb = ubifs_scan(c, lnum, 0, c->sbuf, 0, 0);
 	if (IS_ERR(sleb))
 		return PTR_ERR(sleb);
 
diff --git a/fs/ubifs/log.c b/fs/ubifs/log.c
index affea94..472aff6 100644
--- a/fs/ubifs/log.c
+++ b/fs/ubifs/log.c
@@ -662,7 +662,7 @@ int ubifs_consolidate_log(struct ubifs_info *c)
 	lnum = c->ltail_lnum;
 	write_lnum = lnum;
 	while (1) {
-		sleb = ubifs_scan(c, lnum, 0, c->sbuf, 0);
+		sleb = ubifs_scan(c, lnum, 0, c->sbuf, 0, 0);
 		if (IS_ERR(sleb)) {
 			err = PTR_ERR(sleb);
 			goto out_free;
diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
index 98b8e73..2384463 100644
--- a/fs/ubifs/lprops.c
+++ b/fs/ubifs/lprops.c
@@ -1105,7 +1105,7 @@ static int scan_check_cb(struct ubifs_info *c,
 		return LPT_SCAN_CONTINUE;
 	}
 
-	sleb = ubifs_scan(c, lnum, 0, buf, 0);
+	sleb = ubifs_scan(c, lnum, 0, buf, 0, 0);
 	if (IS_ERR(sleb)) {
 		ret = PTR_ERR(sleb);
 		if (ret == -EUCLEAN) {
diff --git a/fs/ubifs/master.c b/fs/ubifs/master.c
index 278c238..8b86712 100644
--- a/fs/ubifs/master.c
+++ b/fs/ubifs/master.c
@@ -41,7 +41,7 @@ static int scan_for_master(struct ubifs_info *c)
 
 	lnum = UBIFS_MST_LNUM;
 
-	sleb = ubifs_scan(c, lnum, 0, c->sbuf, 1);
+	sleb = ubifs_scan(c, lnum, 0, c->sbuf, 1, 0);
 	if (IS_ERR(sleb))
 		return PTR_ERR(sleb);
 	nodes_cnt = sleb->nodes_cnt;
@@ -57,7 +57,7 @@ static int scan_for_master(struct ubifs_info *c)
 
 	lnum += 1;
 
-	sleb = ubifs_scan(c, lnum, 0, c->sbuf, 1);
+	sleb = ubifs_scan(c, lnum, 0, c->sbuf, 1, 0);
 	if (IS_ERR(sleb))
 		return PTR_ERR(sleb);
 	if (sleb->nodes_cnt != nodes_cnt)
diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index a5422ff..76fba30 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -670,7 +670,7 @@ static int kill_orphans(struct ubifs_info *c)
 		struct ubifs_scan_leb *sleb;
 
 		dbg_rcvry("LEB %d", lnum);
-		sleb = ubifs_scan(c, lnum, 0, c->sbuf, 1);
+		sleb = ubifs_scan(c, lnum, 0, c->sbuf, 1, 0);
 		if (IS_ERR(sleb)) {
 			if (PTR_ERR(sleb) == -EUCLEAN)
 				sleb = ubifs_recover_leb(c, lnum, 0,
@@ -908,7 +908,7 @@ static int dbg_scan_orphans(struct ubifs_info *c, struct check_info *ci)
 	for (lnum = c->orph_first; lnum <= c->orph_last; lnum++) {
 		struct ubifs_scan_leb *sleb;
 
-		sleb = ubifs_scan(c, lnum, 0, buf, 0);
+		sleb = ubifs_scan(c, lnum, 0, buf, 0, 0);
 		if (IS_ERR(sleb)) {
 			err = PTR_ERR(sleb);
 			break;
diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 783d8e0..2456dd0 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -878,7 +878,7 @@ struct ubifs_scan_leb *ubifs_recover_log_leb(struct ubifs_info *c, int lnum,
 		 * We can only recover at the end of the log, so check that the
 		 * next log LEB is empty or out of date.
 		 */
-		sleb = ubifs_scan(c, next_lnum, 0, sbuf, 0);
+		sleb = ubifs_scan(c, next_lnum, 0, sbuf, 0, 0);
 		if (IS_ERR(sleb))
 			return sleb;
 		if (sleb->nodes_cnt) {
diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 5e97161..53eb2bb 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -559,7 +559,7 @@ static int replay_bud(struct ubifs_info *c, struct bud_entry *b)
 		 */
 		sleb = ubifs_recover_leb(c, lnum, offs, c->sbuf, b->bud->jhead);
 	else
-		sleb = ubifs_scan(c, lnum, offs, c->sbuf, 0);
+		sleb = ubifs_scan(c, lnum, offs, c->sbuf, 0, 0);
 	if (IS_ERR(sleb))
 		return PTR_ERR(sleb);
 
@@ -832,7 +832,7 @@ static int replay_log_leb(struct ubifs_info *c, int lnum, int offs, void *sbuf)
 	const struct ubifs_cs_node *node;
 
 	dbg_mnt("replay log LEB %d:%d", lnum, offs);
-	sleb = ubifs_scan(c, lnum, offs, sbuf, c->need_recovery);
+	sleb = ubifs_scan(c, lnum, offs, sbuf, c->need_recovery, 0);
 	if (IS_ERR(sleb)) {
 		if (PTR_ERR(sleb) != -EUCLEAN || !c->need_recovery)
 			return PTR_ERR(sleb);
diff --git a/fs/ubifs/scan.c b/fs/ubifs/scan.c
index 36216b4..3f70d47 100644
--- a/fs/ubifs/scan.c
+++ b/fs/ubifs/scan.c
@@ -256,17 +256,21 @@ void ubifs_scanned_corruption(const struct ubifs_info *c, int lnum, int offs,
  * @offs: offset to start at (usually zero)
  * @sbuf: scan buffer (must be of @c->leb_size bytes in size)
  * @quiet: print no messages
+ * @partial: return partial results when corruption is encountered (vs. error)
  *
  * This function scans LEB number @lnum and returns complete information about
- * its contents. Returns the scaned information in case of success and,
- * %-EUCLEAN if the LEB neads recovery, and other negative error codes in case
- * of failure.
+ * its contents. Returns the scaned information in case of success,
+ * %-EUCLEAN if the LEB neads recovery (and @partial is not set), and other
+ * negative error codes in case of failure.
  *
  * If @quiet is non-zero, this function does not print large and scary
  * error messages and flash dumps in case of errors.
+ *
+ * If @partial is non-zero, this function returns partial scan data if the LEB
+ * is corrupt.  This can be useful for debugging.
  */
 struct ubifs_scan_leb *ubifs_scan(const struct ubifs_info *c, int lnum,
-				  int offs, void *sbuf, int quiet)
+				  int offs, void *sbuf, int quiet, int partial)
 {
 	void *buf = sbuf + offs;
 	int err, len = c->leb_size - offs;
@@ -352,6 +356,10 @@ corrupted:
 		ubifs_err("LEB %d scanning failed", lnum);
 	}
 	err = -EUCLEAN;
+	if (partial) {
+		dbg_err("returning partial results for %d:%d", lnum, offs);
+		return sleb;
+	}
 	ubifs_scan_destroy(sleb);
 	return ERR_PTR(err);
 
diff --git a/fs/ubifs/tnc_commit.c b/fs/ubifs/tnc_commit.c
index d6fab1a..f831abd 100644
--- a/fs/ubifs/tnc_commit.c
+++ b/fs/ubifs/tnc_commit.c
@@ -249,7 +249,7 @@ static int layout_leb_in_gaps(struct ubifs_info *c, int *p)
 	 * it is more comprehensive and less efficient than is needed for this
 	 * purpose.
 	 */
-	sleb = ubifs_scan(c, lnum, 0, c->ileb_buf, 0);
+	sleb = ubifs_scan(c, lnum, 0, c->ileb_buf, 0, 0);
 	c->ileb_len = 0;
 	if (IS_ERR(sleb))
 		return PTR_ERR(sleb);
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 3304aad..dfa5012 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1491,7 +1491,7 @@ int ubifs_sync_wbufs_by_inode(struct ubifs_info *c, struct inode *inode);
 
 /* scan.c */
 struct ubifs_scan_leb *ubifs_scan(const struct ubifs_info *c, int lnum,
-				  int offs, void *sbuf, int quiet);
+				  int offs, void *sbuf, int quiet, int partial);
 void ubifs_scan_destroy(struct ubifs_scan_leb *sleb);
 int ubifs_scan_a_node(const struct ubifs_info *c, void *buf, int len, int lnum,
 		      int offs, int quiet);
-- 
1.6.3.3
