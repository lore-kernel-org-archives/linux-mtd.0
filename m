Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9FBC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Nov 2023 10:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NrmCATwMDZhQUjXKVicEuWhGzZ6k4rD+KY2EsEKMv+Q=; b=HKfjPO2jcmiw68
	+dipMlBj9VD32wNUmNd0XS32JuMdS7NseXhrcgAZssnf4OaWG6uh5SP46xvwK48iV62hXT0HE+3ix
	KZ90b14Kb0FD+7NRywlBz0eb2HjeogYubCM1NBw8potoT37y+492Tm/xxDz807QUr0Xrtf+MUL886
	o2oqHabNpTij7kfdVyuorzHDXhpVMivoXVvTvrahq/V60nMyPnSG2btsCO7yEg9fBMMul+r7B+Rpo
	IKhaSzIbWBMpB75jJMMwKh1Fem/fRTz7N54J/WYTeFoLFPBUqCBeCvg/Gj07/c8UKq4tJtOj/t+Sc
	uRqQP7nLiR2k875wk8mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Tk9-00DbsP-2M;
	Mon, 13 Nov 2023 10:00:33 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Tk5-00Dbrk-1P;
	Mon, 13 Nov 2023 10:00:30 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6711dd6595fso21905926d6.3;
        Mon, 13 Nov 2023 02:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699869626; x=1700474426; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbOR8jc4vESBCIxoa+hxCKP6qo+nQDlXSDfPg0qKWS8=;
        b=X+tuCvKLzG4fyk1tKnCPzGniO2ulQvpfDoRNNfsXEMStv0xC/CB/eikdApm0kMv5xF
         1ogcpMb5acZg7YOLdt2UY2pGZDz6rZac697id9CL37kgnT8ybkCn/mlGMcvzXV6KjSvn
         QgjPWrHEbp+QLmC1n77wtpKpDRkst45mLP8CE05VfmWZ/vD0BIvFEl/pFD6oE+uek9Rv
         Osd04Fc1sT79+1NE06moFyyS7nKRUH2ALyl5Ve7S0V9t1V7pzTZLOKrvO6dn43MAx3x5
         RfjkKvuAoD+w0+HCSJRy11M+I+OnZWOur0v7p2e39VQL6N4gf+056kR/XdrT83n1HQfX
         rj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699869626; x=1700474426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JbOR8jc4vESBCIxoa+hxCKP6qo+nQDlXSDfPg0qKWS8=;
        b=tLz1+m5SvfU4vi9Eb6tnEjgWb1ygDBJ9GxWv3tB9Lo9GzXX6ZWm8UcnLi/myEC4l0c
         sIXdXVHqpdxlxV8Mvcsb9KjY0ejQyhbloGly9S2LauesHkQfkSPgP8ebA+c/jrCQcK/b
         g1A1kA0q8+mHbbmw/7XOc6qJwbehinr1wWwe9z7GFn0DzV1RSiFQHzdRMomUpV7n8AX2
         uD5mArX5S+XLajRgU387euJpGLZWsZrWOFwvz8eCNeVjDY53JDrsktwgUwO9+RMJFAcg
         A+AfG/rhJvAbmwIZXCh5/G7arLG3+lDjKytJiJP8P6++aauN7zBa45gbKk3b+tCfR/OF
         8i/g==
X-Gm-Message-State: AOJu0YzuT6JIKB0ONwQmiU9tz0+IuwjH/36lkDJLUF27gcrPxw9uT2ZA
	slJ8DTaGogLdfEOLJ73hD7PuZ+fwMZp1E3yFtVk=
X-Google-Smtp-Source: AGHT+IGCUr7PujFC+poPa2QrZRvWL4HOk1bJVQMa23HsF2MY33M5q50/7KY3Uea2911BZ50MrpHn+FMZq5R37QecRrw=
X-Received: by 2002:ad4:45b4:0:b0:658:1eec:408a with SMTP id
 y20-20020ad445b4000000b006581eec408amr4664228qvu.40.1699869626386; Mon, 13
 Nov 2023 02:00:26 -0800 (PST)
MIME-Version: 1.0
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-14-3d63a5f1103e@maquefel.me> <ZLq0Z0QgBdCoDpV+@smile.fi.intel.com>
 <80ed91bb971516638fa1793d648939815eba7630.camel@gmail.com>
In-Reply-To: <80ed91bb971516638fa1793d648939815eba7630.camel@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Nov 2023 11:59:49 +0200
Message-ID: <CAHp75VeYHscM-r94kTrpH44W=OGVq+qoNNQZoVrR5_n-_K_Xsw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231113_020029_475768_EF6DD4AD 
X-CRM114-Status: GOOD (  15.81  )
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

T24gU2F0LCBOb3YgMTEsIDIwMjMgYXQgODoxOOKAr1BNIEFsZXhhbmRlciBTdmVyZGxpbgo8YWxl
eGFuZGVyLnN2ZXJkbGluQGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24gRnJpLCAyMDIzLTA3LTIxIGF0
IDE5OjM3ICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6CgouLi4KCj4gPiA+ICsgICAgICAg
bWRlbGF5KDEwMDApOwo+ID4KPiA+IEF0b21pYz8hIFN1Y2ggYSBodWdlIGRlbGF5IG11c3QgYmUg
ZXhwbGFpbmVkLCBlc3AuIHdoeSBpdCdzIGF0b21pYy4KPgo+IGF0b21pYyBvciBub3QsIFNvQyBp
cyBzdXBwb3NlZCB0byByZXNldCBpdHNlbGYgaGVyZS4KPiBIb3dldmVyIHRoZXJlIGlzIGFuIGVy
cmF0YSBbMV0gYW5kIHRoZSBTb0MgY2FuIGxvY2t1cCBpbnN0ZWFkLgoKR29vZCwgYW5kIHdoYXQg
SSdtIHNheWluZyBpcyB0aGF0IHRoaXMgcGllY2Ugb2YgY29kZSBtdXN0IGhhdmUgYQpjb21tZW50
IGV4cGxhaW5pbmcgdGhpcy4KCj4gU28gZXZlbiBwcl9lbWVyZygpIG1ha2VzIHNlbnNlIHRvIG1l
LgoKVGhpcyBpcyBpcnJlbGV2YW50IHRvIHRoZSBjb21tZW50LgoKPiA+ID4gKyAgICAgICBwcl9l
bWVyZygiVW5hYmxlIHRvIHJlc3RhcnQgc3lzdGVtXG4iKTsKPiA+ID4gKyAgICAgICByZXR1cm4g
Tk9USUZZX0RPTkU7Cj4KPiBbMV0gaHR0cDovL3dlYi5hcmNoaXZlLm9yZy93ZWIvMjAxNjExMzAy
MzA3MjcvaHR0cDovL3d3dy5jaXJydXMuY29tL2VuL3B1YnMvYXBwTm90ZS9BTjI1OFJFVjIucGRm
CgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
