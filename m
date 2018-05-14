Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fI7Hc-0000z0-0f
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 06:48:34 +0000
From: Richard Weinberger <richard@nod.at>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 09/15] ubifs_lookup: use d_splice_alias()
Date: Mon, 14 May 2018 08:48:04 +0200
Message-ID: <1895334.QZIWCTBKyO@blindfold>
In-Reply-To: <20180513213017.31269-9-viro@ZenIV.linux.org.uk>
References: <20180513212612.GV30522@ZenIV.linux.org.uk>
 <20180513213017.31269-1-viro@ZenIV.linux.org.uk>
 <20180513213017.31269-9-viro@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Sonntag, 13. Mai 2018, 23:30:11 CEST schrieb Al Viro:
> From: Al Viro <viro@zeniv.linux.org.uk>
> 
> Cc: Richard Weinberger <richard@nod.at>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---
>  fs/ubifs/dir.c | 43 +++++++++++++++----------------------------
>  1 file changed, 15 insertions(+), 28 deletions(-)
> 
> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> index 9d7fb88e172e..4e267cc21c77 100644
> --- a/fs/ubifs/dir.c
> +++ b/fs/ubifs/dir.c
> @@ -214,7 +214,7 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
>  	int err;
>  	union ubifs_key key;
>  	struct inode *inode = NULL;
> -	struct ubifs_dent_node *dent;
> +	struct ubifs_dent_node *dent = NULL;
>  	struct ubifs_info *c = dir->i_sb->s_fs_info;
>  	struct fscrypt_name nm;
>  
> @@ -229,14 +229,14 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
>  		return ERR_PTR(err);
>  
>  	if (fname_len(&nm) > UBIFS_MAX_NLEN) {
> -		err = -ENAMETOOLONG;
> -		goto out_fname;
> +		inode = ERR_PTR(-ENAMETOOLONG);
> +		goto done;
>  	}
>  
>  	dent = kmalloc(UBIFS_MAX_DENT_NODE_SZ, GFP_NOFS);
>  	if (!dent) {
> -		err = -ENOMEM;
> -		goto out_fname;
> +		inode = ERR_PTR(-ENOMEM);
> +		goto done;
>  	}
>  
>  	if (nm.hash) {
> @@ -250,16 +250,16 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
>  	}
>  
>  	if (err) {
> -		if (err == -ENOENT) {
> +		if (err == -ENOENT)
>  			dbg_gen("not found");
> -			goto done;
> -		}
> -		goto out_dent;
> +		else
> +			inode = ERR_PTR(err);
> +		goto done;
>  	}
>  
>  	if (dbg_check_name(c, dent, &nm)) {
> -		err = -EINVAL;
> -		goto out_dent;
> +		inode = ERR_PTR(-EINVAL);
> +		goto done;
>  	}
>  
>  	inode = ubifs_iget(dir->i_sb, le64_to_cpu(dent->inum));
> @@ -272,7 +272,7 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
>  		ubifs_err(c, "dead directory entry '%pd', error %d",
>  			  dentry, err);
>  		ubifs_ro_mode(c, err);
> -		goto out_dent;
> +		goto done;
>  	}
>  
>  	if (ubifs_crypt_is_encrypted(dir) &&
> @@ -280,27 +280,14 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
>  	    !fscrypt_has_permitted_context(dir, inode)) {
>  		ubifs_warn(c, "Inconsistent encryption contexts: %lu/%lu",
>  			   dir->i_ino, inode->i_ino);
> -		err = -EPERM;
> -		goto out_inode;
> +		iput(inode);
> +		inode = ERR_PTR(-EPERM);
>  	}
>  
>  done:
>  	kfree(dent);
>  	fscrypt_free_filename(&nm);
> -	/*
> -	 * Note, d_splice_alias() would be required instead if we supported
> -	 * NFS.
> -	 */
> -	d_add(dentry, inode);
> -	return NULL;
> -
> -out_inode:
> -	iput(inode);
> -out_dent:
> -	kfree(dent);
> -out_fname:
> -	fscrypt_free_filename(&nm);
> -	return ERR_PTR(err);
> +	return d_splice_alias(inode, dentry);
>  }
>  
>  static int ubifs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
> 

Acked-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
