Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D645EC2BD09
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2024 18:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qgVF2QRlCHiKC6WXgWK9hzAJ9dvjtuTTuJxtZFGboXo=; b=LQjiQ57vd+iQcs
	uBdk0R/35m3XfWktKhKF8gQYtE7ZpfVE9ZWcR5soXAEZYFqxo13F7E7y5DitduN4z7rYCMfugJRY9
	y1/5aus2mYSxcIJHU/IcCCURF8RccGejgs6uQxDgSNFDWCDlW4tA5gs+PSyNPAXpcrMRSyqlFBysW
	eouuL5RDr+wtZiec9SJH+x/lRo0yjZq/ReMuRiHxHcU1o++hNU/iCJtDUWOKqbOj011oasg6nQoMg
	mQXA+kz+C7W8cXYoJwfUEL6wiN1mcpUxKCxUcfn6iFWo2M4wXoFXyFR0J/P+gC230v9So1vxrBLTL
	mcpyPLL660wWWhpYsV8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNGGL-0000000EcTY-1pUf;
	Fri, 28 Jun 2024 18:23:57 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNGGA-0000000EcRH-12z9;
	Fri, 28 Jun 2024 18:23:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 52FDCCE4250;
	Fri, 28 Jun 2024 18:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72894C116B1;
	Fri, 28 Jun 2024 18:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719599023;
	bh=PSU3tdTo76FLPP7xiWLKc41rwOiwu52i+9dzvpqpwII=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=ZdyI0W+nmqUJCWipPdNf4cmBtY+rypYDwx+itWdMspkZMxFXGqTXLiqwqj+P/L2HW
	 ayxR9qnJXpys3ydRLPfokVQx98MOeqM03nKa/ytsBexikuA9liqDpHV1OfVVALU+tE
	 f7Fj4nqi4PEUTPns+yPNM8egQuCOh0Ovv/wpOD+UZ/8SlcGE22Ghaiomf6798XikSx
	 0fgHRjbt7tZT77y95s6ou8xunrmc2rYTHBH4XJGA+fSkOoEi4YpexqWOIht15+aPX7
	 D00T9WThNkC2oKuTUBzvB83od0XpV7aqlLaIS7DCv64svIp/Io9uTUPLn1flWW5vhe
	 Y1c3dtBmP4QfA==
From: Mark Brown <broonie@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "J.M.B. Downing" <jonathan.downing@nautel.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Arnd Bergmann <arnd@arndb.de>, Yangtao Li <frank.li@vivo.com>, 
 Li Zetao <lizetao1@huawei.com>, Chancel Liu <chancel.liu@nxp.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Corentin Labbe <clabbe@baylibre.com>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
In-Reply-To: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
References: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
Subject: Re: (subset) [Patch v5 00/12] Add audio support for LPC32XX CPUs
Message-Id: <171959901719.141669.17001815513243855671.b4-ty@kernel.org>
Date: Fri, 28 Jun 2024 19:23:37 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14-dev-d4707
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_112346_680283_5F96B27E 
X-CRM114-Status: GOOD (  15.90  )
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

On Thu, 27 Jun 2024 17:00:18 +0200, Piotr Wojtaszczyk wrote:
> This pach set is to bring back audio to machines with a LPC32XX CPU.
> The legacy LPC32XX SoC used to have audio spport in linux 2.6.27.
> The support was dropped due to lack of interest from mainaeners.
> 
> Piotr Wojtaszczyk (12):
>   dt-bindings: dma: pl08x: Add dma-cells description
>   dt-bindings: dma: Add lpc32xx DMA mux binding
>   ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
>   ARM: dts: lpc32xx: Use simple-mfd for clock control block
>   ARM: dts: lpc32xx: Add missing dma properties
>   ARM: dts: lpc32xx: Add missing i2s properties
>   clk: lpc32xx: initialize regmap using parent syscon
>   dmaengine: Add dma router for pl08x in LPC32XX SoC
>   ARM: lpc32xx: Remove pl08x platform data in favor for device tree
>   mtd: rawnand: lpx32xx: Request DMA channels using DT entries
>   ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs
>   i2x: pnx: Fix potential deadlock warning from del_timer_sync() call in
>     isr
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[03/12] ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
        commit: 752fea92d9b3e4255a2f75e7efa6fe148562ccbf
[11/12] ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs
        commit: 0959de657a10cc40b2cc41cff9169ab0e0fd4456

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
