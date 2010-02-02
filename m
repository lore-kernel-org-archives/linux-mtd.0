Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NcFFe-0001rK-7J
	for linux-mtd@lists.infradead.org; Tue, 02 Feb 2010 09:40:59 +0000
Received: from sesr04.transmode.se (sesr04.transmode.se [192.168.201.15])
	by gw1.transmode.se (Postfix) with ESMTP id A9F33650002
	for <linux-mtd@lists.infradead.org>;
	Tue,  2 Feb 2010 10:40:02 +0100 (CET)
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] JFFS2: Erase max 3 EB's in jffs2_write_super()
Date: Tue, 2 Feb 2010 10:40:00 +0100
Message-Id: <1265103600-32522-1-git-send-email-Joakim.Tjernlund@transmode.se>
Cc: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Deleting big files in a JFFS2 root FS and the rebooting makes
the system hang until all freed EB's has been erased which
can take several minutes.
Fix the hanging by making jffs2_write_super() erase max 3 EB's
at a time. If there are more EB's to erase afterwards, reset the
s_dirty flag.

Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
---

 I hope the list_empty calls doesn't need locking. If
 so, it can easily be added.

 fs/jffs2/super.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 9a80e8e..10393e0 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -64,7 +64,10 @@ static void jffs2_write_super(struct super_block *sb)
 	if (!(sb->s_flags & MS_RDONLY)) {
 		D1(printk(KERN_DEBUG "jffs2_write_super()\n"));
 		jffs2_garbage_collect_trigger(c);
-		jffs2_erase_pending_blocks(c, 0);
+		jffs2_erase_pending_blocks(c, 3);
+		if (!list_empty(&c->erase_complete_list) ||
+		    !list_empty(&c->erase_pending_list))
+			sb->s_dirt = 1;
 		jffs2_flush_wbuf_gc(c, 0);
 	}
 
-- 
1.6.4.4
