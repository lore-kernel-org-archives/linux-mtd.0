Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DD7D2F34B
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jan 2026 17:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FDLIBinE0HwYPGSyumup9RBYk9OA4ci2T9CAiSe4AdA=; b=3xBT704r7ObcFf
	bFtL0pPcZOpcpn5E8XW7WrfYh7467Hfhx/he2lU0PPD3RCVhFLJ/CjUDnqPp/Pqs13mour7TEasGi
	AxF1sbgxhKGU2B9FbL9GhvC7hCi03Um/EmUvzA2XWEHSalt2rXhuqn2DZDmygZNg9jqGSSfwNC61+
	TEOTN00SvvJEUjUdn66ZnA10n0PBH61h+y2guIsiwk7ckgbYgDJFSWe4hB4tkSMVjRN3tY8SZMGvy
	Mqkrp8eA/xsrjht7fR1k+QcWM3PVTpMa/IGpB+CP0N7y1lvy2zTI4NKbChwFpPv7QSAZKqvpr1K6P
	W5MFd3UeCv2o8xBR3vVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiD9-00000007Wkz-2amU;
	Tue, 13 Jan 2026 17:29:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiD7-00000007Wkd-2nuF
	for linux-mtd@lists.infradead.org;
	Tue, 13 Jan 2026 17:29:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EBD704033F;
	Tue, 13 Jan 2026 17:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B67C116C6;
	Tue, 13 Jan 2026 17:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768325378;
	bh=KeZ8i+3e33/4xT361p0bNijNsA80PiU6Xd5CSu/FXes=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rIrk4+LJ9f4lBj0+ocKmJUujOZEgKECs7HlcWLW+kXj3KRWjcWyewQuirzvTBTGb1
	 b9g9vSEJmrx52JKgVbANkAd/vA38z1vfEr8lytCwLy17Hkg27My4vpDwpMhVKZV81A
	 pkZTWCP2vPPXR1776zmmAoaFk8jFWEWTsaRddPM98LEedxwQQ4YgOJ+W36QRiGD+Gz
	 4wkRbmxmR0IPy/LbvF0NfK7fNOHitIFAU/ziiznqLJaalznqTfHPailHoM3mcPa7vK
	 Kq5uaEDmFFA2K5EqsMFl97WzlXm7LUuzaymjc44yzFYiEtEaBDBx0uCcU0Oc55KY/r
	 XelZQlWxSw9BQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org
In-Reply-To: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
References: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
Subject: Re: (subset) [PATCH v2 00/27] mtd: spinand: Octal DTR support
Message-Id: <176832537652.1101946.8916189938388408130.b4-ty@kernel.org>
Date: Tue, 13 Jan 2026 17:29:36 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_092941_754961_CD3C0A05 
X-CRM114-Status: GOOD (  14.54  )
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

On Fri, 09 Jan 2026 18:17:58 +0100, Miquel Raynal wrote:
> This series adds support for 8D-8D-8D in SPI NAND, which can already be
> leveraged without any SPI changes as controllers already have this
> support for some SPI NOR devices.
> 
> The series is a bit long because many preparation patches were needed
> in order to have a clean 8D-8D-8D introduction (one of the last
> patches), but I believe the split is worth it.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[01/27] spi: spi-mem: Make the DTR command operation macro more suitable
        commit: 0196932f539e306e122b6edf24c9f5e30d1f73ee
[02/27] spi: spi-mem: Create a repeated address operation
        commit: af4b2dc4810380a469dcd7508923b70892c2996a
[03/27] spi: spi-mem: Limit octal DTR constraints to octal DTR situations
        commit: 8618271887ca10ac5108fe7e1d82ba8f1b152cf9

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
