Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2588C77B60
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Apr 2023 20:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1eXwsy5JFDvn1azSVEPPAnhVlIRYPrGlejJDPzKhCc=; b=PEBdv8BiS4aJfu
	k9qNsPHBS9g4Ggca4aaYQ56C7+MG7NLzeUDzFbOGsUhXF+V+CHXmmYptde+g3PiSnX759o5NGkj7Y
	Jvu2vBTiMhQ9zn6d2H1Ab2ZRty0HviHxYdKsltESsCi/z+fZEnGbFstmQOxuFScwcWyUkEHDf+94s
	4y3az2Bi6R+EeVnUh4TfbRqFmTlsBznYPK5TLDQGW2Xb++aMbQsj3GkS4zpkXLDlxzqk8F5qPkmiI
	VexGEBtHdATPkoroAXI8tvWVUNXqBJknR4QRrXe2WknSLlpMbrQqzorMfzKv/syt16kOpgDWHGDQN
	sJYTXVebcjPWCXuzhmvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prmCQ-004r9c-2s;
	Wed, 26 Apr 2023 20:57:14 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prmCM-004r8i-06
	for linux-mtd@lists.infradead.org;
	Wed, 26 Apr 2023 20:57:11 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-54f9e41dfa7so59596987b3.3
        for <linux-mtd@lists.infradead.org>; Wed, 26 Apr 2023 13:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682542625; x=1685134625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PeyZTvE2qao9z3HUKls5t/zNMEefQNyhwIh3dGLQJIU=;
        b=MLeMyFt/BrAb2CUUJZ7KmQTqlKOdl+nyYZc7PmyjnwYQvm0Yf7UbAGXqUUW6bmw5G8
         d9v/M6N+1fVWgVUttzO6DbM8nQI6KJCXhAN7IozpaR9m8Bl7slG7VpsqTKwoquSQxGsD
         jxjSQ3saNVE9cXwcQLcGF1jRtKLT/eEwI8kJvMSzxcIq2cDfiKWjYhMONbeUEU8V5mkj
         6Wdd/04hTAUwScC/UEbqqr6+MnHBHQTixxYJ9LZKKkCtwlqFMN3MWW87ziN5fguiVzeh
         4csevZGxcMK5tYzjndfSfWqBNcCl6Mif+sgasTPGERCLKwqXoxv35oil0C7Hw7NrwoqG
         vwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682542625; x=1685134625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PeyZTvE2qao9z3HUKls5t/zNMEefQNyhwIh3dGLQJIU=;
        b=F4IwzIEqgqA2P566kUaogS5jA7dS3n90bE4HzqU0in+AejDm3TfYPS4pnNOai6istv
         9QAEODCKFzyF78J2riPLRfj2OL/fY0ORTJ7dwXBkWfO2aEzQZkJqjoJoPS310m1+wdXD
         ApMGjzNIIvd/cMwdNuc0ccDPJPnxYi/U+MwMf3nN0uuO2/r8oFpemAHa+KRgILjO8CsQ
         KWVXBhQ8QOt8v3fwW18bE/wGuN+gftZCZ4f0Z3ndmUzxJy8jPzRdJqTrjskeFwS1imKw
         MfRa1bPck34qObhbgAS0ziJo85L5ipE4UyImTYiqDyeMpPkmU2NIXd7CKGX45ei+3+nz
         oKjg==
X-Gm-Message-State: AAQBX9faQ9s6GGEhVwfecfW4p7SAUh1+6ZUXsZqWPCfwU0T35EFGnsTi
	Vc6scA3B/F7S8ffcP3MuCiWsYgzBZLCR/172QXV5CA==
X-Google-Smtp-Source: AKy350ajEJHyhyynqyOl0isjddMpiNdULElT/xAxUEM8cmGuE9kOk2QPH86dypmLR0gOJToVISGwrFvJLTDtak1EsDI=
X-Received: by 2002:a0d:ea0d:0:b0:552:a2e2:684e with SMTP id
 t13-20020a0dea0d000000b00552a2e2684emr13680157ywe.52.1682542625695; Wed, 26
 Apr 2023 13:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
In-Reply-To: <20230424123522.18302-1-nikita.shubin@maquefel.me>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Apr 2023 22:56:53 +0200
Message-ID: <CACRpkdarANFQ7-p=-Pi_iuk6L=PfSLDsD3_w4dEVqarwXkEGMQ@mail.gmail.com>
Subject: Re: [PATCH 00/43] ep93xx device tree conversion
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Alessandro Zummo <a.zummo@towertech.it>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Brian Norris <briannorris@chromium.org>, 
	Chuanhong Guo <gch981213@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Damien Le Moal <dlemoal@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Eric Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Guenter Roeck <linux@roeck-us.net>, Hartley Sweeten <hsweeten@visionengravers.com>, 
	Heiko Stuebner <heiko@sntech.de>, Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Jean Delvare <jdelvare@suse.de>, 
	Joel Stanley <joel@jms.id.au>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Le Moal <damien.lemoal@opensource.wdc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Liang Yang <liang.yang@amlogic.com>, Lukasz Majewski <lukma@denx.de>, Lv Ruyi <lv.ruyi@zte.com.cn>, 
	Mark Brown <broonie@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Olof Johansson <olof@lixom.net>, Paolo Abeni <pabeni@redhat.com>, 
	Qin Jian <qinjian@cqplus1.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, 
	Sebastian Reichel <sre@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, Stephen Boyd <sboyd@kernel.org>, 
	Sumanth Korikkar <sumanthk@linux.ibm.com>, Sven Peter <sven@svenpeter.dev>, 
	Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Vasily Gorbik <gor@linux.ibm.com>, Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, 
	Walker Chen <walker.chen@starfivetech.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, alsa-devel@alsa-project.org, 
	devicetree@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	netdev@vger.kernel.org, soc@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_135710_084995_34B21911 
X-CRM114-Status: GOOD (  18.11  )
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

T24gTW9uLCBBcHIgMjQsIDIwMjMgYXQgMTE6MzXigK9BTSBOaWtpdGEgU2h1YmluCjxuaWtpdGEu
c2h1YmluQG1hcXVlZmVsLm1lPiB3cm90ZToKCj4gVGhpcyBzZXJpZXMgYWltcyB0byBjb252ZXJ0
IGVwOTN4eCBmcm9tIHBsYXRmb3JtIHRvIGZ1bGwgZGV2aWNlIHRyZWUgc3VwcG9ydC4KPgo+IFRl
c3RlZCBvbiB0czcyNTAgNjQgUkFNLzEyOCBNaUIgTmFuZCBmbGFzaCwgZWRiOTMwMi4KCk5lYXQs
IEknZCBzYXkgbGV0J3MgbWVyZ2UgdGhpcyBmb3IgNi41IG9uY2UgdGhlIGZpbmFsIHJvdWdoIGVk
Z2VzIGFyZQpvZmYuIFRoZSBEVCBiaW5kaW5ncyBzaG91bGQgYmUgZWFzeSB0byBmaXguCgpUaGlz
IGlzIGEgYmlnIHBhdGNoIHNldCBhbmQgdGhlIGltcHJvdmVtZW50IHRvIHRoZSBBUk0ga2VybmVs
IGl0CmJyaW5ncyBpcyBncmVhdCwgc28gSSBhbSBhIGJpdCB3b3JyaWVkIGFib3V0IG92ZXItcmV2
aWV3IHN0YWxsaW5nIHRoZQptZXJnZWQuIElmIHRoZXJlIHN0YXJ0IHRvIGJlIG5pdHBpY2t5IGNv
bW1lbnRzIEkgd291bGQgcHJlZmVyIHRoYXQKd2UgbWVyZ2UgaXQgYW5kIGxldCBtaW5vciBjb21t
ZW50cyBhbmQgIm5pY2UtdG8taGF2ZXMiIGJlCmFkZHJlc3NlZCBpbi10cmVlIGR1cmluZyB0aGUg
ZGV2ZWxvcG1lbnQgY3ljbGUuCgpJIGVuY291cmFnZSB5b3UgdG8gdXNlIGI0IHRvIG1hbmFnZSB0
aGUgcGF0Y2ggc2VyaWVzIGlmIHlvdQpoYXZlIHRpbWUgdG8gbGVhcm4gaXQsIGl0IGNvdWxkIGhl
bHAgeW91OgpodHRwczovL3Blb3BsZS5rZXJuZWwub3JnL21vbnNpZXVyaWNvbi9zZW5kaW5nLWEt
a2VybmVsLXBhdGNoLXdpdGgtYjQtcGFydC0xCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
