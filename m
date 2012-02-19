Received: from mail-ey0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RzBqe-0000Si-Dy
 for linux-mtd@lists.infradead.org; Sun, 19 Feb 2012 18:51:01 +0000
Received: by eaai1 with SMTP id i1so2006366eaa.36
 for <linux-mtd@lists.infradead.org>; Sun, 19 Feb 2012 10:50:58 -0800 (PST)
From: Nikola Pajkovsky <n.pajkovsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] jffs2: make jffs2_initxattrs() static
Date: Sun, 19 Feb 2012 19:51:42 +0100
Message-Id: <f9b5e6546e83e808193657a574801ba60471cc9d.1329677282.git.n.pajkovsky@gmail.com>
Cc: Nikola Pajkovsky <n.pajkovsky@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Nikola Pajkovsky <n.pajkovsky@gmail.com>
---
 fs/jffs2/security.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/security.c b/fs/jffs2/security.c
index 0f20208..304710c 100644
--- a/fs/jffs2/security.c
+++ b/fs/jffs2/security.c
@@ -23,7 +23,7 @@
 #include "nodelist.h"
 
 /* ---- Initial Security Label(s) Attachment callback --- */
-int jffs2_initxattrs(struct inode *inode, const struct xattr *xattr_array,
+static int jffs2_initxattrs(struct inode *inode, const struct xattr *xattr_array,
 		     void *fs_info)
 {
 	const struct xattr *xattr;
-- 
1.7.9.1.244.gb0d66b
