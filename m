Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2157EB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 10:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J+wc8vaT1xRYoSukeeJzdY8p8bKP9oCMzdpZ4I5dGqo=; b=BRsiCHGz7z2g8I
	KZf6/xPp1nh6Bphv/ztQakMHaUQZ0iqYXVPGS7TPsBj/EZI8b9rV4UnAtvDrA5wreuPxuWX+MBcHT
	UnD4sTDq0cS6Ola4k7ebv7hYM28zq37m2a5rgedru+QGOPiQuK1x6PjJ9fhIOJgUMb03PzhNoXu2b
	RO/FrteHtbi1liT92ACyPjASVi9LMBw1wx4TFC3DQxI1WHtSwYS1As/rxgtQFDM73BGOeLzHXGRAh
	7qDszFk8Sos7D8MqHwzF20v8qvhlkLe6ZTwO5U//j0bV8Vt1zpRLmosTlX57wkbBGHbgEwwUEe+8D
	UvwyMuRLQQ+gSbmA3yPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMQSP-00Aebp-0p;
	Thu, 20 Jul 2023 10:00:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMQSM-00AeaM-0n;
	Thu, 20 Jul 2023 10:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BGYd0XzLOZIaect1B8DLqJQBB8NGVA7ArI9KPRHwCuA=; b=IEze8sQpMptHGWcPrtu2+gqP0M
	lJ/pFuwbO1M57Azom6dcrMAWVefYUMPFDsP7gnkwhBqMjybmzGOBkASythN90OKWpEoPn1gUkqdY4
	hEbSYw5fGcd0MoWqb3GlMmUyL2KVEasvsP/3WFwtBv+GXZSWosgOIERGp2t/bYHAX3qcCm2b0AwcU
	UQfnGF5JHNUyM3s+LWpBTMQSfsxvuVLCEZIEh0tQWC+FC0tFAxQ9Fv/G36VmiO8KCWFkTjzig+TzV
	+IdUnWzFFBSAbmctbFwKUZ91fHGnd57hV6hyViVYutK7QRNwNPXpQ/auoHEoPP2lQSXQTTgSiJKvo
	7gsp66yA==;
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMPQY-00FRUn-08;
	Thu, 20 Jul 2023 08:54:29 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-51e5da802afso711659a12.3;
        Thu, 20 Jul 2023 01:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689843261; x=1692435261;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BGYd0XzLOZIaect1B8DLqJQBB8NGVA7ArI9KPRHwCuA=;
        b=R6F9AvgnvdC0oDU+DTR4MfnnL48BCbJgyhCk9A0VhVWOhqOQpe41/AATzBaPwXrlbp
         NiVoQ4an/IEe/zBQWtSt4j+0ECY7RSMDaQhEu0LpfpScWHmLaf5l2o7v0GzABUvd19s5
         w3jdfWKKI2Z7TETv8eOzBN9Q/hcD451Hvdx3NnYuVWduVN2kzLJ7Mi+gd7kIEYAdNLGx
         PfpKo5/5UeGO/gSzn2N0keUNKeCsk90RxfmW4xQ3nGSsJBlNdtDiyYfRTsLxuM+guq5h
         JAEcEamXP44sXSMwQx4SSiQZUZV6ASyXLRxNQClqiEF/jwHGMVw/ZkwvX6yxmHqpohoE
         Ggkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689843261; x=1692435261;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BGYd0XzLOZIaect1B8DLqJQBB8NGVA7ArI9KPRHwCuA=;
        b=dy5zfND3g690dSfDV1diaHRMDFGFzVqAzbwZb/kab1pFuy8cASHNhg7CsoUUSWV65S
         4kqzm/fsKx44G5tY2xvkBjXEWgWOMorB0VxY46ApQzwCr3apzd4jSedHZ+hs2wIOHN7L
         LkhTlGWNNxRjOxT077/v3FjtYd3sxcf1RB6h6L2x+rJH4lxy3JslkDURp/xJ3Uq9WNNK
         XN9ilUumgeo2zQDOUmQ9NfGR0Wkm7CGAOfMKCq1AnowxWY7Z7ojjAXdEWRGlEr+MdvPz
         R1R5yiGvvFLslyHc59npgPwikZb8QBK0S4yzTYXvgC0eLv9xqP93n+wXRQse6F8D7pOL
         HsqA==
X-Gm-Message-State: ABy/qLYnv6EVB30S4jfCYoT80NUy56f4SIch1KySVcTI9724ZSsf7zr7
	/z6NYnp87nMjumK2Njn1psc=
X-Google-Smtp-Source: APBJJlFMasg2dNIicMwfx1YyIyQvduddQCgLot96389m6Z9iDA5SQh0KK8JlI0qHyY43u+aGtpP/9g==
X-Received: by 2002:aa7:c504:0:b0:51e:10d8:e066 with SMTP id o4-20020aa7c504000000b0051e10d8e066mr1651697edq.24.1689843260572;
        Thu, 20 Jul 2023 01:54:20 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id f20-20020a50ee94000000b00521ce1f04b8sm443021edr.12.2023.07.20.01.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 01:54:20 -0700 (PDT)
Message-ID: <e4486050b95ad53ba9e1d6080c4b6de4b646dcdd.camel@gmail.com>
Subject: Re: [PATCH v3 13/42] watchdog: ep93xx: add DT support for Cirrus
 EP93xx
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: nikita.shubin@maquefel.me, Hartley Sweeten
 <hsweeten@visionengravers.com>,  Lennert Buytenhek <kernel@wantstofly.org>,
 Russell King <linux@armlinux.org.uk>, Lukasz Majewski <lukma@denx.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>,  Alessandro Zummo <a.zummo@towertech.it>,
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
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Andy Shevchenko
 <andy@kernel.org>,  Michael Peters <mpeters@embeddedTS.com>, Kris Bahnsen
 <kris@embeddedTS.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 netdev@vger.kernel.org,  dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org,  linux-ide@vger.kernel.org,
 linux-input@vger.kernel.org,  alsa-devel@alsa-project.org
Date: Thu, 20 Jul 2023 10:54:18 +0200
In-Reply-To: <20230605-ep93xx-v3-13-3d63a5f1103e@maquefel.me>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
	 <20230605-ep93xx-v3-13-3d63a5f1103e@maquefel.me>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_095427_802202_27BF2177 
X-CRM114-Status: GOOD (  10.31  )
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

On Thu, 2023-07-20 at 14:29 +0300, Nikita Shubin via B4 Relay wrote:
> From: Nikita Shubin <nikita.shubin@maquefel.me>
> 
> Add OF ID match table.
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

-- 
Alexander Sverdlin.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
