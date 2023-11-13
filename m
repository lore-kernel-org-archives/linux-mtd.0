Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B7CC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Nov 2023 10:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VlSJ4tTikqqvRey79U+mtd37QjftRiRvXnG59eEO5a8=; b=kmQfCtBKEXO29y
	V2N75xD5NTUxseOa5OL7bDluET0psyEr7cRE2qE25bszm6fnvi9bId1raakIkvHeY12OEhyMoowss
	pTANsRMmyeDX769FIqP26/JARxkiXIozqAsbRR7vu7ch2AFnKV3o79BC3hGAcBL4kP5joxOIFns6p
	sdO4mXN5bwtpcsfIGeH7Uaq88AiuQdYlmyEi2MpIA2D6dzsr3BKgJMmLQAVk+Ji5p2t62HxRpBhIH
	lQvKJyjL8R5+5mgu4oXvp1ed/5wBa9fTa+Jq3RTG1uJqhRzOgv4JKlCY47xsR6Tq2/V665jcFK+18
	w38c38QmWwpHkHW0kqpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2U6T-00DeC9-14;
	Mon, 13 Nov 2023 10:23:37 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2U6P-00DeBQ-1z;
	Mon, 13 Nov 2023 10:23:34 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5bf58204b7aso43934617b3.3;
        Mon, 13 Nov 2023 02:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699871012; x=1700475812; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISelrhUz+tUwTPOpVjAn5G1ABI4YmRZvCmOYJcKmy7Q=;
        b=U7mdd5Vl1OQCC9bu2N+vLbw6H6NybseA4p+zCdOISqOHgdOxoDSia7cavjwDs3ta+q
         779juJdNoh9JE6PDABCPPY0UvzLbOREE6WiAHuzrDKA+T2oBlTYbtAiww+xPVTGALi3y
         iz+Kk6sKcEReNYLHys051MuvAHkYMCZTFP8ObCbReJt/+E7Wlx7AIR6saRIZs1UbdfCG
         fbdE261Iv42wGARZx5R/Y+NJ1sqwUx0X8rrMoKJ/q5YArskMXpe0Jfgy5bIF5C2IDuTS
         aB0f+JmBJWbm1aZMLKiYoLvpJ92fAnEleWNeTqMCQpj4xm5vgj4b4tWfEJVxT1ooSqDO
         ml/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699871012; x=1700475812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISelrhUz+tUwTPOpVjAn5G1ABI4YmRZvCmOYJcKmy7Q=;
        b=Aqwl4Pjv0O9NZba4sirWjxgVr9xI5FRJyGJPk47TKklz6sp0YC2grgQCDfU0g6H0ta
         I11GC/t2yij7L1FMUw8D5XtIbXJfmAAhzizV6Qz+6qZ0izGzOurGGx/Okh6do17Plum+
         FNL2Ma7DlO0UzS0jCr/TPL1aYedR8rAQRo4mJCjX6SJlrfbBzpibqamn+e+8QAHktF0W
         9y7aaaWlqiXQZ58asF6tipojrLjN5pEHxj10ez3APRFMPb6+INaCnmBCXRYUpZDP/tSO
         SoOEbpcfd/OTTYgZK/wzdLfqD9H+a10hj0tNcCSGb+Iyo99YrWtYD48xLJ+KUDl31vR9
         KoiQ==
X-Gm-Message-State: AOJu0YyVnfmS7WXgi9z/rrxIrQl6Nv+bpI+oBeBGUzK95OeDwa5C9UYI
	nWYtuTYpEYKgP5I3aid2G3nC7Vj0f3xiFQEzKMg=
X-Google-Smtp-Source: AGHT+IGeFMq6OPRYVFpLBqn7U8F7RLctOzbaeZinyDCceNJQA9yzq0afSM1d3lxBYSz248sE7pBipt1geSP2uWLF31w=
X-Received: by 2002:a81:4782:0:b0:5a7:a817:be43 with SMTP id
 u124-20020a814782000000b005a7a817be43mr6070415ywa.6.1699871011907; Mon, 13
 Nov 2023 02:23:31 -0800 (PST)
MIME-Version: 1.0
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-14-3d63a5f1103e@maquefel.me> <ZLq0Z0QgBdCoDpV+@smile.fi.intel.com>
 <fcfdc6f05926db494ea0105e5523cc21ecfdf4e7.camel@gmail.com>
In-Reply-To: <fcfdc6f05926db494ea0105e5523cc21ecfdf4e7.camel@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Nov 2023 12:22:56 +0200
Message-ID: <CAHp75VcsF8GtmE2iDf2xPWi7U5WXhi1ZFUSeA_Y+TfHQn72Jrg@mail.gmail.com>
Subject: Re: [PATCH v3 14/42] power: reset: Add a driver for the ep93xx reset
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, nikita.shubin@maquefel.me, 
	Hartley Sweeten <hsweeten@visionengravers.com>, Lennert Buytenhek <kernel@wantstofly.org>, 
	Russell King <linux@armlinux.org.uk>, Lukasz Majewski <lukma@denx.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Sebastian Reichel <sre@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Mark Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vinod Koul <vkoul@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Sergey Shtylyov <s.shtylyov@omp.ru>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Michael Peters <mpeters@embeddedts.com>, Kris Bahnsen <kris@embeddedts.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org, netdev@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-ide@vger.kernel.org, linux-input@vger.kernel.org, 
	alsa-devel@alsa-project.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_022333_676239_86770BDA 
X-CRM114-Status: GOOD (  15.68  )
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

T24gTW9uLCBOb3YgMTMsIDIwMjMgYXQgMTI6MDfigK9QTSBBbGV4YW5kZXIgU3ZlcmRsaW4KPGFs
ZXhhbmRlci5zdmVyZGxpbkBnbWFpbC5jb20+IHdyb3RlOgo+IE9uIEZyaSwgMjAyMy0wNy0yMSBh
dCAxOTozNyArMDMwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+ID4gPiArICAgICAgIC8qIElz
c3VlIHRoZSByZWJvb3QgKi8KPiAgICAgICAgICAgICBeXl5eXl5eXl5eXl5eXl5eXl5eXl5eCj4g
VGhpcyBpcyB0aGUgcmVsZXZhbnQgY29tbWVudCwgb25lIGNhbiBleHRlbmQgaXQsIGJ1dCBsb29r
cyBhbHJlYWR5IHF1aXRlCj4gaW5mb3JtYXRpdmUgY29uc2lkZXJpbmcgRVA5M1hYX1NZU0NPTl9E
RVZDRkdfU1dSU1QgcmVnaXN0ZXIgbmFtZS4KClRoaXMgZG9lcyBub3QgZXhwbGFpbiB0aGUgbmVj
ZXNzaXR5IG9mIHRoZSBtZGVsYXkoKSBiZWxvdy4KCj4gQnV0IE5pa2l0YSB3b3VsZCBiZSBhYmxl
IHRvIGluY2x1ZGUgbW9yZSB2ZXJib3NlIGNvbW1lbnQgaWYKPiB5b3UnZCBoYXZlIGEgc3VnZ2Vz
dGlvbi4KClBsZWFzZSxhZGQgb25lLgoKPiA+ID4gKyAgICAgICBlcDkzeHhfZGV2Y2ZnX3NldF9j
bGVhcihwcml2LT5tYXAsIEVQOTNYWF9TWVNDT05fREVWQ0ZHX1NXUlNULCAweDAwKTsKPiA+ID4g
KyAgICAgICBlcDkzeHhfZGV2Y2ZnX3NldF9jbGVhcihwcml2LT5tYXAsIDB4MDAsIEVQOTNYWF9T
WVNDT05fREVWQ0ZHX1NXUlNUKTsKPiA+Cj4gPgo+ID4gPiArICAgICAgIG1kZWxheSgxMDAwKTsK
PiA+Cj4gPiBBdG9taWM/ISBTdWNoIGEgaHVnZSBkZWxheSBtdXN0IGJlIGV4cGxhaW5lZCwgZXNw
LiB3aHkgaXQncyBhdG9taWMuCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5r
bwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
