Received: from www.altera.com ([66.35.227.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Sgs2-00065o-00
	for <linux-mtd@lists.infradead.org>; Mon, 21 Jan 2002 16:00:30 +0000
Received: from Altera.COM (sunrise.altera.com [137.57.1.1])
	by www.altera.com (8.9.3+Sun/8.9.3) with ESMTP id IAA22417
	for <linux-mtd@lists.infradead.org>; Mon, 21 Jan 2002 08:07:20 -0800 (PST)
Received: from localhost (localhost [[UNIX: localhost]])
	by uk-proclin7.altera.com (8.11.6/8.11.6) id g0LGBPv22298
	for linux-mtd@lists.infradead.org; Mon, 21 Jan 2002 16:11:25 GMT
Message-Id: <200201211611.g0LGBPv22298@uk-proclin7.altera.com>
Content-Type: text/plain;
  charset="iso-8859-15"
From: Clive Davies <cdavies@altera.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] kdev_t updates
Date: Mon, 21 Jan 2002 16:11:25 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

The type definition of kdev_t has changed in 2.5.2. This patch updates 
a couple of files to reflect this. If its Ok, then I'll check it in.

diff -purN linux_2.5.2-rmk1/fs/jffs/inode-v23.c linux/fs/jffs/inode-v23.c
--- linux_2.5.2-rmk1/fs/jffs/inode-v23.c	Fri Jan  4 17:42:12 2002
+++ linux/fs/jffs/inode-v23.c	Wed Jan 16 10:42:18 2002
@@ -357,7 +357,7 @@ jffs_new_inode(const struct inode * dir,
 	inode->i_nlink = raw_inode->nlink;
 	inode->i_uid = raw_inode->uid;
 	inode->i_gid = raw_inode->gid;
-	inode->i_rdev = 0;
+	inode->i_rdev = NODEV;
 	inode->i_size = raw_inode->dsize;
 	inode->i_atime = raw_inode->atime;
 	inode->i_mtime = raw_inode->mtime;
diff -purN linux_2.5.2-rmk1/fs/jffs/jffs_fm.c linux/fs/jffs/jffs_fm.c
--- linux_2.5.2-rmk1/fs/jffs/jffs_fm.c	Wed Jan 16 09:06:59 2002
+++ linux/fs/jffs/jffs_fm.c	Wed Jan 16 10:41:21 2002
@@ -46,7 +46,7 @@ jffs_build_begin(struct jffs_control *c,
 	}
 	DJM(no_jffs_fmcontrol++);
 
-	mtd = get_mtd_device(NULL, MINOR(dev));
+	mtd = get_mtd_device(NULL, minor(dev));
 
 	if (!mtd) {
 		kfree(fmc);
