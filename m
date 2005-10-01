Received: from 207.88.121.47.ptr.us.xo.net ([207.88.121.47]
	helo=ba.realmsys.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1ELV48-0001ic-VG
	for linux-mtd@lists.infradead.org; Fri, 30 Sep 2005 20:17:32 -0400
Received: from pgrayson1.inrealm.net (unknown [66.239.3.2])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by ba.realmsys.com (Spam Firewall) with ESMTP id D15E016EAD
	for <linux-mtd@lists.infradead.org>;
	Fri, 30 Sep 2005 18:17:22 -0600 (MDT)
From: Peter Grayson <pgrayson@realmsys.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="=-qdX6QIF5Pl+jT2s72Vfk"
Date: Fri, 30 Sep 2005 18:17:26 -0600
Message-Id: <1128125846.6926.120.camel@localhost.localdomain>
Mime-Version: 1.0
Subject: [PATCH] jffs2, symlink, and 2.6.13
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-qdX6QIF5Pl+jT2s72Vfk
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The function prototype for follow_link() in struct inode_operations
changed in linux 2.6.13. Instead of returning int, it now expects
returning void*.

I have attached a patch that fixes up the jffs2 code to accommodate the
new prototype. No functional changes were made to the jffs2 code.

For those on earlier kernel versions, this change will yield compiler
warnings. I am not sure what the policy is for maintaining compatibility
with older kernel versions, so I did not include any changes to
compatmac.h. Do we want to reproduce the struct inode_operations
declaration in compatmac.h just so that latest mtd does not yield
compiler warnings on older kernels?

Pete


--=-qdX6QIF5Pl+jT2s72Vfk
Content-Disposition: attachment; filename=jffs2-symlink.patch
Content-Type: text/x-patch; name=jffs2-symlink.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

[jffs2] Fixup symlink.c for linux 2.6.13
[From: Peter Grayson <pgrayson@realmsys.com>]
diff -uNr mtd/fs/jffs2/symlink.c mtd-jffs2-symlink/fs/jffs2/symlink.c
--- mtd/fs/jffs2/symlink.c	2005-08-30 15:47:52.000000000 -0600
+++ mtd-jffs2-symlink/fs/jffs2/symlink.c	2005-09-30 17:41:48.164336152 -0600
@@ -18,19 +18,19 @@
 #include <linux/namei.h>
 #include "nodelist.h"
 
-static int jffs2_follow_link(struct dentry *dentry, struct nameidata *nd);
+static void *jffs2_follow_link(struct dentry *dentry, struct nameidata *nd);
 
 struct inode_operations jffs2_symlink_inode_operations =
-{	
+{
 	.readlink =	generic_readlink,
 	.follow_link =	jffs2_follow_link,
 	.setattr =	jffs2_setattr
 };
 
-static int jffs2_follow_link(struct dentry *dentry, struct nameidata *nd)
+static void *jffs2_follow_link(struct dentry *dentry, struct nameidata *nd)
 {
 	struct jffs2_inode_info *f = JFFS2_INODE_INFO(dentry->d_inode);
-	
+
 	/*
 	 * We don't acquire the f->sem mutex here since the only data we
 	 * use is f->target.
@@ -43,20 +43,20 @@
 	 * stopped using our f->target string which we provide by means of
 	 * nd_set_link() call.
 	 */
-	
+
 	if (!f->target) {
-		printk(KERN_ERR "jffs2_follow_link(): can't find symlink taerget\n");
-		return -EIO;
+		printk(KERN_ERR "jffs2_follow_link(): can't find symlink target\n");
+		return ERR_PTR(-EIO);
 	}
 	D1(printk(KERN_DEBUG "jffs2_follow_link(): target path is '%s'\n", (char *) f->target));
 
 	nd_set_link(nd, (char *)f->target);
-	
+
 	/*
 	 * We will unlock the f->sem mutex but VFS will use the f->target string. This is safe
 	 * since the only way that may cause f->target to be changed is iput() operation.
 	 * But VFS will not use f->target after iput() has been called.
 	 */
-	return 0;
+	return NULL;
 }
 

--=-qdX6QIF5Pl+jT2s72Vfk--
