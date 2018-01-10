Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eZDGh-00083A-3O
 for linux-mtd@lists.infradead.org; Wed, 10 Jan 2018 10:06:03 +0000
Received: by mail-pl0-x241.google.com with SMTP id b12so6993534plm.3
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jan 2018 02:05:48 -0800 (PST)
From: rockdotlee@gmail.com
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 Rock Lee <rockdotlee@gmail.com>
Subject: [PATCH] ubifs: Change log level in ubifs_xattr_get
Date: Wed, 10 Jan 2018 05:05:41 -0500
Message-Id: <1515578741-6612-1-git-send-email-rockdotlee@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Rock Lee <rockdotlee@gmail.com>

Just print warning message when xattr value size is bigger than the
buffer size. There is a situation that other modules, like overlayfs,
try to get xattr value with a small buffer, if they get -ERANGE, they
will try again with the proper buffer size. No need to report a error
message, warning message is enough.

Signed-off-by: Rock Lee <rockdotlee@gmail.com>
---
 fs/ubifs/xattr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 5ddc89d..bc20530 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -381,7 +381,7 @@ ssize_t ubifs_xattr_get(struct inode *host, const char *name, void *buf,
 	if (buf) {
 		/* If @buf is %NULL we are supposed to return the length */
 		if (ui->data_len > size) {
-			ubifs_err(c, "buffer size %zd, xattr len %d",
+			ubifs_warn(c, "buffer size %zd, xattr len %d",
 				  size, ui->data_len);
 			err = -ERANGE;
 			goto out_iput;
-- 
1.9.1
