Subject: Re: JFFS2: jffs2_symlink/jffs2_mkdir/jffs2_mknod bug?
From: David Woodhouse <dwmw2@infradead.org>
To: Tao Huang <ulysses.huang@gmail.com>
In-Reply-To: <6b6744400912011811r4cecda08hd0a2502bc3083fc3@mail.gmail.com>
References: <6b6744400912011811r4cecda08hd0a2502bc3083fc3@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 02 Dec 2009 08:54:13 +0000
Message-ID: <1259744053.19465.902.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-12-02 at 10:11 +0800, Tao Huang wrote:
> On jffs2_symlink/jffs2_mkdir/jffs2_mknod, after jffs2_write_dnode,
> any call jffs2_clear_inode will no call jffs2_mark_node_obsolete because
> pino_nlink is not zero. This will make kernel BUG on jffs2_garbage_collect_live.
> 
> Run fsstress on NANDSIM can easy see this bug when no space, for example:
> fsstress -p 2 -n 100000 -d /data -l 0 -s 100000 on 128KB NANDSIM. 

Hm, good catch; thanks.

We _need_ to have a non-zero pino_nlink for new inodes during their
creation. We can't just create them with zero nlink and then use
jffs2_do_link() because that would leave an opportunity for the garbage
collector to delete them in between.

So we need to zero the nlink for a 'failed' creation. Something like
this...?

diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
index 7aa4417..f91aa89 100644
--- a/fs/jffs2/dir.c
+++ b/fs/jffs2/dir.c
@@ -358,6 +358,7 @@ static int jffs2_symlink (struct inode *dir_i, struct dentry *dentry, const char
 
 	if (IS_ERR(fn)) {
 		/* Eeek. Wave bye bye */
+		f->inocache->pino_nlink = 0;
 		mutex_unlock(&f->sem);
 		jffs2_complete_reservation(c);
 		jffs2_clear_inode(inode);
@@ -368,6 +369,7 @@ static int jffs2_symlink (struct inode *dir_i, struct dentry *dentry, const char
 	f->target = kmalloc(targetlen + 1, GFP_KERNEL);
 	if (!f->target) {
 		printk(KERN_WARNING "Can't allocate %d bytes of memory\n", targetlen + 1);
+		f->inocache->pino_nlink = 0;
 		mutex_unlock(&f->sem);
 		jffs2_complete_reservation(c);
 		jffs2_clear_inode(inode);
@@ -387,11 +389,17 @@ static int jffs2_symlink (struct inode *dir_i, struct dentry *dentry, const char
 
 	ret = jffs2_init_security(inode, dir_i);
 	if (ret) {
+		mutex_lock(&f->sem);
+		f->inocache->pino_nlink = 0;
+		mutex_unlock(&f->sem);
 		jffs2_clear_inode(inode);
 		return ret;
 	}
 	ret = jffs2_init_acl_post(inode);
 	if (ret) {
+		mutex_lock(&f->sem);
+		f->inocache->pino_nlink = 0;
+		mutex_unlock(&f->sem);
 		jffs2_clear_inode(inode);
 		return ret;
 	}
@@ -400,6 +408,9 @@ static int jffs2_symlink (struct inode *dir_i, struct dentry *dentry, const char
 				  ALLOC_NORMAL, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
 	if (ret) {
 		/* Eep. */
+		mutex_lock(&f->sem);
+		f->inocache->pino_nlink = 0;
+		mutex_unlock(&f->sem);
 		jffs2_clear_inode(inode);
 		return ret;
 	}
@@ -408,6 +419,9 @@ static int jffs2_symlink (struct inode *dir_i, struct dentry *dentry, const char
 	if (!rd) {
 		/* Argh. Now we treat it like a normal delete */
 		jffs2_complete_reservation(c);
+		mutex_lock(&f->sem);
+		f->inocache->pino_nlink = 0;
+		mutex_unlock(&f->sem);
 		jffs2_clear_inode(inode);
 		return -ENOMEM;
 	}
@@ -436,6 +450,7 @@ static int jffs2_symlink (struct inode *dir_i, struct dentry *dentry, const char
 		   as if it were the final unlink() */
 		jffs2_complete_reservation(c);
 		jffs2_free_raw_dirent(rd);
+		f->inocache->pino_nlink = 0;
 		mutex_unlock(&dir_f->sem);
 		jffs2_clear_inode(inode);
 		return PTR_ERR(fd);
@@ -517,6 +532,7 @@ static int jffs2_mkdir (struct inode *dir_i, struct dentry *dentry, int mode)
 
 	if (IS_ERR(fn)) {
 		/* Eeek. Wave bye bye */
+		f->inocache->pino_nlink = 0;
 		mutex_unlock(&f->sem);
 		jffs2_complete_reservation(c);
 		jffs2_clear_inode(inode);
@@ -532,11 +548,17 @@ static int jffs2_mkdir (struct inode *dir_i, struct dentry *dentry, int mode)
 
 	ret = jffs2_init_security(inode, dir_i);
 	if (ret) {
+		mutex_lock(&f->sem);
+		f->inocache->pino_nlink = 0;
+		mutex_unlock(&f->sem);
 		jffs2_clear_inode(inode);
 		return ret;
 	}
 	ret = jffs2_init_acl_post(inode);
 	if (ret) {
+		mutex_lock(&f->sem);
+		f->inocache->pino_nlink = 0;
+		mutex_unlock(&f->sem);
 		jffs2_clear_inode(inode);
 		return ret;
 	}
@@ -545,6 +567,9 @@ static int jffs2_mkdir (struct inode *dir_i, struct dentry *dentry, int mode)
 				  ALLOC_NORMAL, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
 	if (ret) {
 		/* Eep. */
+		mutex_lock(&f->sem);
+		f->inocache->pino_nlink = 0;
+		mutex_unlock(&f->sem);
 		jffs2_clear_inode(inode);
 		return ret;
 	}
@@ -553,6 +578,9 @@ static int jffs2_mkdir (struct inode *dir_i, struct dentry *dentry, int mode)
 	if (!rd) {
 		/* Argh. Now we treat it like a normal delete */
 		jffs2_complete_reservation(c);
+		mutex_lock(&f->sem);
+		f->inocache->pino_nlink = 0;
+		mutex_unlock(&f->sem);
 		jffs2_clear_inode(inode);
 		return -ENOMEM;
 	}
@@ -581,6 +609,7 @@ static int jffs2_mkdir (struct inode *dir_i, struct dentry *dentry, int mode)
 		   as if it were the final unlink() */
 		jffs2_complete_reservation(c);
 		jffs2_free_raw_dirent(rd);
+		f->inocache->pino_nlink = 0;
 		mutex_unlock(&dir_f->sem);
 		jffs2_clear_inode(inode);
 		return PTR_ERR(fd);
@@ -691,6 +720,7 @@ static int jffs2_mknod (struct inode *dir_i, struct dentry *dentry, int mode, de
 
 	if (IS_ERR(fn)) {
 		/* Eeek. Wave bye bye */
+		f->inocache->pino_nlink = 0;
 		mutex_unlock(&f->sem);
 		jffs2_complete_reservation(c);
 		jffs2_clear_inode(inode);
@@ -706,11 +736,17 @@ static int jffs2_mknod (struct inode *dir_i, struct dentry *dentry, int mode, de
 
 	ret = jffs2_init_security(inode, dir_i);
 	if (ret) {
+		mutex_lock(&f->sem);
+		f->inocache->pino_nlink = 0;
+		mutex_unlock(&f->sem);
 		jffs2_clear_inode(inode);
 		return ret;
 	}
 	ret = jffs2_init_acl_post(inode);
 	if (ret) {
+		mutex_lock(&f->sem);
+		f->inocache->pino_nlink = 0;
+		mutex_unlock(&f->sem);
 		jffs2_clear_inode(inode);
 		return ret;
 	}
@@ -719,6 +755,9 @@ static int jffs2_mknod (struct inode *dir_i, struct dentry *dentry, int mode, de
 				  ALLOC_NORMAL, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
 	if (ret) {
 		/* Eep. */
+		mutex_lock(&f->sem);
+		f->inocache->pino_nlink = 0;
+		mutex_unlock(&f->sem);
 		jffs2_clear_inode(inode);
 		return ret;
 	}
@@ -727,6 +766,9 @@ static int jffs2_mknod (struct inode *dir_i, struct dentry *dentry, int mode, de
 	if (!rd) {
 		/* Argh. Now we treat it like a normal delete */
 		jffs2_complete_reservation(c);
+		mutex_lock(&f->sem);
+		f->inocache->pino_nlink = 0;
+		mutex_unlock(&f->sem);
 		jffs2_clear_inode(inode);
 		return -ENOMEM;
 	}
@@ -758,6 +800,7 @@ static int jffs2_mknod (struct inode *dir_i, struct dentry *dentry, int mode, de
 		   as if it were the final unlink() */
 		jffs2_complete_reservation(c);
 		jffs2_free_raw_dirent(rd);
+		f->inocache->pino_nlink = 0;
 		mutex_unlock(&dir_f->sem);
 		jffs2_clear_inode(inode);
 		return PTR_ERR(fd);


-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
