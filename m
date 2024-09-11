Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E1BEE57C1
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Sep 2024 16:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9uhNRMZfsatBgz9/15y7uBtIAcJDgbooicux2SnDIo=; b=oNukGN3SgOWQ8v
	i2sk+KDkLrBM8HfRYevmJu2Z56yU2FWOOAiqPDuW7mkoNUrBWkb+stZ9IlWvZNTqlQPZ6E/wrUMUJ
	ShfGY/CIqTQx3W4ainn6wnakPwgRg2wjQcpqiagnDunJ2oExYyixqPh/YKhYtkju2OfweYwHk6I2N
	1HYCAEboSwRHXuQEkr5p8MdXq30K3/6Q2WhvBPf4wAh2Ckg5I9hcRUo/JKgg3LDof5/s5KKv9pISd
	RAT2iXvw8+5R5HvhcQGLBjz1n0mnWuM9A1863dOFLAReW7R52sjTQ1czkv1OGRcOkIJEaIG2YkTEI
	0iaEj+bnvmlxb0J0+sug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soQ4A-0000000AKyg-2Jfw;
	Wed, 11 Sep 2024 16:19:38 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soQ47-0000000AKyB-3qhP;
	Wed, 11 Sep 2024 16:19:37 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2f75b13c2a8so98141fa.3;
        Wed, 11 Sep 2024 09:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726071573; x=1726676373; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lwlZJUmP9LcD4uQACLs3u1hgzJYRAuuAtfArazJJYQ8=;
        b=fhOweGPG3B4nkOvI03n6M7T7f+sOgfyDbq3Edf6GH0FKMxA82ak/D93imv9awJa400
         k60KLJcZME2anIYZ0S0WezztAci/AilSpBSs19i8EJdspXtHn8IYK2+lRPPUCGCaVwgE
         sCZ6udy/r+GbiZvAqh5gGFNVQvlJmooFzKr7Hao3JWf5H7OV2MnW5wWswlAIXv1NEd8h
         3yeZ9IYsaJ/rR6IRFlLJC1PAvcxvSzGQuCR3WaUnQNmvKOcAUl69Q5X6dZElMEu9i8Hs
         WIPfb0g64UIuTI8xWqcWvI+iG5ZGgUx/thWpQulcT+HSNePW6Z5sh4qoMHpnXd7r30Jj
         VCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726071573; x=1726676373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwlZJUmP9LcD4uQACLs3u1hgzJYRAuuAtfArazJJYQ8=;
        b=XXwSzl6zjHVGshdkPYOpvL3lmrAyeVIQXdwHL9vsDqUaCJes2pQf17JkYEy/9fEUPX
         zy5Ex1st4uGQs5gFpp/OADiBY/KtT0Eecj1tCMQNgZxMV1PEvqKIF5YaFrCTHbIMNhhv
         qd3uxR3Y41AgucizVNqxCdEkbjDCrSS6GG5w5/9/ey5L1K2VpFkGjFCQtxhl37eKjTHO
         Tbecxh0ZLG1CRTrXjLy/ABhOk5DqaR5/J94K5TmURtMmefsEBKJ+dQqlmMAkbPgi2zE3
         7Xp02AP0dlMofcmflBTTl/mVswEM2f7GI/oeT2NZ2aPZUAoYGiaht1AgKruAfEDM6N9k
         5xsw==
X-Forwarded-Encrypted: i=1; AJvYcCXaJpUFXmOKYrgcsKh8VjEroFmUvm/Wk7jcEs9hymlZFuJAoEoxZ8PPkurVSHk0RC11cuWPWzmPUbLp@lists.infradead.org, AJvYcCXukOHTNv/5PFePsETRcWseGmN4FV+VwUtpTpTf8xRZcwNjiphArfp/epnnJx3d6j4E42b1k0PD7rCnRQw8XrfD@lists.infradead.org
X-Gm-Message-State: AOJu0YyuJll+00v9jlCxj0v0OoCUlN47vwGqLfbWXfTB2NMKNlU/RuPb
	Gqzy2+z9MgDRjoTNfSDskgt/SG3oAfe/0uJFRCoJYu5Afgta3iteK3A5HK7L5kLPnwcza9q7cVU
	APRGOIeyljGMn6vIeScfaHITi/HQ=
X-Google-Smtp-Source: AGHT+IEfiqu9Tkr72UxQfCKwEwXNERhL9+EEF5iQAUfNY4YtEQqPnVlXr1xTzedLm0smIgh8R+iSdzkbG8ZOJ96JeDI=
X-Received: by 2002:a05:6512:10d6:b0:52b:bf8e:ffea with SMTP id
 2adb3069b0e04-53673c96a84mr2008337e87.40.1726071572960; Wed, 11 Sep 2024
 09:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240909-ep93xx-v12-0-e86ab2423d4b@maquefel.me>
 <CAHp75Veusv=f6Xf9-gL3ctoO5Njn7wiWMw-aMN45KbZ=YB=mQw@mail.gmail.com>
 <0e3902c9a42b05b0227e767b227624c6fe8fd2bb.camel@maquefel.me> <cff6b9b6-6ede-435a-9271-829fde82550d@app.fastmail.com>
In-Reply-To: <cff6b9b6-6ede-435a-9271-829fde82550d@app.fastmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 11 Sep 2024 19:18:56 +0300
Message-ID: <CAHp75Vc2Dbj0GAua4b85L8jgcGzdBfMdRgnuTSWNiGj0zKHU7A@mail.gmail.com>
Subject: Re: [PATCH v12 00/38] ep93xx device tree conversion
To: Arnd Bergmann <arnd@arndb.de>
Cc: Nikita Shubin <nikita.shubin@maquefel.me>, 
	Hartley Sweeten <hsweeten@visionengravers.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Lukasz Majewski <lukma@denx.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Thierry Reding <thierry.reding@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Mark Brown <broonie@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Sergey Shtylyov <s.shtylyov@omp.ru>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Ralf Baechle <ralf@linux-mips.org>, Aaron Wu <Aaron.Wu@analog.com>, Lee Jones <lee@kernel.org>, 
	Olof Johansson <olof@lixom.net>, Niklas Cassel <cassel@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org, 
	Netdev <netdev@vger.kernel.org>, linux-mtd@lists.infradead.org, 
	linux-ide@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-sound@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_091935_978009_5A21500C 
X-CRM114-Status: GOOD (  26.49  )
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

T24gV2VkLCBTZXAgMTEsIDIwMjQgYXQgNjoxM+KAr1BNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+IHdyb3RlOgo+Cj4gT24gTW9uLCBTZXAgOSwgMjAyNCwgYXQgMDk6MDIsIE5pa2l0YSBT
aHViaW4gd3JvdGU6Cj4gPiBPbiBNb24sIDIwMjQtMDktMDkgYXQgMTE6NDkgKzAzMDAsIEFuZHkg
U2hldmNoZW5rbyB3cm90ZToKPiA+PiBPbiBNb24sIFNlcCA5LCAyMDI0IGF0IDExOjEy4oCvQU0g
TmlraXRhIFNodWJpbiB2aWEgQjQgUmVsYXkKPiA+PiA8ZGV2bnVsbCtuaWtpdGEuc2h1YmluLm1h
cXVlZmVsLm1lQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+ID4KPiA+PiA+IFRoZSBnb2FsIGlzIHRv
IHJlY2lldmUgQUNLcyBmb3IgYWxsIHBhdGNoZXMgaW4gc2VyaWVzIHRvIG1lcmdlIGl0Cj4gPj4g
PiB2aWEgQXJuZCBicmFuY2guCj4gPj4gPgo+ID4+ID4gSXQgd2FzIGRlY2lkZWQgZnJvbSB0aGUg
dmVyeSBiZWdpbm5pbmcgb2YgdGhlc2Ugc2VyaWVzLCBtb3N0bHkKPiA+PiA+IGJlY2F1c2UKPiA+
PiA+IGl0J3MgYSBmdWxsIGNvbnZlcnNpb24gb2YgcGxhdGZvcm0gY29kZSB0byBEVCBhbmQgaXQg
c2VlbWVkIG5vdAo+ID4+ID4gY29udmVuaWVudCB0byBtYWludGFpbiBjb21wYXRpYmlsaXR5IHdp
dGggYm90aCBwbGF0Zm9ybSBhbmQgRFQuCj4gPj4gPgo+ID4+ID4gRm9sbG93aW5nIHBhdGNoZXMg
cmVxdWlyZSBhdHRlbnRpb24gZnJvbSBTdGVwaGVuIEJveWQgb3IgY2xrCj4gPj4gPiBzdWJzeXN0
ZW06Cj4gPj4KPiA+PiBEb2VzIGl0IG1lYW4geW91IHN0aWxsIGhhdmUgYSBmZXcgcGF0Y2hlcyB3
aXRob3V0IHRhZ3M/Cj4gPj4gV2hhdCBhcmUgdGhlaXIgcmVzcGVjdGl2ZSBudW1iZXJzPwo+ID4K
PiA+IFRoZSBjbGsgaXMgdGhlIGxhc3Qgb25lIGFzIGkgdGhpbmssIGFsbCBvdGhlcnMgY2FuIGJl
IEFDS2VkIGJ5Cj4gPiBBbGV4YW5kZXIgb3IgYnkgQXJuZCBoaW1zZWxmLgo+Cj4gSSd2ZSBtZXJn
ZWQgdGhlIHNlcmllcyBpbnRvIHRoZSBmb3ItbmV4dCBicmFuY2ggb2YgdGhlIGFybS1zb2MKPiB0
cmVlIG5vdy4gVGhlIHRpbWluZyBpc24ndCBncmVhdCBhcyBJIHdhcyBzdGlsbCB3YWl0aW5nIGZv
cgo+IHRoYXQgZmluYWwgQWNrLCBidXQgaXQgc2VlbSBiZXR0ZXIgdG8gaGF2ZSBpdCBkb25lIHRo
YW4gdG8ga2VlcAo+IHJlc3Bpbm5pbmcgdGhlIHNlcmllcy4KPgo+IEkgd29uJ3Qgc2VuZCBpdCB3
aXRoIHRoZSBpbml0aWFsIHB1bGwgcmVxdWVzdHMgdGhpcyB3ZWVrCj4gYnV0IGhvcGUgdG8gc2Vu
ZCB0aGlzIG9uZSBvbmNlIEkgZ2V0IGJlY2sgZnJvbSBMUEMsIHByb3ZpZGVkCj4gdGhlcmUgYXJl
IG5vIHN1cnByaXNlcyB0aGF0IHJlcXVpcmUgYSByZWJhc2UuCgpUaGFuayB5b3UhCgpUaGlzLCBp
biBwYXJ0aWN1bGFyLCB3aWxsIG1vdmUgZm9yd2FyZCB0byB0aGUgR1BJTyBkZXNjcmlwdG9yIGFu
ZApnZXR0aW5nIHJpZCBvZiBvbGQgbGVnYWN5IEdQSU8gQVBJcy4KCi0tIApXaXRoIEJlc3QgUmVn
YXJkcywKQW5keSBTaGV2Y2hlbmtvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
