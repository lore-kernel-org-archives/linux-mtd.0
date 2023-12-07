Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D99EC10DCE
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Dec 2023 22:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3nZ/7XOsi3yHLO1GLENMXV4pCdyVGk9GWz6MFkdsXLU=; b=SG7W8oVsQP07Zl
	tZrBPxnDsGNNv1rb/UEgqyAAG/AG91Df6Hv1VZK5T20kF6dtdeZawrHZ6tB+qcZBR/ViHp3fLJEwm
	ipP723NXXoMGU+QgeR9nG5+4PeXqkF05/0ucjdXeC/jTO6L0ooPOUyF3UK2EJGTKQUsjg4vbmmY8Z
	7ytmQsuazB3BiI/FMHCp4RKLBmIyd7mED4FmbOiv8ZZOcpDhOSY3cG+71jO72xpCbspD6HS5SJiyv
	YR0LB63AKSWMkzT2YRTIID86zVbozXGfmIAlHUtoKtQzlVXR6H9hyJOK+q94CnbWUQ79b15ez69vG
	tKKiv7cclBbkI1yARk0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBMxa-00E8xt-2c;
	Thu, 07 Dec 2023 22:35:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBMxX-00E8wQ-1S;
	Thu, 07 Dec 2023 22:35:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 04321620CD;
	Thu,  7 Dec 2023 22:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F8BDC433CA;
	Thu,  7 Dec 2023 22:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701988505;
	bh=NT7BHAqFBOhaRtrY/szkX/r9R8b3Zw9S8V4qsNXM+rg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fM7G8omPRZ7ZWXJv3Rg5R2B74Wc7o7Kd0E7svQfW9jKfF2c9SyQMkDDpP2fwOg2PS
	 TKO6qZXBPmoGXWGrJAefouIWYDB8ffo870ddOmQLfgZp38GIQ2vwXuC+0oI7iBOh5A
	 Dmzh3SXRzNyYbWZvBRERx2CaEge5kWXD5un3ta2VoAnw3dOgT54u79sJmF7LZRjAi4
	 wAyE+jsMQiEYPkN4VoQz3jAoz/AqgbXL0XVNVTtIB0JtpatC8cCnYqQ03ZaxLmbyKD
	 a6Mknh/f6Fz9KzrfxlGNr9kf9sZWMTVB1KDV+sBR/xTblGk3eIJE8dITgwEoK8w1zX
	 AsY+ipMKgV9Qw==
From: Mark Brown <broonie@kernel.org>
To: tudor.ambarus@linaro.org, pratyush@kernel.org, 
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
 sbinding@opensource.cirrus.com, lee@kernel.org, james.schulman@cirrus.com, 
 david.rhodes@cirrus.com, rf@opensource.cirrus.com, perex@perex.cz, 
 tiwai@suse.com, Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 michael@walle.cc, linux-mtd@lists.infradead.org, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 claudiu.beznea@tuxon.dev, michal.simek@amd.com, 
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, 
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org, git@amd.com, 
 amitrkcian2002@gmail.com
In-Reply-To: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
Subject: Re: (subset) [PATCH v11 00/10] spi: Add support for
 stacked/parallel memories
Message-Id: <170198850030.340565.15742297562436442635.b4-ty@kernel.org>
Date: Thu, 07 Dec 2023 22:35:00 +0000
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-5c066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_143507_576342_3CB29F9A 
X-CRM114-Status: GOOD (  16.00  )
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

On Sat, 25 Nov 2023 14:51:27 +0530, Amit Kumar Mahapatra wrote:
> This patch series updated the spi-nor, spi core and the AMD-Xilinx GQSPI
> driver to add stacked and parallel memories support.
> 
> The first nine patches
> https://lore.kernel.org/all/20230119185342.2093323-1-amit.kumar-mahapatra@amd.com/
> https://lore.kernel.org/all/20230310173217.3429788-2-amit.kumar-mahapatra@amd.com/
> https://lore.kernel.org/all/20230310173217.3429788-3-amit.kumar-mahapatra@amd.com/
> https://lore.kernel.org/all/20230310173217.3429788-4-amit.kumar-mahapatra@amd.com/
> https://lore.kernel.org/all/20230310173217.3429788-5-amit.kumar-mahapatra@amd.com/
> https://lore.kernel.org/all/20230310173217.3429788-6-amit.kumar-mahapatra@amd.com/
> https://lore.kernel.org/all/20230310173217.3429788-7-amit.kumar-mahapatra@amd.com/
> https://lore.kernel.org/all/20230310173217.3429788-8-amit.kumar-mahapatra@amd.com/
> https://lore.kernel.org/all/20230310173217.3429788-9-amit.kumar-mahapatra@amd.com/
> of the previous series got applied to
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git
> for-next But the rest of the patches in the series did not get applied as
> failure was reported for spi driver with GPIO CS, so send the remaining
> patches in the series after rebasing it on top of for-next branch and
> fixing the issue.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[02/10] ALSA: hda/cs35l56: Use set/get APIs to access spi->chip_select
        commit: f05e2f61fe88092e0d341ea27644a84e3386358d
[03/10] spi: Add multi-cs memories support in SPI core
        commit: 4d8ff6b0991d5e86b17b235fc46ec62e9195cb9b

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
