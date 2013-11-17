Received: from mail-yh0-x232.google.com ([2607:f8b0:4002:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vi8rJ-0005j9-JJ
 for linux-mtd@lists.infradead.org; Sun, 17 Nov 2013 20:22:19 +0000
Received: by mail-yh0-f50.google.com with SMTP id b6so221941yha.23
 for <linux-mtd@lists.infradead.org>; Sun, 17 Nov 2013 12:21:53 -0800 (PST)
From: Erico Nunes <nunes.erico@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH] jffs2: fix sparse errors: directive in argument list
Date: Sun, 17 Nov 2013 18:18:33 -0200
Message-Id: <1384719513-27386-1-git-send-email-nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Erico Nunes <nunes.erico@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch fixes the following errors reported when running sparse:
fs/jffs2/super.c:378:1: error: directive in argument list
fs/jffs2/super.c:380:1: error: directive in argument list
fs/jffs2/super.c:381:1: error: directive in argument list
fs/jffs2/super.c:383:1: error: directive in argument list
---
 fs/jffs2/super.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 0defb1c..ec9e16f 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -361,6 +361,14 @@ MODULE_ALIAS_FS("jffs2");
 static int __init init_jffs2_fs(void)
 {
 	int ret;
+	const char desc[] = "version 2.2."
+#ifdef CONFIG_JFFS2_FS_WRITEBUFFER
+		" (NAND)"
+#endif
+#ifdef CONFIG_JFFS2_SUMMARY
+		" (SUMMARY) "
+#endif
+		" © 2001-2006 Red Hat, Inc.";
 
 	/* Paranoia checks for on-medium structures. If we ask GCC
 	   to pack them with __attribute__((packed)) then it _also_
@@ -374,14 +382,7 @@ static int __init init_jffs2_fs(void)
 	BUILD_BUG_ON(sizeof(struct jffs2_raw_inode) != 68);
 	BUILD_BUG_ON(sizeof(struct jffs2_raw_summary) != 32);
 
-	pr_info("version 2.2."
-#ifdef CONFIG_JFFS2_FS_WRITEBUFFER
-	       " (NAND)"
-#endif
-#ifdef CONFIG_JFFS2_SUMMARY
-	       " (SUMMARY) "
-#endif
-	       " © 2001-2006 Red Hat, Inc.\n");
+	pr_info("%s\n", desc);
 
 	jffs2_inode_cachep = kmem_cache_create("jffs2_i",
 					     sizeof(struct jffs2_inode_info),
-- 
1.8.4.2
