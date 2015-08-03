Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMM9b-0001nH-7E
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 20:16:12 +0000
Date: Mon, 3 Aug 2015 22:15:46 +0200
From: Jan Kara <jack@suse.cz>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: viro@ZenIV.linux.org.uk, jack@suse.cz, dedekind1@gmail.com,
 richard.weinberger@gmail.com, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 33/35] fs: introduce a get_qsize() to file_operations
Message-ID: <20150803201546.GI23810@quack.suse.cz>
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-34-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1438235311-23788-34-git-send-email-yangds.fnst@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu 30-07-15 13:48:29, Dongsheng Yang wrote:
> get_qsize() is used to allow inode to decide how much of the quota size
> in itself. If file system implements the own get_qsize(), ioctl of
> FIOQSIZe will call it to get quota size. If not implemented, get the
> quota size in a generic way.

OK, can you ellaborate a bit why using i_blocks / i_bytes isn't good
enough for ubifs?

> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
>  fs/ioctl.c         | 31 ++++++++++++++++++++++++-------
>  include/linux/fs.h |  1 +
>  2 files changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/ioctl.c b/fs/ioctl.c
> index 5d01d26..2c567db 100644
> --- a/fs/ioctl.c
> +++ b/fs/ioctl.c
> @@ -545,6 +545,29 @@ static int ioctl_fsthaw(struct file *filp)
>  	return thaw_super(sb);
>  }
>  
> +static int ioctl_fioqsize(struct file *filp, int __user *argp)
> +{
> +	struct inode *inode = file_inode(filp);
> +	loff_t res = 0;
> +	int error = 0;
> +
> +	if (filp->f_op->get_qsize) {

Using file->f_ops looks wrong to me. I think it would be more naturally an
inode operation.

								Honza

> +		res = filp->f_op->get_qsize(inode);
> +		error = copy_to_user(argp, &res, sizeof(res)) ?
> +				-EFAULT : 0;
> +	} else {
> +                if (S_ISDIR(inode->i_mode) || S_ISREG(inode->i_mode) ||
> +                    S_ISLNK(inode->i_mode)) {
> +                        res = inode_get_bytes(inode);
> +                        error = copy_to_user(argp, &res, sizeof(res)) ?
> +                                        -EFAULT : 0;
> +                } else {
> +                        error = -ENOTTY;
> +		}
> +	}
> +	return error;
> +}
> +
>  /*
>   * When you add any new common ioctls to the switches above and below
>   * please update compat_sys_ioctl() too.
> @@ -577,13 +600,7 @@ int do_vfs_ioctl(struct file *filp, unsigned int fd, unsigned int cmd,
>  		break;
>  
>  	case FIOQSIZE:
> -		if (S_ISDIR(inode->i_mode) || S_ISREG(inode->i_mode) ||
> -		    S_ISLNK(inode->i_mode)) {
> -			loff_t res = inode_get_bytes(inode);
> -			error = copy_to_user(argp, &res, sizeof(res)) ?
> -					-EFAULT : 0;
> -		} else
> -			error = -ENOTTY;
> +		error = ioctl_fioqsize(filp, argp);
>  		break;
>  
>  	case FIFREEZE:
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 860b235..70695d3 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -1601,6 +1601,7 @@ struct file_operations {
>  	long (*fallocate)(struct file *file, int mode, loff_t offset,
>  			  loff_t len);
>  	void (*show_fdinfo)(struct seq_file *m, struct file *f);
> +	ssize_t (*get_qsize) (struct inode *);
>  #ifndef CONFIG_MMU
>  	unsigned (*mmap_capabilities)(struct file *);
>  #endif
> -- 
> 1.8.4.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
