Received: from mail-ew0-f223.google.com ([209.85.219.223])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NCWvf-0003Qh-T4
	for linux-mtd@lists.infradead.org; Mon, 23 Nov 2009 11:18:04 +0000
Received: by ewy23 with SMTP id 23so1235409ewy.4
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 Nov 2009 03:17:58 -0800 (PST)
Date: Mon, 23 Nov 2009 13:17:44 +0200
From: Dan Carpenter <error27@gmail.com>
To: Joern Engel <joern@logfs.org>
Subject: Re: [PATCH 5/17] [LogFS] dir.c
Message-ID: <20091123111744.GA17527@bicker>
References: <20091120181113.GA2159@logfs.org>
	<E1NBZIP-0003g2-0r@longford.logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1NBZIP-0003g2-0r@longford.logfs.org>
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 20, 2009 at 08:37:29PM +0100, Joern Engel wrote:
> +static int logfs_unlink(struct inode *dir, struct dentry *dentry)
> +{
> +	struct logfs_super *super = logfs_super(dir->i_sb);
> +	struct inode *inode = dentry->d_inode;
> +	struct logfs_transaction *ta;
> +	struct page *page;
> +	pgoff_t index;
> +	int ret;
> +
> +	ta = kzalloc(sizeof(*ta), GFP_KERNEL);
> +	if (!ta)
> +		return -ENOMEM;
> +
> +	ta->state = UNLINK_1;
> +	ta->ino = inode->i_ino;
> +
> +	inode->i_ctime = dir->i_ctime = dir->i_mtime = CURRENT_TIME;
> +
> +	page = logfs_get_dd_page(dir, dentry);
> +	if (!page)

kfree(ta);

> +		return -ENOENT;
> +	if (IS_ERR(page))

kfree(ta);

> +		return PTR_ERR(page);

regards,
dan carpenter
