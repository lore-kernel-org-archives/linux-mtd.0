Received: from fieldses.org ([173.255.197.46])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cMRAr-0004v9-Pg
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2016 03:14:38 +0000
Date: Wed, 28 Dec 2016 21:56:50 -0500
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, david@sigma-star.at, tytso@mit.edu,
 dedekind1@gmail.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 adilger.kernel@dilger.ca, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org
Subject: Re: [PATCH 6/6] ubifs: Wire up NFS support
Message-ID: <20161229025650.GB21325@fieldses.org>
References: <1480629741-18375-1-git-send-email-richard@nod.at>
 <1480629741-18375-7-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1480629741-18375-7-git-send-email-richard@nod.at>
From: bfields@fieldses.org (J. Bruce Fields)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 01, 2016 at 11:02:21PM +0100, Richard Weinberger wrote:
> Since we have 64bit readdir cookies and export operations
> we can finally enable NFS export support for UBIFS.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  fs/ubifs/dir.c   | 9 ++-------
>  fs/ubifs/super.c | 3 +++
>  2 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> index 5485d836af21..13d13afd2976 100644
> --- a/fs/ubifs/dir.c
> +++ b/fs/ubifs/dir.c
> @@ -289,11 +289,8 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
>  done:
>  	kfree(dent);
>  	fscrypt_free_filename(&nm);
> -	/*
> -	 * Note, d_splice_alias() would be required instead if we supported
> -	 * NFS.
> -	 */
> -	d_add(dentry, inode);
> +
> +	d_splice_alias(inode, dentry);
>  	return NULL;

I'm pretty sure that should be 

	return d_splice_alias(inode, dentry);

--b.

>  
>  out_dent:
> @@ -524,8 +521,6 @@ static unsigned int vfs_dent_type(uint8_t type)
>   * properly by means of saving full directory entry name in the private field
>   * of the file description object.
>   *
> - * This means that UBIFS cannot support NFS which requires full
> - * 'seekdir()'/'telldir()' support.
>   */
>  static int ubifs_readdir(struct file *file, struct dir_context *ctx)
>  {
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index be5b697d8214..4cb7f641f35c 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -2092,6 +2092,9 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
>  		goto out_unlock;
>  	}
>  
> +	if (c->parent_pointer && c->double_hash)
> +		sb->s_export_op = &ubifs_export_ops;
> +
>  	/* Read the root inode */
>  	root = ubifs_iget(sb, UBIFS_ROOT_INO);
>  	if (IS_ERR(root)) {
> -- 
> 2.7.3
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-fsdevel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
