Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb6z-0002Ws-Ib
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:25 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wEN028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:01:07 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 23/30] UBIFS: introduce more I/O helpers
Date: Thu,  9 Jun 2011 12:05:03 +0300
Message-Id: <1307610310-28691-24-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
References: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Introduce the following I/O helper functions: 'ubifs_leb_read()',
'ubifs_leb_write()', 'ubifs_leb_change()', 'ubifs_leb_unmap()',
'ubifs_leb_map()', 'ubifs_is_mapped().

The idea is to wrap all UBI I/O functions in order to encapsulate various
assertions and error path handling (error message, stack dump, switching to R/O
mode). And there are some other benefits of this which will be used in the
following patches.

This patch does not switch whole UBIFS to use these functions yet.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.h    |   16 +++++++
 fs/ubifs/io.c       |  117 +++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ubifs/misc.h     |   80 -----------------------------------
 fs/ubifs/recovery.c |    9 ++--
 fs/ubifs/ubifs.h    |   13 +++++-
 5 files changed, 148 insertions(+), 87 deletions(-)

diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index e1dcfd2..b0b005b 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -244,6 +244,10 @@ static inline int dbg_is_tst_rcvry(const struct ubifs_info *c)
 {
 	return !!(ubifs_dbg.tst_rcvry || c->dbg->tst_rcvry);
 }
+static inline int dbg_is_power_cut(const struct ubifs_info *c)
+{
+	return !!c->dbg->failure_mode;
+}
 
 int ubifs_debugging_init(struct ubifs_info *c);
 void ubifs_debugging_exit(struct ubifs_info *c);
@@ -445,12 +449,24 @@ static inline int
 dbg_check_nondata_nodes_order(struct ubifs_info *c,
 			      struct list_head *head)             { return 0; }
 
+static inline int dbg_leb_write(struct ubi_volume_desc *desc,
+				int lnum, const void *buf,
+				int offset, int len, int dtype)   { return 0; }
+static inline int dbg_leb_change(struct ubi_volume_desc *desc,
+				 int lnum, const void *buf,
+				 int len, int dtype)              { return 0; }
+static inline int dbg_leb_unmap(struct ubi_volume_desc *desc,
+				int lnum)                         { return 0; }
+static inline int dbg_leb_map(struct ubi_volume_desc *desc,
+			      int lnum, int dtype)                { return 0; }
+
 static inline int dbg_is_chk_gen(const struct ubifs_info *c)      { return 0; }
 static inline int dbg_is_chk_index(const struct ubifs_info *c)    { return 0; }
 static inline int dbg_is_chk_orph(const struct ubifs_info *c)     { return 0; }
 static inline int dbg_is_chk_lprops(const struct ubifs_info *c)   { return 0; }
 static inline int dbg_is_chk_fs(const struct ubifs_info *c)       { return 0; }
 static inline int dbg_is_tst_rcvry(const struct ubifs_info *c)    { return 0; }
+static inline int dbg_is_power_cut(const struct ubifs_info *c)    { return 0; }
 
 static inline int dbg_debugfs_init(void)                          { return 0; }
 static inline void dbg_debugfs_exit(void)                         { return; }
diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 48e1680..239899d 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -90,6 +90,123 @@ void ubifs_ro_mode(struct ubifs_info *c, int err)
 	}
 }
 
+/*
+ * Below are simple wrappers over UBI I/O functions which include some
+ * additional checks and UBIFS debugging stuff. See corresponding UBI function
+ * for more information.
+ */
+
+int ubifs_leb_read(const struct ubifs_info *c, int lnum, void *buf, int offs,
+		   int len, int even_ebadmsg)
+{
+	int err;
+
+	err = ubi_read(c->ubi, lnum, buf, offs, len);
+	/*
+	 * In case of %-EBADMSG print the error message only if the
+	 * @even_ebadmsg is true.
+	 */
+	if (err && (err != -EBADMSG || even_ebadmsg)) {
+		ubifs_err("reading %d bytes from LEB %d:%d failed, error %d",
+			  len, lnum, offs, err);
+		dbg_dump_stack();
+	}
+	return err;
+}
+
+int ubifs_leb_write(struct ubifs_info *c, int lnum, const void *buf, int offs,
+		    int len, int dtype)
+{
+	int err;
+
+	ubifs_assert(!c->ro_media && !c->ro_mount);
+	if (c->ro_error)
+		return -EROFS;
+	if (!dbg_is_tst_rcvry(c))
+		err = ubi_leb_write(c->ubi, lnum, buf, offs, len, dtype);
+	else
+		err = dbg_leb_write(c->ubi, lnum, buf, offs, len, dtype);
+	if (err) {
+		ubifs_err("writing %d bytes to LEB %d:%d failed, error %d",
+			  len, lnum, offs, err);
+		ubifs_ro_mode(c, err);
+		dbg_dump_stack();
+	}
+	return err;
+}
+
+int ubifs_leb_change(struct ubifs_info *c, int lnum, const void *buf, int len,
+		     int dtype)
+{
+	int err;
+
+	ubifs_assert(!c->ro_media && !c->ro_mount);
+	if (c->ro_error)
+		return -EROFS;
+	if (!dbg_is_tst_rcvry(c))
+		err = ubi_leb_change(c->ubi, lnum, buf, len, dtype);
+	else
+		err = dbg_leb_change(c->ubi, lnum, buf, len, dtype);
+	if (err) {
+		ubifs_err("changing %d bytes in LEB %d failed, error %d",
+			  len, lnum, err);
+		ubifs_ro_mode(c, err);
+		dbg_dump_stack();
+	}
+	return err;
+}
+
+int ubifs_leb_unmap(struct ubifs_info *c, int lnum)
+{
+	int err;
+
+	ubifs_assert(!c->ro_media && !c->ro_mount);
+	if (c->ro_error)
+		return -EROFS;
+	if (!dbg_is_tst_rcvry(c))
+		err = ubi_leb_unmap(c->ubi, lnum);
+	else
+		err = dbg_leb_unmap(c->ubi, lnum);
+	if (err) {
+		ubifs_err("unmap LEB %d failed, error %d", lnum, err);
+		ubifs_ro_mode(c, err);
+		dbg_dump_stack();
+	}
+	return err;
+}
+
+int ubifs_leb_map(struct ubifs_info *c, int lnum, int dtype)
+{
+	int err;
+
+	ubifs_assert(!c->ro_media && !c->ro_mount);
+	if (c->ro_error)
+		return -EROFS;
+	if (!dbg_is_tst_rcvry(c))
+		err = ubi_leb_map(c->ubi, lnum, dtype);
+	else
+		err = dbg_leb_map(c->ubi, lnum, dtype);
+	if (err) {
+		ubifs_err("mapping LEB %d failed, error %d", lnum, err);
+		ubifs_ro_mode(c, err);
+		dbg_dump_stack();
+	}
+	return err;
+}
+
+int ubifs_is_mapped(const struct ubifs_info *c, int lnum)
+{
+	int err;
+
+	err = ubi_is_mapped(c->ubi, lnum);
+	if (err < 0) {
+		ubifs_err("ubi_is_mapped failed for LEB %d, error %d",
+			  lnum, err);
+		dbg_dump_stack();
+	}
+	return err;
+}
+
 /**
  * ubifs_check_node - check node.
  * @c: UBIFS file-system description object
diff --git a/fs/ubifs/misc.h b/fs/ubifs/misc.h
index 160cd90..ee7cb5e 100644
--- a/fs/ubifs/misc.h
+++ b/fs/ubifs/misc.h
@@ -145,86 +145,6 @@ static inline int ubifs_wbuf_sync(struct ubifs_wbuf *wbuf)
 }
 
 /**
- * ubifs_leb_unmap - unmap an LEB.
- * @c: UBIFS file-system description object
- * @lnum: LEB number to unmap
- *
- * This function returns %0 on success and a negative error code on failure.
- */
-static inline int ubifs_leb_unmap(const struct ubifs_info *c, int lnum)
-{
-	int err;
-
-	ubifs_assert(!c->ro_media && !c->ro_mount);
-	if (c->ro_error)
-		return -EROFS;
-	err = ubi_leb_unmap(c->ubi, lnum);
-	if (err) {
-		ubifs_err("unmap LEB %d failed, error %d", lnum, err);
-		return err;
-	}
-
-	return 0;
-}
-
-/**
- * ubifs_leb_write - write to a LEB.
- * @c: UBIFS file-system description object
- * @lnum: LEB number to write
- * @buf: buffer to write from
- * @offs: offset within LEB to write to
- * @len: length to write
- * @dtype: data type
- *
- * This function returns %0 on success and a negative error code on failure.
- */
-static inline int ubifs_leb_write(const struct ubifs_info *c, int lnum,
-				  const void *buf, int offs, int len, int dtype)
-{
-	int err;
-
-	ubifs_assert(!c->ro_media && !c->ro_mount);
-	if (c->ro_error)
-		return -EROFS;
-	err = ubi_leb_write(c->ubi, lnum, buf, offs, len, dtype);
-	if (err) {
-		ubifs_err("writing %d bytes at %d:%d, error %d",
-			  len, lnum, offs, err);
-		return err;
-	}
-
-	return 0;
-}
-
-/**
- * ubifs_leb_change - atomic LEB change.
- * @c: UBIFS file-system description object
- * @lnum: LEB number to write
- * @buf: buffer to write from
- * @len: length to write
- * @dtype: data type
- *
- * This function returns %0 on success and a negative error code on failure.
- */
-static inline int ubifs_leb_change(const struct ubifs_info *c, int lnum,
-				   const void *buf, int len, int dtype)
-{
-	int err;
-
-	ubifs_assert(!c->ro_media && !c->ro_mount);
-	if (c->ro_error)
-		return -EROFS;
-	err = ubi_leb_change(c->ubi, lnum, buf, len, dtype);
-	if (err) {
-		ubifs_err("changing %d bytes in LEB %d, error %d",
-			  len, lnum, err);
-		return err;
-	}
-
-	return 0;
-}
-
-/**
  * ubifs_encode_dev - encode device node IDs.
  * @dev: UBIFS device node information
  * @rdev: device IDs to encode
diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 783d8e0..c591549 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -919,8 +919,7 @@ struct ubifs_scan_leb *ubifs_recover_log_leb(struct ubifs_info *c, int lnum,
  *
  * This function returns %0 on success and a negative error code on failure.
  */
-static int recover_head(const struct ubifs_info *c, int lnum, int offs,
-			void *sbuf)
+static int recover_head(struct ubifs_info *c, int lnum, int offs, void *sbuf)
 {
 	int len = c->max_write_size, err;
 
@@ -962,7 +961,7 @@ static int recover_head(const struct ubifs_info *c, int lnum, int offs,
  *
  * This function returns %0 on success and a negative error code on failure.
  */
-int ubifs_recover_inl_heads(const struct ubifs_info *c, void *sbuf)
+int ubifs_recover_inl_heads(struct ubifs_info *c, void *sbuf)
 {
 	int err;
 
@@ -993,7 +992,7 @@ int ubifs_recover_inl_heads(const struct ubifs_info *c, void *sbuf)
  *
  * This function returns %0 on success and a negative error code on failure.
  */
-static int clean_an_unclean_leb(const struct ubifs_info *c,
+static int clean_an_unclean_leb(struct ubifs_info *c,
 				struct ubifs_unclean_leb *ucleb, void *sbuf)
 {
 	int err, lnum = ucleb->lnum, offs = 0, len = ucleb->endpt, quiet = 1;
@@ -1089,7 +1088,7 @@ static int clean_an_unclean_leb(const struct ubifs_info *c,
  *
  * This function returns %0 on success and a negative error code on failure.
  */
-int ubifs_clean_lebs(const struct ubifs_info *c, void *sbuf)
+int ubifs_clean_lebs(struct ubifs_info *c, void *sbuf)
 {
 	dbg_rcvry("recovery");
 	while (!list_empty(&c->unclean_leb_list)) {
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 3304aad..702b792 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1468,6 +1468,15 @@ extern struct ubifs_compressor *ubifs_compressors[UBIFS_COMPR_TYPES_CNT];
 
 /* io.c */
 void ubifs_ro_mode(struct ubifs_info *c, int err);
+int ubifs_leb_read(const struct ubifs_info *c, int lnum, void *buf, int offs,
+		   int len, int even_ebadmsg);
+int ubifs_leb_write(struct ubifs_info *c, int lnum, const void *buf, int offs,
+		    int len, int dtype);
+int ubifs_leb_change(struct ubifs_info *c, int lnum, const void *buf, int len,
+		     int dtype);
+int ubifs_leb_unmap(struct ubifs_info *c, int lnum);
+int ubifs_leb_map(struct ubifs_info *c, int lnum, int dtype);
+int ubifs_is_mapped(const struct ubifs_info *c, int lnum);
 int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len);
 int ubifs_wbuf_seek_nolock(struct ubifs_wbuf *wbuf, int lnum, int offs,
 			   int dtype);
@@ -1747,8 +1756,8 @@ struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 					 int offs, void *sbuf, int jhead);
 struct ubifs_scan_leb *ubifs_recover_log_leb(struct ubifs_info *c, int lnum,
 					     int offs, void *sbuf);
-int ubifs_recover_inl_heads(const struct ubifs_info *c, void *sbuf);
-int ubifs_clean_lebs(const struct ubifs_info *c, void *sbuf);
+int ubifs_recover_inl_heads(struct ubifs_info *c, void *sbuf);
+int ubifs_clean_lebs(struct ubifs_info *c, void *sbuf);
 int ubifs_rcvry_gc_commit(struct ubifs_info *c);
 int ubifs_recover_size_accum(struct ubifs_info *c, union ubifs_key *key,
 			     int deletion, loff_t new_size);
-- 
1.7.2.3
