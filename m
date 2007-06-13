Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HyPXh-0003OH-Qe
	for linux-mtd@lists.infradead.org; Wed, 13 Jun 2007 05:53:37 -0400
Subject: [PATCH] Fix hanging close for /dev/mtd
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Wed, 13 Jun 2007 11:53:31 +0200
Message-Id: <1181728411.30670.270.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Figured I should send this on its own.

Stracing a process using /dev/mtd shows that
it sometimes hangs for a long time when pdflush is erasing
sectors. /dev/mtd* close method calls the mtd->sync method
which can hang for a long time(minutes).

Futher, the sync method "syncs" all flash chips. It should
only sync the chips that a /dev/mtd* spans.
Also, the mtdchar/mtdblock drivers does not need to
call sync for readonly mappings.

>From c39777d86aa1bef8e053c3f78a5df0981e3a45a9 Mon Sep 17 00:00:00 2001
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
Date: Tue, 12 Jun 2007 19:25:56 +0200
Subject: [PATCH] Fix hanging close for /dev/mtd
When pdflush is erasing lots of sectors, drivers calling
mtd->sync will hang until all blocks are erased.

Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
---
 fs/jffs2/erase.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index 24a48e9..33e5f13 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -150,7 +150,7 @@ void jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count)
 		}
 
 		/* Be nice */
-		cond_resched();
+		yield();
 		down(&c->erase_free_sem);
 		spin_lock(&c->erase_completion_lock);
 	}
-- 
1.5.2.1
