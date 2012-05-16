Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUhor-0002RZ-Jj
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 17:15:29 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/5] UBIFS: get rid of dbg_dump_stack
Date: Wed, 16 May 2012 20:16:22 +0300
Message-Id: <1337188586-32293-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

In case of errors we almost always need the stack dump - it makes no sense
to compile it out. Remove the 'dbg_dump_stack()' function completely.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/debug.c   |    2 +-
 fs/ubifs/debug.h   |    5 +----
 fs/ubifs/io.c      |   20 ++++++++++----------
 fs/ubifs/journal.c |    2 +-
 fs/ubifs/lprops.c  |    2 +-
 fs/ubifs/lpt.c     |    8 ++++----
 fs/ubifs/orphan.c  |    2 +-
 fs/ubifs/tnc.c     |   10 +++++-----
 8 files changed, 24 insertions(+), 27 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 1934084..139025a 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -1160,7 +1160,7 @@ int dbg_check_synced_i_size(const struct ubifs_info *c, struct inode *inode)
 			  "is clean", ui->ui_size, ui->synced_i_size);
 		ubifs_err("i_ino %lu, i_mode %#x, i_size %lld", inode->i_ino,
 			  inode->i_mode, i_size_read(inode));
-		dbg_dump_stack();
+		dump_stack();
 		err = -EINVAL;
 	}
 	spin_unlock(&ui->ui_lock);
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 9f71765..6e5d345 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -149,7 +149,7 @@ struct ubifs_global_debug_info {
 	if (unlikely(!(expr))) {                                               \
 		printk(KERN_CRIT "UBIFS assert failed in %s at %u (pid %d)\n", \
 		       __func__, __LINE__, current->pid);                      \
-		dbg_dump_stack();                                              \
+		dump_stack();                                                  \
 	}                                                                      \
 } while (0)
 
@@ -161,8 +161,6 @@ struct ubifs_global_debug_info {
 	}                                                                      \
 } while (0)
 
-#define dbg_dump_stack() dump_stack()
-
 #define dbg_err(fmt, ...) do {                                                 \
 	ubifs_err(fmt, ##__VA_ARGS__);                                         \
 } while (0)
@@ -341,7 +339,6 @@ void dbg_debugfs_exit_fs(struct ubifs_info *c);
 		printk(KERN_DEBUG fmt "\n", ##__VA_ARGS__); \
 } while (0)
 
-#define dbg_dump_stack()
 #define ubifs_assert_cmt_locked(c)
 
 #define dbg_msg(fmt, ...)       ubifs_dbg_msg(fmt, ##__VA_ARGS__)
diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 9228950..16d4065 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -109,7 +109,7 @@ int ubifs_leb_read(const struct ubifs_info *c, int lnum, void *buf, int offs,
 	if (err && (err != -EBADMSG || even_ebadmsg)) {
 		ubifs_err("reading %d bytes from LEB %d:%d failed, error %d",
 			  len, lnum, offs, err);
-		dbg_dump_stack();
+		dump_stack();
 	}
 	return err;
 }
@@ -130,7 +130,7 @@ int ubifs_leb_write(struct ubifs_info *c, int lnum, const void *buf, int offs,
 		ubifs_err("writing %d bytes to LEB %d:%d failed, error %d",
 			  len, lnum, offs, err);
 		ubifs_ro_mode(c, err);
-		dbg_dump_stack();
+		dump_stack();
 	}
 	return err;
 }
@@ -151,7 +151,7 @@ int ubifs_leb_change(struct ubifs_info *c, int lnum, const void *buf, int len,
 		ubifs_err("changing %d bytes in LEB %d failed, error %d",
 			  len, lnum, err);
 		ubifs_ro_mode(c, err);
-		dbg_dump_stack();
+		dump_stack();
 	}
 	return err;
 }
@@ -170,7 +170,7 @@ int ubifs_leb_unmap(struct ubifs_info *c, int lnum)
 	if (err) {
 		ubifs_err("unmap LEB %d failed, error %d", lnum, err);
 		ubifs_ro_mode(c, err);
-		dbg_dump_stack();
+		dump_stack();
 	}
 	return err;
 }
@@ -189,7 +189,7 @@ int ubifs_leb_map(struct ubifs_info *c, int lnum, int dtype)
 	if (err) {
 		ubifs_err("mapping LEB %d failed, error %d", lnum, err);
 		ubifs_ro_mode(c, err);
-		dbg_dump_stack();
+		dump_stack();
 	}
 	return err;
 }
@@ -202,7 +202,7 @@ int ubifs_is_mapped(const struct ubifs_info *c, int lnum)
 	if (err < 0) {
 		ubifs_err("ubi_is_mapped failed for LEB %d, error %d",
 			  lnum, err);
-		dbg_dump_stack();
+		dump_stack();
 	}
 	return err;
 }
@@ -295,7 +295,7 @@ out:
 	if (!quiet) {
 		ubifs_err("bad node at LEB %d:%d", lnum, offs);
 		dbg_dump_node(c, buf);
-		dbg_dump_stack();
+		dump_stack();
 	}
 	return err;
 }
@@ -842,7 +842,7 @@ out:
 	ubifs_err("cannot write %d bytes to LEB %d:%d, error %d",
 		  len, wbuf->lnum, wbuf->offs, err);
 	dbg_dump_node(c, buf);
-	dbg_dump_stack();
+	dump_stack();
 	dbg_dump_leb(c, wbuf->lnum);
 	return err;
 }
@@ -961,7 +961,7 @@ int ubifs_read_node_wbuf(struct ubifs_wbuf *wbuf, void *buf, int type, int len,
 out:
 	ubifs_err("bad node at LEB %d:%d", lnum, offs);
 	dbg_dump_node(c, buf);
-	dbg_dump_stack();
+	dump_stack();
 	return -EINVAL;
 }
 
@@ -1018,7 +1018,7 @@ out:
 	ubifs_err("bad node at LEB %d:%d, LEB mapping status %d", lnum, offs,
 		  ubi_is_mapped(c->ubi, lnum));
 	dbg_dump_node(c, buf);
-	dbg_dump_stack();
+	dump_stack();
 	return -EINVAL;
 }
 
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index bc75e9d..bad8b5f 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -385,7 +385,7 @@ out:
 	if (err == -ENOSPC) {
 		/* This are some budgeting problems, print useful information */
 		down_write(&c->commit_sem);
-		dbg_dump_stack();
+		dump_stack();
 		dbg_dump_budg(c, &c->bi);
 		dbg_dump_lprops(c);
 		cmt_retries = dbg_check_lprops(c);
diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
index b5c95a6..2e4bc27f 100644
--- a/fs/ubifs/lprops.c
+++ b/fs/ubifs/lprops.c
@@ -1001,7 +1001,7 @@ void dbg_check_heap(struct ubifs_info *c, struct ubifs_lpt_heap *heap, int cat,
 out:
 	if (err) {
 		dbg_msg("failed cat %d hpos %d err %d", cat, i, err);
-		dbg_dump_stack();
+		dump_stack();
 		dbg_dump_heap(c, heap, cat);
 	}
 }
diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index 66d59d0..4b62998 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -926,7 +926,7 @@ static int check_lpt_crc(void *buf, int len)
 	if (crc != calc_crc) {
 		ubifs_err("invalid crc in LPT node: crc %hx calc %hx", crc,
 			  calc_crc);
-		dbg_dump_stack();
+		dump_stack();
 		return -EINVAL;
 	}
 	return 0;
@@ -949,7 +949,7 @@ static int check_lpt_type(uint8_t **addr, int *pos, int type)
 	if (node_type != type) {
 		ubifs_err("invalid type (%d) in LPT node type %d", node_type,
 			  type);
-		dbg_dump_stack();
+		dump_stack();
 		return -EINVAL;
 	}
 	return 0;
@@ -1247,7 +1247,7 @@ int ubifs_read_nnode(struct ubifs_info *c, struct ubifs_nnode *parent, int iip)
 
 out:
 	ubifs_err("error %d reading nnode at %d:%d", err, lnum, offs);
-	dbg_dump_stack();
+	dump_stack();
 	kfree(nnode);
 	return err;
 }
@@ -1313,7 +1313,7 @@ static int read_pnode(struct ubifs_info *c, struct ubifs_nnode *parent, int iip)
 out:
 	ubifs_err("error %d reading pnode at %d:%d", err, lnum, offs);
 	dbg_dump_pnode(c, pnode, parent, iip);
-	dbg_dump_stack();
+	dump_stack();
 	dbg_msg("calc num: %d", calc_pnode_num_from_parent(c, parent, iip));
 	kfree(pnode);
 	return err;
diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index c542c73..be18de8 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -159,7 +159,7 @@ void ubifs_delete_orphan(struct ubifs_info *c, ino_t inum)
 	}
 	spin_unlock(&c->orphan_lock);
 	dbg_err("missing orphan ino %lu", (unsigned long)inum);
-	dbg_dump_stack();
+	dump_stack();
 }
 
 /**
diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 16ad84d..2e0bc4e 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -339,7 +339,7 @@ static int lnc_add(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 
 	err = ubifs_validate_entry(c, dent);
 	if (err) {
-		dbg_dump_stack();
+		dump_stack();
 		dbg_dump_node(c, dent);
 		return err;
 	}
@@ -372,7 +372,7 @@ static int lnc_add_directly(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 
 	err = ubifs_validate_entry(c, node);
 	if (err) {
-		dbg_dump_stack();
+		dump_stack();
 		dbg_dump_node(c, node);
 		return err;
 	}
@@ -1734,7 +1734,7 @@ out_err:
 out:
 	ubifs_err("bad node at LEB %d:%d", zbr->lnum, zbr->offs);
 	dbg_dump_node(c, buf);
-	dbg_dump_stack();
+	dump_stack();
 	return err;
 }
 
@@ -1775,7 +1775,7 @@ int ubifs_tnc_bulk_read(struct ubifs_info *c, struct bu_info *bu)
 	if (err && err != -EBADMSG) {
 		ubifs_err("failed to read from LEB %d:%d, error %d",
 			  lnum, offs, err);
-		dbg_dump_stack();
+		dump_stack();
 		dbg_tnck(&bu->key, "key ");
 		return err;
 	}
@@ -3336,7 +3336,7 @@ out_dump:
 		  ((loff_t)block) << UBIFS_BLOCK_SHIFT);
 	mutex_unlock(&c->tnc_mutex);
 	dbg_dump_inode(c, inode);
-	dbg_dump_stack();
+	dump_stack();
 	return -EINVAL;
 
 out_unlock:
-- 
1.7.10
