Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D5m5Q-0007bh-CD
	for linux-mtd@lists.infradead.org; Mon, 28 Feb 2005 09:41:32 -0500
Received: from sauron.oktetlabs.ru (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id 7090222B26
	for <linux-mtd@lists.infradead.org>;
	Mon, 28 Feb 2005 17:40:54 +0300 (MSK)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: MTD List <linux-mtd@lists.infradead.org>
In-Reply-To: <Pine.LNX.4.58.0502171424040.30538@phoenix.infradead.org>
References: <Pine.LNX.4.58.0502171424040.30538@phoenix.infradead.org>
Content-Type: multipart/mixed; boundary="=-eY3rQYYJAeMwJfWYVsfa"
Date: Mon, 28 Feb 2005 17:40:54 +0300
Message-Id: <1109601654.6211.22.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Subject: Re: [PATCH] JFFS2 symlink cache
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-eY3rQYYJAeMwJfWYVsfa
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello,

here is newer version of the symlink caching patch.

The problem:
~~~~~~~~~~~

When the symlink inode is cached (e.g. iget() was called for it), JFFS2
does not cache the symlink's target in RAM. Instead, it reads it from
flash on every follow_link() inode method invocation (see symlink.c,
jffs2_follow_link()).

Most of the conceivable Linux systems stores dozens of symlinks in /lib
directory and access them very often (i.e., ld and libc library's links
are accessed almost on every program load). Hence, the patch might
improve performance and it should be especially sensible during system
boot.

Implementation:
~~~~~~~~~~~~~~

The patch is implemented very simple way. On iget(), the target path of
symlink is cached in RAM. On iput() it is it is freed(). In effect, any
follow_link() call is satisfied by the cached target path, without the
physical flash reading.

I 've also tweaked jffs2_symlink() slightly (dir.c) introducing new
targetlen variable instead of invoking strlen() several times.

Issues:
~~~~~~

Please, take a glimpse how I have implemented the jffs2_follow_link()
operation (symlink.c). Surely it safe to provide f->dents string to VFS?
I do down(&f->sem) there, but this is just paranoia and I think it isn't
really needed. Please, comment this.




 

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.

--=-eY3rQYYJAeMwJfWYVsfa
Content-Disposition: attachment; filename=jffs2_symlink-03.diff
Content-Type: text/x-patch; name=jffs2_symlink-03.diff; charset=KOI8-R
Content-Transfer-Encoding: 7bit

diff -auNr mtd/fs/jffs2/dir.c mtd-symlink/fs/jffs2/dir.c
--- mtd/fs/jffs2/dir.c	2004-11-16 23:36:11.000000000 +0300
+++ mtd-symlink/fs/jffs2/dir.c	2005-02-28 17:35:44.106284864 +0300
@@ -296,11 +296,11 @@
 	struct jffs2_full_dirent *fd;
 	int namelen;
 	uint32_t alloclen, phys_ofs;
-	int ret;
+	int ret, targetlen = strlen(target);
 
 	/* FIXME: If you care. We'd need to use frags for the target
 	   if it grows much more than this */
-	if (strlen(target) > 254)
+	if (targetlen > 254)
 		return -EINVAL;
 
 	ri = jffs2_alloc_raw_inode();
@@ -314,7 +314,7 @@
 	 * Just the node will do for now, though 
 	 */
 	namelen = dentry->d_name.len;
-	ret = jffs2_reserve_space(c, sizeof(*ri) + strlen(target), &phys_ofs, &alloclen, ALLOC_NORMAL);
+	ret = jffs2_reserve_space(c, sizeof(*ri) + targetlen, &phys_ofs, &alloclen, ALLOC_NORMAL);
 
 	if (ret) {
 		jffs2_free_raw_inode(ri);
@@ -333,16 +333,16 @@
 
 	f = JFFS2_INODE_INFO(inode);
 
-	inode->i_size = strlen(target);
+	inode->i_size = targetlen;
 	ri->isize = ri->dsize = ri->csize = cpu_to_je32(inode->i_size);
 	ri->totlen = cpu_to_je32(sizeof(*ri) + inode->i_size);
 	ri->hdr_crc = cpu_to_je32(crc32(0, ri, sizeof(struct jffs2_unknown_node)-4));
 
 	ri->compr = JFFS2_COMPR_NONE;
-	ri->data_crc = cpu_to_je32(crc32(0, target, strlen(target)));
+	ri->data_crc = cpu_to_je32(crc32(0, target, targetlen));
 	ri->node_crc = cpu_to_je32(crc32(0, ri, sizeof(*ri)-8));
 	
-	fn = jffs2_write_dnode(c, f, ri, target, strlen(target), phys_ofs, ALLOC_NORMAL);
+	fn = jffs2_write_dnode(c, f, ri, target, targetlen, phys_ofs, ALLOC_NORMAL);
 
 	jffs2_free_raw_inode(ri);
 
@@ -353,6 +353,20 @@
 		jffs2_clear_inode(inode);
 		return PTR_ERR(fn);
 	}
+
+	/* We use f->dents field to store the target path. */
+	f->dents = kmalloc(targetlen + 1, GFP_KERNEL);
+	if (!f->dents) {
+		printk(KERN_WARNING "Can't allocate %d bytes of memory\n", targetlen + 1);
+		up(&f->sem);
+		jffs2_complete_reservation(c);
+		jffs2_clear_inode(inode);
+		return -ENOMEM;
+	}
+
+	memcpy(f->dents, target, targetlen + 1);
+	D1(printk(KERN_DEBUG "jffs2_symlink: symlink's target '%s' cached\n", (char *)f->dents));
+
 	/* No data here. Only a metadata node, which will be 
 	   obsoleted by the first data write
 	*/
diff -auNr mtd/fs/jffs2/read.c mtd-symlink/fs/jffs2/read.c
--- mtd/fs/jffs2/read.c	2004-11-16 23:36:12.000000000 +0300
+++ mtd-symlink/fs/jffs2/read.c	2005-02-28 17:35:21.933773480 +0300
@@ -214,33 +214,3 @@
 	return 0;
 }
 
-/* Core function to read symlink target. */
-char *jffs2_getlink(struct jffs2_sb_info *c, struct jffs2_inode_info *f)
-{
-	char *buf;
-	int ret;
-
-	down(&f->sem);
-
-	if (!f->metadata) {
-		printk(KERN_NOTICE "No metadata for symlink inode #%u\n", f->inocache->ino);
-		up(&f->sem);
-		return ERR_PTR(-EINVAL);
-	}
-	buf = kmalloc(f->metadata->size+1, GFP_USER);
-	if (!buf) {
-		up(&f->sem);
-		return ERR_PTR(-ENOMEM);
-	}
-	buf[f->metadata->size]=0;
-
-	ret = jffs2_read_dnode(c, f, f->metadata, buf, 0, f->metadata->size);
-
-	up(&f->sem);
-
-	if (ret) {
-		kfree(buf);
-		return ERR_PTR(ret);
-	}
-	return buf;
-}
diff -auNr mtd/fs/jffs2/symlink.c mtd-symlink/fs/jffs2/symlink.c
--- mtd/fs/jffs2/symlink.c	2004-11-16 23:36:12.000000000 +0300
+++ mtd-symlink/fs/jffs2/symlink.c	2005-02-28 17:35:21.935772625 +0300
@@ -19,27 +19,33 @@
 #include "nodelist.h"
 
 static int jffs2_follow_link(struct dentry *dentry, struct nameidata *nd);
-static void jffs2_put_link(struct dentry *dentry, struct nameidata *nd);
 
 struct inode_operations jffs2_symlink_inode_operations =
 {	
 	.readlink =	generic_readlink,
 	.follow_link =	jffs2_follow_link,
-	.put_link =	jffs2_put_link,
 	.setattr =	jffs2_setattr
 };
 
 static int jffs2_follow_link(struct dentry *dentry, struct nameidata *nd)
 {
-	unsigned char *buf;
-	buf = jffs2_getlink(JFFS2_SB_INFO(dentry->d_inode->i_sb), JFFS2_INODE_INFO(dentry->d_inode));
-	nd_set_link(nd, buf);
+	struct jffs2_inode_info *f = JFFS2_INODE_INFO(dentry->d_inode);
+	
+	down(&f->sem);
+	if (!f->dents) {
+		printk(KERN_ERR "jffs2_follow_link(): can't find symlink taerget\n");
+		return -EIO;
+	}
+	D1(printk(KERN_DEBUG "jffs2_follow_link(): target path is '%s'\n", (char *) f->dents));
+
+	nd_set_link(nd, (char *)f->dents);
+	
+	/*
+	 * We unlock the f->sem mutex but VFS will use the f->dents string. This is safe
+	 * since the only way that may cause f->dents to be changed is iput() operation.
+	 * But VFS will not use f->dents after iput() has been called.
+	 */
+	up(&f->sem);
 	return 0;
 }
 
-static void jffs2_put_link(struct dentry *dentry, struct nameidata *nd)
-{
-	char *s = nd_get_link(nd);
-	if (!IS_ERR(s))
-		kfree(s);
-}

--=-eY3rQYYJAeMwJfWYVsfa--
