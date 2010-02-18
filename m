Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ni43N-0001Y0-E6
	for linux-mtd@lists.infradead.org; Thu, 18 Feb 2010 10:56:22 +0000
Subject: Re: [PATCH 17/19] ubifs: replace inode uid,gid,mode initialization
	with helper function
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Monakhov <dmonakhov@openvz.org>
In-Reply-To: <1266432380-9951-1-git-send-email-dmonakhov@openvz.org>
References: <1266431353-8549-1-git-send-email-dmonakhov@openvz.org>
	<1266432380-9951-1-git-send-email-dmonakhov@openvz.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 18 Feb 2010 12:54:54 +0200
Message-ID: <1266490494.16891.17.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-02-17 at 21:46 +0300, Dmitry Monakhov wrote:
> Signed-off-by: Dmitry Monakhov <dmonakhov@openvz.org>

Acked-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

> ---
>  fs/ubifs/dir.c |    9 +--------
>  1 files changed, 1 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> index 552fb01..5a357bf 100644
> --- a/fs/ubifs/dir.c
> +++ b/fs/ubifs/dir.c
> @@ -104,14 +104,7 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, const struct inode *dir,
>  	 */
>  	inode->i_flags |= (S_NOCMTIME);
>  
> -	inode->i_uid = current_fsuid();
> -	if (dir->i_mode & S_ISGID) {
> -		inode->i_gid = dir->i_gid;
> -		if (S_ISDIR(mode))
> -			mode |= S_ISGID;
> -	} else
> -		inode->i_gid = current_fsgid();
> -	inode->i_mode = mode;
> +	inode_init_owner(inode, dir, mode);
>  	inode->i_mtime = inode->i_atime = inode->i_ctime =
>  			 ubifs_current_time(inode);
>  	inode->i_mapping->nrpages = 0;


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
