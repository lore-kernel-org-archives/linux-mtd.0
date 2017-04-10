Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cxU49-000747-Jr
 for linux-mtd@lists.infradead.org; Mon, 10 Apr 2017 07:48:51 +0000
Subject: Re: [PATCH v1 2/3] fs: ubifs: i_version on inode changes
To: Oleksij Rempel <o.rempel@pengutronix.de>, richard@nod.at,
 dedekind1@gmail.com, adrian.hunter@intel.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20170410065346.1992-1-o.rempel@pengutronix.de>
 <20170410065346.1992-2-o.rempel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
From: Oleksij Rempel <ore@pengutronix.de>
Message-ID: <09e03927-5544-c469-7c30-3449c5777e22@pengutronix.de>
Date: Mon, 10 Apr 2017 09:48:25 +0200
MIME-Version: 1.0
In-Reply-To: <20170410065346.1992-2-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

please ignore this patch. It need to be updated.

On 04/10/2017 08:53 AM, Oleksij Rempel wrote:
> From: Sascha Hauer <s.hauer@pengutronix.de>
>
> This is necessary for IMA/EVM to detect changes on inodes.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  fs/ubifs/dir.c   | 8 --------
>  fs/ubifs/file.c  | 2 ++
>  fs/ubifs/super.c | 3 +--
>  3 files changed, 3 insertions(+), 10 deletions(-)
>
> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> index 30825d882aa9..4a300bfabf9b 100644
> --- a/fs/ubifs/dir.c
> +++ b/fs/ubifs/dir.c
> @@ -111,14 +111,6 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, struct inode *dir,
>  	if (!inode)
>  		return ERR_PTR(-ENOMEM);
>
> -	/*
> -	 * Set 'S_NOCMTIME' to prevent VFS form updating [mc]time of inodes and
> -	 * marking them dirty in file write path (see 'file_update_time()').
> -	 * UBIFS has to fully control "clean <-> dirty" transitions of inodes
> -	 * to make budgeting work.
> -	 */
> -	inode->i_flags |= S_NOCMTIME;
> -
>  	inode_init_owner(inode, dir, mode);
>  	inode->i_mtime = inode->i_atime = inode->i_ctime =
>  			 ubifs_current_time(inode);
> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> index d9ae86f96df7..3cbc662ce160 100644
> --- a/fs/ubifs/file.c
> +++ b/fs/ubifs/file.c
> @@ -1391,6 +1391,8 @@ int ubifs_update_time(struct inode *inode, struct timespec *time,
>  		return err;
>
>  	mutex_lock(&ui->ui_mutex);
> +	if (flags & S_VERSION)
> +		inode_inc_iversion(inode);
>  	if (flags & S_ATIME)
>  		inode->i_atime = *time;
>  	if (flags & S_CTIME)
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index 61180bee38b4..76e44ab88065 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -128,9 +128,8 @@ struct inode *ubifs_iget(struct super_block *sb, unsigned long inum)
>  	if (err)
>  		goto out_ino;
>
> -	inode->i_flags |= S_NOCMTIME;
>  #ifndef CONFIG_UBIFS_ATIME_SUPPORT
> -	inode->i_flags |= S_NOATIME;
> +	inode->i_flags |= S_NOATIME | S_NOCMTIME;
>  #endif
>  	set_nlink(inode, le32_to_cpu(ino->nlink));
>  	i_uid_write(inode, le32_to_cpu(ino->uid));
>
