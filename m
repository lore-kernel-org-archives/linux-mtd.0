Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DA5C3DA6E
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Dec 2023 09:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0h4les26+mdoU7jM48VpuDGR7kZBydU+Pjh0MgEr7M8=; b=qMsX6b6y1ewfh7
	UQnMZjPK7VsfFwQSW76/5zdrb0BWv0LsjDofsP6D3JF/9GTc6qUm/FvK4A8RKl8HeBtWGjrQFRqBF
	k4FS5y5PRpzGsoKEf5Dc+SgstHctHOW727mLt1ibrgDLfjKveQzHwipAis93zEuWRbqqIQ+UVpI+c
	0fRMisjJJWfc83GOjkbn4P8uw32lF/fK+1M4XQpPmiLE5vsQUwYIasNuynHT+0kdG7iL2xmyJg/V5
	iPij9aC9Hhp58VC5QaVwa8Jlcx8U4saE67V6yFh0bJzLOBmf9pHZvh5NfxbWoDRmqpSPpus+t4E6d
	wf5l/HhJwZp4+cWAVO5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGy4M-007bSE-11;
	Sat, 23 Dec 2023 09:13:18 +0000
Received: from forward501b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d501])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGy4G-007bRR-2G;
	Sat, 23 Dec 2023 09:13:15 +0000
Received: from mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net [IPv6:2a02:6b8:c08:73a3:0:640:6804:0])
	by forward501b.mail.yandex.net (Yandex) with ESMTP id 488EE60FFE;
	Sat, 23 Dec 2023 12:13:02 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id tCMesXBc0Os0-V3hE6yzp;
	Sat, 23 Dec 2023 12:13:00 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
	t=1703322780; bh=wRrzZn5duH4w8JvE1tgyoLXGclY5mY0J/Xp8ep3wT7g=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=I+mEfOTd/HhVtsgLl8P4bJlmK+xe/BHC5G4qGEcK5yI9fE4yNAbvURJYd9ebsbNPL
	 ELVCWnXzpctwGO9/5E6Lh3j51mRZlNunB6U0Mz9Ob7UmkE2sFrGQRvIiTXfqFCBTJB
	 6hHC1txfBTVi+nHDb1JfUThgM9rSEbD1FlaR3i6c=
Authentication-Results: mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
Message-ID: <d6e898200b96e816ea8c8c9a847307088ec5821c.camel@maquefel.me>
Subject: Re: [PATCH v6 00/40] ep93xx device tree conversion
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Andy Shevchenko <andy@kernel.org>
Cc: Hartley Sweeten <hsweeten@visionengravers.com>, Alexander Sverdlin
 <alexander.sverdlin@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Lukasz Majewski <lukma@denx.de>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sebastian
 Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>,  Guenter Roeck <linux@roeck-us.net>, Thierry
 Reding <thierry.reding@gmail.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>, Mark Brown <broonie@kernel.org>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Damien Le Moal <dlemoal@kernel.org>, Sergey
 Shtylyov <s.shtylyov@omp.ru>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org,  dmaengine@vger.kernel.org,
 linux-watchdog@vger.kernel.org,  linux-pwm@vger.kernel.org,
 linux-spi@vger.kernel.org, netdev@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-sound@vger.kernel.org, Arnd Bergmann
 <arnd@arndb.de>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andrew Lunn
 <andrew@lunn.ch>
Date: Sat, 23 Dec 2023 12:12:56 +0300
In-Reply-To: <ZXnxBtqbneUMbvwq@smile.fi.intel.com>
References: <20231212-ep93xx-v6-0-c307b8ac9aa8@maquefel.me>
	 <ZXnxBtqbneUMbvwq@smile.fi.intel.com>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231223_011312_952107_0BD7541F 
X-CRM114-Status: GOOD (  16.91  )
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

SGVsbG8gQW5keSEKCk9uIFdlZCwgMjAyMy0xMi0xMyBhdCAxOTo1OSArMDIwMCwgQW5keSBTaGV2
Y2hlbmtvIHdyb3RlOgo+IE9uIFR1ZSwgRGVjIDEyLCAyMDIzIGF0IDExOjIwOjE3QU0gKzAzMDAs
IE5pa2l0YSBTaHViaW4gd3JvdGU6Cj4gPiBObyBtYWpvciBjaGFuZ2VzIHNpbmNlIGxhc3QgdmVy
c2lvbiBhbGwgY2hhbmdlcyBhcmUgY29tZXRpYy4KPiA+IAo+ID4gRm9sbG93aW5nIHBhdGNoZXMg
cmVxdWlyZSBhdHRlbnRpb24gZnJvbSBTdGVwaGVuIEJveWQsIGFzIHRoZXkgd2VyZQo+ID4gY29u
dmVydGVkIHRvIGF1eF9kZXYgYXMgc3VnZ2VzdGVkOgo+ID4gCj4gPiAtIEFSTTogZXA5M3h4OiBh
ZGQgcmVnbWFwIGF1eF9kZXYKPiA+IC0gY2xrOiBlcDkzeHg6IGFkZCBEVCBzdXBwb3J0IGZvciBD
aXJydXMgRVA5M3h4Cj4gPiAKPiA+IERNQSByZWxhdGVkIHBhdGNoZXMgc3RpbGwgcmVxdWlyZSBB
Y2tlZCBvciBSZXZpZXdlZCB0YWdzLgo+ID4gCj4gPiBnb3QgYXBwcm92YWwgTEdUTSBmcm9tIE1p
cXVlbDoKPiA+IC0gbXRkOiByYXduYW5kOiBhZGQgc3VwcG9ydCBmb3IgdHM3Mnh4Cj4gPiBMaW5r
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjMxMDA0MTAzOTExLjJhYTY1MzU0QHhw
cy0xMy8KPiA+IAo+ID4gbmV3IHBhdGNoZXM6Cj4gPiAKPiA+IEFSTTogZXA5M3h4OsKgIEFkZCB0
ZXJtaW5hdG9yIHRvIGdwaW9kX2xvb2t1cF90YWJsZQo+ID4gwqAgLSBmaXhlZCB0ZXJtaW5hdG9y
IGluIGdwaW9kX2xvY2t1cF90YWJsZQo+ID4gCj4gPiBTbyBtb3N0bHkgYWxsIHBhdGNoZXMgZ290
IGFwcHJvdmFsLgo+ID4gCj4gPiBQYXRjaGVzIHNob3VsZCBiZSBub3cgZm9ybWF0ZWQgd2l0aCAn
LS1oaXN0b2dyYW0nCj4gCj4gSXQgX2ZlZWxzXyBsaWtlIHNvbWUgdGFncyBtaWdodCBiZSBtaXNz
aW5nLgo+IEluIGFueSBjYXNlIEkgc3VnZ2VzdCB0byB1c2UgYGI0YCB0b29sIHRvIHJldHJpZXZl
IHRhZ3Mgd2hlbgo+IHByZXBhcmluZwo+IHRoZSBuZXh0IHZlcnNpb246Cj4gCj4gwqDCoMKgwqDC
oMKgwqDCoGdpdCBjaGVja291dCAtYiB2WFggdjYuNy1yY1gKPiDCoMKgwqDCoMKgwqDCoMKgYjQg
YW0gLXNsdCAkTVNHX0lEX09GX3YoWFgtMSkKPiDCoMKgwqDCoMKgwqDCoMKgZ2l0IGFtIC4uLgo+
IMKgwqDCoMKgwqDCoMKgwqBnaXQgcmViYXNlIC0taW50ZXJhY3RpdmUgLi4uICMgdG8gYWRkcmVz
cyBjb21tZW50cwo+IAoKSSBtb3ZlZCB0byBiNCBhIGZldyBpdGVyYXRpb25zIGFnbzoKCmBgYApD
YWxjdWxhdGluZyBwYXRjaC1pZHMgZnJvbSBjb21taXRzLCB0aGlzIG1heSB0YWtlIGEgbW9tZW50
Li4uCkNoZWNraW5nIGNoYW5nZS1pZCAiMjAyMzA2MDUtZXA5M3h4LTAxYzc2MzE3ZTJkMiIKR3Jh
YmJpbmcgc2VhcmNoIHJlc3VsdHMgZnJvbSBsb3JlLmtlcm5lbC5vcmcKR3JhYmJpbmcgdGhyZWFk
IGZyb20gbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDQyNDEyMzUyMi4xODMwMi0xLQpuaWtpdGEu
c2h1YmluJTQwbWFxdWVmZWwubWUvdC5tYm94Lmd6Ci0tLQpOT1RFOiBzb21lIHRyYWlsZXJzIGln
bm9yZWQgZHVlIHRvIGZyb20vZW1haWwgbWlzbWF0Y2hlczoKICAgICEgVHJhaWxlcjogVGVzdGVk
LWJ5OiBNaWNoYWVsIFBldGVycyA8bXBldGVyc0BlbWJlZGRlZFRTLmNvbT4KICAgICBNc2cgRnJv
bTogS3JpcyBCYWhuc2VuIDxrcmlzQGVtYmVkZGVkVFMuY29tPgpOT1RFOiBSZXJ1biB3aXRoIC1T
IHRvIGFwcGx5IHRoZW0gYW55d2F5Ck5vIHRyYWlsZXIgdXBkYXRlcyBmb3VuZC4KYGBgCgpJIGhh
dmVuJ3QgZm91bmQgYW55IG1pc3NpbmcgdGFncywgdGhhdCBiNCBkaWRuJ3QgYXBwbHksIHRoZSBv
bmVzIGFib3ZlCnJlZmVyIHRvIGEgdmVyeSBvbGQgaXRlcmF0aW9uIGFuZCB3ZXJlIGdpdmVuIHRv
IGNvdmVyIGxldHRlciBhbmQgaQpkb24ndCBmZWVsIGxpa2UgdGhleSBuZWVkIHRvIGJlIGluY2x1
ZGVkLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
