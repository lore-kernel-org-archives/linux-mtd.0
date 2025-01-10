Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC23E7719C
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2025 19:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4F+Rcb+k3qd5RJdP1Ae5ldG7IoX3tEGQAaZZaKbzCPw=; b=E5/JhhVbXB652k
	/N3fojDYm5niR6hw3b54mibMsUN+8+2E6R1njP2S/n5xKn5bvNN3W4LOXJgOybSOivlau/OQoA6OC
	qxLWI2nrJTO0bNCL1gu9IsAdMygtWq0A/N6BS+pIepLdYsG5vrPPHGr0wdHKw3lHviIkYRq4Is7uK
	z4jPVBnKlxi8VB89sAK3rgh2TFPqylEFsTKaBoMGh68qeAZhfbO4xb2lSK6AIxnrud/JOrbEkRjmb
	/Rd9KkXVHmFntdDL6AIcB3DPhyK9tIqGjpFYLR4HqzILr/IUvoIrMllYxVDoOnDtbky9u05IUrzYs
	kktbUJNDnDeanLWezSeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKM4-0000000Gi99-0S6w;
	Fri, 10 Jan 2025 19:07:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJBk-0000000GUqe-3mdm;
	Fri, 10 Jan 2025 17:52:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 340365C5115;
	Fri, 10 Jan 2025 17:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBAD3C4CED6;
	Fri, 10 Jan 2025 17:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736531571;
	bh=SFidNPCEzzdhqDMHpT0ZBS1qDa7/zS3vqT1bcr65LnE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hJ9bZT9tczqg36KU4u6eeqTb1soNKUi4jFKxz0hhNEszVpwr9k9zEWBeBj7Mv9EED
	 WkgOWH7Sb6St0SIyCxaPqkDmrETi94j9+2Ii3LVSi50No2Tk9CRK/+4lP24fibBK+C
	 4Xi60yQOKPXklaK9wG0OHqz+GL9IWOfAfGvWL/mx95640061C2vJ9JNQWZHjp8e1SJ
	 tk2Au3qdBiIO8/j+Vhg+Mn2ElcAgfycx4KvLzJfuqwmIlZUJCgL8rgJG0ixc4veeVD
	 5jxTUrrLRJ50EQtM2lNw2rOhAolT6/GzU0UpbvdfSKClNKd26SMe3dm35W60OL39tW
	 +EFtowt4redjg==
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
In-Reply-To: <20250110-winbond-6-11-rc1-quad-support-v3-0-7ab4bd56cf6e@bootlin.com>
References: <20250110-winbond-6-11-rc1-quad-support-v3-0-7ab4bd56cf6e@bootlin.com>
Subject: Re: (subset) [PATCH v3 00/27] spi-nand/spi-mem DTR support
Message-Id: <173653156367.340868.12224888423783635897.b4-ty@kernel.org>
Date: Fri, 10 Jan 2025 17:52:43 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_095253_031505_F58891A9 
X-CRM114-Status: GOOD (  13.55  )
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

On Fri, 10 Jan 2025 15:45:02 +0100, Miquel Raynal wrote:
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

[20/27] spi: spi-mem: Estimate the time taken by operations
        commit: 226d6cb3cb799aae46d0dd19a521133997d9db11

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
