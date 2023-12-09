Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEFAC10F04
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Dec 2023 01:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c7HrOjxgD4hP9MahG6r6CbHtKlLDeXmAjSNilksx9fI=; b=ZN+jhFADW+fjo1
	pfERJRnp6V4x+DIqY8+1SnF8DAtddHwVImEDqwe0kkdXr5QQMz22N78Csuctqh6v5Ajj/jlOxS9jH
	BOrb1c+OfYXk/hpC7tcjA/yOb5k2diZpPekj1jJvsWnepBVLcABMDaifIEiYbsqpaB6XxfDu4+AsF
	kPnQCL+n+OcnPLXlieL76ojGJ9yMA4xZFvcy7U/X/9ReCPQPwflkNmwE2o5Qqc4tJJaeUNAj67wjP
	/76Zyl1ifOgwAN/lgxown/1GoPY3/SwhBjTLyseCu5PtlE99MoDuYJTNkenJADCodLP/IFX0tMsuV
	TMH2PiJ+fRBg1W6OO/uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBlpH-00GsDP-1e;
	Sat, 09 Dec 2023 01:08:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBlpD-00GsCE-2l;
	Sat, 09 Dec 2023 01:08:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 45CEEB83114;
	Sat,  9 Dec 2023 01:08:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D41C433C7;
	Sat,  9 Dec 2023 01:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702084088;
	bh=2K+JGgWzd0uvMnBn7tqdv3ZVJoRXQSqeh9A9RoILMCQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QtaW38aEctENnrOTJTMrtFOweb20lGnPiTo4yNLTwrdjss82tCBbCf821XyGzaplI
	 abxSFD5JzZrfPpdK3siz2VFpwGTZ5kAclcRP5F5xfnhq4i+5sBYSiicxZTPSwypxuH
	 rw3Dv5TgmfvDGpobLJvhekahh9kWfdX7pvQSo2f8eCrM9kyhQ5QUORdL3Uiq/mrAR5
	 jcGEza6aXLSwhB07OVxvtvJv6/6NgDya0IfeD5CeLnkQKAUaCAw/xLlN6z+w1rgB8y
	 X378Eh40Tf6ZDwes0HXtgwWiZvapqTb2YXIuWSDrj3czomFrtvfVPGAhO2sej08w6x
	 S4llrB7i5Jq0g==
From: Mark Brown <broonie@kernel.org>
To: tudor.ambarus@linaro.org, pratyush@kernel.org, 
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 michael@walle.cc, linux-mtd@lists.infradead.org, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 claudiu.beznea@tuxon.dev, michal.simek@amd.com, 
 linux-arm-kernel@lists.infradead.org, git@amd.com, amitrkcian2002@gmail.com, 
 akumarma@amd.com
In-Reply-To: <20231018213328.40131-1-amit.kumar-mahapatra@amd.com>
References: <20231018213328.40131-1-amit.kumar-mahapatra@amd.com>
Subject: Re: (subset) [PATCH v9 0/8] spi: Add support for stacked/parallel
 memories
Message-Id: <170208408432.2911266.7193653673078869891.b4-ty@kernel.org>
Date: Sat, 09 Dec 2023 01:08:04 +0000
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-0438c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_170812_046683_9486EB32 
X-CRM114-Status: GOOD (  12.51  )
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

On Thu, 19 Oct 2023 03:03:20 +0530, Amit Kumar Mahapatra wrote:
> This patch is in the continuation to the discussions which happened on
> 'commit f89504300e94 ("spi: Stacked/parallel memories bindings")' for
> adding dt-binding support for stacked/parallel memories.
> 
> This patch series updated the spi-nor, spi core and the AMD-Xilinx GQSPI
> driver to add stacked and parallel memories support.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/8] spi: Add multi-cs memories support in SPI core
      commit: 4d8ff6b0991d5e86b17b235fc46ec62e9195cb9b
[6/8] spi: spi-zynqmp-gqspi: Add stacked memories support in GQSPI driver
      (no commit info)
[8/8] spi: spi-zynqmp-gqspi: Add parallel memories support in GQSPI driver
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
