Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IaYXU-0005DZ-3S
	for linux-mtd@lists.infradead.org; Wed, 26 Sep 2007 11:11:03 -0400
Subject: Re: [PATCH] MTD: NAND: Fix bad-block detection for 8-bit NAND
From: Thomas Gleixner <tglx@linutronix.de>
To: haver@vnet.ibm.com
In-Reply-To: <1190815823.21594.30.camel@august>
References: <1190815823.21594.30.camel@august>
Content-Type: text/plain
Date: Wed, 26 Sep 2007 17:10:26 +0200
Message-Id: <1190819426.23376.26.camel@chaos>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD Mailinglist <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 2007-09-26 at 16:10 +0200, Frank Haverkamp wrote:
> Hi Thomas,
> 
> I found the following block in our 128MiB NAND flash:
> 
> hexdump vic.img.460 
> 0000000 0000 0000 0000 0000 0000 0000 0000 0000
> *
> 0000800 00ff 0000 0000 0000 0000 0000 0000 0000
> 0000810 0000 0000 0000 0000 0000 0000 0000 0000
> *
> 0001040 00ff 0000 0000 0000 0000 0000 0000 0000
> 0001050 0000 0000 0000 0000 0000 0000 0000 0000
> *
> 0021000
> 
> According to the specification this is a good block, because the bytes
> in the 1st two OOB areas at offset 0 are 0xff. Nevertheless it was
> detected bad because:
> 
> static struct nand_bbt_descr largepage_memorybased = {
> 	.options = 0,
> 	.offs = 0,
> 	.len = 2,                    /* <<<< bytes to check!!! */
> 	.pattern = scan_ff_pattern
> };
> 
> used a len of 2 instead of 1, which I consider to be correct. Here a
> potential fix for the problem. Please have a look if it matches your
> understanding of the specification.
> 
> Signed-off-by: Frank Haverkamp <haver@vnet.ibm.com>

Acked-by: Thomas Gleixner <tglx@linutronix.de>

> ---
>  drivers/mtd/nand/nand_bbt.c |   20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> --- ubi-2.6.git.orig/drivers/mtd/nand/nand_bbt.c
> +++ ubi-2.6.git/drivers/mtd/nand/nand_bbt.c
> @@ -1081,7 +1081,14 @@ static struct nand_bbt_descr smallpage_m
>  	.pattern = scan_ff_pattern
>  };
>  
> -static struct nand_bbt_descr largepage_memorybased = {
> +static struct nand_bbt_descr largepage_memorybased_8bit = {
> +	.options = 0,
> +	.offs = 0,
> +	.len = 1,
> +	.pattern = scan_ff_pattern
> +};
> +
> +static struct nand_bbt_descr largepage_memorybased_16bit = {
>  	.options = 0,
>  	.offs = 0,
>  	.len = 2,
> @@ -1179,8 +1186,15 @@ int nand_default_bbt(struct mtd_info *mt
>  		this->bbt_td = NULL;
>  		this->bbt_md = NULL;
>  		if (!this->badblock_pattern) {
> -			this->badblock_pattern = (mtd->writesize > 512) ?
> -			    &largepage_memorybased : &smallpage_memorybased;
> +			if (mtd->writesize > 512) {
> +				if (this->options & NAND_BUSWIDTH_16)
> +					this->badblock_pattern =
> +						&largepage_memorybased_16bit;
> +				else
> +					this->badblock_pattern =
> +					       &largepage_memorybased_8bit;
> +			} else
> +				this->badblock_pattern = &smallpage_memorybased;
>  		}
>  	}
>  	return nand_scan_bbt(mtd, this->badblock_pattern);
> 
