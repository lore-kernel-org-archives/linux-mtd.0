Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5179C7EE23
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Jun 2023 15:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XDEkfo+tPGvJAYdMZqCIpbGN1necIAoH2gRfLLUN7ZU=; b=K1ZVol160xGShM
	x+kW7QGPKZqQqU4dCmY6gQ/lABbVr6LYGxD3/w7hjJwVQP4UmUJ8MklnOwcgjrfIQCdrv2RiiXvcc
	kPvZ+wA5p6XQHSollGKGgLIle+T/+7Hc73dHp8E6a1sZ3YOzP4SAC9qYiCkKZ32G/hf3HU3O9W6Jg
	lY4ZAzwCv6QnkFKx2KVHg6/duO5GsTRnu/LaGd5CCDeiaECt8BEHj9ryffh5YB4xGSxZ2+i1z+8ip
	01eqTarLwZHmCxac/1XifQIJBIEm7yh4YkFdHPS+RPxYy8PXNk60yqBlQZ0sDLI80pM/iXDiJtxCB
	RoAcFAGlPGAT+b10sAcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5q40-00CPDr-0i;
	Sun, 04 Jun 2023 15:54:40 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5q3w-00CPCl-2G;
	Sun, 04 Jun 2023 15:54:37 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-97467e06511so393723866b.2;
        Sun, 04 Jun 2023 08:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685894070; x=1688486070;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TsvcyukdSS1lKPeAFb0MO21Iif9mAo0wy8+BZHk6XCA=;
        b=r9RnHmU6Pa0FtsM/qHVFqFiCYlBYyvtIkLeKoNPRIk8smrMsqYFJGWCQjT7VU72eDe
         BlragftM9BcqClhhfhrjXu+KMSBuqSe+KNwPFU0KBNJlL713GE9o6QJnGFo2MVVjPP+P
         tQT4bqbQqIIjRH39Ls+d3YC1mLwWHW3tHKnUmfhzbMfPeeq5TIZAMtwSAuYi3ZYPbltW
         zBx3Pm7HZhbXZBrcB4iAF+MkhkDQusDxPerLMNjJ9M9evb0iQB/WGEScO2q3pwVkwkGJ
         xiks1hYnTowy+2gYSWDJ+qp4ig7OfRGINcmiTLnuJchPscxcbqDF/ro1Gt8cNoeiUHiy
         SK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685894070; x=1688486070;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TsvcyukdSS1lKPeAFb0MO21Iif9mAo0wy8+BZHk6XCA=;
        b=d9VX8tlDds/oGcCUDWonAu+s3yIohRbA8B2Td2MqqTStgUoFYfbs6l9hOcVNoTF1cI
         rfMm6Pgm9TUVuIifw+0qCtWGzyJ6wD0rDlVSYfoAHXdJuCy9M6IwmV/fTNOy7FJp4uA0
         EkR+Ni3bNnQvsvZPOE8dnBzf54t45DxigZgDsorcb5Tv7QzX2c8p1iV5o3ql+yqCvh2D
         X6B8dVtt14LAVT36pEVasVUJLaX3PhomW0KJNERCV4plqWFnHWjD8/DXLi7Lfrw0HXVu
         Hmvx420KOePiXycTpNEjSGO0Myxj/Qhy1mseBnTi5W77zLutuKssDmNtnjCzDny4crcA
         rFtQ==
X-Gm-Message-State: AC+VfDwuinsRB28u8hVibIQNQLSR6KKS7iMMFj2UbbHhQOwUIf+/BIbu
	S9mVw7ZSTGgL88ThjT0SkMo=
X-Google-Smtp-Source: ACHHUZ6AHXuZcLeVYAiKN3Lakw7/5eyPw2g9gXmYKU2Z87ULJVZcNauonQPfi8yZtMpFNZvTXucpWg==
X-Received: by 2002:a17:907:6d08:b0:974:5e2c:8721 with SMTP id sa8-20020a1709076d0800b009745e2c8721mr4687955ejc.38.1685894070095;
        Sun, 04 Jun 2023 08:54:30 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id h21-20020a170906111500b00974530bd213sm3241020eja.143.2023.06.04.08.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 08:54:29 -0700 (PDT)
Message-ID: <1492a131cd474c47e2a2b14defd46284f695b0ef.camel@gmail.com>
Subject: Re: [PATCH v1 00/43] ep93xx device tree conversion
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>, Arnd Bergmann
 <arnd@arndb.de>,  Linus Walleij <linus.walleij@linaro.org>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Christophe Kerello <christophe.kerello@foss.st.com>, Conor Dooley
 <conor.dooley@microchip.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Florian Fainelli
 <f.fainelli@gmail.com>, Hartley Sweeten <hsweeten@visionengravers.com>,
 Heiko Stuebner <heiko@sntech.de>, Hitomi Hasegawa
 <hasegawa-hitomi@fujitsu.com>, Jean Delvare <jdelvare@suse.de>, Joel
 Stanley <joel@jms.id.au>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Jonathan =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>,  Le Moal <dlemoal@kernel.org>,
 Liang Yang <liang.yang@amlogic.com>, Mark Brown <broonie@kernel.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Nathan Chancellor <nathan@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Richard Weinberger
 <richard@nod.at>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Walker
 Chen <walker.chen@starfivetech.com>, Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Michael Peters <mpeters@embeddedTS.com>, Kris Bahnsen
 <kris@embeddedTS.com>,  alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org,  dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org,  linux-watchdog@vger.kernel.org,
 netdev@vger.kernel.org
Date: Sun, 04 Jun 2023 17:54:27 +0200
In-Reply-To: <20230601053546.9574-1-nikita.shubin@maquefel.me>
References: <20230601053546.9574-1-nikita.shubin@maquefel.me>
User-Agent: Evolution 3.48.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_085436_776662_BD882698 
X-CRM114-Status: GOOD (  10.72  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Nikita,

On Thu, 2023-06-01 at 08:33 +0300, Nikita Shubin wrote:
> This series aims to convert ep93xx from platform to full device tree support.
> 
> Alexander, Kris - there are some significant changes in clk and pinctrl so can i ask you to tests all once again.

I have quickly tested network and sound on EDB9302 and I neither have problems with
these functions, nor did I spot any new error messages, overall looks good to me,
thanks for your efforts!

-- 
Alexander Sverdlin.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
