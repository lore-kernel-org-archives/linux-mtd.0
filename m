Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB77EE7719C
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2025 16:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I9ljNq6WxF5drsn35za562ZMAOqzuU25JelDB4xZSfY=; b=gPt3dX8nOXTWp+
	+eQgzG4CPgmG6ZD2MDmOuAYGtV6zqudaMF4kfAwCXCVjDt4BiGPBfU/fJR4jKpnppo6xpJQ4cZ0Bx
	cG2V5nvr2aj9JXdrVBnx3uB6+JYNXCtkgB8F+L5nTr4CJdKxG2YCP7LtB/XGRQFpb5UeLcqIJ9h4q
	ZQMhuoov5UOZvz1q0peugVaOsDfTkdH5SJlRad6hSbxi/7nNex0nNjju3ZluN3ukBK4Pjgt3c4k7Q
	KWmHN4ODcQyZgO7AOUzAzeDArGq4vvGiCWzLUanjJSTVoVTQJAeDWEbXTChqWqWLF0sTokfwL+uCL
	b89qq1Q7XXJ9YXPQ9byg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHdf-0000000GAnO-2tce;
	Fri, 10 Jan 2025 16:13:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHEE-0000000G4vH-42LC
	for linux-mtd@lists.infradead.org;
	Fri, 10 Jan 2025 15:47:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BEDDEA42552;
	Fri, 10 Jan 2025 15:45:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B812C4CEE8;
	Fri, 10 Jan 2025 15:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736524037;
	bh=/Zqa3AGoeCGvcpQ4MTJUuWZlZU37bLafB7PYbUoChBg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=M7wMvdgttdCb7/93cfVX7j5gkXY20wTJ85SywmRo8BgGnTSgQFPICzl5Yrw5IMKOr
	 4qA8gIoJPg/Dhvq2KYA/8wp9eKBz55TQSRnVzH3iTpLRjjGE+2Y6B7ZcVZgkaOnril
	 o+WBmXmV/mTAKAQRjQJ+hRHAFB5b884LqonLtWH4rTIrWwWyJIE4Lg7WV2TdhzM2/N
	 FVcPFQBR5bJ1AGoUWHyYi4S7dbSM3vP8n31pa/RuEMe5fgPnsBV/AjJZZh+xQ3WOGY
	 M4NzG6IDEPRroVcpVwZgoVpeDe8mkwdnQ/YSzXBV9ROjU5cbnpBpRJWkDpIaf7x9JZ
	 8zIC2VzlUjupA==
From: Mark Brown <broonie@kernel.org>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-spi@vger.kernel.org, Steam Lin <stlin2@winbond.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Sanjay R Mehta <sanju.mehta@amd.com>, Han Xu <han.xu@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>
In-Reply-To: <20241025161501.485684-1-miquel.raynal@bootlin.com>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
Subject: Re: (subset) [PATCH 00/24] spi-nand/spi-mem DTR support
Message-Id: <173652403383.316821.3574872566967987721.b4-ty@kernel.org>
Date: Fri, 10 Jan 2025 15:47:13 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_074719_131905_438BCE20 
X-CRM114-Status: GOOD (  13.65  )
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

On Fri, 25 Oct 2024 18:14:37 +0200, Miquel Raynal wrote:
> Here is a (big) series supposed to bring DTR support in SPI-NAND.
> 
> I could have split this into two but I eventually preferred showing the
> big picture. Once v1 will be over, I can make it two. However when we'll
> discuss merging, we'll have to share an immutable tag among the two
> subsystems.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[01/24] spi: spi-mem: Extend spi-mem operations with a per-operation maximum frequency
        commit: 0fefeade90e74bc8f40ab0e460f483565c492e28
[02/24] spi: spi-mem: Add a new controller capability
        commit: 1248c9b8d54120950fda10fbeb98fb8932b4d45c
[03/24] spi: amd: Support per spi-mem operation frequency switches
        commit: d0e5faccb229b1dacc4c9fa11f6df33bb1fdabd8
[04/24] spi: amlogic-spifc-a1: Support per spi-mem operation frequency switches
        commit: 5baa189789e8894c58eacc7803e3c163c1d0fc0a
[05/24] spi: cadence-qspi: Support per spi-mem operation frequency switches
        commit: 06e9f5a1f6ba774d8942a168d3ec5ed5a008fbcb
[06/24] spi: dw: Support per spi-mem operation frequency switches
        commit: eee7bc9e7ade6f7ac17d9ec02887cd5509ba9427
[07/24] spi: fsl-qspi: Support per spi-mem operation frequency switches
        commit: 2438db5253eb17a7c0ccb15aea4252a150dda057
[08/24] spi: microchip-core-qspi: Support per spi-mem operation frequency switches
        commit: 13529647743d906ed3cf991f1d77727e7ff1fb6f
[09/24] spi: mt65xx: Support per spi-mem operation frequency switches
        commit: 13fd04b53053bbfa741a0f2a781837ab80e485f6
[10/24] spi: mxic: Support per spi-mem operation frequency switches
        commit: 67707cb094f134f5b3931eefbedbb9ca7e3209d0
[11/24] spi: nxp-fspi: Support per spi-mem operation frequency switches
        commit: 26851cf65ffca2d3a8d529a125e54cf0084d69e7
[12/24] spi: rockchip-sfc: Support per spi-mem operation frequency switches
        commit: d3f35dd3ad968256ed1080e3ea2022f947861cff
[13/24] spi: spi-sn-f-ospi: Support per spi-mem operation frequency switches
        commit: 1a206344218cc15ad8f321e3abab3f3d36ab639f
[14/24] spi: spi-ti-qspi: Support per spi-mem operation frequency switches
        commit: b2fac3192919dd07e7ce30558e34abd7e07dde77
[15/24] spi: zynq-qspi: Support per spi-mem operation frequency switches
        commit: 9a68f6c8d6cfddeac7c5874528ed04e50a1cb579
[16/24] spi: zynqmp-gqspi: Support per spi-mem operation frequency switches
        commit: 30eb2e6e78225f92f04a2325c6fd77fe8f5b4aab
[20/24] spi: spi-mem: Reorder SPI_MEM_OP_CMD internals
        (no commit info)
[21/24] spi: spi-mem: Create macros for DTR operation
        commit: f0006897a96c736623ddeb9b68c3880eb5cdebe7

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
