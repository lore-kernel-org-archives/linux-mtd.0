Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6ds6-0007ze-RF
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 07:06:51 +0000
Received: by wyb28 with SMTP id 28so5349960wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Apr 2011 00:06:44 -0700 (PDT)
Subject: Re: [PATCH] ubifs: Use empty_iops and empty_fops consistently
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sedat Dilek <sedat.dilek@googlemail.com>
In-Reply-To: <1301874939-2630-1-git-send-email-sedat.dilek@gmail.com>
References: <1301874939-2630-1-git-send-email-sedat.dilek@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 04 Apr 2011 10:04:16 +0300
Message-ID: <1301900656.2760.6.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Sedat Dilek <sedat.dilek@gmail.com>, Jens Axboe <jaxboe@fusionio.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-04-04 at 01:55 +0200, Sedat Dilek wrote:
> Follow the nomenclature as we did for empty_aops and rename
> to empty_iops and empty_fops.
> 
> This patch is on top of linux-2.6-block.git#for-linus.
> 
> Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
> CC: Artem Bityutskiy <dedekind1@gmail.com>
> CC: Adrian Hunter <adrian.hunter@nokia.com>
> CC: Jens Axboe <jaxboe@fusionio.com>
> ---
>  fs/ubifs/xattr.c |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
> index 3299f46..16f19f5 100644
> --- a/fs/ubifs/xattr.c
> +++ b/fs/ubifs/xattr.c
> @@ -80,8 +80,8 @@ enum {
>  	SECURITY_XATTR,
>  };
>  
> -static const struct inode_operations none_inode_operations;
> -static const struct file_operations none_file_operations;
> +static const struct inode_operations empty_iops;
> +static const struct file_operations empty_fops;
>  
>  /**
>   * create_xattr - create an extended attribute.
> @@ -131,8 +131,8 @@ static int create_xattr(struct ubifs_info *c, struct inode *host,
>  
>  	/* Re-define all operations to be "nothing" */
>  	inode->i_mapping->a_ops = &empty_aops;
> -	inode->i_op = &none_inode_operations;
> -	inode->i_fop = &none_file_operations;
> +	inode->i_op = &empty_iops;
> +	inode->i_fop = &empty_fops;
>  
>  	inode->i_flags |= S_SYNC | S_NOATIME | S_NOCMTIME | S_NOQUOTA;
>  	ui = ubifs_inode(inode);

Well, this re-naming looks strange for me. I could understand if you had
a global exported empty_*ops which you could share and shrink the .data
size a bit. But this re-naming just looks useles, if you take into
account the breakage and the men-hours we spend to write e-mails to this
thread - really did not worth it. Or I miss something?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
