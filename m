Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HyRIB-0004MB-Vh
	for linux-mtd@lists.infradead.org; Wed, 13 Jun 2007 07:45:41 -0400
Subject: [PATCH] mtdchar, only call sync if opened RW.
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Wed, 13 Jun 2007 13:45:33 +0200
Message-Id: <1181735133.30670.274.camel@gentoo-jocke.transmode.se>
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

Syncing can take alot of time so
don't do it needlessly.

>From 0dc6ed79711bbb839377b0033ca94a3718760620 Mon Sep 17 00:00:00 2001
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
Date: Wed, 13 Jun 2007 13:37:14 +0200
Subject: [PATCH] mtdchar, only call sync if opened RW.


Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
---
 drivers/mtd/mtdchar.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 3013d08..f4ca980 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -135,7 +135,8 @@ static int mtd_close(struct inode *inode, struct file *file)
 
 	DEBUG(MTD_DEBUG_LEVEL0, "MTD_close\n");
 
-	if (mtd->sync)
+	/* Only sync if opened RW */
+	if ((file->f_mode & 2) && mtd->sync)
 		mtd->sync(mtd);
 
 	put_mtd_device(mtd);
-- 
1.5.2.1
