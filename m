Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAA6C83F1A
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jul 2025 17:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s21VfXj6DkR4KBtR1shRxJQk8O1oBPaT8pmWPF4UTYs=; b=faoehixDypJks3
	AgPEE11fA2Ac1eqqE6aKUeu6RRh6BR+AmiFEHchX7FDmDza1lipaTVjdWgMmXXDdhJPWnwcJR5lDE
	7YkOVq7gd4PQiBzEq06GAo/QFAqd3wfgbcxl1ZACLdAvKB6kCt5d6+MGc+bs9I3srnzn8ElIitDcM
	3Cou60bDCBlJhwNIsLpYV5ejR/NN/icJqKv11rCP5aDPgqi+1qKQmn77eT+nplQMx7Uj5gs/Y3mY1
	O6m8XWpvZVfx2fovvCB2j6GrWJy/tXkdRICbMOdSVBlGjQhfPRi0DGHzq6WZjge5edK+KT71VFuZs
	4+bO6O9/dj7muoja5wuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uedcQ-00000005fFx-1qW8;
	Wed, 23 Jul 2025 17:51:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uedcN-00000005fFP-3asJ
	for linux-mtd@lists.infradead.org;
	Wed, 23 Jul 2025 17:51:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 32D9C5C5C36;
	Wed, 23 Jul 2025 17:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AF6DC4CEE7;
	Wed, 23 Jul 2025 17:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753293062;
	bh=5++JICrxyrrls/0LDehom1H9z6DxPjc/dsMtzPXB6og=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZfI4synBiJ+1SE1A7h4IaQz2Hx+pHElH+/Sa5QEBmr/DbPxp+2tlCu+M8/FDb5Q1n
	 QZIZ86hVx2CIaeble8IqGmUcNG8CxfYmkQj801ysJj17UuWx9Wos0GBORHFkSK4kle
	 pRlsMPb8LmkV5Hwo2EtxLTRUnpJfLyTRBFwxjUQYX4mEM3si1/odzt4Wqmd6prFtSP
	 F1y4RkaGGcoT7zOuRIun3SDy1/904Z8+B7T3SxaorasIdVZ1q2M/5XgDF3XoHiHmiA
	 muq2FIpRMloy+PZ54Wo65QpPSbgb/SyHo1bcVDwl5h6MwWWcvcXABR0EWao0KQ8dfW
	 mLa2tjYX+MXIw==
From: Mark Brown <broonie@kernel.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250711-qpic-snand-simplify-bbm-copy-v1-1-dd2608325f72@gmail.com>
References: <20250711-qpic-snand-simplify-bbm-copy-v1-1-dd2608325f72@gmail.com>
Subject: Re: [PATCH] spi: spi-qpic-snand: simplify bad block marker
 duplication
Message-Id: <175329306112.97598.14632012143610727616.b4-ty@kernel.org>
Date: Wed, 23 Jul 2025 18:51:01 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_105103_943963_B8CDFA25 
X-CRM114-Status: GOOD (  12.02  )
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

On Fri, 11 Jul 2025 18:32:52 +0200, Gabor Juhos wrote:
> Due to the expectations of the SPINAND code, the driver duplicates
> the bad block markers during raw OOB reads.
> 
> It has been implemented by using two if statements, and due to the
> opposite conditions one of conditional codepaths always runs. Since
> the effect of both codepaths is the same, remove the if statements
> and use a single line solution instead.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-qpic-snand: simplify bad block marker duplication
      commit: 1f590fa4b93dd7c7daaa4e09d8381ac2aab3853c

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
