Subject: Re: [PATCH] jffs2: Move erasing from write_super to GC.
From: David Woodhouse <dwmw2@infradead.org>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <OFD51FB25D.7FE00DFB-ONC1257727.007C6420-C1257727.007CE876@transmode.se>
References: <1269079399-27087-1-git-send-email-Joakim.Tjernlund@transmode.se>
	<1273771018.12840.7077.camel@macbook.infradead.org>
	<OFA2F265F6.2B404027-ONC1257723.003646C0-C1257723.0037EF5F@transmode.se>
	<1273833304.9999.1994.camel@macbook.infradead.org>
	<OF1C1D0F53.C35CA5E4-ONC1257723.003B9D61-C1257723.003D1321@transmode.se>
	<OF7E076EC4.DAE6F9AF-ONC1257723.0042AFF4-C1257723.00430591@transmode.se>
	<1274207844.6930.7754.camel@macbook.infradead.org>
	<1274209152.6930.7802.camel@macbook.infradead.org>
	<OFD51FB25D.7FE00DFB-ONC1257727.007C6420-C1257727.007CE876@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 19 May 2010 00:42:02 +0100
Message-ID: <1274226122.6930.8416.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-05-19 at 00:44 +0200, Joakim Tjernlund wrote:
> 
> oops, this got a lot more complicated. I will have closer look tmw.

It's not so bad -- the whole thing looks like this (I'll follow it up
with a global s/jffs2_erase_pending_trigger/jffs2_gc_thread_trigger/).

It could perhaps be broken into smaller simple patches along the lines
of:
 - Add 'work_done' return value from jffs2_erase_pending_blocks()
 - Call jffs2_erase_pending_blocks() from jffs2_g_c_pass()
 - Fix the conditions under which jffs2_g_c_pass() will return -EINVAL,
   fix the way that jffs2_reserve_space() will respond to that, and fix
   jffs2_erase_succeeded() to actually wake up the erase_wait queue.
 - Remove locking from jffs2_garbage_collect_trigger() and require that
   callers have c->erase_completion_lock already held.
 - Change most callers of jffs2_erase_pending_trigger() to call
   jffs2_garbage_collect_trigger() instead. To comply with the locking
   rules, this may involve moving the call up or down a few lines, or
   sometimes adding a new lock/unlock pair around it.
 - Remove jffs2_erase_pending_blocks() call from jffs2_write_super().
 - Rename jffs2_erase_pending_trigger() and its only remaining caller
   in wbuf.c to jffs2_dirty_trigger().


diff --git a/fs/jffs2/background.c b/fs/jffs2/background.c
index 3ff50da..39c65ad 100644
--- a/fs/jffs2/background.c
+++ b/fs/jffs2/background.c
@@ -21,12 +21,11 @@
 
 static int jffs2_garbage_collect_thread(void *);
 
-void jffs2_garbage_collect_trigger(struct jffs2_sb_info *c)
+void jffs2_erase_pending_trigger(struct jffs2_sb_info *c)
 {
-	spin_lock(&c->erase_completion_lock);
+	BUG_ON(spin_trylock(&c->erase_completion_lock));
 	if (c->gc_task && jffs2_thread_should_wake(c))
 		send_sig(SIGHUP, c->gc_task, 1);
-	spin_unlock(&c->erase_completion_lock);
 }
 
 /* This must only ever be called when no GC thread is currently running */
diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index b47679b..e8638f8 100644
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
@@ -165,10 +168,11 @@ static void jffs2_erase_succeeded(struct jffs2_sb_info *c, struct jffs2_eraseblo
 	mutex_lock(&c->erase_free_sem);
 	spin_lock(&c->erase_completion_lock);
 	list_move_tail(&jeb->list, &c->erase_complete_list);
+	/* Wake the GC thread to mark them clean */
+	jffs2_erase_pending_trigger(c);
 	spin_unlock(&c->erase_completion_lock);
 	mutex_unlock(&c->erase_free_sem);
-	/* Ensure that kupdated calls us again to mark them clean */
-	jffs2_erase_pending_trigger(c);
+	wake_up(&c->erase_wait);
 }
 
 static void jffs2_erase_failed(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, uint32_t bad_offset)
@@ -487,9 +491,9 @@ filebad:
 
 refile:
 	/* Stick it back on the list from whence it came and come back later */
-	jffs2_erase_pending_trigger(c);
 	mutex_lock(&c->erase_free_sem);
 	spin_lock(&c->erase_completion_lock);
+	jffs2_erase_pending_trigger(c);
 	list_move(&jeb->list, &c->erase_complete_list);
 	spin_unlock(&c->erase_completion_lock);
 	mutex_unlock(&c->erase_free_sem);
diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
index 3b6f2fa..1ea4a84 100644
--- a/fs/jffs2/gc.c
+++ b/fs/jffs2/gc.c
@@ -214,6 +214,19 @@ int jffs2_garbage_collect_pass(struct jffs2_sb_info *c)
 		return ret;
 	}
 
+	/* If there are any blocks which need erasing, erase them now */
+	if (!list_empty(&c->erase_complete_list) ||
+	    !list_empty(&c->erase_pending_list)) {
+		spin_unlock(&c->erase_completion_lock);
+		D1(printk(KERN_DEBUG "jffs2_garbage_collect_pass() erasing pending blocks\n"));
+		if (jffs2_erase_pending_blocks(c, 1)) {
+			mutex_unlock(&c->alloc_sem);
+			return 0;
+		}
+		D1(printk(KERN_DEBUG "No progress from erasing blocks; doing GC anyway\n"));
+		spin_lock(&c->erase_completion_lock);
+	}
+
 	/* First, work out which block we're garbage-collecting */
 	jeb = c->gcblock;
 
@@ -222,7 +235,7 @@ int jffs2_garbage_collect_pass(struct jffs2_sb_info *c)
 
 	if (!jeb) {
 		/* Couldn't find a free block. But maybe we can just erase one and make 'progress'? */
-		if (!list_empty(&c->erase_pending_list)) {
+		if (c->nr_erasing_blocks) {
 			spin_unlock(&c->erase_completion_lock);
 			mutex_unlock(&c->alloc_sem);
 			return -EAGAIN;
diff --git a/fs/jffs2/nodelist.h b/fs/jffs2/nodelist.h
index 36d7a84..a881a42 100644
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
index 191359d..8ec436a 100644
--- a/fs/jffs2/nodemgmt.c
+++ b/fs/jffs2/nodemgmt.c
@@ -115,9 +115,21 @@ int jffs2_reserve_space(struct jffs2_sb_info *c, uint32_t minsize,
 			spin_unlock(&c->erase_completion_lock);
 
 			ret = jffs2_garbage_collect_pass(c);
-
-			if (ret == -EAGAIN)
-				jffs2_erase_pending_blocks(c, 1);
+			if (ret == -EAGAIN) {
+				spin_lock(&c->erase_completion_lock);
+				if (c->nr_erasing_blocks &&
+				    list_empty(&c->erase_pending_list) &&
+				    list_empty(&c->erase_complete_list)) {
+					DECLARE_WAITQUEUE(wait, current);
+					set_current_state(TASK_UNINTERRUPTIBLE);
+					add_wait_queue(&c->erase_wait, &wait);
+					D1(printk(KERN_DEBUG "%s waiting for erase to complete\n", __func__));
+					spin_unlock(&c->erase_completion_lock);
+					
+					schedule();
+				} else
+					spin_unlock(&c->erase_completion_lock);
+			}
 			else if (ret)
 				return ret;
 
@@ -469,7 +481,9 @@ struct jffs2_raw_node_ref *jffs2_add_physical_node_ref(struct jffs2_sb_info *c,
 void jffs2_complete_reservation(struct jffs2_sb_info *c)
 {
 	D1(printk(KERN_DEBUG "jffs2_complete_reservation()\n"));
-	jffs2_garbage_collect_trigger(c);
+	spin_lock(&c->erase_completion_lock);
+	jffs2_erase_pending_trigger(c);
+	spin_unlock(&c->erase_completion_lock);
 	mutex_unlock(&c->alloc_sem);
 }
 
@@ -732,6 +746,10 @@ int jffs2_thread_should_wake(struct jffs2_sb_info *c)
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
index a7f03b7..64ac455 100644
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
@@ -149,7 +148,7 @@ static inline void jffs2_erase_pending_trigger(struct jffs2_sb_info *c)
 /* background.c */
 int jffs2_start_garbage_collect_thread(struct jffs2_sb_info *c);
 void jffs2_stop_garbage_collect_thread(struct jffs2_sb_info *c);
-void jffs2_garbage_collect_trigger(struct jffs2_sb_info *c);
+void jffs2_erase_pending_trigger(struct jffs2_sb_info *c);
 
 /* dir.c */
 extern const struct file_operations jffs2_dir_operations;
diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index 696686c..1312552 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -260,7 +260,9 @@ int jffs2_scan_medium(struct jffs2_sb_info *c)
 			ret = -EIO;
 			goto out;
 		}
+		spin_lock(&c->erase_completion_lock);
 		jffs2_erase_pending_trigger(c);
+		spin_unlock(&c->erase_completion_lock);
 	}
 	ret = 0;
  out:
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
dwmw2
