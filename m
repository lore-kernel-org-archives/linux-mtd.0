Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZaGZA-00007K-Ff
 for linux-mtd@lists.infradead.org; Fri, 11 Sep 2015 05:08:06 +0000
Message-ID: <55F2602F.5090407@cn.fujitsu.com>
Date: Fri, 11 Sep 2015 13:01:35 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Sheng Yong <shengyong1@huawei.com>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>, <andreas.gruenbacher@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>
Subject: Re: [RFC PATCH v3 3/5] UBIFS: ACL: handle ACL through xattr
References: <1441962597-13543-1-git-send-email-shengyong1@huawei.com>
 <1441962597-13543-4-git-send-email-shengyong1@huawei.com>
In-Reply-To: <1441962597-13543-4-git-send-email-shengyong1@huawei.com>
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

On 09/11/2015 05:09 PM, Sheng Yong wrote:
> * initialize ACL when file is created
> * get ACL through ubifs_getxattr
> * set ACL through ubifs_setxattr. If the size of ACL is 0, the ACL is going
>    to be removed
> * clear cached ACL in ubifs_removexattr if ACL xattr is removed
> * modify ACL if file mode is changed
>
> Signed-off-by: Sheng Yong <shengyong1@huawei.com>
> ---
>   fs/ubifs/dir.c   |  16 ++++
>   fs/ubifs/file.c  |   6 ++
>   fs/ubifs/xattr.c | 243 ++++++++++++++++++++++++++++++++++---------------------
>   3 files changed, 175 insertions(+), 90 deletions(-)
>
> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> index 69ccc78..db5dd45 100644
> --- a/fs/ubifs/dir.c
> +++ b/fs/ubifs/dir.c
> @@ -270,6 +270,10 @@ static int ubifs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
>   		goto out_budg;
>   	}
>
> +	err = ubifs_init_acl(dir, inode);
> +	if (err)
> +		goto out_inode;
> +
>   	err = ubifs_init_security(dir, inode, &dentry->d_name);
>   	if (err)
>   		goto out_inode;
> @@ -731,6 +735,10 @@ static int ubifs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
>   		goto out_budg;
>   	}
>
> +	err = ubifs_init_acl(dir, inode);
> +	if (err)
> +		goto out_inode;
> +
>   	err = ubifs_init_security(dir, inode, &dentry->d_name);
>   	if (err)
>   		goto out_inode;
> @@ -810,6 +818,10 @@ static int ubifs_mknod(struct inode *dir, struct dentry *dentry,
>   		goto out_budg;
>   	}
>
> +	err = ubifs_init_acl(dir, inode);
> +	if (err)
> +		goto out_inode;
> +
>   	init_special_inode(inode, inode->i_mode, rdev);
>   	inode->i_size = ubifs_inode(inode)->ui_size = devlen;
>   	ui = ubifs_inode(inode);
> @@ -898,6 +910,10 @@ static int ubifs_symlink(struct inode *dir, struct dentry *dentry,
>   	ui->data_len = len;
>   	inode->i_size = ubifs_inode(inode)->ui_size = len;
>
> +	err = ubifs_init_acl(dir, inode);
> +	if (err)
> +		goto out_inode;
> +
>   	err = ubifs_init_security(dir, inode, &dentry->d_name);
>   	if (err)
>   		goto out_inode;
> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> index 58298f8..74f4c63 100644
> --- a/fs/ubifs/file.c
> +++ b/fs/ubifs/file.c
> @@ -52,6 +52,7 @@
>   #include "ubifs.h"
>   #include <linux/mount.h>
>   #include <linux/slab.h>
> +#include <linux/posix_acl.h>
>
>   static int read_block(struct inode *inode, void *addr, unsigned int block,
>   		      struct ubifs_data_node *dn)
> @@ -1246,6 +1247,11 @@ static int do_setattr(struct ubifs_info *c, struct inode *inode,
>   		mark_inode_dirty_sync(inode);
>   	mutex_unlock(&ui->ui_mutex);
>
> +	if (attr->ia_valid & ATTR_MODE)
> +		err = posix_acl_chmod(inode, inode->i_mode);
> +	if (err)
> +		return err;
> +
>   	if (release)
>   		ubifs_release_budget(c, &req);
>   	if (IS_SYNC(inode))
> diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
> index 6534b98..dad1070 100644
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
> @@ -299,6 +314,105 @@ static struct inode *iget_xattr(struct ubifs_info *c, ino_t inum)
>   	return ERR_PTR(-EINVAL);
>   }
>
> +static int remove_xattr(struct ubifs_info *c, struct inode *host,
> +			struct inode *inode, const struct qstr *nm)
> +{
> +	int err;
> +	struct ubifs_inode *host_ui = ubifs_inode(host);
> +	struct ubifs_inode *ui = ubifs_inode(inode);
> +	struct ubifs_budget_req req = { .dirtied_ino = 2, .mod_dent = 1,
> +				.dirtied_ino_d = ALIGN(host_ui->data_len, 8) };
> +
> +	ubifs_assert(ui->data_len == inode->i_size);
> +
> +	err = ubifs_budget_space(c, &req);
> +	if (err)
> +		return err;
> +
> +	mutex_lock(&host_ui->ui_mutex);
> +	host->i_ctime = ubifs_current_time(host);
> +	host_ui->xattr_cnt -= 1;
> +	host_ui->xattr_size -= CALC_DENT_SIZE(nm->len);
> +	host_ui->xattr_size -= CALC_XATTR_BYTES(ui->data_len);
> +	host_ui->xattr_names -= nm->len;
> +
> +	err = ubifs_jnl_delete_xattr(c, host, inode, nm);
> +	if (err)
> +		goto out_cancel;
> +	mutex_unlock(&host_ui->ui_mutex);
> +
> +	ubifs_release_budget(c, &req);
> +	return 0;
> +
> +out_cancel:
> +	host_ui->xattr_cnt += 1;
> +	host_ui->xattr_size += CALC_DENT_SIZE(nm->len);
> +	host_ui->xattr_size += CALC_XATTR_BYTES(ui->data_len);
> +	mutex_unlock(&host_ui->ui_mutex);
> +	ubifs_release_budget(c, &req);
> +	make_bad_inode(inode);
> +	return err;
> +}
> +
> +int ubifs_removexattr(struct dentry *dentry, const char *name)
> +{
> +	struct inode *inode, *host = d_inode(dentry);
> +	struct ubifs_info *c = host->i_sb->s_fs_info;
> +	struct qstr nm = QSTR_INIT(name, strlen(name));
> +	struct ubifs_dent_node *xent;
> +	union ubifs_key key;
> +	int type, err;
> +
> +	dbg_gen("xattr '%s', ino %lu ('%pd')", name,
> +		host->i_ino, dentry);
> +	ubifs_assert(mutex_is_locked(&host->i_mutex));
> +
> +	type = check_namespace(&nm);
> +	if (type < 0)
> +		return type;
> +
> +	xent = kmalloc(UBIFS_MAX_XENT_NODE_SZ, GFP_NOFS);
> +	if (!xent)
> +		return -ENOMEM;
> +
> +	xent_key_init(c, &key, host->i_ino, &nm);
> +	err = ubifs_tnc_lookup_nm(c, &key, xent, &nm);
> +	if (err) {
> +		if (err == -ENOENT)
> +			err = -ENODATA;
> +		goto out_free;
> +	}
> +
> +	inode = iget_xattr(c, le64_to_cpu(xent->inum));
> +	if (IS_ERR(inode)) {
> +		err = PTR_ERR(inode);
> +		goto out_free;
> +	}
> +
> +	ubifs_assert(inode->i_nlink == 1);
> +	clear_nlink(inode);
> +	err = remove_xattr(c, host, inode, &nm);
> +	if (err)
> +		set_nlink(inode, 1);
> +
> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
> +	if (!err) {
> +		if (type == POSIX_ACL_DEFAULT)
> +			set_cached_acl(host, ACL_TYPE_DEFAULT, NULL);
> +		else if (type == POSIX_ACL_ACCESS)
> +			set_cached_acl(host, ACL_TYPE_ACCESS, NULL);
> +	}
> +#endif
> +
> +	/* If @i_nlink is 0, 'iput()' will delete the inode */
> +	iput(inode);
> +
> +out_free:
> +	kfree(xent);
> +	return err;
> +}
> +
> +

Why move it? If you just want to use them before the definitions,
Just declare them before using.
>   int ubifs_do_setxattr(struct inode *host, const char *name,
>   		      const void *value, size_t size, int flags)
>   {
> @@ -348,7 +462,19 @@ int ubifs_do_setxattr(struct inode *host, const char *name,
>   		goto out_free;
>   	}
>
> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
> +	if (size == 0) {
> +		ubifs_assert(inode->i_nlink == 1);
> +		clear_nlink(inode);
> +		err = remove_xattr(c, host, inode, &nm);
> +		if (err)
> +			set_nlink(inode, 1);
> +		iput(inode);
> +		goto out_free;
> +	}
> +#endif

Is there a testcase for it?
>   	err = change_xattr(c, host, inode, value, size);
> +
>   	iput(inode);
>
>   out_free:
> @@ -359,6 +485,9 @@ out_free:
>   int ubifs_setxattr(struct dentry *dentry, const char *name,
>   		   const void *value, size_t size, int flags)
>   {
> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
> +	const struct xattr_handler *handler;
> +#endif
>   	struct qstr nm = QSTR_INIT(name, strlen(name));
>   	int type;
>
> @@ -369,6 +498,16 @@ int ubifs_setxattr(struct dentry *dentry, const char *name,
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

What about setting sb->s_xattr and calling generic_setxattr() here?
>   	return ubifs_do_setxattr(d_inode(dentry), name, value, size, flags);
>   }
>
> @@ -428,6 +567,9 @@ out_unlock:
>   ssize_t ubifs_getxattr(struct dentry *dentry, const char *name,
>   		       void *value, size_t size)
>   {
> +#ifdef CONFIG_UBIFS_FS_POSIX_ACL
> +	const struct xattr_handler *handler;
> +#endif
>   	struct qstr nm = QSTR_INIT(name, strlen(name));
>   	int type;
>
> @@ -438,6 +580,16 @@ ssize_t ubifs_getxattr(struct dentry *dentry, const char *name,
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

Ditto

Thanx
Yang
>   	return ubifs_do_getxattr(d_inode(dentry), name, value, size);
>   }
>
> @@ -505,95 +657,6 @@ ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size)
>   	return written;
>   }
>
> -static int remove_xattr(struct ubifs_info *c, struct inode *host,
> -			struct inode *inode, const struct qstr *nm)
> -{
> -	int err;
> -	struct ubifs_inode *host_ui = ubifs_inode(host);
> -	struct ubifs_inode *ui = ubifs_inode(inode);
> -	struct ubifs_budget_req req = { .dirtied_ino = 2, .mod_dent = 1,
> -				.dirtied_ino_d = ALIGN(host_ui->data_len, 8) };
> -
> -	ubifs_assert(ui->data_len == inode->i_size);
> -
> -	err = ubifs_budget_space(c, &req);
> -	if (err)
> -		return err;
> -
> -	mutex_lock(&host_ui->ui_mutex);
> -	host->i_ctime = ubifs_current_time(host);
> -	host_ui->xattr_cnt -= 1;
> -	host_ui->xattr_size -= CALC_DENT_SIZE(nm->len);
> -	host_ui->xattr_size -= CALC_XATTR_BYTES(ui->data_len);
> -	host_ui->xattr_names -= nm->len;
> -
> -	err = ubifs_jnl_delete_xattr(c, host, inode, nm);
> -	if (err)
> -		goto out_cancel;
> -	mutex_unlock(&host_ui->ui_mutex);
> -
> -	ubifs_release_budget(c, &req);
> -	return 0;
> -
> -out_cancel:
> -	host_ui->xattr_cnt += 1;
> -	host_ui->xattr_size += CALC_DENT_SIZE(nm->len);
> -	host_ui->xattr_size += CALC_XATTR_BYTES(ui->data_len);
> -	mutex_unlock(&host_ui->ui_mutex);
> -	ubifs_release_budget(c, &req);
> -	make_bad_inode(inode);
> -	return err;
> -}
> -
> -int ubifs_removexattr(struct dentry *dentry, const char *name)
> -{
> -	struct inode *inode, *host = d_inode(dentry);
> -	struct ubifs_info *c = host->i_sb->s_fs_info;
> -	struct qstr nm = QSTR_INIT(name, strlen(name));
> -	struct ubifs_dent_node *xent;
> -	union ubifs_key key;
> -	int err;
> -
> -	dbg_gen("xattr '%s', ino %lu ('%pd')", name,
> -		host->i_ino, dentry);
> -	ubifs_assert(mutex_is_locked(&host->i_mutex));
> -
> -	err = check_namespace(&nm);
> -	if (err < 0)
> -		return err;
> -
> -	xent = kmalloc(UBIFS_MAX_XENT_NODE_SZ, GFP_NOFS);
> -	if (!xent)
> -		return -ENOMEM;
> -
> -	xent_key_init(c, &key, host->i_ino, &nm);
> -	err = ubifs_tnc_lookup_nm(c, &key, xent, &nm);
> -	if (err) {
> -		if (err == -ENOENT)
> -			err = -ENODATA;
> -		goto out_free;
> -	}
> -
> -	inode = iget_xattr(c, le64_to_cpu(xent->inum));
> -	if (IS_ERR(inode)) {
> -		err = PTR_ERR(inode);
> -		goto out_free;
> -	}
> -
> -	ubifs_assert(inode->i_nlink == 1);
> -	clear_nlink(inode);
> -	err = remove_xattr(c, host, inode, &nm);
> -	if (err)
> -		set_nlink(inode, 1);
> -
> -	/* If @i_nlink is 0, 'iput()' will delete the inode */
> -	iput(inode);
> -
> -out_free:
> -	kfree(xent);
> -	return err;
> -}
> -
>   static size_t security_listxattr(struct dentry *d, char *list, size_t list_size,
>   				 const char *name, size_t name_len, int flags)
>   {
>
