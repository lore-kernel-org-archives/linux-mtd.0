Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07773C001B0
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jul 2023 07:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sAG0PnUe72areBQeejVc6FHzTrlN4WaL6dp9C5xItQ8=; b=wQ4vLmyjhw4zIc
	+M1+AyfrQ/blRtP718kTO9ObOm0f2hzDYtjLNT1P75kniZkMVTS3DGnmKNi6eOTHVqB0KYPmTxR/e
	YX8vHSxSSDEq2MMc4+xWCIdoo3NXuY44+RB9CuWicSTXJ9NC57NaPaA6NmDDUhvgIaxMiFyDbrdXO
	ng9vJJ2Cma0wM3nDGR4NiKp135EVH4fmBm+LCVmvANbRqk1foro9E+d0K3OvjEnRSC53sUfdZ253N
	muzWrENottHCWRH7eKWwOL5tE6dC8VkR5p9pSfMjvEF6HBYVoSX1uqee0v1hRDsDB7n73gZD0FcQz
	G+U8Vf5c8d0tcnzuLuaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNph8-0033u2-0g;
	Mon, 24 Jul 2023 07:09:26 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNph1-0033sF-2r;
	Mon, 24 Jul 2023 07:09:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C2E524000E;
	Mon, 24 Jul 2023 07:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690182552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0OTdgWQ6Vo/4tl1ZM7En0YdjITPLKGIP2IIxkkPFJRM=;
	b=iC5ZIY44VFrCSUNoeMIdYmOyqSrlrW7N4tyY+Hq53oXBVph3jCQ5ij8fsDynsYh6NybKfF
	47iBUwR964ggu52YB13yaU1E18wok2aDQAXdbpXfZnCVzqeybMcvNBEm04M8MJv49vz912
	60p20TKBhztddQMV6EZbSo0vTLzFb3Ok+FWErn92iDiDFjDyPmqRh1JKdYw5xT3hwpwVlV
	u4k2GthKUnBFuRNrRP/XoPSerupU1HIaiVySzO/QpWk35FaiLI3dwdIhQ2brWGTyOPPUCM
	8E3/Ier83smwYkYCv/LsZ20OWFpB5I2g8A5epoX659Pa/Omr3Rckh60nqnZ+5A==
Date: Mon, 24 Jul 2023 09:09:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: nikita.shubin@maquefel.me, Hartley Sweeten
 <hsweeten@visionengravers.com>, Lennert Buytenhek <kernel@wantstofly.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Lukasz Majewski <lukma@denx.de>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Sebastian
 Reichel <sre@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>, Mark
 Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Damien
 Le Moal <dlemoal@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Olof
 Johansson <olof@lixom.net>, soc@kernel.org, Liam Girdwood
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Michael Peters <mpeters@embeddedts.com>, Kris Bahnsen
 <kris@embeddedts.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-spi@vger.kernel.org, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-ide@vger.kernel.org, linux-input@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 24/42] mtd: nand: add support for ts72xx
Message-ID: <20230724090902.679ea56d@xps-13>
In-Reply-To: <ZLqx+Osn3gcHjUph@smile.fi.intel.com>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
	<20230605-ep93xx-v3-24-3d63a5f1103e@maquefel.me>
	<ZLqx+Osn3gcHjUph@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_000920_393551_2D0EFBE0 
X-CRM114-Status: GOOD (  18.94  )
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

SGkgQW5keSwKCj4gPiArc3RhdGljIGludCB0czcyeHhfbmFuZF9hdHRhY2hfY2hpcChzdHJ1Y3Qg
bmFuZF9jaGlwICpjaGlwKQo+ID4gK3sKPiA+ICsJc3dpdGNoIChjaGlwLT5lY2MuZW5naW5lX3R5
cGUpIHsKPiA+ICsJY2FzZSBOQU5EX0VDQ19FTkdJTkVfVFlQRV9TT0ZUOgo+ID4gKwkJaWYgKGNo
aXAtPmVjYy5hbGdvID09IE5BTkRfRUNDX0FMR09fVU5LTk9XTikKPiA+ICsJCQljaGlwLT5lY2Mu
YWxnbyA9IE5BTkRfRUNDX0FMR09fSEFNTUlORzsKPiA+ICsJCWJyZWFrOwo+ID4gKwljYXNlIE5B
TkRfRUNDX0VOR0lORV9UWVBFX09OX0hPU1Q6Cj4gPiArCQlyZXR1cm4gLUVJTlZBTDsKPiA+ICsJ
ZGVmYXVsdDogIAo+IAo+ID4gKwkJYnJlYWs7ICAKPiAKPiBIZXJlIGl0IHdpbGwgcmV0dXJuIDAs
IGlzIGl0IGEgcHJvYmxlbT8KClNlZW1zIG9rLCB0aGVyZSBhcmUgdHdvIG90aGVyIHNpdHVhdGlv
bnM6IG9uLWRpZSBFQ0MgZW5naW5lIGFuZCBubyBFQ0MKZW5naW5lLCBib3RoIGRvIG5vdCByZXF1
aXJlIGFueSBzcGVjaWZpYyBoYW5kbGluZyBvbiB0aGUgY29udHJvbGxlcgpzaWRlLgoKPiAKPiA+
ICsJfQo+ID4gKwo+ID4gKwlyZXR1cm4gMDsKPiA+ICt9ICAKPiAKPiAuLi4KPiAKPiA+ICtzdGF0
aWMgdm9pZCB0czcyeHhfbmFuZF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
PiA+ICt7Cj4gPiArCXN0cnVjdCB0czcyeHhfbmFuZF9kYXRhICpkYXRhID0gcGxhdGZvcm1fZ2V0
X2RydmRhdGEocGRldik7Cj4gPiArCXN0cnVjdCBuYW5kX2NoaXAgKmNoaXAgPSAmZGF0YS0+Y2hp
cDsKPiA+ICsJaW50IHJldDsKPiA+ICsKPiA+ICsJcmV0ID0gbXRkX2RldmljZV91bnJlZ2lzdGVy
KG5hbmRfdG9fbXRkKGNoaXApKTsgIAo+IAo+ID4gKwlXQVJOX09OKHJldCk7ICAKPiAKPiBXaHk/
ISAgSXMgaXQgbGlrZSB0aGlzIGluIG90aGVyIE1URCBkcml2ZXJzPwoKWWVzLCB3ZSBkaWQgbm90
IHlldCBjaGFuZ2UgdGhlIGludGVybmFsIG1hY2hpbmVyeSB0byByZXR1cm4gdm9pZCwgYW5kCndl
IGRvbid0IHdhbnQgcGVvcGxlIHRvIHRoaW5rIGdldHRpbmcgZXJyb3JzIHRoZXJlIGlzIG5vcm1h
bC4KCj4gPiArCW5hbmRfY2xlYW51cChjaGlwKTsKPiA+ICt9ICAKPiAKClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
