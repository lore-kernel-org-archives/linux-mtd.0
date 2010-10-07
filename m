Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P3tLq-00045P-8T
	for linux-mtd@lists.infradead.org; Thu, 07 Oct 2010 16:29:50 +0000
Received: from sesr04.transmode.se (sesr04.transmode.se [192.168.201.15])
	by gw1.transmode.se (Postfix) with ESMTP id 2A3002597D6
	for <linux-mtd@lists.infradead.org>;
	Thu,  7 Oct 2010 18:29:48 +0200 (CEST)
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] jffs2: Do not assume erase will fail
Date: Thu, 7 Oct 2010 18:29:46 +0200
Message-Id: <1286468986-24627-1-git-send-email-Joakim.Tjernlund@transmode.se>
Cc: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Test if it did and then abort.

Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
---
 fs/jffs2/nodemgmt.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
index 694aa5b..49ee5de 100644
--- a/fs/jffs2/nodemgmt.c
+++ b/fs/jffs2/nodemgmt.c
@@ -260,9 +260,9 @@ static int jffs2_find_nextblock(struct jffs2_sb_info *c)
 		spin_lock(&c->erase_completion_lock);
 
 		/* An erase may have failed, decreasing the
-		   amount of free space available. So we must
-		   restart from the beginning */
-		return -EAGAIN;
+		   amount of free space available. */
+		if (list_empty(&c->free_list))
+			return -EAGAIN; /* restart from the beginning */
 	}
 
 	next = c->free_list.next;
-- 
1.7.2.2
