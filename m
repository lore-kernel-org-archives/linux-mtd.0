Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O3CwP-0000ld-Qj
	for linux-mtd@lists.infradead.org; Sat, 17 Apr 2010 18:40:30 +0000
Date: Sat, 17 Apr 2010 20:40:16 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] [MTD] Fix JFFS2 sync silent failure
Message-ID: <20100417184016.GA17345@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: Christoph Hellwig <hch@infradead.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jens Axboe <jens.axboe@oracle.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Moin David,

if I read the code correctly, JFFS2 will happily perform a NOP on
sys_sync() again.  And this time it appears to be Jens' fault.

JFFS2 does not appear to set s_bdi anywhere.  And as of 32a88aa1,
__sync_filesystem() will return 0 if s_bdi is not set.  As a result,
sync_fs() is never called for jffs2 and whatever remains in the wbuf
will not make it to the device.

The patch also adds a BUG_ON to catch this problem in any remaining or
future offenders.  I am not sure about network filesystems, but at
least bdev- and mtd-based ones should be caught.

Opinions?

Jörn

-- 
No art, however minor, demands less than total dedication if you want
to excel in it.
-- Leon Battista Alberti

diff --git a/drivers/mtd/mtdsuper.c b/drivers/mtd/mtdsuper.c
index af8b42e..7c00319 100644
--- a/drivers/mtd/mtdsuper.c
+++ b/drivers/mtd/mtdsuper.c
@@ -13,6 +13,7 @@
 #include <linux/mtd/super.h>
 #include <linux/namei.h>
 #include <linux/ctype.h>
+#include <linux/slab.h>
 
 /*
  * compare superblocks to see if they're equivalent
@@ -44,6 +45,7 @@ static int get_sb_mtd_set(struct super_block *sb, void *_mtd)
 
 	sb->s_mtd = mtd;
 	sb->s_dev = MKDEV(MTD_BLOCK_MAJOR, mtd->index);
+	sb->s_bdi = mtd->backing_dev_info;
 	return 0;
 }
 
diff --git a/fs/super.c b/fs/super.c
index f35ac60..e8af253 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -954,10 +954,12 @@ vfs_kern_mount(struct file_system_type *type, int flags, const char *name, void
 	if (error < 0)
 		goto out_free_secdata;
 	BUG_ON(!mnt->mnt_sb);
+	BUG_ON(!mnt->mnt_sb->s_bdi &&
+			(mnt->mnt_sb->s_bdev || mnt->mnt_sb->s_mtd));
 
- 	error = security_sb_kern_mount(mnt->mnt_sb, flags, secdata);
- 	if (error)
- 		goto out_sb;
+	error = security_sb_kern_mount(mnt->mnt_sb, flags, secdata);
+	if (error)
+		goto out_sb;
 
 	/*
 	 * filesystems should never set s_maxbytes larger than MAX_LFS_FILESIZE
