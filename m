Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90143ECAAD3
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 14:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EEY6/m4gczhBfjuBUoLQP4r3Na/KvvmJpI4GDnh+6Tw=; b=vsU6GL6rleqgCW
	I0o27FAsrXWwbV05RWn+rYO1F22vinGA6lOjnVz++VY6w0L4AYhV3GvLvFiMKvr70b9BOruFKXUuz
	f889Pv9en9iBfGmPs5gNvG/zDf0DQD4DlqxAL1xPrSuq2Htes7JcCAQTCn/60oy7r61uU867OD7CA
	/HLDq/mHebgi4DgpVAYyl2PB+NmLduD26J/h8WTdvKMVFVAoAv3wva4HTUWyiEFY5XaTZ8xvw38d+
	g6OoISJ2nVfZcwtk5IYNfA+00dv8hVrYWnRkQAaVEhWKixy4MvZjP7m06n5KLcngBqhVVcFWnpTMw
	rKLqh9100NpS/Mfp+gAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVCer-0040R6-0u; Mon, 05 Sep 2022 14:01:04 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV9q1-000md1-Ak; Mon, 05 Sep 2022 11:00:23 +0000
Received: by mail-qk1-x72f.google.com with SMTP id h27so6063781qkk.9;
        Mon, 05 Sep 2022 04:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ZeMo2PWVWCCE4kicxMFOEAyAOyDB4gnn7oyqH8IifhU=;
        b=CTOoiLvwwBkvtH32c6w60zEVvHcTnoXO3ACu0Ys4kWjZ2v5rcWsBDH+vdDx4TQZ9hd
         zoXITcV3yQclTjF5bSmp+qDBSGLQc9kK7p/Q6MVruLaf+yQ2ieawJUD0vtr6jFmlqqb5
         VM0HxdCbbCyt9e3B0tD+nb2kHG9B39a4RXdVZ+gBaJ13JI/Bhg4cILs9FZoegyTQ+F+6
         8fPJkAuVnPubU2LSPwAtno5IP1SguIVrVU1uTopFif2u8b6jICrnPWEduG2jMRNf+dw3
         TOSVD6xw70ivt4BkffpLzGj1KiFTvRTD6M32zkdDHIex4lTV6wIEhedGMFPH+v+dK0yQ
         6+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ZeMo2PWVWCCE4kicxMFOEAyAOyDB4gnn7oyqH8IifhU=;
        b=gk7X5uHjDmSOMor0jWRsQYMb5UG+iv7I4AYluQqdKxUH7Wgaidr1YsC/24DoJ+eoPF
         iW/uSt/ri6XrV+nTRf85zRVg0hqyI0/lBCpndfC6IkYzym+Ixv1Mu/TsciKo5mkvxBhc
         7pfnEaphS8q8KtCTpDeyMQ7v0N5pzsEtx3WaacmfR8HjgWw9GmO0N9ABqmur+IvEzref
         I/sgkYDBrnW2/8TMu+Hm4tfWYhIPdMBxnke/oTbV82jp25/U62tKz7JIqE8b+QYvvqqg
         2eJDtF58166MvO5uaY5MjweebjPC2DYyf7OkJSNIOSvXovwAE/ffo7Uh1LbNA3GME0WW
         jVnw==
X-Gm-Message-State: ACgBeo2MdS6IAyZXFEr46LeYPEQmBghuweE1SlZONdYQQg7CANiHCjHO
	3Uf1bTj4vcpm3y/kbitRBcFC4darbjZCXWTh3L0=
X-Google-Smtp-Source: AA6agR5QfYlB3faOXg1Xo9fT2kr66lBEoMt1tUwQEmf4Hjj69mFUh3WyFYB6EU5cllnnLi+qXnfCb/Dp4e9d3zghof0=
X-Received: by 2002:a05:620a:288a:b0:6b8:fcfe:db02 with SMTP id
 j10-20020a05620a288a00b006b8fcfedb02mr32736370qkp.504.1662375620030; Mon, 05
 Sep 2022 04:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-4-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-4-b29adfb27a6c@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 13:59:44 +0300
Message-ID: <CAHp75VdMr7wru-2hD1HH3OS5JTNdzt6VRqB6OFoCp2JkiuiTjw@mail.gmail.com>
Subject: Re: [PATCH v1 04/11] usb: phy: tegra: switch to using devm_gpiod_get()
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
X-CRM114-CacheID: sfid-20220905_040021_438756_0B27895C 
X-CRM114-Status: GOOD (  16.26  )
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

On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
> so that gpiolib can be cleaned a bit, so let's switch to the generic
> device property API.
>
> I believe that the only reason the driver, instead of the standard
> devm_gpiod_get(), used devm_gpiod_get_from_of_node() is because it
> wanted to set up a pretty consumer name for the GPIO, and we now have
> a special API for that.

...

> -               gpiod = devm_gpiod_get_from_of_node(&pdev->dev, np,
> -                                                   "nvidia,phy-reset-gpio",
> -                                                   0, GPIOD_OUT_HIGH,
> -                                                   "ulpi_phy_reset_b");
> +               gpiod = devm_gpiod_get(&pdev->dev, "nvidia,phy-reset",
> +                                      GPIOD_OUT_HIGH);
>                 err = PTR_ERR_OR_ZERO(gpiod);

What does _OR_ZERO mean now?

>                 if (err) {
>                         dev_err(&pdev->dev,
>                                 "Request failed for reset GPIO: %d\n", err);
>                         return err;
>                 }



-- 
With Best Regards,
Andy Shevchenko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
