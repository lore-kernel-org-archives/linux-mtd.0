Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEfbs-0004dx-Vu
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 16:30:09 +0000
Date: Sun, 19 Jun 2016 18:29:46 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org
Subject: Re: [PATCH v3 7/8] MTD: xway: add nandaddr to own struct
Message-ID: <20160619182946.273e9b14@bbrezillon>
In-Reply-To: <1466352497-6806-8-git-send-email-hauke@hauke-m.de>
References: <1466352497-6806-1-git-send-email-hauke@hauke-m.de>
 <1466352497-6806-8-git-send-email-hauke@hauke-m.de>
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

On Sun, 19 Jun 2016 18:08:16 +0200
Hauke Mehrtens <hauke@hauke-m.de> wrote:

> Instead of using IO_ADDR_W and IO_ADDR_R use an own pointer to the NAND
> controller memory area.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>  drivers/mtd/nand/xway_nand.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
> index 6fac4c6..282258f 100644
> --- a/drivers/mtd/nand/xway_nand.c
> +++ b/drivers/mtd/nand/xway_nand.c
> @@ -66,22 +66,23 @@
>  struct xway_nand_data {
>  	struct nand_chip	chip;
>  	unsigned long		csflags;
> +	void __iomem		*nandaddr;
>  };
>  
>  static u8 xway_readb(struct mtd_info *mtd, int op)
>  {
>  	struct nand_chip *chip = mtd_to_nand(mtd);
> -	void __iomem *nandaddr = chip->IO_ADDR_R;
> +	struct xway_nand_data *data = nand_get_controller_data(chip);
>  
> -	return readb(nandaddr + op);
> +	return readb(data->nandaddr + op);
>  }
>  
>  static void xway_writeb(struct mtd_info *mtd, int op, u8 value)
>  {
>  	struct nand_chip *chip = mtd_to_nand(mtd);
> -	void __iomem *nandaddr = chip->IO_ADDR_W;
> +	struct xway_nand_data *data = nand_get_controller_data(chip);
>  
> -	writeb(value, nandaddr + op);
> +	writeb(value, data->nandaddr + op);
>  }
>  
>  static void xway_select_chip(struct mtd_info *mtd, int select)
> @@ -138,7 +139,6 @@ static int xway_nand_probe(struct platform_device *pdev)
>  	struct mtd_info *mtd;
>  	struct resource *res;
>  	int err;
> -	void __iomem *nandaddr;
>  	u32 cs;
>  	u32 cs_flag = 0;
>  
> @@ -149,16 +149,16 @@ static int xway_nand_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	nandaddr = devm_ioremap_resource(&pdev->dev, res);
> -	if (IS_ERR(nandaddr))
> -		return PTR_ERR(nandaddr);
> +	data->nandaddr = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(data->nandaddr))
> +		return PTR_ERR(data->nandaddr);
>  
>  	nand_set_flash_node(&data->chip, pdev->dev.of_node);
>  	mtd = nand_to_mtd(&data->chip);
>  	mtd->dev.parent = &pdev->dev;
>  
> -	data->chip.IO_ADDR_R = nandaddr;
> -	data->chip.IO_ADDR_W = nandaddr;
> +	data->chip.IO_ADDR_R = data->nandaddr;
> +	data->chip.IO_ADDR_W = data->nandaddr;

If you patched all places using ->IO_ADDR_R/W you should be able to get
rid of these assignments. If you didn't, please do it in this patch.

>  	data->chip.cmd_ctrl = xway_cmd_ctrl;
>  	data->chip.dev_ready = xway_dev_ready;
>  	data->chip.select_chip = xway_select_chip;
> @@ -177,7 +177,7 @@ static int xway_nand_probe(struct platform_device *pdev)
>  		cs_flag = NAND_CON_IN_CS1 | NAND_CON_OUT_CS1;
>  
>  	/* setup the EBU to run in NAND mode on our base addr */
> -	ltq_ebu_w32(CPHYSADDR(nandaddr)
> +	ltq_ebu_w32(CPHYSADDR(data->nandaddr)
>  		| ADDSEL1_MASK(3) | ADDSEL1_REGEN, EBU_ADDSEL1);

Try to align parameters on the open parenthesis.

	ltq_ebu_w32(CPHYSADDR(data->nandaddr) | ADDSEL1_MASK(3) |
		    ADDSEL1_REGEN, EBU_ADDSEL1);

>  
>  	ltq_ebu_w32(BUSCON1_SETUP | BUSCON1_BCGEN_RES | BUSCON1_WAITWRC2
