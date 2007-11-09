Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IqTJa-0003tM-Md
	for linux-mtd@lists.infradead.org; Fri, 09 Nov 2007 07:50:32 -0500
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [JFFS2] Stop erasing blocks when rebooting.
Date: Fri,  9 Nov 2007 13:50:25 +0100
Message-Id: <1194612625-28206-1-git-send-email-Joakim.Tjernlund@transmode.se>
Cc: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rebooting shortly after deleting lots of big files
makes the reboot hang until all blocks has been erased,
which can take minutes if there are lots of blocks to erase.
This addresses the issue by moving the erasing to
pdflush_operation context and testing for the superblock
flags MS_RDONLY and MS_ACTIVE while erasing.

Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
---
Not sure if this the correct way to do this, hints welcome.
 fs/jffs2/erase.c |    7 +++++++
 fs/jffs2/fs.c    |   11 ++++++++++-
 2 files changed, 17 insertions(+), 1 deletions(-)

diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index a1db918..ad9dec5 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -106,6 +106,7 @@ static void jffs2_erase_block(struct jffs2_sb_info *c,
 void jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count)
 {
 	struct jffs2_eraseblock *jeb;
+	struct super_block *sb = OFNI_BS_2SFFJ(c);
 
 	down(&c->erase_free_sem);
 
@@ -114,6 +115,12 @@ void jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count)
 	while (!list_empty(&c->erase_complete_list) ||
 	       !list_empty(&c->erase_pending_list)) {
 
+		if ((sb->s_flags & MS_RDONLY) || !(sb->s_flags & MS_ACTIVE)) {
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
1.5.3.4
