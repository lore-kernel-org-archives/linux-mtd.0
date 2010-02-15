Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nh3Ph-0006Kw-Lx
	for linux-mtd@lists.infradead.org; Mon, 15 Feb 2010 16:03:14 +0000
Received: from sesr04.transmode.se (sesr04.transmode.se [192.168.201.15])
	by gw1.transmode.se (Postfix) with ESMTP id 76F47650002
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Feb 2010 17:03:04 +0100 (CET)
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] jffs:2 Move erasing from write_super to GC.
Date: Mon, 15 Feb 2010 17:03:00 +0100
Message-Id: <1266249781-27970-1-git-send-email-Joakim.Tjernlund@transmode.se>
Cc: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Erasing blocks is a form of GC and therefor it should live in the
GC task. By moving it there two problems will be solved:
1) umounting will not hang until all pending blocks has
   been erased.
2) Erasing can be paused by sending a SIGSTOP to the GC thread which
   allowes for time critical tasks work in peace.

Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
---
 fs/jffs2/background.c |    1 +
 fs/jffs2/erase.c      |    5 +++++
 fs/jffs2/nodemgmt.c   |    4 ++++
 fs/jffs2/super.c      |    1 -
 4 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/fs/jffs2/background.c b/fs/jffs2/background.c
index 3ff50da..a8e0140 100644
--- a/fs/jffs2/background.c
+++ b/fs/jffs2/background.c
@@ -146,6 +146,7 @@ static int jffs2_garbage_collect_thread(void *_c)
 		disallow_signal(SIGHUP);
 
 		D1(printk(KERN_DEBUG "jffs2_garbage_collect_thread(): pass\n"));
+		jffs2_erase_pending_blocks(c, 0);
 		if (jffs2_garbage_collect_pass(c) == -ENOSPC) {
 			printk(KERN_NOTICE "No space for garbage collection. Aborting GC thread\n");
 			goto die;
diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index b47679b..1ca2559 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -114,6 +114,11 @@ void jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count)
 	while (!list_empty(&c->erase_complete_list) ||
 	       !list_empty(&c->erase_pending_list)) {
 
+		if (signal_pending(current)) {
+			spin_unlock(&c->erase_completion_lock);
+			mutex_unlock(&c->erase_free_sem);
+			goto done;
+		}
 		if (!list_empty(&c->erase_complete_list)) {
 			jeb = list_entry(c->erase_complete_list.next, struct jffs2_eraseblock, list);
 			list_move(&jeb->list, &c->erase_checking_list);
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
diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 9a80e8e..5162329 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -64,7 +64,6 @@ static void jffs2_write_super(struct super_block *sb)
 	if (!(sb->s_flags & MS_RDONLY)) {
 		D1(printk(KERN_DEBUG "jffs2_write_super()\n"));
 		jffs2_garbage_collect_trigger(c);
-		jffs2_erase_pending_blocks(c, 0);
 		jffs2_flush_wbuf_gc(c, 0);
 	}
 
-- 
1.6.4.4
