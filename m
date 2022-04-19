Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AF5C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 22:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FSFGDgJcYmhgC+249RCK01yw3MFMXQHtxB+awqrZL2g=; b=IHA5XUpm/zoU+S
	w2YLDyadGENeAOFSWX11amETt/YPptGJv2+IPppidHteH9d0ypyAVmYkKEC3BCmMhwn3wsBGH6bJU
	QS0DqjVnZI5E1beDAuAZ0BjUtv2Er1sLL4ypc2rUMr1FC63bzW/j68n12mDPyLv6V/NcKPPm3suLj
	e7g8k8jjzeVNfGuNwfV00iVaWBrwa4mM5CUnbe1NK0IdYky28NyE6zywTcyG2zdOtbUaAEIjHY5w2
	gKUNwBljRUOwJrIlh1V8VgNGkoscS73SluXgikgyPwKBCWrGvZebCM+CHRaKo2MeW0eOKBUGSB4yO
	YhmSekUEZ8xMUj9lWY2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngwbX-006ZII-1R; Tue, 19 Apr 2022 22:45:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngwbN-006ZFs-84
 for linux-mtd@lists.infradead.org; Tue, 19 Apr 2022 22:45:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CB8DE617F2;
 Tue, 19 Apr 2022 22:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6B2C385A7;
 Tue, 19 Apr 2022 22:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650408340;
 bh=rV50n0uTCGCXYgFr8OF+/p5wQ7DUshqQmQOk+OEuVgk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=VBfWdwOlB3oCEqBno0WthwD+hoiBJSQAKRiLy5SMMhpgLRLZGolC2IGH5wWf+35Qw
 h0XVhQF6xWUcZsM9DJYm0Gkwigo+9uqb0BonEaXiFolh2FhSdlE70nXGvbm4c4IjO9
 0/N3VpuyqwH4wjXtQ0mNkFsq9/8cYnQnQfcdl15D1p8whO+mcHWCH685Ts3E9klfec
 Up3242B3iAIopR4IFNrHxj/N0c2F+kt2NFEm0SP39nfUV+/tJqANp4/Y74EpK4Q91u
 mTOX4NUg8ZLVRgZkVurtVw9GAKDw/endjApLkUAarp6Twfxb2z61s8Sy7L9zKvuPck
 E5beWU+EPmSpw==
From: Mark Brown <broonie@kernel.org>
To: mika.westerberg@linux.intel.com
Cc: tudor.ambarus@microchip.com, linux-spi@vger.kernel.org, p.yadav@ti.com,
 linux-mtd@lists.infradead.org, michael@walle.cc, boris.brezillon@collabora.com,
 hongli.li@intel.com
In-Reply-To: <20220411113158.2037-1-mika.westerberg@linux.intel.com>
References: <20220411113158.2037-1-mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 1/2] spi: intel: Fix typo in kernel-doc of
 intel_spi_probe()
Message-Id: <165040833836.1910395.16344107154371585691.b4-ty@kernel.org>
Date: Tue, 19 Apr 2022 23:45:38 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_154541_361367_3C945238 
X-CRM114-Status: GOOD (  11.23  )
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

On Mon, 11 Apr 2022 14:31:57 +0300, Mika Westerberg wrote:
> Should be 'specific' not 'spefific'. Fix this.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: intel: Fix typo in kernel-doc of intel_spi_probe()
      commit: 4bbaa857e9af76d8cc346bd57fbaa50d357ae132
[2/2] spi: intel: Implement dirmap hooks
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
