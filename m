Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCCEC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Nov 2023 10:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LTtYMIJs4oCxbFdDPOC6yz2scMpPh/xzZ6jzy4iEm+4=; b=GCZ+DQufXoyY9t
	JAbHbTp8qBX/KHC9MJPuER7ox5Cyk4cBBq5SwjFGnYoQj52ReSide5SlsMBxGigfCZz7NY+W7xFCz
	YSv0vu5UYD/FSAquDJQGMlbrmKkHbmiabxa0I3FPKTtj4rFGGbdbAXm4NpMJtTjenHpNNksXyeJr2
	LdbO4z26duUU9NtUn5zykfbtPo7bJ8gGz4/1pVX567aM6arYGLK2ZWcQlwLiNGkaZaKZAyj48sCvF
	0cSPWnHhg5bKX8W/kqQ5cBmm3NV7omq7GbLMRgXZYhGM97s/OFEq0EMg04jjmHi6igFuXsS2uhlDD
	nY64o3ohaaJDb99ob+uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Tqd-00DcfF-11;
	Mon, 13 Nov 2023 10:07:15 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2TqZ-00DcdS-1X;
	Mon, 13 Nov 2023 10:07:12 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-52bd9ddb741so6544832a12.0;
        Mon, 13 Nov 2023 02:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699870023; x=1700474823; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a1UVNwz3drUtlCcbwnzq+CFMoiQbpRGCy5kRE6bKE8o=;
        b=GhVPhX2XoxVPfzpeybLW0YU1k7GUSfjYIyrcRFK2QUuvKlEk+ih6XvQN6KiYDjIhmb
         k9hsLdFfhQ27PilIFv9t0qhRy6ZP3CrxnFxLmUIXd4zrX/Meg9ZmV1h0qpW/JPnkGJt6
         OSoW7AyhO7LdafNzDOn7X26EQVVRYzgegSJtIR/czYxX69ysk6bTXjMCXPv82eNBjcVZ
         Z1Gt6JhJt/+IuD32yFjA2cYx2r9U5041RgC0svb9XYJXutia/FbUm2qEPSDFflB4LruS
         MQv2ApB5J244qzQKdZE2D21Fs1nDj3XcrrQZZW0ztCHLS+tGtKlhortdI4IWsZonF/uT
         q30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699870023; x=1700474823;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a1UVNwz3drUtlCcbwnzq+CFMoiQbpRGCy5kRE6bKE8o=;
        b=gFteyt8B/uiJcjCJnA9R7nCWp7ckOcT8WKlpAZlnstMxrrccOU5JmLMBZ3qn+yScyK
         aUO9EhuSblj5F/bxu0cq8DMDSFFwOW2+Xo7liQiRr5GOWyt6TNOXYM2nObxg3P1TsBFJ
         m7XD2qaHg2gMqsarXiLcmms6tsmWN906eiWvGCu6j1xhCz4YrUpGP2Iinj3DDkSXkPg4
         m3jz7g88L4jURSEhswnB4OS8MOcUOjp9qnEjAtPf/QZwsnPR9XLjQ+Zh0pcDRsnIBiQo
         K9I5ApZ6jUN7yEFaQ92RITXKZBcVZRj+jTewzX913KyuzjQ9I4qwP7ZUp6eusJnKtCdI
         TEwA==
X-Gm-Message-State: AOJu0YxQ7rZXl+YSAaaFbU6vabXayjQJNhiX9mBGIlIw7Z1nHSwmnC72
	BWN74t9Y0OQwjBRjFTP0jok=
X-Google-Smtp-Source: AGHT+IGyrROtTFxyW749aHe9+Qh+zqYm6ESaHF42cs0Vlkcr6OoBfx4smMeCzi+Q7xnXlEg7ryaVeQ==
X-Received: by 2002:a17:906:7ad5:b0:9dd:64ca:dc69 with SMTP id k21-20020a1709067ad500b009dd64cadc69mr3930534ejo.1.1699870023492;
        Mon, 13 Nov 2023 02:07:03 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ga23-20020a170906b85700b009ae587ce128sm3761920ejb.216.2023.11.13.02.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 02:07:03 -0800 (PST)
Message-ID: <fcfdc6f05926db494ea0105e5523cc21ecfdf4e7.camel@gmail.com>
Subject: Re: [PATCH v3 14/42] power: reset: Add a driver for the ep93xx reset
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, nikita.shubin@maquefel.me
Cc: Hartley Sweeten <hsweeten@visionengravers.com>, Lennert Buytenhek
 <kernel@wantstofly.org>, Russell King <linux@armlinux.org.uk>, Lukasz
 Majewski <lukma@denx.de>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>,  Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>,  Thomas Gleixner <tglx@linutronix.de>,
 Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
  Guenter Roeck <linux@roeck-us.net>, Sebastian Reichel <sre@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Mark
 Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Damien Le Moal <dlemoal@kernel.org>, Sergey
 Shtylyov <s.shtylyov@omp.ru>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Liam Girdwood <lgirdwood@gmail.com>,  Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Michael Peters
 <mpeters@embeddedts.com>, Kris Bahnsen <kris@embeddedts.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 netdev@vger.kernel.org,  dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org,  linux-ide@vger.kernel.org,
 linux-input@vger.kernel.org,  alsa-devel@alsa-project.org
Date: Mon, 13 Nov 2023 11:07:01 +0100
In-Reply-To: <ZLq0Z0QgBdCoDpV+@smile.fi.intel.com>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
	 <20230605-ep93xx-v3-14-3d63a5f1103e@maquefel.me>
	 <ZLq0Z0QgBdCoDpV+@smile.fi.intel.com>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_020711_518592_629D4C50 
X-CRM114-Status: GOOD (  12.84  )
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

SGkgQW5keSEKCk9uIEZyaSwgMjAyMy0wNy0yMSBhdCAxOTozNyArMDMwMCwgQW5keSBTaGV2Y2hl
bmtvIHdyb3RlOgo+ID4gK8KgwqDCoMKgwqDCoMKgLyogSXNzdWUgdGhlIHJlYm9vdCAqLwogICAg
ICAgICAgICBeXl5eXl5eXl5eXl5eXl5eXl5eXl5eClRoaXMgaXMgdGhlIHJlbGV2YW50IGNvbW1l
bnQsIG9uZSBjYW4gZXh0ZW5kIGl0LCBidXQgbG9va3MgYWxyZWFkeSBxdWl0ZQppbmZvcm1hdGl2
ZSBjb25zaWRlcmluZyBFUDkzWFhfU1lTQ09OX0RFVkNGR19TV1JTVCByZWdpc3RlciBuYW1lLgoK
QnV0IE5pa2l0YSB3b3VsZCBiZSBhYmxlIHRvIGluY2x1ZGUgbW9yZSB2ZXJib3NlIGNvbW1lbnQg
aWYKeW91J2QgaGF2ZSBhIHN1Z2dlc3Rpb24uCgo+ID4gK8KgwqDCoMKgwqDCoMKgZXA5M3h4X2Rl
dmNmZ19zZXRfY2xlYXIocHJpdi0+bWFwLCBFUDkzWFhfU1lTQ09OX0RFVkNGR19TV1JTVCwgMHgw
MCk7Cj4gPiArwqDCoMKgwqDCoMKgwqBlcDkzeHhfZGV2Y2ZnX3NldF9jbGVhcihwcml2LT5tYXAs
IDB4MDAsIEVQOTNYWF9TWVNDT05fREVWQ0ZHX1NXUlNUKTsKPiAKPiAKPiA+ICvCoMKgwqDCoMKg
wqDCoG1kZWxheSgxMDAwKTsKPiAKPiBBdG9taWM/ISBTdWNoIGEgaHVnZSBkZWxheSBtdXN0IGJl
IGV4cGxhaW5lZCwgZXNwLiB3aHkgaXQncyBhdG9taWMuCgotLSAKQWxleGFuZGVyIFN2ZXJkbGlu
LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
