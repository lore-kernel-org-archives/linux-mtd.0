Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8088ECAAD3
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 20:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nq60rQ51fl9W0waKqM+e4D8A1QOTsW8j49WHt/Kbszc=; b=2mbnwr/E4Hhs86
	Iw1A9KoDGu+feDNNz1DFk+yfPXZk0CcgrazuTC6yHZrVMS7KzCQkokV5LHzmPpSL9aBPI6iBLjOsk
	Bt/GLUMkUsFwW3GVIZu+llOMhRk2HQmC+6zRxsdeSQ9aGtWH8cPwoBbxd/1dCKf2g4XC7oBsakmlP
	SwLyw+R7lR768idnsV78Opletb7DUZdhOG35iYQ8irrlETfo8N8ExaWZgjKqKTv2sTchdGMMzkz3T
	e9RhYumz/PD3nH8qMyXkgmW31aWbU5Y3eOaNbDDY7R12hmb3eGsunPjHhs2dZsBgnxTCA3EcpZ/yz
	Cw+uLDQgbOAtKIUJd20A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVIVp-00AAZu-CU; Mon, 05 Sep 2022 20:16:05 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVICX-009lp3-6K; Mon, 05 Sep 2022 19:56:10 +0000
Received: by mail-vs1-xe35.google.com with SMTP id j6so9742944vsr.0;
        Mon, 05 Sep 2022 12:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=TxtKuUqRxkHzFdFIsdOfwVRYln8Ru/gjD+KQXu9iPWk=;
        b=oOTNddka/G5MmOs10MprjSwOych3GIj7p+oXSDb0g7K+MumOQ7dZI9fvJZbh5v/ZDF
         DkO1HuuP77CxrZ+nX3N/Lzhn/vUJoUctJFw7B5StarCr4bF9V9vn6OWirRi6MzdQqj30
         RSw/5Gc1rkcPkllIbByQHmgIVNflrb//j8OILQCPlm+kfxjDVj7A+Lyb1H1czT3F4/xi
         bz15Ht8yFZoqUyi30wGVEJqKiyzB6caNlhd6ZUpR1ANYxl8eNvELSRuii9PJ3S+s4ley
         Rp+HaIIqJfxdvV1TQotcVRJ+vu/DyoG1JpVG2rEiNSh0BPI5uNW/2ybVsLc3YOQ/Kl+P
         cZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=TxtKuUqRxkHzFdFIsdOfwVRYln8Ru/gjD+KQXu9iPWk=;
        b=upVsy7WByS+Na0hTIIfdyibNqQSHunV/kbnBNkc7hvn2laCjGQ+dRkqtOhIH8fip6+
         bSzwFWdyVooOd876qHwG8G/BYbEHUAoWUvdmhNmVlHNrWN7W/JG1QP0D++8OD34GkSeN
         HZtPlIlfzfnKewfQXBPJYqd0hmZWKdlLDExyfSrzAeZmspTNUtOCTnU0SmDUSxl7MZG7
         5ijH9hHkFYen57KmHG4urlROHuZvuI0ScayfLoQ9qIffznlZCE7VD6TX5jzcLjb+24/M
         I6BM/8qVZCey6mFTXHKbqDsoKf5XFIVYSpz6LElZ0Nk8Nmxp+/+KXrv2XkploB9DZbco
         q9mQ==
X-Gm-Message-State: ACgBeo1FZbqU2YIoyJE3GkhT+N5tvqn29Y67MN6jAEj/47D7D4yb65BJ
	39PcyHbBRJV/RFUjyVmWlDy3Avc3nDX5ZX6hE5g=
X-Google-Smtp-Source: AA6agR40buubTfPsstG80DF+s22ldT4F+qiWGt4P8UBWfLfejzg6ynm6XI4ScnPvxtGB0Oeq1Upf5TBcnrM6rSa5o+Y=
X-Received: by 2002:a67:e058:0:b0:390:e62d:8976 with SMTP id
 n24-20020a67e058000000b00390e62d8976mr11716363vsl.31.1662407766752; Mon, 05
 Sep 2022 12:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-4-b29adfb27a6c@gmail.com>
 <CAHp75VdMr7wru-2hD1HH3OS5JTNdzt6VRqB6OFoCp2JkiuiTjw@mail.gmail.com>
 <YxZQj8bwJCx5rqDv@google.com> <CAHp75VdHJS4YgrTK15OuY5sxodxKObUtzturL+YPXFQ3_wpxig@mail.gmail.com>
 <YxZTS3Nl1YaMGoBC@google.com>
In-Reply-To: <YxZTS3Nl1YaMGoBC@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 22:55:30 +0300
Message-ID: <CAHp75VeNajcf-Y6xvDDVwZijg6U53ggg1HQox1AZ74=wRut+1Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220905_125609_371920_0BB61122 
X-CRM114-Status: GOOD (  21.83  )
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

On Mon, Sep 5, 2022 at 10:51 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Mon, Sep 05, 2022 at 10:41:40PM +0300, Andy Shevchenko wrote:
> > On Mon, Sep 5, 2022 at 10:40 PM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > > On Mon, Sep 05, 2022 at 01:59:44PM +0300, Andy Shevchenko wrote:
> > > > On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
> > > > <dmitry.torokhov@gmail.com> wrote:

...

> > > > > -               gpiod = devm_gpiod_get_from_of_node(&pdev->dev, np,
> > > > > -                                                   "nvidia,phy-reset-gpio",
> > > > > -                                                   0, GPIOD_OUT_HIGH,
> > > > > -                                                   "ulpi_phy_reset_b");
> > > > > +               gpiod = devm_gpiod_get(&pdev->dev, "nvidia,phy-reset",
> > > > > +                                      GPIOD_OUT_HIGH);
> > > > >                 err = PTR_ERR_OR_ZERO(gpiod);
> > > >
> > > > What does _OR_ZERO mean now?
> > >
> > > This converts a pointer to an error code if a pointer represents
> > > ERR_PTR() encoded error, or 0 to indicate success.
> >
> > Yes, I know that. My point is, how is it useful now (or even before)?
> > I mean that devm_gpio_get() never returns NULL, right?
>
> What does returning NULL have to do with anything.

It has to do with a dead code. If defm_gpiod_get() does not return
NULL, then why do we even bother to check?

> It converts a pointer
> to a "classic" return code, with negative errors and 0 on success.
>
> It allows to not use multiple IS_ERR/PTR_ERR in the code (I'd need 1
> IS_ERR and 2 PTR_ERR, one in dev_err() and another to return).

I don't see how this is relevant.

-- 
With Best Regards,
Andy Shevchenko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
