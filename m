Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OCtor-0004hW-7t
	for linux-mtd@lists.infradead.org; Fri, 14 May 2010 12:16:47 +0000
In-Reply-To: <OF1C1D0F53.C35CA5E4-ONC1257723.003B9D61-C1257723.003D1321@transmode.se>
References: <1269079399-27087-1-git-send-email-Joakim.Tjernlund@transmode.se>		<1273771018.12840.7077.camel@macbook.infradead.org>
	<OFA2F265F6.2B404027-ONC1257723.003646C0-C1257723.0037EF5F@transmode.se>	<1273833304.9999.1994.camel@macbook.infradead.org>
	<OF1C1D0F53.C35CA5E4-ONC1257723.003B9D61-C1257723.003D1321@transmode.se>
Subject: Re: [PATCH] jffs2: Move erasing from write_super to GC.
Message-ID: <OF7E076EC4.DAE6F9AF-ONC1257723.0042AFF4-C1257723.00430591@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Fri, 14 May 2010 14:12:03 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> David Woodhouse <dwmw2@infradead.org> wrote on 2010/05/14 12:35:04:
> >
> > On Fri, 2010-05-14 at 12:10 +0200, Joakim Tjernlund wrote:
> > >  The only callers of jffs2_erase_pending_blocks() now call it with a
> > > > 'count' argument of 1. So perhaps it's now misnamed and the 's' and the
> > > > extra argument should be dropped?
> > >
> > > I didn't want to change to much and who knows, maybe someone wants
> > > to erase more than one block in the future. Removing the
> > > count could be an add on patch once this patch has proven itself.
> >
> > Yeah, that makes some sense.
> >
> > > > I don't much like the calculation you've added to the end of that
> > > > function either, which really ought to be under locks (even though right
> > > > now I suspect it doesn't hurt). Why recalculate that at all, though --
> > >
> > > Why does a simple list test need locks?
> >
> > Because it's not just about the test itself. It's also about the memory
> > barriers. Some other CPU could have changed the list (under locks) but
> > unless you have the memory barrier which is implicit in the spinlock,
> > you might see old data.
>
> old data doesn't matter here I think.
>
> >
> > > > why not keep a 'ret' variable which defaults to 0 but is set to 1 just
> > > > before the 'goto done' which is the only way out of the function where
> > > > the return value should be non-zero anyway?
> > >
> > > That would not be the same, would it? One wants to know if the lists
> > > are empty AFTER erasing count blocks.
> >
> > Hm, does one? There's precisely one place we use this return value, in
> > the GC thread. Can you explain the logic of what you were doing there?
>
> Sure, return 1 if there are more blocks left in the list after
> erasing count. That way the caller knows if there are any block left
> to erase.
>
> > It looks like you really wanted it to return a flag saying whether it
> > actually _did_ anything or not. And if it did, that's your work for this
> > GC wakeup and you don't call jffs2_garbage_collect_pass(). Why are you
> > returning a value which tells whether there's more work to do?
>
> hmm, I guess the simpler method like you suggested would work too.
> Details are a bit fuzzy now.
>
> >
> > >  I guess I could move the list empty
> > > check before goto done, but that would not really change anything.
> >
> > Ah, yes. Instead of setting ret=1 at the 'goto done', you'd actually do
> > the test somewhere there too, before dropping the locks. Assuming that
> > this really is the return value you need to return, rather than a simple
> > 'work_done' flag.

How about this then? I have changed jffs2_erase_pending_blocks() to use
the simpler work_done flag:

>From a2173115bbb4544ff0652232a89426a55d32db61 Mon Sep 17 00:00:00 2001
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
Date: Mon, 15 Feb 2010 08:40:33 +0100
Subject: [PATCH] jffs2: Move erasing from write_super to GC.

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
