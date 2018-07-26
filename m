Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fij99-00015z-QS
 for linux-mtd@lists.infradead.org; Thu, 26 Jul 2018 16:29:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Thu, 26 Jul 2018 18:29:36 +0200
From: Stefan Agner <stefan@agner.ch>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Wenyou Yang <wenyou.yang@microchip.com>, Josh
 Wu <rainyfeeling@outlook.com>, Lucas Stach <dev@lynxeye.de>
Subject: Re: [PATCH v5 12/17] mtd: rawnand: tegra: convert driver to
 nand_scan()
In-Reply-To: <20180725133152.30898-13-miquel.raynal@bootlin.com>
References: <20180725133152.30898-1-miquel.raynal@bootlin.com>
 <20180725133152.30898-13-miquel.raynal@bootlin.com>
Message-ID: <b7eded62209b18d8d0143fefbfa95905@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 25.07.2018 15:31, Miquel Raynal wrote:
> Two helpers have been added to the core to do all kind of controller
> side configuration/initialization between the detection phase and the
> final NAND scan. Implement these hooks so that we can convert the driver
> to just use nand_scan() instead of the nand_scan_ident() +
> nand_scan_tail() pair.
> 

While the patch looks technically correct, I wonder whether the driver
now does what we expect it from attach logically...

E.g. shouldn't we get the wp_gpio in attach?

--
Stefan

> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/tegra_nand.c | 162 +++++++++++++++++++++-----------------
>  1 file changed, 88 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/tegra_nand.c
> b/drivers/mtd/nand/raw/tegra_nand.c
> index 31c0d9ca9d23..79da1efc88d1 100644
> --- a/drivers/mtd/nand/raw/tegra_nand.c
> +++ b/drivers/mtd/nand/raw/tegra_nand.c
> @@ -906,74 +906,13 @@ static int tegra_nand_select_strength(struct
> nand_chip *chip, int oobsize)
>  				       bits_per_step, oobsize);
>  }
>  
> -static int tegra_nand_chips_init(struct device *dev,
> -				 struct tegra_nand_controller *ctrl)
> +static int tegra_nand_attach_chip(struct nand_chip *chip)
>  {
> -	struct device_node *np = dev->of_node;
> -	struct device_node *np_nand;
> -	int nsels, nchips = of_get_child_count(np);
> -	struct tegra_nand_chip *nand;
> -	struct mtd_info *mtd;
> -	struct nand_chip *chip;
> +	struct tegra_nand_controller *ctrl = to_tegra_ctrl(chip->controller);
> +	struct tegra_nand_chip *nand = to_tegra_chip(chip);
> +	struct mtd_info *mtd = nand_to_mtd(chip);
>  	int bits_per_step;
>  	int ret;
> -	u32 cs;
> -
> -	if (nchips != 1) {
> -		dev_err(dev, "Currently only one NAND chip supported\n");
> -		return -EINVAL;
> -	}
> -
> -	np_nand = of_get_next_child(np, NULL);
> -
> -	nsels = of_property_count_elems_of_size(np_nand, "reg", sizeof(u32));
> -	if (nsels != 1) {
> -		dev_err(dev, "Missing/invalid reg property\n");
> -		return -EINVAL;
> -	}
> -
> -	/* Retrieve CS id, currently only single die NAND supported */
> -	ret = of_property_read_u32(np_nand, "reg", &cs);
> -	if (ret) {
> -		dev_err(dev, "could not retrieve reg property: %d\n", ret);
> -		return ret;
> -	}
> -
> -	nand = devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
> -	if (!nand)
> -		return -ENOMEM;
> -
> -	nand->cs[0] = cs;
> -
> -	nand->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_LOW);
> -
> -	if (IS_ERR(nand->wp_gpio)) {
> -		ret = PTR_ERR(nand->wp_gpio);
> -		dev_err(dev, "Failed to request WP GPIO: %d\n", ret);
> -		return ret;
> -	}
> -
> -	chip = &nand->chip;
> -	chip->controller = &ctrl->controller;
> -
> -	mtd = nand_to_mtd(chip);
> -
> -	mtd->dev.parent = dev;
> -	mtd->owner = THIS_MODULE;
> -
> -	nand_set_flash_node(chip, np_nand);
> -
> -	if (!mtd->name)
> -		mtd->name = "tegra_nand";
> -
> -	chip->options = NAND_NO_SUBPAGE_WRITE | NAND_USE_BOUNCE_BUFFER;
> -	chip->exec_op = tegra_nand_exec_op;
> -	chip->select_chip = tegra_nand_select_chip;
> -	chip->setup_data_interface = tegra_nand_setup_data_interface;
> -
> -	ret = nand_scan_ident(mtd, 1, NULL);
> -	if (ret)
> -		return ret;
>  
>  	if (chip->bbt_options & NAND_BBT_USE_FLASH)
>  		chip->bbt_options |= NAND_BBT_NO_OOB;
> @@ -982,7 +921,8 @@ static int tegra_nand_chips_init(struct device *dev,
>  	chip->ecc.size = 512;
>  	chip->ecc.steps = mtd->writesize / chip->ecc.size;
>  	if (chip->ecc_step_ds != 512) {
> -		dev_err(dev, "Unsupported step size %d\n", chip->ecc_step_ds);
> +		dev_err(ctrl->dev, "Unsupported step size %d\n",
> +			chip->ecc_step_ds);
>  		return -EINVAL;
>  	}
>  
> @@ -1004,14 +944,15 @@ static int tegra_nand_chips_init(struct device *dev,
>  	}
>  
>  	if (chip->ecc.algo == NAND_ECC_BCH && mtd->writesize < 2048) {
> -		dev_err(dev, "BCH supports 2K or 4K page size only\n");
> +		dev_err(ctrl->dev, "BCH supports 2K or 4K page size only\n");
>  		return -EINVAL;
>  	}
>  
>  	if (!chip->ecc.strength) {
>  		ret = tegra_nand_select_strength(chip, mtd->oobsize);
>  		if (ret < 0) {
> -			dev_err(dev, "No valid strength found, minimum %d\n",
> +			dev_err(ctrl->dev,
> +				"No valid strength found, minimum %d\n",
>  				chip->ecc_strength_ds);
>  			return ret;
>  		}
> @@ -1039,7 +980,7 @@ static int tegra_nand_chips_init(struct device *dev,
>  			nand->config_ecc |= CONFIG_TVAL_8;
>  			break;
>  		default:
> -			dev_err(dev, "ECC strength %d not supported\n",
> +			dev_err(ctrl->dev, "ECC strength %d not supported\n",
>  				chip->ecc.strength);
>  			return -EINVAL;
>  		}
> @@ -1062,17 +1003,17 @@ static int tegra_nand_chips_init(struct device *dev,
>  			nand->bch_config |= BCH_TVAL_16;
>  			break;
>  		default:
> -			dev_err(dev, "ECC strength %d not supported\n",
> +			dev_err(ctrl->dev, "ECC strength %d not supported\n",
>  				chip->ecc.strength);
>  			return -EINVAL;
>  		}
>  		break;
>  	default:
> -		dev_err(dev, "ECC algorithm not supported\n");
> +		dev_err(ctrl->dev, "ECC algorithm not supported\n");
>  		return -EINVAL;
>  	}
>  
> -	dev_info(dev, "Using %s with strength %d per 512 byte step\n",
> +	dev_info(ctrl->dev, "Using %s with strength %d per 512 byte step\n",
>  		 chip->ecc.algo == NAND_ECC_BCH ? "BCH" : "RS",
>  		 chip->ecc.strength);
>  
> @@ -1095,7 +1036,8 @@ static int tegra_nand_chips_init(struct device *dev,
>  		nand->config |= CONFIG_PS_4096;
>  		break;
>  	default:
> -		dev_err(dev, "Unsupported writesize %d\n", mtd->writesize);
> +		dev_err(ctrl->dev, "Unsupported writesize %d\n",
> +			mtd->writesize);
>  		return -ENODEV;
>  	}
>  
> @@ -1106,7 +1048,78 @@ static int tegra_nand_chips_init(struct device *dev,
>  	nand->config |= CONFIG_TAG_BYTE_SIZE(mtd->oobsize - 1);
>  	writel_relaxed(nand->config, ctrl->regs + CONFIG);
>  
> -	ret = nand_scan_tail(mtd);
> +	return 0;
> +}
> +
> +static const struct nand_controller_ops tegra_nand_controller_ops = {
> +	.attach_chip = &tegra_nand_attach_chip,
> +};
> +
> +static int tegra_nand_chips_init(struct device *dev,
> +				 struct tegra_nand_controller *ctrl)
> +{
> +	struct device_node *np = dev->of_node;
> +	struct device_node *np_nand;
> +	int nsels, nchips = of_get_child_count(np);
> +	struct tegra_nand_chip *nand;
> +	struct mtd_info *mtd;
> +	struct nand_chip *chip;
> +	int ret;
> +	u32 cs;
> +
> +	if (nchips != 1) {
> +		dev_err(dev, "Currently only one NAND chip supported\n");
> +		return -EINVAL;
> +	}
> +
> +	np_nand = of_get_next_child(np, NULL);
> +
> +	nsels = of_property_count_elems_of_size(np_nand, "reg", sizeof(u32));
> +	if (nsels != 1) {
> +		dev_err(dev, "Missing/invalid reg property\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Retrieve CS id, currently only single die NAND supported */
> +	ret = of_property_read_u32(np_nand, "reg", &cs);
> +	if (ret) {
> +		dev_err(dev, "could not retrieve reg property: %d\n", ret);
> +		return ret;
> +	}
> +
> +	nand = devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
> +	if (!nand)
> +		return -ENOMEM;
> +
> +	nand->cs[0] = cs;
> +
> +	nand->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_LOW);
> +
> +	if (IS_ERR(nand->wp_gpio)) {
> +		ret = PTR_ERR(nand->wp_gpio);
> +		dev_err(dev, "Failed to request WP GPIO: %d\n", ret);
> +		return ret;
> +	}
> +
> +	chip = &nand->chip;
> +	chip->controller = &ctrl->controller;
> +
> +	mtd = nand_to_mtd(chip);
> +
> +	mtd->dev.parent = dev;
> +	mtd->owner = THIS_MODULE;
> +
> +	nand_set_flash_node(chip, np_nand);
> +
> +	if (!mtd->name)
> +		mtd->name = "tegra_nand";
> +
> +	chip->options = NAND_NO_SUBPAGE_WRITE | NAND_USE_BOUNCE_BUFFER;
> +	chip->exec_op = tegra_nand_exec_op;
> +	chip->select_chip = tegra_nand_select_chip;
> +	chip->setup_data_interface = tegra_nand_setup_data_interface;
> +
> +	ret = nand_scan(mtd, 1);
>  	if (ret)
>  		return ret;
>  
> @@ -1137,6 +1150,7 @@ static int tegra_nand_probe(struct platform_device *pdev)
>  
>  	ctrl->dev = &pdev->dev;
>  	nand_controller_init(&ctrl->controller);
> +	ctrl->controller.ops = &tegra_nand_controller_ops;
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	ctrl->regs = devm_ioremap_resource(&pdev->dev, res);
