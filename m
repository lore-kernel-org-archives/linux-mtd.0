Received: from mail132.messagelabs.com ([216.82.242.115])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R7Efg-0001tB-MM
	for linux-mtd@lists.infradead.org; Fri, 23 Sep 2011 22:56:41 +0000
From: H Hartley Sweeten <hartleys@visionengravers.com>
To: Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH] jffs2/security.c: local functions should be static
Date: Fri, 23 Sep 2011 15:56:15 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-ID: <201109231556.15973.hartleys@visionengravers.com>
Cc: dwmw2@infradead.org, linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Quiets the sparse noise:

warning: symbol 'jffs2_initxattrs' was not declared. Should it be static?

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: David Woodhouse <dwmw2@infradead.org>

---

diff --git a/fs/jffs2/security.c b/fs/jffs2/security.c
index 0f20208..aca97f3 100644
--- a/fs/jffs2/security.c
+++ b/fs/jffs2/security.c
@@ -23,8 +23,8 @@
 #include "nodelist.h"
 
 /* ---- Initial Security Label(s) Attachment callback --- */
-int jffs2_initxattrs(struct inode *inode, const struct xattr *xattr_array,
-		     void *fs_info)
+static int jffs2_initxattrs(struct inode *inode,
+			    const struct xattr *xattr_array, void *fs_info)
 {
 	const struct xattr *xattr;
 	int err = 0;
