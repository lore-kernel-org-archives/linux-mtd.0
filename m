Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zc8Sh-00063N-4R
 for linux-mtd@lists.infradead.org; Wed, 16 Sep 2015 08:53:08 +0000
Date: Wed, 16 Sep 2015 10:16:48 +0200
From: Jan Kara <jack@suse.cz>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: viro@ZenIV.linux.org.uk, jack@suse.cz, dedekind1@gmail.com,
 richard.weinberger@gmail.com, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v3 07/39] fs: char_dev: introduce cd_acquire function to
 acquire cdev
Message-ID: <20150916081648.GB13325@quack.suse.cz>
References: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1442307754-13233-8-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1442307754-13233-8-git-send-email-yangds.fnst@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue 15-09-15 17:02:02, Dongsheng Yang wrote:
> cd_acquire() works like bd_acquire() to get cdev by an inode,
> this commit is a preparation for lookup_cdev().
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>

Two comments below.

> ---
>  fs/char_dev.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/fs/char_dev.c b/fs/char_dev.c
> index ea06a3d..e818faa 100644
> --- a/fs/char_dev.c
> +++ b/fs/char_dev.c
> @@ -439,6 +439,41 @@ static int exact_lock(dev_t dev, void *data)
>  	return cdev_get(p) ? 0 : -1;
>  }
>  
> +struct cdev *cd_acquire(struct inode *inode)
> +{
> +	struct cdev *cdev;
> +	struct cdev *new = NULL;
> +
> +	spin_lock(&cdev_lock);
> +	cdev = inode->i_cdev;
> +	if (!cdev) {
> +		struct kobject *kobj;
> +		int idx;

Empty line here please to separate variable declarations from the code.

> +		spin_unlock(&cdev_lock);
> +		kobj = kobj_lookup(cdev_map, inode->i_rdev, &idx);
> +		if (!kobj) {
> +			cdev = NULL;
> +			goto out;
> +		}
> +		new = container_of(kobj, struct cdev, kobj);
> +		spin_lock(&cdev_lock);
> +		/* Check i_cdev again in case somebody beat us to it while
> +		   we dropped the lock. */
> +		cdev = inode->i_cdev;
> +		if (!cdev) {
> +			inode->i_cdev = cdev = new;
> +			list_add(&inode->i_devices, &cdev->list);
> +		}

I think you need to put 'new' in case you didn't use it, don't you?

> +	}
> +
> +	if (!cdev_get(cdev))
> +		cdev = NULL;
> +	spin_unlock(&cdev_lock);
> +
> +out:
> +	return cdev;
> +}
> +
>  /**
>   * cdev_add() - add a char device to the system
>   * @p: the cdev structure for the device

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
