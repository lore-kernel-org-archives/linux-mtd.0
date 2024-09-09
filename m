Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BD7ECE57B
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 09:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5N+3C2n7pjfDxPe6f0VlLi7TCf4v3qNtHDmMNrx58qY=; b=5AJGfPudTb9/SA
	lWW+p4WFChhQyaJ2acg9UDqtfVclZa5geaX03DbXF7+POtGxKyX8Fdmt+6G9poPp6ES8/z1YtNZpd
	Qf7UJ4TieRwSGlvP0Nx5KY1Xo5hE14Ru0os6U8oKQrVszszaiPtBd5bMKqHRc3qIi36/ygw+EpbuH
	VTOpyqemsmaqOsuStqtQfnBt/3HQV7t+FyhoFYvrlhoHyjt7eCRpkDncE8ANxnUhg2NMyTVu2PGld
	BZMY0Ee2bEtmh4Z99//jLDICJGSMulIvfUdrPv05sW0rX45a47J0HvKK9RU49uDblVg/28okHhPqN
	y7/TMezuQQh/0Hqia44w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snaIT-00000001Dle-0GET;
	Mon, 09 Sep 2024 09:02:57 +0000
Received: from forward501a.mail.yandex.net ([178.154.239.81])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snaIM-00000001Dki-45d8;
	Mon, 09 Sep 2024 09:02:54 +0000
Received: from mail-nwsmtp-smtp-production-main-49.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-49.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1f:5e9c:0:640:b3f4:0])
	by forward501a.mail.yandex.net (Yandex) with ESMTPS id 36D27613B6;
	Mon,  9 Sep 2024 12:02:44 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-49.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id a2dHS5JKaSw0-Uuowlycf;
	Mon, 09 Sep 2024 12:02:42 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
	t=1725872562; bh=Qut1EyCSXF5XKk8lrf1jldw5ylJErkj1/nQaI3URoaw=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=UCKyBw0t6OLNpveKLHRyVdH4SZAFS1aM3i5JVQ8KQ5rIHiHlKcQKgkqrfFC6c8Kek
	 R9zZ3ZAROjskp9kB0OrvKFjT8aa1lyzn42GuLR0RT8850GDMyebxN0ZKhcvu8dixES
	 a/SqIJj456K3YYiyyxC8j7ouVj9XUUEG0040u5qg=
Authentication-Results: mail-nwsmtp-smtp-production-main-49.vla.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
Message-ID: <0e3902c9a42b05b0227e767b227624c6fe8fd2bb.camel@maquefel.me>
Subject: Re: [PATCH v12 00/38] ep93xx device tree conversion
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
 linux-sound@vger.kernel.org, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>
Date: Mon, 09 Sep 2024 12:02:37 +0300
In-Reply-To: <CAHp75Veusv=f6Xf9-gL3ctoO5Njn7wiWMw-aMN45KbZ=YB=mQw@mail.gmail.com>
References: <20240909-ep93xx-v12-0-e86ab2423d4b@maquefel.me>
	 <CAHp75Veusv=f6Xf9-gL3ctoO5Njn7wiWMw-aMN45KbZ=YB=mQw@mail.gmail.com>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_020251_844228_91DCE204 
X-CRM114-Status: GOOD (  17.87  )
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

SGkgQW5keSEKCk9uIE1vbiwgMjAyNC0wOS0wOSBhdCAxMTo0OSArMDMwMCwgQW5keSBTaGV2Y2hl
bmtvIHdyb3RlOgo+IE9uIE1vbiwgU2VwIDksIDIwMjQgYXQgMTE6MTLigK9BTSBOaWtpdGEgU2h1
YmluIHZpYSBCNCBSZWxheQo+IDxkZXZudWxsK25pa2l0YS5zaHViaW4ubWFxdWVmZWwubWVAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4gPiAKPiA+IFRoZSBnb2FsIGlzIHRvIHJlY2lldmUgQUNLcyBmb3Ig
YWxsIHBhdGNoZXMgaW4gc2VyaWVzIHRvIG1lcmdlIGl0Cj4gPiB2aWEgQXJuZCBicmFuY2guCj4g
PiAKPiA+IEl0IHdhcyBkZWNpZGVkIGZyb20gdGhlIHZlcnkgYmVnaW5uaW5nIG9mIHRoZXNlIHNl
cmllcywgbW9zdGx5Cj4gPiBiZWNhdXNlCj4gPiBpdCdzIGEgZnVsbCBjb252ZXJzaW9uIG9mIHBs
YXRmb3JtIGNvZGUgdG8gRFQgYW5kIGl0IHNlZW1lZCBub3QKPiA+IGNvbnZlbmllbnQgdG8gbWFp
bnRhaW4gY29tcGF0aWJpbGl0eSB3aXRoIGJvdGggcGxhdGZvcm0gYW5kIERULgo+ID4gCj4gPiBG
b2xsb3dpbmcgcGF0Y2hlcyByZXF1aXJlIGF0dGVudGlvbiBmcm9tIFN0ZXBoZW4gQm95ZCBvciBj
bGsKPiA+IHN1YnN5c3RlbToKPiAKPiBEb2VzIGl0IG1lYW4geW91IHN0aWxsIGhhdmUgYSBmZXcg
cGF0Y2hlcyB3aXRob3V0IHRhZ3M/Cj4gV2hhdCBhcmUgdGhlaXIgcmVzcGVjdGl2ZSBudW1iZXJz
PwoKVGhlIGNsayBpcyB0aGUgbGFzdCBvbmUgYXMgaSB0aGluaywgYWxsIG90aGVycyBjYW4gYmUg
QUNLZWQgYnkKQWxleGFuZGVyIG9yIGJ5IEFybmQgaGltc2VsZi4KCj4gCj4gPiAtIGNsazogZXA5
M3h4OiBhZGQgRFQgc3VwcG9ydCBmb3IgQ2lycnVzIEVQOTN4eDoKPiA+IMKgIC0gdHJpc3RhdGUK
PiA+IMKgIC0gZHJvcCBNRkRfU1lTQ09OL1JFR01BUAo+ID4gwqAgLSBhZGQgQVVYSUxJQVJZX0JV
Uy9SRUdNQVBfTU1JTwo+ID4gwqAgLSBwcmVmaXhlZCBhbGwgc3RhdGljIHdpdGggZXA5eHhfCj4g
PiDCoCAtIHMvY2xrX2h3X3JlZ2lzdGVyX2RkaXYoKS9lcDkzeHhfY2xrX3JlZ2lzdGVyX2RkaXYo
KS8KPiA+IMKgIC0gcy9jbGtfcmVnaXN0ZXJfZGl2KCkvZXA5M3h4X2Nsa19yZWdpc3Rlcl9kaXYo
KS8KPiA+IMKgIC0gZHJvcHBlZCBkZXZtX2VwOTN4eF9jbGtfaHdfcmVnaXN0ZXJfZml4ZWRfcmF0
ZV9wYXJlbnRfZGF0YQo+ID4gbWFjcm8KPiA+IMKgIC0KPiA+IHMvZGV2bV9lcDkzeHhfY2xrX2h3
X3JlZ2lzdGVyX2ZpeGVkX3JhdGVfcGFyZW50X2RhdGEoKS9kZXZtX2Nsa19od18KPiA+IHJlZ2lz
dGVyX2ZpeGVkX3JhdGVfcGFyZW50X2RhdGEoKS8KPiAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
