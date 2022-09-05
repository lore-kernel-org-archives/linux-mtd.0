Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E3FECAAD3
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 20:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VvUHpltqle/P0SeTkmCJaa9qUBMClV002OilrAsyE+c=; b=p+W3zrxSo1hfTb
	AvE/qX1qSUb+LqW2fe2cNgT61kXTXLQu2YNYraVCOiQwo9Xc8+uHCPWVK6Uc3EAbHxs9iJDlzfaN2
	6VfWYqY56tyXXnkqkTkAuJjA3tBjD+Ll6u0djWMeBG8WZMxfsGXOLqBc78kn6PecbyNcDErzfiEEv
	ToUGaPEChW+LkPBwazzu/326IURxQ/52su4j/72Z6Lqi1+fSU30iQXBZafDMQ3mJMJvsfGP4oggO0
	n6kNqQTe1G0J+tKN8imVlZXi2elBni3PTFNwMv7ERxX2Zok3vJeJF0rP5OdTZ8DDbMGn1Lf94RlTq
	3o0Z0JUJcqy2n0b0ecbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVILK-009uUW-AY; Mon, 05 Sep 2022 20:05:14 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVHud-009S17-1G; Mon, 05 Sep 2022 19:37:41 +0000
Received: by mail-pj1-x1035.google.com with SMTP id m10-20020a17090a730a00b001fa986fd8eeso12974555pjk.0;
        Mon, 05 Sep 2022 12:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=UX/1xWsBuUZKNpnGbmaCNyLgDKXUyHyjW7LSvfviiGM=;
        b=Jq6z0TjBOs+Trb+l/l0E6v2zXWY5HGZUjeUfFoj6h1dgSSPD3CMOMJzKW/FgRblSih
         9XKG/JuD76vNnuQGH4IReEwETm+svg5j/jghxR4WWjXAxOGp9pztBXjFtpMn9fKYvJDF
         mXDcmytCgAWXvi4BSG5pj9Y0FI8rlxUZq6PAQAUnNGkrMF0VrQAsHOOkpAHrZbr3nOJS
         i68fopwEQC0oJscyLwdmpyB8JB1DvXhZEhs94bZIP7npUYVRKyMbaEZFnY/EWTOyJFcw
         6eno1/ywfeqqOcLh7eCoxWyTJI1hItySN2zX1dRx/cdYZr0XNXm5Jc2yy3MvF+522GeF
         f4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=UX/1xWsBuUZKNpnGbmaCNyLgDKXUyHyjW7LSvfviiGM=;
        b=tBrpB4Vq8P2oyYq/QaormgqNYylx9jOC5kDHxJwhqFy9yjt5Wci0VZqDi1EsUQtnw4
         T0np2ZTZJVrNHMCdFCqhpzsKtPDckiH5j4/7LcUnnTanqCWJ4lygtaS5hT9ZoDFFUlqq
         t/WWnrnMIHJ2cRTqMABUEn2RCk+ktsURuA+9Mm4YDS1M8FuEBN9gHFu7hsbX9UptKhmz
         PWJZQup7w0l3n5p3PQI6vyqCsDoeYPy52gXZVp7L5F3xzf6vkDb3G8417tWlOzXz90QV
         9JbGs8Zd1MOPjREMUJFaNxoKa7TgSgQfESohp8eEY8YRcSRA0bbeZDupVTEjOuArXQ6J
         dBVg==
X-Gm-Message-State: ACgBeo0Z7rw4WMkg14HwM8flnpJYP/UYm5N6MVhPCWZ3TnMJI093tkPm
	3VVpP6WpBESZQrlmlBRKbvk=
X-Google-Smtp-Source: AA6agR70u6IDqbN3XobJcWbGlwEoBHj5+DIO4sKvf09Hb5lknd4pdCEXQAQd60uZG48UmUAgfPRBLA==
X-Received: by 2002:a17:902:edd5:b0:174:a6e6:51f4 with SMTP id q21-20020a170902edd500b00174a6e651f4mr40804784plk.82.1662406657709;
        Mon, 05 Sep 2022 12:37:37 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:7332:f188:2984:5930])
        by smtp.gmail.com with ESMTPSA id u1-20020a170902e5c100b00176b5035045sm2216157plf.202.2022.09.05.12.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 12:37:37 -0700 (PDT)
Date: Mon, 5 Sep 2022 12:37:33 -0700
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
Subject: Re: [PATCH v1 02/11] drm/tegra: switch to using devm_fwnode_gpiod_get
Message-ID: <YxZP/exeVD7DQ5Hx@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-2-b29adfb27a6c@gmail.com>
 <CAHp75Vc4yfh0JcY0B-vNawHTay5QNuhd7GAm86QZZZvUnQaMzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75Vc4yfh0JcY0B-vNawHTay5QNuhd7GAm86QZZZvUnQaMzQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_123739_318172_652AA2E1 
X-CRM114-Status: GOOD (  19.34  )
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

On Mon, Sep 05, 2022 at 01:57:01PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > I would like to limit (or maybe even remove) use of
> > [devm_]gpiod_get_from_of_node in drivers so that gpiolib can be cleaned
> > a bit, so let's switch to the generic device property API.
> 
> > It may even
> > help with handling secondary fwnodes when gpiolib is taught to handle
> > gpios described by swnodes.
> 
> I would remove this sentence from all commit messages since it's a
> debatable thing and might even not happen, so the above is a pure
> speculation.

I have the patches. Granted, I had them since '19 ;) but I'm rebasing
them and going to push them. I need them to convert bunch of input
drivers away from platform data.

Thanks.

-- 
Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
