Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqfJ9-0005Ss-Ew
 for linux-mtd@lists.infradead.org; Fri, 08 May 2015 10:15:04 +0000
Received: by widdi4 with SMTP id di4so23817140wid.0
 for <linux-mtd@lists.infradead.org>; Fri, 08 May 2015 03:14:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1431001910-4004-1-git-send-email-bert@biot.com>
References: <1431001910-4004-1-git-send-email-bert@biot.com>
Date: Fri, 8 May 2015 12:14:40 +0200
Message-ID: <CAH6sp9OcFXcX6vgkPPJqCE-X1_fKPOBo0Ak2g=pWiWPZuCt5Yg@mail.gmail.com>
Subject: Re: [PATCH v2] nand: Add NAND driver for Mikrotik RB4xx series boards
From: Frans Klaver <fransklaver@gmail.com>
To: Bert Vermeulen <bert@biot.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 7, 2015 at 2:31 PM, Bert Vermeulen <bert@biot.com> wrote:

> +static int rb4xx_nand_probe(struct platform_device *pdev)
> +{
> +       struct device *spi_dev;
> +       struct rb4xx_nand_info  *info;
> +       struct rb4xx_cpld_platform_data *pdata;
> +       int ret;
> +
> +       /*
> +        * NAND chip is behind the CPLD on SPI bus 0 CS 1. Allow this
> +        * to silently fail the second time around.
> +        */
> +       spi_register_driver(&rb4xx_cpld_driver);
> +
> +       /*
> +        * Getting a handle on the SPI device above will fail the first time,
> +        * but should succeed whenever that driver gets probed.
> +        */
> +       spi_dev = bus_find_device_by_name(&spi_bus_type, NULL, "spi0.1");
> +       if (!spi_dev)
> +               return -EPROBE_DEFER;
> +
> +       pdata = dev_get_platdata(spi_dev);
> +       if (!pdata)
> +               return -ENODATA;
> +
> +       info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
> +       if (!info)
> +               return -ENOMEM;
> +
> +       info->gpio_ale = devm_gpiod_get(&pdev->dev, "NAND ALE", GPIOD_OUT_LOW);
> +       if (IS_ERR(info->gpio_ale)) {
> +               dev_err(&pdev->dev, "unable to request gpio NAND ALE: %ld\n",
> +                       PTR_ERR(info->gpio_ale));
> +               return -ENOENT;
> +       }
> +
> +       info->gpio_cle = devm_gpiod_get(&pdev->dev, "NAND CLE", GPIOD_OUT_LOW);
> +       if (IS_ERR(info->gpio_cle)) {
> +               dev_err(&pdev->dev, "unable to request gpio NAND CLE: %ld\n",
> +                       PTR_ERR(info->gpio_cle));
> +               return -ENOENT;
> +       }
> +
> +       info->gpio_nce = devm_gpiod_get(&pdev->dev, "NAND NCE", GPIOD_OUT_LOW);
> +       if (IS_ERR(info->gpio_nce)) {
> +               dev_err(&pdev->dev, "unable to request gpio NAND NCE: %ld\n",
> +                       PTR_ERR(info->gpio_nce));
> +               return -ENOENT;
> +       }
> +
> +       /* Platform GPIO, has no device to manage it. */
> +       info->gpio_rdy = gpiod_get(NULL, "NAND RDY", GPIOD_IN);
> +       if (IS_ERR(info->gpio_rdy)) {
> +               dev_err(&pdev->dev, "unable to request gpio RDY: %ld\n",
> +                       PTR_ERR(info->gpio_rdy));
> +               return -ENOENT;
> +       }
> +
> +       info->spi_dev = container_of(spi_dev, struct spi_device, dev);
> +
> +       info->chip.priv = info;
> +       info->mtd.priv  = &info->chip;
> +       info->mtd.owner = THIS_MODULE;

If you should respin, could you add

info->mtd.dev.parent = &pdev->dev;

This will have a symlink to the parent device show up in sysfs. Seems
some people feel rather strongly about that.

Thanks,
Frans
