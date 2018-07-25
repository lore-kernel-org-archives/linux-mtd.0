Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fiM15-0008CD-0Z
 for linux-mtd@lists.infradead.org; Wed, 25 Jul 2018 15:47:58 +0000
Date: Wed, 25 Jul 2018 17:47:33 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Wenyou Yang
 <wenyou.yang@microchip.com>, Josh Wu <rainyfeeling@outlook.com>, Stefan
 Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v5 08/17] mtd: rawnand: docg4: convert driver to
 nand_scan()
Message-ID: <20180725174733.3870e52a@bbrezillon>
In-Reply-To: <20180725133152.30898-9-miquel.raynal@bootlin.com>
References: <20180725133152.30898-1-miquel.raynal@bootlin.com>
 <20180725133152.30898-9-miquel.raynal@bootlin.com>
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

On Wed, 25 Jul 2018 15:31:43 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Two helpers have been added to the core to do all kind of controller
> side configuration/initialization between the detection phase and the
> final NAND scan. Implement these hooks so that we can convert the driver
> to just use nand_scan() instead of the nand_scan_ident() +
> nand_scan_tail() pair.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/docg4.c | 70 ++++++++++++++++++++++++++++----------------
>  1 file changed, 45 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/docg4.c b/drivers/mtd/nand/raw/docg4.c
> index 4dccdfba6140..b69a36842605 100644
> --- a/drivers/mtd/nand/raw/docg4.c
> +++ b/drivers/mtd/nand/raw/docg4.c
> @@ -1227,10 +1227,9 @@ static void __init init_mtd_structs(struct mtd_info *mtd)
>  	 * required within a nand driver because they are performed by the nand
>  	 * infrastructure code as part of nand_scan().  In this case they need
>  	 * to be initialized here because we skip call to nand_scan_ident() (the
> -	 * first half of nand_scan()).  The call to nand_scan_ident() is skipped
> -	 * because for this device the chip id is not read in the manner of a
> -	 * standard nand device.  Unfortunately, nand_scan_ident() does other
> -	 * things as well, such as call nand_set_defaults().
> +	 * first half of nand_scan()).  The call to nand_scan_ident() could be
> +	 * skipped because for this device the chip id is not read in the manner
> +	 * of a standard nand device.
>  	 */
>  
>  	struct nand_chip *nand = mtd_to_nand(mtd);
> @@ -1315,6 +1314,40 @@ static int __init read_id_reg(struct mtd_info *mtd)
>  
>  static char const *part_probes[] = { "cmdlinepart", "saftlpart", NULL };
>  
> +static int docg4_attach_chip(struct nand_chip *chip)
> +{
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	struct docg4_priv *doc = (struct docg4_priv *)(chip + 1);
> +	int ret;
> +
> +	init_mtd_structs(mtd);
> +
> +	/* Initialize kernel BCH algorithm */
> +	doc->bch = init_bch(DOCG4_M, DOCG4_T, DOCG4_PRIMITIVE_POLY);
> +	if (!doc->bch)
> +		return -EINVAL;
> +
> +	reset(mtd);
> +
> +	ret = read_id_reg(mtd);
> +	if (ret)
> +		free_bch(doc->bch);
> +
> +	return ret;
> +}
> +
> +static void docg4_detach_chip(struct nand_chip *chip)
> +{
> +	struct docg4_priv *doc = (struct docg4_priv *)(chip + 1);
> +
> +	free_bch(doc->bch);
> +}
> +
> +static const struct nand_controller_ops docg4_controller_ops = {
> +	.attach_chip = docg4_attach_chip,
> +	.detach_chip = docg4_detach_chip,
> +};
> +
>  static int __init probe_docg4(struct platform_device *pdev)
>  {
>  	struct mtd_info *mtd;
> @@ -1350,28 +1383,17 @@ static int __init probe_docg4(struct platform_device *pdev)
>  	mtd->dev.parent = &pdev->dev;
>  	doc->virtadr = virtadr;
>  	doc->dev = dev;
> -
> -	init_mtd_structs(mtd);
> -
> -	/* initialize kernel bch algorithm */
> -	doc->bch = init_bch(DOCG4_M, DOCG4_T, DOCG4_PRIMITIVE_POLY);
> -	if (doc->bch == NULL) {
> -		retval = -EINVAL;
> -		goto free_nand;
> -	}
> -
>  	platform_set_drvdata(pdev, doc);
>  
> -	reset(mtd);
> -	retval = read_id_reg(mtd);
> -	if (retval == -ENODEV) {
> -		dev_warn(dev, "No diskonchip G4 device found.\n");
> -		goto free_bch;
> -	}
> -
> -	retval = nand_scan_tail(mtd);
> +	/*
> +	 * Running nand_scan() with maxchips == 0 will skip nand_scan_ident(),
> +	 * which is a specific operation with this driver and done in the
> +	 * ->attach_chip callback.
> +	 */
> +	nand->dummy_controller.ops = &docg4_controller_ops;
> +	retval = nand_scan(mtd, 0);
>  	if (retval)
> -		goto free_bch;
> +		goto free_nand;
>  
>  	retval = read_factory_bbt(mtd);
>  	if (retval)
> @@ -1387,8 +1409,6 @@ static int __init probe_docg4(struct platform_device *pdev)
>  
>  cleanup_nand:
>  	nand_cleanup(nand);
> -free_bch:
> -	free_bch(doc->bch);

You forgot to remove the free_bch() call in the remove path.
With this addressed

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

>  free_nand:
>  	kfree(nand);
>  unmap:
