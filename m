Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat
 Linux)) id 1YTlYF-0003MW-I8
 for linux-mtd@lists.infradead.org; Fri, 06 Mar 2015 06:16:00 +0000
Date: Fri, 6 Mar 2015 07:15:02 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH 1/5] mtd: nand: vf610_nfc: Freescale NFC for VF610,
 MPC5125 and others
Message-ID: <20150306061502.GB10997@pengutronix.de>
References: <1425510624-22250-1-git-send-email-stefan@agner.ch>
 <1425510624-22250-2-git-send-email-stefan@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1425510624-22250-2-git-send-email-stefan@agner.ch>
Cc: mark.rutland@arm.com, boris.brezillon@free-electrons.com,
 aaron@tastycactus.com, pawel.moll@arm.com, marb@ixxat.de,
 ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org,
 shawn.guo@linaro.org, devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, galak@codeaurora.org,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org, bpringlemeir@nbsps.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Stefan,

On Thu, Mar 05, 2015 at 12:10:20AM +0100, Stefan Agner wrote:
> +
> +static int vf610_nfc_probe_dt(struct device *dev, struct vf610_nfc_config *cfg)
> +{
> +	struct device_node *np = dev->of_node;
> +	int buswidth;
> +	u32 clkrate;
> +
> +	if (!np)
> +		return 1;
> +
> +	cfg->flash_bbt = of_get_nand_on_flash_bbt(np);
> +
> +	if (!of_property_read_u32(np, "clock-frequency", &clkrate))
> +		cfg->clkrate = clkrate;

Normally the clock-frequency property tells the driver at which
frequency the device actually is running, not to tell the driver at
which frequency the device *should* run. It's strange to use the value
of the clock-frequency property as input to clk_set_rate(). Maybe the
assigned clock binding is more appropriate here, see
Documentation/devicetree/bindings/clock/clock-bindings.txt.

BTW the above can easier be written as:

	of_property_read_u32(np, "clock-frequency", &cfg->clkrate);

No return value checking necessary.

> +static int vf610_nfc_probe(struct platform_device *pdev)
> +{
> +	struct vf610_nfc *nfc;
> +	struct resource *res;
> +	struct mtd_info *mtd;
> +	struct nand_chip *chip;
> +	struct vf610_nfc_config *cfg;
> +	int err = 0;
> +	int page_sz;
> +	int irq;
> +
> +	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
> +	if (!nfc)
> +		return -ENOMEM;
> +
> +	nfc->cfg = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
> +	if (!nfc->cfg)
> +		return -ENOMEM;
> +	cfg = nfc->cfg;

Why is nfc->cfg allocated separately instead of embedding it into struct
vf610_nfc? Is this some platform_data leftover you can remove now?

> +
> +	nfc->dev = &pdev->dev;
> +	nfc->page = -1;
> +	mtd = &nfc->mtd;
> +	chip = &nfc->chip;
> +
> +	mtd->priv = chip;
> +	mtd->owner = THIS_MODULE;
> +	mtd->dev.parent = nfc->dev;
> +	mtd->name = DRV_NAME;
> +
> +	err = vf610_nfc_probe_dt(nfc->dev, cfg);
> +	if (err)
> +		return -ENODEV;

Does this driver work without device tree or not? Currently the driver
bails out when device tree support is enabled but no device node is
given. When device tree support is disabled in the kernel though the
driver happily continues here.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
