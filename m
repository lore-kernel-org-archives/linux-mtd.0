Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A6FC2BD09
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2024 08:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kD22kDxhf7s/K9eaJJ4967rWNIgL9ygMX9id5qxoH7Y=; b=hODuJQ4n5subig
	sp7nBMfBLXH9eIoTahNJtXSUX6KXxNcnHGG+Zu3jFHV0W4s7QQajgTI23V9xc4k90dug9ZmV7lmRl
	3QthlmoXtoUrXuj52jDJn5zxUzntvedm9eZS4Zuu0e+4I/mqp2jriaHIKm+JYRO45eQi/kLNjbWGR
	XonZPV73M9zWC0KC9/d54WrTVUkwoy3Ks4WbI7BtkAmjpdhaN5dbsSO1Q3IjyZEI8COwcmpOprj/M
	kXzj2ErGmT0LONf9xnCrEviXf0UU7+32K/Zz8RnoWXlFYVh0qgq+rZHAw5WVZMXyPNGD5Vn3j6o0i
	sdzhQQYqOC5GwLPtyVeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMkWE-00000009kqt-2ioy;
	Thu, 27 Jun 2024 08:30:14 +0000
Received: from forward501a.mail.yandex.net ([178.154.239.81])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMkW3-00000009koL-41C9;
	Thu, 27 Jun 2024 08:30:10 +0000
Received: from mail-nwsmtp-smtp-production-main-54.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-54.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1f:6289:0:640:5fc6:0])
	by forward501a.mail.yandex.net (Yandex) with ESMTPS id 62E6D62860;
	Thu, 27 Jun 2024 11:29:53 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-54.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id hTMqF50OgeA0-419Dn7dc;
	Thu, 27 Jun 2024 11:29:51 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
	t=1719476991; bh=sncecviZ4oVzyaqVg6LU/TKkhzMCJcCvnENYdLedhDQ=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=fYt77sepJb6Dz5nNn3wvLM2BcROhwWdG7wRisBkqtF3/hXtLy8lIDdb5a9wki+xgj
	 m+gfMLnWml2khZDKWnsANuhxBC4XcH3KBbc8wli7qPcKfOBKMiiokOznOQZASnsShb
	 uhxbpxZgH1kBKx/Vy2qTDCDcjYAISNAwQklonyaU=
Authentication-Results: mail-nwsmtp-smtp-production-main-54.vla.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
Message-ID: <241a4cf9830b0118f01e8fcf2853c62527636049.camel@maquefel.me>
Subject: Re: [PATCH v10 00/38] ep93xx device tree conversion
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>,  Stephen Boyd <sboyd@kernel.org>
Cc: Hartley Sweeten <hsweeten@visionengravers.com>, Alexander Sverdlin
 <alexander.sverdlin@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Lukasz Majewski <lukma@denx.de>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Thierry Reding <thierry.reding@gmail.com>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Mark
 Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Damien Le Moal <dlemoal@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Ralf Baechle <ralf@linux-mips.org>,  "Wu, Aaron"
 <Aaron.Wu@analog.com>, Lee Jones <lee@kernel.org>, Olof Johansson
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
 <andriy.shevchenko@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Vinod
 Koul <vkoul@kernel.org>
Date: Thu, 27 Jun 2024 11:29:44 +0300
In-Reply-To: <48c242838c77034485a9e667dc0e867207c5beed.camel@maquefel.me>
References: <20240617-ep93xx-v10-0-662e640ed811@maquefel.me>
	 <CAHp75VfSC9gAD9ipeWRPdQOxUp4FXqYYei-cJTs38nbz0cHpkg@mail.gmail.com>
	 <48c242838c77034485a9e667dc0e867207c5beed.camel@maquefel.me>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_013004_711692_F1E75FEF 
X-CRM114-Status: GOOD (  22.10  )
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

T24gVHVlLCAyMDI0LTA2LTE4IGF0IDE5OjIwICswMzAwLCBOaWtpdGEgU2h1YmluIHdyb3RlOgo+
IEhlbGxvIEFuZHkhCj4gT24gTW9uLCAyMDI0LTA2LTE3IGF0IDEyOjU4ICswMjAwLCBBbmR5IFNo
ZXZjaGVua28gd3JvdGU6Cj4gPiBPbiBNb24sIEp1biAxNywgMjAyNCBhdCAxMTozOOKAr0FNIE5p
a2l0YSBTaHViaW4gdmlhIEI0IFJlbGF5Cj4gPiA8ZGV2bnVsbCtuaWtpdGEuc2h1YmluLm1hcXVl
ZmVsLm1lQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiAKPiA+ID4gVGhlIGdvYWwgaXMgdG8gcmVj
aWV2ZSBBQ0tzIGZvciBhbGwgcGF0Y2hlcyBpbiBzZXJpZXMgdG8gbWVyZ2UgaXQKPiA+ID4gdmlh
IEFybmQgYnJhbmNoLgo+ID4gCj4gPiAncmVjZWl2ZScKPiA+IAo+ID4gPiBVbmZvcnR1bmF0ZWx5
LCBDTEsgc3Vic3lzdGVtIHN1ZGRlbmx5IHdlbnQgc2lsZW50IG9uIGNsayBwb3J0aW9uCj4gPiA+
IG9mCj4gPiA+IHNlcmllcyBWMiByZXJvbGwsCj4gPiA+IHRyaWVkIHRvIHBpbmcgdGhlbSBmb3Ig
YWJvdXQgYSBtb250aCBidXQgbm8gbHVjay4KPiA+ID4gCj4gPiA+IExpbms6Cj4gPiA+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDA0MDgtZXA5M3h4LWNsay12Mi0xLWFkY2Q2OGMxMzc1
M0BtYXF1ZWZlbC5tZQo+ID4gPiAKPiA+ID4gU29tZSBjaGFuZ2VzIHNpbmNlIGxhc3QgdmVyc2lv
biAodjkpIC0gc2VlICJDaGFuZ2VzIGluIHYxMCIsCj4gPiA+IG1vc3RseQo+ID4gPiBjb3NtZXRp
Yy4KPiA+IAo+ID4gLi4uCj4gPiAKPiA+ID4gUGF0Y2hlcyBzaG91bGQgYmUgZm9ybWF0ZWQgd2l0
aCAnLS1oaXN0b2dyYW0nCj4gPiAKPiA+ICdmb3JtYXR0ZWQnCj4gPiAKPiA+IC4uLgo+ID4gCj4g
PiA+IENoYW5nZXMgaW4gdjEwOgo+ID4gPiAKPiA+ID4gUmVvcmRlcmVkIFNvQiB0YWdzIHRvIG1h
a2Ugc3VyZSB0aGV5IGFwcGVhciBiZWZvcmUgUmIgYW5kIEFja2VkCj4gPiA+IHRhZ3MuCj4gPiAK
PiA+IFRoaXMgaXMgbm90IHJlcXVpcmVkLiBUaGUgaW1wb3J0YW5jZSBpcyBvbmx5IHRoZSBvcmRl
ciBvZiBTb0JzCj4gPiB0aGVtc2VsdmVzLiBJZiB0aGV5IGFyZSBpbnRlcmxlYXZlZCB3aXRoIG90
aGVyIHRhZ3MsIGl0J3MgZmluZS4KPiAKPiBBaCAtIG9rLiBKdXN0IHNhdyBzb21lb25lIHdhcyBj
b21wbGFpbmluZyBhYm91dCBiNCByZW9yZGVyaW5nIHRoZW0uIAo+IAo+ID4gCj4gPiAuLi4KPiA+
IAo+ID4gCj4gPiBIb3BlZnVsbHkgdG8gc2VlIHRoaXMgc2VyaWVzIGJlaW5nIGV2ZW50dWFsbHkg
YXBwbGllZCBzb29uLgo+ID4gQXJuZD8gKERvIHdlIGhhdmUgYWxsIG5lY2Vzc2FyeSBzdWJzeXN0
ZW0gbWFpbnRhaW5lcnMnIHRhZ3MsIGJ0dz8pCj4gPiAKPiA+IAo+IAo+IEFzIGkgc2VlIGZyb20g
bXkgcGVyc3BlY3RpdmUgb25seSB0aHJlZSBsZWZ0Ogo+IAo+IENsayBzdWJzeXN0ZW06Cj4gCj4g
LSBjbGs6IGVwOTN4eDogYWRkIERUIHN1cHBvcnQgZm9yIENpcnJ1cyBFUDkzeHgKPiAKPiBETUEg
c3Vic3lzdGVtIChidXQgdGhlIG9ubHkgcmVxdWVzdCBmcm9tIFZpbm9kLCBhcyBmYXIgYXMgaSBy
ZW1lbWJlciwKPiB3YXMgZml4aW5nIGNvbW1pdHMgdGl0bGVzKToKPiAKPiAtIGRtYWVuZ2luZTog
Y2lycnVzOiBDb252ZXJ0IHRvIERUIGZvciBDaXJydXMgRVA5M3h4Cj4gLSBkbWFlbmdpbmU6IGNp
cnJ1czogcmVtb3ZlIHBsYXRmb3JtIGNvZGUKPiAKPiBCZXNpZGUgdGhhdCB0YWdzIG1pc3Npbmcg
b24gcGxhdGZvcm0gY29kZSByZW1vdmFsICh3aGljaCBjYW4gYmUgQWNrZWQKPiBieSBBcm5kIGhp
bXNlbGYgaSBiZWxpZXZlKSBhbmQgZHRzaS9kdHMgZmlsZXMgKHNhbWUgPykuCgpWaW5vZCBhY2tl
ZCB0aGUgYWJvdmUgdHdvIHBhdGNoZXM6CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvWm5r
SXA4Yk9jWkszeVZLUEBtYXRzeWEvCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9abmtJbXA4
QnRUZHhsN08zQG1hdHN5YS8KCnNvIG9ubHk6CgotIGNsazogZXA5M3h4OiBhZGQgRFQgc3VwcG9y
dCBmb3IgQ2lycnVzIEVQOTN4eAoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwNjE3
LWVwOTN4eC12MTAtMy02NjJlNjQwZWQ4MTFAbWFxdWVmZWwubWUvCgpsZWZ0LgoKSG9wZSBTdGVw
aGVuIHdpbGwgZmluZCBzb21lIHRpbWUgZm9yIHRoaXMgb25lLgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
