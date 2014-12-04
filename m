Received: from mx5.zte.com.cn ([63.217.80.70])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XwSSV-00043x-66
 for linux-mtd@lists.infradead.org; Thu, 04 Dec 2014 09:12:24 +0000
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
 by Websense Email Security Gateway with ESMTPS id 7E0F6124CAF1
 for <linux-mtd@lists.infradead.org>; Thu,  4 Dec 2014 17:11:40 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
 by mse01.zte.com.cn with ESMTP id sB49BYxo088931
 for <linux-mtd@lists.infradead.org>; Thu, 4 Dec 2014 17:11:34 +0800 (GMT-8)
 (envelope-from liu.song11@zte.com.cn)
Subject: [PATCH] UBIFS:adjust the procedure in ubifs_new_inode when there is
 oom occured
To: linux-mtd@lists.infradead.org
Message-ID: <OFD2C891FD.BC4CAFE0-ON48257DA4.002ECC4A-48257DA4.00326450@zte.com.cn>
From: liu.song11@zte.com.cn
Date: Thu, 4 Dec 2014 17:11:28 +0800
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: wang.bo116@zte.com.cn, jiang.xuexin@zte.com.cn
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


hi,
In ubifs_new_inode, if failed to get a new inode then will return ERR_PTR.
Maybe adjust the code sequence would make sense.

Signed-off-by: Liu Song <liu.song11@zte.com.cn>
--------------------------------------------------------------
diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index de8fc9b..6dafe23 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -92,10 +92,9 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, const struct inode *dir,
 	struct ubifs_inode *ui;

 	inode = new_inode(c->vfs_sb);
-	ui = ubifs_inode(inode);
 	if (!inode)
 		return ERR_PTR(-ENOMEM);
-
+	ui = ubifs_inode(inode);
 	/*
 	 * Set 'S_NOCMTIME' to prevent VFS form updating [mc]time of inodes and
 	 * marking them dirty in file write path (see 'file_update_time()').

--------------------------------------------------------
ZTE Information Security Notice: The information contained in this mail (and any attachment transmitted herewith) is privileged and confidential and is intended for the exclusive use of the addressee(s).  If you are not an intended recipient, any disclosure, reproduction, distribution or other dissemination or use of the information contained is strictly prohibited.  If you have received this mail in error, please delete it and notify us immediately.
