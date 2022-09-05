Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711C7ECAAD3
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 21:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ZH0HoMfZteitefpN+63Y69sivUAjBgLaA5lNcfwCVU=; b=GuCIj7b+oV1Yuy
	ttlofxSM7tAdp1Vj85cH3bvTFvD/AXf7eeWkLCjHFkLJ7RhTI/SdV5+mXYNGXWdu4ZmERqTaOtyLV
	+2F63gjeLJlPpgh4WFCNAQIbYqGulfLkc5qZpEztiK7/kW+lI0zDDisRBdAknu5iJpHPzln53K0WU
	jaHeQ5NT0vMTUIXMbL45ARZ0o+UgweuBs/f0oSRKqgueA/6MqH+0oLNVKhjxkpWkq9D4hOtkV383y
	At+W1ElKHhBD4ZfGRzZBr2Ui9/gLnR8BiNTIa/pyOYPoqViQGbCYFT22/6J2wTcMhrxl17QnktsbP
	0dP7t8WhNgqQCfbMnbBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVJFt-00D7RT-VZ; Mon, 05 Sep 2022 21:03:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVJFs-00D5VW-56; Mon, 05 Sep 2022 21:03:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=y3Qjjf92TYynwevE3H2ZfJzfWM4V6u0gYdLfjE+80ak=; b=ReuT+x99g+Hm6oZ/E8FctIv/3O
	i5ipKU5BozC0yaaAZIQOW2oGBBHjRDtI3IURxy/XypvjNCXS7ZMfS3c9YZ6Kl+MwC+DcftwNf1MYv
	99ziejGrYRr21ExwYk3nMZbBZs3iiQpQGK6eiMrnVxzJoqLaDIgjsxsUtgW5ZixGkapYoMzyrQ4+/
	quujFpeEmDpswpiSTQwe+3SLBJ58CVjU7FiHvMYmSRhb5HoPAas8I6t7k8t6/aGG+hhnJBBTxR4Cc
	VnrSHuPj42Yi1KSxYqQsMT07YEcsTJmFWLWWHh5ACk0J3ksH8hGPZAkfXqXu9JtiR4nGRu6t1jnpQ
	om5lhmvg==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVI8J-009xDF-Tb; Mon, 05 Sep 2022 19:51:54 +0000
Received: by mail-pj1-x1034.google.com with SMTP id fv3so3073719pjb.0;
        Mon, 05 Sep 2022 12:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=y3Qjjf92TYynwevE3H2ZfJzfWM4V6u0gYdLfjE+80ak=;
        b=p8fQjE0a0ZYjZfKRTjHpT3euYQsGr97PlI4J+3Etag+6i4rW86Bv40nzZOUk7I+O74
         6AB3V55fbqVv7uRxcLJ9p+i6cEGfvUhY3Kul9eRBDmP4APZA6HSJroq5lt4nanlf+S4D
         WzL8qbprYpzsZPbHTw91TVqhBBtGkTVEuU+NWJvf9meD6jRYOhrvpxBh2bEHlWS2vOzN
         /mMdK+1vtePGkD0+o2tcKMw1L7TbtR/LY2u3VdsMAB8lgT9qdQtRVvzA9MzGS4jTHM2e
         Y8DXi1ZE+gjUnF3/4YvRqKEtHb92EDRaHq/IKZmP1TBDcFx5o+n/mIkQoIp34EalsnaQ
         zoGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=y3Qjjf92TYynwevE3H2ZfJzfWM4V6u0gYdLfjE+80ak=;
        b=anpV15ARjjSVXFWqoXRxLERlb6JjawGNKyIu2ooQXNErAk4Vyv0raI9xW+UyBDaDH/
         VM0FH0bMx0OMozd0JrA+OuxMknUfRdMTF8zGUEQZtvKHqTiRd2VAzqvU2xWzveqJjJH8
         h6RmMQWJwmjQnYgl/0jf4x+2URdJKkYGAdZJkrkMAJeSwW0onwol46GXV1xcRBNSbSsC
         OoMBQfkJ1KceTRyVXt4hqUWei388aJeEULEBh4cKJLJB+SeNa/QeGz0m7VydK9V6Vbk8
         BVPwH7ctFojKx3P7xMHgFc2Rd7QTVc1taOz8fVLa5mFolrhYKzbXJmtu1b0A42luOC3r
         zpqg==
X-Gm-Message-State: ACgBeo2npEDV3lDgPmRDHSighEhVrqaibwmSOo+pB8b6LJUdxicGSTmM
	blsgllah6vQ/H0fiB9U1nYI=
X-Google-Smtp-Source: AA6agR6jLyMlXDr8IPeAvG3W5MKsqN0u+BmkWQrSPGBis9zvMHZVJmB1Wm8c2BJ+cKCgBoks41PKTg==
X-Received: by 2002:a17:902:f68d:b0:16f:2314:7484 with SMTP id l13-20020a170902f68d00b0016f23147484mr49230641plg.136.1662407504235;
        Mon, 05 Sep 2022 12:51:44 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:7332:f188:2984:5930])
        by smtp.gmail.com with ESMTPSA id g5-20020a17090adac500b001fd8316db51sm7191722pjx.7.2022.09.05.12.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 12:51:43 -0700 (PDT)
Date: Mon, 5 Sep 2022 12:51:39 -0700
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
Message-ID: <YxZTS3Nl1YaMGoBC@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-4-b29adfb27a6c@gmail.com>
 <CAHp75VdMr7wru-2hD1HH3OS5JTNdzt6VRqB6OFoCp2JkiuiTjw@mail.gmail.com>
 <YxZQj8bwJCx5rqDv@google.com>
 <CAHp75VdHJS4YgrTK15OuY5sxodxKObUtzturL+YPXFQ3_wpxig@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75VdHJS4YgrTK15OuY5sxodxKObUtzturL+YPXFQ3_wpxig@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_205150_006634_293A9B4F 
X-CRM114-Status: GOOD (  18.68  )
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

On Mon, Sep 05, 2022 at 10:41:40PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 5, 2022 at 10:40 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> > On Mon, Sep 05, 2022 at 01:59:44PM +0300, Andy Shevchenko wrote:
> > > On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
> > > <dmitry.torokhov@gmail.com> wrote:
> 
> ...
> 
> > > > -               gpiod = devm_gpiod_get_from_of_node(&pdev->dev, np,
> > > > -                                                   "nvidia,phy-reset-gpio",
> > > > -                                                   0, GPIOD_OUT_HIGH,
> > > > -                                                   "ulpi_phy_reset_b");
> > > > +               gpiod = devm_gpiod_get(&pdev->dev, "nvidia,phy-reset",
> > > > +                                      GPIOD_OUT_HIGH);
> > > >                 err = PTR_ERR_OR_ZERO(gpiod);
> > >
> > > What does _OR_ZERO mean now?
> >
> > This converts a pointer to an error code if a pointer represents
> > ERR_PTR() encoded error, or 0 to indicate success.
> 
> Yes, I know that. My point is, how is it useful now (or even before)?
> I mean that devm_gpio_get() never returns NULL, right?

What does returning NULL have to do with anything. It converts a pointer
to a "classic" return code, with negative errors and 0 on success.

It allows to not use multiple IS_ERR/PTR_ERR in the code (I'd need 1
IS_ERR and 2 PTR_ERR, one in dev_err() and another to return).

Thanks.

-- 
Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
