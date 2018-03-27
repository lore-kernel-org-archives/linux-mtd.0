Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0jW7-00013r-VY
 for linux-mtd@lists.infradead.org; Tue, 27 Mar 2018 07:59:41 +0000
Date: Tue, 27 Mar 2018 09:59:28 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Masahiro Yamada
 <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org, Kamal Dasu
 <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v2 05/16] mtd: rawnand: docg4: fix the probe function
 error path
Message-ID: <20180327095928.5ff537af@bbrezillon>
In-Reply-To: <20180321130157.9524-6-miquel.raynal@bootlin.com>
References: <20180321130157.9524-1-miquel.raynal@bootlin.com>
 <20180321130157.9524-6-miquel.raynal@bootlin.com>
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

On Wed, 21 Mar 2018 14:01:46 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> An error after nand_scan_tail() should trigger a nand_cleanup() call.
> The helper mtd_device_register() returns an error code that should
> be checked and nand_cleanup() called accordingly.

The commit message is not really describing what you're fixing here
because nand_cleanup() is called as part of nand_release().

How about something like that:

"
nand_release() should not be called on an MTD device that has not been
registered. While it should work thanks to the checks done in
mtd_device_unregister() it's a bad practice to cleanup/release
something that has not previously been initialized/allocated.
    
Rework the error path to follow this rule.
"

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/docg4.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/docg4.c b/drivers/mtd/nand/raw/docg4.c
> index 1314aa99b9ab..bb96cb33cd6b 100644
> --- a/drivers/mtd/nand/raw/docg4.c
> +++ b/drivers/mtd/nand/raw/docg4.c
> @@ -1341,7 +1341,7 @@ static int __init probe_docg4(struct platform_device *pdev)
>  	nand = kzalloc(len, GFP_KERNEL);
>  	if (nand == NULL) {
>  		retval = -ENOMEM;
> -		goto fail_unmap;
> +		goto unmap;
>  	}
>  
>  	mtd = nand_to_mtd(nand);
> @@ -1357,7 +1357,7 @@ static int __init probe_docg4(struct platform_device *pdev)
>  	doc->bch = init_bch(DOCG4_M, DOCG4_T, DOCG4_PRIMITIVE_POLY);
>  	if (doc->bch == NULL) {
>  		retval = -EINVAL;
> -		goto fail;
> +		goto free_nand;
>  	}
>  
>  	platform_set_drvdata(pdev, doc);
> @@ -1366,30 +1366,32 @@ static int __init probe_docg4(struct platform_device *pdev)
>  	retval = read_id_reg(mtd);
>  	if (retval == -ENODEV) {
>  		dev_warn(dev, "No diskonchip G4 device found.\n");
> -		goto fail;
> +		goto free_bch;
>  	}
>  
>  	retval = nand_scan_tail(mtd);
>  	if (retval)
> -		goto fail;
> +		goto free_bch;
>  
>  	retval = read_factory_bbt(mtd);
>  	if (retval)
> -		goto fail;
> +		goto cleanup_nand;
>  
>  	retval = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
>  	if (retval)
> -		goto fail;
> +		goto cleanup_nand;
>  
>  	doc->mtd = mtd;
> +
>  	return 0;
>  
> -fail:
> -	nand_release(mtd); /* deletes partitions and mtd devices */
> +cleanup_nand:
> +	nand_cleanup(nand);
> +free_bch:
>  	free_bch(doc->bch);
> +free_nand:
>  	kfree(nand);
> -
> -fail_unmap:
> +unmap:
>  	iounmap(virtadr);
>  
>  	return retval;



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
