Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zbxj7-00072a-Aw
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2015 21:25:22 +0000
Date: Tue, 15 Sep 2015 23:24:57 +0200
From: Jan Kara <jack@suse.cz>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: viro@ZenIV.linux.org.uk, jack@suse.cz, dedekind1@gmail.com,
 richard.weinberger@gmail.com, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v3 06/39] fs: super: introduce a get_super_cdev_thawed to
 get sb by cdev reference
Message-ID: <20150915212457.GA13325@quack.suse.cz>
References: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1442307754-13233-7-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1442307754-13233-7-git-send-email-yangds.fnst@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue 15-09-15 17:02:01, Dongsheng Yang wrote:
> This patch refactors the original get_super_thawed to get a common
> helper function of __get_super_thawed. Then take the use of
> __get_super_thawed, we can implement get_super_cdev_thawed easily.
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>

The patch looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.com>

								Honza

> ---
>  fs/super.c         | 29 +++++++++++++++++++++++++----
>  include/linux/fs.h |  1 +
>  2 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/super.c b/fs/super.c
> index 321d16b..df32393 100644
> --- a/fs/super.c
> +++ b/fs/super.c
> @@ -629,18 +629,20 @@ struct super_block *get_super_cdev(struct cdev *cdev)
>  EXPORT_SYMBOL(get_super_cdev);
>  
>  /**
> - * get_super_thawed - get thawed superblock of a device
> - * @bdev: device to get the superblock for
> + * __get_super_thawed - get thawed superblock
> + * @func: function pointer to get superblock by key
> + * @key: key to find superblock
>   *
>   * Scans the superblock list and finds the superblock of the file system
>   * mounted on the device. The superblock is returned once it is thawed
>   * (or immediately if it was not frozen). %NULL is returned if no match
>   * is found.
>   */
> -struct super_block *get_super_thawed(struct block_device *bdev)
> +static struct super_block *__get_super_thawed(
> +		int (*compare)(struct super_block *, void *), void *key)
>  {
>  	while (1) {
> -		struct super_block *s = get_super(bdev);
> +		struct super_block *s = __get_super(compare, key);
>  		if (!s || s->s_writers.frozen == SB_UNFROZEN)
>  			return s;
>  		up_read(&s->s_umount);
> @@ -649,9 +651,28 @@ struct super_block *get_super_thawed(struct block_device *bdev)
>  		put_super(s);
>  	}
>  }
> +
> +/**
> + * get_super_thawed - get thawed superblock of a device
> + * @bdev: device to get the superblock for
> + */
> +struct super_block *get_super_thawed(struct block_device *bdev)
> +{
> +	return __get_super_thawed(bdev_compare, bdev);
> +}
>  EXPORT_SYMBOL(get_super_thawed);
>  
>  /**
> + * get_super_cdev_thawed - get thawed superblock of a char device
> + * @cdev: device to get the superblock for
> + */
> +struct super_block *get_super_cdev_thawed(struct cdev *cdev)
> +{
> +	return __get_super_thawed(cdev_compare, cdev);
> +}
> +EXPORT_SYMBOL(get_super_cdev_thawed);
> +
> +/**
>   * get_active_super - get an active reference to the superblock of a device
>   * @bdev: device to get the superblock for
>   *
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index df71cbb..2c1c122 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2798,6 +2798,7 @@ extern struct file_system_type *get_fs_type(const char *name);
>  extern struct super_block *get_super(struct block_device *);
>  extern struct super_block *get_super_cdev(struct cdev *);
>  extern struct super_block *get_super_thawed(struct block_device *);
> +extern struct super_block *get_super_cdev_thawed(struct cdev *);
>  extern struct super_block *get_active_super(struct block_device *bdev);
>  extern void drop_super(struct super_block *sb);
>  extern void iterate_supers(void (*)(struct super_block *, void *), void *);
> -- 
> 1.8.4.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
