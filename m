Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QvPxK-0001Kk-U7
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2011 08:34:04 +0000
Received: by gwb1 with SMTP id 1so3586039gwb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2011 01:34:00 -0700 (PDT)
Subject: Re: [RFC 1/5] mtd: support MTD_MODE_RAW for writing OOB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 22 Aug 2011 11:35:47 +0300
In-Reply-To: <1313625029-19546-2-git-send-email-computersforpeace@gmail.com>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
	<1313625029-19546-2-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1314002153.2644.69.camel@sauron>
Mime-Version: 1.0
Cc: Mike Frysinger <vapier.adi@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
	b35362@freescale.com, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-08-17 at 16:50 -0700, Brian Norris wrote:
> mtd_do_write_oob does not pass information about whether to write in RAW
> mode to the lower layers (e.g., NAND). We should pass MTD_OOB_RAW or
> MTD_OOB_PLACE based on the MTD file mode.
> 
> This fixes issues with `nandwrite -n' and the MEMWRITEOOB[64] ioctls.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

I guess this patch deserves to be non-RFC? Should it be pushed to
l2-mtd-2.6.git? Should it even have "Cc: stable@kernel.org [kernel
version +] ?

> ---
>  drivers/mtd/mtdchar.c        |    3 ++-
>  drivers/mtd/nand/nand_base.c |    9 ++++++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index a75d555..7ca4361 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -391,6 +391,7 @@ static int mtd_do_writeoob(struct file *file, struct mtd_info *mtd,
>  	uint64_t start, uint32_t length, void __user *ptr,
>  	uint32_t __user *retp)
>  {
> +	struct mtd_file_info *mfi = file->private_data;
>  	struct mtd_oob_ops ops;
>  	uint32_t retlen;
>  	int ret = 0;
> @@ -412,7 +413,7 @@ static int mtd_do_writeoob(struct file *file, struct mtd_info *mtd,
>  	ops.ooblen = length;
>  	ops.ooboffs = start & (mtd->oobsize - 1);
>  	ops.datbuf = NULL;
> -	ops.mode = MTD_OOB_PLACE;
> +	ops.mode = (mfi->mode == MTD_MODE_RAW) ? MTD_OOB_RAW : MTD_OOB_PLACE;

Would be really great to document things while you are in it - e.g.,
putting a little note in include/linux/mtd/mtd.h that MTD_OOB_PLACE is
the default mode. And of course documenting the modes in this file a bit
more would be also great. I encourage you to store the wisdom you gain
in the comments :-)

>  
>  	if (ops.ooboffs && ops.ooblen > (mtd->oobsize - ops.ooboffs))
>  		return -EINVAL;
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index d2ee68a..e2b1c90 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2401,7 +2401,14 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
>  		chip->pagebuf = -1;
>  
>  	nand_fill_oob(mtd, ops->oobbuf, ops->ooblen, ops);
> -	status = chip->ecc.write_oob(mtd, chip, page & chip->pagemask);
> +
> +	if (ops->mode == MTD_OOB_RAW) {
> +		status = 0;
> +		chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
> +		chip->ecc.write_page_raw(mtd, chip, NULL);

Strange that write_page_raw does not return an error code - it cannot
fail? But this is a separate issue anyway.

> +	} else {
> +		status = chip->ecc.write_oob(mtd, chip, page & chip->pagemask);
> +	}
>  
>  	if (status)
>  		return status;


-- 
Best Regards,
Artem Bityutskiy
