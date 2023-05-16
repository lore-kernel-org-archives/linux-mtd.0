Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00567C77B75
	for <linux-mtd@archiver.kernel.org>; Tue, 16 May 2023 03:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mNlhipZPKdmnqlkpKJzxS2BGvIl3KW7q6wjeVs0xSyg=; b=QnprnAN6V6g7sx
	oLbgWkxvHBrWmpsn7p6nBbKgDH05wcYhg5UriUsVCBXTQ2ZOdOSLmA1kQf8/iAKS9AJ6PLkkLwnsJ
	XVPCTCpbphMZOLLpBJ3hklILUMSJFXWTKHpQtgIPVJPsHSE9Csfaav7WREPzvxdlmcSxZL3i04YwM
	t2FdifevZWMOrRowabjOOWCI+eOs1xiYqmJW2OVqzF7iV/XDTouWOtiXOlE3773wJ5ZmteopZOkAW
	K7U1kR5iE/N4KtP3gqkKj+FbEooA9Wii+LqgJM3hB4aI0kZ+I+StcoEDKK6eCVOXOB31HcSxfLbGI
	k4hhoTroaLePfN0S09VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyler-004GdP-1T;
	Tue, 16 May 2023 03:47:29 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pylem-004GbU-0L;
	Tue, 16 May 2023 03:47:27 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1ab1ce53ca6so97249665ad.0;
        Mon, 15 May 2023 20:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684208840; x=1686800840;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PJkA0m3mLV3FScvH0VRdP/qwbPPh2FB8d0fW+TuWxR4=;
        b=ApPSFRvnOtBS+Z/iKlnWcxMj6EFTaNcebWTAxUNqbr2V59bdCsI1CCGa7BSHqaDeQo
         Y716hG4KkN0jkNJRqHDrjT+AwLp9OZhn4DGdlJ3osLyZeE9jrOxLkOIUjMJkvpo84CAq
         nUTDHKlEa12CbYtD834uGpkePWIxfOzVkSxhCNiXiFb0yo2dh6eXGqhzdTiT1iPqmM5o
         51Or2UyL9Qx+e5KfZ5LhYuXVvZSCPLsQ/mCaORrP9aCbUB2c2S/PnEh5FColWdomJPuP
         SPspvw61zWv9jTS1y0MWuWQpPc6Zc2rkMxuDBflIpnO2zr1wz5G588YCFmWLp553g2yw
         ki8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684208840; x=1686800840;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PJkA0m3mLV3FScvH0VRdP/qwbPPh2FB8d0fW+TuWxR4=;
        b=LR1pBy24/4fC5pOPoC26g2gzvwbigD1lloPVVvJk9qbrakoMqYssgb2ELz9rfOvqXq
         5a0LzW1hPsYRqDezrf1qAaN4a/N85b57RT4HQIUc5o5683f8KrjmYINzQyjOylfzolfK
         uOhwxdHIvBjtPVIvIDPEimRg9E7+9CDb+5TWxboL2Qy4hEDMzXiR6rmowVbJRnkJhKq9
         hX6mgD/ZI+Hk/MQWuFolq/LlZpL4d0DOy8V2ftAOJzVe0WlC6bTSzkzaUHAMcjaVjTcP
         8QyGLo7OcjQDUvM9GreH6p/rElrsMy+EvApuszsbtbQkTxyz5lJTKrQhtU7g63I0iqeS
         huDA==
X-Gm-Message-State: AC+VfDwiwGjjmEG4+z/hP0MRl+ve2xEggVG9pxor1Za+3wnI988pUYrK
	UPSV1df6kvoStoMNzpW1etY=
X-Google-Smtp-Source: ACHHUZ7e1MfX6kyZu2E4WmLGOzMJRaaqKuW9yru0MqXdpKhkdM51h0LCt+6AtwA0+6KM5psbnkf95w==
X-Received: by 2002:a17:903:41cb:b0:1ad:f7d9:1ae0 with SMTP id u11-20020a17090341cb00b001adf7d91ae0mr12593543ple.38.1684208839868;
        Mon, 15 May 2023 20:47:19 -0700 (PDT)
Received: from [10.230.29.214] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k3-20020a170902ba8300b001a245b49731sm9786807pls.128.2023.05.15.20.47.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 20:47:19 -0700 (PDT)
Message-ID: <1ff2333a-8f78-c066-0158-9c8a1a17684f@gmail.com>
Date: Mon, 15 May 2023 20:47:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 00/43] ep93xx device tree conversion
Content-Language: en-US
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Brian Norris <briannorris@chromium.org>, Chuanhong Guo
 <gch981213@gmail.com>, Conor Dooley <conor.dooley@microchip.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 Jakub Kicinski <kuba@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Jean Delvare <jdelvare@suse.de>, Joel Stanley <joel@jms.id.au>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Le Moal <damien.lemoal@opensource.wdc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Liang Yang <liang.yang@amlogic.com>,
 Linus Walleij <linus.walleij@linaro.org>, Lukasz Majewski <lukma@denx.de>,
 Lv Ruyi <lv.ruyi@zte.com.cn>, Mark Brown <broonie@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Olof Johansson <olof@lixom.net>,
 Paolo Abeni <pabeni@redhat.com>, Qin Jian <qinjian@cqplus1.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Russell King
 <linux@armlinux.org.uk>, Sebastian Reichel <sre@kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Stephen Boyd <sboyd@kernel.org>,
 Sumanth Korikkar <sumanthk@linux.ibm.com>, Sven Peter <sven@svenpeter.dev>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Walker Chen <walker.chen@starfivetech.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-watchdog@vger.kernel.org, netdev@vger.kernel.org, soc@kernel.org
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230424123522.18302-1-nikita.shubin@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_204724_157738_1D489F8F 
X-CRM114-Status: GOOD (  13.02  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 4/24/2023 5:34 AM, Nikita Shubin wrote:
> This series aims to convert ep93xx from platform to full device tree support.
> 
> Tested on ts7250 64 RAM/128 MiB Nand flash, edb9302.
> 
> Thank you Linus and Arnd for your support, review and comments, sorry if i missed something -
> these series are quite big for me.
> 
> Big thanks to Alexander Sverdlin for his testing, support, review, fixes and patches.

If anyone is interested I still have a TS-7300 board [1] that is fully 
functional and could be sent out to a new home.

https://www.embeddedts.com/products/TS-7300
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
