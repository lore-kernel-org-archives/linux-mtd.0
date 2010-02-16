From: Joakim.Tjernlund@transmode.se (Joakim Tjernlund)
Date: Tue, 16 Feb 2010 15:18:31 +0100
Subject: [PATCH] jffs2: Make jffs2_erase_pending_trigger() initiate GC.
Message-ID: <mailman.213.1266330731.2170.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Since erasing is now in the GC thread, erases should trigger
the GC task instead.
wbuf.c still wants to flush its buffer via write_super so
invent jffs2_dirty_trigger() and use that in wbuf.
Remove surplus call to jffs2_erase_pending_trigger() in erase.c
and remove jffs2_garbage_collect_trigger() from write_super as
of now write_super() should only commit dirty data to disk.

Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
---
 fs/jffs2/erase.c    |    2 --
 fs/jffs2/os-linux.h |    9 +++++++--
 fs/jffs2/super.c    |    1 -
 fs/jffs2/wbuf.c     |    2 +-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index 1ca2559..5616658 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -172,8 +172,6 @@ static void jffs2_erase_succeeded(struct jffs2_sb_info *c, struct jffs2_eraseblo
 	list_move_tail(&jeb->list, &c->erase_complete_list);
 	spin_unlock(&c->erase_completion_lock);
 	mutex_unlock(&c->erase_free_sem);
-	/* Ensure that kupdated calls us again to mark them clean */
-	jffs2_erase_pending_trigger(c);
 }

 static void jffs2_erase_failed(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, uint32_t bad_offset)
diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
index a7f03b7..5d26362 100644
--- a/fs/jffs2/os-linux.h
+++ b/fs/jffs2/os-linux.h
@@ -140,8 +140,7 @@ void jffs2_nor_wbuf_flash_cleanup(struct jffs2_sb_info *c);

 #endif /* WRITEBUFFER */

-/* erase.c */
-static inline void jffs2_erase_pending_trigger(struct jffs2_sb_info *c)
+static inline void jffs2_dirty_trigger(struct jffs2_sb_info *c)
 {
 	OFNI_BS_2SFFJ(c)->s_dirt = 1;
 }
@@ -151,6 +150,12 @@ int jffs2_start_garbage_collect_thread(struct jffs2_sb_info *c);
 void jffs2_stop_garbage_collect_thread(struct jffs2_sb_info *c);
 void jffs2_garbage_collect_trigger(struct jffs2_sb_info *c);

+/* erase.c */
+static inline void jffs2_erase_pending_trigger(struct jffs2_sb_info *c)
+{
+	jffs2_garbage_collect_trigger(c);
+}
+
 /* dir.c */
 extern const struct file_operations jffs2_dir_operations;
 extern const struct inode_operations jffs2_dir_inode_operations;
diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 5162329..511e2d6 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -63,7 +63,6 @@ static void jffs2_write_super(struct super_block *sb)

 	if (!(sb->s_flags & MS_RDONLY)) {
 		D1(printk(KERN_DEBUG "jffs2_write_super()\n"));
-		jffs2_garbage_collect_trigger(c);
 		jffs2_flush_wbuf_gc(c, 0);
 	}

diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index 5ef7bac..f319efc 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -84,7 +84,7 @@ static void jffs2_wbuf_dirties_inode(struct jffs2_sb_info *c, uint32_t ino)
 	struct jffs2_inodirty *new;

 	/* Mark the superblock dirty so that kupdated will flush... */
-	jffs2_erase_pending_trigger(c);
+	jffs2_dirty_trigger(c);

 	if (jffs2_wbuf_pending_for_ino(c, ino))
 		return;
--
1.6.4.4
