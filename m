Received: from mail-gw1-out.broadcom.com ([216.31.210.62])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WM4rn-00025P-Pb
 for linux-mtd@lists.infradead.org; Sat, 08 Mar 2014 00:11:52 +0000
From: Florian Fainelli <f.fainelli@gmail.com>
To: <dedekind1@gmail.com>
Subject: [PATCH] UBIFS: add missing znode freeing in tcn_insert()
Date: Fri, 7 Mar 2014 16:11:27 -0800
Message-ID: <1394237487-2728-1-git-send-email-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Florian Fainelli <f.fainelli@gmail.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In case the zi allocation fails in the do_split label, we will fail
freeing zn that we allocated before, add a missing kfree.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 fs/ubifs/tnc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 9083bc7ed4ae..9b84d91ea530 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -2105,8 +2105,10 @@ do_split:
 	dbg_tnc("creating new zroot at level %d", znode->level + 1);
 
 	zi = kzalloc(c->max_znode_sz, GFP_NOFS);
-	if (!zi)
+	if (!zi) {
+		kfree(zn);
 		return -ENOMEM;
+	}
 
 	zi->child_cnt = 2;
 	zi->level = znode->level + 1;
-- 
1.8.3.2
