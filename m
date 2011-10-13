Received: from mail.grid-net.com ([97.65.115.2])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1REOty-0007n6-Er
	for linux-mtd@lists.infradead.org; Thu, 13 Oct 2011 17:20:22 +0000
Subject: [PATCH  resend] Add security.selinux XATTR support for the UBIFS.
	Also fix couple of bugs in UBIFS extended attribute storage
From: Subodh Nijsure <snijsure@grid-net.com>
To: Artem Bityutskiy <artem.bityutskiy@intel.com>, mtd
	<linux-mtd@lists.infradead.org>, Adrian Hunter <adrian.hunter@intel.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 13 Oct 2011 10:16:04 -0700
Message-ID: <1318526164.26165.16.camel@subodh-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: snijsure@grid-net.com
Reply-To: snijsure@grid-net.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[ Please disregard previous patch I had posted, it had a bug, and I
didn't list how I tested
this.]

Add security.selinux extended attribute support for UBIFS.
This will allow embedded system using ubifs to enable SELinux

TESTING: Tested on MX25, MX28 based platforms using Micron
MT29F2G08ABAEAH4 NAND
         With these change we are able to label UBIFS filesystem with
security.selinux
         and run system with selinux enabled.

I have used following script to test to mount UBIFS, create files,
assign them extended
attribute using selinux tools and verify that correct extended
attributes have been assigned.
You need to enable SElinux in the kernel config to test this.

Please let me know if I need to do any additional tests to prove that
this change has no side effects...

#!/bin/sh
i=0
umount ./flash
while [ $i -lt 1000 ]
do
        mount -t ubifs ubi0:root-1 -o sync ./flash/
        rm -rf ./flash/test1
        mkdir ./flash/test1
        echo "Try $i started"
        j=0
        while [ $j -lt 100 ]
        do
                touch ./flash/test1/file$j
                #Assign xattr
                setfilecon
system_u:object_r:gridnet_conf_t ./flash/test1/file$j
                label=`ls -lZ ./flash/test1/file$j | awk '{ print $7 }'`
                if [ $label != "system_u:object_r:gridnet_conf_t" ];
then
                        echo "Failed to assign initial label"
                        exit 1
                fi
                #Write some data to file system
                cp test-data ./flash/test1/file$j
                #Update xattr
                setfilecon
system_u:object_r:gridnet_data_t ./flash/test1/file$j
                label=`ls -lZ ./flash/test1/file$j | awk '{ print $7 }'`
                if [ $label != "system_u:object_r:gridnet_data_t" ];
then
                        echo "Failed to update label"
                        exit 1
                fi
                j=`expr $j + 1`
        done
        sync
        umount ./flash
        i=`expr $i + 1`
done


Signed-off-by: Subodh Nijsure <snijsure@grid-net.com>
---
 fs/ubifs/dir.c     |   50 +++++++++++++++++++++++++++
 fs/ubifs/file.c    |    6 +++
 fs/ubifs/journal.c |   12 +++++--
 fs/ubifs/super.c   |    1 +
 fs/ubifs/ubifs.h   |    6 +++
 fs/ubifs/xattr.c   |   97
++++++++++++++++++++++++++++++++++++++++++++++-----
 6 files changed, 159 insertions(+), 13 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 6834920..ef98495 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -253,6 +253,52 @@ out:
        return ERR_PTR(err);
 }

+static void ubifs_init_security(struct dentry *dentry, struct inode
*inode,
+               struct inode *dir)
+{
+       int err;
+       char *name;
+       void *value = NULL;
+       size_t len = 0;
+       struct ubifs_inode *dir_ui = ubifs_inode(dir);
+       const struct qstr *qname = &dentry->d_name;
+
+       mutex_lock(&dir_ui->ui_mutex);
+       mutex_lock(&dentry->d_inode->i_mutex);
+       err = security_inode_init_security(inode, dir, qname, &name,
&value,
+               &len);
+       if (err) {
+               if (err == -EOPNOTSUPP)
+                       return;
+               ubifs_err("unable to retrieve security context, error %
d", err);
+               mutex_unlock(&dentry->d_inode->i_mutex);
+               mutex_unlock(&dir_ui->ui_mutex);
+               return;
+       }
+
+       if (strncmp(name, "selinux", strlen("selinux")) == 0) {
+               kfree(name);
+               name = kstrdup("security.selinux", GFP_NOFS);
+               if (!name) {
+                       ubifs_err("unable to set security context %.*s
error",
+                               dentry->d_name.len,
dentry->d_name.name);
+                       kfree(value);
+                       mutex_unlock(&dentry->d_inode->i_mutex);
+                       mutex_unlock(&dir_ui->ui_mutex);
+                       return;
+               }
+       }
+
+       err = ubifs_setxattr(dentry, name, value, len, 0);
+       if (err)
+               ubifs_err("unable to set security context name %.*s
error %d",
+                       dentry->d_name.len, dentry->d_name.name, err);
+       kfree(name);
+       kfree(value);
+       mutex_unlock(&dentry->d_inode->i_mutex);
+       mutex_unlock(&dir_ui->ui_mutex);
+}
+
 static int ubifs_create(struct inode *dir, struct dentry *dentry, int
mode,
                        struct nameidata *nd)
 {
@@ -293,6 +339,7 @@ static int ubifs_create(struct inode *dir, struct
dentry *dentry, int mode,
        ubifs_release_budget(c, &req);
        insert_inode_hash(inode);
        d_instantiate(dentry, inode);
+       ubifs_init_security(dentry, inode, dir);
        return 0;

 out_cancel:
@@ -754,6 +801,7 @@ static int ubifs_mkdir(struct inode *dir, struct
dentry *dentry, int mode)

        ubifs_release_budget(c, &req);
        d_instantiate(dentry, inode);
+       ubifs_init_security(dentry, inode, dir);
        return 0;

 out_cancel:
@@ -831,6 +879,7 @@ static int ubifs_mknod(struct inode *dir, struct
dentry *dentry,
        ubifs_release_budget(c, &req);
        insert_inode_hash(inode);
        d_instantiate(dentry, inode);
+       ubifs_init_security(dentry, inode, dir);
        return 0;

 out_cancel:
@@ -907,6 +956,7 @@ static int ubifs_symlink(struct inode *dir, struct
dentry *dentry,
        ubifs_release_budget(c, &req);
        insert_inode_hash(inode);
        d_instantiate(dentry, inode);
+       ubifs_init_security(dentry, inode, dir);
        return 0;

 out_cancel:
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index f9c234b..ba33491 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1575,6 +1575,12 @@ const struct inode_operations
ubifs_symlink_inode_operations = {
        .follow_link = ubifs_follow_link,
        .setattr     = ubifs_setattr,
        .getattr     = ubifs_getattr,
+#ifdef CONFIG_UBIFS_FS_XATTR
+       .setxattr    = ubifs_symlink_setxattr,
+       .getxattr    = ubifs_symlink_getxattr,
+       .listxattr   = ubifs_listxattr,
+       .removexattr = ubifs_removexattr,
+#endif
 };

 const struct file_operations ubifs_file_operations = {
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index cef0460..1342752 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -553,7 +553,8 @@ int ubifs_jnl_update(struct ubifs_info *c, const
struct inode *dir,

        dbg_jnl("ino %lu, dent '%.*s', data len %d in dir ino %lu",
                inode->i_ino, nm->len, nm->name, ui->data_len,
dir->i_ino);
-       ubifs_assert(dir_ui->data_len == 0);
+       if (!xent)
+               ubifs_assert(dir_ui->data_len == 0);
        ubifs_assert(mutex_is_locked(&dir_ui->ui_mutex));

        dlen = UBIFS_DENT_NODE_SZ + nm->len + 1;
@@ -572,7 +573,11 @@ int ubifs_jnl_update(struct ubifs_info *c, const
struct inode *dir,

        aligned_dlen = ALIGN(dlen, 8);
        aligned_ilen = ALIGN(ilen, 8);
-       len = aligned_dlen + aligned_ilen + UBIFS_INO_NODE_SZ;
+       /* Make sure to account for dir_ui+data_len in length
calculation
+        * in case there is extended attribute.
+       */
+       len = aligned_dlen + aligned_ilen + UBIFS_INO_NODE_SZ
+               + dir_ui->data_len;
        dent = kmalloc(len, GFP_NOFS);
        if (!dent)
                return -ENOMEM;
@@ -649,7 +654,8 @@ int ubifs_jnl_update(struct ubifs_info *c, const
struct inode *dir,

        ino_key_init(c, &ino_key, dir->i_ino);
        ino_offs += aligned_ilen;
-       err = ubifs_tnc_add(c, &ino_key, lnum, ino_offs,
UBIFS_INO_NODE_SZ);
+       err = ubifs_tnc_add(c, &ino_key, lnum, ino_offs,
UBIFS_INO_NODE_SZ +
+                       dir_ui->data_len);
        if (err)
                goto out_ro;

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index b281212..025e5d0 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2062,6 +2062,7 @@ static int ubifs_fill_super(struct super_block
*sb, void *data, int silent)
        if (c->max_inode_sz > MAX_LFS_FILESIZE)
                sb->s_maxbytes = c->max_inode_sz = MAX_LFS_FILESIZE;
        sb->s_op = &ubifs_super_operations;
+       sb->s_xattr = ubifs_xattr_handlers;

        mutex_lock(&c->umount_mutex);
        err = mount_ubifs(c);
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 27f2255..1e00ec5 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -36,6 +36,7 @@
 #include <linux/mtd/ubi.h>
 #include <linux/pagemap.h>
 #include <linux/backing-dev.h>
+#include <linux/security.h>
 #include "ubifs-media.h"

 /* Version of this UBIFS implementation */
@@ -1457,6 +1458,7 @@ extern spinlock_t ubifs_infos_lock;
 extern atomic_long_t ubifs_clean_zn_cnt;
 extern struct kmem_cache *ubifs_inode_slab;
 extern const struct super_operations ubifs_super_operations;
+extern const struct xattr_handler *ubifs_xattr_handlers[];
 extern const struct address_space_operations
ubifs_file_address_operations;
 extern const struct file_operations ubifs_file_operations;
 extern const struct inode_operations ubifs_file_inode_operations;
@@ -1741,8 +1743,12 @@ int ubifs_getattr(struct vfsmount *mnt, struct
dentry *dentry,
 /* xattr.c */
 int ubifs_setxattr(struct dentry *dentry, const char *name,
                   const void *value, size_t size, int flags);
+int ubifs_symlink_setxattr(struct dentry *dentry, const char *name,
+                  const void *value, size_t size, int flags);
 ssize_t ubifs_getxattr(struct dentry *dentry, const char *name, void
*buf,
                       size_t size);
+ssize_t ubifs_symlink_getxattr(struct dentry *dentry, const char *name,
+                      void *buf, size_t size);
 ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t
size);
 int ubifs_removexattr(struct dentry *dentry, const char *name);

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 16f19f5..cfacab9 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -211,11 +211,11 @@ static int change_xattr(struct ubifs_info *c,
struct inode *host,
        }
        memcpy(ui->data, value, size);
        inode->i_size = ui->ui_size = size;
-       ui->data_len = size;

        mutex_lock(&host_ui->ui_mutex);
        host->i_ctime = ubifs_current_time(host);
        host_ui->xattr_size -= CALC_XATTR_BYTES(ui->data_len);
+       ui->data_len = size;
        host_ui->xattr_size += CALC_XATTR_BYTES(size);

        /*
@@ -295,18 +295,16 @@ static struct inode *iget_xattr(struct ubifs_info
*c, ino_t inum)
        return ERR_PTR(-EINVAL);
 }

-int ubifs_setxattr(struct dentry *dentry, const char *name,
+static int __ubifs_setxattr(struct inode *host, const char *name,
                   const void *value, size_t size, int flags)
 {
-       struct inode *inode, *host = dentry->d_inode;
+       struct inode *inode;
        struct ubifs_info *c = host->i_sb->s_fs_info;
        struct qstr nm = { .name = name, .len = strlen(name) };
        struct ubifs_dent_node *xent;
        union ubifs_key key;
        int err, type;

-       dbg_gen("xattr '%s', host ino %lu ('%.*s'), size %zd", name,
-               host->i_ino, dentry->d_name.len, dentry->d_name.name,
size);
        ubifs_assert(mutex_is_locked(&host->i_mutex));

        if (size > UBIFS_MAX_INO_DATA)
@@ -358,10 +356,29 @@ out_free:
        return err;
 }

-ssize_t ubifs_getxattr(struct dentry *dentry, const char *name, void
*buf,
+int ubifs_symlink_setxattr(struct dentry *dentry, const char *name,
+                  const void *value, size_t size, int flags)
+{
+       struct inode *host = dentry->d_inode;
+       dbg_gen("xattr '%s', host ino %lu ('%.*s'), size %zd", name,
+               host->i_ino, dentry->d_name.len, dentry->d_name.name,
size);
+       return __ubifs_setxattr(host, name, value, size, flags);
+}
+
+int ubifs_setxattr(struct dentry *dentry, const char *name,
+                  const void *value, size_t size, int flags)
+{
+       struct inode *host = dentry->d_inode;
+       dbg_gen("xattr '%s', host ino %lu ('%.*s'), size %zd", name,
+               host->i_ino, dentry->d_name.len, dentry->d_name.name,
size);
+       return __ubifs_setxattr(host, name, value, size, flags);
+}
+
+static
+ssize_t __ubifs_getxattr(struct inode *host, const char *name, void
*buf,
                       size_t size)
 {
-       struct inode *inode, *host = dentry->d_inode;
+       struct inode *inode;
        struct ubifs_info *c = host->i_sb->s_fs_info;
        struct qstr nm = { .name = name, .len = strlen(name) };
        struct ubifs_inode *ui;
@@ -369,9 +386,6 @@ ssize_t ubifs_getxattr(struct dentry *dentry, const
char *name, void *buf,
        union ubifs_key key;
        int err;

-       dbg_gen("xattr '%s', ino %lu ('%.*s'), buf size %zd", name,
-               host->i_ino, dentry->d_name.len, dentry->d_name.name,
size);
-
        err = check_namespace(&nm);
        if (err < 0)
                return err;
@@ -418,6 +432,25 @@ out_unlock:
        return err;
 }

+ssize_t ubifs_symlink_getxattr(struct dentry *dentry, const char *name,
+               void *buf, size_t size)
+{
+       struct inode *host = dentry->d_inode;
+       dbg_gen("xattr '%s', ino %lu ('%.*s'), buf size %zd", name,
+               host->i_ino, dentry->d_name.len, dentry->d_name.name,
size);
+       return __ubifs_getxattr(host, name, buf, size);
+}
+
+ssize_t ubifs_getxattr(struct dentry *dentry, const char *name, void
*buf,
+                      size_t size)
+{
+       struct inode *host = dentry->d_inode;
+       dbg_gen("xattr '%s', ino %lu ('%.*s'), buf size %zd", name,
+               host->i_ino, dentry->d_name.len, dentry->d_name.name,
size);
+       return __ubifs_getxattr(host, name, buf, size);
+}
+
+
 ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t
size)
 {
        union ubifs_key key;
@@ -570,3 +603,47 @@ out_free:
        kfree(xent);
        return err;
 }
+
+size_t
+ubifs_security_listxattr(struct dentry *d, char *list, size_t
list_size,
+               const char *name, size_t name_len, int flags)
+{
+       const int prefix_len = XATTR_SECURITY_PREFIX_LEN;
+       const size_t total_len = prefix_len + name_len + 1;
+       if (list && total_len <= list_size) {
+               memcpy(list, XATTR_SECURITY_PREFIX, prefix_len);
+               memcpy(list+prefix_len, name, name_len);
+               list[prefix_len + name_len] = '\0';
+       }
+       return total_len;
+}
+
+
+int ubifs_security_getxattr(struct dentry *d, const char *name,
+               void *buffer, size_t size, int flags)
+{
+       if (strcmp(name, "") == 0)
+               return -EINVAL;
+       return __ubifs_getxattr(d->d_inode, XATTR_NAME_SELINUX, buffer,
size);
+}
+
+int ubifs_security_setxattr(struct dentry *d, const char *name,
+       const void *value, size_t size, int flags, int handler_flags)
+{
+       if (strcmp(name, "") == 0)
+               return -EINVAL;
+       return __ubifs_setxattr(d->d_inode, XATTR_NAME_SELINUX, value,
+                       size, flags);
+}
+
+struct xattr_handler ubifs_xattr_security_handler = {
+       .prefix = XATTR_SECURITY_PREFIX,
+       .list   = ubifs_security_listxattr,
+       .get    = ubifs_security_getxattr,
+       .set    = ubifs_security_setxattr,
+};
+
+const struct xattr_handler *ubifs_xattr_handlers[] = {
+       &ubifs_xattr_security_handler,
+       NULL
+};
--
1.7.4.1
