From: Joakim.Tjernlund@transmode.se (Joakim Tjernlund)
Date: Mon, 15 Feb 2010 08:40:33 +0100
Subject: [PATCH] jffs2: Move erasing from write_super to GC.
Message-ID: <mailman.447.1273839408.2170.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Erasing blocks is a form of GC and therefore it should live in the
GC task. By moving it there two problems will be solved:
1) unmounting will not hang until all pending blocks has
   been erased.
2) Erasing can be paused by sending a SIGSTOP to the GC thread which
   allowes for time critical tasks to work in peace.

Since erasing now is in the GC thread, erases should trigger
the GC task instead.
wbuf.c still wants to flush its buffer via write_super so
invent jffs2_dirty_trigger() and use that in wbuf.
Remove surplus call to jffs2_erase_pending_trigger() in erase.c
and remove jffs2_garbage_collect_trigger() from write_super as
of now write_super() should only commit dirty data to disk.

Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
---
 fs/jffs2/background.c |    4 +++-
 fs/jffs2/erase.c      |    7 ++++---
 fs/jffs2/nodelist.h   |    2 +-
 fs/jffs2/nodemgmt.c   |    4 ++++
 fs/jffs2/os-linux.h   |    9 +++++++--
 fs/jffs2/super.c      |    2 --
 fs/jffs2/wbuf.c       |    2 +-
 7 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/fs/jffs2/background.c b/fs/jffs2/background.c
index 3ff50da..6cc014c 100644
--- a/fs/jffs2/background.c
+++ b/fs/jffs2/background.c
@@ -146,7 +146,9 @@ static int jffs2_garbage_collect_thread(void *_c)
 		disallow_signal(SIGHUP);

 		D1(printk(KERN_DEBUG "jffs2_garbage_collect_thread(): pass\n"));
-		if (jffs2_garbage_collect_pass(c) == -ENOSPC) {
+		if (jffs2_erase_pending_blocks(c, 1))
+			/* Nothing more to do ATM */;
+		else if (jffs2_garbage_collect_pass(c) == -ENOSPC) {
 			printk(KERN_NOTICE "No space for garbage collection. Aborting GC thread\n");
 			goto die;
 		}
diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index b47679b..2a6cc6c 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -103,9 +103,10 @@ static void jffs2_erase_block(struct jffs2_sb_info *c,
 	jffs2_erase_failed(c, jeb, bad_offset);
 }

-void jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count)
+int jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count)
 {
 	struct jffs2_eraseblock *jeb;
+	int work_done = 0;

 	mutex_lock(&c->erase_free_sem);

@@ -123,6 +124,7 @@ void jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count)

 			if (!--count) {
 				D1(printk(KERN_DEBUG "Count reached. jffs2_erase_pending_blocks leaving\n"));
+				work_done = 1;
 				goto done;
 			}

@@ -157,6 +159,7 @@ void jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count)
 	mutex_unlock(&c->erase_free_sem);
  done:
 	D1(printk(KERN_DEBUG "jffs2_erase_pending_blocks completed\n"));
+	return work_done;
 }

 static void jffs2_erase_succeeded(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb)
@@ -167,8 +170,6 @@ static void jffs2_erase_succeeded(struct jffs2_sb_info *c, struct jffs2_eraseblo
 	list_move_tail(&jeb->list, &c->erase_complete_list);
 	spin_unlock(&c->erase_completion_lock);
 	mutex_unlock(&c->erase_free_sem);
-	/* Ensure that kupdated calls us again to mark them clean */
-	jffs2_erase_pending_trigger(c);
 }

 static void jffs2_erase_failed(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, uint32_t bad_offset)
diff --git a/fs/jffs2/nodelist.h b/fs/jffs2/nodelist.h
index 507ed6e..4b1848c 100644
--- a/fs/jffs2/nodelist.h
+++ b/fs/jffs2/nodelist.h
@@ -464,7 +464,7 @@ int jffs2_scan_dirty_space(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb
 int jffs2_do_mount_fs(struct jffs2_sb_info *c);

 /* erase.c */
-void jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count);
+int jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count);
 void jffs2_free_jeb_node_refs(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb);

 #ifdef CONFIG_JFFS2_FS_WRITEBUFFER
diff --git a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
index 21a0529..155fd63 100644
--- a/fs/jffs2/nodemgmt.c
+++ b/fs/jffs2/nodemgmt.c
@@ -733,6 +733,10 @@ int jffs2_thread_should_wake(struct jffs2_sb_info *c)
 	int nr_very_dirty = 0;
 	struct jffs2_eraseblock *jeb;

+	if (!list_empty(&c->erase_complete_list) ||
+	    !list_empty(&c->erase_pending_list))
+		return 1;
+
 	if (c->unchecked_size) {
 		D1(printk(KERN_DEBUG "jffs2_thread_should_wake(): unchecked_size %d, checked_ino #%d\n",
 			  c->unchecked_size, c->checked_ino));
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
index 9a80e8e..511e2d6 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -63,8 +63,6 @@ static void jffs2_write_super(struct super_block *sb)

 	if (!(sb->s_flags & MS_RDONLY)) {
 		D1(printk(KERN_DEBUG "jffs2_write_super()\n"));
-		jffs2_garbage_collect_trigger(c);
-		jffs2_erase_pending_blocks(c, 0);
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
