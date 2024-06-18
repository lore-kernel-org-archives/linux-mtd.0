Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C58C2BA18
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jun 2024 16:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oqupq308MabgObvSxEHX2vpKOZYGYRZ920DNVL6LbkU=; b=ZXhQenIapL9AVu
	JLORg/WID3IQgQcChnvL/Nt9vshrq1rT3UIov8on4C2LYb6VeEdFc4COcopcqRMyCRoWUZ6yn1nQy
	B0a3Ub6fY7L1XUAdmfPi/fOGlJyIlSWuNUVs9uiNu0j6s5frCbBCO89C9dPHnTX9Y+eJwIxy0+rwc
	sHae3S0rw6kOQp4bafAuQkr5XDL7/Q766oWmDCU/XR9DxvCWzrlxIhy7I6lIZZfi6thY5RRNdbknM
	opwmMg/vvzKrua+IQ5qIB7Uvc5QE92BgSZOc00cHHY9de+JsvQeswUi8lyFXqOtTDTMf9RjgTZi65
	ZijFXLZ67HqPeDrkIkbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJbma-0000000FsF2-0UL5;
	Tue, 18 Jun 2024 16:34:08 +0000
Received: from forward501b.mail.yandex.net ([178.154.239.145])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJbmV-0000000FsDQ-35ZM;
	Tue, 18 Jun 2024 16:34:05 +0000
Received: from mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net [IPv6:2a02:6b8:c14:3483:0:640:1715:0])
	by forward501b.mail.yandex.net (Yandex) with ESMTPS id A79C76123C;
	Tue, 18 Jun 2024 19:33:57 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id nXLBadKCSCg0-WTnPBLbY;
	Tue, 18 Jun 2024 19:33:55 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
	t=1718728435; bh=9Ya0AF+I5kZB8f0I6QI7f8yC9CILQ3Sjw0vL1wBTNqU=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=Oni59GvdWxSFXVUm0FOyYIVzjEV0JRSU9Ip08bwMplFAtgBKjmuy5Yh1eldJeqi17
	 Pa6h6Z/eehgezUl2WVdUScufJqePeWWaxGT7OxfJGM46bfE7df2u7mV+2/KLa+XOrw
	 p+oLGi6VA8aTuPSROzXtOw+f362fnP6+ig6AeZ8c=
Authentication-Results: mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
Message-ID: <eb3e6c0b883f408fed68e725a23b54854701ce9e.camel@maquefel.me>
Subject: Re: [PATCH v10 00/38] ep93xx device tree conversion
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Jakub Kicinski <kuba@kernel.org>, Nikita Shubin via B4 Relay
	 <devnull+nikita.shubin.maquefel.me@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Hartley Sweeten
 <hsweeten@visionengravers.com>, Alexander Sverdlin
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
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
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
 linux-sound@vger.kernel.org, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Date: Tue, 18 Jun 2024 19:33:49 +0300
In-Reply-To: <20240618073339.499a7fd2@kernel.org>
References: <20240617-ep93xx-v10-0-662e640ed811@maquefel.me>
	 <20240618073339.499a7fd2@kernel.org>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_093403_973997_E24BC83C 
X-CRM114-Status: GOOD (  11.85  )
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

On Tue, 2024-06-18 at 07:33 -0700, Jakub Kicinski wrote:
> On Mon, 17 Jun 2024 12:36:34 +0300 Nikita Shubin via B4 Relay wrote:
> > The goal is to recieve ACKs for all patches in series to merge it
> > via Arnd branch.
> 
> Why? The usual process is for every subsystem to accept the relevant
> patches, and then they converge during the merge window.

It was decided from the very beginning of these series, mostly because
it's a full conversion of platform code to DT and it seemed not
convenient to maintain compatibility with both platform and DT.

Generally i think it's too late to ask such a question, when just a few
patches left.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
