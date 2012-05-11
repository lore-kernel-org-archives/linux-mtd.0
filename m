Received: from www262.sakura.ne.jp ([202.181.97.72])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SSoYF-0006jr-Gr
 for linux-mtd@lists.infradead.org; Fri, 11 May 2012 12:02:30 +0000
To: snijsure@grid-net.com
Subject: Re: [PATCH v3] Add security.* XATTR support for the UBIFS
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
References: <1336691842-32281-1-git-send-email-snijsure@grid-net.com>
In-Reply-To: <1336691842-32281-1-git-send-email-snijsure@grid-net.com>
Message-Id: <201205112101.AGA05306.JOOFFSHOQMLFtV@I-love.SAKURA.ne.jp>
Date: Fri, 11 May 2012 21:01:55 +0900
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-security-module@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Subodh Nijsure wrote:
> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> index ad6e550..cec3ffab 100644
> --- a/fs/ubifs/dir.c
> +++ b/fs/ubifs/dir.c
> @@ -292,6 +292,14 @@ static int ubifs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
>  
According to 3.4-rc6,

	mutex_unlock() is here.

>  	ubifs_release_budget(c, &req);
>  	insert_inode_hash(inode);
> +
> +	err = ubifs_init_security(dir, inode, &dentry->d_name);
> +	if (err) {
> +		ubifs_err("cannot initialize extended attribute, error %d",
> +			  err);
> +		goto out_cancel;
> +	}
> +
>  	d_instantiate(dentry, inode);
>  	return 0;

out_cancel:
	mutex_unlock() is also here...

Same for the rest.

> diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
> index 85b2722..49c426a 100644
> --- a/fs/ubifs/xattr.c
> +++ b/fs/ubifs/xattr.c
> @@ -568,3 +600,91 @@ out_free:
>  	kfree(xent);
>  	return err;
>  }
> +
> +size_t
> +ubifs_security_listxattr(struct dentry *d, char *list, size_t list_size,
> +			 const char *name, size_t name_len, int flags)
> +{
> +	const int prefix_len = XATTR_SECURITY_PREFIX_LEN;
> +	const size_t total_len = prefix_len + name_len + 1;
> +	if (list && total_len <= list_size) {
> +		memcpy(list, XATTR_SECURITY_PREFIX, prefix_len);
> +		memcpy(list+prefix_len, name, name_len);
> +		list[prefix_len + name_len] = '\0';
> +	}

If (list && total_len > list_size), the caller will see total_len
but no data is copied to list. Is it OK?

> +	return total_len;
> +}

> +static int ubifs_initxattrs(struct inode *inode,
> +			    const struct xattr *xattr_array, void *fs_info)
> +{
> +	const struct xattr *xattr;
> +	char *name;
> +	int err = 0;
> +
> +	for (xattr = xattr_array; xattr->name != NULL; xattr++) {
> +		name = kmalloc(XATTR_SECURITY_PREFIX_LEN +
> +			       strlen(xattr->name) + 1, GFP_NOFS);

Maybe nice to have kstrdup2(const char *str1, const char *str2, gfp_t flags).

> +		if (!name) {
> +			err = -ENOMEM;
> +			break;
> +		}
> +		strcpy(name, XATTR_SECURITY_PREFIX);
> +		strcpy(name + XATTR_SECURITY_PREFIX_LEN, xattr->name);
> +		err = __ubifs_setxattr(inode, name, xattr->value,
> +				       xattr->value_len, 0);
> +		kfree(name);
> +		if (err < 0)
> +			break;
> +	}
> +	return err;
> +}
