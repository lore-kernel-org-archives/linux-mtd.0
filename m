Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YfI6t-0001fg-MS
 for linux-mtd@lists.infradead.org; Tue, 07 Apr 2015 01:15:26 +0000
Message-ID: <55232F60.3000904@huawei.com>
Date: Tue, 7 Apr 2015 09:14:08 +0800
From: Sheng Yong <shengyong1@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>, <adrian.hunter@intel.com>
Subject: Re: [RFC PATCH 2/3] UBIFS: ACL: add ACL support
References: <1427283965-86137-1-git-send-email-shengyong1@huawei.com>
 <1427283965-86137-3-git-send-email-shengyong1@huawei.com>
In-Reply-To: <1427283965-86137-3-git-send-email-shengyong1@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: snijsure@grid-net.com, ben.shelton@ni.com, hujianyang@huawei.com,
 terry.wilcox@ni.com, mkl@pengutronix.de, linux-mtd@lists.infradead.org,
 gratian.crisan@ni.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

# CCed some people maybe intrested in this :-)

thanks,
Sheng

On 3/25/2015 7:46 PM, Sheng Yong wrote:
> This implements ACL functionality. ACL is based on xattr.
> 
> Signed-off-by: Sheng Yong <shengyong1@huawei.com>
> ---
>  fs/ubifs/acl.c   | 316 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  fs/ubifs/dir.c   |   7 ++
>  fs/ubifs/file.c  |  14 +++
>  fs/ubifs/super.c |  15 +++
>  fs/ubifs/ubifs.h |   5 +
>  fs/ubifs/xattr.c |  27 ++++-
>  6 files changed, 383 insertions(+), 1 deletion(-)
>  create mode 100644 fs/ubifs/acl.c
> 
> diff --git a/fs/ubifs/acl.c b/fs/ubifs/acl.c
> new file mode 100644
> index 0000000..a4cde8f
> --- /dev/null
> +++ b/fs/ubifs/acl.c
> @@ -0,0 +1,316 @@
> +/*
> + * This file is part of UBIFS.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License version 2 as published by
> + * the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program; if not, write to the Free Software Foundation, Inc., 51
> + * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
> + *
> + */
> +
> +/*
> + * ACL is based on Extended Attribute.
> + */
> +
> +#include <linux/fs.h>
> +#include <linux/xattr.h>
> +#include <linux/posix_acl_xattr.h>
> +
> +#include "ubifs.h"
> +
> +#define UBIFS_ACL_VERSION	0x0001
> +
> +struct ubifs_acl_entry {
> +	__le16 e_tag;
> +	__le16 e_perm;
> +	__le32 e_id;
> +};
> +
> +struct ubifs_acl_entry_short {
> +	__le16 e_tag;
> +	__le16 e_perm;
> +};
> +
> +struct ubifs_acl_header {
> +	__le32 a_version;
> +};
> +
> +#define UBIFS_ACL_HEADER_SZ		sizeof(struct ubifs_acl_header)
> +#define UBIFS_ACL_ENTRY_SZ		sizeof(struct ubifs_acl_entry)
> +#define UBIFS_ACL_ENTRY_SHORT_SZ	sizeof(struct ubifs_acl_entry_short)
> +
> +static inline size_t acl_size(int count)
> +{
> +	if (count <= 4) {
> +		return UBIFS_ACL_HEADER_SZ +
> +			count * UBIFS_ACL_ENTRY_SHORT_SZ;
> +	} else {
> +		return UBIFS_ACL_HEADER_SZ +
> +			4 * UBIFS_ACL_ENTRY_SHORT_SZ +
> +			(count - 4) * UBIFS_ACL_ENTRY_SZ;
> +	}
> +}
> +
> +static inline int acl_count(size_t size)
> +{
> +	ssize_t s;
> +
> +	size -= UBIFS_ACL_HEADER_SZ;
> +	s = size - 4 * UBIFS_ACL_ENTRY_SHORT_SZ;
> +	if (s < 0) {
> +		if (size % UBIFS_ACL_ENTRY_SHORT_SZ)
> +			return -1;
> +		return size / UBIFS_ACL_ENTRY_SHORT_SZ;
> +	} else {
> +		if (s % UBIFS_ACL_ENTRY_SZ)
> +			return -1;
> +		return s / UBIFS_ACL_ENTRY_SZ + 4;
> +	}
> +}
> +
> +/* convert from in-memory ACL to on-flash ACL */
> +static void *acl_to_flash(const struct posix_acl *acl, size_t *size, int type)
> +{
> +	struct ubifs_acl_header *hdr;
> +	struct ubifs_acl_entry *uae;
> +	int i;
> +
> +	*size = acl_size(acl->a_count);
> +	hdr = kmalloc(*size, GFP_KERNEL);
> +	if (!hdr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	hdr->a_version = cpu_to_le32(UBIFS_ACL_VERSION);
> +	uae = (struct ubifs_acl_entry *) (hdr + 1);
> +
> +	for (i = 0; i < acl->a_count; i++) {
> +		const struct posix_acl_entry *ae = &acl->a_entries[i];
> +		uae->e_tag = cpu_to_le16(ae->e_tag);
> +		uae->e_perm = cpu_to_le16(ae->e_perm);
> +		switch (ae->e_tag) {
> +		case ACL_USER_OBJ:
> +		case ACL_GROUP_OBJ:
> +		case ACL_MASK:
> +		case ACL_OTHER:
> +			/* for the 4 options, id is not used */
> +			uae = (struct ubifs_acl_entry *) ((char *) uae +
> +						UBIFS_ACL_ENTRY_SHORT_SZ);
> +			break;
> +		case ACL_USER:
> +		{
> +			uid_t u = from_kuid(&init_user_ns, ae->e_uid);
> +			uae->e_id = cpu_to_le32(u);
> +			uae = (struct ubifs_acl_entry *) ((char *) uae +
> +						UBIFS_ACL_ENTRY_SZ);
> +			break;
> +		}
> +		case ACL_GROUP:
> +		{
> +			gid_t g = from_kgid(&init_user_ns, ae->e_gid);
> +			uae->e_id = cpu_to_le32(g);
> +			uae = (struct ubifs_acl_entry *) ((char *) uae +
> +						UBIFS_ACL_ENTRY_SZ);
> +			break;
> +		}
> +		default:
> +			goto fail;
> +		}
> +	}
> +
> +	return (void *) hdr;
> +
> +fail:
> +	kfree(hdr);
> +	return ERR_PTR(-EINVAL);
> +}
> +
> +/* convert from on-flash ACL to in-memory ACL */
> +static struct posix_acl *acl_from_flash(const void *value, size_t size)
> +{
> +	struct posix_acl *acl;
> +	struct ubifs_acl_header *hdr = (struct ubifs_acl_header *) value;
> +	struct ubifs_acl_entry *uae = (struct ubifs_acl_entry *) (hdr + 1);
> +	const char *end = value + size;
> +	int count, i;
> +
> +	if (!value)
> +		return NULL;
> +	if (size < UBIFS_ACL_HEADER_SZ)
> +		return ERR_PTR(-EINVAL);
> +	if (hdr->a_version != cpu_to_le32(UBIFS_ACL_VERSION))
> +		return ERR_PTR(-EINVAL);
> +
> +	count = acl_count(size);
> +	if (count < 0)
> +		return ERR_PTR(-EINVAL);
> +	if (count == 0)
> +		return NULL;
> +
> +	acl = posix_acl_alloc(count, GFP_KERNEL);
> +	if (!acl)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for (i = 0; i < count; i++) {
> +		if ((char *) uae > end)
> +			goto fail;
> +
> +		acl->a_entries[i].e_tag = le16_to_cpu(uae->e_tag);
> +		acl->a_entries[i].e_perm = le16_to_cpu(uae->e_perm);
> +		switch (acl->a_entries[i].e_tag) {
> +		case ACL_USER_OBJ:
> +		case ACL_GROUP_OBJ:
> +		case ACL_MASK:
> +		case ACL_OTHER:
> +			/* for the 4 options, no id */
> +			uae = (struct ubifs_acl_entry *) ((char *) uae +
> +						UBIFS_ACL_ENTRY_SHORT_SZ);
> +			break;
> +		case ACL_USER:
> +		{
> +			uid_t u = le32_to_cpu(uae->e_id);
> +			acl->a_entries[i].e_uid = make_kuid(&init_user_ns, u);
> +			uae = (struct ubifs_acl_entry *) ((char *) uae +
> +						UBIFS_ACL_ENTRY_SZ);
> +			break;
> +		}
> +		case ACL_GROUP:
> +		{
> +			gid_t g = le32_to_cpu(uae->e_id);
> +			acl->a_entries[i].e_gid = make_kgid(&init_user_ns, g);
> +			uae = (struct ubifs_acl_entry *) ((char *) uae +
> +						UBIFS_ACL_ENTRY_SZ);
> +			break;
> +		}
> +		default:
> +			goto fail;
> +		}
> +	}
> +
> +	if ((char *) uae != end)
> +		goto fail;
> +
> +	return acl;
> +
> +fail:
> +	posix_acl_release(acl);
> +	return ERR_PTR(-EINVAL);
> +}
> +
> +struct posix_acl *ubifs_get_acl(struct inode *inode, int type)
> +{
> +	struct posix_acl *acl;
> +	char *name, *value = NULL;
> +	int size = 0;
> +
> +	switch (type) {
> +	case ACL_TYPE_ACCESS:
> +		name = XATTR_NAME_POSIX_ACL_ACCESS;
> +		break;
> +	case ACL_TYPE_DEFAULT:
> +		name = XATTR_NAME_POSIX_ACL_DEFAULT;
> +		break;
> +	default:
> +		BUG();
> +	}
> +
> +	size = __ubifs_getxattr(inode, name, NULL, 0);
> +	if (size > 0) {
> +		value = kmalloc(size, GFP_KERNEL);
> +		if (!value)
> +			return ERR_PTR(-ENOMEM);
> +		size = __ubifs_getxattr(inode, name, value, size);
> +	}
> +	if (size > 0)
> +		acl = acl_from_flash(value, size);
> +	else if (size == -ENODATA)
> +		acl = NULL;
> +	else if (size < 0)
> +		return ERR_PTR(size);
> +
> +	kfree(value);
> +	if (!IS_ERR(acl))
> +		set_cached_acl(inode, type, acl);
> +
> +	return acl;
> +}
> +
> +int ubifs_set_acl(struct inode *inode, struct posix_acl *acl, int type)
> +{
> +	char *name;
> +	void *value = NULL;
> +	size_t size = 0;
> +	int err;
> +
> +	switch (type) {
> +	case ACL_TYPE_ACCESS:
> +		name = XATTR_NAME_POSIX_ACL_ACCESS;
> +		if (acl) {
> +			err = posix_acl_equiv_mode(acl, &inode->i_mode);
> +			if (err < 0)
> +				return err;
> +			if (err == 0)
> +				acl = NULL;
> +		}
> +		break;
> +
> +	case ACL_TYPE_DEFAULT:
> +		name = XATTR_NAME_POSIX_ACL_DEFAULT;
> +		if (!S_ISDIR(inode->i_mode))
> +			return acl ? -EACCES : 0;
> +		break;
> +
> +	default:
> +		BUG();
> +	}
> +
> +	if (acl) {
> +		value = acl_to_flash(acl, &size, type);
> +		if (IS_ERR(value))
> +			return (int) PTR_ERR(value);
> +	}
> +
> +	err = __ubifs_setxattr(inode, name, value, size, 0);
> +	kfree(value);
> +	if (!err)
> +		set_cached_acl(inode, type, acl);
> +	return err;
> +}
> +
> +/*
> + * Initialize the ACLs of a new inode.
> + */
> +int ubifs_init_acl(struct inode *inode, struct inode *dir)
> +{
> +	struct posix_acl *default_acl, *acl;
> +	int err;
> +
> +	err = posix_acl_create(dir, &inode->i_mode, &default_acl, &acl);
> +	if (err)
> +		return err;
> +
> +	if (default_acl) {
> +		mutex_lock(&inode->i_mutex);
> +		err = ubifs_set_acl(inode, default_acl, ACL_TYPE_DEFAULT);
> +		mutex_unlock(&inode->i_mutex);
> +		posix_acl_release(default_acl);
> +	}
> +
> +	if (acl) {
> +		if (!err) {
> +			mutex_lock(&inode->i_mutex);
> +			err = ubifs_set_acl(inode, acl, ACL_TYPE_ACCESS);
> +			mutex_unlock(&inode->i_mutex);
> +		}
> +		posix_acl_release(acl);
> +	}
> +
> +	return err;
> +}
> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> index f7e8f76..d5435dc 100644
> --- a/fs/ubifs/dir.c
> +++ b/fs/ubifs/dir.c
> @@ -167,6 +167,9 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, const struct inode *dir,
>  	 */
>  	ui->creat_sqnum = ++c->max_sqnum;
>  	spin_unlock(&c->cnt_lock);
> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
> +	ubifs_init_acl(inode, (struct inode *) dir);
> +#endif
>  	return inode;
>  }
>  
> @@ -1186,6 +1189,10 @@ const struct inode_operations ubifs_dir_inode_operations = {
>  	.getxattr    = ubifs_getxattr,
>  	.listxattr   = ubifs_listxattr,
>  	.removexattr = ubifs_removexattr,
> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
> +	.get_acl     = ubifs_get_acl,
> +	.set_acl     = ubifs_set_acl,
> +#endif
>  };
>  
>  const struct file_operations ubifs_dir_operations = {
> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> index 4855abc..1d4e498 100644
> --- a/fs/ubifs/file.c
> +++ b/fs/ubifs/file.c
> @@ -54,6 +54,7 @@
>  #include <linux/mount.h>
>  #include <linux/namei.h>
>  #include <linux/slab.h>
> +#include <linux/posix_acl.h>
>  
>  static int read_block(struct inode *inode, void *addr, unsigned int block,
>  		      struct ubifs_data_node *dn)
> @@ -1226,6 +1227,11 @@ static int do_setattr(struct ubifs_info *c, struct inode *inode,
>  		truncate_setsize(inode, new_size);
>  	}
>  
> +	if (attr->ia_valid & ATTR_MODE)
> +		err = posix_acl_chmod(inode, inode->i_mode);
> +	if (err)
> +		return err;
> +
>  	mutex_lock(&ui->ui_mutex);
>  	if (attr->ia_valid & ATTR_SIZE) {
>  		/* Truncation changes inode [mc]time */
> @@ -1567,6 +1573,10 @@ const struct inode_operations ubifs_file_inode_operations = {
>  	.getxattr    = ubifs_getxattr,
>  	.listxattr   = ubifs_listxattr,
>  	.removexattr = ubifs_removexattr,
> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
> +	.get_acl     = ubifs_get_acl,
> +	.set_acl     = ubifs_set_acl,
> +#endif
>  };
>  
>  const struct inode_operations ubifs_symlink_inode_operations = {
> @@ -1578,6 +1588,10 @@ const struct inode_operations ubifs_symlink_inode_operations = {
>  	.getxattr    = ubifs_getxattr,
>  	.listxattr   = ubifs_listxattr,
>  	.removexattr = ubifs_removexattr,
> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
> +	.get_acl     = ubifs_get_acl,
> +	.set_acl     = ubifs_set_acl,
> +#endif
>  };
>  
>  const struct file_operations ubifs_file_operations = {
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index e642067..05334e8 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -443,6 +443,9 @@ static int ubifs_show_options(struct seq_file *s, struct dentry *root)
>  			   ubifs_compr_name(c->mount_opts.compr_type));
>  	}
>  
> +	if (c->vfs_sb->s_flags & MS_POSIXACL)
> +		seq_printf(s, ",acl");
> +
>  	return 0;
>  }
>  
> @@ -928,6 +931,8 @@ enum {
>  	Opt_chk_data_crc,
>  	Opt_no_chk_data_crc,
>  	Opt_override_compr,
> +	Opt_acl,
> +	Opt_noacl,
>  	Opt_err,
>  };
>  
> @@ -939,6 +944,8 @@ static const match_table_t tokens = {
>  	{Opt_chk_data_crc, "chk_data_crc"},
>  	{Opt_no_chk_data_crc, "no_chk_data_crc"},
>  	{Opt_override_compr, "compr=%s"},
> +	{Opt_acl, "acl"},
> +	{Opt_noacl, "noacl"},
>  	{Opt_err, NULL},
>  };
>  
> @@ -1038,6 +1045,14 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
>  			c->default_compr = c->mount_opts.compr_type;
>  			break;
>  		}
> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
> +		case Opt_acl:
> +			c->vfs_sb->s_flags |= MS_POSIXACL;
> +			break;
> +		case Opt_noacl:
> +			c->vfs_sb->s_flags &= ~MS_POSIXACL;
> +			break;
> +#endif
>  		default:
>  		{
>  			unsigned long flag;
> diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
> index 2cb4297..a72b8bf 100644
> --- a/fs/ubifs/ubifs.h
> +++ b/fs/ubifs/ubifs.h
> @@ -1761,6 +1761,11 @@ int ubifs_init_security(struct inode *dentry, struct inode *inode,
>  int __ubifs_setxattr(struct inode *, const char *, const void *, size_t, int);
>  ssize_t __ubifs_getxattr(struct inode *, const char *, void *, size_t);
>  
> +/* acl.c */
> +int ubifs_init_acl(struct inode *inode, struct inode *dir);
> +int ubifs_set_acl(struct inode *inode, struct posix_acl *acl, int type);
> +struct posix_acl *ubifs_get_acl(struct inode *inode, int type);
> +
>  /* super.c */
>  struct inode *ubifs_iget(struct super_block *sb, unsigned long inum);
>  
> diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
> index c11c1f6..2272476 100644
> --- a/fs/ubifs/xattr.c
> +++ b/fs/ubifs/xattr.c
> @@ -52,7 +52,6 @@
>   * in the VFS inode cache. The xentries are cached in the LNC cache (see
>   * tnc.c).
>   *
> - * ACL support is not implemented.
>   */
>  
>  #include "ubifs.h"
> @@ -78,6 +77,10 @@ enum {
>  	USER_XATTR,
>  	TRUSTED_XATTR,
>  	SECURITY_XATTR,
> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
> +	POSIX_ACL_DEFAULT,
> +	POSIX_ACL_ACCESS,
> +#endif
>  };
>  
>  static const struct inode_operations empty_iops;
> @@ -276,6 +279,18 @@ static int check_namespace(const struct qstr *nm)
>  		if (nm->name[sizeof(XATTR_SECURITY_PREFIX) - 1] == '\0')
>  			return -EINVAL;
>  		type = SECURITY_XATTR;
> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
> +	} else if (!strncmp(nm->name, XATTR_NAME_POSIX_ACL_DEFAULT,
> +			    sizeof(XATTR_NAME_POSIX_ACL_DEFAULT) - 1)) {
> +		if (nm->name[sizeof(XATTR_NAME_POSIX_ACL_DEFAULT) - 1] != '\0')
> +			return -EINVAL;
> +		type = POSIX_ACL_DEFAULT;
> +	} else if (!strncmp(nm->name, XATTR_NAME_POSIX_ACL_ACCESS,
> +			    sizeof(XATTR_NAME_POSIX_ACL_ACCESS) - 1)) {
> +		if (nm->name[sizeof(XATTR_NAME_POSIX_ACL_ACCESS) - 1] != '\0')
> +			return -EINVAL;
> +		type = POSIX_ACL_ACCESS;
> +#endif
>  	} else
>  		return -EOPNOTSUPP;
>  
> @@ -366,6 +381,9 @@ int ubifs_setxattr(struct dentry *dentry, const char *name,
>  	dbg_gen("xattr '%s', host ino %lu ('%pd'), size %zd",
>  		name, dentry->d_inode->i_ino, dentry, size);
>  
> +	if (!strncmp(name, XATTR_SYSTEM_PREFIX, XATTR_SYSTEM_PREFIX_LEN))
> +		return generic_setxattr(dentry, name, value, size, flags);
> +
>  	return __ubifs_setxattr(dentry->d_inode, name, value, size, flags);
>  }
>  
> @@ -432,6 +450,9 @@ ssize_t ubifs_getxattr(struct dentry *dentry, const char *name, void *buf,
>  	dbg_gen("xattr '%s', ino %lu ('%pd'), buf size %zd", name,
>  		dentry->d_inode->i_ino, dentry, size);
>  
> +	if (!strncmp(name, XATTR_SYSTEM_PREFIX, XATTR_SYSTEM_PREFIX_LEN))
> +		return generic_getxattr(dentry, name, buf, size);
> +
>  	return __ubifs_getxattr(dentry->d_inode, name, buf, size);
>  }
>  
> @@ -625,6 +646,10 @@ static const struct xattr_handler ubifs_xattr_security_handler = {
>  
>  const struct xattr_handler *ubifs_xattr_handlers[] = {
>  	&ubifs_xattr_security_handler,
> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
> +	&posix_acl_access_xattr_handler,
> +	&posix_acl_default_xattr_handler,
> +#endif
>  	NULL,
>  };
>  
> 
