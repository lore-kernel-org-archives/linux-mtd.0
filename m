Received: from mx01.sz.bfs.de ([194.94.69.103])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RTVD3-0001uy-W8
 for linux-mtd@lists.infradead.org; Thu, 24 Nov 2011 09:03:10 +0000
Message-ID: <4ECE083D.4030707@bfs.de>
Date: Thu, 24 Nov 2011 10:02:53 +0100
From: walter harms <wharms@bfs.de>
MIME-Version: 1.0
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [patch] mtd/docg3: fix error handling in docg3_probe()
References: <20111124072117.GC14122@elgon.mountain>
In-Reply-To: <20111124072117.GC14122@elgon.mountain>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, kernel-janitors@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: wharms@bfs.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Am 24.11.2011 08:21, schrieb Dan Carpenter:
> There was a kfree(docg3_floors); missing from the error handling
> here.  Also we set docg3_floors[floor] = mtd; when mtd was an ERR_PTR
> and then we call doc_release_device() on it.
> 
> I reworked it a bit, so hopefully the code is more clear now.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
> index 27c4fea..bfc1ea1 100644
> --- a/drivers/mtd/devices/docg3.c
> +++ b/drivers/mtd/devices/docg3.c
> @@ -1110,21 +1110,24 @@ static int __init docg3_probe(struct platform_device *pdev)
>  	if (!docg3_floors)
>  		goto nomem;
>  
> -	ret = 0;
>  	for (floor = 0; floor < DOC_MAX_NBFLOORS; floor++) {
>  		mtd = doc_probe_device(base, floor, dev);
> -		if (floor == 0 && !mtd)
> -			goto notfound;
> -		if (!IS_ERR_OR_NULL(mtd))
> -			ret = mtd_device_parse_register(mtd, part_probes,
> -							NULL, NULL, 0);
> -		else
> +		if (IS_ERR(mtd)) {
>  			ret = PTR_ERR(mtd);
> +			goto err_probe;
> +		}
> +		if (!mtd) {
> +			if (floor == 0)
> +				goto notfound;
> +			else
> +				continue;
> +		}
>  		docg3_floors[floor] = mtd;
> +		ret = mtd_device_parse_register(mtd, part_probes, NULL, NULL,
> +		
	the code nicely shows that docg3_floors[floor] will be foobar if mtd==NULL and floor > 0
	I guess that can cause problems with the "doc_release_device(docg3_floors[floor]);"
	
	perhaps a "docg3_floors[floor] = NULL;" can help here ?

	re,
	 wh
				0);
>  		if (ret)
>  			goto err_probe;
> -		if (mtd)
> -			found++;
> +		found++;
>  	}
>  
>  	if (!found)
> @@ -1138,9 +1141,11 @@ notfound:
>  	ret = -ENODEV;
>  	dev_info(dev, "No supported DiskOnChip found\n");
>  err_probe:
> -	for (floor = 0; floor < DOC_MAX_NBFLOORS; floor++)
> +	for (floor = 0; floor < DOC_MAX_NBFLOORS; floor++) {
>  		if (docg3_floors[floor])
>  			doc_release_device(docg3_floors[floor]);
> +	}
> +	kfree(docg3_floors);
>  nomem:
>  	iounmap(base);
>  noress:
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
