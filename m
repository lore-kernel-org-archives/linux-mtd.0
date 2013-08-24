Received: from mail-pb0-x22e.google.com ([2607:f8b0:400e:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VD6s3-0004gA-31
 for linux-mtd@lists.infradead.org; Sat, 24 Aug 2013 05:58:48 +0000
Received: by mail-pb0-f46.google.com with SMTP id rq2so1468304pbb.33
 for <linux-mtd@lists.infradead.org>; Fri, 23 Aug 2013 22:58:25 -0700 (PDT)
Date: Fri, 23 Aug 2013 22:58:21 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v2 3/9] mtd: print out the cell information for nand chip
Message-ID: <20130824055821.GB32074@brian-ubuntu>
References: <1376879478-22128-1-git-send-email-b32955@freescale.com>
 <1376879478-22128-4-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376879478-22128-4-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, akinobu.mita@gmail.com,
 matthieu.castet@parrot.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 19, 2013 at 10:31:12AM +0800, Huang Shijie wrote:
> Print out the cell information for nand chip.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/nand/nand_base.c |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 69c4b25..8b487d5 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3454,10 +3454,11 @@ ident_done:
>  		chip->cmdfunc = nand_command_lp;
>  
>  	pr_info("NAND device: Manufacturer ID: 0x%02x, Chip ID: 0x%02x (%s %s),"
> -		" %dMiB, page size: %d, OOB size: %d\n",
> +		" %dMiB, %s, page size: %d, OOB size: %d\n",
>  		*maf_id, *dev_id, nand_manuf_ids[maf_idx].name,
>  		chip->onfi_version ? chip->onfi_params.model : type->name,
> -		(int)(chip->chipsize >> 20), mtd->writesize, mtd->oobsize);
> +		(int)(chip->chipsize >> 20), nand_is_slc(chip) ? "SLC" : "MLC",
> +		mtd->writesize, mtd->oobsize);

This message is getting mighty long (approx. 120 characters when
printed). Are you sure we need all this? Maybe split into two separate
pr_info's sometime. But I'm OK with merging this for now.

>  
>  	return type;
>  }

Brian
