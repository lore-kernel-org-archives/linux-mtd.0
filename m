Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114B3C4332F
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Nov 2023 18:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Js5X7mpMWvMvtAAk0Bp/CLEZbUwC8EJVdxJrO7iCAS4=; b=bGkU1SYMQMoWOS
	6oDUQGSMkD+hHSM3DsEtKM8XA0y91A0on4+XCfJvnHh6X+QLOPqwh29WRiIqGSXwUyqoBtDaTdRDO
	NZGBdLDw+i2l67w38gkUIZms7YV+HzBSuJQEJhtv93eXcX5VjDQf1PInXbgct5nUNV1vnBkP+KueL
	X8FcNU3/KXeoJ1UTRSW3SrsQLbw+MLh8gqCShSFff3S3f+yUZ8fwzj/V96WJYQ1H7U5QX3P20JdUt
	cH10U2a2aowA/6IfAQ6/XoU0EFSj4swL5u1QiP6cYOroM3rhSSc+Y+TO5wNWq/ZfSWnUPZW9J8tX1
	JssKgZG9GdDr9Mtk2Dzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1sZ5-00BF9a-2g;
	Sat, 11 Nov 2023 18:18:39 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1sZ0-00BF8v-2z;
	Sat, 11 Nov 2023 18:18:36 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-507a3b8b113so4182278e87.0;
        Sat, 11 Nov 2023 10:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699726712; x=1700331512; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Os4KBIFKBrhxCNe2iV6sYOSUCifSAC9wTubOo6x2YGA=;
        b=EcdaxyCexdbgOohP2t4OjnU193qVktRtXRIScFXjiV2piyB7+a4QL+OCWAIDmuu4hd
         THC70obrkI2VnLcmhydTXO/+GewKbAnYkamFu2Li0Fxio9Z8ulfVIojv8/6YMtpZ9LTy
         lOczn4QTSh3LX7Kd20h1j627Zm8hSPLfgLGP5GlFm/81xxQjs4K3d0t683JjZSO3c2vU
         yS3mn+9ztwRGDjfTMNnmU2NnLbh0xFc+vowMFI9VG9R1XFTzSDWUMfoaV2f/JM81Fp3y
         NhPUY6MKJ8YzJJYHOVT9jm10jx9/hXDj3pb9qwbPtVSf60NYCVIIL37BMd86FgOCRfj5
         JJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699726712; x=1700331512;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Os4KBIFKBrhxCNe2iV6sYOSUCifSAC9wTubOo6x2YGA=;
        b=T1AkCBYYmWeBhTpN4VaDSTEIINUbvQXdB957DpE2wZvkkhpsZN3EDNs7aeyu7Y04st
         XQnGPkz0KN2Ztk9469zA+vEe3ThN9B/cQU+DjcHVmSSDfXnWgMBHjblDjCNCvv/unhtF
         oO84EBXxT4nViz8GBaYnQ/ivhyERNa/LeXAFLO8lxL/cNifyfke9yU52oYCfamI6vqs9
         G32X2ckiYcCPiNUnPiSiiQfFBjXcld3HYgDmMQyBOTkq2AN7M43A30b5i1hR/raxXWM6
         jQpkBCtRI70zPo5drH+nsVHqQE6DidVkJuwNkIFc1XKEUkZ+k4UP5dnT0l98j5pm1pOc
         TxqQ==
X-Gm-Message-State: AOJu0Yziy2PXVApthSl56aLKoAPvN3SU4hP22paj24bxcUt1w8HlYptl
	8tdvh+0xMmYbJr4qcgZlLfY=
X-Google-Smtp-Source: AGHT+IGWSLvEEWKMjKSkylq9sGZ0KV/8c86kVFIgYc1m0RkjmWY37s2qpjH05vtA3bG5UrjESvvwcA==
X-Received: by 2002:a05:6512:2399:b0:500:be57:ce53 with SMTP id c25-20020a056512239900b00500be57ce53mr2275395lfv.42.1699726711568;
        Sat, 11 Nov 2023 10:18:31 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id n20-20020a170906b31400b009e656ce2930sm1403421ejz.60.2023.11.11.10.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 10:18:30 -0800 (PST)
Message-ID: <80ed91bb971516638fa1793d648939815eba7630.camel@gmail.com>
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
Date: Sat, 11 Nov 2023 19:18:28 +0100
In-Reply-To: <ZLq0Z0QgBdCoDpV+@smile.fi.intel.com>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
	 <20230605-ep93xx-v3-14-3d63a5f1103e@maquefel.me>
	 <ZLq0Z0QgBdCoDpV+@smile.fi.intel.com>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_101834_986771_3C4CC7C1 
X-CRM114-Status: GOOD (  13.72  )
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

SGkgQW5keSwKCk9uIEZyaSwgMjAyMy0wNy0yMSBhdCAxOTozNyArMDMwMCwgQW5keSBTaGV2Y2hl
bmtvIHdyb3RlOgo+ID4gK8KgwqDCoMKgwqDCoMKgLyogSXNzdWUgdGhlIHJlYm9vdCAqLwo+ID4g
K8KgwqDCoMKgwqDCoMKgZXA5M3h4X2RldmNmZ19zZXRfY2xlYXIocHJpdi0+bWFwLCBFUDkzWFhf
U1lTQ09OX0RFVkNGR19TV1JTVCwgMHgwMCk7Cj4gPiArwqDCoMKgwqDCoMKgwqBlcDkzeHhfZGV2
Y2ZnX3NldF9jbGVhcihwcml2LT5tYXAsIDB4MDAsIEVQOTNYWF9TWVNDT05fREVWQ0ZHX1NXUlNU
KTsKPiAKPiAKPiA+ICvCoMKgwqDCoMKgwqDCoG1kZWxheSgxMDAwKTsKPiAKPiBBdG9taWM/ISBT
dWNoIGEgaHVnZSBkZWxheSBtdXN0IGJlIGV4cGxhaW5lZCwgZXNwLiB3aHkgaXQncyBhdG9taWMu
CgphdG9taWMgb3Igbm90LCBTb0MgaXMgc3VwcG9zZWQgdG8gcmVzZXQgaXRzZWxmIGhlcmUuCkhv
d2V2ZXIgdGhlcmUgaXMgYW4gZXJyYXRhIFsxXSBhbmQgdGhlIFNvQyBjYW4gbG9ja3VwIGluc3Rl
YWQuClNvIGV2ZW4gcHJfZW1lcmcoKSBtYWtlcyBzZW5zZSB0byBtZS4KCj4gPiArwqDCoMKgwqDC
oMKgwqBwcl9lbWVyZygiVW5hYmxlIHRvIHJlc3RhcnQgc3lzdGVtXG4iKTsKPiA+ICvCoMKgwqDC
oMKgwqDCoHJldHVybiBOT1RJRllfRE9ORTsKClsxXSBodHRwOi8vd2ViLmFyY2hpdmUub3JnL3dl
Yi8yMDE2MTEzMDIzMDcyNy9odHRwOi8vd3d3LmNpcnJ1cy5jb20vZW4vcHVicy9hcHBOb3RlL0FO
MjU4UkVWMi5wZGYKCi0tIApBbGV4YW5kZXIgU3ZlcmRsaW4uCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
