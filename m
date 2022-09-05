Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7271DECAAD3
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 22:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fbGnXp8sh0vWVoVTwPPYkgsjgyuaudc0HNjUbkj3bkc=; b=wLhMcA/HoWoVuq
	fgViZ2W+OvsC2a3M4EeT86+PA1iZMEYSmNRTZ7lq97TUl4wdu7Z0OiDMraoryqQyGY4emQKOVgTW/
	FgXi0gr0cluaxmu2eL77vRoBu2OsmkBCaUHjhm/9b6QIKB7gqON/mDM3dhFqkSQN6YjQiV53+hPZd
	hULrd1GJEWzFNMvuJsGNadPdUr5JlhICqmJDkHRHlzH7K8qfuSVIbjjHA8E6U2vFSWuiOYNiA/O3f
	9FoeM/+W5jmyf98ZDPr8ByWogkrJ5B3qrR3UlID0iugaz/XQ9hzQxd40BHqj6zcBUWL/khnhENr59
	1seOIC7TnKSv8QnelOhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVKzm-00HUUF-Hf; Mon, 05 Sep 2022 22:55:10 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVKzc-00HULH-AM; Mon, 05 Sep 2022 22:55:01 +0000
Received: by mail-pj1-x1030.google.com with SMTP id q3so9475254pjg.3;
        Mon, 05 Sep 2022 15:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=QRQkxIGFI3OF3amcRlbkZf4vgkek6ggFXyd9zidvB8c=;
        b=gsorC9ciDElqLq5gq0tq73oj5nMDX/AJm+EMEt5M9j7Nw6OucD0+TVGBzuQn+rrtls
         0loRnw7UzHrgMM28KIGVLo7qn/bZoumg2qTw3CfDMDdQmf0bgbzpShi+kGjU7raGyx6P
         sToiGUYujxqPyCybICNsYdfYAa2jOurTif72VImXpZhCttvifys7wIqhFIW1PJR8dY03
         UzvU99z5GubsoABcuAk5rbAMv44acUIXmY5P0ep133FiqLgOHtVg+wzuulxPweHG+ula
         IzdWZ5ta3aGiqrNbwgZATXaEEWNGQRgzb+HrP6NXzuvsc0zd1wPa546sY9tkILtVErqR
         hUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=QRQkxIGFI3OF3amcRlbkZf4vgkek6ggFXyd9zidvB8c=;
        b=r2A9gVlU+ocyMJdj9Jg7fHZeUdFCm7wsyj1h5B6Hla0p3+Ygh/v43mZ3NVoMIoGuTK
         5YZHiG8G95BI89csLB6JMnPyRsk1eh//UmYfQWXSeomT6hoNsQ0SS7aIdmkIMDFwjQIj
         q+IwxRd+erVOJlObdni9ji23SED6smFej2O6WWbz4jsQTYk0QhZ5yu5Bk+ac+7ozRk6Y
         epAhphNdWGT8AeY1Ezg/8YVXu35mMckYAZOdr4rTJKL3zbK/9SOG3IPr6PQigaJoT8sk
         1fvrM3d0N47p/49+P586cLs4w2hyae4+4ur939hQgOSev37zFLkYXDsJNtFMx7UL8Vnx
         jlxQ==
X-Gm-Message-State: ACgBeo01KbgrK8dT78jdE8k5a1fHboiaQgvafm6FNg6IVTqBdQk7ngot
	pjLFg+PrtsuxKdNYJaUKZzk=
X-Google-Smtp-Source: AA6agR6BVwijybUmJvKefzrwHZ9dDsULsMfqVmOf8/ecx+Q6qQipxqieCoJRYSCXP05TF0ANy6CnCA==
X-Received: by 2002:a17:902:be03:b0:175:6397:9425 with SMTP id r3-20020a170902be0300b0017563979425mr21493671pls.26.1662418498231;
        Mon, 05 Sep 2022 15:54:58 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:1190:fbfa:ae95:111c])
        by smtp.gmail.com with ESMTPSA id d21-20020a630e15000000b0042c2def703asm6833366pgl.22.2022.09.05.15.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 15:54:57 -0700 (PDT)
Date: Mon, 5 Sep 2022 15:54:53 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
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
	Bjorn Helgaas <bhelgaas@google.com>, linux-watchdog@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 06/11] PCI: aardvark: switch to using
 devm_gpiod_get_optional()
Message-ID: <YxZ+PSDRYZnVKfFO@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-6-b29adfb27a6c@gmail.com>
 <20220905070046.46nlhczkck2ufr4x@pali>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220905070046.46nlhczkck2ufr4x@pali>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_155500_414178_1E14014F 
X-CRM114-Status: GOOD (  29.05  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Sep 05, 2022 at 09:00:46AM +0200, Pali Roh=E1r wrote:
> On Sunday 04 September 2022 23:30:58 Dmitry Torokhov wrote:
> > I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
> > so that gpiolib can be cleaned a bit, so let's switch to the generic
> > device property API.
> > =

> > I believe that the only reason the driver, instead of the standard
> > devm_gpiod_get_optional(), used devm_gpiod_get_from_of_node() is
> > because it wanted to set up a pretty consumer name for the GPIO,
> =

> IIRC consumer name is not used at all.
> =

> The reason was to specify full name of DTS property, for easier
> identification of the code. DTS property is "reset-gpios" but API
> specify only "reset".

I see. Do you want me to reset the patch with updated desctiption as to
the reason devm_gpiod_get_from_of_node() was used?

> =

> > and we now have a special API for that.
> > =

> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > =

> > diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/contro=
ller/pci-aardvark.c
> > index 4834198cc86b..4a8a4a8522cb 100644
> > --- a/drivers/pci/controller/pci-aardvark.c
> > +++ b/drivers/pci/controller/pci-aardvark.c
> > @@ -1856,20 +1856,19 @@ static int advk_pcie_probe(struct platform_devi=
ce *pdev)
> >  		return ret;
> >  	}
> >  =

> > -	pcie->reset_gpio =3D devm_gpiod_get_from_of_node(dev, dev->of_node,
> > -						       "reset-gpios", 0,
> > -						       GPIOD_OUT_LOW,
> > -						       "pcie1-reset");
> > +	pcie->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_=
LOW);
> >  	ret =3D PTR_ERR_OR_ZERO(pcie->reset_gpio);
> >  	if (ret) {
> > -		if (ret =3D=3D -ENOENT) {
> > -			pcie->reset_gpio =3D NULL;
> > -		} else {
> > -			if (ret !=3D -EPROBE_DEFER)
> > -				dev_err(dev, "Failed to get reset-gpio: %i\n",
> > -					ret);
> > -			return ret;
> > -		}
> > +		if (ret !=3D -EPROBE_DEFER)
> > +			dev_err(dev, "Failed to get reset-gpio: %i\n",
> > +				ret);
> > +		return ret;
> > +	}
> > +
> > +	ret =3D gpiod_set_consumer_name(pcie->reset_gpio, "pcie1-reset");
> > +	if (ret) {
> > +		dev_err(dev, "Failed to set reset gpio name: %d\n", ret);
> > +		return ret;
> >  	}
> >  =

> >  	ret =3D of_pci_get_max_link_speed(dev->of_node);
> > =

> > -- =

> > b4 0.10.0-dev-fc921

Thanks.

-- =

Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
