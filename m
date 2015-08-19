Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRypw-0005T7-It
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 08:35:09 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <richard@nod.at>, <dedekind1@gmail.com>, <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH] ubifs: correct the size of nnode in memset
Date: Wed, 19 Aug 2015 16:28:52 +0800
Message-ID: <1439972932-12116-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is a typo in lpt to memset nnode by the
size in sizeof(stuct ubifs_pnode).

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 mkfs.ubifs/lpt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mkfs.ubifs/lpt.c b/mkfs.ubifs/lpt.c
index f6d4352..6aa0b88 100644
--- a/mkfs.ubifs/lpt.c
+++ b/mkfs.ubifs/lpt.c
@@ -384,7 +384,7 @@ int create_lpt(struct ubifs_info *c)
 		goto out;
 	}
 	memset(pnode, 0 , sizeof(struct ubifs_pnode));
-	memset(nnode, 0 , sizeof(struct ubifs_pnode));
+	memset(nnode, 0 , sizeof(struct ubifs_nnode));
 
 	c->lscan_lnum = c->main_first;
 
-- 
1.8.4.2
