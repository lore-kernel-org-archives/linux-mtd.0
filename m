Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDCEE77188
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2025 16:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B6nJzA48TIf3JkSByesdcB+8A1WFo31OZFZ2FWkYTpQ=; b=KKgIdXqHKHmhK9
	wvgv2o3KoLMfWcucjtYzgWuLpgYpZrK0FpgjVp5YI1ohPFmDN5+xppBodhOgdYAoTr6kJYAKgWl7d
	vUcEqxMo6WMxJzJrnnS6xN+z4eTVcQDZbxgOBR+rokxcP/j6RVREqgBzLgtpKWdR4DaCwUXsYVCQ+
	+eYpdNJrsb1VQGcFEEtWM9USdVsf/x58r3NYiBackUTH82SQ4NYXL8v9kgO0B0VoHnobtjXn1oiqe
	C5J9OXYV6uX+9sk3feALhtJl5dAeLA3lRNvmouVPmmWgKBaF5hHBiMh5dcSUBarUPpU0ZK5TelcTL
	lNxe8HLvMsF2H/pw9v3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHes-0000000GB80-08zS;
	Fri, 10 Jan 2025 16:14:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHEN-0000000G52q-2F0M;
	Fri, 10 Jan 2025 15:47:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BA8BD5C338E;
	Fri, 10 Jan 2025 15:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF99C4CEE1;
	Fri, 10 Jan 2025 15:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736524046;
	bh=v73Vw62MTNkPdqw8cVZvUOLB+25Ygi2g/dhpqPSNGOs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=l/Tqf1J0YeqgmGTlb9OUQ/Wvq+oCw2zgnE8wFFqL59zvdOgp7O+gqxEegYCMlag5B
	 Q6YYo8nE4BAqap4CwWdBHEB5spPiRJAR3xfPANPsrUl8QBsBJkFuY9/mmloDugDn53
	 oTrzlRuyCsQh3Pip0J9mKHKMBRqWqQrHqvRlba7lqg2A2mhrzj5cyWW+hzMCeL8RK0
	 5GclltoKebgtyrLyhSxH8ccfanUNpL8t1yEknIhnlxVvFmJDoCR6QoQO2CNOzLGW18
	 eGfHAbzkQCEt/QvPwSazROLltVeDVxhce+xTw1U85pnahOGx6/HmZUCI7bRjv8s9WC
	 Mv9KDA4WfFk4A==
From: Mark Brown <broonie@kernel.org>
To: Sanjay R Mehta <sanju.mehta@amd.com>, Han Xu <han.xu@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Raju Rangoju <Raju.Rangoju@amd.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <stlin2@winbond.com>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mtd@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable+noautosel@kernel.org
In-Reply-To: <20241224-winbond-6-11-rc1-quad-support-v2-0-ad218dbc406f@bootlin.com>
References: <20241224-winbond-6-11-rc1-quad-support-v2-0-ad218dbc406f@bootlin.com>
Subject: Re: (subset) [PATCH v2 00/27] spi-nand/spi-mem DTR support
Message-Id: <173652403824.316821.7989247622292618802.b4-ty@kernel.org>
Date: Fri, 10 Jan 2025 15:47:18 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_074727_662851_2701A901 
X-CRM114-Status: GOOD (  14.17  )
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

On Tue, 24 Dec 2024 18:05:45 +0100, Miquel Raynal wrote:
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

[01/27] spi: spi-mem: Extend spi-mem operations with a per-operation maximum frequency
        commit: 0fefeade90e74bc8f40ab0e460f483565c492e28
[02/27] spi: spi-mem: Add a new controller capability
        commit: 1248c9b8d54120950fda10fbeb98fb8932b4d45c
[03/27] spi: amd: Support per spi-mem operation frequency switches
        commit: d0e5faccb229b1dacc4c9fa11f6df33bb1fdabd8
[04/27] spi: amd: Drop redundant check
        commit: e6204f39fe3a7b4538815a2d778b601bd543649e
[05/27] spi: amlogic-spifc-a1: Support per spi-mem operation frequency switches
        commit: 5baa189789e8894c58eacc7803e3c163c1d0fc0a
[06/27] spi: cadence-qspi: Support per spi-mem operation frequency switches
        commit: 06e9f5a1f6ba774d8942a168d3ec5ed5a008fbcb
[07/27] spi: dw: Support per spi-mem operation frequency switches
        commit: eee7bc9e7ade6f7ac17d9ec02887cd5509ba9427
[08/27] spi: fsl-qspi: Support per spi-mem operation frequency switches
        commit: 2438db5253eb17a7c0ccb15aea4252a150dda057
[09/27] spi: microchip-core-qspi: Support per spi-mem operation frequency switches
        commit: 13529647743d906ed3cf991f1d77727e7ff1fb6f
[10/27] spi: mt65xx: Support per spi-mem operation frequency switches
        commit: 13fd04b53053bbfa741a0f2a781837ab80e485f6
[11/27] spi: mxic: Support per spi-mem operation frequency switches
        commit: 67707cb094f134f5b3931eefbedbb9ca7e3209d0
[12/27] spi: nxp-fspi: Support per spi-mem operation frequency switches
        commit: 26851cf65ffca2d3a8d529a125e54cf0084d69e7
[13/27] spi: rockchip-sfc: Support per spi-mem operation frequency switches
        commit: d3f35dd3ad968256ed1080e3ea2022f947861cff
[14/27] spi: spi-sn-f-ospi: Support per spi-mem operation frequency switches
        commit: 1a206344218cc15ad8f321e3abab3f3d36ab639f
[15/27] spi: spi-ti-qspi: Support per spi-mem operation frequency switches
        commit: b2fac3192919dd07e7ce30558e34abd7e07dde77
[16/27] spi: zynq-qspi: Support per spi-mem operation frequency switches
        commit: 9a68f6c8d6cfddeac7c5874528ed04e50a1cb579
[17/27] spi: zynqmp-gqspi: Support per spi-mem operation frequency switches
        commit: 30eb2e6e78225f92f04a2325c6fd77fe8f5b4aab
[18/27] spi: spi-mem: Reorder spi-mem macro assignments
        commit: d1f85873d2d62d6980e68d21d3a21f20b0664cc3
[19/27] spi: spi-mem: Create macros for DTR operation
        commit: f0006897a96c736623ddeb9b68c3880eb5cdebe7
[20/27] spi: spi-mem: Estimate the time taken by operations
        (no commit info)

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
