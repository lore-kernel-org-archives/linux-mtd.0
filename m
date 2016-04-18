Date: Mon, 18 Apr 2016 10:01:52 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 matthias.bgg@gmail.com, robh@kernel.org,
 linux-mediatek@lists.infradead.org, xiaolei.li@mediatek.com,
 linux-mtd@lists.infradead.org, daniel.thompson@linaro.org,
 erin.lo@mediatek.com
Subject: Re: [PATCH v3 2/2] mtd: mediatek: driver for MTK Smart Device Gen1
 NAND
Message-ID: <20160418100152.6973d5ac@bbrezillon>
In-Reply-To: <1460393772-26910-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1460393772-26910-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1460393772-26910-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
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

On Mon, 11 Apr 2016 12:56:12 -0400
Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:

> This patch adds support for mediatek's SDG1 NFC nand controller
> embedded in SoC 2701.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---

[...]

> +static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
> +				struct device_node *np)
> +{
> +	struct mtk_nfc_nand_chip *chip;
> +	struct nand_chip *nand;
> +	struct mtd_info *mtd;
> +	int nsels, len;
> +	u32 tmp;
> +	int ret;
> +	int i;
> +
> +	if (!of_get_property(np, "reg", &nsels))
> +		return -ENODEV;
> +
> +	nsels /= sizeof(u32);
> +	if (!nsels || nsels > MTK_NAND_MAX_NSELS) {
> +		dev_err(dev, "invalid reg property size %d\n", nsels);
> +		return -EINVAL;
> +	}
> +
> +	chip = devm_kzalloc(dev,
> +			sizeof(*chip) + nsels * sizeof(u8), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	chip->nsels = nsels;
> +	for (i = 0; i < nsels; i++) {
> +		ret = of_property_read_u32_index(np, "reg", i, &tmp);
> +		if (ret) {
> +			dev_err(dev, "reg property failure : %d\n", ret);
> +			return ret;
> +		}
> +		chip->sels[i] = tmp;
> +	}
> +
> +	if (of_property_read_u32(np, "spare_per_sector",
> +						&chip->spare_per_sector)) {
> +		dev_err(dev, "missing spare_per_sector property in DT\n");
> +		return -ENODEV;
> +
> +	}
> +
> +	nand = &chip->nand;
> +	nand->controller = &nfc->controller;
> +
> +	nand_set_flash_node(nand, np);
> +	nand_set_controller_data(nand, nfc);
> +
> +	nand->options |= NAND_USE_BOUNCE_BUFFER | NAND_SUBPAGE_READ;
> +	nand->block_markbad = mtk_nfc_block_markbad;
> +	nand->dev_ready = mtk_nfc_dev_ready;
> +	nand->select_chip = mtk_nfc_select_chip;
> +	nand->write_byte = mtk_nfc_write_byte;
> +	nand->write_buf = mtk_nfc_write_buf;
> +	nand->read_byte = mtk_nfc_read_byte;
> +	nand->read_buf = mtk_nfc_read_buf;
> +	nand->cmd_ctrl = mtk_nfc_cmd_ctrl;
> +
> +	/* set default mode in case dt entry is missing */
> +	nand->ecc.mode = NAND_ECC_HW;
> +
> +	nand->ecc.write_subpage = mtk_nfc_write_subpage_hwecc;
> +	nand->ecc.write_page_raw = mtk_nfc_write_page_raw;
> +	nand->ecc.write_page = mtk_nfc_write_page_hwecc;
> +	nand->ecc.write_oob_raw = mtk_nfc_write_oob_raw;
> +	nand->ecc.write_oob = mtk_nfc_write_oob;
> +
> +	nand->ecc.read_subpage = mtk_nfc_read_subpage_hwecc;
> +	nand->ecc.read_page_raw = mtk_nfc_read_page_raw;
> +	nand->ecc.read_oob_raw = mtk_nfc_read_oob_raw;
> +	nand->ecc.read_page = mtk_nfc_read_page_hwecc;
> +	nand->ecc.read_oob = mtk_nfc_read_oob;
> +
> +	mtd = nand_to_mtd(nand);
> +	mtd->owner = THIS_MODULE;
> +	mtd->dev.parent = dev;
> +	mtd->name = MTK_NAME;
> +	mtd_set_ooblayout(mtd, &mtk_nfc_ooblayout_ops);
> +
> +	mtk_nfc_hw_init(nfc);
> +
> +	ret = nand_scan_ident(mtd, nsels, NULL);
> +	if (ret)
> +		return -ENODEV;
> +
> +	/* TODO: add NAND_ECC_SOFT */
> +	if (nand->ecc.mode != NAND_ECC_HW) {
> +		dev_err(dev, "driver only supports NAND_ECC_HW\n");
> +		return -ENODEV;
> +	}

You also don't check the ecc->strength and ecc->step_size values, and
I'd recommend doing the ECC initialization in a separate function.
Moreover, as already explained on IRC, you should not make the
nand-ecc-strength and nand-ecc-step-size properties mandatory. Usually
those information are exposed by the NAND chip itself, and are
available in chip->ecc_strength_ds and chip->ecc_step_size_ds.
nand-ecc-strength and nand-ecc-step-size are only here to override the
ECC config (a typical usage is to override those information to match
the configuration hardcoded in the bootloader).

Here is an example of how it could be done [1].

[1]http://lxr.free-electrons.com/source/drivers/mtd/nand/sunxi_nand.c#L1188


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
