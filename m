Received: from www.altera.com ([66.35.227.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16WFDM-0005Lw-00
	for <linux-mtd@lists.infradead.org>; Thu, 31 Jan 2002 11:17:12 +0000
Message-Id: <200201311128.g0VBSBh22771@uk-proclin7.altera.com>
Content-Type: text/plain;
  charset="iso-8859-15"
From: Clive Davies <cdavies@altera.com>
To: gleixner@autronix.de, linux-mtd@lists.infradead.org
Subject: Re: compile errors on fs/jffs/inode-v23.c
Date: Thu, 31 Jan 2002 11:28:10 +0000
References: <02013111130007.00763@thomas>
In-Reply-To: <02013111130007.00763@thomas>
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

> 	inode->i_rdev.value = 0;
>
 I think this is my fault. Try this patch...

--- mtd_orig/fs/jffs/inode-v23        Thu Jan 31 11:24:54 2002
+++ mtd/fs/jffs/inode-v23.c     Thu Jan 31 11:22:19 2002
@@ -364,7 +364,7 @@ jffs_new_inode(const struct inode * dir,
        inode->i_nlink = raw_inode->nlink;
        inode->i_uid = raw_inode->uid;
        inode->i_gid = raw_inode->gid;
-       inode->i_rdev.value = 0;
+       inode->i_rdev = NODEV;
        inode->i_size = raw_inode->dsize;
        inode->i_atime = raw_inode->atime;
        inode->i_mtime = raw_inode->mtime;
