Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B8EC4828F
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Feb 2024 17:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3/9oAGoQGDEEE71fkgdAmR+qOqXkJSKomajpYixCo8E=; b=FVX0dz+OgUQBvS
	r4xrQF3vKQD4nN5YD87/6cjOWI8hhEwa4guadLy4NTRCgH/qcpB7ZQ0k4xDtDNtJLCFX+qtA42IFi
	ubauJp4aA7q+1Cyxi4fVOtsaFfp/5aCS+Wq9efQR1LaOGe9Nk6bj9t04AShKFE1YDautKfFxJK4U4
	wtejpES7IyoGaHb3xnyMV1WSIfzlmuICELQiZp3+PsPyRROEPJGMZAy62pdXuarqfw0VlDPfBVp/V
	f/RhfMTVZNpxcwT+CLzSeYOQtcmBufYZWZo2x1I5h83T2ODQZOFuZ8Gl3AawMJwU8644IWKXyYumO
	X3T58YjqsaMurF9EacSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWfuZ-00000001C8q-2MBf;
	Sun, 04 Feb 2024 17:04:07 +0000
Received: from fgw20-7.mail.saunalahti.fi ([62.142.5.81])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWfuS-00000001C7Z-2zXg
	for linux-mtd@lists.infradead.org;
	Sun, 04 Feb 2024 17:04:02 +0000
Received: from localhost (88-113-26-30.elisa-laajakaista.fi [88.113.26.30])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 61aa5fc3-c37f-11ee-b3cf-005056bd6ce9;
	Sun, 04 Feb 2024 19:03:58 +0200 (EET)
From: andy.shevchenko@gmail.com
Date: Sun, 4 Feb 2024 19:03:56 +0200
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Hartley Sweeten <hsweeten@visionengravers.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Lukasz Majewski <lukma@denx.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Mark Brown <broonie@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Ralf Baechle <ralf@linux-mips.org>,
	"Wu, Aaron" <Aaron.Wu@analog.com>, Lee Jones <lee@kernel.org>,
	Olof Johansson <olof@lixom.net>, Niklas Cassel <cassel@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
	netdev@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-ide@vger.kernel.org, linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v7 00/39] ep93xx device tree conversion
Message-ID: <Zb_DfISgoNyTKWMp@surfacebook.localdomain>
References: <20240118-ep93xx-v7-0-d953846ae771@maquefel.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240118-ep93xx-v7-0-d953846ae771@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240204_090401_024470_C64B7056 
X-CRM114-Status: GOOD (  14.13  )
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

Thu, Jan 18, 2024 at 11:20:43AM +0300, Nikita Shubin kirjoitti:
> The goal is to recieve ACKs for all patches in series to merge it via Arnd branch.
> 
> No major changes since last version (v6) all changes are cometic.
> 
> Following patches require attention from Stephen Boyd, as they were converted to aux_dev as suggested:
> 
> - ARM: ep93xx: add regmap aux_dev
> - clk: ep93xx: add DT support for Cirrus EP93xx
> 
> Following patches require attention from Vinod Koul:
> 
> - dma: cirrus: Convert to DT for Cirrus EP93xx
> - dma: cirrus: remove platform code
> 
> Following patches are dropped:
> - dt-bindings: wdt: Add ts72xx (pulled requested by Wim Van Sebroeck)
> 
> Big Thanks to Andy Shevchenko once again.

You're welcome!

I have a few minor comments, I believe if you send a new version it will be
final (at least from my p.o.v.).

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
