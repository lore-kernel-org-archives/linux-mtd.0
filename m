Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q46zQ-00014O-MB
	for linux-mtd@lists.infradead.org; Mon, 28 Mar 2011 07:35:55 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2S7Zorn029261
	for <linux-mtd@lists.infradead.org>; Mon, 28 Mar 2011 10:35:50 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/4] UBIFS: fix minor stylistic issues
Date: Mon, 28 Mar 2011 10:38:31 +0300
Message-Id: <1301297914-14712-1-git-send-email-dedekind1@gmail.com>
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

Fix several minor stylistic issues:
* lines longer than 80 characters
* space before closing parenthesis ')'
* spaces in the indentations

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c      |    3 ++-
 fs/ubifs/file.c       |   17 +++++++++--------
 fs/ubifs/io.c         |    4 ++--
 fs/ubifs/lpt_commit.c |    2 +-
 fs/ubifs/orphan.c     |    3 ++-
 fs/ubifs/super.c      |    4 ++--
 fs/ubifs/tnc.c        |   10 +++++-----
 fs/ubifs/ubifs.h      |    6 +++---
 8 files changed, 26 insertions(+), 23 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 8dc686e..68cc992 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2390,7 +2390,8 @@ int dbg_check_nondata_nodes_order(struct ubifs_info *c, struct list_head *head)
 		hashb = key_block(c, &sb->key);
 
 		if (hasha > hashb) {
-			ubifs_err("larger hash %u goes before %u", hasha, hashb);
+			ubifs_err("larger hash %u goes before %u",
+				  hasha, hashb);
 			goto error_dump;
 		}
 	}
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 28be1e6..0f20df5 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -971,11 +971,11 @@ static int do_writepage(struct page *page, int len)
  * the page locked, and it locks @ui_mutex. However, write-back does take inode
  * @i_mutex, which means other VFS operations may be run on this inode at the
  * same time. And the problematic one is truncation to smaller size, from where
- * we have to call 'truncate_setsize()', which first changes @inode->i_size, then
- * drops the truncated pages. And while dropping the pages, it takes the page
- * lock. This means that 'do_truncation()' cannot call 'truncate_setsize()' with
- * @ui_mutex locked, because it would deadlock with 'ubifs_writepage()'. This
- * means that @inode->i_size is changed while @ui_mutex is unlocked.
+ * we have to call 'truncate_setsize()', which first changes @inode->i_size,
+ * then drops the truncated pages. And while dropping the pages, it takes the
+ * page lock. This means that 'do_truncation()' cannot call 'truncate_setsize()'
+ * with @ui_mutex locked, because it would deadlock with 'ubifs_writepage()'.
+ * This means that @inode->i_size is changed while @ui_mutex is unlocked.
  *
  * XXX(truncate): with the new truncate sequence this is not true anymore,
  * and the calls to truncate_setsize can be move around freely.  They should
@@ -1429,10 +1429,11 @@ static int ubifs_releasepage(struct page *page, gfp_t unused_gfp_flags)
 }
 
 /*
- * mmap()d file has taken write protection fault and is being made
- * writable. UBIFS must ensure page is budgeted for.
+ * mmap()d file has taken write protection fault and is being made writable.
+ * UBIFS must ensure page is budgeted for.
  */
-static int ubifs_vm_page_mkwrite(struct vm_area_struct *vma, struct vm_fault *vmf)
+static int ubifs_vm_page_mkwrite(struct vm_area_struct *vma,
+				 struct vm_fault *vmf)
 {
 	struct page *page = vmf->page;
 	struct inode *inode = vma->vm_file->f_path.dentry->d_inode;
diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index dfd168b..6cc0931 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -393,7 +393,7 @@ int ubifs_wbuf_sync_nolock(struct ubifs_wbuf *wbuf)
 	ubifs_assert(wbuf->size % c->min_io_size == 0);
 	ubifs_assert(!c->ro_media && !c->ro_mount);
 	if (c->leb_size - wbuf->offs >= c->max_write_size)
-		ubifs_assert(!((wbuf->offs + wbuf->size) % c->max_write_size ));
+		ubifs_assert(!((wbuf->offs + wbuf->size) % c->max_write_size));
 
 	if (c->ro_error)
 		return -EROFS;
@@ -588,7 +588,7 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 	ubifs_assert(mutex_is_locked(&wbuf->io_mutex));
 	ubifs_assert(!c->ro_media && !c->ro_mount);
 	if (c->leb_size - wbuf->offs >= c->max_write_size)
-		ubifs_assert(!((wbuf->offs + wbuf->size) % c->max_write_size ));
+		ubifs_assert(!((wbuf->offs + wbuf->size) % c->max_write_size));
 
 	if (c->leb_size - wbuf->offs - wbuf->used < aligned_len) {
 		err = -ENOSPC;
diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index 0c9c69b..9fe376a 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -586,7 +586,7 @@ static struct ubifs_pnode *next_pnode_to_dirty(struct ubifs_info *c,
 			if (nnode->nbranch[iip].lnum)
 				break;
 		}
-       } while (iip >= UBIFS_LPT_FANOUT);
+	} while (iip >= UBIFS_LPT_FANOUT);
 
 	/* Go right */
 	nnode = ubifs_get_nnode(c, nnode, iip);
diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index 09df318..bd644bf 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -673,7 +673,8 @@ static int kill_orphans(struct ubifs_info *c)
 		sleb = ubifs_scan(c, lnum, 0, c->sbuf, 1);
 		if (IS_ERR(sleb)) {
 			if (PTR_ERR(sleb) == -EUCLEAN)
-				sleb = ubifs_recover_leb(c, lnum, 0, c->sbuf, 0);
+				sleb = ubifs_recover_leb(c, lnum, 0,
+							 c->sbuf, 0);
 			if (IS_ERR(sleb)) {
 				err = PTR_ERR(sleb);
 				break;
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 6ddd997..41d560f 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1144,7 +1144,7 @@ static int check_free_space(struct ubifs_info *c)
 {
 	ubifs_assert(c->dark_wm > 0);
 	if (c->lst.total_free + c->lst.total_dirty < c->dark_wm) {
-		ubifs_err("insufficient free space to mount in read/write mode");
+		ubifs_err("insufficient free space to mount in R/W mode");
 		dbg_dump_budg(c);
 		dbg_dump_lprops(c);
 		return -ENOSPC;
@@ -1456,7 +1456,7 @@ static int mount_ubifs(struct ubifs_info *c)
 	dbg_msg("node sizes:          ref %zu, cmt. start %zu, orph %zu",
 		UBIFS_REF_NODE_SZ, UBIFS_CS_NODE_SZ, UBIFS_ORPH_NODE_SZ);
 	dbg_msg("max. node sizes:     data %zu, inode %zu dentry %zu, idx %d",
-	        UBIFS_MAX_DATA_NODE_SZ, UBIFS_MAX_INO_NODE_SZ,
+		UBIFS_MAX_DATA_NODE_SZ, UBIFS_MAX_INO_NODE_SZ,
 		UBIFS_MAX_DENT_NODE_SZ, ubifs_idx_node_sz(c, c->fanout));
 	dbg_msg("dead watermark:      %d", c->dead_wm);
 	dbg_msg("dark watermark:      %d", c->dark_wm);
diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index de48597..8119b1f 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -2557,11 +2557,11 @@ int ubifs_tnc_remove_nm(struct ubifs_info *c, const union ubifs_key *key,
 		if (err) {
 			/* Ensure the znode is dirtied */
 			if (znode->cnext || !ubifs_zn_dirty(znode)) {
-				    znode = dirty_cow_bottom_up(c, znode);
-				    if (IS_ERR(znode)) {
-					    err = PTR_ERR(znode);
-					    goto out_unlock;
-				    }
+				znode = dirty_cow_bottom_up(c, znode);
+				if (IS_ERR(znode)) {
+					err = PTR_ERR(znode);
+					goto out_unlock;
+				}
 			}
 			err = tnc_delete(c, znode, n);
 		}
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 8c40ad3..d4c07a9 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -389,9 +389,9 @@ struct ubifs_gced_idx_leb {
  * The @ui_size is a "shadow" variable for @inode->i_size and UBIFS uses
  * @ui_size instead of @inode->i_size. The reason for this is that UBIFS cannot
  * make sure @inode->i_size is always changed under @ui_mutex, because it
- * cannot call 'truncate_setsize()' with @ui_mutex locked, because it would deadlock
- * with 'ubifs_writepage()' (see file.c). All the other inode fields are
- * changed under @ui_mutex, so they do not need "shadow" fields. Note, one
+ * cannot call 'truncate_setsize()' with @ui_mutex locked, because it would
+ * deadlock with 'ubifs_writepage()' (see file.c). All the other inode fields
+ * are changed under @ui_mutex, so they do not need "shadow" fields. Note, one
  * could consider to rework locking and base it on "shadow" fields.
  */
 struct ubifs_inode {
-- 
1.7.2.3
