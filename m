Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMM2J-0005aA-Gj
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 20:08:40 +0000
Date: Mon, 3 Aug 2015 22:08:06 +0200
From: Jan Kara <jack@suse.cz>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: viro@ZenIV.linux.org.uk, jack@suse.cz, dedekind1@gmail.com,
 richard.weinberger@gmail.com, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 08/35] fs: introduce a __lookup_dev for internal using
Message-ID: <20150803200806.GF23810@quack.suse.cz>
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-9-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1438235311-23788-9-git-send-email-yangds.fnst@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu 30-07-15 13:48:04, Dongsheng Yang wrote:
> This commit introduce a file of fs/dev.c at first. This is
> a internal file shared by block_dev and char_dev. There is
> only one function in it __lookup_dev which will be wrapped
> to be lookup_bdev and loopup_cdev.
> 
> We will put more code in this file which is shared by
> block_dev and char_dev.
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
>  fs/Makefile    |  2 +-
>  fs/block_dev.c | 26 ++------------------
>  fs/dev.c       | 77 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  fs/internal.h  | 14 +++++++++++
>  4 files changed, 94 insertions(+), 25 deletions(-)
>  create mode 100644 fs/dev.c
> 
...
> +/**
> + * __lookup_dev  - lookup a block_device or cdev by name
> + * @pathname:	special file representing the device
> + * @cdevp:	cdev would be returned by cdevp
> + * @bdevp:	block_device would be returned by bdevp
> + *
> + * Get a reference to the block_deivce or cdev at @pathname in
> + * the current namespace if possible and return it.
> + */
> +int __lookup_dev(const char *pathname, struct cdev **cdevp,
> +	       struct block_device **bdevp)
> +{
> +	struct inode *inode;
> +	struct path path;
> +	int error = 0;
> +
> +	if (!pathname || !*pathname)
> +		return -EINVAL;
> +
> +	error = kern_path(pathname, LOOKUP_FOLLOW, &path);
> +	if (error)
> +		return error;
> +
> +	inode = d_backing_inode(path.dentry);
> +
> +	/**
> +	 * We need at least one of bdevp and cdevp to be NULL,
> +	 * but cdevp and bdevp can not be both NULL.
> +	 */
> +	error = -EINVAL;
> +	if (!(cdevp || bdevp) || (cdevp && bdevp))
> +		goto out;

Why don't you allow both cdevp and bdevp to be set and in that case accept
both block & character device and just set appropriate pointer and the
other one to NULL? Then quota code wouldn't have to search twice...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
