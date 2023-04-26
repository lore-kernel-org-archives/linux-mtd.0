Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EB4C77B60
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Apr 2023 21:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9t+lcPa38x6FQREeWH0qhyMHcj3QdYXuFyLCQg07Jso=; b=G4S8dQCgXxmI60
	9gcEpxIJAUuRvQeAq6hovAa0x1thGMyyNMhaVzHDqRk2gRW//bkiw7Meb1VVG3xzYnSrL9VuwSsEV
	ZUD41/y9J0wWqrn8+51xUgnizOPW+9QCzX5/tq6vZ2EXkZDu0QmkdCp1R0xU/jclq9LAQ8UgZyAWt
	yGqdu5GqcPgOBn1UXVtEeroj+2sx2RlBYhu0X+tmnlKV7N2lgOqqOWORonZAScErbMakMHjZ85YUt
	szoLDb10w1uIG3l4Bo46L8zvSqq8zd72o7BIETjDF7ZffugXaVAIZgqAaf1Y92+3xYho8y2df1l4W
	fZLzff6g6YiH0KB8uPIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prmLk-004s2l-0X;
	Wed, 26 Apr 2023 21:06:52 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prmLh-004s1r-2K
	for linux-mtd@lists.infradead.org;
	Wed, 26 Apr 2023 21:06:51 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-54f8e823e47so87532347b3.2
        for <linux-mtd@lists.infradead.org>; Wed, 26 Apr 2023 14:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682543207; x=1685135207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8C6tKrbT51GaZnl8zer1AnBo8yNRgpprgLkj0av5l+E=;
        b=Kh7TmG3JlHQoPDgJrxEspZSpUN+36yUdamiO43UnPnWU5WHRHExsZuq1crpHQPMIXw
         zzWzXMlOi38Xx4my+77mCqHvk7/X81J/7WthQKZt0CHx/5a1ohrap/HzGWEDQbQACJTb
         YhsFcjssiyz48P8HUQnvmRDVNrO8n5ZicePPH1S7Zj9YadbExO7GDrfEmhV8+JMdHi44
         dS/U1Lzmekv6Z1Px+wN/pWN5LwOrRpCZPrnqoQccfnfTFROZXP698w5QlH4NBcZahcI9
         Av/WtFSCGNW/WXdsMcqPPizaCNJVu9G6mBZV0Jx9mGGkKSo+tGaTmr2RPFnSQVsLEyzh
         SKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682543207; x=1685135207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8C6tKrbT51GaZnl8zer1AnBo8yNRgpprgLkj0av5l+E=;
        b=Oy9rYrqRszurvEFsQyLbs6xOHVX9mpCimBt1zX4RtQGfCIwcG8CW1sSZ7YftFd1bH2
         YlTyN48hZ9io4AX7fcsxZThLHpMHgLRgl/IdcMTRteaCMkPSLZghMiLU0VjMhXqqgiWn
         UFnsKhddWrV+e7QjEjSFPnIrRwBgeqR7oZboUDl+PNSF8+zoe0jOchhyqs/X77A2ict8
         C+/BDHWTFb/rYgQsUxypIgGS5eAaVcT0c4AqdVTAH726Tr/r1nfBoOGkN2AerPa2WHLL
         fD66H+lpp8ZR230iJZ81U7RgiiONbbD4LaFmE0BeCMJZWHeftaKaCIcUzYovfDYn/mKv
         +Nag==
X-Gm-Message-State: AAQBX9et6weHjHuhqruLYtuwMR8mABkd0fP/kI+aVZpQRmaJU00GVqRR
	ZkG5lgBkDcpxBPpcTwFNl3buFBV4PclAJ2tGHNHaZg==
X-Google-Smtp-Source: AKy350bnHkFKck7ScHLySUohS3TGug3PuU6k1b4WHzFwKnH0/14BD/IU48R1JEuMfUGu5baNdUtxQXCsghQML3QSaV8=
X-Received: by 2002:a81:5d02:0:b0:54f:8b56:bb3 with SMTP id
 r2-20020a815d02000000b0054f8b560bb3mr13933284ywb.5.1682543207061; Wed, 26 Apr
 2023 14:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
 <CACRpkdarANFQ7-p=-Pi_iuk6L=PfSLDsD3_w4dEVqarwXkEGMQ@mail.gmail.com> <b5396ef5-3fed-4e98-8f37-a9cd4473bddc@sirena.org.uk>
In-Reply-To: <b5396ef5-3fed-4e98-8f37-a9cd4473bddc@sirena.org.uk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Apr 2023 23:06:35 +0200
Message-ID: <CACRpkdaZvKoFuDHP0Cd1MuayKtnBjCG5wmWPjwq3pccCrb-P9A@mail.gmail.com>
Subject: Re: [PATCH 00/43] ep93xx device tree conversion
To: Mark Brown <broonie@kernel.org>
Cc: Nikita Shubin <nikita.shubin@maquefel.me>, Arnd Bergmann <arnd@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
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
	Masahiro Yamada <masahiroy@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Olof Johansson <olof@lixom.net>, Paolo Abeni <pabeni@redhat.com>, Qin Jian <qinjian@cqplus1.com>, 
	Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, 
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
X-CRM114-CacheID: sfid-20230426_140649_797113_70DAEE1C 
X-CRM114-Status: GOOD (  19.11  )
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

T24gV2VkLCBBcHIgMjYsIDIwMjMgYXQgMTE6MDLigK9QTSBNYXJrIEJyb3duIDxicm9vbmllQGtl
cm5lbC5vcmc+IHdyb3RlOgo+IE9uIFdlZCwgQXByIDI2LCAyMDIzIGF0IDEwOjU2OjUzUE0gKzAy
MDAsIExpbnVzIFdhbGxlaWogd3JvdGU6Cj4KPiA+IFRoaXMgaXMgYSBiaWcgcGF0Y2ggc2V0IGFu
ZCB0aGUgaW1wcm92ZW1lbnQgdG8gdGhlIEFSTSBrZXJuZWwgaXQKPiA+IGJyaW5ncyBpcyBncmVh
dCwgc28gSSBhbSBhIGJpdCB3b3JyaWVkIGFib3V0IG92ZXItcmV2aWV3IHN0YWxsaW5nIHRoZQo+
ID4gbWVyZ2VkLiBJZiB0aGVyZSBzdGFydCB0byBiZSBuaXRwaWNreSBjb21tZW50cyBJIHdvdWxk
IHByZWZlciB0aGF0Cj4gPiB3ZSBtZXJnZSBpdCBhbmQgbGV0IG1pbm9yIGNvbW1lbnRzIGFuZCAi
bmljZS10by1oYXZlcyIgYmUKPiA+IGFkZHJlc3NlZCBpbi10cmVlIGR1cmluZyB0aGUgZGV2ZWxv
cG1lbnQgY3ljbGUuCj4KPiBJJ20gcmVhbGx5IG5vdCBlbnRodXNpYXN0aWMgYWJvdXQgdGhlIFNQ
SSBiaW5kaW5ncyBiZWluZyBtZXJnZWQgYXMtaXMuCgpBZ3JlZSwgdGhlIGJpbmRpbmdzIGFyZSBt
b3JlIGltcG9ydGFudCB0aGFuIHRoZSBjb2RlIElNTywKdGhleSB0ZW5kIHRvIGdldCB3cml0dGVu
IGluIHN0b25lLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
