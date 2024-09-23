Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28EECF9C5B
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2024 09:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IhikpamsVD/FBXg+E/pOJYeU2PCouhun+f5WOHolI/s=; b=iH17IL3Xgy0bop
	Z2mnOtt7Ww2Sf+VZ9rLaRNn+HY65nspXPPnWUDIQDvMeugRYVlIQkC59ZcowuZSqYKLXuePjoCU40
	Q1O9xbyEGrwOy/K/D5N1G8At1URweVUl1Dwg2AqMxBJVK2ibsNRD7+MhwDvMCZWat3SSGclhfUOGH
	P+o6MBXV7vAO2FZV/01C+eLA+2C/LXX/RvCQI4PbmcHbtd4MtEJMNJvrg8Ce2KjRUE496bltGg4+o
	RNQgZbijQrwYTYayKUbANeTHuM7Y4Rnf3kkeViFzJ4U+Tb/yptUBf7If8Nbq0lcEFiQh5Kse9sFcK
	nGKHPVRyvCcvdN7pvrEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfNK-0000000GpVe-367f;
	Mon, 23 Sep 2024 09:28:58 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfMV-0000000GpJV-3pPU
	for linux-mtd@lists.infradead.org;
	Mon, 23 Sep 2024 09:28:09 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-53659867cbdso5576352e87.3
        for <linux-mtd@lists.infradead.org>; Mon, 23 Sep 2024 02:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727083686; x=1727688486; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2H3lLogo29T09ZIg4O5267APGx1T56CgiRzH2uFGiY=;
        b=avgLbZ3Wp4uLaX8+xGN9lJ3uFAArDamsFBcnsVM7USUrp270M1u8c1DbdF8gbNKslk
         ycec/1I/ilyuzdBZgAx6tS0g/F7d1+4A2UYbaCRqeO0Jod2suyp6RDM9g99ZHU9jnoPU
         MiwkAdSSQJ9QlD4Txwd/oWfKY94BqBy73Gl3Hix3v+qjzBlIdL2/MSuXqgr4GQeMSCbA
         nc+vPE8OFDAwiZNuoxoFR+moj6OocKR3i3a9D+h0djG0jj3WNpzScE0szQ3Bg2Fc0H0U
         +m2vXj6tBrnRUiCZi1T/eGQcWO9JQXvtL5wPDJ+971O7QQnJ0eZy5+jOmWjM7ZGQkebM
         dtBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727083686; x=1727688486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2H3lLogo29T09ZIg4O5267APGx1T56CgiRzH2uFGiY=;
        b=XjpCMJHhUTV/8zjRZk0y8huw/BPcKrMLNGPOxpRoz6AyIsSIRFQI9Mg9VCNHfHNA5F
         vzURYLQeC3arohb/XzBWeZc+/cfqx9YNIn6bTJwJ16X6y53bHFf0JmmrGH9DRN1IGhlr
         XodCDbpzeYv2b0kJ2WQ1z98dsKS88SXO/cqZ6eJqL6XR0Jig6sgeFd3P02wdJ0jRN5hc
         LrlOTRmJIuJqlprAonVSGaYCsYUPz/w/8lWRkvHdXW5v0jy0pQkx5p4phKfsyGO6UMvU
         QeP0GDFrTngFFxVg/iAmjn+31OCbTTCDB5CAoFPSMgKjfh7/FKdAWs1lPHtw+dCzRRRE
         00sg==
X-Forwarded-Encrypted: i=1; AJvYcCUk3HswmEBiJCIBKVdC7gXk1v8PTKPqswqn2nSZ37OKCgZEotInosJNV0biDhff+uPHmCfdhmdhVCM=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe8YeCg0AYGsoA0CrPywDrr+uWjvvLWCxHZlRCOprclG//wadj
	dwbP4opPgI69XWFUXSPv703y1tQRThXE5Q889DcXal8EvIjK++Lt+x6mDqPuov0GjAbAgNjYeDA
	BERuw05h5u3kWBaCi4jKEffhYPczBGnNAm8LpFw==
X-Google-Smtp-Source: AGHT+IFqcb5VcpmKktw95t64Q/tONZlUY5uMG8agXKVRR1VFK+H/O2baR3jHivWHjY41tZ/ZQZoJrQNpCocxjyIuWM4=
X-Received: by 2002:ac2:4c4d:0:b0:533:45c9:67fe with SMTP id
 2adb3069b0e04-536ac32ef59mr6887747e87.48.1727083685755; Mon, 23 Sep 2024
 02:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240909-ep93xx-v12-0-e86ab2423d4b@maquefel.me>
 <CAHp75Veusv=f6Xf9-gL3ctoO5Njn7wiWMw-aMN45KbZ=YB=mQw@mail.gmail.com>
 <0e3902c9a42b05b0227e767b227624c6fe8fd2bb.camel@maquefel.me> <cff6b9b6-6ede-435a-9271-829fde82550d@app.fastmail.com>
In-Reply-To: <cff6b9b6-6ede-435a-9271-829fde82550d@app.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 23 Sep 2024 11:27:54 +0200
Message-ID: <CACRpkda7Kef-buHQ3ou3q_xq+OD9-cONh1Ynu-KjvQf=Qx5S_Q@mail.gmail.com>
Subject: Re: [PATCH v12 00/38] ep93xx device tree conversion
To: Arnd Bergmann <arnd@arndb.de>
Cc: Nikita Shubin <nikita.shubin@maquefel.me>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Hartley Sweeten <hsweeten@visionengravers.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Lukasz Majewski <lukma@denx.de>, Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
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
X-CRM114-CacheID: sfid-20240923_022807_988960_8E9904F5 
X-CRM114-Status: GOOD (  16.02  )
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

T24gV2VkLCBTZXAgMTEsIDIwMjQgYXQgNToxM+KAr1BNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+IHdyb3RlOgoKPiBJJ3ZlIG1lcmdlZCB0aGUgc2VyaWVzIGludG8gdGhlIGZvci1uZXh0
IGJyYW5jaCBvZiB0aGUgYXJtLXNvYwo+IHRyZWUgbm93LiBUaGUgdGltaW5nIGlzbid0IGdyZWF0
IGFzIEkgd2FzIHN0aWxsIHdhaXRpbmcgZm9yCj4gdGhhdCBmaW5hbCBBY2ssIGJ1dCBpdCBzZWVt
IGJldHRlciB0byBoYXZlIGl0IGRvbmUgdGhhbiB0byBrZWVwCj4gcmVzcGlubmluZyB0aGUgc2Vy
aWVzLgo+Cj4gSSB3b24ndCBzZW5kIGl0IHdpdGggdGhlIGluaXRpYWwgcHVsbCByZXF1ZXN0cyB0
aGlzIHdlZWsKPiBidXQgaG9wZSB0byBzZW5kIHRoaXMgb25lIG9uY2UgSSBnZXQgYmVjayBmcm9t
IExQQywgcHJvdmlkZWQKPiB0aGVyZSBhcmUgbm8gc3VycHJpc2VzIHRoYXQgcmVxdWlyZSBhIHJl
YmFzZS4KClRoYW5rcyBmb3IgcGlja2luZyBpdCB1cCEgVGhpcyBpcyBhIGxvbmcgYXdhaXRlZCBw
YXRjaCBzZXQuCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
