Received: from perceval.ideasonboard.com ([95.142.166.194])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RyZw7-00078p-Jd
 for linux-mtd@lists.infradead.org; Sat, 18 Feb 2012 02:22:08 +0000
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bastian Hecht <hechtb@googlemail.com>
Subject: Re: [PATCH v2 2/7] mtd: sh_flctl: Reorder empty_fifo() calls
Date: Sat, 18 Feb 2012 03:21:31 +0100
Message-ID: <2825429.HMivvWFhbq@avalon>
In-Reply-To: <1328960705-18699-3-git-send-email-hechtb@gmail.com>
References: <1328960705-18699-1-git-send-email-hechtb@gmail.com>
 <1328960705-18699-3-git-send-email-hechtb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-mtd@lists.infradead.org,
 linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Bastian,

Thanks for the patch.

On Saturday 11 February 2012 12:45:00 Bastian Hecht wrote:
> Reorders the calls to make it a bit shorter and match the calling
> procedure displayed in the datasheet.

Could you point me to the datasheet section in which the order is documented ?

> Signed-off-by: Bastian Hecht <hechtb@gmail.com>
> ---
> changelog: exactly same as patch v1.
> 
>  drivers/mtd/nand/sh_flctl.c |    4 +---
>  1 files changed, 1 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
> index 93b1f74..8c97367 100644
> --- a/drivers/mtd/nand/sh_flctl.c
> +++ b/drivers/mtd/nand/sh_flctl.c
> @@ -525,7 +525,6 @@ static void flctl_cmdfunc(struct mtd_info *mtd, unsigned
> int command, execmd_read_page_sector(mtd, page_addr);
>  			break;
>  		}
> -		empty_fifo(flctl);
>  		if (flctl->page_size)
>  			set_cmd_regs(mtd, command, (NAND_CMD_READSTART << 8)
> 
>  				| command);
> 
> @@ -547,7 +546,6 @@ static void flctl_cmdfunc(struct mtd_info *mtd, unsigned
> int command, break;
>  		}
> 
> -		empty_fifo(flctl);
>  		if (flctl->page_size) {
>  			set_cmd_regs(mtd, command, (NAND_CMD_READSTART << 8)
> 
>  				| NAND_CMD_READ0);
> 
> @@ -560,7 +558,6 @@ static void flctl_cmdfunc(struct mtd_info *mtd, unsigned
> int command, goto read_normal_exit;
> 
>  	case NAND_CMD_READID:
> -		empty_fifo(flctl);

This case doesn't end up in the read_normal_exit label. The empty_fifo() call 
will thus be completely removed. Is that intentional ?

>  		set_cmd_regs(mtd, command, command);
>  		set_addr(mtd, 0, 0);
> 
> @@ -654,6 +651,7 @@ static void flctl_cmdfunc(struct mtd_info *mtd, unsigned
> int command,
> 
>  read_normal_exit:
>  	writel(flctl->read_bytes, FLDTCNTR(flctl));	/* set read size */
> +	empty_fifo(flctl);
>  	start_translation(flctl);
>  	read_fiforeg(flctl, flctl->read_bytes, 0);
>  	wait_completion(flctl);
-- 
Regards,

Laurent Pinchart
