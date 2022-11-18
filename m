Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F695C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Nov 2022 14:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NvzkfHwRuoyiHdOUYMKWG2HSMzmGJ8amgy7HobBlM3U=; b=lnPsJxj1k19BQJ
	nuIwPium09R+L1H0QlUBGT/oJnw4gehxjhGQDzkGRHrJV+DPhjYvCqVnvpK9tbJ8Pf16HilWWGUDv
	O4y74YJwLUNx6GLlB4Lj2/r0lBRVxW0FTRQr47EwVKLSZ+wZe0EGWufLLWisALnCSw80ZYhKFXfTE
	m6knX8QQSKFIW71KTBSOoT1RKU+53NxHJ3nI7kaDTy9+iP5BCOqcQwoJE02Hc+p9FKnWkiB8WmkSz
	dbVg97onRq1D3naGB4iQK/otep28SO3NAj3vn4AYId+8vwq3jwn2XN9M0PaxSdMvfyfn9nqF7SNJb
	ZnZJOqE1DeXJ8Ddo1qxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow1zH-004HpN-3l; Fri, 18 Nov 2022 14:04:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow1z0-004Hi5-2y; Fri, 18 Nov 2022 14:04:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B88F6B823FE;
	Fri, 18 Nov 2022 14:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0DD3C433C1;
	Fri, 18 Nov 2022 14:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668780279;
	bh=9yheBu0E5q+IcHeJfS1FhBxw8JfmFK6j4Pq/GK5sFX4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BPEidOVDG18TFLDhuwwd01okKzwhGRscdNNGrtf4z3du1qE173znNmKrsPjSsxOO+
	 2Rl7v2p+7bIp5mQatV6JfknBBGO3vjIMW69Zp3JN+ThrMo/Lv3qmsPx5CeEIfQSlOH
	 GGC8WB3PdVP+o/zEwfqgWMxapTbOlgsA2dPGQPHmoWRNrmg0FXiL/qCjRwnK4JgPaR
	 IsmSX00Tv/jdbbYKNje9janKTI/Tm7bPFa/gi2CppWO8jrjYzjgqTuzsNMOLr12n8H
	 RSsMXEIl+KAIhchiKHwAIRvGMbAaH/+IbV7dqIjDfGQ1sbb/a2PR4Xr9Lk3xi4nXjc
	 tWJBxu56OQvxQ==
From: Mark Brown <broonie@kernel.org>
To: alexandre.belloni@bootlin.com, krzysztof.kozlowski+dt@linaro.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 nicolas.ferre@microchip.com, robh+dt@kernel.org, claudiu.beznea@microchip.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org
In-Reply-To: <20221117105249.115649-1-tudor.ambarus@microchip.com>
References: <20221117105249.115649-1-tudor.ambarus@microchip.com>
Subject: Re: (subset) [PATCH 0/8] spi: Introduce spi-cs-setup-ns dt property
Message-Id: <166878027633.872789.16689184742126026549.b4-ty@kernel.org>
Date: Fri, 18 Nov 2022 14:04:36 +0000
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-8af31
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_060442_344334_6E3AACD2 
X-CRM114-Status: GOOD (  12.62  )
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

On Thu, 17 Nov 2022 12:52:41 +0200, Tudor Ambarus wrote:
> SPI NOR flashes have specific cs-setup time requirements without which
> they can't work at frequencies close to their maximum supported frequency,
> as they miss the first bits of the instruction command. Unrecognized
> commands are ignored, thus the flash will be unresponsive. Introduce the
> spi-cs-setup-ns property to allow spi devices to specify their cs setup
> time.
> 
> [...]

Applied to

   broonie/spi.git for-next

Thanks!

[1/8] spi: dt-bindings: Introduce spi-cs-setup-ns property
      commit: f6c911f3308c1cfb97ae1da6654080d7104e2df2
[2/8] spi: Introduce spi-cs-setup-ns property
      commit: 33a2fde5f77bd744b8bd0c694bc173cc968e55a5
[3/8] spi: Reintroduce spi_set_cs_timing()
      commit: 684a47847ae639689e7b823251975348a8e5434f
[4/8] spi: atmel-quadspi: Add support for configuring CS timing
      commit: f732646d0ccd22f42ed7de5e59c0abb7a848e034

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
