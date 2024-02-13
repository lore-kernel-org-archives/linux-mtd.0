Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D3FC4829A
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Feb 2024 09:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BfRTeUOBPuAYDc0vN0AaIAyoo3+n05b1HIQBglV8lzE=; b=rhRx2JlcMvpNT9
	IRYrkhiObhXgVqx6jRVCNu5+HkCYGKZYWw9n7FY2EI6qj1l9bpktBSfOdMrzhaBKCUNpg3VDt9e4l
	ASUwECwtSGypbox6OjfUTsJXMmlXUqqhsZypYMj2xyRScqzeJv6LCwHtykxYzUqOkkf5wlz93/kVX
	Yq2Jov6flBtosHUYWrlmet+8wOl3sA6S7TGFdAOfmW5xV9tGizBKnMXtLHSJepGZ4qfJdbV/RYJkW
	6s0FoL/vuevw9Dpj6Qd+8J+j1MEOEgk77SCG84C8F4I6I+0a4nRFZlqjxF99JxHwhaTtu7Ld6DaJS
	fXM5LYUdvqHzZLQWbRjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZpOy-00000008fxZ-2Opt;
	Tue, 13 Feb 2024 09:48:32 +0000
Received: from forward500b.mail.yandex.net ([178.154.239.144])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZpOs-00000008fsS-0hbZ;
	Tue, 13 Feb 2024 09:48:29 +0000
Received: from mail-nwsmtp-smtp-production-main-91.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-91.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:3019:0:640:a0d4:0])
	by forward500b.mail.yandex.net (Yandex) with ESMTPS id 9CCD561154;
	Tue, 13 Feb 2024 12:48:16 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-91.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id Amja449YvOs0-Ohe7AJJt;
	Tue, 13 Feb 2024 12:48:14 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
	t=1707817694; bh=BNSX9WQo4fdZixPgrChnndimSE1LeUip7SbHQG3EiRk=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=tHSpq6lLbJRzMUl5S+AQdH+yFWqgLs5dAvYesqMe255xcZfmaDSgVPRqcA1r0bzrw
	 TkfIPDSLR62NkdUlPI+s/lCQcEhokM08txNkwukmx6USimZGbDh66EHaLNxEHxEu27
	 3BeQU0snEq2nQPzdmEknsfQ0A1hkYVGjcAylct3Y=
Authentication-Results: mail-nwsmtp-smtp-production-main-91.myt.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
Message-ID: <84444657b86c7a25ea2e6031ea85978917f33342.camel@maquefel.me>
Subject: Re: [PATCH v7 00/39] ep93xx device tree conversion
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: andy.shevchenko@gmail.com, Vinod Koul <vkoul@kernel.org>, Stephen Boyd
	 <sboyd@kernel.org>
Cc: Hartley Sweeten <hsweeten@visionengravers.com>, Alexander Sverdlin
 <alexander.sverdlin@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Lukasz Majewski <lukma@denx.de>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Thierry Reding
 <thierry.reding@gmail.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>, Mark Brown <broonie@kernel.org>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Damien Le Moal <dlemoal@kernel.org>, Sergey
 Shtylyov <s.shtylyov@omp.ru>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Ralf Baechle <ralf@linux-mips.org>,  "Wu,
 Aaron" <Aaron.Wu@analog.com>, Lee Jones <lee@kernel.org>, Olof Johansson
 <olof@lixom.net>, Niklas Cassel <cassel@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org,  devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org,  linux-watchdog@vger.kernel.org,
 linux-pwm@vger.kernel.org,  linux-spi@vger.kernel.org,
 netdev@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-ide@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-sound@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>
Date: Tue, 13 Feb 2024 12:48:11 +0300
In-Reply-To: <Zb_DfISgoNyTKWMp@surfacebook.localdomain>
References: <20240118-ep93xx-v7-0-d953846ae771@maquefel.me>
	 <Zb_DfISgoNyTKWMp@surfacebook.localdomain>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_014826_458951_CB77E048 
X-CRM114-Status: GOOD (  16.93  )
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

On Sun, 2024-02-04 at 19:03 +0200, andy.shevchenko@gmail.com wrote:
> Thu, Jan 18, 2024 at 11:20:43AM +0300, Nikita Shubin kirjoitti:
> > The goal is to recieve ACKs for all patches in series to merge it
> > via Arnd branch.
> > 
> > No major changes since last version (v6) all changes are cometic.
> > 
> > Following patches require attention from Stephen Boyd, as they were
> > converted to aux_dev as suggested:
> > 
> > - ARM: ep93xx: add regmap aux_dev
> > - clk: ep93xx: add DT support for Cirrus EP93xx
> > 
> > Following patches require attention from Vinod Koul:
> > 
> > - dma: cirrus: Convert to DT for Cirrus EP93xx
> > - dma: cirrus: remove platform code
> > 
> > Following patches are dropped:
> > - dt-bindings: wdt: Add ts72xx (pulled requested by Wim Van
> > Sebroeck)
> > 
> > Big Thanks to Andy Shevchenko once again.
> 
> You're welcome!
> 

Thank you Andy!

> I have a few minor comments, I believe if you send a new version it
> will be
> final (at least from my p.o.v.).
> 

Still waiting for some comment from Stephen Boyd and Vinod Koul on:

- ARM: ep93xx: add regmap aux_dev
- clk: ep93xx: add DT support for Cirrus EP93xx

- dma: cirrus: Convert to DT for Cirrus EP93xx
- dma: cirrus: remove platform code






______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
