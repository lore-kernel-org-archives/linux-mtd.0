Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zc9Vv-00017M-J5
 for linux-mtd@lists.infradead.org; Wed, 16 Sep 2015 10:00:32 +0000
Date: Wed, 16 Sep 2015 12:00:07 +0200
From: Jan Kara <jack@suse.cz>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: viro@ZenIV.linux.org.uk, jack@suse.cz, dedekind1@gmail.com,
 richard.weinberger@gmail.com, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v3 36/39] ubifs: implement ubifs_get_qsize to get quota
 size in ubifs
Message-ID: <20150916100007.GD13325@quack.suse.cz>
References: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1442307754-13233-37-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1442307754-13233-37-git-send-email-yangds.fnst@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue 15-09-15 17:02:31, Dongsheng Yang wrote:
> We only care the size of regular file in ubifs for quota.
> The reason is similar with the comment in ubifs_getattr().
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
>  fs/ubifs/dir.c   |  3 +++
>  fs/ubifs/file.c  | 22 ++++++++++++++++++++++
>  fs/ubifs/ubifs.h |  1 +
>  3 files changed, 26 insertions(+)
> 
> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> index 802c6ad..0d3d6d3 100644
> --- a/fs/ubifs/dir.c
> +++ b/fs/ubifs/dir.c
> @@ -1205,6 +1205,9 @@ const struct inode_operations ubifs_dir_inode_operations = {
>  #ifdef CONFIG_UBIFS_ATIME_SUPPORT
>  	.update_time = ubifs_update_time,
>  #endif
> +#ifdef CONFIG_QUOTA
> +	.get_qsize	= ubifs_get_qsize,
> +#endif
>  };
>  
>  const struct file_operations ubifs_dir_operations = {
> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> index b57ccf3..f1d792a 100644
> --- a/fs/ubifs/file.c
> +++ b/fs/ubifs/file.c
> @@ -1636,6 +1636,22 @@ static int ubifs_file_mmap(struct file *file, struct vm_area_struct *vma)
>  	return 0;
>  }
>  
> +/*
> + * ubifs_get_qsize: get the quota size of a file
> + * @inode: inode which we are going to get the qsize
> + *
> + * We only care the size of regular file in ubifs
> + * for quota. The reason is similar with the comment
> + * in ubifs_getattr().
> + */
> +ssize_t ubifs_get_qsize(struct inode *inode)
> +{
> +	if (S_ISREG(inode->i_mode))
> +		return i_size_read(inode);
> +	else
> +		return 0;
> +}
> +

The quota space is accounted in bytes. So why don't you store appropriate
number of bytes the file consumes in i_blocks / i_bytes? Reiserfs can also
have files occupying only say 100 bytes and everything works properly
there so I don't see why ubifs needs to differ.

								Honza

>  const struct address_space_operations ubifs_file_address_operations = {
>  	.readpage       = ubifs_readpage,
>  	.writepage      = ubifs_writepage,
> @@ -1656,6 +1672,9 @@ const struct inode_operations ubifs_file_inode_operations = {
>  #ifdef CONFIG_UBIFS_ATIME_SUPPORT
>  	.update_time = ubifs_update_time,
>  #endif
> +#ifdef CONFIG_QUOTA
> +	.get_qsize	= ubifs_get_qsize,
> +#endif
>  };
>  
>  const struct inode_operations ubifs_symlink_inode_operations = {
> @@ -1670,6 +1689,9 @@ const struct inode_operations ubifs_symlink_inode_operations = {
>  #ifdef CONFIG_UBIFS_ATIME_SUPPORT
>  	.update_time = ubifs_update_time,
>  #endif
> +#ifdef CONFIG_QUOTA
> +	.get_qsize	= ubifs_get_qsize,
> +#endif
>  };
>  
>  const struct file_operations ubifs_file_operations = {
> diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
> index 99cf10c..21b5dc0 100644
> --- a/fs/ubifs/ubifs.h
> +++ b/fs/ubifs/ubifs.h
> @@ -1759,6 +1759,7 @@ int ubifs_read_block(struct inode *inode, void *addr, unsigned int block,
>  int ubifs_fsync(struct file *file, loff_t start, loff_t end, int datasync);
>  int ubifs_setattr(struct dentry *dentry, struct iattr *attr);
>  int ubifs_update_time(struct inode *inode, struct timespec *time, int flags);
> +ssize_t ubifs_get_qsize(struct inode *inode);
>  
>  /* dir.c */
>  struct inode *ubifs_new_inode(struct ubifs_info *c, const struct inode *dir,
> -- 
> 1.8.4.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
