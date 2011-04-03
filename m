Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6X9A-000725-5s
	for linux-mtd@lists.infradead.org; Sun, 03 Apr 2011 23:55:58 +0000
Received: by fxm14 with SMTP id 14so4534040fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 03 Apr 2011 16:55:52 -0700 (PDT)
From: Sedat Dilek <sedat.dilek@googlemail.com>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ubifs: Use empty_iops and empty_fops consistently
Date: Mon,  4 Apr 2011 01:55:39 +0200
Message-Id: <1301874939-2630-1-git-send-email-sedat.dilek@gmail.com>
Cc: Sedat Dilek <sedat.dilek@gmail.com>, Jens Axboe <jaxboe@fusionio.com>,
	Adrian Hunter <adrian.hunter@nokia.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Follow the nomenclature as we did for empty_aops and rename
to empty_iops and empty_fops.

This patch is on top of linux-2.6-block.git#for-linus.

Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
CC: Artem Bityutskiy <dedekind1@gmail.com>
CC: Adrian Hunter <adrian.hunter@nokia.com>
CC: Jens Axboe <jaxboe@fusionio.com>
---
 fs/ubifs/xattr.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 3299f46..16f19f5 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -80,8 +80,8 @@ enum {
 	SECURITY_XATTR,
 };
 
-static const struct inode_operations none_inode_operations;
-static const struct file_operations none_file_operations;
+static const struct inode_operations empty_iops;
+static const struct file_operations empty_fops;
 
 /**
  * create_xattr - create an extended attribute.
@@ -131,8 +131,8 @@ static int create_xattr(struct ubifs_info *c, struct inode *host,
 
 	/* Re-define all operations to be "nothing" */
 	inode->i_mapping->a_ops = &empty_aops;
-	inode->i_op = &none_inode_operations;
-	inode->i_fop = &none_file_operations;
+	inode->i_op = &empty_iops;
+	inode->i_fop = &empty_fops;
 
 	inode->i_flags |= S_SYNC | S_NOATIME | S_NOCMTIME | S_NOQUOTA;
 	ui = ubifs_inode(inode);
-- 
1.7.4.3
