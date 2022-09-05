Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E10C54EE9
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 13:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JL+wfYGSXqOWyQxO5xiKtKJ5tk1dMFYQLRfmB4IObWk=; b=r8AT/LxhVZ0HVm
	jgvjlhtcVC1kIDAu5B3JV9bE4yh/A7N4Xeqy4xBDperC+DMd7tHG7zS67aIrubQTT+IbC5FOpYifX
	7HB6TiU3wEJG4Ydr5nnSBealfaq4A0KiRAlLZzn3XE9gq6XutszIUv26A2t4W/Aj3UxoThDWR1p1q
	vZsJKeqF6rNboDqYrc3pLtC3NunEbB86iyFUYR8fZ3Y1S69Z2CodYx3avYza8LQyvcVv6CfZ0SNWD
	V1IFa73hkl8BcqhXdpFuS+g3h+PN5ttYK3O2ZA1r75dWyxP8hrRU9dGatguSu3uRVjpjNkD/GoWv0
	Z9GsopMxUPFbPG9jda7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVCFU-003H3i-1s; Mon, 05 Sep 2022 13:34:48 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV9ZF-000Xxv-Dg; Mon, 05 Sep 2022 10:43:02 +0000
Received: by mail-qt1-x82a.google.com with SMTP id h21so5869943qta.3;
        Mon, 05 Sep 2022 03:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=GuGrKhvALB+DYbg9DByJZaidZTqMxf1dKNyNwmUzn6Y=;
        b=hdRIxx5gYJprXyb7McPED88U6CjGFW4/o/oE2UEQDAnFQvuRdKTBrAbPBTxaUJ9avf
         ZhONilidxc49jl4KtjO3UBa42TeRciWGfG7/aHWNdgw4HkempGiN+R8+n9bi+njwfvsf
         u5vMv6wXB1Ye3Gbinm5yEMDUAfvTO2BfwcWFUoinJoVc2JXFHnCdTpKgEEuyojVrDzWD
         W+9CAhZTdkGDNzhki05EKQP0hWG3s9bgvQRV731RyOIqcTlNyTSHFHR46gnhjmW/VUhN
         vl25c1uxIRcxwJheohCT5s/0OzbaRy4WbiXoQTG++iLwB5P3a5Gf9fVcIKfh7m5uIR41
         Lt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=GuGrKhvALB+DYbg9DByJZaidZTqMxf1dKNyNwmUzn6Y=;
        b=SDLm0PNoxwm54ESz1jtx5ciZKfkRrE1vnLMtZ0/oPlztJogWBmnfQsBof9hbDwEIf2
         QOsHI8gF1azcZCZVgkPOYje7ufpoG5OKZZrWeYXk4IzyZIN+0OsU8cWMrD9hxCHS+SXB
         FfEO1liWvXYicICF2HoFJ6rrDG/FGI0aTI5ptnTUc7vOhveGfLko71InhNTuqFh5mc3f
         8ZTmyLplHssS+ueA3s0w3wzOZ1FFpEvBox4D5/Po3qtSxWJSyueVA0AxeAkrkiDDtvY0
         q3eRr9ZrfvxeaC8ntr8jK6s0QC+j0ZCMY7rRz+r26tubFF1Qd98pwPpVGDN0K7EH+7rZ
         3EsQ==
X-Gm-Message-State: ACgBeo2VsqsUKn/mG5+mLxvS/ezP/082uQnbvrpQJRXsZERV/3fJuWkq
	I6Flw/aKbPlfPeu6SFfd14bgzjuLt7go5e4hKD0=
X-Google-Smtp-Source: AA6agR5J+1DJZPHd8O1DpA1QnLoQwr6drCn2l0fANuHmNbkAQyCPYj0H4aQjgFElwOjCvL9IFnO1bhj11LsfyBavbIE=
X-Received: by 2002:a05:622a:491:b0:344:95bf:8f05 with SMTP id
 p17-20020a05622a049100b0034495bf8f05mr38933704qtx.61.1662374580142; Mon, 05
 Sep 2022 03:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-8-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-8-b29adfb27a6c@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 13:42:24 +0300
Message-ID: <CAHp75Vfza3ubqwSDWnYidAjw52_zRp6sff6xhugXJNwHvRaXew@mail.gmail.com>
Subject: Re: [PATCH v1 08/11] regulator: bd71815: switch to using devm_fwnode_gpiod_get()
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
X-CRM114-CacheID: sfid-20220905_034301_675928_576226D2 
X-CRM114-Status: GOOD (  18.09  )
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

Special thanks for using dev_fwnode().
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
(Dunno if my suggestion about parent applies here)

> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>
> diff --git a/drivers/regulator/bd71815-regulator.c b/drivers/regulator/bd71815-regulator.c
> index acaa6607898e..c2b8b8be7824 100644
> --- a/drivers/regulator/bd71815-regulator.c
> +++ b/drivers/regulator/bd71815-regulator.c
> @@ -571,11 +571,10 @@ static int bd7181x_probe(struct platform_device *pdev)
>                 dev_err(&pdev->dev, "No parent regmap\n");
>                 return -ENODEV;
>         }
> -       ldo4_en = devm_gpiod_get_from_of_node(&pdev->dev,
> -                                             pdev->dev.parent->of_node,
> -                                                "rohm,vsel-gpios", 0,
> -                                                GPIOD_ASIS, "ldo4-en");
>
> +       ldo4_en = devm_fwnode_gpiod_get(&pdev->dev,
> +                                       dev_fwnode(pdev->dev.parent),
> +                                       "rohm,vsel", GPIOD_ASIS, "ldo4-en");
>         if (IS_ERR(ldo4_en)) {
>                 ret = PTR_ERR(ldo4_en);
>                 if (ret != -ENOENT)
>
> --
> b4 0.10.0-dev-fc921



-- 
With Best Regards,
Andy Shevchenko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
