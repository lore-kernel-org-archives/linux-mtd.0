Received: from mail-vc0-f171.google.com ([209.85.220.171])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1USxMQ-000157-VD
 for linux-mtd@lists.infradead.org; Thu, 18 Apr 2013 22:31:24 +0000
Received: by mail-vc0-f171.google.com with SMTP id ha12so3149766vcb.16
 for <linux-mtd@lists.infradead.org>; Thu, 18 Apr 2013 15:31:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1366303846-20384-3-git-send-email-shc_work@mail.ru>
References: <1366303846-20384-1-git-send-email-shc_work@mail.ru>
 <1366303846-20384-3-git-send-email-shc_work@mail.ru>
Date: Thu, 18 Apr 2013 15:31:21 -0700
Message-ID: <CAN8TOE9Wh0e+eGOFXxW_gf7hvPVVacQVZuRN5eV-dy8nezyqNw@mail.gmail.com>
Subject: Re: [PATCH RESEND 2/5] mtd: nand-gpio: Using resource-managed
 functions
From: Brian Norris <computersforpeace@gmail.com>
To: Alexander Shiyan <shc_work@mail.ru>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 18, 2013 at 9:50 AM, Alexander Shiyan <shc_work@mail.ru> wrote:
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

There seems to be a little more going on in this patch that the title
suggests. I'll leave that up to the maintainers for the final word,
whether this should be split (or at least documented in the patch
description). See a few comments below.

> ---
>  drivers/mtd/nand/gpio.c | 203 ++++++++++++++++++------------------------------
>  1 file changed, 77 insertions(+), 126 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
> index 89065dd..3f2cdae 100644
> --- a/drivers/mtd/nand/gpio.c
> +++ b/drivers/mtd/nand/gpio.c
> @@ -230,145 +230,102 @@ gpio_nand_get_io_sync(struct platform_device *pdev)
>         return platform_get_resource(pdev, IORESOURCE_MEM, 1);
>  }
>
> -static int gpio_nand_remove(struct platform_device *dev)

This entire function is getting moved below? It makes the diff less readable.

> -{
> -       struct gpiomtd *gpiomtd = platform_get_drvdata(dev);
> -       struct resource *res;
> -
> -       nand_release(&gpiomtd->mtd_info);
> -
> -       res = gpio_nand_get_io_sync(dev);
> -       iounmap(gpiomtd->io_sync);
> -       if (res)
> -               release_mem_region(res->start, resource_size(res));
> -
> -       res = platform_get_resource(dev, IORESOURCE_MEM, 0);
> -       iounmap(gpiomtd->nand_chip.IO_ADDR_R);
> -       release_mem_region(res->start, resource_size(res));
> -
> -       if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
> -               gpio_set_value(gpiomtd->plat.gpio_nwp, 0);
> -       gpio_set_value(gpiomtd->plat.gpio_nce, 1);
> -
> -       gpio_free(gpiomtd->plat.gpio_cle);
> -       gpio_free(gpiomtd->plat.gpio_ale);
> -       gpio_free(gpiomtd->plat.gpio_nce);
> -       if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
> -               gpio_free(gpiomtd->plat.gpio_nwp);
> -       if (gpio_is_valid(gpiomtd->plat.gpio_rdy))
> -               gpio_free(gpiomtd->plat.gpio_rdy);
> -
> -       return 0;
> -}
> -
> -static void __iomem *request_and_remap(struct resource *res, size_t size,
> -                                       const char *name, int *err)
> -{
> -       void __iomem *ptr;
> -
> -       if (!request_mem_region(res->start, resource_size(res), name)) {
> -               *err = -EBUSY;
> -               return NULL;
> -       }
> -
> -       ptr = ioremap(res->start, size);
> -       if (!ptr) {
> -               release_mem_region(res->start, resource_size(res));
> -               *err = -ENOMEM;
> -       }
> -       return ptr;
> -}
> -
> -static int gpio_nand_probe(struct platform_device *dev)
> +static int gpio_nand_probe(struct platform_device *pdev)

This change ('dev' to 'pdev') is reasonable, but it generates a lot of
the noise in this patch that makes it harder to identify the changes
in unmanaged vs. managed functions.

>  {
>         struct gpiomtd *gpiomtd;
> -       struct nand_chip *this;
> -       struct resource *res0, *res1;
> +       struct nand_chip *chip;
> +       struct resource *res;
>         struct mtd_part_parser_data ppdata = {};
>         int ret = 0;
>
> -       if (!dev->dev.of_node && !dev->dev.platform_data)
> -               return -EINVAL;
> -
> -       res0 = platform_get_resource(dev, IORESOURCE_MEM, 0);
> -       if (!res0)
> +       if (!pdev->dev.of_node && !pdev->dev.platform_data)
>                 return -EINVAL;
>
> -       gpiomtd = devm_kzalloc(&dev->dev, sizeof(*gpiomtd), GFP_KERNEL);
> -       if (gpiomtd == NULL) {
> -               dev_err(&dev->dev, "failed to create NAND MTD\n");
> +       gpiomtd = devm_kzalloc(&pdev->dev, sizeof(*gpiomtd), GFP_KERNEL);
> +       if (!gpiomtd) {
> +               dev_err(&pdev->dev, "failed to create NAND MTD\n");
>                 return -ENOMEM;
>         }
>
> -       this = &gpiomtd->nand_chip;
> -       this->IO_ADDR_R = request_and_remap(res0, 2, "NAND", &ret);
> -       if (!this->IO_ADDR_R) {
> -               dev_err(&dev->dev, "unable to map NAND\n");
> -               goto err_map;
> +       chip = &gpiomtd->nand_chip;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       chip->IO_ADDR_R = devm_request_and_ioremap(&pdev->dev, res);
> +       if (!chip->IO_ADDR_R) {
> +               dev_err(&pdev->dev, "unable to map NAND\n");
> +               return -ENXIO;
>         }
>
> -       res1 = gpio_nand_get_io_sync(dev);
> -       if (res1) {
> -               gpiomtd->io_sync = request_and_remap(res1, 4, "NAND sync", &ret);
> +       res = gpio_nand_get_io_sync(pdev);
> +       if (res) {
> +               gpiomtd->io_sync = devm_request_and_ioremap(&pdev->dev, res);
>                 if (!gpiomtd->io_sync) {
> -                       dev_err(&dev->dev, "unable to map sync NAND\n");
> -                       goto err_sync;
> +                       dev_err(&pdev->dev, "unable to map sync NAND\n");
> +                       return -ENXIO;
>                 }
>         }
>
> -       ret = gpio_nand_get_config(&dev->dev, &gpiomtd->plat);
> +       ret = gpio_nand_get_config(&pdev->dev, &gpiomtd->plat);
>         if (ret)
> -               goto err_nce;
> +               return ret;
>
> -       ret = gpio_request(gpiomtd->plat.gpio_nce, "NAND NCE");
> +       ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_nce, "NAND NCE");
>         if (ret)
> -               goto err_nce;
> +               return ret;
>         gpio_direction_output(gpiomtd->plat.gpio_nce, 1);
> +
>         if (gpio_is_valid(gpiomtd->plat.gpio_nwp)) {
> -               ret = gpio_request(gpiomtd->plat.gpio_nwp, "NAND NWP");
> +               ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_nwp,
> +                                       "NAND NWP");
>                 if (ret)
> -                       goto err_nwp;
> -               gpio_direction_output(gpiomtd->plat.gpio_nwp, 1);
> +                       return ret;
>         }
> -       ret = gpio_request(gpiomtd->plat.gpio_ale, "NAND ALE");
> +
> +       ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_ale, "NAND ALE");
>         if (ret)
> -               goto err_ale;
> +               return ret;
>         gpio_direction_output(gpiomtd->plat.gpio_ale, 0);
> -       ret = gpio_request(gpiomtd->plat.gpio_cle, "NAND CLE");
> +
> +       ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_cle, "NAND CLE");
>         if (ret)
> -               goto err_cle;
> +               return ret;
>         gpio_direction_output(gpiomtd->plat.gpio_cle, 0);
> +
>         if (gpio_is_valid(gpiomtd->plat.gpio_rdy)) {
> -               ret = gpio_request(gpiomtd->plat.gpio_rdy, "NAND RDY");
> +               ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_rdy,
> +                                       "NAND RDY");
>                 if (ret)
> -                       goto err_rdy;
> +                       return ret;
>                 gpio_direction_input(gpiomtd->plat.gpio_rdy);
>         }
>
>
> -       this->IO_ADDR_W  = this->IO_ADDR_R;
> -       this->ecc.mode   = NAND_ECC_SOFT;
> -       this->options    = gpiomtd->plat.options;
> -       this->chip_delay = gpiomtd->plat.chip_delay;
> -
> -       /* install our routines */
> -       this->cmd_ctrl   = gpio_nand_cmd_ctrl;
> -       this->dev_ready  = gpio_nand_devready;
> +       chip->IO_ADDR_W         = chip->IO_ADDR_R;
> +       chip->ecc.mode          = NAND_ECC_SOFT;
> +       chip->options           = gpiomtd->plat.options;
> +       chip->chip_delay        = gpiomtd->plat.chip_delay;
> +       chip->cmd_ctrl          = gpio_nand_cmd_ctrl;
> +       chip->dev_ready         = gpio_nand_devready;
>
> -       if (this->options & NAND_BUSWIDTH_16) {
> -               this->read_buf   = gpio_nand_readbuf16;
> -               this->write_buf  = gpio_nand_writebuf16;
> +       if (chip->options & NAND_BUSWIDTH_16) {
> +               chip->read_buf  = gpio_nand_readbuf16;
> +               chip->write_buf = gpio_nand_writebuf16;
>         } else {
> -               this->read_buf   = gpio_nand_readbuf;
> -               this->write_buf  = gpio_nand_writebuf;
> +               chip->read_buf  = gpio_nand_readbuf;
> +               chip->write_buf = gpio_nand_writebuf;
>         }
>
>         /* set the mtd private data for the nand driver */
> -       gpiomtd->mtd_info.priv = this;
> -       gpiomtd->mtd_info.owner = THIS_MODULE;
> +       gpiomtd->mtd_info.priv  = chip;
> +       gpiomtd->mtd_info.owner = THIS_MODULE;
> +
> +       platform_set_drvdata(pdev, gpiomtd);
> +
> +       if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
> +               gpio_set_value(gpiomtd->plat.gpio_nwp, 1);
>
>         if (nand_scan(&gpiomtd->mtd_info, 1)) {
> -               dev_err(&dev->dev, "no nand chips found?\n");
> +               dev_err(&pdev->dev, "no nand chips found?\n");
>                 ret = -ENXIO;
>                 goto err_wp;
>         }
> @@ -377,50 +334,44 @@ static int gpio_nand_probe(struct platform_device *dev)
>                 gpiomtd->plat.adjust_parts(&gpiomtd->plat,
>                                            gpiomtd->mtd_info.size);
>
> -       ppdata.of_node = dev->dev.of_node;
> +       ppdata.of_node = pdev->dev.of_node;
>         ret = mtd_device_parse_register(&gpiomtd->mtd_info, NULL, &ppdata,
>                                         gpiomtd->plat.parts,
>                                         gpiomtd->plat.num_parts);
>         if (ret)
>                 goto err_wp;
> -       platform_set_drvdata(dev, gpiomtd);
>
>         return 0;
>
>  err_wp:
>         if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
>                 gpio_set_value(gpiomtd->plat.gpio_nwp, 0);
> -       if (gpio_is_valid(gpiomtd->plat.gpio_rdy))
> -               gpio_free(gpiomtd->plat.gpio_rdy);
> -err_rdy:
> -       gpio_free(gpiomtd->plat.gpio_cle);
> -err_cle:
> -       gpio_free(gpiomtd->plat.gpio_ale);
> -err_ale:
> -       if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
> -               gpio_free(gpiomtd->plat.gpio_nwp);
> -err_nwp:
> -       gpio_free(gpiomtd->plat.gpio_nce);
> -err_nce:
> -       iounmap(gpiomtd->io_sync);
> -       if (res1)
> -               release_mem_region(res1->start, resource_size(res1));
> -err_sync:
> -       iounmap(gpiomtd->nand_chip.IO_ADDR_R);
> -       release_mem_region(res0->start, resource_size(res0));
> -err_map:
> +
>         return ret;
>  }
>
> +static int gpio_nand_remove(struct platform_device *dev)
> +{
> +       struct gpiomtd *gpiomtd = platform_get_drvdata(dev);
> +
> +       nand_release(&gpiomtd->mtd_info);
> +
> +       if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
> +               gpio_set_value(gpiomtd->plat.gpio_nwp, 0);
> +       gpio_set_value(gpiomtd->plat.gpio_nce, 1);
> +
> +       return 0;
> +}
> +
>  static struct platform_driver gpio_nand_driver = {
> -       .probe          = gpio_nand_probe,
> -       .remove         = gpio_nand_remove,
> -       .driver         = {
> -               .name   = "gpio-nand",
> -               .of_match_table = of_match_ptr(gpio_nand_id_table),
> +       .driver = {
> +               .name           = "gpio-nand",
> +               .owner          = THIS_MODULE,

The '.owner' was slipped in here, it seems. This is probably a
reasonable change, but it's not noted anywhere.

> +               .of_match_table = of_match_ptr(gpio_nand_id_table),
>         },
> +       .probe  = gpio_nand_probe,
> +       .remove = gpio_nand_remove,
>  };
> -
>  module_platform_driver(gpio_nand_driver);
>
>  MODULE_LICENSE("GPL");

Brian
