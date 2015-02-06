Received: from mail-lb0-x232.google.com ([2a00:1450:4010:c04::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJjkw-0005dI-UV
 for linux-mtd@lists.infradead.org; Fri, 06 Feb 2015 14:19:39 +0000
Received: by mail-lb0-f178.google.com with SMTP id b6so11730340lbj.9
 for <linux-mtd@lists.infradead.org>; Fri, 06 Feb 2015 06:19:15 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] fs: jffs2: Remove utf8 from printk string
Date: Fri,  6 Feb 2015 15:19:03 +0100
Message-Id: <1423232343-26438-1-git-send-email-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Any non-ascii characters are escaped before being show to user-space,
so this shows up as

jffs2: version 2.2. (NAND) \xffffffc2\xffffffa9\xffffffa9 2001-2006 Red Hat, Inc.

(I have no idea why the second byte is repeated.) Replace with a
widely used ascii replacement.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
Actually, I don't see the value in printing a copyright notice to the
kernel log, especially since it's out-of-sync with the one at the top
of the file.

 fs/jffs2/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 0918f0e2e266..471b674b6f8a 100644
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
2.1.3
