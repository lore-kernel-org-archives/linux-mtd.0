Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F82EB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 14:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lBiW+57ZPA0NwS29/MNeIkFIetupjZQjk9fmDyCninU=; b=2XGeiRZOhZ95rP
	XbTL1nvQOvq883WM1DkVmgxXxYOV4/lvthKBMcNgXgiU4fDSbRDpl2ZWxEg297ZcUqZVzTpultyDv
	BsPKnYoTKVHieBpgYhbXs9fE58+uSenYO6h08ZNJEKGjU8xzVpPjsWudKTk/BTi50l1t+K36GkIN+
	ES30fFpOZdxxcV0McNf/KQ+uja7sAWbhtu4R3Jxj3TIA1VeidWXS+gvDJWfjiEtxQsL6foBZxR5w6
	QyShhHQwNcfuEpIBigELPoAY9h7TABuB0enmO86wy2eD8gi2flwgNowzrvL5NnHb9ndrU6zvWsncQ
	zg9/3HAd7kVhTV5tN6nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMUys-00BR9y-1v;
	Thu, 20 Jul 2023 14:50:14 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMUyn-00BR7o-1m
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jul 2023 14:50:12 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-483ad06a37aso1376454e0c.1
        for <linux-mtd@lists.infradead.org>; Thu, 20 Jul 2023 07:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689864607; x=1690469407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44I4QTXSdpRlGQNX01aNu7Q8jYmgKrsVdvaz0FbrT9w=;
        b=VHsv4k0q2otI210G2fx8UlqZVBouT1yhHPQeX4/iYKRduLbBfujemaFd84GC3ZVtWX
         jIbCktQqByAp5iqMc/vfuiwpcDzR/b7VidjqvAa00eAxbSRDadKzFL7ftVkL0wpM8mY4
         3nANvQf6LnRvO72e3X3PIZq6dwVKEuHJlUuToqWh59bGJFqRqqo0SosmrUxvzzRd1bBC
         FBz8bvcUB7PznBNwhuRezNy3z5i/4TW+ggCxtW15DP+i0Lj50o4B9jSN9WUDe5Vyw8rc
         EUeWyncBdaKXPsUBWXs360RXDU8t4kC/iicYJ16kjPZL2O0Kgs5iYg9GIm/a1AZfdPvo
         1iNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689864607; x=1690469407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=44I4QTXSdpRlGQNX01aNu7Q8jYmgKrsVdvaz0FbrT9w=;
        b=HDMgX95vEeYbWTnSVPglQS1zURcKv6zvvjwIh+2eUGNWOy9jq4tXbWpIxIXuUIMbD1
         do6Z56sWArxNPQPnrvDMtEBx7QGwx7nytfKhfMPlIvzwooL1jkACTG44dbsU0PpdZxqB
         rnVXN4QmWb0LcV5OIJvRXoA1uNaVuk67xMO2C9WwvOOiuOYZOJJeORS9kBCrbODnGlxO
         uBFTplbQ8HTjXoj5Pzb/pgaxtZSvRcHp30p9M0ANT4q5faMZ+wvZlI2IMzHqfzeQJltE
         pu6YdWbXf57SXzMh54fVIdFUjmgfMkfPqjptm3g2G0VDVW63l9toaVKenOF7C0t+QYQG
         iVsQ==
X-Gm-Message-State: ABy/qLbYRm6bol50yzt1PkmrWlzBAVruC720dEPA12N7FbaMSyMT4kjd
	w5SXHYAv/EOLRjaXEloIap1BTcjG/mfafR5oVdKYsg==
X-Google-Smtp-Source: APBJJlHcVbVjnQaUrT7V7jD6HpKLdUNhc+KcBHJVAgkGL82QQnDc268rPznkIAv5GUoMxsi+qdzT6lIi9u/QnbbIPgk=
X-Received: by 2002:a05:6122:929:b0:481:5132:48c7 with SMTP id
 j41-20020a056122092900b00481513248c7mr2136264vka.1.1689864607273; Thu, 20 Jul
 2023 07:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me> <20230605-ep93xx-v3-33-3d63a5f1103e@maquefel.me>
In-Reply-To: <20230605-ep93xx-v3-33-3d63a5f1103e@maquefel.me>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Jul 2023 16:49:56 +0200
Message-ID: <CAMRc=McbD1w47GsfvY6p==jDiTQrwg96jFvVKO-9bPhNOBmapw@mail.gmail.com>
Subject: Re: [PATCH v3 33/42] gpio: ep93xx: add DT support for gpio-ep93xx
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
	linux-input@vger.kernel.org, alsa-devel@alsa-project.org, 
	Andy Shevchenko <andy.shevchenko@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_075009_741276_8A044C4E 
X-CRM114-Status: GOOD (  22.42  )
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

T24gVGh1LCBKdWwgMjAsIDIwMjMgYXQgMTA6MzDigK9BTSBOaWtpdGEgU2h1YmluIHZpYSBCNCBS
ZWxheQo8ZGV2bnVsbCtuaWtpdGEuc2h1YmluLm1hcXVlZmVsLm1lQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+Cj4gRnJvbTogTmlraXRhIFNodWJpbiA8bmlraXRhLnNodWJpbkBtYXF1ZWZlbC5tZT4KPgo+
IEFkZCBPRiBJRCBtYXRjaCB0YWJsZS4KPgo+IFJldmlld2VkLWJ5OiBBbmR5IFNoZXZjaGVua28g
PGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWog
PGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBOaWtpdGEgU2h1Ymlu
IDxuaWtpdGEuc2h1YmluQG1hcXVlZmVsLm1lPgo+IC0tLQo+ICBkcml2ZXJzL2dwaW8vZ3Bpby1l
cDkzeHguYyB8IDYgKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8vZ3Bpby1lcDkzeHguYyBiL2RyaXZlcnMvZ3Bpby9n
cGlvLWVwOTN4eC5jCj4gaW5kZXggOWEyNWJiMGNhZjE3Li5jNGUyNzJhODc3M2QgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncGlvL2dwaW8tZXA5M3h4LmMKPiArKysgYi9kcml2ZXJzL2dwaW8vZ3Bp
by1lcDkzeHguYwo+IEBAIC0zNjAsOSArMzYwLDE1IEBAIHN0YXRpYyBpbnQgZXA5M3h4X2dwaW9f
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgICAgICAgIHJldHVybiBkZXZt
X2dwaW9jaGlwX2FkZF9kYXRhKCZwZGV2LT5kZXYsIGdjLCBlZ2MpOwo+ICB9Cj4KPiArc3RhdGlj
IGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZXA5M3h4X2dwaW9fbWF0Y2hbXSA9IHsKPiArICAg
ICAgIHsgLmNvbXBhdGlibGUgPSAiY2lycnVzLGVwOTMwMS1ncGlvIiB9LAo+ICsgICAgICAgeyAv
KiBzZW50aW5lbCAqLyB9Cj4gK307Cj4gKwo+ICBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZl
ciBlcDkzeHhfZ3Bpb19kcml2ZXIgPSB7Cj4gICAgICAgICAuZHJpdmVyICAgICAgICAgPSB7Cj4g
ICAgICAgICAgICAgICAgIC5uYW1lICAgPSAiZ3Bpby1lcDkzeHgiLAo+ICsgICAgICAgICAgICAg
ICAub2ZfbWF0Y2hfdGFibGUgPSBlcDkzeHhfZ3Bpb19tYXRjaCwKPiAgICAgICAgIH0sCj4gICAg
ICAgICAucHJvYmUgICAgICAgICAgPSBlcDkzeHhfZ3Bpb19wcm9iZSwKPiAgfTsKPgo+IC0tCj4g
Mi4zOS4yCj4KCkFja2VkLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3
c2tpQGxpbmFyby5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
