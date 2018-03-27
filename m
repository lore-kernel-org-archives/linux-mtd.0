Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0jTs-0000az-2d
 for linux-mtd@lists.infradead.org; Tue, 27 Mar 2018 07:57:22 +0000
Date: Tue, 27 Mar 2018 09:57:08 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Masahiro Yamada
 <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org, Kamal Dasu
 <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v2 07/16] mtd: rawnand: fsl_ifc: fix probe function
 error path
Message-ID: <20180327095708.2ad361c9@bbrezillon>
In-Reply-To: <20180321130157.9524-8-miquel.raynal@bootlin.com>
References: <20180321130157.9524-1-miquel.raynal@bootlin.com>
 <20180321130157.9524-8-miquel.raynal@bootlin.com>
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

On Wed, 21 Mar 2018 14:01:48 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> An error after nand_scan_tail() should trigger a nand_cleanup().
> The helper mtd_device_parse_register() returns an error code that should
> be checked and nand_cleanup() called accordingly.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/fsl_ifc_nand.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
> index 7ca678f05ae3..6082528ec7f1 100644
> --- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
> +++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
> @@ -1065,14 +1065,20 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
>  
>  	/* First look for RedBoot table or partitions on the command
>  	 * line, these take precedence over device tree information */
> -	mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
> +	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
> +	if (ret)
> +		goto cleanup_nand;
>  
>  	dev_info(priv->dev, "IFC NAND device at 0x%llx, bank %d\n",
>  		 (unsigned long long)res.start, priv->bank);
> +
>  	return 0;
>  
> +cleanup_nand:
> +	nand_cleanup(&priv->chip);
>  err:
>  	fsl_ifc_chip_remove(priv);
> +

Same as for the elbc patch: we might have double-free issues after this
change.

>  	return ret;
>  }
>  



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
