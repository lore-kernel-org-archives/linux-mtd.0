Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHe7Z-0003RB-3H
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 20:26:37 +0000
Date: Tue, 21 Jul 2015 11:20:12 +0200
From: Jan Kara <jack@suse.cz>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: dedekind1@gmail.com, richard.weinberger@gmail.com, jack@suse.com,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH 05/25] fs: char_dev: introduce lookup_cdev function to
 find cdev by name
Message-ID: <20150721092012.GG6533@quack.suse.cz>
References: <1437467876-22106-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1437467876-22106-6-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1437467876-22106-6-git-send-email-yangds.fnst@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue 21-07-15 16:37:36, Dongsheng Yang wrote:
> Function lookup_cdev works similar with lookup_bdev, we can get
> a cdev instance by lookup_cdev with a parameter of dev name.
> 
> This function will be used in quotactl to get a cdev by a dev name.
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
>  fs/char_dev.c      | 72 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/fs.h |  2 ++
>  2 files changed, 74 insertions(+)

Thanks for the patch.

...
> +struct cdev *lookup_cdev(const char *pathname)
> +{
> +	struct cdev *cdev;
> +	struct inode *inode;
> +	struct path path;
> +	int error;
> +
> +	if (!pathname || !*pathname)
> +		return ERR_PTR(-EINVAL);
> +
> +	error = kern_path(pathname, LOOKUP_FOLLOW, &path);
> +	if (error)
> +		return ERR_PTR(error);
> +
> +	inode = d_backing_inode(path.dentry);
> +	error = -ENODEV;
> +	if (!S_ISCHR(inode->i_mode))
> +		goto fail;
> +	error = -EACCES;
> +	if (path.mnt->mnt_flags & MNT_NODEV)
> +		goto fail;
> +	error = -ENXIO;
> +	cdev = cd_acquire(inode);
> +	if (!cdev)
> +		goto fail;
> +out:
> +	path_put(&path);
> +	return cdev;
> +fail:
> +	cdev = ERR_PTR(error);
> +	goto out;
> +}

Again I don't like the code duplication here. Can we have a common
function lookup_dev() like:

int lookup_dev(const char *pathname, struct cdev **cdevp,
	       struct block_device **bdevp)
{
	struct inode *inode;
	struct path path;
	int error;

	if (!pathname || !*pathname)
		return -EINVAL;

	error = kern_path(pathname, LOOKUP_FOLLOW, &path);
	if (error)
		return error;

	inode = d_backing_inode(path.dentry);
	error = -ENODEV;

	if (!((S_ISCHR(inode->i_mode) && cdevp) ||
	      (S_ISBLK(inode->i_mode) && bdevp)))
		goto out;
	error = -EACCES;
	if (path.mnt->mnt_flags & MNT_NODEV)
		goto out;
	error = -ENXIO;
	if (S_ISCHR(inode->i_mode)) {
		struct cdev *cdev;

		cdev = cd_acquire(inode);
		if (!cdev)
			goto out;
		*cdevp = cdev;
	} else {
		struct block_device *bdev;

		bdev = bd_acquire(inode);
		if (!bdev)
			goto out;
		*bdevp = bdev;
	}
	error = 0;
out:
	path_put(&path);
	return error;
}

It is then easy to wrap lookup_bdev() around it. I'm not too happy about
the function prototype but I still think it's better than the duplication.
Al? Also quota code can then easily use this lookup_dev() function instead
of trying one device type and then another one...

								Honza
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
