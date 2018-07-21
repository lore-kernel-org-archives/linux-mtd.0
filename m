Date: Sat, 21 Jul 2018 08:56:14 +0200
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
Subject: Re: [PATCH v4 08/35] mtd: rawnand: gpmi: convert driver to nand_scan()
Message-ID: <20180721085614.16ebca4d@bbrezillon>
In-Reply-To: <20180720151527.16038-9-miquel.raynal@bootlin.com>
References: <20180720151527.16038-1-miquel.raynal@bootlin.com>
 <20180720151527.16038-9-miquel.raynal@bootlin.com>
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

On Fri, 20 Jul 2018 17:15:00 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Two helpers have been added to the core to make ECC-related
> configuration between the detection phase and the final NAND scan. Use
> these hooks and convert the driver to just use nand_scan() instead of
> both nand_scan_ident() and nand_scan_tail().
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

> ---
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 56 ++++++++++++++++++------------
>  1 file changed, 33 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> index 6294d018df65..1c1ebbc82824 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> @@ -744,9 +744,9 @@ static int gpmi_alloc_dma_buffer(struct gpmi_nand_data *this)
>  	 * [2] Allocate a read/write data buffer.
>  	 *     The gpmi_alloc_dma_buffer can be called twice.
>  	 *     We allocate a PAGE_SIZE length buffer if gpmi_alloc_dma_buffer
> -	 *     is called before the nand_scan_ident; and we allocate a buffer
> -	 *     of the real NAND page size when the gpmi_alloc_dma_buffer is
> -	 *     called after the nand_scan_ident.
> +	 *     is called before the NAND identification; and we allocate a
> +	 *     buffer of the real NAND page size when the gpmi_alloc_dma_buffer
> +	 *     is called after.
>  	 */
>  	this->data_buffer_dma = kzalloc(mtd->writesize ?: PAGE_SIZE,
>  					GFP_DMA | GFP_KERNEL);
> @@ -1865,6 +1865,34 @@ static int gpmi_init_last(struct gpmi_nand_data *this)
>  	return 0;
>  }
>  
> +static int gpmi_nand_attach_chip(struct nand_chip *chip)
> +{
> +	struct gpmi_nand_data *this = nand_get_controller_data(chip);
> +	int ret;
> +
> +	if (chip->bbt_options & NAND_BBT_USE_FLASH) {
> +		chip->bbt_options |= NAND_BBT_NO_OOB;
> +
> +		if (of_property_read_bool(this->dev->of_node,
> +					  "fsl,no-blockmark-swap"))
> +			this->swap_block_mark = false;
> +	}
> +	dev_dbg(this->dev, "Blockmark swapping %sabled\n",
> +		this->swap_block_mark ? "en" : "dis");
> +
> +	ret = gpmi_init_last(this);
> +	if (ret)
> +		return ret;
> +
> +	chip->options |= NAND_SKIP_BBTSCAN;
> +
> +	return 0;
> +}
> +
> +static const struct nand_controller_ops gpmi_nand_controller_ops = {
> +	.attach_chip = gpmi_nand_attach_chip,
> +};
> +
>  static int gpmi_nand_init(struct gpmi_nand_data *this)
>  {
>  	struct nand_chip *chip = &this->nand;
> @@ -1905,26 +1933,8 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
>  	if (ret)
>  		goto err_out;
>  
> -	ret = nand_scan_ident(mtd, GPMI_IS_MX6(this) ? 2 : 1, NULL);
> -	if (ret)
> -		goto err_out;
> -
> -	if (chip->bbt_options & NAND_BBT_USE_FLASH) {
> -		chip->bbt_options |= NAND_BBT_NO_OOB;
> -
> -		if (of_property_read_bool(this->dev->of_node,
> -						"fsl,no-blockmark-swap"))
> -			this->swap_block_mark = false;
> -	}
> -	dev_dbg(this->dev, "Blockmark swapping %sabled\n",
> -		this->swap_block_mark ? "en" : "dis");
> -
> -	ret = gpmi_init_last(this);
> -	if (ret)
> -		goto err_out;
> -
> -	chip->options |= NAND_SKIP_BBTSCAN;
> -	ret = nand_scan_tail(mtd);
> +	chip->dummy_controller.ops = &gpmi_nand_controller_ops;
> +	ret = nand_scan(mtd, GPMI_IS_MX6(this) ? 2 : 1);
>  	if (ret)
>  		goto err_out;
>  
