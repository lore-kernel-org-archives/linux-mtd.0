Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6687EC3DA41
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jul 2024 13:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VHE87dGzefX24GuPAkJfrNZiNXk9P6Yr9OI7XfSEXCI=; b=dyLcaPXY+piOYk
	x5RV4rNHhJbmouDBjzEmHJxej1CFdtPErUTmD9wpmpBYH/HPct2dNXsQMZswWUdyV6A7p1IHEl9Co
	VikoE4Yeh+IY61ropdILXguE64Ck4nU5V2Q3ERTZO56J7M/fJnXx3lQDgZ5N6eIKGGII4U85gUQyd
	mHCLo3w3QpPgiyUgl3MWldLGQLi7b2YZe/jYzsCKvZFS0b9oCnyXUl2uUQLAimeZd9l6KiZvwikpe
	jZOOCFLyPsWLvpYZLY/nNGeJbaltA0hVjnAEn7eH5QYoqqMcQbi2jJX4OZfsoYEOPrmB+lDavmHRO
	2lNpWXsNmr+yNED5oa4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRXgn-0000000Ai45-38Px;
	Wed, 10 Jul 2024 13:48:57 +0000
Received: from forward500a.mail.yandex.net ([178.154.239.80])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRXgh-0000000Ai33-1puF;
	Wed, 10 Jul 2024 13:48:54 +0000
Received: from mail-nwsmtp-smtp-production-main-31.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-31.vla.yp-c.yandex.net [IPv6:2a02:6b8:c0d:38a3:0:640:a710:0])
	by forward500a.mail.yandex.net (Yandex) with ESMTPS id 7E56061E0D;
	Wed, 10 Jul 2024 16:48:42 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-31.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id Xmecr64OiuQ0-yRS0mYRs;
	Wed, 10 Jul 2024 16:48:40 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
	t=1720619320; bh=dvNWlpITxM+kcZ2muxDh7Vnog/B/XqfEmWB2Ko9b+L0=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=Lz4kK/pLIiP7TRsvVcCsyN/ENXOi/cbuOigQPGq6WepeV2OMr/VX7mIKmanRWGhgr
	 BHxt03weitFN0X52cEW+k6DsO/fFgVBLHT5tNa8+AeAum0LY8n5C2G7QIul1NoywuN
	 cqt18iShdPqpcuaqZATlZBHaI3uCXuLlRUg1hK8k=
Authentication-Results: mail-nwsmtp-smtp-production-main-31.vla.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
Message-ID: <6a0b3b3b03706367e7bd2d3ed7132e9cc454af00.camel@maquefel.me>
Subject: Re: [PATCH v10 00/38] ep93xx device tree conversion
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Arnd Bergmann <arnd@arndb.de>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
	 <u.kleine-koenig@baylibre.com>
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
 Brown <broonie@kernel.org>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Damien Le Moal <dlemoal@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai
 <tiwai@suse.com>, Ralf Baechle <ralf@linux-mips.org>, Aaron Wu
 <Aaron.Wu@analog.com>, Lee Jones <lee@kernel.org>, Olof Johansson
 <olof@lixom.net>, Niklas Cassel <cassel@kernel.org>,
 linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org, "open
 list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-clk@vger.kernel.org,  linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-spi@vger.kernel.org, Netdev <netdev@vger.kernel.org>, 
 linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-sound@vger.kernel.org, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Vinod
 Koul <vkoul@kernel.org>
Date: Wed, 10 Jul 2024 16:48:34 +0300
In-Reply-To: <8f45a3d9-429c-441e-a17c-33a163eb86c2@app.fastmail.com>
References: <20240617-ep93xx-v10-0-662e640ed811@maquefel.me>
	 <CAHp75VfSC9gAD9ipeWRPdQOxUp4FXqYYei-cJTs38nbz0cHpkg@mail.gmail.com>
	 <48c242838c77034485a9e667dc0e867207c5beed.camel@maquefel.me>
	 <241a4cf9830b0118f01e8fcf2853c62527636049.camel@maquefel.me>
	 <jyvlqfvqn5bp3jmvxvwyrcqmihjohuq3o757mfph7x37kbwvtq@gtgyh4fca4fq>
	 <663b1749afeb5cec281149fdb445ed36fdcbc68e.camel@maquefel.me>
	 <8f45a3d9-429c-441e-a17c-33a163eb86c2@app.fastmail.com>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_064851_695885_C3C7C9E0 
X-CRM114-Status: GOOD (  20.02  )
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

SGVsbG8gQXJuZCEKCk9uIFdlZCwgMjAyNC0wNy0xMCBhdCAxNDozMSArMDIwMCwgQXJuZCBCZXJn
bWFubiB3cm90ZToKPiBPbiBNb24sIEp1bCA4LCAyMDI0LCBhdCAwOTozNCwgTmlraXRhIFNodWJp
biB3cm90ZToKPiA+IEFybmQsIAo+ID4gCj4gPiBBcmUgd2UgY29udGludWluZyB0aGlzIHBhdGNo
IHNlcmllcyA/Cj4gPiAKPiA+IFlvdSBhcmUgc2lsZW50IHNpbmNlIGxhc3QgdmVyc2lvbiBzdWJt
aXQsIHdoaWNoIG1ha2VzIG1lIGEgYml0Cj4gPiB3b3JyaWVkLgo+ID4gCj4gPiBJZiB5b3Ugc3Vk
ZGVubHkgY2hhbmdlZCB5b3VyIG1pbmQgcGxlYXNlIGxldCB1cyBrbm93LCBjYXVzZSBhbnl3YXkK
PiA+IHdlCj4gPiBoYXZlIG5vIHBvc3NpYmlsaXR5IHRvIG1lcmdlIHRoZXNlIHNlcmllcyB3aXRo
b3V0IHlvdS4KPiAKPiBIaSBOaWtpdGEsCj4gCj4gSSBkZWZpbml0ZWx5IHN0aWxsIHdhbnQgdG8g
bWVyZ2UgeW91ciB3b3JrLCBJIHdhcyBqdXN0IG5vdCBwYXlpbmcKPiBhdHRlbnRpb24gd2hpbGUg
dGhlcmUgd2VyZSBvdGhlcnMgY29tbWVudGluZyBvbiBpdCwgYW5kIEkgZG9uJ3QKPiBrbm93IHdo
YXQgdGhlIGN1cnJlbnQgc3RhdGUgaXMuIElmIHlvdSBhcmUgcmVhZHkgdG8gaGF2ZSBzb21lCj4g
b3IgYWxsIG9mIHRoZSBwYXRjaGVzIGluY2x1ZGVkIGluIHRoZSBuZXh0IG1lcmdlIHdpbmRvdywg
Y2FuCj4geW91IHNlbmQgZWl0aGVyIHRoZSBzZXQgb2YgcGF0Y2hlcyB0aGF0IHdlcmUgcmV2aWV3
ZWQgdG8KPiBzb2NAa2VybmVsLm9yZ8KgZm9yIG1lIHRvIHBpY2sgdXAsIG9yIHByZXBhcmUgYSBw
dWxsIHJlcXVlc3QKPiB0byB0aGF0IGFkZHJlc3M/Cj4gCj4gwqDCoMKgwqDCoMKgIEFybmQKClRo
YW5rcyBmb3Igc3VwcG9ydCEKCldlIHN0aWxsIGhhdmUgYSBtaW5vciBpc3N1ZSBidXQgQUZBSVMg
b25seSBhIHNpbmdsZSBwYXRjaCBsZWZ0LCBidXQKaG9waW5nIHRvIHNldHRsZSB0aGlzIG9uZSB3
aXRoIFN0ZXBoZW4gc29vbi4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
