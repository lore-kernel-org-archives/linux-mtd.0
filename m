Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AE6C27C79
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2024 10:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/VG+uB8DZ+MsgWdTSCw/Dxww2YmCJ1ww/O3fUVVLYkM=; b=Ne6xNfE3N8xpJv
	7WG77WKc7nFDvKvZg4p2mHZeHHXmTYQ3f0VUvD9/uqjowDRungJmgRAEo531mCVP/WyqwFthc6xEn
	8evxey0ilcTjEVwhc+bILFekVtcAi4Qyt9W9+YSaiWfvlTZFIu7R9GtiVLnYW2wqOg8u8ry4jSS2c
	pqckc052RnbRQelNU1bm5a25BDSXsfrnbR5Sc8RhycnFcaQZ/newOxmP/6xAncFcOZN7zf+0fkHQ9
	Y082NKtpGCq5ZD782CrdKAFeT5ve3V6PxsuGwaqYpNrvqSYoIroUEHiWI6abhpSJWWA2Bl91uWJRk
	ZS1y9r3DzC8BxGxwGsnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJA4p-0000000AOBn-4397;
	Mon, 17 Jun 2024 10:59:08 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJA4k-0000000AOAd-29yy;
	Mon, 17 Jun 2024 10:59:03 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a6ef793f4b8so441042666b.1;
        Mon, 17 Jun 2024 03:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718621939; x=1719226739; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wB8dLUWtRHRl79UEIYwwpGcoRPP7LZqthPrT0xkjS0=;
        b=lrdJqAREqqVU6sYYHmmDDmXGa8/po4LJFaIfLFa8GGvGZcXVYNhI6s4jTCBzSn1s3h
         tFletlnbARrLd4Qu1qZTkY22mfMy3vGVibw9y6PN4lLoO3ePIk09VxwBkPNl3RXYxeAY
         PmGexO0ZKJOpDrd8yxb4XAZcXYD0pOTy3LeR/tXOMQ2jmpmjrWtlmfKEgpBGXQmMx4IU
         HROU830szJsb2LiCBfeR1onY/r8ZjfQe3IuczVmpRfKCr5t1F8RmXhYWogJuHFAtfkg5
         l4fdVyHCEPqABVY3VaH0AEv85GfKtO+NvR5Emuv7C+JBExy8nC8SmMF6dlxqx7m4+Jlx
         gNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718621939; x=1719226739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8wB8dLUWtRHRl79UEIYwwpGcoRPP7LZqthPrT0xkjS0=;
        b=FTpxb5Y3KJRfJG/Ck1ePc9fU8P4t8jdVFDhcF2c0YKxhBeWl/XgHezSCdcyo/ek1to
         12LdvQg7pVqwGUpb4rR4BjsUQ+fDpc/ZP0y4Y38Ahes4bwMs4oPGD8OndRq+9cWBxA7s
         8787ncx7Mb14SH8RbnCOTuHc+oWud/Mwfa3NZNXivmgS/aY5ostJjLFQz/hUwrulyhPx
         rgK1KjdEzYgqb/OjxN1q0YsG0nGo4XBxnSaoAw+0/F9Ls9VPUCKjs+61Lf52mJMagz78
         BTNsNHHTcrTgxFF3AUQll5O69xOuTwI9mYtWCxZhTQ+kPXCxFpBd5yyVDw5ybezBIpP5
         SrAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUftk4ZE53zwTe7T23hbrRcFQC6mOXGEXwvtjxnTMSowmZAIzlExCps9rgrXYZI9pFqDbJbMaDwS9FRl+d2kXViqRxbEGsx3GRPImuAs3iziJzc4cLbpiHi3uvd9FiE44becnJYZEA/kBSK0syD7p14Lyyg
X-Gm-Message-State: AOJu0Yxm1YJQboD+gYNSI9i6DaS/z1cO7JC75Fl2X4092bGF/SPhygnE
	04pDVM1+ZMfZZRLY/9TcyK+YHRL3xmyQ3ewTSLMNIBmlZEJhFS85xL9U5xo9DMiRABSKldskbkW
	7JZ1E6Zr7u32oSPVtgFixUr1kUWo=
X-Google-Smtp-Source: AGHT+IFLQNwGHlc2x1pJKtfDQbxygWK6Gf7QAcGKtHzYeiun/g/cbs2h4qNhFprWOgm/WKjClpcVLvXhnCvHBWIHCLQ=
X-Received: by 2002:a17:906:f8c6:b0:a6f:d1d:b523 with SMTP id
 a640c23a62f3a-a6f60d430e6mr561654166b.36.1718621938822; Mon, 17 Jun 2024
 03:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240617-ep93xx-v10-0-662e640ed811@maquefel.me>
In-Reply-To: <20240617-ep93xx-v10-0-662e640ed811@maquefel.me>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 17 Jun 2024 12:58:22 +0200
Message-ID: <CAHp75VfSC9gAD9ipeWRPdQOxUp4FXqYYei-cJTs38nbz0cHpkg@mail.gmail.com>
Subject: Re: [PATCH v10 00/38] ep93xx device tree conversion
To: nikita.shubin@maquefel.me
Cc: Arnd Bergmann <arnd@arndb.de>, Hartley Sweeten <hsweeten@visionengravers.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Lukasz Majewski <lukma@denx.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Thierry Reding <thierry.reding@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Mark Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Sergey Shtylyov <s.shtylyov@omp.ru>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Ralf Baechle <ralf@linux-mips.org>, "Wu, Aaron" <Aaron.Wu@analog.com>, Lee Jones <lee@kernel.org>, 
	Olof Johansson <olof@lixom.net>, Niklas Cassel <cassel@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-spi@vger.kernel.org, netdev@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_035902_595543_4DCDC284 
X-CRM114-Status: GOOD (  13.88  )
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

T24gTW9uLCBKdW4gMTcsIDIwMjQgYXQgMTE6MzjigK9BTSBOaWtpdGEgU2h1YmluIHZpYSBCNCBS
ZWxheQo8ZGV2bnVsbCtuaWtpdGEuc2h1YmluLm1hcXVlZmVsLm1lQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+Cj4gVGhlIGdvYWwgaXMgdG8gcmVjaWV2ZSBBQ0tzIGZvciBhbGwgcGF0Y2hlcyBpbiBzZXJp
ZXMgdG8gbWVyZ2UgaXQgdmlhIEFybmQgYnJhbmNoLgoKJ3JlY2VpdmUnCgo+IFVuZm9ydHVuYXRl
bHksIENMSyBzdWJzeXN0ZW0gc3VkZGVubHkgd2VudCBzaWxlbnQgb24gY2xrIHBvcnRpb24gb2Yg
c2VyaWVzIFYyIHJlcm9sbCwKPiB0cmllZCB0byBwaW5nIHRoZW0gZm9yIGFib3V0IGEgbW9udGgg
YnV0IG5vIGx1Y2suCj4KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwNDA4
LWVwOTN4eC1jbGstdjItMS1hZGNkNjhjMTM3NTNAbWFxdWVmZWwubWUKPgo+IFNvbWUgY2hhbmdl
cyBzaW5jZSBsYXN0IHZlcnNpb24gKHY5KSAtIHNlZSAiQ2hhbmdlcyBpbiB2MTAiLCBtb3N0bHkK
PiBjb3NtZXRpYy4KCi4uLgoKPiBQYXRjaGVzIHNob3VsZCBiZSBmb3JtYXRlZCB3aXRoICctLWhp
c3RvZ3JhbScKCidmb3JtYXR0ZWQnCgouLi4KCj4gQ2hhbmdlcyBpbiB2MTA6Cj4KPiBSZW9yZGVy
ZWQgU29CIHRhZ3MgdG8gbWFrZSBzdXJlIHRoZXkgYXBwZWFyIGJlZm9yZSBSYiBhbmQgQWNrZWQg
dGFncy4KClRoaXMgaXMgbm90IHJlcXVpcmVkLiBUaGUgaW1wb3J0YW5jZSBpcyBvbmx5IHRoZSBv
cmRlciBvZiBTb0JzCnRoZW1zZWx2ZXMuIElmIHRoZXkgYXJlIGludGVybGVhdmVkIHdpdGggb3Ro
ZXIgdGFncywgaXQncyBmaW5lLgoKLi4uCgoKSG9wZWZ1bGx5IHRvIHNlZSB0aGlzIHNlcmllcyBi
ZWluZyBldmVudHVhbGx5IGFwcGxpZWQgc29vbi4KQXJuZD8gKERvIHdlIGhhdmUgYWxsIG5lY2Vz
c2FyeSBzdWJzeXN0ZW0gbWFpbnRhaW5lcnMnIHRhZ3MsIGJ0dz8pCgoKLS0gCldpdGggQmVzdCBS
ZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
