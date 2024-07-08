Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5DBC3271E
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jul 2024 07:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ffz75ENgaW3dZfKrhg81tzQ1l3OHzc156noBG0jR2O0=; b=RmCUoEv1Nmvebp
	IyFOUykKluZArn+OXuaxF8eBzFRqP+k6jtgjla9QCEGncQxQ8wnIdBP+XGwT7022hJeOC/OFiuYYN
	g8AkJt1vaYGg5tt/4cxL+pfg2uBVpxjxTMTqO47QIy0GIbzZ63y0NZvXWHZfJGv4BlXQ09sTn9fDM
	/Jsn6T6MfM614WhLFl4uHrldMGPvqRmNznWBRlkdEeNzRyRmYcFZr1dAeice2JuGcUPeAUJYdGNCC
	lTZKWo0V6JTmR9yxlbfBA9syv3TYKXXRfg+hijZ3mBJuLXOJLO3PAma1dSIplFJma8X84rboFovow
	Ox32M7cKFxUSNDY0CmzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQita-000000032hk-2CqZ;
	Mon, 08 Jul 2024 07:34:46 +0000
Received: from forward500d.mail.yandex.net ([2a02:6b8:c41:1300:1:45:d181:d500])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQitU-000000032g7-0lgV;
	Mon, 08 Jul 2024 07:34:43 +0000
Received: from mail-nwsmtp-smtp-production-main-24.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-24.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:7dca:0:640:d4d9:0])
	by forward500d.mail.yandex.net (Yandex) with ESMTPS id C5DDC60A3F;
	Mon,  8 Jul 2024 10:34:32 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-24.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 6YW3mBQe3W20-qUQtuv72;
	Mon, 08 Jul 2024 10:34:30 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
	t=1720424070; bh=O9RoOO9HvF5SuUCeDg6vUA4wVmtzSSul9Xm5/s61R6Y=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=VhLZU4xmXX2w4OBfMMBdLTuYfNHiVS81wr+5BeazZfJVOu+yyXSQdoaO60cjQziKc
	 M0uTvIyCbbrFj9TBj/klf6qeczg17/a4YJiSE0dCEH6yKJCldgKqcd4qvfnukuaDOU
	 WcbQbDv7ImiZUeCsbYrO017QDF3uXjKDnJWXQ9oc=
Authentication-Results: mail-nwsmtp-smtp-production-main-24.klg.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
Message-ID: <663b1749afeb5cec281149fdb445ed36fdcbc68e.camel@maquefel.me>
Subject: Re: [PATCH v10 00/38] ep93xx device tree conversion
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, 
	Arnd Bergmann
	 <arnd@arndb.de>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>,  Hartley Sweeten <hsweeten@visionengravers.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Lukasz Majewski <lukma@denx.de>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Andy
 Shevchenko <andy@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter
 Roeck <linux@roeck-us.net>, Thierry Reding <thierry.reding@gmail.com>, Mark
 Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Damien Le Moal <dlemoal@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai
 <tiwai@suse.com>, Ralf Baechle <ralf@linux-mips.org>, "Wu, Aaron"
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
Date: Mon, 08 Jul 2024 10:34:05 +0300
In-Reply-To: <jyvlqfvqn5bp3jmvxvwyrcqmihjohuq3o757mfph7x37kbwvtq@gtgyh4fca4fq>
References: <20240617-ep93xx-v10-0-662e640ed811@maquefel.me>
	 <CAHp75VfSC9gAD9ipeWRPdQOxUp4FXqYYei-cJTs38nbz0cHpkg@mail.gmail.com>
	 <48c242838c77034485a9e667dc0e867207c5beed.camel@maquefel.me>
	 <241a4cf9830b0118f01e8fcf2853c62527636049.camel@maquefel.me>
	 <jyvlqfvqn5bp3jmvxvwyrcqmihjohuq3o757mfph7x37kbwvtq@gtgyh4fca4fq>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_003440_953184_2D22548C 
X-CRM114-Status: GOOD (  35.48  )
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

QXJuZCwgCgpBcmUgd2UgY29udGludWluZyB0aGlzIHBhdGNoIHNlcmllcyA/CgpZb3UgYXJlIHNp
bGVudCBzaW5jZSBsYXN0IHZlcnNpb24gc3VibWl0LCB3aGljaCBtYWtlcyBtZSBhIGJpdCB3b3Jy
aWVkLgoKSWYgeW91IHN1ZGRlbmx5IGNoYW5nZWQgeW91ciBtaW5kIHBsZWFzZSBsZXQgdXMga25v
dywgY2F1c2UgYW55d2F5IHdlCmhhdmUgbm8gcG9zc2liaWxpdHkgdG8gbWVyZ2UgdGhlc2Ugc2Vy
aWVzIHdpdGhvdXQgeW91LgoKCk9uIEZyaSwgMjAyNC0wNy0wNSBhdCAxMToyMSArMDIwMCwgVXdl
IEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGVsbG8sCj4gCj4gT24gVGh1LCBKdW4gMjcsIDIwMjQg
YXQgMTE6Mjk6NDRBTSArMDMwMCwgTmlraXRhIFNodWJpbiB3cm90ZToKPiA+IE9uIFR1ZSwgMjAy
NC0wNi0xOCBhdCAxOToyMCArMDMwMCwgTmlraXRhIFNodWJpbiB3cm90ZToKPiA+ID4gSGVsbG8g
QW5keSEKPiA+ID4gT24gTW9uLCAyMDI0LTA2LTE3IGF0IDEyOjU4ICswMjAwLCBBbmR5IFNoZXZj
aGVua28gd3JvdGU6Cj4gPiA+ID4gT24gTW9uLCBKdW4gMTcsIDIwMjQgYXQgMTE6MzjigK9BTSBO
aWtpdGEgU2h1YmluIHZpYSBCNCBSZWxheQo+ID4gPiA+IDxkZXZudWxsK25pa2l0YS5zaHViaW4u
bWFxdWVmZWwubWVAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRoZSBn
b2FsIGlzIHRvIHJlY2lldmUgQUNLcyBmb3IgYWxsIHBhdGNoZXMgaW4gc2VyaWVzIHRvCj4gPiA+
ID4gPiBtZXJnZSBpdAo+ID4gPiA+ID4gdmlhIEFybmQgYnJhbmNoLgo+ID4gPiA+IAo+ID4gPiA+
ICdyZWNlaXZlJwo+ID4gPiA+IAo+ID4gPiA+ID4gVW5mb3J0dW5hdGVseSwgQ0xLIHN1YnN5c3Rl
bSBzdWRkZW5seSB3ZW50IHNpbGVudCBvbiBjbGsKPiA+ID4gPiA+IHBvcnRpb24KPiA+ID4gPiA+
IG9mCj4gPiA+ID4gPiBzZXJpZXMgVjIgcmVyb2xsLAo+ID4gPiA+ID4gdHJpZWQgdG8gcGluZyB0
aGVtIGZvciBhYm91dCBhIG1vbnRoIGJ1dCBubyBsdWNrLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBM
aW5rOgo+ID4gPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDQwOC1lcDkzeHgt
Y2xrLXYyLTEtYWRjZDY4YzEzNzUzQG1hcXVlZmVsLm1lCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFNv
bWUgY2hhbmdlcyBzaW5jZSBsYXN0IHZlcnNpb24gKHY5KSAtIHNlZSAiQ2hhbmdlcyBpbiB2MTAi
LAo+ID4gPiA+ID4gbW9zdGx5Cj4gPiA+ID4gPiBjb3NtZXRpYy4KPiA+ID4gPiAKPiA+ID4gPiAu
Li4KPiA+ID4gPiAKPiA+ID4gPiA+IFBhdGNoZXMgc2hvdWxkIGJlIGZvcm1hdGVkIHdpdGggJy0t
aGlzdG9ncmFtJwo+ID4gPiA+IAo+ID4gPiA+ICdmb3JtYXR0ZWQnCj4gPiA+ID4gCj4gPiA+ID4g
Li4uCj4gPiA+ID4gCj4gPiA+ID4gPiBDaGFuZ2VzIGluIHYxMDoKPiA+ID4gPiA+IAo+ID4gPiA+
ID4gUmVvcmRlcmVkIFNvQiB0YWdzIHRvIG1ha2Ugc3VyZSB0aGV5IGFwcGVhciBiZWZvcmUgUmIg
YW5kCj4gPiA+ID4gPiBBY2tlZAo+ID4gPiA+ID4gdGFncy4KPiA+ID4gPiAKPiA+ID4gPiBUaGlz
IGlzIG5vdCByZXF1aXJlZC4gVGhlIGltcG9ydGFuY2UgaXMgb25seSB0aGUgb3JkZXIgb2YgU29C
cwo+ID4gPiA+IHRoZW1zZWx2ZXMuIElmIHRoZXkgYXJlIGludGVybGVhdmVkIHdpdGggb3RoZXIg
dGFncywgaXQncyBmaW5lLgo+ID4gPiAKPiA+ID4gQWggLSBvay4gSnVzdCBzYXcgc29tZW9uZSB3
YXMgY29tcGxhaW5pbmcgYWJvdXQgYjQgcmVvcmRlcmluZwo+ID4gPiB0aGVtLiAKPiA+ID4gCj4g
PiA+ID4gCj4gPiA+ID4gLi4uCj4gPiA+ID4gCj4gPiA+ID4gCj4gPiA+ID4gSG9wZWZ1bGx5IHRv
IHNlZSB0aGlzIHNlcmllcyBiZWluZyBldmVudHVhbGx5IGFwcGxpZWQgc29vbi4KPiA+ID4gPiBB
cm5kPyAoRG8gd2UgaGF2ZSBhbGwgbmVjZXNzYXJ5IHN1YnN5c3RlbSBtYWludGFpbmVycycgdGFn
cywKPiA+ID4gPiBidHc/KQo+ID4gPiA+IAo+ID4gPiA+IAo+ID4gPiAKPiA+ID4gQXMgaSBzZWUg
ZnJvbSBteSBwZXJzcGVjdGl2ZSBvbmx5IHRocmVlIGxlZnQ6Cj4gPiA+IAo+ID4gPiBDbGsgc3Vi
c3lzdGVtOgo+ID4gPiAKPiA+ID4gLSBjbGs6IGVwOTN4eDogYWRkIERUIHN1cHBvcnQgZm9yIENp
cnJ1cyBFUDkzeHgKPiA+ID4gCj4gPiA+IERNQSBzdWJzeXN0ZW0gKGJ1dCB0aGUgb25seSByZXF1
ZXN0IGZyb20gVmlub2QsIGFzIGZhciBhcyBpCj4gPiA+IHJlbWVtYmVyLAo+ID4gPiB3YXMgZml4
aW5nIGNvbW1pdHMgdGl0bGVzKToKPiA+ID4gCj4gPiA+IC0gZG1hZW5naW5lOiBjaXJydXM6IENv
bnZlcnQgdG8gRFQgZm9yIENpcnJ1cyBFUDkzeHgKPiA+ID4gLSBkbWFlbmdpbmU6IGNpcnJ1czog
cmVtb3ZlIHBsYXRmb3JtIGNvZGUKPiA+ID4gCj4gPiA+IEJlc2lkZSB0aGF0IHRhZ3MgbWlzc2lu
ZyBvbiBwbGF0Zm9ybSBjb2RlIHJlbW92YWwgKHdoaWNoIGNhbiBiZQo+ID4gPiBBY2tlZAo+ID4g
PiBieSBBcm5kIGhpbXNlbGYgaSBiZWxpZXZlKSBhbmQgZHRzaS9kdHMgZmlsZXMgKHNhbWUgPyku
Cj4gPiAKPiA+IFZpbm9kIGFja2VkIHRoZSBhYm92ZSB0d28gcGF0Y2hlczoKPiA+IAo+ID4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL1pua0lwOGJPY1pLM3lWS1BAbWF0c3lhLwo+ID4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL1pua0ltcDhCdFRkeGw3TzNAbWF0c3lhLwo+ID4gCj4g
PiBzbyBvbmx5Ogo+ID4gCj4gPiAtIGNsazogZXA5M3h4OiBhZGQgRFQgc3VwcG9ydCBmb3IgQ2ly
cnVzIEVQOTN4eAo+ID4gCj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA2MTct
ZXA5M3h4LXYxMC0zLTY2MmU2NDBlZDgxMUBtYXF1ZWZlbC5tZS8KPiA+IAo+ID4gbGVmdC4KPiA+
IAo+ID4gSG9wZSBTdGVwaGVuIHdpbGwgZmluZCBzb21lIHRpbWUgZm9yIHRoaXMgb25lLgo+IAo+
IEFzIHdlJ3JlIGFwcHJvYWNoaW5nIHRoZSBtZXJnZSB3aW5kb3cgYW5kIHRoaXMgaXMgc3RpbGwg
dW5jbGVhciwgSQo+IGFwcGxpZWQgdGhlIHB3bSBiaXRzIChpLmUuIHBhdGNoZXMgMTIsIDEzKS4g
SWYgSSB1bmRlcnN0YW5kCj4gY29ycmVjdGx5LAo+IHBhdGNoIDMzIGlzbid0IHN1aXRhYmxlIGZv
ciBhcHBsaWNhdGlvbiB5ZXQgYXMgaXQgaGFzIGEgZGVwZW5kZW5jeSBvbgo+IHBpbmN0cmwgY2hh
bmdlcyBpbiB0aGF0IHNlcmllcy4KPiAKPiAoc2lkZSBub3RlOiBZb3VyIHBhdGNoZXMgYXJlIHNp
Z25lZCwgYnV0IHRoYXQgZG9lc24ndCBicmluZyBhbnkKPiBiZW5lZml0Cj4gaWYgdGhlIHJlY2Vp
dmVycyBkb24ndCBoYXZlIHlvdXIga2V5LiBJIGRpZG4ndCBmaW5kIGl0IG5laXRoZXIgb24KPiBr
ZXlzLm9wZW5wZ3Aub3JnIG5vciBpbiB0aGUga2VybmVsIHBncCBrZXkgY29sbGVjdGlvbi4pCj4g
Cj4gQmVzdCByZWdhcmRzCj4gVXdlCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
