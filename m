Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5E1C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Nov 2023 10:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZDKYw4uQ/sVqke7+/dkQIMu15IG/GZzk4hfnjF6LP60=; b=2PR6hAu2b1iW34
	Fa60M6lbWe91NUwh2sAtMtHnjgPYQwMDzREyVq90s1xZm+hOSQuOSpprpiMw1mPY4ceqnAVly2dYO
	LzhTzBzcGxigBKMVdNL0GsrC3vIWMpJdPtszRbuOfkkYcNbvC0erka5LJyGgUshRYPVIQgZwg1DrK
	Am4M1GV7CW+2tpMy5mvejxBtQRIJff6Cod83kKETWC/prmyl+NVz+13olzc5CADBOz776Trh9JpqE
	KQXC9PBG2O3pGnFaM02HnmGxYbV0LaZCXUyfokdAf9O/aov0CWeyyGYvSplULJesTqkp3eLANMl//
	fRZbTcnYhRGnJb/Khpew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ToJ-00DcOB-1z;
	Mon, 13 Nov 2023 10:04:51 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ToG-00DcN0-1r;
	Mon, 13 Nov 2023 10:04:49 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c6cb4a79deso46807491fa.1;
        Mon, 13 Nov 2023 02:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699869885; x=1700474685; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wYZtbNfscHtuB7ayNjS/FaQpaEtL1M0UhXyvKDUhQKc=;
        b=hP2XMa02IWD3IB44/WSA3iQhcdgb5/0h/rcyqvKAD3yuR4JS6PeemvDM3b5q4OyH93
         aPo2GRDHHXUzApMt3aFBkhIvA6MA5IauxwLd0Gpj5FDhC2GCHk/ztwJ1Ms/UiF1uwbYA
         T/QHCarympGO6S+HjlBE5mydTkLBeg3Iz40+B8P+ovvuawCV+vyJAt+IOgMEm49Prwdx
         sGFAIox5rjq6fl7ynz/ue/Z3wbm8bsRPLHhYNmStNywq0yIFRb7xxweB4K8KxhqeGM6A
         MHgj9GHTRQcP1cofq27Z3lfWtg4THgJmetmj7FIFRZEgE7g7nxQKYZmmJKqgiz2fYRLz
         sA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699869885; x=1700474685;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wYZtbNfscHtuB7ayNjS/FaQpaEtL1M0UhXyvKDUhQKc=;
        b=bL+L4KhejH+Xf1C3XYJLrDO8mr5NRbedXtJ09GB31VIKlTjSOa703cvE1D2POqfsWH
         5OobVqtuxFjADEFsnGalRueVGRu4b34u6CAsHxhGgt1wd2bZ7d4g5VQf+fQolJ5UPShz
         FlK2XoNiCnkyGnFYVOVTy3PDc7gGS/UpobjS5Di5yNCm0/h/SpHX76J9Uju9ovmzz47B
         gxkFFfQrbASVuF9yiGm4IiFXZwKEn3+rUfXEmfxklEWTIx7r/fkM0RIYVZy+PDEMKJB3
         r9aCYuIWHM6/mEzw58hbBZW2SXvXFvmQjhJqDk0gBcarBX7bVWduOVDRFwSbhqp0Hdi2
         k3hw==
X-Gm-Message-State: AOJu0YzIWjiu+JrDcWv8meXfpOPXITKWkRXEVPHQaaEh1R5X/DYTRKwu
	qYeo4YlgPKR7Di9iX+y8aqIp3itiOkfVXw==
X-Google-Smtp-Source: AGHT+IFY0VBv65sXA0Ec0khQRe36/4QIzik1qErLOvxwk7VCfLMt8d6A4Y8Yy/Esbvbw7QCTYBejoA==
X-Received: by 2002:a05:6402:520b:b0:543:5144:1779 with SMTP id s11-20020a056402520b00b0054351441779mr8907514edd.11.1699869864130;
        Mon, 13 Nov 2023 02:04:24 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a67-20020a509ec9000000b0053e43492ef1sm3514675edf.65.2023.11.13.02.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 02:04:23 -0800 (PST)
Message-ID: <0cf1d748cb4a672483991f44d638a271218effe6.camel@gmail.com>
Subject: Re: [PATCH v3 14/42] power: reset: Add a driver for the ep93xx reset
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, nikita.shubin@maquefel.me, Hartley
 Sweeten <hsweeten@visionengravers.com>, Lennert Buytenhek
 <kernel@wantstofly.org>, Russell King <linux@armlinux.org.uk>, Lukasz
 Majewski <lukma@denx.de>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Sebastian
 Reichel <sre@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Uwe
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
Date: Mon, 13 Nov 2023 11:04:21 +0100
In-Reply-To: <CAHp75VeYHscM-r94kTrpH44W=OGVq+qoNNQZoVrR5_n-_K_Xsw@mail.gmail.com>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
	 <20230605-ep93xx-v3-14-3d63a5f1103e@maquefel.me>
	 <ZLq0Z0QgBdCoDpV+@smile.fi.intel.com>
	 <80ed91bb971516638fa1793d648939815eba7630.camel@gmail.com>
	 <CAHp75VeYHscM-r94kTrpH44W=OGVq+qoNNQZoVrR5_n-_K_Xsw@mail.gmail.com>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_020448_612768_1748ED06 
X-CRM114-Status: GOOD (  16.82  )
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

SGkgQW5keSEKCk9uIE1vbiwgMjAyMy0xMS0xMyBhdCAxMTo1OSArMDIwMCwgQW5keSBTaGV2Y2hl
bmtvIHdyb3RlOgo+IE9uIFNhdCwgTm92IDExLCAyMDIzIGF0IDg6MTjigK9QTSBBbGV4YW5kZXIg
U3ZlcmRsaW4KPiA8YWxleGFuZGVyLnN2ZXJkbGluQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiBPbiBG
cmksIDIwMjMtMDctMjEgYXQgMTk6MzcgKzAzMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToKPiAK
PiAuLi4KClsxXQoKPiAKPiA+ID4gPiArwqDCoMKgwqDCoMKgIG1kZWxheSgxMDAwKTsKPiA+ID4g
Cj4gPiA+IEF0b21pYz8hIFN1Y2ggYSBodWdlIGRlbGF5IG11c3QgYmUgZXhwbGFpbmVkLCBlc3Au
IHdoeSBpdCdzIGF0b21pYy4KPiA+IAo+ID4gYXRvbWljIG9yIG5vdCwgU29DIGlzIHN1cHBvc2Vk
IHRvIHJlc2V0IGl0c2VsZiBoZXJlLgo+ID4gSG93ZXZlciB0aGVyZSBpcyBhbiBlcnJhdGEgWzFd
IGFuZCB0aGUgU29DIGNhbiBsb2NrdXAgaW5zdGVhZC4KPiAKPiBHb29kLCBhbmQgd2hhdCBJJ20g
c2F5aW5nIGlzIHRoYXQgdGhpcyBwaWVjZSBvZiBjb2RlIG11c3QgaGF2ZSBhCj4gY29tbWVudCBl
eHBsYWluaW5nIHRoaXMuCgpBbmQgaXQgaGFzLCBidXQgZm9yIHNvbWUgcmVhc29uIHlvdSd2ZSB0
cmltbWVkIGl0IGluIHlvdXIgcmVwbHkuLi4KCi0tIApBbGV4YW5kZXIgU3ZlcmRsaW4uCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
