Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Im7M9-0006Vb-Cx
	for linux-mtd@lists.infradead.org; Sun, 28 Oct 2007 12:35:08 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [JFFS2] Fix getdents problem on large directories.
Date: Sun, 28 Oct 2007 13:34:38 +0100
Message-Id: <1193574878-9652-1-git-send-email-Joakim.Tjernlund@transmode.se>
Cc: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Another fallout from commit a491486a2087ac3dfc00efb4f838c8d684afaf54
rm -rf on a large directory needs to call getdents several times.
The second call would usally return empty, telling the user that
there are no more files to unlink, rmdir then fails since the
directory isn't empty.
---
 fs/jffs2/write.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/fs/jffs2/write.c b/fs/jffs2/write.c
index 2f56954..358f197 100644
--- a/fs/jffs2/write.c
+++ b/fs/jffs2/write.c
@@ -591,9 +591,7 @@ int jffs2_do_unlink(struct jffs2_sb_info *c, struct jffs2_inode_info *dir_f,
 				D1(printk(KERN_DEBUG "Marking old dirent node (ino #%u) @%08x obsolete\n",
 					  this->ino, ref_offset(this->raw)));
 
-				*prev = this->next;
-				jffs2_mark_node_obsolete(c, (this->raw));
-				jffs2_free_full_dirent(this);
+				this->ino = 0;
 				break;
 			}
 			prev = &((*prev)->next);
-- 
1.5.3.4
