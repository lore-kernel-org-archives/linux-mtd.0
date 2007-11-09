From: Joakim.Tjernlund@transmode.se (Joakim Tjernlund)
Date: Fri, 9 Nov 2007 13:48:08 +0100
Subject: [PATCH] [JFFS2] Stop erasing blocks when rebooting.
Message-ID: <mailman.28.1258130039.2170.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Rebooting shortly after deleting lots of big files
makes the reboot hang until all blocks has been erased,
which can take minutes if there are lots of blocks to erase.
This addresses the issue by moving the erasing to
pdflush_operation context and testing for the superblock
flags MS_RDONLY and MS_ACTIVE while erasing.
---
 fs/jffs2/erase.c |    8 ++++++++
 fs/jffs2/fs.c    |   11 ++++++++++-
 2 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index a1db918..ec95a28 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -106,6 +106,7 @@ static void jffs2_erase_block(struct jffs2_sb_info *c,
 void jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count)
 {
 	struct jffs2_eraseblock *jeb;
+	struct super_block *sb = OFNI_BS_2SFFJ(c);

 	down(&c->erase_free_sem);

@@ -114,6 +115,13 @@ void jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count)
 	while (!list_empty(&c->erase_complete_list) ||
 	       !list_empty(&c->erase_pending_list)) {

+		if ((sb->s_flags & MS_RDONLY) || !(sb->s_flags & MS_ACTIVE)) {
+			spin_unlock(&c->erase_completion_lock);
+			up(&c->erase_free_sem);
+			D1(printk(KERN_DEBUG "FS readonly/inactive. "
+				  "jffs2_erase_pending_blocks leaving\n"));
+			goto done;
+		}
 		if (!list_empty(&c->erase_complete_list)) {
 			jeb = list_entry(c->erase_complete_list.next, struct jffs2_eraseblock, list);
 			list_del(&jeb->list);
diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index ed85f9a..f102607 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/sched.h>
 #include <linux/fs.h>
+#include <linux/writeback.h>	/* for erasing blocks */
 #include <linux/list.h>
 #include <linux/mtd/mtd.h>
 #include <linux/pagemap.h>
@@ -385,6 +386,14 @@ int jffs2_remount_fs (struct super_block *sb, int *flags, char *data)
 	return 0;
 }

+void do_start_erase(unsigned long sb_arg)
+{
+	struct super_block *sb = (struct super_block *) sb_arg;
+	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
+
+	jffs2_erase_pending_blocks(c, 0);
+}
+
 void jffs2_write_super (struct super_block *sb)
 {
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
@@ -395,7 +404,7 @@ void jffs2_write_super (struct super_block *sb)

 	D1(printk(KERN_DEBUG "jffs2_write_super()\n"));
 	jffs2_garbage_collect_trigger(c);
-	jffs2_erase_pending_blocks(c, 0);
+	pdflush_operation(do_start_erase, (unsigned long)sb);
 	jffs2_flush_wbuf_gc(c, 0);
 }

--
1.6.4.4
