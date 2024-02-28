Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9038C54E41
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Feb 2024 08:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hSb49gb39KNEbolwd4Yk+QCf2CFZD2g2FdQ7AnRw9lU=; b=bbi+2Q8ZDVSNAx
	XUAUHZ4QXdgsCRM3DjDW3Q3mBR21YIuEXYqq+8TCIeGuEbnVmVoQbwJUaOLWfXZDrPj32rZYT01k2
	KzJPoWHmRn5RjnG7NV9iEqnx1Mun2kuWlNxZyC4LCrwnVcx35gu/Vn2Yqyd7SbAmq3ix41kWP2ws1
	Vy9BGNlcJva2gU3UV6XA25fvEvtL60lbYIz8ksGdTq5EUdgIKnW2LVyLZggjKuwI7bzHNQ73Zr0UT
	ysc1QtGeqjiK4mZI9FZvQouawEb2RYdLS9XbXZGkgZa/A4z92SZTK1W7YgEZLtLO7CgC0Nyq0zOUo
	LJf37hi7Um34lfnrjpkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfFDs-00000008SYJ-08i1;
	Wed, 28 Feb 2024 08:23:28 +0000
Received: from forward501a.mail.yandex.net ([178.154.239.81])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfFDk-00000008ST5-3qPD;
	Wed, 28 Feb 2024 08:23:24 +0000
Received: from mail-nwsmtp-smtp-production-main-18.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-18.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:8c9b:0:640:8c33:0])
	by forward501a.mail.yandex.net (Yandex) with ESMTPS id 7184B61680;
	Wed, 28 Feb 2024 11:23:10 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-18.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 2NUOVYANd8c0-nNSnKwOK;
	Wed, 28 Feb 2024 11:23:08 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
	t=1709108588; bh=5C6vD/fRuXGe615n6PpX9VIOEIZkOgWqNNFadbqmy4M=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=EalO3ZTMGKQby2mNKqzwTBWhRSR2vOdtx+YGi+0dATxHc9Ne404mREzk3ONsmowJQ
	 Sbt6ELQEiXojAyllpQkuQc6yuKN4UbpwNHkcrWbSfpHM6co896dWu7EcWBkPxvOZZi
	 FlkHZDOUFmF5J3w7ul6ZRoH0jf1AGJ+fqIZrkwaY=
Authentication-Results: mail-nwsmtp-smtp-production-main-18.iva.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
Message-ID: <154df7fd17dd05fdb6ba21d5f4d84ecfdb476091.camel@maquefel.me>
Subject: Re: [PATCH v8 00/38] ep93xx device tree conversion
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Mark Brown <broonie@kernel.org>
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
 <u.kleine-koenig@pengutronix.de>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>,  Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Damien Le Moal <dlemoal@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Ralf Baechle <ralf@linux-mips.org>, "Wu, Aaron"
 <Aaron.Wu@analog.com>, Lee Jones <lee@kernel.org>, Olof Johansson
 <olof@lixom.net>,  Niklas Cassel <cassel@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org,  devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org,  linux-watchdog@vger.kernel.org,
 linux-pwm@vger.kernel.org,  linux-spi@vger.kernel.org,
 netdev@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-ide@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-sound@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andy
 Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 28 Feb 2024 11:23:02 +0300
In-Reply-To: <168fd3d7-d1e9-467e-bdd0-36c12aa81b68@sirena.org.uk>
References: <20240226-ep93xx-v8-0-3136dca7238f@maquefel.me>
	 <168fd3d7-d1e9-467e-bdd0-36c12aa81b68@sirena.org.uk>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_002321_977566_8DFE16FB 
X-CRM114-Status: GOOD (  12.07  )
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

Hello Mark!

On Mon, 2024-02-26 at 13:34 +0000, Mark Brown wrote:
> On Mon, Feb 26, 2024 at 10:29:56AM +0300, Nikita Shubin via B4 Relay
> wrote:
> 
> > The goal is to receive ACKs for all patches in series to merge it
> > via Arnd branch.
> 
> What are the actual dependencies here?

More than a half of patches makes device drivers incompatible with
"platform" approach, this is intentionally cause we don't want any
leftovers - ep93xx should be fully converted to dt or left as is.

Currently only 4 patches that require review/ack left:

- ARM: ep93xx: add regmap aux_dev
- clk: ep93xx: add DT support for Cirrus EP93xx
- dma: cirrus: Convert to DT for Cirrus EP93xx
- dma: cirrus: remove platform code

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
