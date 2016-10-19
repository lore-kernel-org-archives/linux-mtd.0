Received: from mail-ua0-f181.google.com ([209.85.217.181])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bwrxG-0001Qo-2n
 for linux-mtd@lists.infradead.org; Wed, 19 Oct 2016 14:34:56 +0000
Received: by mail-ua0-f181.google.com with SMTP id m11so10892409uab.3
 for <linux-mtd@lists.infradead.org>; Wed, 19 Oct 2016 07:34:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <443b11a2-729a-32ec-0a6f-5a3276290329@nod.at>
References: <1476046382-19185-1-git-send-email-pascal.eberhard@gmail.com>
 <443b11a2-729a-32ec-0a6f-5a3276290329@nod.at>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 19 Oct 2016 16:34:30 +0200
Message-ID: <CAHc6FU7Sh3cX2NAs6bu1jBWQwwpQK0OLsLMAEZMpzocb7L5teg@mail.gmail.com>
Subject: Re: [PATCH] ubifs: implement POSIX Access Control Lists (ACLs)
To: Pascal Eberhard <pascal.eberhard@gmail.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Josef Bacik <josef@redhat.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pascal,

On Tue, Oct 18, 2016 at 11:32 PM, Richard Weinberger <richard@nod.at> wrote:
> Pascal,
>
> On 09.10.2016 22:53, Pascal Eberhard wrote:
>> This patch implements POSIX Access Control Lists (ACLs) in UBIFS.
>> It uses posix_acl_(access|default)_xattr_handler ACL generic handlers
>> as xattr handlers are now used in UBIFS.
>
> Cool! :)
> CC'ing Andreas, maybe he also has comments.

please run this through xfstests as well. Note the following fixes /
improvements I've made in the course of reviewing this; they've
obviously not been merged, yet:

  https://github.com/andreas-gruenbacher/xfsprogs-dev/commits/io
  https://github.com/andreas-gruenbacher/xfstests/commits/tmpfile

>> Signed-off-by: Pascal Eberhard <pascal.eberhard@gmail.com>
>> ---
>>  fs/ubifs/Kconfig  |  13 +++++
>>  fs/ubifs/Makefile |   1 +
>>  fs/ubifs/acl.c    | 143 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  fs/ubifs/dir.c    |  22 +++++++++
>>  fs/ubifs/file.c   |   9 ++++
>>  fs/ubifs/super.c  |  15 ++++++
>>  fs/ubifs/ubifs.h  |  18 +++++++
>>  fs/ubifs/xattr.c  |  11 +++--
>>  8 files changed, 229 insertions(+), 3 deletions(-)
>>  create mode 100644 fs/ubifs/acl.c
>>
>> diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
>> index 7ff7712..39119e5 100644
>> --- a/fs/ubifs/Kconfig
>> +++ b/fs/ubifs/Kconfig
>> @@ -50,3 +50,16 @@ config UBIFS_ATIME_SUPPORT
>>         strictatime is the "heavy", relatime is "lighter", etc.
>>
>>         If unsure, say 'N'
>> +
>> +config UBIFS_FS_POSIX_ACL
>> +     bool "UBIFS POSIX Access Control Lists"
>> +     depends on UBIFS_FS
>> +     select FS_POSIX_ACL
>> +     help
>> +       POSIX Access Control Lists (ACLs) support permissions for users and
>> +       groups beyond the owner/group/world scheme.
>> +
>> +       To learn more about Access Control Lists, visit the POSIX ACLs for
>> +       Linux website <http://acl.bestbits.at/>.
>> +
>> +       If you don't know what Access Control Lists are, say N
>> diff --git a/fs/ubifs/Makefile b/fs/ubifs/Makefile
>> index c54a243..af7a83f 100644
>> --- a/fs/ubifs/Makefile
>> +++ b/fs/ubifs/Makefile
>> @@ -5,3 +5,4 @@ ubifs-y += tnc.o master.o scan.o replay.o log.o commit.o gc.o orphan.o
>>  ubifs-y += budget.o find.o tnc_commit.o compress.o lpt.o lprops.o
>>  ubifs-y += recovery.o ioctl.o lpt_commit.o tnc_misc.o xattr.o debug.o
>>  ubifs-y += misc.o
>> +ubifs-$(CONFIG_UBIFS_FS_POSIX_ACL) += acl.o
>> \ No newline at end of file
>> diff --git a/fs/ubifs/acl.c b/fs/ubifs/acl.c
>> new file mode 100644
>> index 0000000..a4d4734
>> --- /dev/null
>> +++ b/fs/ubifs/acl.c
>> @@ -0,0 +1,143 @@
>> +/*
>> + * This file is part of UBIFS.
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms of the GNU General Public License version 2 as published by
>> + * the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful, but WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>> + * more details.
>> + *
>> + */
>> +
>> +#include <linux/fs.h>
>
> ubifs.h includes this already.
>
>> +#include <linux/xattr.h>
>
> Ditto.
>
>> +#include <linux/posix_acl_xattr.h>
>> +
>> +#include "ubifs.h"
>> +
>> +struct posix_acl *ubifs_get_acl(struct inode *inode, int type)
>> +{
>> +     int size;
>> +     const char *name;
>> +     char *value = NULL;
>> +     struct posix_acl *acl;
>> +
>> +     switch (type) {
>> +     case ACL_TYPE_ACCESS:
>> +             name = XATTR_NAME_POSIX_ACL_ACCESS;
>> +             break;
>> +     case ACL_TYPE_DEFAULT:
>> +             name = XATTR_NAME_POSIX_ACL_DEFAULT;
>> +             break;
>> +     default:
>> +             return ERR_PTR(-EINVAL);
>> +     }
>> +
>> +     size = __ubifs_getxattr(inode, name, NULL, 0);
>> +     if (size > 0) {
>> +             value = kzalloc(size, GFP_KERNEL);
>> +             if (!value)
>> +                     return ERR_PTR(-ENOMEM);
>> +             size = __ubifs_getxattr(inode, name, value, size);
>> +     }
>> +     if (size > 0)
>> +             acl = posix_acl_from_xattr(&init_user_ns, value, size);
>> +     else if (size == -ERANGE || size == -ENODATA || size == 0)
>> +             acl = NULL;
>> +     else
>> +             acl = ERR_PTR(size);
>> +
>> +     kfree(value);
>> +     if (!IS_ERR(acl))
>> +             set_cached_acl(inode, type, acl);

The get_acl inode operation should no longer call set_cached_acl; the
cached ACL is updated automatically. (It's correct to use
set_cached_acl in the set_acl inode operation though.)

>> +
>> +     return acl;
>> +}
>> +
>> +int ubifs_set_acl(struct inode *inode, struct posix_acl *acl, int type)
>> +{
>> +     int ret;
>> +     int size = 0;
>> +     const char *name;
>> +     char *value = NULL;
>> +     int flags = 0;
>> +
>> +     switch (type) {
>> +     case ACL_TYPE_ACCESS:
>> +             name = XATTR_NAME_POSIX_ACL_ACCESS;
>> +             if (acl) {
>> +                     ret = posix_acl_equiv_mode(acl, &inode->i_mode);
>> +                     if (ret < 0)
>> +                             return ret;
>> +                     if (ret == 0)
>> +                             acl = NULL;
>> +             }
>> +             ret = 0;
>> +             break;
>> +     case ACL_TYPE_DEFAULT:
>> +             if (!S_ISDIR(inode->i_mode))
>> +                     return acl ? -EINVAL : 0;
>> +             name = XATTR_NAME_POSIX_ACL_DEFAULT;
>> +             break;
>> +     default:
>> +             return -EINVAL;
>> +     }
>> +
>> +     if (acl) {
>> +             size = posix_acl_xattr_size(acl->a_count);
>> +             value = kmalloc(size, GFP_KERNEL);
>> +             if (!value)
>> +                     return -ENOMEM;
>> +
>> +             ret = posix_acl_to_xattr(&init_user_ns, acl, value, size);
>> +             if (ret < 0)
>> +                     goto out;
>> +     }
>> +
>> +     if (size == 0)
>> +             flags = XATTR_REPLACE;
>> +     ret = __ubifs_setxattr(inode, name, value, size, flags);
>> +
>> +out:
>> +     kfree(value);
>> +     if (!ret)
>> +             set_cached_acl(inode, type, acl);
>> +
>> +     return ret;
>> +}
>> +
>> +/*
>> + * Initialize the ACLs of a new inode.
>
> Please use the Javadoc style we use for all UBIFS functions.
> (applies to other functions too in this patch)-
>
>> + */
>> +int ubifs_init_acl(struct inode *dir, struct inode *inode)
>> +{
>> +     struct posix_acl *default_acl, *acl;
>> +     int ret = 0;
>> +
>> +     ret = posix_acl_create(dir, &inode->i_mode, &default_acl, &acl);
>> +     if (ret)
>> +             return ret;
>> +
>> +     if (default_acl) {
>> +             inode_lock(inode);

Why the inode locking here?

>> +             ret = ubifs_set_acl(inode, default_acl, ACL_TYPE_DEFAULT);
>> +             inode_unlock(inode);
>> +             posix_acl_release(default_acl);
>> +     }
>> +
>> +     if (acl) {
>> +             if (!ret) {
>> +                     inode_lock(inode);

Same here.

>> +                     ret = ubifs_set_acl(inode, acl, ACL_TYPE_ACCESS);
>> +                     inode_unlock(inode);
>> +             }
>> +             posix_acl_release(acl);
>> +     }
>> +
>> +     if (!default_acl && !acl)
>> +             cache_no_acl(inode);

This call to cache_no_acl doesn't make sense; please check. It may be
wrong in btrfs as well; copying Josef for that.

>> +     return ret;
>> +}
>> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
>> index ccd9128..a2e5609 100644
>> --- a/fs/ubifs/dir.c
>> +++ b/fs/ubifs/dir.c
>> @@ -270,6 +270,10 @@ static int ubifs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
>>               goto out_budg;
>>       }
>>
>> +     err = ubifs_init_acl(dir, inode);
>> +     if (err)
>> +             goto out_inode;
>> +

The pattern ubifs_budget_space / ubifs_new_inode / ubifs_init_acl /
ubifs_init_security repeats a number of times in the code, so it
should probably be put in a function.

>>       err = ubifs_init_security(dir, inode, &dentry->d_name);
>>       if (err)
>>               goto out_inode;
>> @@ -341,6 +345,10 @@ static int do_tmpfile(struct inode *dir, struct dentry *dentry,
>>               ubifs_assert(inode->i_op == &ubifs_file_inode_operations);
>>       }
>>
>> +     err = ubifs_init_acl(dir, inode);
>> +     if (err)
>> +             goto out_inode;
>
> Why do we need ACLs for O_TMPFILE?
>
>> +
>>       err = ubifs_init_security(dir, inode, &dentry->d_name);
>>       if (err)
>>               goto out_inode;
>> @@ -821,6 +829,10 @@ static int ubifs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
>>               goto out_budg;
>>       }
>>
>> +     err = ubifs_init_acl(dir, inode);
>> +     if (err)
>> +             goto out_inode;
>> +
>>       err = ubifs_init_security(dir, inode, &dentry->d_name);
>>       if (err)
>>               goto out_inode;
>> @@ -903,6 +915,10 @@ static int ubifs_mknod(struct inode *dir, struct dentry *dentry,
>>       ui->data = dev;
>>       ui->data_len = devlen;
>>
>> +     err = ubifs_init_acl(dir, inode);
>> +     if (err)
>> +             goto out_inode;
>> +
>>       err = ubifs_init_security(dir, inode, &dentry->d_name);
>>       if (err)
>>               goto out_inode;
>> @@ -985,6 +1001,10 @@ static int ubifs_symlink(struct inode *dir, struct dentry *dentry,
>>       ui->data_len = len;
>>       inode->i_size = ubifs_inode(inode)->ui_size = len;
>>
>> +     err = ubifs_init_acl(dir, inode);
>> +     if (err)
>> +             goto out_inode;
>
> Do we really need ACLs for symlinks too? I thought permissions for symlinks are irrelevant.
>
>>       err = ubifs_init_security(dir, inode, &dentry->d_name);
>>       if (err)
>>               goto out_inode;
>> @@ -1395,6 +1415,8 @@ const struct inode_operations ubifs_dir_inode_operations = {
>>       .update_time = ubifs_update_time,
>>  #endif
>>       .tmpfile     = ubifs_tmpfile,
>> +     .get_acl     = ubifs_get_acl,
>> +     .set_acl     = ubifs_set_acl,
>>  };
>>
>>  const struct file_operations ubifs_dir_operations = {
>> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
>> index 4ed270b..17f6098 100644
>> --- a/fs/ubifs/file.c
>> +++ b/fs/ubifs/file.c
>> @@ -53,6 +53,7 @@
>>  #include <linux/mount.h>
>>  #include <linux/slab.h>
>>  #include <linux/migrate.h>
>> +#include <linux/posix_acl.h>
>>
>>  static int read_block(struct inode *inode, void *addr, unsigned int block,
>>                     struct ubifs_data_node *dn)
>> @@ -1251,6 +1252,10 @@ static int do_setattr(struct ubifs_info *c, struct inode *inode,
>>               ubifs_release_budget(c, &req);
>>       if (IS_SYNC(inode))
>>               err = inode->i_sb->s_op->write_inode(inode, NULL);
>> +
>> +     if (!err && (attr->ia_valid & ATTR_MODE))
>> +             err = posix_acl_chmod(inode, inode->i_mode);
>> +
>>       return err;
>>  }
>>
>> @@ -1628,6 +1633,8 @@ const struct inode_operations ubifs_file_inode_operations = {
>>  #ifdef CONFIG_UBIFS_ATIME_SUPPORT
>>       .update_time = ubifs_update_time,
>>  #endif
>> +     .get_acl     = ubifs_get_acl,
>> +     .set_acl     = ubifs_set_acl,
>>  };
>>
>>  const struct inode_operations ubifs_symlink_inode_operations = {
>> @@ -1642,6 +1649,8 @@ const struct inode_operations ubifs_symlink_inode_operations = {
>>  #ifdef CONFIG_UBIFS_ATIME_SUPPORT
>>       .update_time = ubifs_update_time,
>>  #endif
>> +     .get_acl     = ubifs_get_acl,
>> +     .set_acl     = ubifs_set_acl,
>>  };
>>
>>  const struct file_operations ubifs_file_operations = {
>> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
>> index 4ec0510..8239dfd 100644
>> --- a/fs/ubifs/super.c
>> +++ b/fs/ubifs/super.c
>> @@ -444,6 +444,9 @@ static int ubifs_show_options(struct seq_file *s, struct dentry *root)
>>                          ubifs_compr_name(c->mount_opts.compr_type));
>>       }
>>
>> +     if (c->vfs_sb->s_flags & MS_POSIXACL)
>> +             seq_puts(s, ",acl");
>> +
>>       return 0;
>>  }
>>
>> @@ -929,6 +932,8 @@ enum {
>>       Opt_chk_data_crc,
>>       Opt_no_chk_data_crc,
>>       Opt_override_compr,
>> +     Opt_acl,
>> +     Opt_noacl,
>>       Opt_err,
>>  };
>>
>> @@ -940,6 +945,8 @@ static const match_table_t tokens = {
>>       {Opt_chk_data_crc, "chk_data_crc"},
>>       {Opt_no_chk_data_crc, "no_chk_data_crc"},
>>       {Opt_override_compr, "compr=%s"},
>> +     {Opt_acl, "acl"},
>> +     {Opt_noacl, "noacl"},
>>       {Opt_err, NULL},
>>  };
>>
>> @@ -1040,6 +1047,14 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
>>                       c->default_compr = c->mount_opts.compr_type;
>>                       break;
>>               }
>> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
>> +             case Opt_acl:
>> +                     c->vfs_sb->s_flags |= MS_POSIXACL;
>> +                     break;
>> +             case Opt_noacl:
>> +                     c->vfs_sb->s_flags &= ~MS_POSIXACL;
>> +                     break;
>> +#endif
>>               default:
>>               {
>>                       unsigned long flag;
>> diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
>> index 096035e..7935449 100644
>> --- a/fs/ubifs/ubifs.h
>> +++ b/fs/ubifs/ubifs.h
>> @@ -1743,6 +1743,24 @@ extern const struct xattr_handler *ubifs_xattr_handlers[];
>>  ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size);
>>  int ubifs_init_security(struct inode *dentry, struct inode *inode,
>>                       const struct qstr *qstr);
>> +ssize_t __ubifs_getxattr(struct inode *host, const char *name,
>> +                             void *buf, size_t size);
>> +int __ubifs_setxattr(struct inode *host, const char *name,
>> +                         const void *value, size_t size, int flags);
>> +
>> +/* acl.c */
>> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
>> +int ubifs_init_acl(struct inode *dir, struct inode *inode);
>> +int ubifs_set_acl(struct inode *inode, struct posix_acl *acl, int type);
>> +struct posix_acl *ubifs_get_acl(struct inode *inode, int type);
>> +#else
>> +static inline int ubifs_init_acl(struct inode *inode, struct inode *dir)
>> +{
>> +     return 0;
>> +}
>> +#define ubifs_get_acl NULL
>> +#define ubifs_set_acl NULL
>> +#endif
>>
>>  /* super.c */
>>  struct inode *ubifs_iget(struct super_block *sb, unsigned long inum);
>> diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
>> index 6c2f4d4..0a596a1 100644
>> --- a/fs/ubifs/xattr.c
>> +++ b/fs/ubifs/xattr.c
>> @@ -52,13 +52,14 @@
>>   * in the VFS inode cache. The xentries are cached in the LNC cache (see
>>   * tnc.c).
>>   *
>> - * ACL support is not implemented.
>> + * ACL support is now implemented.
>
> I think we can just drop that line now. :-)
>
>>   */
>>
>>  #include "ubifs.h"
>>  #include <linux/fs.h>
>>  #include <linux/slab.h>
>>  #include <linux/xattr.h>
>> +#include <linux/posix_acl_xattr.h>
>
> While we are here, these includes should also be cleaned up.
>
>>  /*
>>   * Limit the number of extended attributes per inode so that the total size
>> @@ -268,7 +269,7 @@ static struct inode *iget_xattr(struct ubifs_info *c, ino_t inum)
>>       return ERR_PTR(-EINVAL);
>>  }
>>
>> -static int __ubifs_setxattr(struct inode *host, const char *name,
>> +int __ubifs_setxattr(struct inode *host, const char *name,
>>                           const void *value, size_t size, int flags)
>>  {
>>       struct inode *inode;
>> @@ -328,7 +329,7 @@ out_free:
>>       return err;
>>  }
>>
>> -static ssize_t __ubifs_getxattr(struct inode *host, const char *name,
>> +ssize_t __ubifs_getxattr(struct inode *host, const char *name,
>>                               void *buf, size_t size)
>>  {
>>       struct inode *inode;
>> @@ -619,5 +620,9 @@ const struct xattr_handler *ubifs_xattr_handlers[] = {
>>       &ubifs_user_xattr_handler,
>>       &ubifs_trusted_xattr_handler,
>>       &ubifs_security_xattr_handler,
>> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
>> +     &posix_acl_access_xattr_handler,
>> +     &posix_acl_default_xattr_handler,
>> +#endif
>>       NULL
>>  };
>>
>
> Overall the patch does not look bad and I'm sure we can add it for v4.10 soon.
> I'm a bit confused since most stuff is not really UBIFS specific.
> Andreas, is just "normal" for ACL support? I thought most code is generic and already in VFS.

There are several filesystems like ubifs that use the xattr
representation as the on-disk format, so ubifs_get_acl and
ubifs_set_acl could be abstracted and shared across those filesystems.
The rest looks good.

Thanks,
Andreas
