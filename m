Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1Imv3m-0004jI-Mw
	for linux-mtd@lists.infradead.org; Tue, 30 Oct 2007 13:39:32 -0400
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [JFFS2] Fix getdents problem on large directories.
Date: Tue, 30 Oct 2007 18:39:23 +0100
Message-Id: <1193765964-30069-1-git-send-email-Joakim.Tjernlund@transmode.se>
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

Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
---
 fs/jffs2/write.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/jffs2/write.c b/fs/jffs2/write.c
index 2f56954..6f97dbe 100644
--- a/fs/jffs2/write.c
+++ b/fs/jffs2/write.c
@@ -590,10 +590,9 @@ int jffs2_do_unlink(struct jffs2_sb_info *c, struct jffs2_inode_info *dir_f,
 
 				D1(printk(KERN_DEBUG "Marking old dirent node (ino #%u) @%08x obsolete\n",
 					  this->ino, ref_offset(this->raw)));
-
-				*prev = this->next;
-				jffs2_mark_node_obsolete(c, (this->raw));
-				jffs2_free_full_dirent(this);
+				jffs2_mark_node_obsolete(c, this->raw);
+				this->raw = NULL;
+				this->ino = 0;
 				break;
 			}
 			prev = &((*prev)->next);
@@ -622,7 +621,8 @@ int jffs2_do_unlink(struct jffs2_sb_info *c, struct jffs2_inode_info *dir_f,
 					D1(printk(KERN_DEBUG "Removing deletion dirent for \"%s\" from dir ino #%u\n",
 						fd->name, dead_f->inocache->ino));
 				}
-				jffs2_mark_node_obsolete(c, fd->raw);
+				if (fd->raw)
+					jffs2_mark_node_obsolete(c, fd->raw);
 				jffs2_free_full_dirent(fd);
 			}
 		}
-- 
1.5.3.4
