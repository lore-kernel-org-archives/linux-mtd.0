Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FF0ECAAD5
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 21:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IHjqcnD5piuaQVjb/XdpmlPn0jrgx1YeNecWRBNqTSA=; b=zAoHgeZlTsY9pZ
	Fx9sznmMSyRWi3CsA6fk2Z125/HBBG8Kl2lK0k9oWI8uTKqbovwistqXhzUeNpdpni+tg4+enROAU
	6gcyYJ64/ek5jnPj1OuTv8VMPAv9rhhA4aJvIbQW4JdEfZXSpWdTUqgqdKgOXP4Z2E7HkQI8zdIVp
	qkr/J4MJ0sZ7Vr9JIzj/GUiYLlSsk7709bwVAa7uE3vWqSHc0Uwnu1Utlhyj9RxXpop2dL+5TxpsM
	+07Oene/POLPzOigUP+8DNJEFbkdSqGpFMQKassps35n8JNesPdKnmhT3Khu4OazcltCqp1rCoPCL
	J20NT0Mhn+7BhHhomfAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVJG8-00D8pu-FT; Mon, 05 Sep 2022 21:03:56 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVJG4-00D8Go-Ry
	for linux-mtd@lists.infradead.org; Mon, 05 Sep 2022 21:03:54 +0000
Received: by mail-ej1-x62f.google.com with SMTP id fy31so19174995ejc.6
        for <linux-mtd@lists.infradead.org>; Mon, 05 Sep 2022 14:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=hoFfvxrcWLiLIIghJLr7YqFR/bl7ppCzpkpzcFf25Ks=;
        b=RJtkdpcWwDCjdU//f+NiUTQJO5kz/J/LQ4Oeb8FsER0ooLc9TUWAVJHwh16h0rFR6k
         jDNxcAT6fUKAWlYXkDzi9PRVLGCFhao6TAvvqUzCLnc6J1JgrkOg//ZWPBTqZXz06MLe
         g/E79BtcrSCZXcou4vgp2IFBghrcFJpfeHS130JLJDTFGdRTjjJVv3m8lMFyySNYfbdn
         zyHSJi+z2sGr74Gs8Ferhg3qHw1Rm2Rd7LpNg2QiPU+rsqNYeELsa2ObuGU9YVxZktXI
         +EIJDXEMJp+8DP7PW/zCtw+WHI1pL0md9UYJvdO9U0CdYO9jo7gVaKjIjDEh/+/hHVoD
         fvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=hoFfvxrcWLiLIIghJLr7YqFR/bl7ppCzpkpzcFf25Ks=;
        b=U0y3XR560cvD4lXmCZECJ9G10YpSl2IQKKHRsrUAarx4PLXxR8sWmvCjbZN9VCFnkg
         z2Lpva7jwdgHy3W0UJ8ESfUTtE8XQKA5F8XBeaHdGYYQN07K/vMvDpXxt5RR2lVRi8r7
         YGdRJCdZc9UysKdbrQhM4/7I6r8D2Acj0aklq2FR/+Tl/vzuYyOmyjXkytlU+77Agztb
         Sc4SZyHGfvr61WdgdJCRPPPIOougZvI04HFMKMS4QYFtHNXbp6QEcxliV19lmOdhYWh1
         ++FPZldMTaoAHBUzQapU5csL+aBmS1CoEJtKWBrplNhhIoJRRn+DSMFggaI60VymFb+t
         werw==
X-Gm-Message-State: ACgBeo2K485fNJp7phZFpIqTociF82isrEJhu6ItGHWnit/P72cbUwLL
	G7T3mkLmo8l7s2COCEiSnTYk5f8j/7aR3p/HdUa3gA==
X-Google-Smtp-Source: AA6agR4GWSThcRe2jCNjPhluqCCYiE882sQv//p+YmHWCdk54XKDzjUOkiYoAS2W+owpznoWxs2VPch3w1ZAdKXk+5E=
X-Received: by 2002:a17:907:7242:b0:741:770b:dfc6 with SMTP id
 ds2-20020a170907724200b00741770bdfc6mr28207413ejc.203.1662411830025; Mon, 05
 Sep 2022 14:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-2-b29adfb27a6c@gmail.com>
 <CAHp75Vc4yfh0JcY0B-vNawHTay5QNuhd7GAm86QZZZvUnQaMzQ@mail.gmail.com> <YxZP/exeVD7DQ5Hx@google.com>
In-Reply-To: <YxZP/exeVD7DQ5Hx@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Sep 2022 23:03:38 +0200
Message-ID: <CACRpkda0iUTV=71eQf5_FdKWLe3Bu=U+Zny9_uJJL=5xXtnrnQ@mail.gmail.com>
Subject: Re: [PATCH v1 02/11] drm/tegra: switch to using devm_fwnode_gpiod_get
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Felipe Balbi <balbi@kernel.org>, 
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
X-CRM114-CacheID: sfid-20220905_140352_993779_0420E3F5 
X-CRM114-Status: GOOD (  22.74  )
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

On Mon, Sep 5, 2022 at 9:37 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Mon, Sep 05, 2022 at 01:57:01PM +0300, Andy Shevchenko wrote:
> > On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > I would like to limit (or maybe even remove) use of
> > > [devm_]gpiod_get_from_of_node in drivers so that gpiolib can be cleaned
> > > a bit, so let's switch to the generic device property API.
> >
> > > It may even
> > > help with handling secondary fwnodes when gpiolib is taught to handle
> > > gpios described by swnodes.
> >
> > I would remove this sentence from all commit messages since it's a
> > debatable thing and might even not happen, so the above is a pure
> > speculation.
>
> I have the patches. Granted, I had them since '19 ;) but I'm rebasing
> them and going to push them. I need them to convert bunch of input
> drivers away from platform data.

That's good news!

Are you referring to this patch set mentioned in a discussion
from 2017 thru 2020?
https://lore.kernel.org/linux-input/20200826161222.GA1665100@dtor-ws/

I put aside GPIO descriptor conversion for input devices (keys, buttons)
in board files anticipating a swnode mechanism.

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
