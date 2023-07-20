Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EDDEB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 14:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Nr/gyLaBF6nmYeW+649ezvJ1yC2zRW3sUYAi3pLE20=; b=KMb3Fu2zVcwCoH
	bxCiKu6ptN4cwj0yCBiCk/cp5LdhD7q0V949VWYqWNC93Qq6J/3sQzWqsHURULw5PuzugXBWW8g0f
	1Qfu+5ZaIt4x7B5jgLf6VEWEknEEg+hwI80lbNBGPYYmSf5qaM7maaLjAXkg+/8/7mf+XbccQYTeg
	CS+MyC9qxmOfif+jXsGU5i5CcrTWVtpovT4WIHAgSPdjXHF0c1Xx2h3rqjXsaHoJaG+c+9Kj072Oj
	vBpIYvFt1zAJdTb3lQfKMn5TgK9MCyG2iBpwr96npXt1YX2XLHIWHOLB9Jv62hC5EfiPWUoYq38Ym
	xltCHE70fk0hLm+hhgGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMV00-00BRMQ-0k;
	Thu, 20 Jul 2023 14:51:24 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMUzw-00BRL5-1e
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jul 2023 14:51:21 +0000
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-45a0ee1c411so324141e0c.0
        for <linux-mtd@lists.infradead.org>; Thu, 20 Jul 2023 07:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689864679; x=1690469479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+O/muW1Nk3sbzumyk3oSyUNsgXn5aAFedNJT9XhjpY=;
        b=qHklILRYK8e+9ECBbaFZ7M9L25U5jR9UnSBshRGFdRVHmqpzNlXreFLJxybGBGyMLA
         JjOIhtWXcXsFXDkQWzdryG/qS0K+qMEB1GG285OY5nANiF5bBiiZqSfRjpAq4JN3qO/G
         VE1wh3ub6GNTxKYli8B9etbv3Syi4YaZAm8ewJzKDcudPtWv+mpGQnUWLOEpUyVi77HA
         L1nzjHd9LR1jd0d99mpisIGonQLildHSrZJKuMS/WToklyjf8Qvdn/zjfWDpMZSAG7cZ
         /maT4QCA9HKlmwzmuyLH+08Sr6TprdvFrIAJ1FYorUt4VLFQyyL7VA770EhWjclKTvfj
         KjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689864679; x=1690469479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/+O/muW1Nk3sbzumyk3oSyUNsgXn5aAFedNJT9XhjpY=;
        b=JN9wN8VUrF8OKN/C9TRJwMCaOrfMExSIfE94CJ+BniEdkbqH+LjhcfzlLj0IM0nFUw
         s88zFsGNyR3gg4YSz4FLYRW4LRteeAU/tfurs2zN6OBcclTqpMNMFbrdSDfiXakhZN14
         f5h8dL0PgoHCdtM1lMxepbamO8t0sekl5RYRhPL7hCp7DGBXe43fUwxkAFxN7VapaaUy
         N+gC94ciEkkC8vOwpTOoq8ThZe5RRYcVRzh+tmiqKRByArt6Tpc5tLu6SBxsIzBzS65r
         E1TE/UIBexGkAV0HORWg/lSl20BuNSdSklNqnPX0snDGO+kIJTf7DGiQZrq41v9/l5bj
         0E/g==
X-Gm-Message-State: ABy/qLaSv1NTDdc3W4KhXCgeWOrthhAdeG9d3v9rKNX/zwQmv4tBNhgk
	ZnN2UXIEQRSQ8gusfS+kwvil9t9V3ggeTVGZ6lkgJQ==
X-Google-Smtp-Source: APBJJlHzLfxkreBCbbsehsgY/9oCLGFmqhlHHCGSC7psLizhDkF/J99lwZeHjlYsqKv5zg/EMj03GOKDYYgPtq4NGEY=
X-Received: by 2002:a1f:3d44:0:b0:481:4092:99c with SMTP id
 k65-20020a1f3d44000000b004814092099cmr2773384vka.0.1689864676288; Thu, 20 Jul
 2023 07:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me> <20230605-ep93xx-v3-1-3d63a5f1103e@maquefel.me>
In-Reply-To: <20230605-ep93xx-v3-1-3d63a5f1103e@maquefel.me>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Jul 2023 16:51:05 +0200
Message-ID: <CAMRc=MeXCLzwjPEap_OD7tA+xVsMOU1DNxMbxbZVPaWg4Xdr8w@mail.gmail.com>
Subject: Re: [PATCH v3 01/42] gpio: ep93xx: split device in multiple
To: nikita.shubin@maquefel.me
Cc: Hartley Sweeten <hsweeten@visionengravers.com>, Lennert Buytenhek <kernel@wantstofly.org>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Lukasz Majewski <lukma@denx.de>, Linus Walleij <linus.walleij@linaro.org>, 
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
	Andy Shevchenko <andy@kernel.org>, Michael Peters <mpeters@embeddedts.com>, 
	Kris Bahnsen <kris@embeddedts.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-spi@vger.kernel.org, netdev@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org, 
	linux-input@vger.kernel.org, alsa-devel@alsa-project.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_075120_550914_66D884D3 
X-CRM114-Status: GOOD (  15.58  )
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

T24gVGh1LCBKdWwgMjAsIDIwMjMgYXQgMTA6MjnigK9BTSBOaWtpdGEgU2h1YmluIHZpYSBCNCBS
ZWxheQo8ZGV2bnVsbCtuaWtpdGEuc2h1YmluLm1hcXVlZmVsLm1lQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+Cj4gRnJvbTogTmlraXRhIFNodWJpbiA8bmlraXRhLnNodWJpbkBtYXF1ZWZlbC5tZT4KPgo+
IFRoaXMgcHJlcGFyZXMgZXA5M3h4IFNPQyBncGlvIHRvIGNvbnZlcnQgaW50byBkZXZpY2UgdHJl
ZSBkcml2ZXI6Cj4gLSBkcm9wcGVkIGJhbmtzIGFuZCBsZWdhY3kgZGVmaW5lcwo+IC0gc3BsaXQg
QUIgSVJRIGFuZCBtYWtlIGl0IHNoYXJlZAo+Cj4gV2UgYXJlIHJlbHlpbmcgb24gSVJRIG51bWJl
ciBpbmZvcm1hdGlvbiBBLCBCIHBvcnRzIGhhdmUgc2luZ2xlIHNoYXJlZAo+IElSUSwgd2hpbGUg
RiBwb3J0IGhhdmUgZGVkaWNhdGVkIElSUSBmb3IgZWFjaCBsaW5lLgo+Cj4gQWxzbyB3ZSBoYWQg
dG8gc3BsaXQgc2luZ2xlIGVwOTN4eCBwbGF0Zm9ybV9kZXZpY2UgaW50byBtdWx0aXBsZSwgb25l
Cj4gZm9yIGVhY2ggcG9ydCwgd2l0aG91dCB0aGlzIHdlIGNhbid0IGRvIGEgZnVsbCB3b3JraW5n
IHRyYW5zaXRpb24gZnJvbQo+IGxlZ2FjeSBwbGF0Zm9ybSBjb2RlIGludG8gZGV2aWNlIHRyZWUg
Y2FwYWJsZS4gQWxsIEdQSU9fTE9PS1VQIHdlcmUKPiBjaGFuZ2UgdG8gbWF0Y2ggbmV3IGNoaXAg
bmFtaW5ncy4KPgo+IFNpZ25lZC1vZmYtYnk6IE5pa2l0YSBTaHViaW4gPG5pa2l0YS5zaHViaW5A
bWFxdWVmZWwubWU+Cj4gUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpA
bGluYXJvLm9yZz4KPiAtLS0KCkFja2VkLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6
LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
