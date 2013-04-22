Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUODy-0002Mb-Am
 for linux-mtd@lists.infradead.org; Mon, 22 Apr 2013 21:24:34 +0000
From: Marek Vasut <marex@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 17/18] fs: Fix copyright symbol in printk()
Date: Mon, 22 Apr 2013 23:24:30 +0200
Message-Id: <1366665870-8998-1-git-send-email-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Marek Vasut <marex@denx.de>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use regular ASCII "(C)" string instead of UTF8 "©" string in
printk() as the later produces the following output on dmesg
instead of the expected one:

  jffs2: version 2.2. (NAND) \xffffffc2\xffffffa9 2001-2006 Red Hat, Inc.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: David Woodhouse <dwmw2@infradead.org>
---
 fs/jffs2/super.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 0defb1c..8916eb8 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -381,7 +381,7 @@ static int __init init_jffs2_fs(void)
 #ifdef CONFIG_JFFS2_SUMMARY
 	       " (SUMMARY) "
 #endif
-	       " © 2001-2006 Red Hat, Inc.\n");
+	       " (C) 2001-2006 Red Hat, Inc.\n");
 
 	jffs2_inode_cachep = kmem_cache_create("jffs2_i",
 					     sizeof(struct jffs2_inode_info),
-- 
1.7.10.4
