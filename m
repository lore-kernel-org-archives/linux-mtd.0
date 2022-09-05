Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA22ECAAD5
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 13:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WWLZF/dA0UgAOhHRnvDsvC/DF3LvJz9rxwAcsLFRcgU=; b=VGMBac2DdoxzL1
	2aKyGNBrLT8v7whu94f9+Og/TSEEOer0dxNBDFYfoRDS1PFs3Qcji1InLzWcSknoFj5TK6cPetYlL
	QmCqjl/9DBkSXGZ65aKrTkCXQ5T7TScWx+s3xVgA2czruRcne/bxktj+AixY6ylAXKlMXQeuuy1G9
	qQ/pF/lZhq+2k60IvUR2UWKk0QuK+QepV2jKHIp6OZPL/HpzNNnF7E7P5JZSEOVkXTV/4Pl/lTdJc
	HomoPuaG/TeMrv+O3ARk4PnMB0DSi3TwNE6pbcQ2h0OPuo+NpTehiHFBwf7gO6flyIWBoDhkpbAPv
	4Dzp0yVfmS1PYuMUjPTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVCDN-003FCf-5i; Mon, 05 Sep 2022 13:32:37 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV9Xb-000Wyh-Vc; Mon, 05 Sep 2022 10:41:21 +0000
Received: by mail-qt1-x82d.google.com with SMTP id h21so5867736qta.3;
        Mon, 05 Sep 2022 03:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=kd7g7axcQ4As/Ok0I5izIzwGPbtYaPyDkbWIGk2kRMc=;
        b=a4V6ibAx1P4YjsDZwhtMLMuWUwWCK3+Yn9JF3VwjA4fF5N0JKuAGKvW0x7Oeq36vRu
         ZD2NpBYMNC8pDvV3B9bTynqivMhFDkGOtzwr7JY7i6mY6fQ9mOwr7PCsrNfMvKVlTB6m
         AQwPmzkKfJqq/qd3lYrZAvkeG/klQ18FzMuuftSPGpjscQilPNTppd9oLyhCECyBTnmS
         uo+4FUsm1gWsG4XuM9BafRncQA8YVM65g/X3SPg8260dxRuAheVR5JT3lXCfMda99osm
         3ghxFB0uVJftBWwHDXIPOXJK9RgFq/ZehUGlD71aQbbwaHNfsi/Wi+FWVWYy7rB5ueEz
         4ZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=kd7g7axcQ4As/Ok0I5izIzwGPbtYaPyDkbWIGk2kRMc=;
        b=ByD4GzaB2hpJl29mIc+mRejL1WUuky+eXfSpYdntmK9GYYD3YhrXGshQ+OphbA0nuI
         FB3SFZn8eIy5Gf6bAdczxodBQDeF2lnQ6mXzzkFJgh1Rh4lYAK+HCOwUT+DCYYEW+y7I
         JhjwXJyWiTq1Cq5f28CuxaAlVwLB1Tx/5JBtJpS/pX0OQgJcoCVM/klSOClomv51llQl
         vp49raBj4S6Z7N+xCbu6n56GIRdkejWJKT750tUOxp7xo9VT5l0cbenXrkd6q+dNp9hZ
         COR18mvzriRmAAfuTiqij5J4oyjEc+81HvhU3RuqwSsZ2Y+EC4uPmgoUGwGMFiVY56DS
         Vfag==
X-Gm-Message-State: ACgBeo2po/dGUi9IWPz8i/toC3DlUglFupwSZREmww+4SCriiLtRy575
	nojXos4FWnuxvT7xbGm4BGqd3Tm+VKfFFOnBJNA=
X-Google-Smtp-Source: AA6agR5jckAzCxTGD9mkHIt9A012zarGH47OL+wuWeavoOdmt2QYtP37qTO1N0BzU0mjGhkgR0fMvN19uxKTRqEH6ZQ=
X-Received: by 2002:ac8:7dd0:0:b0:344:afc1:b11d with SMTP id
 c16-20020ac87dd0000000b00344afc1b11dmr37941390qte.195.1662374478234; Mon, 05
 Sep 2022 03:41:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-9-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-9-b29adfb27a6c@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 13:40:42 +0300
Message-ID: <CAHp75VeA+oVPmsEOg+y0cvRcTU5qA+Y+9=Byp0C982EB7SAArQ@mail.gmail.com>
Subject: Re: [PATCH v1 09/11] regulator: bd9576: switch to using devm_fwnode_gpiod_get()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Guenter Roeck <linux@roeck-us.net>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Felipe Balbi <balbi@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Marc Zyngier <maz@kernel.org>, 
	Richard Weinberger <richard@nod.at>, David Airlie <airlied@linux.ie>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, USB <linux-usb@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, 
	linux-tegra <linux-tegra@vger.kernel.org>, 
	"open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_034120_077744_9CAD3AC7 
X-CRM114-Status: GOOD (  23.05  )
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

On Mon, Sep 5, 2022 at 9:33 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
> so that gpiolib can be cleaned a bit, so let's switch to the generic
> fwnode property API.
>
> While at it switch the rest of the calls to read properties in
> bd957x_probe() to the generic device property API as well.

With or without below addressed,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>
> diff --git a/drivers/regulator/bd9576-regulator.c b/drivers/regulator/bd9576-regulator.c
> index aa42da4d141e..393c8693b327 100644
> --- a/drivers/regulator/bd9576-regulator.c
> +++ b/drivers/regulator/bd9576-regulator.c
> @@ -12,6 +12,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/regulator/driver.h>
>  #include <linux/regulator/machine.h>
>  #include <linux/regulator/of_regulator.h>
> @@ -939,8 +940,8 @@ static int bd957x_probe(struct platform_device *pdev)
>         }
>
>         ic_data->regmap = regmap;
> -       vout_mode = of_property_read_bool(pdev->dev.parent->of_node,
> -                                        "rohm,vout1-en-low");
> +       vout_mode = device_property_read_bool(pdev->dev.parent,
> +                                             "rohm,vout1-en-low");

They all using parent device and you may make code neater by adding

  struct device *parent = pdev->dev.parent;

at the definition block of the probe function.

>         if (vout_mode) {
>                 struct gpio_desc *en;
>
> @@ -948,10 +949,10 @@ static int bd957x_probe(struct platform_device *pdev)
>
>                 /* VOUT1 enable state judged by VOUT1_EN pin */
>                 /* See if we have GPIO defined */
> -               en = devm_gpiod_get_from_of_node(&pdev->dev,
> -                                                pdev->dev.parent->of_node,
> -                                                "rohm,vout1-en-gpios", 0,
> -                                                GPIOD_OUT_LOW, "vout1-en");
> +               en = devm_fwnode_gpiod_get(&pdev->dev,
> +                                          dev_fwnode(pdev->dev.parent),
> +                                          "rohm,vout1-en", GPIOD_OUT_LOW,
> +                                          "vout1-en");
>                 if (!IS_ERR(en)) {
>                         /* VOUT1_OPS gpio ctrl */
>                         /*
> @@ -986,8 +987,8 @@ static int bd957x_probe(struct platform_device *pdev)
>          * like DDR voltage selection.
>          */
>         platform_set_drvdata(pdev, ic_data);
> -       ddr_sel =  of_property_read_bool(pdev->dev.parent->of_node,
> -                                        "rohm,ddr-sel-low");
> +       ddr_sel = device_property_read_bool(pdev->dev.parent,
> +                                           "rohm,ddr-sel-low");
>         if (ddr_sel)
>                 ic_data->regulator_data[2].desc.fixed_uV = 1350000;
>         else
>
> --
> b4 0.10.0-dev-fc921



-- 
With Best Regards,
Andy Shevchenko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
