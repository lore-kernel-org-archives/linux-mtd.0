Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D34ECAAD5
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 14:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TO+cbzgws859ORFZWCZaFKOjaEhJTZhBN4TViX4POhU=; b=onLpRTj52k8vFR
	ymFdYHGacPfybfNMrQathynyUKBvzlA1wUOd8FeNUcvWjmFWAtaGU50yQLIC7VRps5Bo1Uva/OCKO
	KG6IUAwGjlQCYF5e2/B2uLq8tGTqnJx3z3BFBkwH59QVs1eTAiWSkmc0dQbvWHCA+RUpXzrHkChDw
	aUjZAxKB4/2+ZOgirZAc8q0B/Ek6kejvWkRuno81aYfeT+18CdTWJFmj5tN+aUArvjh3aYXL5bPcr
	UbaxOHX7BnEh4AEhvSwCBuejfno9JkuKVSvf1yobb2QKPlnUPYcuhNwnD1xJ7lghmUf0F4M44KRby
	7KYdQRYmho1RDx/GFFXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVCqC-004EFU-1T; Mon, 05 Sep 2022 14:12:44 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV9zA-000uba-V1; Mon, 05 Sep 2022 11:09:50 +0000
Received: by mail-qv1-xf31.google.com with SMTP id kh8so6198792qvb.1;
        Mon, 05 Sep 2022 04:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ZD4YC1HXrtSaQEFJiBqrgz0UPEGxSAaPa+lNAJ8WZi0=;
        b=W0LYg/x6oLLMVr5A9MMBVb+TxN0pk4+3xuh3Q/ipfqH1hrq5kvR4C13ZGg+8+DEqSd
         gi1J5ByiQnS+4NrTCIvUT/kKaXn5hL9zW9YV18N0SnlPLU0irWOq7beGGmmV2it9I/V8
         TSz0IwHJZsNw1mnLJ+EmjO0aVsfTD6x8QeroaNTk/ISAjEimxSO9AuqJQS/RTnqxI8me
         UqWOiBI+Wn0HCU5QQ9nYXLzwM0PBRWriqZaCP3K1erw3D5FZR6d/x6x4b60TAHtECET6
         J6AxXbDHgN6gXzpMM9fNWwiGiQLT2KqoyWZt7c52eyHpDdJ+EY+BURgwhcI9q/0V9kVd
         TT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ZD4YC1HXrtSaQEFJiBqrgz0UPEGxSAaPa+lNAJ8WZi0=;
        b=HvyeuKLWXauJ6Hesdzxx8ysyhmO030PFM4EwvCiQzWnOHZYB9jAxelD1roNilxk9bM
         DRWjHE8kflrcnt/LciPPDOhvCqvnFO9Dkr1NiJxQ09HMBlhAD1mtT8aIfVRW9O/Y56c8
         /cgyXQ77+wmEbnXMc4p7hGl/F1tQZX0QN5iUS76/hachaY18iDt+6cSmVisy5q2hlRgt
         S0EkrWlzNnRWakSULYPnFNr6W1PRXuHq33J/wJ5B87TXaCt1ET+D70jpEZzbhI8o7fo4
         Q2zMFCSiOeOtIgyr5blbgCa3S+oY83PFFVlauOHpbSyxBhrhO9SCQnQUe8F28+qJwwBG
         JG5Q==
X-Gm-Message-State: ACgBeo0WbnMKC9zEkuVF7AHn4fdzDFR5W3gS6CAo8LpLPN3+QqhVunmR
	ZpVU0fUGrQee1pObUTYKct4W6mcsiBpehv2eG94=
X-Google-Smtp-Source: AA6agR5jCq5/GjKb+apw06fa/2t9tC05H0ZPM5KdsjnljOtEm1B4hEVBpVM1iH3NQHKg14ReUnIBjf+3AuFTQfBZ7lg=
X-Received: by 2002:a0c:e24b:0:b0:4a1:d41b:e280 with SMTP id
 x11-20020a0ce24b000000b004a1d41be280mr5474897qvl.11.1662376185481; Mon, 05
 Sep 2022 04:09:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-10-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-10-b29adfb27a6c@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 14:09:09 +0300
Message-ID: <CAHp75Vd35EOy=mP25=9fmYfqQnbafgotHw1fxk-TdGk6Oc8g8Q@mail.gmail.com>
Subject: Re: [PATCH v1 10/11] watchdog: bd9576_wdt: switch to using devm_fwnode_gpiod_get()
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
X-CRM114-CacheID: sfid-20220905_040949_260385_BC05F512 
X-CRM114-Status: GOOD (  19.85  )
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

it, switch

> bd9576_wdt_probe() to the generic device property API as well.

...

>         struct device *dev = &pdev->dev;

struct device *parent = dev->parent;

can make your code slightly neater.

...

> +       count = device_property_count_u32(dev->parent, "rohm,hw-timeout-ms");
> +       if (count < 0 && count != -EINVAL)
> +               return count;
> +
> +       if (count > 0) {

> +               if (count > ARRAY_SIZE(hw_margin))
> +                       return -EINVAL;

Why double check? You may move it out of the (count > 0).

...

> -       if (ret == 1)
> -               hw_margin_max = hw_margin[0];

> +               ret = device_property_read_u32_array(dev->parent,
> +                                                    "rohm,hw-timeout-ms",
> +                                                    hw_margin, count);
> +               if (ret < 0)
> +                       return ret;

So, only this needs the count > 0 check since below already has it implicitly.

> -       if (ret == 2) {
> -               hw_margin_max = hw_margin[1];
> -               hw_margin_min = hw_margin[0];
> +               if (count == 1)
> +                       hw_margin_max = hw_margin[0];
> +
> +               if (count == 2) {
> +                       hw_margin_max = hw_margin[1];
> +                       hw_margin_min = hw_margin[0];
> +               }
>         }

-- 
With Best Regards,
Andy Shevchenko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
