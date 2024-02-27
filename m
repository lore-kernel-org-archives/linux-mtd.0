Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD24C54798
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Feb 2024 03:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ZttBQJEPEv1NwxO9wWh7y1gEP6MR2iZwWEkAnUTL8w=; b=DKT4XAWVb5msXr
	750oFd8nRAJEtgaNmqnKzmmXaLscg8540JRBfxY39eImuCg8GUNlZgYiO4l2kPtd0GYsPxdGQgO2B
	hXPGoCRGbRvZvTaorvwC/G9B/dqljYh19QT2RT7XbY+YcrSggP1yU5RraMAy4z+2Mu3i2ZBPXgBNs
	LfYQB1tF7vQ+RD8zgyfLraiUYatecs61VR1J+gROSdaNH5OklwIO34DgygjGlYAG++/AfCJqEnY/u
	ZkXFxHGpBpwGpMBpMifY33qhGzkmS7toypvl5hzcbNar2yeiWNXeteUwjuy2MU1+zTA5k1MXCS/to
	4Bg25SYNVd3wDkI1VZuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reo1G-00000003adh-1DS4;
	Tue, 27 Feb 2024 03:20:38 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reo1B-00000003acI-3kF1;
	Tue, 27 Feb 2024 03:20:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3AD38CE1B58;
	Tue, 27 Feb 2024 03:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64851C43390;
	Tue, 27 Feb 2024 03:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709004030;
	bh=aEWeFJ2eAgzcvr+OaHdaIiM7TBOw2JHpdO912FAxBrQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GGZalQiNOWNgvr31MEFJ81Scx/q8IuKaZAqiPFZE+SD8pSdQWwG3CioqZpDlRQUAD
	 jKvVifURv7BOpc25WdOU3fYy6BfTMtetonGpoamgfDO3hXxtvjNyuDx94vkioJxfvV
	 MubNjVgf5u85jr4mrAuCzosl1CeEkeDYgrDKshVma4vowdYyZfX9/uNolq5oS00HY6
	 VdQ/8vtg8n+7bDwLjb5y8Yg2i9Qutge32EjMjVf5A2q9l0zWeu9yL5HgzRZ4UWdsvX
	 1U/1FgMqGQhy/VrktEoQPhkUCFsQrCXfoN9l9KW3KzU1jxRXAX9mECe7VQa53IR0gn
	 sUUzlKI2AvVrA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3DB28D88FB2;
	Tue, 27 Feb 2024 03:20:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 00/39] Add support for sam9x7 SoC family
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170900403024.25082.9031028983461362329.git-patchwork-notify@kernel.org>
Date: Tue, 27 Feb 2024 03:20:30 +0000
References: <20240223171342.669133-1-varshini.rajendran@microchip.com>
In-Reply-To: <20240223171342.669133-1-varshini.rajendran@microchip.com>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 mturquette@baylibre.com, sboyd@kernel.org, herbert@gondor.apana.org.au,
 davem@davemloft.net, andi.shyti@kernel.org, tglx@linutronix.de,
 tudor.ambarus@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linus.walleij@linaro.org, sre@kernel.org, u.kleine-koenig@pengutronix.de,
 p.zabel@pengutronix.de, olivia@selenic.com, radu_nicolae.pirea@upb.ro,
 richard.genoud@gmail.com, gregkh@linuxfoundation.org, jirislaby@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, wim@linux-watchdog.org,
 linux@roeck-us.net, linux@armlinux.org.uk, andrei.simion@microchip.com,
 mihai.sain@microchip.com, andre.przywara@arm.com, neil.armstrong@linaro.org,
 tony@atomide.com, durai.manickamkr@microchip.com, geert+renesas@glider.be,
 arnd@arndb.de, Jason@zx2c4.com, rdunlap@infradead.org, rientjes@google.com,
 vbabka@suse.cz, mripard@kernel.org, codrin.ciubotariu@microchip.com,
 eugen.hristev@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-watchdog@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_192034_129678_6E9FAA67 
X-CRM114-Status: GOOD (  11.51  )
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

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 23 Feb 2024 22:43:42 +0530 you wrote:
> This patch series adds support for the new SoC family - sam9x7.
>  - The device tree, configs and drivers are added
>  - Clock driver for sam9x7 is added
>  - Support for basic peripherals is added
>  - Target board SAM9X75 Curiosity is added
> 
>  Changes in v4:
> 
> [...]

Here is the summary with links:
  - [v4,01/39] dt-bindings: net: cdns,macb: add sam9x7 ethernet interface
    https://git.kernel.org/netdev/net-next/c/5c237967e632

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
