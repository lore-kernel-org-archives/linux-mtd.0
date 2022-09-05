Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C4CC6FA89
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 20:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Br2K+x0Xe736gou78BgpUq8Hm8oM8QYMzldli1TR580=; b=yTU/vX7bCnw55C
	kS32AG8u+QvK73o++ooG2OnrwF0rXzd+a1d1lWxeqcRYBHZZjWpFNE/2tFahiTOk6qIsBeK5zjRoT
	qbvhWLDM74pHBaEWbXKmjjIf3NfyFqGiQu++vTKqu+Armb+Cvc2jR57Vw4YG/najr8dA+ScG0S9rL
	t6R9rCNzggNHOLzcxoXKF6ry7kHJYxgvZ9uNZfT4Uihfyi6mDy9uTHUVrxBxEkl/Oyx6mlEKDF3dw
	0YEeLQF95EGVxgBLppzSaW/wWIl+oGjdQUfQGx2EqtqkHfxhFqa+FxWBsUiWZrA/n5lDDBBSS83oN
	aUL1rsyJ45SJ4JDY+rUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVIN3-009vzP-QP; Mon, 05 Sep 2022 20:07:01 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVHx0-009UTK-1f; Mon, 05 Sep 2022 19:40:09 +0000
Received: by mail-pf1-x42f.google.com with SMTP id o126so343278pfb.6;
        Mon, 05 Sep 2022 12:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=CBRkTEdupwBv7lUysuAAHCWeUeGOXoPs3goZlUKIChI=;
        b=AoB/BB+wDCEOf3ollKTlkOpFH5ZdJcaYtYObH7F+USml96PL05nQZdIxn7ekRew/5b
         7EIcLBlc3MsHwZ5Sf25zmIO3Px5fO4gvhdDaBRhf9uOzwFLARLpmd1bM870f8lIBNHD3
         gytJZ2ifVtaupmJ3QTM9/NdK15W4dYwrMCBg6SW65U1OqgtNyXc84pbod89bIQ6BXjDU
         8DjK9Glh1ftaKc4OO8CDr320e11XRL2oTkt0sdDZYfOg6PUIpHo4y/CMFZXvXzFkVUsb
         WSwJf6gJvfOXaQ8gaip6aWRNOqu2Fi4hdJAIEf0y3X+J6pOHAoM+5/JGDwZcC7JNH7er
         c8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=CBRkTEdupwBv7lUysuAAHCWeUeGOXoPs3goZlUKIChI=;
        b=tNQ/SZ72dDSZ+D2BUimZrpcSzqCszpdtMgqpi6BBlD7FDeWLJW9DOuNOI5PFjCjYMv
         ADPZq8Gec4xxvc8Be+vI1mlWNwcJsf7VUjKEKuPPknR8WnOtDmmw/6wsrvN08rEBK5C5
         /+YZQt2P7pMmac+7BxVYlDvz9tpYC4PfyNjcms3/YhC+emIhvV9b5SSxWr0zCWfUY8qK
         +NFAPOMlXtciHXvyR9h3DL+4Msy3/VjACmkOIFHCq5f996WtS1SWWRKKZ3A0oLf0iRtb
         g96qFQi2U/SSHzNeVW9D9Pm0L6kSUIwWrnihtet20CC8/uzmeCdZRHhWNJiFqY9311Mi
         QaAg==
X-Gm-Message-State: ACgBeo0Yv/O5SbA28+rDTWGaN5vHVSzE4jSYN/8Rb02mYUnMsvvP7Ohj
	9y6gS79jcJ4+5UCnCXv4S44=
X-Google-Smtp-Source: AA6agR57aEnMQb2MM+YsWuK1Qvz4a+9OpUI4vj1PStOfsBOdRv0ywrZ084st51jWLHlWq8m5GTSO4g==
X-Received: by 2002:a65:6255:0:b0:42c:87b1:485b with SMTP id q21-20020a656255000000b0042c87b1485bmr29214848pgv.491.1662406803892;
        Mon, 05 Sep 2022 12:40:03 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:7332:f188:2984:5930])
        by smtp.gmail.com with ESMTPSA id p14-20020a170902780e00b00176b4f9d871sm2199498pll.70.2022.09.05.12.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 12:40:03 -0700 (PDT)
Date: Mon, 5 Sep 2022 12:39:59 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Felipe Balbi <balbi@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Marc Zyngier <maz@kernel.org>, Richard Weinberger <richard@nod.at>,
	David Airlie <airlied@linux.ie>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
	USB <linux-usb@vger.kernel.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	linux-pci <linux-pci@vger.kernel.org>,
	linux-tegra <linux-tegra@vger.kernel.org>,
	"open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1 04/11] usb: phy: tegra: switch to using
 devm_gpiod_get()
Message-ID: <YxZQj8bwJCx5rqDv@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-4-b29adfb27a6c@gmail.com>
 <CAHp75VdMr7wru-2hD1HH3OS5JTNdzt6VRqB6OFoCp2JkiuiTjw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75VdMr7wru-2hD1HH3OS5JTNdzt6VRqB6OFoCp2JkiuiTjw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_124006_295872_729F1049 
X-CRM114-Status: GOOD (  20.82  )
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

On Mon, Sep 05, 2022 at 01:59:44PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
> > so that gpiolib can be cleaned a bit, so let's switch to the generic
> > device property API.
> >
> > I believe that the only reason the driver, instead of the standard
> > devm_gpiod_get(), used devm_gpiod_get_from_of_node() is because it
> > wanted to set up a pretty consumer name for the GPIO, and we now have
> > a special API for that.
> 
> ...
> 
> > -               gpiod = devm_gpiod_get_from_of_node(&pdev->dev, np,
> > -                                                   "nvidia,phy-reset-gpio",
> > -                                                   0, GPIOD_OUT_HIGH,
> > -                                                   "ulpi_phy_reset_b");
> > +               gpiod = devm_gpiod_get(&pdev->dev, "nvidia,phy-reset",
> > +                                      GPIOD_OUT_HIGH);
> >                 err = PTR_ERR_OR_ZERO(gpiod);
> 
> What does _OR_ZERO mean now?

This converts a pointer to an error code if a pointer represents
ERR_PTR() encoded error, or 0 to indicate success.

static inline int __must_check PTR_ERR_OR_ZERO(__force const void *ptr)
{
	if (IS_ERR(ptr))
		return PTR_ERR(ptr);
	else
		return 0;
}

Thanks.

-- 
Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
