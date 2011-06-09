Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb7K-0002OX-La
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:31 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wES028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:01:09 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 28/30] UBIFS: remove custom list of superblocks
Date: Thu,  9 Jun 2011 12:05:08 +0300
Message-Id: <1307610310-28691-29-git-send-email-dedekind1@gmail.com>
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

This is a clean-up of the power-cut emulation code - remove the custom list of
superblocks which we maintained to find the superblock by the UBI volume
descriptor. We do not need that crud any longer, because now we can get the
superblock as a function argument.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c |  105 ++++++++++-------------------------------------------
 fs/ubifs/debug.h |   31 ++++++++--------
 fs/ubifs/io.c    |    8 ++--
 3 files changed, 39 insertions(+), 105 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 6502657..a0e0c95 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2539,16 +2539,7 @@ error_dump:
 
 #define chance(n, d) (simple_rand() <= (n) * 32768LL / (d))
 
-struct failure_mode_info {
-	struct list_head list;
-	struct ubifs_info *c;
-};
-
-static LIST_HEAD(fmi_list);
-static DEFINE_SPINLOCK(fmi_lock);
-
 static unsigned int next;
-
 static int simple_rand(void)
 {
 	if (next == 0)
@@ -2557,69 +2548,15 @@ static int simple_rand(void)
 	return (next >> 16) & 32767;
 }
 
-static void failure_mode_init(struct ubifs_info *c)
-{
-	struct failure_mode_info *fmi;
-
-	fmi = kmalloc(sizeof(struct failure_mode_info), GFP_NOFS);
-	if (!fmi) {
-		ubifs_err("Failed to register failure mode - no memory");
-		return;
-	}
-	fmi->c = c;
-	spin_lock(&fmi_lock);
-	list_add_tail(&fmi->list, &fmi_list);
-	spin_unlock(&fmi_lock);
-}
-
-static void failure_mode_exit(struct ubifs_info *c)
-{
-	struct failure_mode_info *fmi, *tmp;
-
-	spin_lock(&fmi_lock);
-	list_for_each_entry_safe(fmi, tmp, &fmi_list, list)
-		if (fmi->c == c) {
-			list_del(&fmi->list);
-			kfree(fmi);
-		}
-	spin_unlock(&fmi_lock);
-}
-
-static struct ubifs_info *dbg_find_info(struct ubi_volume_desc *desc)
+static int do_fail(struct ubifs_info *c, int lnum, int write)
 {
-	struct failure_mode_info *fmi;
-
-	spin_lock(&fmi_lock);
-	list_for_each_entry(fmi, &fmi_list, list)
-		if (fmi->c->ubi == desc) {
-			struct ubifs_info *c = fmi->c;
-
-			spin_unlock(&fmi_lock);
-			return c;
-		}
-	spin_unlock(&fmi_lock);
-	return NULL;
-}
-
-static int in_failure_mode(struct ubi_volume_desc *desc)
-{
-	struct ubifs_info *c = dbg_find_info(desc);
+	struct ubifs_debug_info *d = c->dbg;
 
-	if (c && dbg_is_tst_rcvry(c))
-		return c->dbg->failure_mode;
-	return 0;
-}
+	ubifs_assert(dbg_is_tst_rcvry(c));
 
-static int do_fail(struct ubi_volume_desc *desc, int lnum, int write)
-{
-	struct ubifs_info *c = dbg_find_info(desc);
-	struct ubifs_debug_info *d;
-
-	if (!c || !dbg_is_tst_rcvry(c))
-		return 0;
-	d = c->dbg;
 	if (d->failure_mode)
 		return 1;
+
 	if (!d->fail_cnt) {
 		/* First call - decide delay to failure */
 		if (chance(1, 2)) {
@@ -2716,17 +2653,17 @@ static void cut_data(const void *buf, int len)
 		p[i] = 0xff;
 }
 
-int dbg_leb_write(struct ubi_volume_desc *desc, int lnum, const void *buf,
+int dbg_leb_write(struct ubifs_info *c, int lnum, const void *buf,
 		  int offs, int len, int dtype)
 {
 	int err, failing;
 
-	if (in_failure_mode(desc))
+	if (c->dbg->failure_mode)
 		return -EROFS;
-	failing = do_fail(desc, lnum, 1);
+	failing = do_fail(c, lnum, 1);
 	if (failing)
 		cut_data(buf, len);
-	err = ubi_leb_write(desc, lnum, buf, offs, len, dtype);
+	err = ubi_leb_write(c->ubi, lnum, buf, offs, len, dtype);
 	if (err)
 		return err;
 	if (failing)
@@ -2734,45 +2671,45 @@ int dbg_leb_write(struct ubi_volume_desc *desc, int lnum, const void *buf,
 	return 0;
 }
 
-int dbg_leb_change(struct ubi_volume_desc *desc, int lnum, const void *buf,
+int dbg_leb_change(struct ubifs_info *c, int lnum, const void *buf,
 		   int len, int dtype)
 {
 	int err;
 
-	if (do_fail(desc, lnum, 1))
+	if (do_fail(c, lnum, 1))
 		return -EROFS;
-	err = ubi_leb_change(desc, lnum, buf, len, dtype);
+	err = ubi_leb_change(c->ubi, lnum, buf, len, dtype);
 	if (err)
 		return err;
-	if (do_fail(desc, lnum, 1))
+	if (do_fail(c, lnum, 1))
 		return -EROFS;
 	return 0;
 }
 
-int dbg_leb_unmap(struct ubi_volume_desc *desc, int lnum)
+int dbg_leb_unmap(struct ubifs_info *c, int lnum)
 {
 	int err;
 
-	if (do_fail(desc, lnum, 0))
+	if (do_fail(c, lnum, 0))
 		return -EROFS;
-	err = ubi_leb_unmap(desc, lnum);
+	err = ubi_leb_unmap(c->ubi, lnum);
 	if (err)
 		return err;
-	if (do_fail(desc, lnum, 0))
+	if (do_fail(c, lnum, 0))
 		return -EROFS;
 	return 0;
 }
 
-int dbg_leb_map(struct ubi_volume_desc *desc, int lnum, int dtype)
+int dbg_leb_map(struct ubifs_info *c, int lnum, int dtype)
 {
 	int err;
 
-	if (do_fail(desc, lnum, 0))
+	if (do_fail(c, lnum, 0))
 		return -EROFS;
-	err = ubi_leb_map(desc, lnum, dtype);
+	err = ubi_leb_map(c->ubi, lnum, dtype);
 	if (err)
 		return err;
-	if (do_fail(desc, lnum, 0))
+	if (do_fail(c, lnum, 0))
 		return -EROFS;
 	return 0;
 }
@@ -3202,7 +3139,6 @@ int ubifs_debugging_init(struct ubifs_info *c)
 	if (!c->dbg)
 		return -ENOMEM;
 
-	failure_mode_init(c);
 	return 0;
 }
 
@@ -3212,7 +3148,6 @@ int ubifs_debugging_init(struct ubifs_info *c)
  */
 void ubifs_debugging_exit(struct ubifs_info *c)
 {
-	failure_mode_exit(c);
 	kfree(c->dbg);
 }
 
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index b5bc09d..0ab3757 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -305,12 +305,12 @@ int dbg_check_inode_size(struct ubifs_info *c, const struct inode *inode,
 int dbg_check_data_nodes_order(struct ubifs_info *c, struct list_head *head);
 int dbg_check_nondata_nodes_order(struct ubifs_info *c, struct list_head *head);
 
-int dbg_leb_write(struct ubi_volume_desc *desc, int lnum, const void *buf,
-		  int offs, int len, int dtype);
-int dbg_leb_change(struct ubi_volume_desc *desc, int lnum, const void *buf,
-		   int len, int dtype);
-int dbg_leb_unmap(struct ubi_volume_desc *desc, int lnum);
-int dbg_leb_map(struct ubi_volume_desc *desc, int lnum, int dtype);
+int dbg_leb_write(struct ubifs_info *c, int lnum, const void *buf, int offs,
+		  int len, int dtype);
+int dbg_leb_change(struct ubifs_info *c, int lnum, const void *buf, int len,
+		   int dtype);
+int dbg_leb_unmap(struct ubifs_info *c, int lnum);
+int dbg_leb_map(struct ubifs_info *c, int lnum, int dtype);
 
 /* Debugfs-related stuff */
 int dbg_debugfs_init(void);
@@ -442,16 +442,15 @@ static inline int
 dbg_check_nondata_nodes_order(struct ubifs_info *c,
 			      struct list_head *head)             { return 0; }
 
-static inline int dbg_leb_write(struct ubi_volume_desc *desc,
-				int lnum, const void *buf,
-				int offset, int len, int dtype)   { return 0; }
-static inline int dbg_leb_change(struct ubi_volume_desc *desc,
-				 int lnum, const void *buf,
-				 int len, int dtype)              { return 0; }
-static inline int dbg_leb_unmap(struct ubi_volume_desc *desc,
-				int lnum)                         { return 0; }
-static inline int dbg_leb_map(struct ubi_volume_desc *desc,
-			      int lnum, int dtype)                { return 0; }
+static inline int dbg_leb_write(struct ubifs_info *c, int lnum,
+				const void *buf, int offset,
+				int len, int dtype)               { return 0; }
+static inline int dbg_leb_change(struct ubifs_info *c, int lnum,
+				 const void *buf, int len,
+				 int dtype)                       { return 0; }
+static inline int dbg_leb_unmap(struct ubifs_info *c, int lnum)   { return 0; }
+static inline int dbg_leb_map(struct ubifs_info *c, int lnum,
+			      int dtype)                          { return 0; }
 
 static inline int dbg_is_chk_gen(const struct ubifs_info *c)      { return 0; }
 static inline int dbg_is_chk_index(const struct ubifs_info *c)    { return 0; }
diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index a0c5fb4..9228950 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -125,7 +125,7 @@ int ubifs_leb_write(struct ubifs_info *c, int lnum, const void *buf, int offs,
 	if (!dbg_is_tst_rcvry(c))
 		err = ubi_leb_write(c->ubi, lnum, buf, offs, len, dtype);
 	else
-		err = dbg_leb_write(c->ubi, lnum, buf, offs, len, dtype);
+		err = dbg_leb_write(c, lnum, buf, offs, len, dtype);
 	if (err) {
 		ubifs_err("writing %d bytes to LEB %d:%d failed, error %d",
 			  len, lnum, offs, err);
@@ -146,7 +146,7 @@ int ubifs_leb_change(struct ubifs_info *c, int lnum, const void *buf, int len,
 	if (!dbg_is_tst_rcvry(c))
 		err = ubi_leb_change(c->ubi, lnum, buf, len, dtype);
 	else
-		err = dbg_leb_change(c->ubi, lnum, buf, len, dtype);
+		err = dbg_leb_change(c, lnum, buf, len, dtype);
 	if (err) {
 		ubifs_err("changing %d bytes in LEB %d failed, error %d",
 			  len, lnum, err);
@@ -166,7 +166,7 @@ int ubifs_leb_unmap(struct ubifs_info *c, int lnum)
 	if (!dbg_is_tst_rcvry(c))
 		err = ubi_leb_unmap(c->ubi, lnum);
 	else
-		err = dbg_leb_unmap(c->ubi, lnum);
+		err = dbg_leb_unmap(c, lnum);
 	if (err) {
 		ubifs_err("unmap LEB %d failed, error %d", lnum, err);
 		ubifs_ro_mode(c, err);
@@ -185,7 +185,7 @@ int ubifs_leb_map(struct ubifs_info *c, int lnum, int dtype)
 	if (!dbg_is_tst_rcvry(c))
 		err = ubi_leb_map(c->ubi, lnum, dtype);
 	else
-		err = dbg_leb_map(c->ubi, lnum, dtype);
+		err = dbg_leb_map(c, lnum, dtype);
 	if (err) {
 		ubifs_err("mapping LEB %d failed, error %d", lnum, err);
 		ubifs_ro_mode(c, err);
-- 
1.7.2.3
