Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3801FC4707B
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jan 2024 09:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2HdvDbLjZNIy4HNt/6VN+eFO4ADqxu4e7/f+6tV9QIU=; b=z1SlR0ZyARC9Me
	39GIo5W+MQ0rfvnGNxJly6ECO1IIsxsKeNYgLNbjsbFN+/9+leQ46/ORKsIXqQmzROFwn6/ong/Q9
	EXjmLpqQ44HylMj9lLF5I7MOLTvWZfeWkqpJwb2xP2WyMpvhmEKuFm+dPVuMZj1zGjRgMpF/EPDIQ
	DW2g8BFjuSKxbokVnQNT9ZBBmetjohUvJHFoBBHdmMOdWbc/ig1QkWxaPNkMq3Ym0KjdC5GNOhNpC
	caCLKNehaeGLrUTZbx2EO+dPfmtPlr6B+OcnSP4JXjArFgcsWPER+NBP/FMLy3f5PoKwVHLmLMNP9
	T4Erp/x6qoKC/fKnKIpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQOpY-002IsL-0y;
	Thu, 18 Jan 2024 09:37:00 +0000
Received: from forward500a.mail.yandex.net ([2a02:6b8:c0e:500:1:45:d181:d500])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQOpQ-002IrH-2v;
	Thu, 18 Jan 2024 09:36:57 +0000
Received: from mail-nwsmtp-smtp-production-main-18.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-18.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1d:5fd0:0:640:c018:0])
	by forward500a.mail.yandex.net (Yandex) with ESMTP id A8B01616FD;
	Thu, 18 Jan 2024 12:36:44 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-18.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id baJWEC7aoCg0-7skv82tT;
	Thu, 18 Jan 2024 12:36:42 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
	t=1705570602; bh=eOYgq6vBGLmYMc8CNKKKb0RzNhlbCa5ML+43wchdMZA=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=Es19nIjpoisIBb6MjPgosN8BBLwA3g37Sg+8/RzikHK2iJGA8I33MTMMnsCeSd95a
	 FcvuQE7PCMCd9C0Lf3UXj5lju7/29hXhNB61xQrIV3xj6jS+j2ttUffxBAet9gIIDQ
	 eap9ausw2GyVdWnpZfdMCuPomyP6WRpJQi/KCiZk=
Authentication-Results: mail-nwsmtp-smtp-production-main-18.vla.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
Message-ID: <3659cd8be443f632f44f9ad31a214a82f995ed75.camel@maquefel.me>
Subject: Re: [PATCH v7 00/39] ep93xx device tree conversion
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
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
 <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Damien Le Moal <dlemoal@kernel.org>,  Sergey
 Shtylyov <s.shtylyov@omp.ru>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Ralf Baechle <ralf@linux-mips.org>, "Wu,
 Aaron" <Aaron.Wu@analog.com>, Lee Jones <lee@kernel.org>, Olof Johansson
 <olof@lixom.net>,  Niklas Cassel <cassel@kernel.org>,
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
 <andriy.shevchenko@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andy
 Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 18 Jan 2024 12:36:38 +0300
In-Reply-To: <a54csycouodnmj6qarfel7cvgupaerl7uhrruixuy7uaekqgzw@2whufrjqunme>
References: <20240118-ep93xx-v7-0-d953846ae771@maquefel.me>
	 <a54csycouodnmj6qarfel7cvgupaerl7uhrruixuy7uaekqgzw@2whufrjqunme>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_013654_056417_9BD18624 
X-CRM114-Status: GOOD (  10.67  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpPbiBUaHUsIDIwMjQtMDEtMTggYXQgMTA6MzAgKzAxMDAsIFV3ZSBLbGVpbmUtS8O2
bmlnIHdyb3RlOgo+IEhlbGxvLAo+IAo+IE9uIFRodSwgSmFuIDE4LCAyMDI0IGF0IDExOjIwOjQz
QU0gKzAzMDAsIE5pa2l0YSBTaHViaW4gdmlhIEI0IFJlbGF5Cj4gd3JvdGU6Cj4gPiBObyBtYWpv
ciBjaGFuZ2VzIHNpbmNlIGxhc3QgdmVyc2lvbiAodjYpIGFsbCBjaGFuZ2VzIGFyZSBjb21ldGlj
Lgo+IAo+IE5ldmVyIHNhdyBjaGFuZ2VzIGRlc2NyaWJlZCBhcyAiY29tZXRpYyIuIEkgZ3Vlc3Mg
dGhhdCBtZWFucyAiZmFzdCIKPiBhbmQKPiAiaGlnaCBpbXBhY3QiPwoKIkNvc21ldGljIiBvZiBj
b3Vyc2UuCgpXZWxsIGkgZ3Vlc3MgaXQncyBuaWNlIHRoYXQgaSBoYWRuJ3QgbWlzc3BlbGxlZCBp
dCBsaWtlICJjb21lZGljIi4uLgoKPiAKPiBTQ05SCj4gVXdlCj4gCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
