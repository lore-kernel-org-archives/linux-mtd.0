Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMM2o-0005kD-8c
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 20:09:11 +0000
Date: Mon, 3 Aug 2015 22:08:45 +0200
From: Jan Kara <jack@suse.cz>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: viro@ZenIV.linux.org.uk, jack@suse.cz, dedekind1@gmail.com,
 richard.weinberger@gmail.com, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 09/35] fs: char_dev: introduce lookup_cdev to get cdev
 by pathname
Message-ID: <20150803200845.GG23810@quack.suse.cz>
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-10-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1438235311-23788-10-git-send-email-yangds.fnst@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu 30-07-15 13:48:05, Dongsheng Yang wrote:
> Function lookup_cdev works similarly with lookup_bdev, we can get
> a cdev instance by lookup_cdev with a parameter of dev name.
> 
> This function will be used in quotactl to get a cdev by a dev name.
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>

The patch looks good. You can add:

Reviewed-by: Jan Kara <jack@suse.com>

								Honza

> ---
>  fs/char_dev.c      | 13 +++++++++++++
>  include/linux/fs.h |  2 ++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/fs/char_dev.c b/fs/char_dev.c
> index e818faa..12c1bd5 100644
> --- a/fs/char_dev.c
> +++ b/fs/char_dev.c
> @@ -474,6 +474,18 @@ out:
>  	return cdev;
>  }
>  
> +struct cdev *lookup_cdev(const char *pathname)
> +{
> +	struct cdev *cdev;
> +	int error;
> +
> +	error = __lookup_dev(pathname, &cdev, NULL);
> +	if (error)
> +		return ERR_PTR(error);
> +
> +	return cdev;
> +}
> +
>  /**
>   * cdev_add() - add a char device to the system
>   * @p: the cdev structure for the device
> @@ -596,6 +608,7 @@ void __init chrdev_init(void)
>  EXPORT_SYMBOL(register_chrdev_region);
>  EXPORT_SYMBOL(unregister_chrdev_region);
>  EXPORT_SYMBOL(alloc_chrdev_region);
> +EXPORT_SYMBOL(lookup_cdev);
>  EXPORT_SYMBOL(cdev_init);
>  EXPORT_SYMBOL(cdev_alloc);
>  EXPORT_SYMBOL(cdev_del);
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 5c7d789..860b235 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2308,6 +2308,8 @@ extern void __unregister_chrdev(unsigned int major, unsigned int baseminor,
>  				unsigned int count, const char *name);
>  extern void unregister_chrdev_region(dev_t, unsigned);
>  extern void chrdev_show(struct seq_file *,off_t);
> +extern struct cdev *lookup_cdev(const char *);
> +
>  
>  static inline int register_chrdev(unsigned int major, const char *name,
>  				  const struct file_operations *fops)
> -- 
> 1.8.4.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
