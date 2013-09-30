Received: from mail-oa0-x233.google.com ([2607:f8b0:4003:c02::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VQmI3-0001JR-Dp
 for linux-mtd@lists.infradead.org; Mon, 30 Sep 2013 22:50:08 +0000
Received: by mail-oa0-f51.google.com with SMTP id h16so4262588oag.10
 for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2013 15:49:46 -0700 (PDT)
Date: Mon, 30 Sep 2013 15:49:42 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v4 05/12] mtd: nand: print out the cell information for
 nand chip
Message-ID: <20130930224942.GO23337@ld-irv-0074.broadcom.com>
References: <1380092301-21924-1-git-send-email-b32955@freescale.com>
 <1380092301-21924-6-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1380092301-21924-6-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 25, 2013 at 02:58:14PM +0800, Huang Shijie wrote:
> Print out the cell information for nand chip.
> 
> (Since the message is too long, this patch also splits the log
> with two separate pr_info())
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/nand/nand_base.c |   11 +++++++----
>  1 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 94d9084..b94309b 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3460,11 +3460,14 @@ ident_done:
>  	if (mtd->writesize > 512 && chip->cmdfunc == nand_command)
>  		chip->cmdfunc = nand_command_lp;
>  
> -	pr_info("NAND device: Manufacturer ID: 0x%02x, Chip ID: 0x%02x (%s %s),"
> -		" %dMiB, page size: %d, OOB size: %d\n",
> +	pr_info("NAND device: Manufacturer ID: 0x%02x,"
> +			"Chip ID: 0x%02x (%s %s) \n",

You're adding excess whitespace before the '\n'. I'll squash this
myself.

>  		*maf_id, *dev_id, nand_manuf_ids[maf_idx].name,
> -		chip->onfi_version ? chip->onfi_params.model : type->name,
> -		(int)(chip->chipsize >> 20), mtd->writesize, mtd->oobsize);
> +		chip->onfi_version ? chip->onfi_params.model : type->name);
> +
> +	pr_info("NAND device: %dMiB, %s, page size: %d, OOB size: %d\n",
> +		(int)(chip->chipsize >> 20), nand_is_slc(chip) ? "SLC" : "MLC",
> +		mtd->writesize, mtd->oobsize);
>  
>  	return type;
>  }

Brian
