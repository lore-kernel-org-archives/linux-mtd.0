Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA039EB64D7
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jun 2023 00:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VkRFKUGJWuMOeo4+qtmgF3xvq9OpxmSjuYt+YPZkyuE=; b=iZGeODjS1e4E37
	ozV+8+j3jS1uCP/Vrb7SimsFVlw8fXPrATL45f+6L8gsY1YLSKca+xRBeAeNu/gQFH8g69U5SEJc+
	Nu1/3nOO5BlZnQiJ7HyXGPkL0icU4DSXxV0wjDgB2qcjN5wseMrPI6Pnai2gxvW6yU+bHkD6Y83s9
	JMyuqhMO6XF7cp+OCaVdxsokjeB+yXDdV1iGYSZPMsPQfeW/qyovCrY2oRxgkFq2ektjh45MfaOwM
	apUaai1cTAxh+bFaJJpoPe2k6/ehMlorqNHw7rQ8lsNRJAgT+++M9OQsRhwIX57izRnT1fCnqK3GY
	2gg+hn4uPW3A7sYtBwcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCrWM-004xId-0q;
	Sat, 24 Jun 2023 00:52:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCrWG-004xI9-2d;
	Sat, 24 Jun 2023 00:52:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2B1E961230;
	Sat, 24 Jun 2023 00:52:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 728B1C433C0;
	Sat, 24 Jun 2023 00:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687567970;
	bh=r/EW6obxSAVNNGjwUGkGRU+SWh5nEHChw4jIkdrVMyk=;
	h=From:List-Id:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dSOKhy79sEB2zIN2c8ajaVofGMArO0Go+fWumUQL9gmmkAU3QnfwbPH7w9WAaAOOZ
	 w2GYaOr0xjKNeW8QA4o905lF5G9oX5k83Z7NVNVK0BRDZOe0gr7KK1bn3S+/TZ4fA2
	 utNavE4sqCzZkKo0lfmhyMQzNQjXWTcX5MAmp82m8t11shclN2Cy3B6Il2KRsjJqa1
	 L6tvmcwX8j5bfsy21mp78UvjksdnPTlXaMUpDMhWKk+uAqGmyUEFF2mtf7Z8p2Q1XR
	 bRoAQou336boKyaD+3RQxZDzBKli+QkQJk1AGEeapc1CUwRC7l8k9a+I5g79sPTr29
	 PSjHxExxu4Q+w==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 conor+dt@kernel.org, nicolas.ferre@microchip.com, 
 alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com, 
 mturquette@baylibre.com, sboyd@kernel.org, herbert@gondor.apana.org.au, 
 davem@davemloft.net, vkoul@kernel.org, tglx@linutronix.de, maz@kernel.org, 
 lee@kernel.org, ulf.hansson@linaro.org, tudor.ambarus@linaro.org, 
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
 linus.walleij@linaro.org, p.zabel@pengutronix.de, olivia@selenic.com, 
 a.zummo@towertech.it, radu_nicolae.pirea@upb.ro, richard.genoud@gmail.com, 
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, wim@linux-watchdog.org, 
 linux@roeck-us.net, arnd@arndb.de, olof@lixom.net, soc@kernel.org, 
 linux@armlinux.org.uk, sre@kernel.org, jerry.ray@microchip.com, 
 horatiu.vultur@microchip.com, durai.manickamkr@microchip.com, 
 andrew@lunn.ch, alain.volmat@foss.st.com, neil.armstrong@linaro.org, 
 mihai.sain@microchip.com, eugen.hristev@collabora.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org, 
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-usb@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org, 
 Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: Hari.PrasathGE@microchip.com, cristian.birsan@microchip.com, 
 balamanikandan.gunasundar@microchip.com, manikandan.m@microchip.com, 
 dharma.b@microchip.com, nayabbasha.sayed@microchip.com, 
 balakrishnan.s@microchip.com
In-Reply-To: <20230623203056.689705-1-varshini.rajendran@microchip.com>
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
Subject: Re: (subset) [PATCH v2 00/45] Add support for sam9x7 SoC family
Message-Id: <168756794811.1155588.11719780333735420720.b4-ty@kernel.org>
Date: Sat, 24 Jun 2023 01:52:28 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-c6835
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_175252_954051_E5204D20 
X-CRM114-Status: GOOD (  14.61  )
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

On Sat, 24 Jun 2023 02:00:11 +0530, Varshini Rajendran wrote:
> This patch series adds support for the new SoC family - sam9x7.
>  - The device tree, configs and drivers are added
>  - Clock driver for sam9x7 is added
>  - Support for basic peripherals is added
>  - Target board SAM9X75 Curiosity is added
> 
>  Changes in v2:
>  --------------
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[32/45] spi: dt-bindings: atmel,at91rm9200-spi: add sam9x7 compatible
        commit: a3eb95484f276488e3d59cffa8eec29f79be416e

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
