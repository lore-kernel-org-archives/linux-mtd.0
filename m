Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvKQU-0004pC-M7
 for linux-mtd@lists.infradead.org; Mon, 01 Dec 2014 06:25:40 +0000
From: <chenjie6@huawei.com>
To: <linux-mtd@lists.infradead.org>, <David.Woodhouse@intel.com>
Subject: [PATCH] jffs2: bug fix of creating node when gc or find space
Date: Mon, 1 Dec 2014 22:21:11 +0800
Message-ID: <1417443671-24889-1-git-send-email-chenjie6@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: lizefan@huawei.com, zengweilin@huawei.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: chenjie <chenjie6@huawei.com>

Creat node by insert_inode_locked, write dnode successfully but dirent 
not writed ,so the gc or jffs2_reserve_space may read the block which dnode 
writed, the dnode can not been readed because it was created unfinished.

lockf2.test     D c02dead8     0 11666      1 0x00000001
locked:
c90f9be8   &inode->i_mutex  0  [<c00bf158>] generic_file_aio_write+0x40/0xb0	
c2c54c44   &c->alloc_sem    1  [<bf056f9c>] jffs2_garbage_collect_pass+0x1c/0xf08 [jffs2]	
[<c02dead8>] (__schedule+0x458/0x604) from [<c0114090>] (inode_wait+0x8/0x10)
[<c0114090>] (inode_wait+0x8/0x10) from [<c02dd050>] (__wait_on_bit+0x54/0xa0)
[<c02dd050>] (__wait_on_bit+0x54/0xa0) from [<c02dd114>] (out_of_line_wait_on_bit+0x78/0x84)
[<c02dd114>] (out_of_line_wait_on_bit+0x78/0x84) from [<c01157a0>] (iget_locked+0x90/0x1b0)
[<c01157a0>] (iget_locked+0x90/0x1b0) from [<bf059fe8>] (jffs2_iget+0xc/0x344 [jffs2])
[<bf059fe8>] (jffs2_iget+0xc/0x344 [jffs2]) from [<bf05a6fc>] (jffs2_gc_fetch_inode+0x104/0x158 [jffs2])
[<bf05a6fc>] (jffs2_gc_fetch_inode+0x104/0x158 [jffs2]) from [<bf0577f0>] (jffs2_garbage_collect_pass+0x870/0xf08 [jffs2])
[<bf0577f0>] (jffs2_garbage_collect_pass+0x870/0xf08 [jffs2]) from [<bf051248>] (jffs2_reserve_space+0x154/0x3b4 [jffs2])
[<bf051248>] (jffs2_reserve_space+0x154/0x3b4 [jffs2]) from [<bf053eac>] (jffs2_write_inode_range+0x58/0x3ac [jffs2])
[<bf053eac>] (jffs2_write_inode_range+0x58/0x3ac [jffs2]) from [<bf04ec20>] (jffs2_write_end+0x11c/0x224 [jffs2])
[<bf04ec20>] (jffs2_write_end+0x11c/0x224 [jffs2]) from [<c00bdfa4>] (generic_file_buffered_write+0x160/0x23c)
[<c00bdfa4>] (generic_file_buffered_write+0x160/0x23c) from [<c00bf0ac>] (__generic_file_aio_write+0x328/0x394)
[<c00bf0ac>] (__generic_file_aio_write+0x328/0x394) from [<c00bf16c>] (generic_file_aio_write+0x54/0xb0)
[<c00bf16c>] (generic_file_aio_write+0x54/0xb0) from [<c00fdc24>] (do_sync_write+0x74/0x98)
[<c00fdc24>] (do_sync_write+0x74/0x98) from [<c00fe550>] (vfs_write+0xcc/0x174)
[<c00fe550>] (vfs_write+0xcc/0x174) from [<c00fe8a8>] (SyS_write+0x38/0x64)
[<c00fe8a8>] (SyS_write+0x38/0x64) from [<c000f0c0>] (ret_fast_syscall+0x0/0x58)

Fixes:e72e6497e74811e01d72b4c1b7537b3aea3ee857
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen Jie <chenjie6@huawei.com>
---
 fs/jffs2/dir.c      |  4 ++++
 fs/jffs2/gc.c       | 10 ++++++++++
 fs/jffs2/nodelist.c |  9 +++++++++
 fs/jffs2/nodelist.h |  6 ++++++
 fs/jffs2/write.c    |  1 +
 5 files changed, 30 insertions(+)

diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
index 9385560..176bc94 100644
--- a/fs/jffs2/dir.c
+++ b/fs/jffs2/dir.c
@@ -208,6 +208,7 @@ static int jffs2_create(struct inode *dir_i, struct dentry *dentry,
 		  f->inocache->pino_nlink, inode->i_mapping->nrpages);
 
 	unlock_new_inode(inode);
+	jffs2_set_inocache_state_new(c, f->inocache, INO_STATE_N_NEW);
 	d_instantiate(dentry, inode);
 	return 0;
 
@@ -428,6 +429,7 @@ static int jffs2_symlink (struct inode *dir_i, struct dentry *dentry, const char
 	jffs2_complete_reservation(c);
 
 	unlock_new_inode(inode);
+	jffs2_set_inocache_state_new(c, f->inocache, INO_STATE_N_NEW);
 	d_instantiate(dentry, inode);
 	return 0;
 
@@ -573,6 +575,7 @@ static int jffs2_mkdir (struct inode *dir_i, struct dentry *dentry, umode_t mode
 	jffs2_complete_reservation(c);
 
 	unlock_new_inode(inode);
+	jffs2_set_inocache_state_new(c, f->inocache, INO_STATE_N_NEW);
 	d_instantiate(dentry, inode);
 	return 0;
 
@@ -748,6 +751,7 @@ static int jffs2_mknod (struct inode *dir_i, struct dentry *dentry, umode_t mode
 	jffs2_complete_reservation(c);
 
 	unlock_new_inode(inode);
+	jffs2_set_inocache_state_new(c, f->inocache, INO_STATE_N_NEW);
 	d_instantiate(dentry, inode);
 	return 0;
 
diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
index 5a2dec2..e7e8c09 100644
--- a/fs/jffs2/gc.c
+++ b/fs/jffs2/gc.c
@@ -333,6 +333,16 @@ int jffs2_garbage_collect_pass(struct jffs2_sb_info *c)
 		  __func__, jeb->offset, ref_offset(raw), ref_flags(raw),
 		  ic->ino);
 
+	/*create but not finished so find next block*/
+	if (ic->state_new == INO_STATE_I_NEW) {
+		jffs2_dbg(1, "%s(): ino #%u in state new so find next block\n",
+			  __func__, ic->ino);
+		c->gcblock = NULL;
+		mutex_unlock(&c->alloc_sem);
+		spin_unlock(&c->inocache_lock);
+		return 0;
+	}
+
 	/* Three possibilities:
 	   1. Inode is already in-core. We must iget it and do proper
 	      updating to its fragtree, etc.
diff --git a/fs/jffs2/nodelist.c b/fs/jffs2/nodelist.c
index 9a5449b..9f469c4 100644
--- a/fs/jffs2/nodelist.c
+++ b/fs/jffs2/nodelist.c
@@ -413,6 +413,15 @@ void jffs2_set_inocache_state(struct jffs2_sb_info *c, struct jffs2_inode_cache
 	spin_unlock(&c->inocache_lock);
 }
 
+void jffs2_set_inocache_state_new(struct jffs2_sb_info *c,
+					struct jffs2_inode_cache *ic, int state)
+{
+	spin_lock(&c->inocache_lock);
+	ic->state_new = state;
+	wake_up(&c->inocache_wq);
+	spin_unlock(&c->inocache_lock);
+}
+
 /* During mount, this needs no locking. During normal operation, its
    callers want to do other stuff while still holding the inocache_lock.
    Rather than introducing special case get_ino_cache functions or
diff --git a/fs/jffs2/nodelist.h b/fs/jffs2/nodelist.h
index fa35ff7..ac2d8c8 100644
--- a/fs/jffs2/nodelist.h
+++ b/fs/jffs2/nodelist.h
@@ -180,6 +180,7 @@ struct jffs2_inode_cache {
 				   here; other inodes store nlink.
 				   Zero always means that it's
 				   completely unlinked. */
+	uint32_t state_new;	/*create flag*/
 };
 
 /* Inode states for 'state' above. We need the 'GC' state to prevent
@@ -193,6 +194,9 @@ struct jffs2_inode_cache {
 #define INO_STATE_READING	5	/* In read_inode() */
 #define INO_STATE_CLEARING	6	/* In clear_inode() */
 
+#define INO_STATE_I_NEW		0	/* Just create but not finish*/
+#define INO_STATE_N_NEW		1	/* finished*/
+
 #define INO_FLAGS_XATTR_CHECKED	0x01	/* has no duplicate xattr_ref */
 
 #define RAWNODE_CLASS_INODE_CACHE	0
@@ -359,6 +363,8 @@ static inline struct jffs2_node_frag *frag_last(struct rb_root *root)
 /* nodelist.c */
 void jffs2_add_fd_to_list(struct jffs2_sb_info *c, struct jffs2_full_dirent *new, struct jffs2_full_dirent **list);
 void jffs2_set_inocache_state(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic, int state);
+void jffs2_set_inocache_state_new(struct jffs2_sb_info *c,
+				struct jffs2_inode_cache *ic, int state);
 struct jffs2_inode_cache *jffs2_get_ino_cache(struct jffs2_sb_info *c, uint32_t ino);
 void jffs2_add_ino_cache (struct jffs2_sb_info *c, struct jffs2_inode_cache *new);
 void jffs2_del_ino_cache(struct jffs2_sb_info *c, struct jffs2_inode_cache *old);
diff --git a/fs/jffs2/write.c b/fs/jffs2/write.c
index b634de4..dc8242d 100644
--- a/fs/jffs2/write.c
+++ b/fs/jffs2/write.c
@@ -36,6 +36,7 @@ int jffs2_do_new_inode(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
 	f->inocache->pino_nlink = 1; /* Will be overwritten shortly for directories */
 	f->inocache->nodes = (struct jffs2_raw_node_ref *)f->inocache;
 	f->inocache->state = INO_STATE_PRESENT;
+	f->inocache->state_new = INO_STATE_I_NEW;
 
 	jffs2_add_ino_cache(c, f->inocache);
 	jffs2_dbg(1, "%s(): Assigned ino# %d\n", __func__, f->inocache->ino);
-- 
1.8.0
