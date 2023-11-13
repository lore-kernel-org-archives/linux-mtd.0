Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF33BC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Nov 2023 10:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rlcf1LrPKkY+DpUkaYrmk9BUf2EZv6iYB8oj92vCov4=; b=fjftpeU5QSzoDv
	7Zb787fmnuEiM2BR5mKVlRQjFoe84+sb7yAvG73u+gahr4yh9MqTOt0YKqtjBMDkrjeh6vLBtda5l
	ZQ+gX+tsPYHNDtWSMADK4JN6SM77pz9PL8N66U7MDP21RIQxYQyJgfl8HZfR47pw8xNpOMXyzICkC
	6ViWkMKhuF2n95lLJkqzwcja2YQNxRBPCctqeMCdE+BGEgnny3BE9OcGYvrqquDQS+ccbUPFFSGnZ
	hJzAqm/eUjxA4OJiJP+Bx4+fi4Ga92kcZ49spA/Oql8FJJYdAku2EIpQy0MImq13rWt6tZoAnGEHu
	KzUHekDZvnZ35HhWE7Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2U3e-00Ddms-1q;
	Mon, 13 Nov 2023 10:20:42 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2U3Z-00DdkJ-30;
	Mon, 13 Nov 2023 10:20:39 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-66d87554434so28512256d6.2;
        Mon, 13 Nov 2023 02:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699870832; x=1700475632; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FB3t9eIHw+pKT3CBB8s0t2nQUBpXnYyol/A+bIoemXQ=;
        b=GpcbtJmXAv6iuSRWZQ5ikvsOVi9F35XpkPJeCHnaYGqiUJgyCnq5Xfg1kS3fhKIABY
         RoYrXImkg/MCiNtDuqUT/Hbi5zfBcSn7telsZT9afcTv8oL9Alr4D9ljGt6p5eiTXZ90
         DzSoRnDcZfVy5Akn4HYbCvhYqJ5wJWc9dKylKs46GJZg5mK8j2b8m4zSenPk/A0EeNFd
         le4kCJFWHJaz0Gvuhi0V/g4qdf18r8+seMcNVMc7lVe4W+XJHZYEsrk21V7MJlQMgvFd
         xNFfTxnUxSWyrQhVKRESQ0hxKn7x0L62MN8f7XsNKqh35Kloas382qg10eUZMDEQq3zk
         I6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699870832; x=1700475632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FB3t9eIHw+pKT3CBB8s0t2nQUBpXnYyol/A+bIoemXQ=;
        b=D5J5p/8MqFPMVa+P0UYWgGEQEQ9JjsByxAg5QrZKa0MRuv4Oxgb9RPCduBALV+4xK+
         0GVikLWkflVlpkjLUh9sdpbm2xdLXzFCvDp9jFWWGSRIImjQcXT9LsnpbFTtBy2vBQsN
         WO7xe8XNsY6fnQMUsEs0FvJzeQJVVnP1se6xGfFFY6Oo5NOItFD49HTdyXjAD/Frtzk/
         SpP+IGj8TYcETX3Killy0pNffN3QWf5pb2kUvLtL2Q5wXg7DNUVECP4GrjikdwcJvBE3
         9rFfvcmDsW7G4yPeuYWir9O9mFFT+UrLAlj7DvFrz9sc+WqqdsRH94OS6mN3xGmNgtF8
         9DWA==
X-Gm-Message-State: AOJu0YwCDzMzZXtBbwBpeowTmK8gWUT0RRnCqg8rPNvW00fy4KTewF5Q
	UE3AVFI0CmPRkyfON0e1QgDgxAyXl19UaCBXJkI=
X-Google-Smtp-Source: AGHT+IHcamihKm+ziuVIZapYWw1ITNZRzLvq04tB/x59umIja9AF0bX8BVytW1nYcQa699XIK195qbQ3GDjcnycnRno=
X-Received: by 2002:a05:6214:a90:b0:671:8630:f590 with SMTP id
 ev16-20020a0562140a9000b006718630f590mr5914012qvb.18.1699870832421; Mon, 13
 Nov 2023 02:20:32 -0800 (PST)
MIME-Version: 1.0
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-7-3d63a5f1103e@maquefel.me> <ZLqSo6B5cJXVRJS/@smile.fi.intel.com>
 <c49f77492cacc5a30079720af58a9f2fca761609.camel@gmail.com>
In-Reply-To: <c49f77492cacc5a30079720af58a9f2fca761609.camel@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Nov 2023 12:19:56 +0200
Message-ID: <CAHp75VccVh+M444AAixVzSvM6-FsDm8jDYdakHhNFTAL8WOGMA@mail.gmail.com>
Subject: Re: [PATCH v3 07/42] soc: Add SoC driver for Cirrus ep93xx
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
X-CRM114-CacheID: sfid-20231113_022037_990663_FE9DC11D 
X-CRM114-Status: GOOD (  19.04  )
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

T24gU2F0LCBOb3YgMTEsIDIwMjMgYXQgMTE6MzPigK9QTSBBbGV4YW5kZXIgU3ZlcmRsaW4KPGFs
ZXhhbmRlci5zdmVyZGxpbkBnbWFpbC5jb20+IHdyb3RlOgo+IE9uIEZyaSwgMjAyMy0wNy0yMSBh
dCAxNzoxMyArMDMwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgoKLi4uCgo+ID4gPiArICAgICAg
IHNwaW5fbG9ja19pcnFzYXZlKCZlcDkzeHhfc3dsb2NrLCBmbGFncyk7Cj4gPiA+ICsKPiA+ID4g
KyAgICAgICByZWdtYXBfcmVhZChtYXAsIEVQOTNYWF9TWVNDT05fREVWQ0ZHLCAmdmFsKTsKPiA+
ID4gKyAgICAgICB2YWwgJj0gfmNsZWFyX2JpdHM7Cj4gPiA+ICsgICAgICAgdmFsIHw9IHNldF9i
aXRzOwo+ID4gPiArICAgICAgIHJlZ21hcF93cml0ZShtYXAsIEVQOTNYWF9TWVNDT05fU1dMT0NL
LCBFUDkzWFhfU1dMT0NLX01BR0lDSyk7Cj4gPiA+ICsgICAgICAgcmVnbWFwX3dyaXRlKG1hcCwg
RVA5M1hYX1NZU0NPTl9ERVZDRkcsIHZhbCk7Cj4gPgo+ID4gSXMgdGhpcyBzZXF1ZW5jZSBhIG11
c3Q/Cj4gPiBJLm8udy4gY2FuIHlvdSBmaXJzdCBzdXBwbHkgbWFnaWMgYW5kIHRoZW4gdXBkYXRl
IGRldmNmZz8KPiA+Cj4gPiA+ICsgICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZXA5M3h4
X3N3bG9jaywgZmxhZ3MpOwoKLi4uCgo+ID4gPiArdm9pZCBlcDkzeHhfc3dsb2NrZWRfdXBkYXRl
X2JpdHMoc3RydWN0IHJlZ21hcCAqbWFwLCB1bnNpZ25lZCBpbnQgcmVnLAo+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgbWFzaywgdW5zaWduZWQgaW50
IHZhbCkKCj4gPiBTYW1lIFEgYXMgYWJvdmUuCj4KPiBFUDkzeHggVXNlciBNYW51YWwgWzFdIGhh
cyBtb3N0IHZlcmJvc2UgZGVzY3JpcHRpb24gb2YgU1dMb2NrIGZvciBBREMKPiBibG9jazoKPiAi
V3JpdGluZyAweEFBIHRvIHRoaXMgcmVnaXN0ZXIgd2lsbCB1bmxvY2sgYWxsIGxvY2tlZCByZWdp
c3RlcnMgdW50aWwgdGhlCj4gbmV4dCBibG9jayBhY2Nlc3MuIFRoZSBBUk0gbG9jayBpbnN0cnVj
dGlvbiBwcmVmaXggc2hvdWxkIGJlIHVzZWQgZm9yIHRoZQo+IHR3byBjb25zZXF1dGl2ZSB3cml0
ZSBjeWNsZXMgd2hlbiB3cml0aW5nIHRvIGxvY2tlZCBjaGlwIHJlZ2lzdGVycy4iCj4KPiBPbmUg
bWF5IGNvbmNsdWRlIHRoYXQgUm1XICh0d28gYWNjZXNzZXMgdG8gdGhlIHBhcnRpY3VsYXIgYmxv
Y2spIHNlcXVlbmNlCj4gaXMgbm90IGFwcHJvcHJpYXRlLgoKSXQncyBub3Qgb2J2aW91cyB0byBt
ZS4gVGhlIHRlcm1zICJibG9jayBhY2Nlc3MiIGFuZCAiYmxvY2sgY3ljbGUiCm9jY3VyIG9ubHkg
b25jZSBpbiB0aGUgdmVyeSBzYW1lIHNlY3Rpb24gdGhhdCBkZXNjcmliZXMgQURDU1dMb2NrLiBU
aGUKbWVhbmluZyBvZiB0aGVzZSB0ZXJtcyBpcyBub3QgZnVsbHkgdW5kZXJzdGFuZGFibGUuIFNv
LCBhc3N1bWluZyB0aGF0CnlvdSBoYXZlIHRyaWVkIGl0IGRpZmZlcmVudGx5IGFuZCBpdCBpbmRl
ZWQgZG9lc24ndCB3b3JrLCBsZXQncyBnbwp3aXRoIHRoaXMgb25lLgoKPiBbMV0gaHR0cHM6Ly9j
ZG4uZW1iZWRkZWR0cy5jb20vcmVzb3VyY2UtYXR0YWNobWVudHMvdHMtNzAwMF9lcDkzMDEtdWcu
cGRmCgoKCi0tCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
