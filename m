Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZYrju-0003NH-DK
 for linux-mtd@lists.infradead.org; Mon, 07 Sep 2015 08:25:24 +0000
Message-ID: <55ED4868.9020901@cn.fujitsu.com>
Date: Mon, 7 Sep 2015 16:18:48 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Sheng Yong <shengyong1@huawei.com>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>, <agruen@suse.de>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>
Subject: Re: [RFC PATCH v2 2/3] UBIFS: ACL: add ACL support
References: <1441561221-18899-1-git-send-email-shengyong1@huawei.com>
 <1441561221-18899-3-git-send-email-shengyong1@huawei.com>
In-Reply-To: <1441561221-18899-3-git-send-email-shengyong1@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/07/2015 01:40 AM, Sheng Yong wrote:
> Signed-off-by: Sheng Yong <shengyong1@huawei.com>
> ---
>   fs/ubifs/acl.c   | 312 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   fs/ubifs/dir.c   |  20 ++++
>   fs/ubifs/file.c  |  14 +++
>   fs/ubifs/super.c |  15 +++
>   fs/ubifs/ubifs.h |  14 +++
>   fs/ubifs/xattr.c |  64 +++++++++++-
>   6 files changed, 434 insertions(+), 5 deletions(-)
>   create mode 100644 fs/ubifs/acl.c
>
[...]


> @@ -1037,6 +1044,14 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
>   			c->default_compr = c->mount_opts.compr_type;
>   			break;
>   		}
> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
> +		case Opt_acl:
> +			c->vfs_sb->s_flags |= MS_POSIXACL;
> +			break;
> +		case Opt_noacl:
> +			c->vfs_sb->s_flags &= ~MS_POSIXACL;
> +			break;
> +#endif

Please error out when UBIFS_FS_POSIX_ACL=N and Opt_acl specified.

Yang
>   		default:
>   		{
>   			unsigned long flag;
> diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
> index 62aa1a5..b9ddc8d 100644
> --- a/fs/ubifs/ubifs.h
> +++ b/fs/ubifs/ubifs.h
> @@ -1767,6 +1767,20 @@ int ubifs_removexattr(struct dentry *dentry, const char *name);
>   int ubifs_init_security(struct inode *dentry, struct inode *inode,
>   			const struct qstr *qstr);
>
> +/* acl.c */
> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
> +int ubifs_init_acl(struct inode *dir, struct inode *inode);
> +int ubifs_set_acl(struct inode *inode, struct posix_acl *acl, int type);
> +struct posix_acl *ubifs_get_acl(struct inode *inode, int type);
> +#else
> +static inline int ubifs_init_acl(struct inode *inode, struct inode *dir)
> +{
> +	return 0;
> +}
> +#define ubifs_get_acl NULL
> +#define ubifs_set_acl NULL
> +#endif
> +
>   /* super.c */
>   struct inode *ubifs_iget(struct super_block *sb, unsigned long inum);
>
> diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
> index 6534b98..f2556d2 100644
> --- a/fs/ubifs/xattr.c
> +++ b/fs/ubifs/xattr.c
> @@ -52,7 +52,6 @@
>    * in the VFS inode cache. The xentries are cached in the LNC cache (see
>    * tnc.c).
>    *
> - * ACL support is not implemented.
>    */
>
>   #include "ubifs.h"
> @@ -78,6 +77,10 @@ enum {
>   	USER_XATTR,
>   	TRUSTED_XATTR,
>   	SECURITY_XATTR,
> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
> +	POSIX_ACL_DEFAULT,
> +	POSIX_ACL_ACCESS,
> +#endif
>   };
>
>   static const struct inode_operations empty_iops;
> @@ -276,6 +279,18 @@ static int check_namespace(const struct qstr *nm)
>   		if (nm->name[sizeof(XATTR_SECURITY_PREFIX) - 1] == '\0')
>   			return -EINVAL;
>   		type = SECURITY_XATTR;
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
>   	} else
>   		return -EOPNOTSUPP;
>
> @@ -359,6 +374,9 @@ out_free:
>   int ubifs_setxattr(struct dentry *dentry, const char *name,
>   		   const void *value, size_t size, int flags)
>   {
> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
> +	const struct xattr_handler *handler;
> +#endif
>   	struct qstr nm = QSTR_INIT(name, strlen(name));
>   	int type;
>
> @@ -369,6 +387,16 @@ int ubifs_setxattr(struct dentry *dentry, const char *name,
>   	if (type < 0)
>   		return type;
>
> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
> +	if (type == POSIX_ACL_DEFAULT || type == POSIX_ACL_ACCESS) {
> +		if (type == POSIX_ACL_DEFAULT)
> +			handler = &posix_acl_default_xattr_handler;
> +		if (type == POSIX_ACL_ACCESS)
> +			handler = &posix_acl_access_xattr_handler;
> +		return handler->set(dentry, name, value, size, flags,
> +				    handler->flags);
> +	}
> +#endif
>   	return ubifs_do_setxattr(d_inode(dentry), name, value, size, flags);
>   }
>
> @@ -428,6 +456,9 @@ out_unlock:
>   ssize_t ubifs_getxattr(struct dentry *dentry, const char *name,
>   		       void *value, size_t size)
>   {
> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
> +	const struct xattr_handler *handler;
> +#endif
>   	struct qstr nm = QSTR_INIT(name, strlen(name));
>   	int type;
>
> @@ -438,6 +469,16 @@ ssize_t ubifs_getxattr(struct dentry *dentry, const char *name,
>   	if (type < 0)
>   		return type;
>
> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
> +	if (type == POSIX_ACL_DEFAULT || type == POSIX_ACL_ACCESS) {
> +		if (type == POSIX_ACL_DEFAULT)
> +			handler = &posix_acl_default_xattr_handler;
> +		if (type == POSIX_ACL_ACCESS)
> +			handler = &posix_acl_access_xattr_handler;
> +		return handler->get(dentry, name, value, size,
> +				    handler->flags);
> +	}
> +#endif
>   	return ubifs_do_getxattr(d_inode(dentry), name, value, size);
>   }
>
> @@ -547,20 +588,33 @@ out_cancel:
>
>   int ubifs_removexattr(struct dentry *dentry, const char *name)
>   {
> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
> +	const struct xattr_handler *handler;
> +#endif
>   	struct inode *inode, *host = d_inode(dentry);
>   	struct ubifs_info *c = host->i_sb->s_fs_info;
>   	struct qstr nm = QSTR_INIT(name, strlen(name));
>   	struct ubifs_dent_node *xent;
>   	union ubifs_key key;
> -	int err;
> +	int type, err;
>
>   	dbg_gen("xattr '%s', ino %lu ('%pd')", name,
>   		host->i_ino, dentry);
>   	ubifs_assert(mutex_is_locked(&host->i_mutex));
>
> -	err = check_namespace(&nm);
> -	if (err < 0)
> -		return err;
> +	type = check_namespace(&nm);
> +	if (type < 0)
> +		return type;
> +
> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
> +	if (type == POSIX_ACL_DEFAULT || type == POSIX_ACL_ACCESS) {
> +		if (type == POSIX_ACL_DEFAULT)
> +			handler = &posix_acl_default_xattr_handler;
> +		if (type == POSIX_ACL_ACCESS)
> +			handler = &posix_acl_access_xattr_handler;
> +		return handler->set(dentry, name, NULL, 0, 0, handler->flags);
> +	}
> +#endif
>
>   	xent = kmalloc(UBIFS_MAX_XENT_NODE_SZ, GFP_NOFS);
>   	if (!xent)
>
