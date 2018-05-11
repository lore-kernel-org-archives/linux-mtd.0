Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGxlG-0000tQ-Ci
 for linux-mtd@lists.infradead.org; Fri, 11 May 2018 02:26:23 +0000
Received: by mail-pg0-x242.google.com with SMTP id i194-v6so1779097pgd.0
 for <linux-mtd@lists.infradead.org>; Thu, 10 May 2018 19:26:11 -0700 (PDT)
From: Wang Shilong <wangshilong1991@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: jack@suse.cz,
	rockdotlee@gmail.com,
	Wang Shilong <wshilong@ddn.com>
Subject: [PATCH] ubifs, xattr: remove misguided quota flags
Date: Fri, 11 May 2018 11:26:03 +0900
Message-Id: <1526005563-25667-1-git-send-email-wshilong1991@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Wang Shilong <wshilong@ddn.com>

Originally, Yang Dongsheng added quota support
for ubifs, but it turned out upstream won't accept it.

Since ubifs don't touch any quota code, S_NOQUOTA flag
is misguided here, and currently it is mainly used to
avoid recursion for system quota files.

Let's make things clearly and remove unnecessary and
misguied quota flags here.

Reported-by: Rock Lee <rockdotlee@gmail.com>
Signed-off-by: Wang Shilong <wshilong@ddn.com>
---
 fs/ubifs/xattr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 759f1a2..6f720fd 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -139,7 +139,7 @@ static int create_xattr(struct ubifs_info *c, struct inode *host,
 	inode->i_op = &empty_iops;
 	inode->i_fop = &empty_fops;
 
-	inode->i_flags |= S_SYNC | S_NOATIME | S_NOCMTIME | S_NOQUOTA;
+	inode->i_flags |= S_SYNC | S_NOATIME | S_NOCMTIME;
 	ui = ubifs_inode(inode);
 	ui->xattr = 1;
 	ui->flags |= UBIFS_XATTR_FL;
-- 
1.8.3.1
