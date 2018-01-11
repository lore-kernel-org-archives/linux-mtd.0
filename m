Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eZSIM-00029j-Av
 for linux-mtd@lists.infradead.org; Thu, 11 Jan 2018 02:08:44 +0000
Received: by mail-pg0-x241.google.com with SMTP id f14so1603836pga.10
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jan 2018 18:08:31 -0800 (PST)
From: rockdotlee@gmail.com
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 Rock Lee <rli@sierrawireless.com>
Subject: [PATCH] ubifs: remove error message in ubifs_xattr_get
Date: Wed, 10 Jan 2018 21:08:24 -0500
Message-Id: <1515636504-7660-1-git-send-email-rockdotlee@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Rock Lee <rli@sierrawireless.com>

There is a situation that other modules, like overlayfs, try to get
xattr value with a small buffer, if they get -ERANGE, they will try
again with the proper buffer size. No need to report an error.

Signed-off-by: Rock Lee <rli@sierrawireless.com>
---
 fs/ubifs/xattr.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index c13eae8..1615270 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -380,8 +380,6 @@ ssize_t ubifs_xattr_get(struct inode *host, const char *name, void *buf,
 	if (buf) {
 		/* If @buf is %NULL we are supposed to return the length */
 		if (ui->data_len > size) {
-			ubifs_err(c, "buffer size %zd, xattr len %d",
-				  size, ui->data_len);
 			err = -ERANGE;
 			goto out_iput;
 		}
-- 
1.9.1
