Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bTwdi-0000lm-Op
 for linux-mtd@lists.infradead.org; Sun, 31 Jul 2016 19:43:11 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, adrian.hunter@intel.com, dedekind1@gmail.com,
 richard@nod.at, stable@vger.kernel.org,
 Andreas Gruenbacher <agruenba@redhat.com>
Subject: [PATCH] ubifs: Fix xattr generic handler usage
Date: Sun, 31 Jul 2016 21:42:23 +0200
Message-Id: <1469994143-13977-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

UBIFS uses full names to work with xattrs, therefore we have to use
xattr_full_name() to obtain the xattr prefix as string.

Cc: <stable@vger.kernel.org>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Fixes: 2b88fc21ca ("ubifs: Switch to generic xattr handlers")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/xattr.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index b5fc279..c63710f 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -575,7 +575,8 @@ static int ubifs_xattr_get(const struct xattr_handler *handler,
 	dbg_gen("xattr '%s', ino %lu ('%pd'), buf size %zd", name,
 		inode->i_ino, dentry, size);
 
-	return  __ubifs_getxattr(inode, name, buffer, size);
+	name = xattr_full_name(handler, name);
+	return __ubifs_getxattr(inode, name, buffer, size);
 }
 
 static int ubifs_xattr_set(const struct xattr_handler *handler,
@@ -586,6 +587,8 @@ static int ubifs_xattr_set(const struct xattr_handler *handler,
 	dbg_gen("xattr '%s', host ino %lu ('%pd'), size %zd",
 		name, inode->i_ino, dentry, size);
 
+	name = xattr_full_name(handler, name);
+
 	if (value)
 		return __ubifs_setxattr(inode, name, value, size, flags);
 	else
-- 
2.7.3
