Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QHZr3-0001Q1-SL
	for linux-mtd@lists.infradead.org; Wed, 04 May 2011 11:02:54 +0000
Received: by eyh6 with SMTP id 6so335943eyh.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 May 2011 04:02:51 -0700 (PDT)
Subject: Re: [PATCH 1/3] ubifs: add a superblock flag for "LEB fixup"
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <BANLkTi=YnoTophc97QCbujJANpgHXaFpkw@mail.gmail.com>
References: <BANLkTi=YnoTophc97QCbujJANpgHXaFpkw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 04 May 2011 13:59:09 +0300
Message-ID: <1304506749.7222.4.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

thanks for the patches!

On Tue, 2011-05-03 at 18:55 -0400, Matthew L. Creech wrote:
> The leb_fixup flag can be set in the superblock of a new filesystem by
> mkfs.ubifs to indicate that the filesystem's underlying eraseblocks should be
> fixed-up the first time it's mounted (after which the flag is un-set).
> 
> Signed-off-by: Matthew L. Creech <mlcreech@gmail.com>
> ---
>  fs/ubifs/debug.c       |    2 ++
>  fs/ubifs/sb.c          |    2 ++
>  fs/ubifs/ubifs-media.h |    2 ++
>  fs/ubifs/ubifs.h       |    2 ++
>  4 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
> index f7515bd..fc2c48b 100644
> --- a/fs/ubifs/debug.c
> +++ b/fs/ubifs/debug.c
> @@ -316,6 +316,8 @@ void dbg_dump_node(const struct ubifs_info *c,
> const void *node)
>  		printk(KERN_DEBUG "\tflags          %#x\n", sup_flags);
>  		printk(KERN_DEBUG "\t  big_lpt      %u\n",
>  		       !!(sup_flags & UBIFS_FLG_BIGLPT));
> +		printk(KERN_DEBUG "\t  leb_fixup    %u\n",
> +		       !!(sup_flags & UBIFS_FLG_LEB_FIXUP));

I think "LEB fixup" is not the best name. In essence, we are fixing up
the free space, not LEBs perse, so I'd suggest the "free space fix-up"
as the long name and "space_fixup" as the short name for this process.


>  		printk(KERN_DEBUG "\tmin_io_size    %u\n",
>  		       le32_to_cpu(sup->min_io_size));
>  		printk(KERN_DEBUG "\tleb_size       %u\n",
> diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
> index bf31b47..e3777d0 100644
> --- a/fs/ubifs/sb.c
> +++ b/fs/ubifs/sb.c
> @@ -165,6 +165,7 @@ static int create_default_filesystem(struct ubifs_info *c)
>  	tmp64 = (long long)max_buds * c->leb_size;
>  	if (big_lpt)
>  		sup_flags |= UBIFS_FLG_BIGLPT;
> +	/* LEB fixup is not needed for a default filesystem */

I think this comment is much more confusing than useful, let's kill it.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
