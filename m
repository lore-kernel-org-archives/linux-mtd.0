Date: Sun, 22 Jul 2018 08:44:32 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Wenyou Yang <wenyou.yang@microchip.com>, Josh Wu
 <rainyfeeling@outlook.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Han Xu <han.xu@nxp.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, Vladimir
 Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Xiaolei Li <xiaolei.li@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Mans
 Rullgard <mans@mansr.com>, Stefan Agner <stefan@agner.ch>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 27/35] mtd: rawnand: sm_common: convert driver to
 nand_scan_with_ids()
Message-ID: <20180722084432.61b579b1@bbrezillon>
In-Reply-To: <20180720151527.16038-28-miquel.raynal@bootlin.com>
References: <20180720151527.16038-1-miquel.raynal@bootlin.com>
 <20180720151527.16038-28-miquel.raynal@bootlin.com>
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

On Fri, 20 Jul 2018 17:15:19 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Two helpers have been added to the core to make ECC-related
> configuration between the detection phase and the final NAND scan. Use
> these hooks and convert the driver to just use nand_scan_with_ids()
> (alternative to nand_scan() for passing a flash IDs table) instead of
> both nand_scan_ident() and nand_scan_tail().
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

> ---
>  drivers/mtd/nand/raw/sm_common.c | 39 +++++++++++++++++++++++++--------------
>  1 file changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/sm_common.c b/drivers/mtd/nand/raw/sm_common.c
> index 7f5044a79f01..d05e3f976a5e 100644
> --- a/drivers/mtd/nand/raw/sm_common.c
> +++ b/drivers/mtd/nand/raw/sm_common.c
> @@ -160,19 +160,9 @@ static struct nand_flash_dev nand_xd_flash_ids[] = {
>  	{NULL}
>  };
>  
> -int sm_register_device(struct mtd_info *mtd, int smartmedia)
> +static int sm_attach_chip(struct nand_chip *chip)
>  {
> -	struct nand_chip *chip = mtd_to_nand(mtd);
> -	int ret;
> -
> -	chip->options |= NAND_SKIP_BBTSCAN;
> -
> -	/* Scan for card properties */
> -	ret = nand_scan_ident(mtd, 1, smartmedia ?
> -		nand_smartmedia_flash_ids : nand_xd_flash_ids);
> -
> -	if (ret)
> -		return ret;
> +	struct mtd_info *mtd = nand_to_mtd(chip);
>  
>  	/* Bad block marker position */
>  	chip->badblockpos = 0x05;
> @@ -187,12 +177,33 @@ int sm_register_device(struct mtd_info *mtd, int smartmedia)
>  	else
>  		return -ENODEV;
>  
> -	ret = nand_scan_tail(mtd);
> +	return 0;
> +}
>  
> +static const struct nand_controller_ops sm_controller_ops = {
> +	.attach_chip = sm_attach_chip,
> +};
> +
> +int sm_register_device(struct mtd_info *mtd, int smartmedia)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct nand_flash_dev *flash_ids;
> +	int ret;
> +
> +	chip->options |= NAND_SKIP_BBTSCAN;
> +
> +	/* Scan for card properties */
> +	chip->dummy_controller.ops = &sm_controller_ops;
> +	flash_ids = smartmedia ? nand_smartmedia_flash_ids : nand_xd_flash_ids;
> +	ret = nand_scan_with_ids(mtd, 1, flash_ids);
>  	if (ret)
>  		return ret;
>  
> -	return mtd_device_register(mtd, NULL, 0);
> +	ret = mtd_device_register(mtd, NULL, 0);
> +	if (ret)
> +		nand_release(mtd);
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(sm_register_device);
>  
