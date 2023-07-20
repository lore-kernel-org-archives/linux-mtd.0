Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B355C0015E
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 16:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WsvSX95mAABn71APfS1eEpj4eJACBc5EXIGxhC+hUsM=; b=DrmjvnPrwHNWdv
	/h6b24iTk1BlI3NKMJ9en+x9zJNbYrOokYyGTM5XWxUME5m/6ogIZ/eB5g1On0kpifLylZejYttDo
	3NOCn7hvyE0/rDr+yUeqHb7lQSayiFKY0UvGb4iZTLkitXSUtGEzn7M4X9glNXuerXfiIEnnsh4Gp
	dMxHGCbnVqafZDZpIrfHYNXLK4KN9BfAGVidg1n7ODS5uahWMX7DhWVELmtC+g3iAmrZLFYkv68zk
	FbeDR/fG4pPE6P5B+68+GahjS7K9MdA3DoMu6FyYSYoOWaqGvVJ+ZUOIM+cxD56g4PO0ngsVZgWKA
	8pTGaPt3IPhzEgMo4s3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMWlg-00Bi3l-20;
	Thu, 20 Jul 2023 16:44:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMWld-00Bi3C-1c;
	Thu, 20 Jul 2023 16:44:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DFE8D61B75;
	Thu, 20 Jul 2023 16:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB08C433C8;
	Thu, 20 Jul 2023 16:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689871480;
	bh=LEysQCPOjkIGVkLgbEHtp05RCrkbKmho1Jnuua4nkos=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=NIyQ8SUkYcWyM9yLSgzx8MPNG0P8iiUExldPhZmRD5Ln3HJahN0rsWbXbDDcQrjAt
	 VBvdgCqp6zZQ0+jJVsALdzwoL+YSCAAzocpGkenN5ghkusUj63+Xwhyj38k+70D/Gg
	 z6bBpkDRiv2mGjW2JLcyl7HMjXlcHgo2YqKbTLmsVmvE3YzgRup93sAhZgFi3k4J+1
	 LSpFfd0vstfSeAOCi2WJX1xWMCIMjIWhrLRbRmk5mJ1C5TS3BMZjD/3iS33PV7H8sb
	 OS5xE0YGwFXfh/Kt3qp8afiRo9pAjHE2AAtBXJzPzzpbQ8lbu4hRZqVLLZCrsjsz7j
	 NiEhb9Kgm24vw==
Date: Thu, 20 Jul 2023 09:44:37 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Nikita Shubin via B4 Relay
 <devnull+nikita.shubin.maquefel.me@kernel.org>
Cc: <nikita.shubin@maquefel.me>, Hartley Sweeten
 <hsweeten@visionengravers.com>, Lennert Buytenhek <kernel@wantstofly.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Lukasz Majewski <lukma@denx.de>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Sebastian
 Reichel <sre@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>, Mark
 Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Vinod Koul
 <vkoul@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Damien
 Le Moal <dlemoal@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Olof
 Johansson <olof@lixom.net>, soc@kernel.org, Liam Girdwood
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Andy Shevchenko <andy@kernel.org>, Michael Peters
 <mpeters@embeddedTS.com>, Kris Bahnsen <kris@embeddedTS.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
 linux-input@vger.kernel.org, alsa-devel@alsa-project.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 00/42] ep93xx device tree conversion
Message-ID: <20230720094437.0e378fb8@kernel.org>
In-Reply-To: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_094441_628400_0C2D6F72 
X-CRM114-Status: GOOD (  13.91  )
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

On Thu, 20 Jul 2023 14:29:00 +0300 Nikita Shubin via B4 Relay wrote:
> This series aims to convert ep93xx from platform to full device tree support.
> 
> The main goal is to receive ACK's to take it via Arnd's arm-soc branch.
> 
> I've moved to b4, tricking it to consider v0 as v1, so it consider's
> this version to be v3, this exactly the third version.

Split this per subsystem, please.
You shouldn't spam everyone with 40+ patches.
-- 
pw-bot: cr

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
