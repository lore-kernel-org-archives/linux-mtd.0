Date: Sat, 21 Jul 2018 19:54:38 +0200
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
Subject: Re: [PATCH v4 24/35] mtd: rawnand: txx9ndfmc: convert driver to
 nand_scan()
Message-ID: <20180721195438.03e092b1@bbrezillon>
In-Reply-To: <20180720151527.16038-25-miquel.raynal@bootlin.com>
References: <20180720151527.16038-1-miquel.raynal@bootlin.com>
 <20180720151527.16038-25-miquel.raynal@bootlin.com>
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

On Fri, 20 Jul 2018 17:15:16 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Two helpers have been added to the core to make ECC-related
> configuration between the detection phase and the final NAND scan. Use
> these hooks and convert the driver to just use nand_scan() instead of
> both nand_scan_ident() and nand_scan_tail().
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

> ---
>  drivers/mtd/nand/raw/txx9ndfmc.c | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9ndfmc.c
> index 9019022774f7..0134beb1136d 100644
> --- a/drivers/mtd/nand/raw/txx9ndfmc.c
> +++ b/drivers/mtd/nand/raw/txx9ndfmc.c
> @@ -254,23 +254,23 @@ static void txx9ndfmc_initialize(struct platform_device *dev)
>  #define TXX9NDFMC_NS_TO_CYC(gbusclk, ns) \
>  	DIV_ROUND_UP((ns) * DIV_ROUND_UP(gbusclk, 1000), 1000000)
>  
> -static int txx9ndfmc_nand_scan(struct mtd_info *mtd)
> +static int txx9ndfmc_attach_chip(struct nand_chip *chip)
>  {
> -	struct nand_chip *chip = mtd_to_nand(mtd);
> -	int ret;
> +	struct mtd_info *mtd = nand_to_mtd(chip);
>  
> -	ret = nand_scan_ident(mtd, 1, NULL);
> -	if (!ret) {
> -		if (mtd->writesize >= 512) {
> -			/* Hardware ECC 6 byte ECC per 512 Byte data */
> -			chip->ecc.size = 512;
> -			chip->ecc.bytes = 6;
> -		}
> -		ret = nand_scan_tail(mtd);
> +	if (mtd->writesize >= 512) {
> +		/* Hardware ECC 6 byte ECC per 512 Byte data */
> +		chip->ecc.size = 512;
> +		chip->ecc.bytes = 6;
>  	}
> -	return ret;
> +
> +	return 0;
>  }
>  
> +static const struct nand_controller_ops txx9ndfmc_controller_ops = {
> +	.attach_chip = txx9ndfmc_attach_chip,
> +};
> +
>  static int __init txx9ndfmc_probe(struct platform_device *dev)
>  {
>  	struct txx9ndfmc_platform_data *plat = dev_get_platdata(&dev->dev);
> @@ -304,6 +304,7 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
>  		 (gbusclk + 500000) / 1000000, hold, spw);
>  
>  	nand_controller_init(&drvdata->controller);
> +	drvdata->controller.ops = &txx9ndfmc_controller_ops;
>  
>  	platform_set_drvdata(dev, drvdata);
>  	txx9ndfmc_initialize(dev);
> @@ -332,7 +333,7 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
>  		chip->ecc.correct = txx9ndfmc_correct_data;
>  		chip->ecc.hwctl = txx9ndfmc_enable_hwecc;
>  		chip->ecc.mode = NAND_ECC_HW;
> -		/* txx9ndfmc_nand_scan will overwrite ecc.size and ecc.bytes */
> +		/* nand_scan() will overwrite ecc.size and ecc.bytes */
>  		chip->ecc.size = 256;
>  		chip->ecc.bytes = 3;
>  		chip->ecc.strength = 1;
> @@ -359,7 +360,7 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
>  		if (plat->wide_mask & (1 << i))
>  			chip->options |= NAND_BUSWIDTH_16;
>  
> -		if (txx9ndfmc_nand_scan(mtd)) {
> +		if (nand_scan(mtd, 1)) {
>  			kfree(txx9_priv->mtdname);
>  			kfree(txx9_priv);
>  			continue;
