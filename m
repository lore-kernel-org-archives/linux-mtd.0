Received: from ug-out-1314.google.com ([66.249.92.175])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KFq6S-0004h6-RF
	for linux-mtd@lists.infradead.org; Mon, 07 Jul 2008 12:46:01 +0000
Received: by ug-out-1314.google.com with SMTP id m2so1061006ugc.45
	for <linux-mtd@lists.infradead.org>;
	Mon, 07 Jul 2008 05:45:59 -0700 (PDT)
Message-ID: <6d291e080807070545k4b089383l2b539ca749f7a280@mail.gmail.com>
Date: Mon, 7 Jul 2008 07:45:59 -0500
From: "Stoyan Gaydarov" <stoyboyker@gmail.com>
To: dwmw2@infradead.org
Subject: [Patch] switch jffs2 to use .unlocked_ioctl
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This changes the .ioctl to the .unlocked_ioctl version and also
indents a few things a little to make the code more readable. Since
the jffs2_ioctl is not actually implemented the lock and unlock calls
are left in comments and must be used when jffs2_ioctl is implemented.

Signed-off-by: Stoyan Gaydarov <stoyboyker@gmail.com>

diff -uprN linux-2.6.26-rc9/fs/jffs2/dir.c devel/fs/jffs2/dir.c
--- linux-2.6.26-rc9/fs/jffs2/dir.c     2008-07-05 17:53:22.000000000 -0500
+++ devel/fs/jffs2/dir.c        2008-07-07 07:27:29.000000000 -0500
@@ -36,10 +36,10 @@ static int jffs2_rename (struct inode *,

 const struct file_operations jffs2_dir_operations =
 {
-       .read =         generic_read_dir,
-       .readdir =      jffs2_readdir,
-       .ioctl =        jffs2_ioctl,
-       .fsync =        jffs2_fsync
+       .read =                 generic_read_dir,
+       .readdir =              jffs2_readdir,
+       .unlocked_ioctl =       jffs2_ioctl,
+       .fsync =                jffs2_fsync
 };


diff -uprN linux-2.6.26-rc9/fs/jffs2/file.c devel/fs/jffs2/file.c
--- linux-2.6.26-rc9/fs/jffs2/file.c    2008-07-05 17:53:22.000000000 -0500
+++ devel/fs/jffs2/file.c       2008-07-07 07:27:37.000000000 -0500
@@ -40,16 +40,16 @@ int jffs2_fsync(struct file *filp, struc

 const struct file_operations jffs2_file_operations =
 {
-       .llseek =       generic_file_llseek,
-       .open =         generic_file_open,
-       .read =         do_sync_read,
-       .aio_read =     generic_file_aio_read,
-       .write =        do_sync_write,
-       .aio_write =    generic_file_aio_write,
-       .ioctl =        jffs2_ioctl,
-       .mmap =         generic_file_readonly_mmap,
-       .fsync =        jffs2_fsync,
-       .splice_read =  generic_file_splice_read,
+       .llseek =               generic_file_llseek,
+       .open =                 generic_file_open,
+       .read =                 do_sync_read,
+       .aio_read =             generic_file_aio_read,
+       .write =                do_sync_write,
+       .aio_write =            generic_file_aio_write,
+       .unlocked_ioctl =       jffs2_ioctl,
+       .mmap =                 generic_file_readonly_mmap,
+       .fsync =                jffs2_fsync,
+       .splice_read =          generic_file_splice_read,
 };

 /* jffs2_file_inode_operations */
diff -uprN linux-2.6.26-rc9/fs/jffs2/ioctl.c devel/fs/jffs2/ioctl.c
--- linux-2.6.26-rc9/fs/jffs2/ioctl.c   2008-07-05 17:53:22.000000000 -0500
+++ devel/fs/jffs2/ioctl.c      2008-07-07 06:48:13.000000000 -0500
@@ -12,11 +12,12 @@
 #include <linux/fs.h>
 #include "nodelist.h"

-int jffs2_ioctl(struct inode *inode, struct file *filp, unsigned int cmd,
-               unsigned long arg)
+long jffs2_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
+       /* lock_kernel(); */
        /* Later, this will provide for lsattr.jffs2 and chattr.jffs2, which
           will include compression support etc. */
+       /* unlock_kernel(); */
        return -ENOTTY;
 }

diff -uprN linux-2.6.26-rc9/fs/jffs2/os-linux.h devel/fs/jffs2/os-linux.h
--- linux-2.6.26-rc9/fs/jffs2/os-linux.h        2008-07-05
17:53:22.000000000 -0500
+++ devel/fs/jffs2/os-linux.h   2008-07-07 07:28:16.000000000 -0500
@@ -167,7 +167,7 @@ int jffs2_fsync(struct file *, struct de
 int jffs2_do_readpage_unlock (struct inode *inode, struct page *pg);

 /* ioctl.c */
-int jffs2_ioctl(struct inode *, struct file *, unsigned int, unsigned long);
+long jffs2_ioctl(struct file *, unsigned int, unsigned long);

 /* symlink.c */
 extern const struct inode_operations jffs2_symlink_inode_operations;
