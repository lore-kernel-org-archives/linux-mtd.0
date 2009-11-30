Date: Mon, 30 Nov 2009 02:51:05 -0500
Message-Id: <200911300751.nAU7p53e022740@agora.fsl.cs.sunysb.edu>
From: Erez Zadok <ezk@cs.sunysb.edu>
To: Valerie Aurora <vaurora@redhat.com>
Subject: Re: [PATCH 16/41] whiteout: jffs2 whiteout support 
In-reply-to: Your message of "Wed, 21 Oct 2009 12:19:14 PDT."
	<1256152779-10054-17-git-send-email-vaurora@redhat.com>
Cc: Scott James Remnant <scott@canonical.com>, Felix Fietkau <nbd@openwrt.org>,
	"J. R. Okajima" <hooanon05@yahoo.co.jp>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org,
	Sandu Popa Marius <sandupopamarius@gmail.com>,
	linux-mtd@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
	Andy Whitcroft <apw@canonical.com>,
	Vladimir Dronnikov <dronnikov@gmail.com>, Jan Blunck <jblunck@suse.de>,
	David Woodhouse <dwmw2@infradead.org>,
	Jan Rekorajski <baggins@sith.mimuw.edu.pl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In message <1256152779-10054-17-git-send-email-vaurora@redhat.com>, Valerie Aurora writes:
> From: Felix Fietkau <nbd@openwrt.org>
> 
> Add support for whiteout dentries to jffs2.
> 
> Signed-off-by: Felix Fietkau <nbd@openwrt.org>
> Signed-off-by: Valerie Aurora <vaurora@redhat.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: linux-mtd@lists.infradead.org
> ---
>  fs/jffs2/dir.c        |   77 +++++++++++++++++++++++++++++++++++++++++++++++-
>  fs/jffs2/fs.c         |    4 ++
>  fs/jffs2/super.c      |    2 +-
>  include/linux/jffs2.h |    2 +
>  4 files changed, 82 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
> index 6f60cc9..46a2e1b 100644
> --- a/fs/jffs2/dir.c
> +++ b/fs/jffs2/dir.c
> @@ -34,6 +34,8 @@ static int jffs2_mknod (struct inode *,struct dentry *,int,dev_t);
>  static int jffs2_rename (struct inode *, struct dentry *,
>  			 struct inode *, struct dentry *);
>  
> +static int jffs2_whiteout (struct inode *, struct dentry *, struct dentry *);
> +
>  const struct file_operations jffs2_dir_operations =
>  {
>  	.read =		generic_read_dir,
> @@ -55,6 +57,7 @@ const struct inode_operations jffs2_dir_inode_operations =
>  	.rmdir =	jffs2_rmdir,
>  	.mknod =	jffs2_mknod,
>  	.rename =	jffs2_rename,
> +	.whiteout =     jffs2_whiteout,
>  	.permission =	jffs2_permission,
>  	.setattr =	jffs2_setattr,
>  	.setxattr =	jffs2_setxattr,
> @@ -98,8 +101,18 @@ static struct dentry *jffs2_lookup(struct inode *dir_i, struct dentry *target,
>  			fd = fd_list;
>  		}
>  	}
> -	if (fd)
> -		ino = fd->ino;
> +	if (fd) {
> +		spin_lock(&target->d_lock);
> +		switch(fd->type) {
> +		case DT_WHT:
> +			target->d_flags |= DCACHE_WHITEOUT;
> +			break;
> +		default:
> +			ino = fd->ino;
> +			break;
> +		}
> +		spin_unlock(&target->d_lock);
> +	}

The switch statement above should be simplified into this:

 if (fd->type == DT_WHT)
	target->d_flags |= DCACHE_WHITEOUT;
 else
	ino = fd->ino;

> +	/* If it's a directory, then check whether it is really empty
> +	 */

Format above comment on one line.

Erez.
