Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 166ZPz-0001hq-00
	for <linux-mtd@lists.infradead.org>; Wed, 21 Nov 2001 15:36:07 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1006355430.17354.8.camel@LinuxDev> 
References: <1006355430.17354.8.camel@LinuxDev>  <1005925030.25782.27.camel@LinuxDev> <30843.1005925709@redhat.com> 
To: Ian Campbell <icampbell@arcom.co.uk>
Cc: Linux MTD Mailing List <linux-mtd@lists.infradead.org>,
    jffs-dev@axis.com
Subject: Re: Caching of reads 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 21 Nov 2001 15:46:40 +0000
Message-ID: <15923.1006357600@redhat.com>
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

icampbell@arcom.co.uk said:
>  I've instrumented my kernel a bit and found that the reads are being
> caused by calls to jffs2_follow_link (in order to resolve the sym
> links for the libraries needed to load sleep)... 

> It's been pointed out to me that the jffs list might be a better place
> so I'll take this there... 

Try this.

Index: include/linux/jffs2_fs_i.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/jffs2_fs_i.h,v
retrieving revision 1.8
diff -u -r1.8 jffs2_fs_i.h
--- include/linux/jffs2_fs_i.h	2001/04/18 13:05:28	1.8
+++ include/linux/jffs2_fs_i.h	2001/11/21 15:45:43
@@ -44,6 +44,7 @@
 	/* Some stuff we just have to keep in-core at all times, for each inode. */
 	struct jffs2_inode_cache *inocache;
 
+	unsigned char *symlink_target;
 	/* Keep a pointer to the last physical node in the list. We don't 
 	   use the doubly-linked lists because we don't want to increase
 	   the memory usage that much. This is simpler */
Index: fs/jffs2/readinode.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/readinode.c,v
retrieving revision 1.56
diff -u -r1.56 readinode.c
--- fs/jffs2/readinode.c	2001/07/26 20:32:39	1.56
+++ fs/jffs2/readinode.c	2001/11/21 15:45:44
@@ -458,6 +458,9 @@
 
 	D1(printk(KERN_DEBUG "jffs2_clear_inode(): ino #%lu mode %o\n", inode->i_ino, inode->i_mode));
 
+	if (f->symlink_target)
+		kfree(f->symlink_target);
+
 	frags = f->fraglist;
 	fds = f->dents;
 	if (f->metadata) {
Index: fs/jffs2/symlink.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/symlink.c,v
retrieving revision 1.5
diff -u -r1.5 symlink.c
--- fs/jffs2/symlink.c	2001/03/15 15:38:24	1.5
+++ fs/jffs2/symlink.c	2001/11/21 15:45:44
@@ -52,7 +52,7 @@
 	setattr:	jffs2_setattr
 };
 
-static char *jffs2_getlink(struct dentry *dentry)
+static int jffs2_get_link_target(struct dentry *dentry)
 {
 	struct jffs2_inode_info *f = JFFS2_INODE_INFO(dentry->d_inode);
 	char *buf;
@@ -60,46 +60,45 @@
 
 	if (!f->metadata) {
 		printk(KERN_NOTICE "No metadata for symlink inode #%lu\n", dentry->d_inode->i_ino);
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 	}
 	buf = kmalloc(f->metadata->size+1, GFP_USER);
 	if (!buf)
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 	buf[f->metadata->size]=0;
 
 	ret = jffs2_read_dnode(JFFS2_SB_INFO(dentry->d_inode->i_sb), f->metadata, buf, 0, f->metadata->size);
 	if (ret) {
 		kfree(buf);
-		return ERR_PTR(ret);
+		return ret;
 	}
-	return buf;
+	f->symlink_target = buf;
 
+	return 0;
 }
+
 int jffs2_readlink(struct dentry *dentry, char *buffer, int buflen)
 {
-	unsigned char *kbuf;
-	int ret;
+	struct jffs2_inode_info *f = JFFS2_INODE_INFO(dentry->d_inode);
+
+	if (!f->symlink_target) {
+		int ret = jffs2_get_link_target(dentry);
+		if (ret)
+			return ret;
+	}
 
-	kbuf = jffs2_getlink(dentry);
-	if (IS_ERR(kbuf))
-		return PTR_ERR(kbuf);
-
-	ret = vfs_readlink(dentry, buffer, buflen, kbuf);
-	kfree(kbuf);
-	return ret;
+	return vfs_readlink(dentry, buffer, buflen, f->symlink_target);
 }
 
 int jffs2_follow_link(struct dentry *dentry, struct nameidata *nd)
 {
-	unsigned char *buf;
-	int ret;
-
-	buf = jffs2_getlink(dentry);
+	struct jffs2_inode_info *f = JFFS2_INODE_INFO(dentry->d_inode);
 
-	if (IS_ERR(buf))
-		return PTR_ERR(buf);
+	if (!f->symlink_target) {
+		int ret = jffs2_get_link_target(dentry);
+		if (ret)
+			return ret;
+	}
 
-	ret = vfs_follow_link(nd, buf);
-	kfree(buf);
-	return ret;
+	return vfs_follow_link(nd, f->symlink_target);
 }



--
dwmw2
