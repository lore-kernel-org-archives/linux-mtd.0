Received: from mail-lb0-x22b.google.com ([2a00:1450:4010:c04::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YnCWj-0006p9-D9
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2015 20:54:46 +0000
Received: by lbbzk7 with SMTP id zk7so5733944lbb.0
 for <linux-mtd@lists.infradead.org>; Tue, 28 Apr 2015 13:54:21 -0700 (PDT)
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] jffs2: fix UTF-8 character in pr_info
Date: Tue, 28 Apr 2015 23:54:05 +0300
Message-Id: <1430254445-32676-1-git-send-email-andrej.skvortzov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Andrey Skvortsov <andrej.skvortzov@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boot log contained string:
jffs2: version 2.2. \xffffffc2\xffffffa9 2001-2006 Red Hat, Inc.

non-ASCII characters are printed in HEX. 0xC2A9 is copyright sign in UTF-8.
This patch replace it with '(c)' to make boot log readable.

Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
---
 fs/jffs2/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 3d76f28..763a3dc 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -382,7 +382,7 @@ static int __init init_jffs2_fs(void)
 #ifdef CONFIG_JFFS2_SUMMARY
 	       " (SUMMARY) "
 #endif
-	       " © 2001-2006 Red Hat, Inc.\n");
+	       " (c) 2001-2006 Red Hat, Inc.\n");
 
 	jffs2_inode_cachep = kmem_cache_create("jffs2_i",
 					     sizeof(struct jffs2_inode_info),
-- 
2.1.4
