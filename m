Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z5IHt-0002kU-6K
 for linux-mtd@lists.infradead.org; Wed, 17 Jun 2015 18:42:13 +0000
Received: by pdbki1 with SMTP id ki1so46319607pdb.1
 for <linux-mtd@lists.infradead.org>; Wed, 17 Jun 2015 11:41:52 -0700 (PDT)
Date: Wed, 17 Jun 2015 11:41:44 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 6/6] mtd: docg3: Don't do ERR_PTR(0)
Message-ID: <20150617184144.GH4917@ld-irv-0074>
References: <1433193054-26865-1-git-send-email-richard@nod.at>
 <1433193054-26865-7-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1433193054-26865-7-git-send-email-richard@nod.at>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, maximlevitsky@gmail.com,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 01, 2015 at 11:10:54PM +0200, Richard Weinberger wrote:
> Don't return a obfuscated null pointer using ERR_PTR(0).
> If the no device is found clearly return -ENODEV.
> This makes the code more clear and matches the comment
> of doc_probe_device().
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---

Have you tested this patch?

>  drivers/mtd/devices/docg3.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
> index 5e67b4a..630e29a 100644
> --- a/drivers/mtd/devices/docg3.c
> +++ b/drivers/mtd/devices/docg3.c
> @@ -1902,7 +1902,7 @@ doc_probe_device(struct docg3_cascade *cascade, int floor, struct device *dev)
>  	chip_id = doc_register_readw(docg3, DOC_CHIPID);
>  	chip_id_inv = doc_register_readw(docg3, DOC_CHIPID_INV);
>  
> -	ret = 0;
> +	ret = -ENODEV;
>  	if (chip_id != (u16)(~chip_id_inv)) {
>  		goto nomem4;
>  	}
> @@ -2068,13 +2068,10 @@ static int __init docg3_probe(struct platform_device *pdev)
>  		mtd = doc_probe_device(cascade, floor, dev);
>  		if (IS_ERR(mtd)) {
>  			ret = PTR_ERR(mtd);
> -			goto err_probe;
> -		}
> -		if (!mtd) {
> -			if (floor == 0)
> -				goto notfound;
> -			else
> +			if (ret == -ENODEV && floor == 0)

I think you might have changed the logic when refactoring here. I think
the right refactoring would be the following, no?

			if (ret == -ENODEV && floor != 0)
				continue;
			else
				goto err_probe;

>  				continue;
> +			else
> +				goto err_probe;
>  		}
>  		cascade->floors[floor] = mtd;
>  		ret = mtd_device_parse_register(mtd, part_probes, NULL, NULL,
> @@ -2091,10 +2088,9 @@ static int __init docg3_probe(struct platform_device *pdev)
>  	doc_dbg_register(cascade->floors[0]->priv);
>  	return 0;
>  
> -notfound:
> -	ret = -ENODEV;
> -	dev_info(dev, "No supported DiskOnChip found\n");
>  err_probe:
> +	if (ret == -ENODEV)
> +		dev_info(dev, "No supported DiskOnChip found\n");
>  	free_bch(cascade->bch);
>  	for (floor = 0; floor < DOC_MAX_NBFLOORS; floor++)
>  		if (cascade->floors[floor])

Brian
