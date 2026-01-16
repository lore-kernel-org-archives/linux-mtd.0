Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B725AD4899D
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jan 2026 13:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PIu3ePa6kfFFlJL+bJwVQsHBZ7b/z8uF+zq7BTHhA2I=; b=u/Eak3xDeK0nvp
	gCTxNAutWatbYaXjoybJ6i5QiDQrjPeQO0Vaq7thyBevkpbdKltGOh4IIeQr9armpW+X8w6QiGHwq
	+eRc6EV+eaWJYcSINa9OxdKpjYOO+uQRJA3/kS2wem7kWWhruRTMXoxBH9c/QVh2q4esf6JY325BS
	txjbJkKPZRZeZUI9BCpPCpZnnAdaozPSCz4q8+AvvmGvZpsBD45GwsXrHGkfs/P/p6laDUuTRxpYs
	+gYkcVLJfdaUp3KO/KMEaLBjW0N7RPG7p3KyDmlgmJqsLdHyOzOZlmjhI4xiwd5YEKObAFDzghsbx
	WeBQPHDnmYnlsH6e5TuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjmd-0000000EAe8-1Oqy;
	Fri, 16 Jan 2026 13:22:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjma-0000000EAdU-2MDr;
	Fri, 16 Jan 2026 13:22:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AADCC60150;
	Fri, 16 Jan 2026 13:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A21AC116C6;
	Fri, 16 Jan 2026 13:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768569751;
	bh=2VEdYo29uWhDiLRP2fq9J98xnEkof/Pep3fKzqyIui4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MkQxmtjSLAsRu38Ok5ugheI+luIhbZtgYVTZxIS662au2cdG/G9XcEvn84fHnVa13
	 B+2NL3xg0PZytmkATpKmzSIzsQwbXZjM6tvl5y5pStCLZq6SKH8sGKwe2uAz2cLSE1
	 dS4EMm69bYvYHTTJqKnNVpD3aJLO4xiZC6VgNlk08Tgb0YSOViBXvak44NuqFr1zyO
	 lojMSVY/y3gXI/Kczfm9+vkRvwFkepm4ZZGwFRUo+qsQ1rZIgcUdQ84s9LAnZ31lI5
	 IYvyPZEMZ7vWirvpsGWy3zid0tyhnITI6wDeUiB6FcDwcUmTlX8ZD242S4o+6ayuLS
	 L4euapTRhHURA==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, tudor.ambarus@linaro.org, 
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com, 
 richard@nod.at, vigneshr@ti.com, lgirdwood@gmail.com, 
 matthias.bgg@gmail.com, julien.massot@collabora.com, 
 eugen.hristev@linaro.org, jiaxin.yu@mediatek.com, shane.chien@mediatek.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com
In-Reply-To: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH 0/4] MediaTek MT8192 dtbs_check fixes
Message-Id: <176856974724.65310.2260409999915258318.b4-ty@kernel.org>
Date: Fri, 16 Jan 2026 13:22:27 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-47773
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

On Thu, 15 Jan 2026 13:56:20 +0100, AngeloGioacchino Del Regno wrote:
> This series addresses most of the MediaTek MT8192 dtbs_check warnings
> by adding a missing SPI NOR flash compatible string and fixing both
> the audsys binding and devicetree node name.
> 
> AngeloGioacchino Del Regno (4):
>   dt-bindings: mtd: jedec,spi-nor: Add Winbond W25Q(32/64/128/256)JWM
>   ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks and clock-names
>   dt-bindings: arm: mediatek: audsys: Support mt8192-audsys variant
>   arm64: dts: mediatek: mt8192: Rename mt8192-afe-pcm to
>     audio-controller
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/4] ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks and clock-names
      commit: 60e8451be1f7af4b51540f2cfd65c9c85af752e9

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
