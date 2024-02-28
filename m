Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605DDC5478C
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Feb 2024 15:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=olrE+b3GwgRCJsZ6Pi82npW+F/LgRW9+zKp4HF6cKN8=; b=n1bFisvU7o/Z2T
	KMq6Vm/xgKfosacFpZvBuXqpmVu7s70Gi8KN4nEEkMKFG0zfw1rFkAUsubz7vUjGn7SYpE9sERgAi
	1NprxcFvXQR/0UFFaJ1pbkAHflKU9PmEMvtgYLiK0mVCxTIx1iicFTMriy7CW2M5zI4tHFv/IdHCP
	aoReLvQpJxYEFsQ6t89dGZnhl5Uzw0aNYNgMcViJkZcU2UB+o4gtXMkTodbb9LNqYyr1oDdQiwZ4L
	3k+cCYpBbMEp0QgYH9+3KqE8apaCTkNOe2cV15CkJCV6BlQugQ/ncwMlMZJ9j/qglRLvXqB+WSJVM
	ai7XctC2qQUj4pg3ifng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfMFp-00000009zQO-1OmA;
	Wed, 28 Feb 2024 15:53:57 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfMFk-00000009zP0-3Fkm;
	Wed, 28 Feb 2024 15:53:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 070C3CE1A33;
	Wed, 28 Feb 2024 15:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C4CC433F1;
	Wed, 28 Feb 2024 15:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709135629;
	bh=vxRLRVprDDB/c/3M41BNMbhxG1UwYXmCdbjUbmB3KKE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=fH/VpNsCC6yrehn5cwmf2mjsgU1Ga7kLFvddPlrtSi5Jr4CqpQYnnimGO6HSWNh3O
	 P1sksEi+taf0EXpKgvTWOTnRbkQja9l+bSOOMPcaOGxOgSq88KAUk6A8OE94ZgekUk
	 PKdQLGs/2dsH+cPT3ecRVpohSJXMsiWDkMudBu1wj0oL9BuvtO87S4FKrMnmaXAGxp
	 SG4Uzyv1B5O67FmVmHVGx4IRrSCy5EQ9LvQB1aqs1ZQfSHMSBrY3mVj+nFOJNScIHn
	 h/H6FZUVqL4iXcGgFr9D757QehRG1OTvDYME//d5Zi8AqSrdF6Nofkun3/EW0W2f+w
	 hJcYB3olR0OOg==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 conor+dt@kernel.org, nicolas.ferre@microchip.com, 
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
 mturquette@baylibre.com, sboyd@kernel.org, herbert@gondor.apana.org.au, 
 davem@davemloft.net, andi.shyti@kernel.org, tglx@linutronix.de, 
 tudor.ambarus@linaro.org, miquel.raynal@bootlin.com, richard@nod.at, 
 vigneshr@ti.com, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
 linus.walleij@linaro.org, sre@kernel.org, u.kleine-koenig@pengutronix.de, 
 p.zabel@pengutronix.de, olivia@selenic.com, radu_nicolae.pirea@upb.ro, 
 richard.genoud@gmail.com, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
 lgirdwood@gmail.com, wim@linux-watchdog.org, linux@roeck-us.net, 
 linux@armlinux.org.uk, andrei.simion@microchip.com, 
 mihai.sain@microchip.com, andre.przywara@arm.com, neil.armstrong@linaro.org, 
 tony@atomide.com, durai.manickamkr@microchip.com, geert+renesas@glider.be, 
 arnd@arndb.de, Jason@zx2c4.com, rdunlap@infradead.org, rientjes@google.com, 
 vbabka@suse.cz, mripard@kernel.org, codrin.ciubotariu@microchip.com, 
 eugen.hristev@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org, 
 netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Varshini Rajendran <varshini.rajendran@microchip.com>
In-Reply-To: <20240223171342.669133-1-varshini.rajendran@microchip.com>
References: <20240223171342.669133-1-varshini.rajendran@microchip.com>
Subject: Re: (subset) [PATCH v4 00/39] Add support for sam9x7 SoC family
Message-Id: <170913561744.333382.15677696645878162142.b4-ty@kernel.org>
Date: Wed, 28 Feb 2024 15:53:37 +0000
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-a684c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_075353_267278_A9D2F439 
X-CRM114-Status: GOOD (  13.90  )
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

On Fri, 23 Feb 2024 22:43:42 +0530, Varshini Rajendran wrote:
> This patch series adds support for the new SoC family - sam9x7.
>  - The device tree, configs and drivers are added
>  - Clock driver for sam9x7 is added
>  - Support for basic peripherals is added
>  - Target board SAM9X75 Curiosity is added
> 
>  Changes in v4:
>  --------------
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[16/39] spi: dt-bindings: atmel,at91rm9200-spi: remove 9x60 compatible from list
        commit: 666db8fd4265f938795004838d2a9335ce7b9da1

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
