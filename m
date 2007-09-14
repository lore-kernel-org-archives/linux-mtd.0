Received: from tyo201.gate.nec.co.jp ([202.32.8.193])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IW4UE-0003kk-4A
	for linux-mtd@lists.infradead.org; Fri, 14 Sep 2007 02:17:11 -0400
Message-ID: <46EA2743.3090107@ak.jp.nec.com>
Date: Fri, 14 Sep 2007 15:16:35 +0900
From: KaiGai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 ACL problem.
References: <1186676611.7282.47.camel@shinybook.infradead.org>	
	<46C9783D.4000503@ak.jp.nec.com>
	<1187782861.22432.81.camel@pmac.infradead.org>
	<46D25ECF.8090409@ak.jp.nec.com>
In-Reply-To: <46D25ECF.8090409@ak.jp.nec.com>
Content-Type: multipart/mixed; boundary="------------040805020703020908010400"
Cc: linux-mtd@lists.infradead.org, KaiGai Kohei <kaigai@ak.jp.nec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------040805020703020908010400
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit

Hi,

The attached patch separate jffs2_init_acl() into two parts.

The one is jffs2_init_acl_pre() called from jffs2_new_inode().
It compute ACL oriented inode->i_mode bits, and allocate in-memory ACL
objects associated with the new inode just before when inode meta
infomation is written to the medium.

The other is jffs2_init_acl_post() called from jffs2_symlink(),
jffs2_mkdir(), jffs2_mknod() and jffs2_do_create().
It actually writes in-memory ACL objects into the medium next to
the success of writing meta-information.

In the current implementation, we have to write a same inode meta
infomation twice when inode->i_mode is updated by the default ACL.
However, we can avoid the behavior by putting an updated i_mode
before it is written at first, as jffs2_init_acl_pre() doing.

Please review this patch.

Thanks,

KaiGai Kohei wrote:
> David Woodhouse wrote:
>> On Mon, 2007-08-20 at 20:17 +0900, KaiGai Kohei wrote:
>>> I also think that to split jffs2_init_acl() is a good idea to avoid
>>> the problem.
>>>
>>> In addition, this approach will enable to reduce the times to write
>>> a same inode, when inode->i_mode is changed on inode creation.
>> OK, that's what I've done. Does it look OK to you?
>>
>> http://git.infradead.org/?p=mtd-2.6.git;a=commitdiff;h=9ed437c50d89eabae763dd422579f73fdebf288d
> 
> I think it works fine. However, I have a comment to improve it.
> 
> The following part come from jffs2_init_acl() in the older version, isn't it?
> I think that most of the initialization of ACL should be done in this former
> section, except for actual writing on the medium.
> --------------------------------------------------------------
> @@ -431,7 +435,23 @@ struct inode *jffs2_new_inode (struct inode *dir_i, int mode, struct jffs2_raw_i
>         } else {
>                 ri->gid = cpu_to_je16(current->fsgid);
>         }
> -       ri->mode =  cpu_to_jemode(mode);
> +
> +       /* POSIX ACLs have to be processed now, at least partly.
> +          The umask is only applied if there's no default ACL */
> +       if (!S_ISLNK(mode)) {
> +               *acl = jffs2_get_acl(dir_i, ACL_TYPE_DEFAULT);
> +               if (IS_ERR(*acl)) {
> +                       make_bad_inode(inode);
> +                       iput(inode);
> +                       inode = (void *)*acl;
> +                       *acl = NULL;
> +                       return inode;
> +               }
> +               if (!(*acl))
> +                       mode &= ~current->fs->umask;
> +       } else {
> +               *acl = NULL;
> +       }
>         ret = jffs2_do_new_inode (c, f, mode, ri);
>         if (ret) {
>                 make_bad_inode(inode);
> --------------------------------------------------------------
> 
> In my opinion, the default ACL came from the parent directory should be
> set on f->i_acl_access or f->i_acl_default soon, and posix_acl_equiv_mode()
> is called to compute appropriate mode bits before the new inode is written
> at first.
> When mode bits are updated via posix_acl_equiv_mode(), the new inode is
> written twice, in the current implementation. It is undesirable.
> 
> Then, the meaning of jffs2_set_acl() should be defined again as a function
> which simply put a posix_acl object into a on-medium xattr.
> 
> In addition, some updated function got unnecessary to have an extra argument
> of acl, if posix_acl object is set onto f->i_acl_access and f->i_acl_default
> in jffs2_new_inode().
> 
> Thanks,

-- 
OSS Platform Development Division, NEC
KaiGai Kohei <kaigai@ak.jp.nec.com>

--------------040805020703020908010400
Content-Type: text/x-patch;
 name="jffs2_two_phase_ACL-Init.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="jffs2_two_phase_ACL-Init.patch"

diff --git a/fs/jffs2/acl.c b/fs/jffs2/acl.c
index 8ec9323..9728614 100644
--- a/fs/jffs2/acl.c
+++ b/fs/jffs2/acl.c
@@ -228,11 +228,28 @@ struct posix_acl *jffs2_get_acl(struct inode *inode, int type)
 	return acl;
 }
 
+static int __jffs2_set_acl(struct inode *inode, int xprefix, struct posix_acl *acl)
+{
+	char *value = NULL;
+	size_t size = 0;
+	int rc;
+
+	if (acl) {
+		value = jffs2_acl_to_medium(acl, &size);
+		if (IS_ERR(value))
+			return PTR_ERR(value);
+	}
+	rc = do_jffs2_setxattr(inode, xprefix, "", value, size, 0);
+	if (!value && rc == -ENODATA)
+		rc = 0;
+	kfree(value);
+
+	return rc;
+}
+
 static int jffs2_set_acl(struct inode *inode, int type, struct posix_acl *acl)
 {
 	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
-	size_t size = 0;
-	char *value = NULL;
 	int rc, xprefix;
 
 	if (S_ISLNK(inode->i_mode))
@@ -267,17 +284,7 @@ static int jffs2_set_acl(struct inode *inode, int type, struct posix_acl *acl)
 	default:
 		return -EINVAL;
 	}
-	if (acl) {
-		value = jffs2_acl_to_medium(acl, &size);
-		if (IS_ERR(value))
-			return PTR_ERR(value);
-	}
-
-	rc = do_jffs2_setxattr(inode, xprefix, "", value, size, 0);
-	if (!value && rc == -ENODATA)
-		rc = 0;
-	if (value)
-		kfree(value);
+	rc = __jffs2_set_acl(inode, xprefix, acl);
 	if (!rc) {
 		switch(type) {
 		case ACL_TYPE_ACCESS:
@@ -312,37 +319,59 @@ int jffs2_permission(struct inode *inode, int mask, struct nameidata *nd)
 	return generic_permission(inode, mask, jffs2_check_acl);
 }
 
-int jffs2_init_acl(struct inode *inode, struct posix_acl *acl)
+int jffs2_init_acl_pre(struct inode *dir_i, struct inode *inode, int *i_mode)
 {
 	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
-	struct posix_acl *clone;
-	mode_t mode;
-	int rc = 0;
+	struct posix_acl *acl, *clone;
+	int rc;
 
-	f->i_acl_access = JFFS2_ACL_NOT_CACHED;
-	f->i_acl_default = JFFS2_ACL_NOT_CACHED;
+	f->i_acl_default = NULL;
+	f->i_acl_access = NULL;
+
+	if (S_ISLNK(*i_mode))
+		return 0;	/* Symlink always has no-ACL */
+
+	acl = jffs2_get_acl(dir_i, ACL_TYPE_DEFAULT);
+	if (IS_ERR(acl))
+		return PTR_ERR(acl);
+
+	if (!acl) {
+		*i_mode &= ~current->fs->umask;
+	} else {
+		if (S_ISDIR(*i_mode))
+			jffs2_iset_acl(inode, &f->i_acl_default, acl);
 
-	if (acl) {
-		if (S_ISDIR(inode->i_mode)) {
-			rc = jffs2_set_acl(inode, ACL_TYPE_DEFAULT, acl);
-			if (rc)
-				goto cleanup;
-		}
 		clone = posix_acl_clone(acl, GFP_KERNEL);
-		rc = -ENOMEM;
 		if (!clone)
-			goto cleanup;
-		mode = inode->i_mode;
-		rc = posix_acl_create_masq(clone, &mode);
-		if (rc >= 0) {
-			inode->i_mode = mode;
-			if (rc > 0)
-				rc = jffs2_set_acl(inode, ACL_TYPE_ACCESS, clone);
-		}
+			return -ENOMEM;
+		rc = posix_acl_create_masq(clone, (mode_t *)i_mode);
+		if (rc < 0)
+			return rc;
+		if (rc > 0)
+			jffs2_iset_acl(inode, &f->i_acl_access, clone);
+
 		posix_acl_release(clone);
 	}
- cleanup:
-	posix_acl_release(acl);
+	return 0;
+}
+
+int jffs2_init_acl_post(struct inode *inode)
+{
+	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
+	int rc;
+
+	if (f->i_acl_default) {
+		rc = __jffs2_set_acl(inode, JFFS2_XPREFIX_ACL_DEFAULT, f->i_acl_default);
+		if (rc)
+			return rc;
+	}
+
+	if (f->i_acl_access) {
+		rc = __jffs2_set_acl(inode, JFFS2_XPREFIX_ACL_ACCESS, f->i_acl_access);
+		if (rc)
+			return rc;
+	}
+
 	return rc;
 }
 
diff --git a/fs/jffs2/acl.h b/fs/jffs2/acl.h
index 90a2dbf..76c6ebd 100644
--- a/fs/jffs2/acl.h
+++ b/fs/jffs2/acl.h
@@ -31,7 +31,8 @@ struct jffs2_acl_header {
 extern struct posix_acl *jffs2_get_acl(struct inode *inode, int type);
 extern int jffs2_permission(struct inode *, int, struct nameidata *);
 extern int jffs2_acl_chmod(struct inode *);
-extern int jffs2_init_acl(struct inode *, struct posix_acl *);
+extern int jffs2_init_acl_pre(struct inode *, struct inode *, int *);
+extern int jffs2_init_acl_post(struct inode *);
 extern void jffs2_clear_acl(struct jffs2_inode_info *);
 
 extern struct xattr_handler jffs2_acl_access_xattr_handler;
@@ -39,10 +40,11 @@ extern struct xattr_handler jffs2_acl_default_xattr_handler;
 
 #else
 
-#define jffs2_get_acl(inode, type)	(NULL)
-#define jffs2_permission NULL
-#define jffs2_acl_chmod(inode)		(0)
-#define jffs2_init_acl(inode,dir)	(0)
+#define jffs2_get_acl(inode, type)		(NULL)
+#define jffs2_permission			(NULL)
+#define jffs2_acl_chmod(inode)			(0)
+#define jffs2_init_acl_pre(dir_i,inode,mode)	(0)
+#define jffs2_init_acl_post(inode)		(0)
 #define jffs2_clear_acl(f)
 
 #endif	/* CONFIG_JFFS2_FS_POSIX_ACL */
diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
index 8353eb9..787e392 100644
--- a/fs/jffs2/dir.c
+++ b/fs/jffs2/dir.c
@@ -182,7 +182,6 @@ static int jffs2_create(struct inode *dir_i, struct dentry *dentry, int mode,
 	struct jffs2_inode_info *f, *dir_f;
 	struct jffs2_sb_info *c;
 	struct inode *inode;
-	struct posix_acl *acl;
 	int ret;
 
 	ri = jffs2_alloc_raw_inode();
@@ -193,7 +192,7 @@ static int jffs2_create(struct inode *dir_i, struct dentry *dentry, int mode,
 
 	D1(printk(KERN_DEBUG "jffs2_create()\n"));
 
-	inode = jffs2_new_inode(dir_i, mode, ri, &acl);
+	inode = jffs2_new_inode(dir_i, mode, ri);
 
 	if (IS_ERR(inode)) {
 		D1(printk(KERN_DEBUG "jffs2_new_inode() failed\n"));
@@ -211,14 +210,6 @@ static int jffs2_create(struct inode *dir_i, struct dentry *dentry, int mode,
 
 	ret = jffs2_do_create(c, dir_f, f, ri,
 			      dentry->d_name.name, dentry->d_name.len);
-
-	if (ret)
-		goto fail_acl;
-
-	ret = jffs2_init_security(inode, dir_i);
-	if (ret)
-		goto fail_acl;
-	ret = jffs2_init_acl(inode, acl);
 	if (ret)
 		goto fail;
 
@@ -231,8 +222,6 @@ static int jffs2_create(struct inode *dir_i, struct dentry *dentry, int mode,
 		  inode->i_ino, inode->i_mode, inode->i_nlink, f->inocache->nlink, inode->i_mapping->nrpages));
 	return 0;
 
- fail_acl:
-	posix_acl_release(acl);
  fail:
 	make_bad_inode(inode);
 	iput(inode);
@@ -309,7 +298,6 @@ static int jffs2_symlink (struct inode *dir_i, struct dentry *dentry, const char
 	struct jffs2_full_dirent *fd;
 	int namelen;
 	uint32_t alloclen;
-	struct posix_acl *acl;
 	int ret, targetlen = strlen(target);
 
 	/* FIXME: If you care. We'd need to use frags for the target
@@ -336,7 +324,7 @@ static int jffs2_symlink (struct inode *dir_i, struct dentry *dentry, const char
 		return ret;
 	}
 
-	inode = jffs2_new_inode(dir_i, S_IFLNK | S_IRWXUGO, ri, &acl);
+	inode = jffs2_new_inode(dir_i, S_IFLNK | S_IRWXUGO, ri);
 
 	if (IS_ERR(inode)) {
 		jffs2_free_raw_inode(ri);
@@ -366,7 +354,6 @@ static int jffs2_symlink (struct inode *dir_i, struct dentry *dentry, const char
 		up(&f->sem);
 		jffs2_complete_reservation(c);
 		jffs2_clear_inode(inode);
-		posix_acl_release(acl);
 		return PTR_ERR(fn);
 	}
 
@@ -377,7 +364,6 @@ static int jffs2_symlink (struct inode *dir_i, struct dentry *dentry, const char
 		up(&f->sem);
 		jffs2_complete_reservation(c);
 		jffs2_clear_inode(inode);
-		posix_acl_release(acl);
 		return -ENOMEM;
 	}
 
@@ -395,10 +381,9 @@ static int jffs2_symlink (struct inode *dir_i, struct dentry *dentry, const char
 	ret = jffs2_init_security(inode, dir_i);
 	if (ret) {
 		jffs2_clear_inode(inode);
-		posix_acl_release(acl);
 		return ret;
 	}
-	ret = jffs2_init_acl(inode, acl);
+	ret = jffs2_init_acl_post(inode);
 	if (ret) {
 		jffs2_clear_inode(inode);
 		return ret;
@@ -476,7 +461,6 @@ static int jffs2_mkdir (struct inode *dir_i, struct dentry *dentry, int mode)
 	struct jffs2_full_dirent *fd;
 	int namelen;
 	uint32_t alloclen;
-	struct posix_acl *acl;
 	int ret;
 
 	mode |= S_IFDIR;
@@ -499,7 +483,7 @@ static int jffs2_mkdir (struct inode *dir_i, struct dentry *dentry, int mode)
 		return ret;
 	}
 
-	inode = jffs2_new_inode(dir_i, mode, ri, &acl);
+	inode = jffs2_new_inode(dir_i, mode, ri);
 
 	if (IS_ERR(inode)) {
 		jffs2_free_raw_inode(ri);
@@ -526,7 +510,6 @@ static int jffs2_mkdir (struct inode *dir_i, struct dentry *dentry, int mode)
 		up(&f->sem);
 		jffs2_complete_reservation(c);
 		jffs2_clear_inode(inode);
-		posix_acl_release(acl);
 		return PTR_ERR(fn);
 	}
 	/* No data here. Only a metadata node, which will be
@@ -540,10 +523,9 @@ static int jffs2_mkdir (struct inode *dir_i, struct dentry *dentry, int mode)
 	ret = jffs2_init_security(inode, dir_i);
 	if (ret) {
 		jffs2_clear_inode(inode);
-		posix_acl_release(acl);
 		return ret;
 	}
-	ret = jffs2_init_acl(inode, acl);
+	ret = jffs2_init_acl_post(inode);
 	if (ret) {
 		jffs2_clear_inode(inode);
 		return ret;
@@ -639,7 +621,6 @@ static int jffs2_mknod (struct inode *dir_i, struct dentry *dentry, int mode, de
 	union jffs2_device_node dev;
 	int devlen = 0;
 	uint32_t alloclen;
-	struct posix_acl *acl;
 	int ret;
 
 	if (!new_valid_dev(rdev))
@@ -666,7 +647,7 @@ static int jffs2_mknod (struct inode *dir_i, struct dentry *dentry, int mode, de
 		return ret;
 	}
 
-	inode = jffs2_new_inode(dir_i, mode, ri, &acl);
+	inode = jffs2_new_inode(dir_i, mode, ri);
 
 	if (IS_ERR(inode)) {
 		jffs2_free_raw_inode(ri);
@@ -695,7 +676,6 @@ static int jffs2_mknod (struct inode *dir_i, struct dentry *dentry, int mode, de
 		up(&f->sem);
 		jffs2_complete_reservation(c);
 		jffs2_clear_inode(inode);
-		posix_acl_release(acl);
 		return PTR_ERR(fn);
 	}
 	/* No data here. Only a metadata node, which will be
@@ -709,10 +689,9 @@ static int jffs2_mknod (struct inode *dir_i, struct dentry *dentry, int mode, de
 	ret = jffs2_init_security(inode, dir_i);
 	if (ret) {
 		jffs2_clear_inode(inode);
-		posix_acl_release(acl);
 		return ret;
 	}
-	ret = jffs2_init_acl(inode, acl);
+	ret = jffs2_init_acl_post(inode);
 	if (ret) {
 		jffs2_clear_inode(inode);
 		return ret;
diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index dd64ddc..7a85017 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -402,8 +402,7 @@ void jffs2_write_super (struct super_block *sb)
 
 /* jffs2_new_inode: allocate a new inode and inocache, add it to the hash,
    fill in the raw_inode while you're at it. */
-struct inode *jffs2_new_inode (struct inode *dir_i, int mode, struct jffs2_raw_inode *ri,
-			       struct posix_acl **acl)
+struct inode *jffs2_new_inode (struct inode *dir_i, int mode, struct jffs2_raw_inode *ri)
 {
 	struct inode *inode;
 	struct super_block *sb = dir_i->i_sb;
@@ -438,19 +437,11 @@ struct inode *jffs2_new_inode (struct inode *dir_i, int mode, struct jffs2_raw_i
 
 	/* POSIX ACLs have to be processed now, at least partly.
 	   The umask is only applied if there's no default ACL */
-	if (!S_ISLNK(mode)) {
-		*acl = jffs2_get_acl(dir_i, ACL_TYPE_DEFAULT);
-		if (IS_ERR(*acl)) {
-			make_bad_inode(inode);
-			iput(inode);
-			inode = (void *)*acl;
-			*acl = NULL;
-			return inode;
-		}
-		if (!(*acl))
-			mode &= ~current->fs->umask;
-	} else {
-		*acl = NULL;
+	ret = jffs2_init_acl_pre(dir_i, inode, &mode);
+	if (ret) {
+	    make_bad_inode(inode);
+	    iput(inode);
+	    return ERR_PTR(ret);
 	}
 	ret = jffs2_do_new_inode (c, f, mode, ri);
 	if (ret) {
diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
index f6743a9..bf64686 100644
--- a/fs/jffs2/os-linux.h
+++ b/fs/jffs2/os-linux.h
@@ -173,15 +173,13 @@ int jffs2_ioctl(struct inode *, struct file *, unsigned int, unsigned long);
 extern const struct inode_operations jffs2_symlink_inode_operations;
 
 /* fs.c */
-struct posix_acl;
-
 int jffs2_setattr (struct dentry *, struct iattr *);
 int jffs2_do_setattr (struct inode *, struct iattr *);
 void jffs2_read_inode (struct inode *);
 void jffs2_clear_inode (struct inode *);
 void jffs2_dirty_inode(struct inode *inode);
 struct inode *jffs2_new_inode (struct inode *dir_i, int mode,
-			       struct jffs2_raw_inode *ri, struct posix_acl **acl);
+			       struct jffs2_raw_inode *ri);
 int jffs2_statfs (struct dentry *, struct kstatfs *);
 void jffs2_write_super (struct super_block *);
 int jffs2_remount_fs (struct super_block *, int *, char *);
diff --git a/fs/jffs2/write.c b/fs/jffs2/write.c
index 664c164..28ed818 100644
--- a/fs/jffs2/write.c
+++ b/fs/jffs2/write.c
@@ -454,6 +454,14 @@ int jffs2_do_create(struct jffs2_sb_info *c, struct jffs2_inode_info *dir_f, str
 
 	up(&f->sem);
 	jffs2_complete_reservation(c);
+
+	ret = jffs2_init_security(&f->vfs_inode, &dir_f->vfs_inode);
+	if (ret)
+		return ret;
+	ret = jffs2_init_acl_post(&f->vfs_inode);
+	if (ret)
+		return ret;
+
 	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &alloclen,
 				ALLOC_NORMAL, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
 

--------------040805020703020908010400--
