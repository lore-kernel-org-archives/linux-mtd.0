Received: from [210.94.41.89] (helo=party)
	by pentafluge.infradead.org with esmtpsa (Exim 4.63 #1 (Red Hat Linux))
	id 1IpJk2-00009a-2d
	for linux-mtd@lists.infradead.org; Tue, 06 Nov 2007 08:24:59 +0000
Date: Tue, 6 Nov 2007 17:21:33 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [JFFS2] JFFS2 works again
Message-ID: <20071106082133.GA10613@party>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[JFFS2] JFFS2 works again

Fix undefined varialbe after the recent commit

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
diff --git a/arch/arm/mach-omap2/board-apollon.c b/arch/arm/mach-omap2/board-apollon.c
diff --git a/fs/jffs2/write.c b/fs/jffs2/write.c
index 611012f..ecdf18d 100644
--- a/fs/jffs2/write.c
+++ b/fs/jffs2/write.c
@@ -606,7 +606,6 @@ int jffs2_do_unlink(struct jffs2_sb_info *c, struct jffs2_inode_info *dir_f,
 				fd->ino = 0;
 				break;
 			}
-			prev = &((*prev)->next);
 		}
 		up(&dir_f->sem);
 	}
