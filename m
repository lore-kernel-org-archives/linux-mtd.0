Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RTWNd-0007GL-M6
 for linux-mtd@lists.infradead.org; Thu, 24 Nov 2011 10:18:11 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [patch] mtd/docg3: fix error handling in docg3_probe()
References: <20111124072117.GC14122@elgon.mountain>
Date: Thu, 24 Nov 2011 11:17:56 +0100
In-Reply-To: <20111124072117.GC14122@elgon.mountain> (Dan Carpenter's message
 of "Thu, 24 Nov 2011 10:21:18 +0300")
Message-ID: <87pqghygbv.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dan Carpenter <dan.carpenter@oracle.com> writes:

> There was a kfree(docg3_floors); missing from the error handling
> here.  Also we set docg3_floors[floor] = mtd; when mtd was an ERR_PTR
> and then we call doc_release_device() on it.
Hi Dan,

The missing kfree was dealt with by a later patch amending the probe path :
"mtd/docg3: add ECC correction code" submited in [1]. Your patch is in conflict
with this later one.
The doc_release_device() is an excellent catch. I wonder how you found it.

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
> +						0);
>  		if (ret)
>  			goto err_probe;
> -		if (mtd)
> -			found++;
> +		found++;
>  	}
Okay, this looks better that the original code.

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
This is in conflict. Could you drop that hunk and wait for the other patch to go
upstream ? Or alternatively use the whole serie in [2] as your base ?
I think some patches of the serie didn't make it in the tree you're
using.

Could you have a look at the tree with the whole serie, and rebase your patch on
top of it ?


Cheers.

-- 
Robert

[1]: http://lists.infradead.org/pipermail/linux-mtd/2011-November/038496.html
[2]: http://lists.infradead.org/pipermail/linux-mtd/2011-November/038483.html
