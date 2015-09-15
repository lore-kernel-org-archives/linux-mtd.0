Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbmF6-0002kO-Qn
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2015 09:09:39 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v3 27/39] ubifs: check inode with NULL before using it
Date: Tue, 15 Sep 2015 17:02:22 +0800
Message-ID: <1442307754-13233-28-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

There is a checking of inode with NULL after ubifs_inode(inode),
that's not readable, why we need to check a pointer with NULL
after we having used it?

Although inode=NULL will not hurt ubifs_inode(), checking inode
following new_inode() directly before using it seems more reasonable.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index a822148..4db0ceb 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -92,10 +92,10 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, const struct inode *dir,
 	struct ubifs_inode *ui;
 
 	inode = new_inode(c->vfs_sb);
-	ui = ubifs_inode(inode);
 	if (!inode)
 		return ERR_PTR(-ENOMEM);
 
+	ui = ubifs_inode(inode);
 	/*
 	 * Set 'S_NOCMTIME' to prevent VFS form updating [mc]time of inodes and
 	 * marking them dirty in file write path (see 'file_update_time()').
-- 
1.8.4.2
