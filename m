Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7D8C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Feb 2022 08:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dmX7mbn7nb8Yqc5XQD/SA8SL4BhEr1Dhih5+4b2uKik=; b=JA/1Nm5u84SgrV
	boozEFRFWwWGCLpbnvthkqU//Jy9cyv+n+r/zam8GpnRTWoUcnscNqWFPwX+Z1yEuC5HmMfEm0u/K
	Fiki6EQ/GDCGJe1z7YbDtxuChUmQOkJDeQTl/9Gf70U6N/jZJS33dzQHBRuzSaIYh+voo9TcLbKXP
	oYMki61ffMbUl5gTKklU67HOqLDAfOt+zXFhu0azCuElGnPn0GZV8JudjO90WLPEjxCfi8F0O5olR
	RooLY8/cSC0BgRgK3hwQKnRjVLmgWJzle+vbVCXBrz8D9EsfxGhInQHLDuuqRMa/bJQvC9I7aqcRo
	9pvR7hpM8rLpGvMf6Z2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJX8A-00E6GO-2r; Mon, 14 Feb 2022 08:54:46 +0000
Received: from mail-ua1-f48.google.com ([209.85.222.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJX81-00E6CE-Vb; Mon, 14 Feb 2022 08:54:40 +0000
Received: by mail-ua1-f48.google.com with SMTP id u77so7755390uau.6;
 Mon, 14 Feb 2022 00:54:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PlmHX1HHokXQyxG79YUgUTlDvUDqxBtLYhszaegEBgU=;
 b=vaRsIdk6s1r80bslaYtvFMtTsP0u4po6IG2Nc50S67aimgo8oHyoWCLZb+qgj+msI/
 +ntGOK01ysNAVwt6UEb/pUPBywz0m1k2DmY8nDJJJEeaVefx1suKjiJ74EQVHfTQpyoW
 SM/6WggE2cJQ9d1h1IqR+UAZtemRWVCjFMCxXERfud94KBZLIiJlf1nBH8AZMJto6FJL
 UfHKjfPrZSdOK5crEJSvZqTf8ru7agPOiAEJvLqw6q3UIo0yTANmbwqFVvOTsrGNr+hb
 EFsp2NEMFdsApPDP4q6IyTTabPfTJoAEXafoTdyEPPcQjz72O3QhozxodvWUTlJtjLli
 EKoA==
X-Gm-Message-State: AOAM533sRq+jXH0bkvyCToR2Y5iydsxvQ8OsVqO6GB0AzkkY1PaWRVcw
 5XKYP2ZP0ODP3N16tOHo5JP3LMtSQohPvvqI
X-Google-Smtp-Source: ABdhPJzuNIuJHJhW2XDrO3f9EzWfznTAZjeigP5FzzpNQCncmdHzyNcXA0vt5gqqW2hBs9QhTr948g==
X-Received: by 2002:ab0:6056:: with SMTP id o22mr1070368ual.114.1644828876900; 
 Mon, 14 Feb 2022 00:54:36 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com.
 [209.85.221.171])
 by smtp.gmail.com with ESMTPSA id l5sm678419vsj.17.2022.02.14.00.54.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 00:54:36 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id n14so8572043vkk.6;
 Mon, 14 Feb 2022 00:54:36 -0800 (PST)
X-Received: by 2002:a05:6122:c8f:: with SMTP id
 ba15mr3731293vkb.39.1644828865522; 
 Mon, 14 Feb 2022 00:54:25 -0800 (PST)
MIME-Version: 1.0
References: <20220212201631.12648-1-s.shtylyov@omp.ru>
 <20220212201631.12648-2-s.shtylyov@omp.ru>
In-Reply-To: <20220212201631.12648-2-s.shtylyov@omp.ru>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Feb 2022 09:54:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUPxX7Tja6BCjEb4KDobNFPMcM66Fk7Z+VsO7pgb8JnjA@mail.gmail.com>
Message-ID: <CAMuHMdUPxX7Tja6BCjEb4KDobNFPMcM66Fk7Z+VsO7pgb8JnjA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] platform: make platform_get_irq_optional() optional
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Corey Minyard <minyard@acm.org>, Oleksij Rempel <linux@rempel-privat.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mun Yew Tham <mun.yew.tham@intel.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Lee Jones <lee.jones@linaro.org>, Kamal Dasu <kdasu.kdev@gmail.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>, 
 Ulf Hansson <ulf.hansson@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Joakim Zhang <qiangqing.zhang@nxp.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, 
 Vinod Koul <vkoul@kernel.org>, Benson Leung <bleung@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>, Zha Qipeng <qipeng.zha@intel.com>, 
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
 John Garry <john.garry@huawei.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Jiri Slaby <jirislaby@kernel.org>, 
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 openipmi-developer@lists.sourceforge.net, linux-iio@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, 
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-phy@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-serial@vger.kernel.org, kvm@vger.kernel.org, 
 alsa-devel@alsa-project.org, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_005438_058122_CD42B4AA 
X-CRM114-Status: GOOD (  38.48  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Sergey,

On Sat, Feb 12, 2022 at 9:17 PM Sergey Shtylyov <s.shtylyov@omp.ru> wrote:
> This patch is based on the former Andy Shevchenko's patch:
>
> https://lore.kernel.org/lkml/20210331144526.19439-1-andriy.shevchenko@linux.intel.com/
>
> Currently platform_get_irq_optional() returns an error code even if IRQ
> resource simply has not been found.  It prevents the callers from being
> error code agnostic in their error handling:
>
>         ret = platform_get_irq_optional(...);
>         if (ret < 0 && ret != -ENXIO)
>                 return ret; // respect deferred probe
>         if (ret > 0)
>                 ...we get an IRQ...
>
> All other *_optional() APIs seem to return 0 or NULL in case an optional
> resource is not available.  Let's follow this good example, so that the
> callers would look like:
>
>         ret = platform_get_irq_optional(...);
>         if (ret < 0)
>                 return ret;
>         if (ret > 0)
>                 ...we get an IRQ...
>
> Reported-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> ---
> Changes in version 2:

Thanks for the update!

>  drivers/base/platform.c                  | 60 +++++++++++++++---------

The core change LGTM.

I'm only looking at Renesas drivers below...

> --- a/drivers/mmc/host/sh_mmcif.c
> +++ b/drivers/mmc/host/sh_mmcif.c
> @@ -1465,14 +1465,14 @@ static int sh_mmcif_probe(struct platform_device *pdev)
>         sh_mmcif_sync_reset(host);
>         sh_mmcif_writel(host->addr, MMCIF_CE_INT_MASK, MASK_ALL);
>
> -       name = irq[1] < 0 ? dev_name(dev) : "sh_mmc:error";
> +       name = irq[1] <= 0 ? dev_name(dev) : "sh_mmc:error";

"== 0" should be sufficient here, if the code above would bail out
on errors returned by platform_get_irq_optional(), which it currently
doesn't do.
As this adds missing error handling, this is to be fixed by a separate
patch later?

>         ret = devm_request_threaded_irq(dev, irq[0], sh_mmcif_intr,
>                                         sh_mmcif_irqt, 0, name, host);
>         if (ret) {
>                 dev_err(dev, "request_irq error (%s)\n", name);
>                 goto err_clk;
>         }
> -       if (irq[1] >= 0) {
> +       if (irq[1] > 0) {

OK.

>                 ret = devm_request_threaded_irq(dev, irq[1],
>                                                 sh_mmcif_intr, sh_mmcif_irqt,
>                                                 0, "sh_mmc:int", host);

> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -439,7 +439,7 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
>         u32 val;
>         int ret;
>
> -       if (!rcar_gen3_is_any_rphy_initialized(channel) && channel->irq >= 0) {
> +       if (!rcar_gen3_is_any_rphy_initialized(channel) && channel->irq > 0) {
>                 INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
>                 ret = request_irq(channel->irq, rcar_gen3_phy_usb2_irq,
>                                   IRQF_SHARED, dev_name(channel->dev), channel);
> @@ -486,7 +486,7 @@ static int rcar_gen3_phy_usb2_exit(struct phy *p)
>                 val &= ~USB2_INT_ENABLE_UCOM_INTEN;
>         writel(val, usb2_base + USB2_INT_ENABLE);
>
> -       if (channel->irq >= 0 && !rcar_gen3_is_any_rphy_initialized(channel))
> +       if (channel->irq > 0 && !rcar_gen3_is_any_rphy_initialized(channel))
>                 free_irq(channel->irq, channel);
>
>         return 0;

LGTM, but note that all errors returned by platform_get_irq_optional()
are currently ignored, even real errors, which should be propagated
up.
As this adds missing error handling, this is to be fixed by a separate
patch later?

> --- a/drivers/thermal/rcar_gen3_thermal.c
> +++ b/drivers/thermal/rcar_gen3_thermal.c
> @@ -432,6 +432,8 @@ static int rcar_gen3_thermal_request_irqs(struct rcar_gen3_thermal_priv *priv,
>                 irq = platform_get_irq_optional(pdev, i);
>                 if (irq < 0)
>                         return irq;
> +               if (!irq)
> +                       return -ENXIO;

While correct, and preserving existing behavior, this looks strange
to me.  Probably this should return zero instead (i.e. the check
above should be changed to "<= 0"), and the caller should start caring
about and propagating up real errors.
As this adds missing error handling, this is to be fixed by a separate
patch later?

>
>                 irqname = devm_kasprintf(dev, GFP_KERNEL, "%s:ch%d",
>                                          dev_name(dev), i);
> diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
> index fb65dc601b23..328ab074fd89 100644

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c

I think you missed

    #define SCIx_IRQ_IS_MUXED(port)                 \
            ((port)->irqs[SCIx_ERI_IRQ] ==  \
             (port)->irqs[SCIx_RXI_IRQ]) || \
            ((port)->irqs[SCIx_ERI_IRQ] &&  \
             ((port)->irqs[SCIx_RXI_IRQ] < 0))

above? The last condition should become "<= 0".

> @@ -1915,7 +1915,7 @@ static int sci_request_irq(struct sci_port *port)
>                          * Certain port types won't support all of the
>                          * available interrupt sources.
>                          */
> -                       if (unlikely(irq < 0))
> +                       if (unlikely(irq <= 0))
>                                 continue;
>                 }
>
> @@ -1963,7 +1963,7 @@ static void sci_free_irq(struct sci_port *port)
>                  * Certain port types won't support all of the available
>                  * interrupt sources.
>                  */
> -               if (unlikely(irq < 0))
> +               if (unlikely(irq <= 0))
>                         continue;
>
>                 /* Check if already freed (irq was muxed) */
> @@ -2875,7 +2875,7 @@ static int sci_init_single(struct platform_device *dev,
>         if (sci_port->irqs[0] < 0)
>                 return -ENXIO;
>
> -       if (sci_port->irqs[1] < 0)
> +       if (sci_port->irqs[1] <= 0)
>                 for (i = 1; i < ARRAY_SIZE(sci_port->irqs); i++)
>                         sci_port->irqs[i] = sci_port->irqs[0];
>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
