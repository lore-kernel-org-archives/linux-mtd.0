Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d5ScI-0004En-4c
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 07:53:04 +0000
Date: Tue, 2 May 2017 09:52:30 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH] mtd: nand: free vendor-specific resources in init
 failure paths
Message-ID: <20170502095230.2cd20b1c@bbrezillon>
In-Reply-To: <20170502000455.13240-4-computersforpeace@gmail.com>
References: <20170502000455.13240-1-computersforpeace@gmail.com>
 <20170502000455.13240-4-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon,  1 May 2017 17:04:53 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> If we fail any time after calling nand_detect(), then we don't call the
> vendor-specific ->cleanup() callback, and we'll leak any resources the
> vendor-specific code might have allocated.
> 
> Mark the "fix" against the first commit that started allocating anything
> in ->init().

Yep, I noticed this leak while reviewing/applying Masahiro's series
[1], and forgot to send a fix for this bug.

Actually, I'm not sure we should keep nand_manufacturer_init() in
nand_scan_ident(), especially if we consider that nand_scan_ident() is
not supposed to allocate resources and does not require a
nand_cleanup() when something fails between nand_scan_ident() and
nand_scan_tail().

Note that nand_scan_ident() is already allocating resources through
nand_init_data_interface() which are also leaked if nand_cleanup() is
not called. Again, we could solve the problem by moving data-iface
initialization steps in nand_scan_tail() (which shouldn't be a problem
AFAICS). Alternatively, we could could consider that nand_cleanup() is
smart enough to know what to not release (which seems to be the case
already), and force drivers to call nand_cleanup() as soon as
nand_scan_ident() has returned 0.

Brian, any opinion?

Anyway, this is a bit off-topic, so for this patch

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> 
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Fixes: 626994e07480 ("mtd: nand: hynix: Add read-retry support for 1x nm MLC NANDs")
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> Compile tested only
> 
>  drivers/mtd/nand/nand_base.c | 38 +++++++++++++++++++++++++++++---------
>  1 file changed, 29 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 2adcc8cdedf1..978242b1213f 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -4300,7 +4300,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
>  	/* Initialize the ->data_interface field. */
>  	ret = nand_init_data_interface(chip);
>  	if (ret)
> -		return ret;
> +		goto err_nand_init;
>  
>  	/*
>  	 * Setup the data interface correctly on the chip and controller side.
> @@ -4312,7 +4312,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
>  	 */
>  	ret = nand_setup_data_interface(chip);
>  	if (ret)
> -		return ret;
> +		goto err_nand_init;
>  
>  	nand_maf_id = chip->id.data[0];
>  	nand_dev_id = chip->id.data[1];
> @@ -4343,6 +4343,12 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
>  	mtd->size = i * chip->chipsize;
>  
>  	return 0;
> +
> +err_nand_init:
> +	/* Free manufacturer priv data. */
> +	nand_manufacturer_cleanup(chip);
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL(nand_scan_ident);
>  
> @@ -4513,18 +4519,23 @@ int nand_scan_tail(struct mtd_info *mtd)
>  
>  	/* New bad blocks should be marked in OOB, flash-based BBT, or both */
>  	if (WARN_ON((chip->bbt_options & NAND_BBT_NO_OOB_BBM) &&
> -		   !(chip->bbt_options & NAND_BBT_USE_FLASH)))
> -		return -EINVAL;
> +		   !(chip->bbt_options & NAND_BBT_USE_FLASH))) {
> +		ret = -EINVAL;
> +		goto err_ident;
> +	}
>  
>  	if (invalid_ecc_page_accessors(chip)) {
>  		pr_err("Invalid ECC page accessors setup\n");
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto err_ident;
>  	}
>  
>  	if (!(chip->options & NAND_OWN_BUFFERS)) {
>  		nbuf = kzalloc(sizeof(*nbuf), GFP_KERNEL);
> -		if (!nbuf)
> -			return -ENOMEM;
> +		if (!nbuf) {
> +			ret = -ENOMEM;
> +			goto err_ident;
> +		}
>  
>  		nbuf->ecccalc = kmalloc(mtd->oobsize, GFP_KERNEL);
>  		if (!nbuf->ecccalc) {
> @@ -4547,8 +4558,10 @@ int nand_scan_tail(struct mtd_info *mtd)
>  
>  		chip->buffers = nbuf;
>  	} else {
> -		if (!chip->buffers)
> -			return -ENOMEM;
> +		if (!chip->buffers) {
> +			ret = -ENOMEM;
> +			goto err_ident;
> +		}
>  	}
>  
>  	/* Set the internal oob buffer location, just after the page data */
> @@ -4789,6 +4802,13 @@ int nand_scan_tail(struct mtd_info *mtd)
>  		kfree(nbuf->ecccalc);
>  		kfree(nbuf);
>  	}
> +
> +err_ident:
> +	/* Clean up nand_scan_ident(). */
> +
> +	/* Free manufacturer priv data. */
> +	nand_manufacturer_cleanup(chip);
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL(nand_scan_tail);
