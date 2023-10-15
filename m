Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0247DCDB47E
	for <linux-mtd@archiver.kernel.org>; Sun, 15 Oct 2023 21:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=upl+d9aLfemIC04U3PFsbKx7wWlclGgoHGaaO8Fhopk=; b=w4Jsdp1JBsB5t1
	itjgiolx6y6mBru1klY4cS/4eMh+FBu+7mzcwyHFxLjvAWmrvCs8bCa9Tdtb73BiKE2rvN8MdMU5I
	+f9mi0FcwqI/i+OwF67DOcHvwCx18aNDtGMD16uH8hhupVClmq7CJsE1FvT3ejoqz1wHOZwfh17Wo
	L9wtubro4zt+tones/pY+gqPJPzW+v3x2lwjg9lbRofUvdWEqA7CRX9DRyFYlzXxkapKCzRwSnSax
	D42BvVPQhdv/P6aoExNLyYn5QMdl0ravK4bmRN2e9U6KZhIFFf75Jqu94dTfW44iPj+Bbx4VgBY35
	QoWtp9O3LZvdeQKsXX7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qs8VE-007ip2-2E;
	Sun, 15 Oct 2023 21:18:24 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qs8V7-007in5-0c;
	Sun, 15 Oct 2023 21:18:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 80B0EC0004;
	Sun, 15 Oct 2023 21:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697404689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QyLwk8RWeHwb+iTYV4j14/CAsO9UnmgTLhIoR7pcM84=;
	b=G5I8ztJvdFI8tTwSCy0AWY+6MRhNlKLte1yNV4fIGQl6O23J6Xdoh0CefROrNByOpZhwE7
	P/dmdthsO5WAs8rqcbBfrDUN9cugU7l4OxjWmfddhyL0LuZ/a6CfmZiXNmu06TC7W2khE9
	NDZu0i9NIxBjr696iBip4sRRM3d0VMBYV0oc5glex8E5b5g9pnVjfW5fIkCPQERxPzL1Jd
	mjqglreUfQeV1UDlGgRG/+b2MG2/c1Vo/UDOnu2p9/qVGfq8Q3Iz2g50VMtUD0J76grZyh
	DkuCxT22BotwyKZelbq33dd3q4OFLHJ92smEnKVwc5a4qUfDVLMQmLsddUpmAw==
Date: Sun, 15 Oct 2023 23:17:56 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Hartley Sweeten <hsweeten@visionengravers.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Lukasz Majewski <lukma@denx.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Mark Brown <broonie@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
	netdev@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
	linux-input@vger.kernel.org, alsa-devel@alsa-project.org,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: (subset) [PATCH v4 00/42] ep93xx device tree conversion
Message-ID: <169740466288.180093.13375010968334465004.b4-ty@bootlin.com>
References: <20230915-ep93xx-v4-0-a1d779dcec10@maquefel.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230915-ep93xx-v4-0-a1d779dcec10@maquefel.me>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231015_141817_549199_B15B8EC1 
X-CRM114-Status: GOOD (  13.84  )
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


On Fri, 15 Sep 2023 11:10:42 +0300, Nikita Shubin wrote:
> This series aims to convert ep93xx from platform to full device tree support.
> 
> The main goal is to receive ACK's to take it via Arnd's arm-soc branch.
> 
> Major changes:
> - drop newline at the end from each YAML files
> - rename dma and clk bindings headers to match first compatible
> - shrink SoC exported functions number to only 2
> - dropped some ep93xx_pata fixes from these series
> - dropped m48t86 stuff from these series
> 
> [...]

Applied, thanks!

[13/42] dt-bindings: rtc: Add Cirrus EP93xx
        commit: 207bddd97881913bcb8bef84737c0971e712fbee
[14/42] rtc: ep93xx: add DT support for Cirrus EP93xx
        commit: 1d70f9fe5f1c8fbd5d838223b8aec27c69a7e609

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
