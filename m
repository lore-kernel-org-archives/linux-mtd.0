Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKgnm-0006If-8x
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 05:54:47 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 25/35] ubifs: record quota information about inode in
 ubifs_new_inode
Date: Thu, 30 Jul 2015 13:48:21 +0800
Message-ID: <1438235311-23788-26-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Initialize quota and alloc a inode quota information in
ubifs_new_inode(). Then quota would be aware of a new
inode is allocated.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/dir.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 8d93427..5bfce44 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -41,6 +41,7 @@
  */
 
 #include "ubifs.h"
+#include <linux/quotaops.h>
 
 /**
  * inherit_flags - inherit flags of the parent inode.
@@ -90,12 +91,13 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, const struct inode *dir,
 {
 	struct inode *inode;
 	struct ubifs_inode *ui;
+	int err = 0;
 
 	inode = new_inode(c->vfs_sb);
-	ui = ubifs_inode(inode);
 	if (!inode)
 		return ERR_PTR(-ENOMEM);
 
+	ui = ubifs_inode(inode);
 	/*
 	 * Set 'S_NOCMTIME' to prevent VFS form updating [mc]time of inodes and
 	 * marking them dirty in file write path (see 'file_update_time()').
@@ -109,6 +111,11 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, const struct inode *dir,
 			 ubifs_current_time(inode);
 	inode->i_mapping->nrpages = 0;
 
+	dquot_initialize(inode);
+        err = dquot_alloc_inode(inode);
+        if (err)
+                goto fail_drop;
+
 	switch (mode & S_IFMT) {
 	case S_IFREG:
 		inode->i_mapping->a_ops = &ubifs_file_address_operations;
@@ -148,8 +155,8 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, const struct inode *dir,
 			spin_unlock(&c->cnt_lock);
 			ubifs_err(c, "out of inode numbers");
 			make_bad_inode(inode);
-			iput(inode);
-			return ERR_PTR(-EINVAL);
+			err = -EINVAL;
+			goto fail_free;
 		}
 		ubifs_warn(c, "running out of inode numbers (current %lu, max %u)",
 			   (unsigned long)c->highest_inum, INUM_WATERMARK);
@@ -166,6 +173,13 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, const struct inode *dir,
 	ui->creat_sqnum = ++c->max_sqnum;
 	spin_unlock(&c->cnt_lock);
 	return inode;
+
+fail_free:
+	dquot_free_inode(inode);
+fail_drop:
+	dquot_drop(inode);
+	iput(inode);
+	return ERR_PTR(err);
 }
 
 static int dbg_check_name(const struct ubifs_info *c,
-- 
1.8.4.2
