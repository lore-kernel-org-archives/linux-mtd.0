Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1756CC54E67
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Mar 2024 11:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BTvvKzwz77ifGW/YTAgLgPp+Sf3n0AMPzKtil+4NsXE=; b=QnsWXe7F2SNl8z
	dEw+90S/z6zYRQ6pIW/fjDseKe+BPGkl7o3JUCrEe1HBVDdO2K0X7KX0BOp1HCS7gGMFD6UZ8OUUl
	9w+cDYXyPia266Uu8CdX+3SO8BS9yVJGQIvfvJjAmSiadUhwybbbNBrApzO8ATF1ox2iIs8W5qCh5
	Nk6X4El880Kp1mU08Cssk2406jAGSLJEoPWbgG3ronXgx41PIHowP6EV8e2GmFc5UtK4Qw9145Vud
	4lUHWioUKE1FeVzFqUXHUfrI92KLHyG3DHJXh6/Udmaoaesf3WEPP+XkO9lSQ1rXZoZw3FEB4xxHr
	Jrw98+bEM4DIWz6V+ndg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpR1M-00000008Vhd-0NUs;
	Wed, 27 Mar 2024 11:00:40 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpR1B-00000008VeA-3vdG;
	Wed, 27 Mar 2024 11:00:36 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a466a27d30aso808315266b.1;
        Wed, 27 Mar 2024 04:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711537225; x=1712142025; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ju32kgFLniZCS7dOELnk78OlOgWmgFWMWc/+6Cau/QE=;
        b=fdu+WrUHTD6h4HWBmV1avQk91BT4tFdQWXmqu5jwt4N3hyVIzBLXGWrYNUIO4wi7SD
         ZLE3byUBGSc8VP7j2rm1o6EPZJVL6vubTvs6AJ1aW6YaYKRgCZbqH6o3pV8xR9LCZfmh
         J8DdBYxmr1lfpJsikFmNFmZCnpSx/DtcvYqut9p58y1ZI/tNwrPnfpYIPjjF2Ar0hYUQ
         WsXt22ravxFUUN4zianRFGcSzpqqiCYrqpIdidVowKkFg4FmDl1CaQqfgBM3r+bVyeyP
         5t37FGXhX4Z6u5CAeMVOjHxl3xo0gVDQG2vHb8VX4dtw7UEQvXF6oLgeOZzFde3YxXg1
         dXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711537225; x=1712142025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ju32kgFLniZCS7dOELnk78OlOgWmgFWMWc/+6Cau/QE=;
        b=w+4C+FQu01jRYJjLh0OZf3HLZHrEL5CnA2fvh0LMOoxGgyBwl62Wy6sp0tdDoOVyAJ
         3S7RTm9NcYv+dpz7+QdIbtuqr/qZkTruirxhu4rCvVjKkjTLF1oi1dqFX5N+qfejy68p
         6QjsQmSmh0l/LKpzMID7xnS6SsQ0/4QDQ7vUoKPUj62lnc0qBz8DED8yrkOzTlIH3Rt4
         hxkY9wKjzqBzWsbDZzurxrgQN1kmTVyXSVBy1po+YDQIpbvgCqSDc/rwoFg0yqhlZfc5
         Z2Gqgz2PJtKLXriRAPShf+BHuwfTYRLRqzB3XD7KzEmaKMD0VxsKv+XDieG0rmkuAtq9
         QOvg==
X-Forwarded-Encrypted: i=1; AJvYcCV//8MMDwEjfLJ1y4gwI4FkKwCN2aPBFHqMtqkgFxWVdmXGU7SggstA8A5/YdGCV8lpnwXUlqtl/ys7oKJZ5yPKHZvhMchJEdkUxzn4S12wW246vsQY7uBt7u4RIk9aXJDR/Zt2GZl/ma4jlcWizZ22IRZu
X-Gm-Message-State: AOJu0YzWMIsldre8UW0HibBwHGPTylLKJVYHiT56WW7RyVJxaSos/wLh
	+eejlELqk4JSeA3ahF6BPSHOZ0DTXovZ2k1QBWnVFbvjyTG7hTpH/YefHlF4vMqyIHmMPFweG7M
	wDFU3+Vdx5ojSm5zXGTLRSxcNVho=
X-Google-Smtp-Source: AGHT+IFELlWWydcIPiZzRfNkNJ0aiBtjYHAQu2rRkgw6Ipxw5ipMsk32+2Jcyp9P3eYXGgeptSDoDh0kCNzfCJ8MD0U=
X-Received: by 2002:a17:906:2998:b0:a49:dfe7:834f with SMTP id
 x24-20020a170906299800b00a49dfe7834fmr616671eje.59.1711537225336; Wed, 27 Mar
 2024 04:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240326-ep93xx-v9-0-156e2ae5dfc8@maquefel.me>
 <dc3e2cb4-f631-4611-8814-0dc04c5502f0@linaro.org> <ZgLgY11N8dkpTZJB@smile.fi.intel.com>
 <a16f45c9-747c-4a19-98a3-aa5f47ee5c4d@linaro.org>
In-Reply-To: <a16f45c9-747c-4a19-98a3-aa5f47ee5c4d@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 27 Mar 2024 12:59:49 +0200
Message-ID: <CAHp75VfdsRkGiJCUsiTj0p7SMaSkJqQeojNWT3tGz2W7JhwMmQ@mail.gmail.com>
Subject: Re: [PATCH v9 00/38] ep93xx device tree conversion
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Shevchenko <andy@kernel.org>, nikita.shubin@maquefel.me, 
	Hartley Sweeten <hsweeten@visionengravers.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Lukasz Majewski <lukma@denx.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Thierry Reding <thierry.reding@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Mark Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Sergey Shtylyov <s.shtylyov@omp.ru>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Ralf Baechle <ralf@linux-mips.org>, "Wu, Aaron" <Aaron.Wu@analog.com>, Lee Jones <lee@kernel.org>, 
	Olof Johansson <olof@lixom.net>, Niklas Cassel <cassel@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-spi@vger.kernel.org, netdev@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Andrew Lunn <andrew@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_040030_902497_82DE01FB 
X-CRM114-Status: GOOD (  14.04  )
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

T24gV2VkLCBNYXIgMjcsIDIwMjQgYXQgNzowN+KAr0FNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4gT24gMjYvMDMvMjAyNCAxNTo0
OSwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+ID4gT24gVHVlLCBNYXIgMjYsIDIwMjQgYXQgMTE6
MTk6NTRBTSArMDEwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiA+PiBPbiAyNi8wMy8y
MDI0IDEwOjE4LCBOaWtpdGEgU2h1YmluIHZpYSBCNCBSZWxheSB3cm90ZToKCi4uLgoKPiA+PiBB
IGxvdCBvZiB0aGlzIGNvdWxkIGhhdmUgYmVlbiBhbHJlYWR5IG1lcmdlZCBpZiB5b3Ugc3BsaXQg
aXQuLi4gSnVzdAo+ID4+IHNheWluZy4uLgo+ID4KPiA+IEJ1dCB5b3UgYWJsZSB0byBhcHBseSBE
VCBzY2hlbWEgcGF0Y2hlcyBpZiB5b3Ugd2lzaC4KPiA+IEp1c3QgZG9pbmc/IDotKQo+Cj4gTWU/
IFdoeT8gRFQgYmluZGluZ3MgYXJlIHN1cHBvc2VkIHRvIGdvIHZpYSBzdWJzeXN0ZW0gbWFpbnRh
aW5lcnMsIG5vdAo+IERUIHRyZWUuCgpPa2F5LCBJIG5ldmVyIHJlbWVtYmVyZWQgdGhpcyBydWxl
LCB0aGFuayB5b3UgZm9yIGNsYXJpZnlpbmcuCgo+IFBsdXMsIEkgZG8gbm90IGFwcGx5IGFueSBi
aW5kaW5ncyBwYXRjaGVzLCBleGNlcHQgZm9yIG1hbmFnZWQKPiBzdWJzeXN0ZW1zIGFuZCBub25l
IG9mIHRoZW0gYXJlIHRvdWNoZWQgaGVyZS4KCkdvb2QgdG8ga25vdyEKCi0tIApXaXRoIEJlc3Qg
UmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
