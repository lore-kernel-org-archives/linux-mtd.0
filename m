Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541AEC83F17
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jul 2025 15:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=at9qgKhUDVVoSH8oP1dC+P+uaH6clarUAQsTZ7on8z0=; b=W0AqgDNJkICKFf
	in/4z80nYWZ0np2macOJLJdy9nJuAdbz5wR/tfAiUtr0P3iv36EMBm07fxBY2fNdfulChVxgPK0ub
	jXJp5XAg//GVL5TFmeMHmKxlRFEt2AlaVSMkIUKaYbf/16Q0k7CnSPqpLbxWSf4SGTYtKYHjwsSuB
	VXs28EwfHAgV56R7ySmtlUxIspkAaTirr8/2CcdBa0GXNi+5bC1fXYWKND3dGsl9OWJCiFvgVdeNx
	TekGVlWM1qO9CRZtTwr7fAPHAlbM7AATYo000+BinEI85DoWzQb9yni6xYrGTNrhyhqPsqrE34lOS
	SW8Au6UUFBM5or3oKh5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uebj5-00000005QY1-18nl;
	Wed, 23 Jul 2025 15:49:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uebfb-00000005Q52-19zb
	for linux-mtd@lists.infradead.org;
	Wed, 23 Jul 2025 15:46:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 59F54600AC;
	Wed, 23 Jul 2025 15:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DAB2C4CEE7;
	Wed, 23 Jul 2025 15:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753285574;
	bh=4w/DFJ98GqBXik4ktnB0SRascaFEgXt2MIn7gcFChYU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KQtwpykzYKBAPyRedO8oA60/BQztUEakB3SEMvcWNkLTVko5PQX+3z4id96rdb5zt
	 iiIUdqaVUu8/tb7UyqtHrF+mADIvxx68UPfpT2n1esR4ZrHHx1/NrmSadOM5FceXbR
	 ifbmkjahdVe35RT9HmOHNKnkAYS8EEPpLAVCKPrVNeQYk9dqaXfNNbFu7itHJbREWw
	 SFeJkhia+u0NX/WQ4lv5Sqz7UEld3Tph8kK5kJreFpDKeAmaSpE5F/BIUv7ogwXbwx
	 PRARSDr4tuYXragutpamxpNM0OtankWNCL4yb5N0OaHkYr7MEHXaprn9W05OqPKUqf
	 ztM/4H2/QwoLQ==
From: Mark Brown <broonie@kernel.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250723-qpic-snand-fix-steps-v1-1-d800695dde4c@gmail.com>
References: <20250723-qpic-snand-fix-steps-v1-1-d800695dde4c@gmail.com>
Subject: Re: [PATCH] spi: spi-qpic-snand: don't hardcode ECC steps
Message-Id: <175328557230.71989.15440098582685138436.b4-ty@kernel.org>
Date: Wed, 23 Jul 2025 16:46:12 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-cff91
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

On Wed, 23 Jul 2025 10:06:43 +0200, Gabor Juhos wrote:
> NAND devices with different page sizes requires different number
> of ECC steps, yet the qcom_spi_ecc_init_ctx_pipelined() function
> sets 4 steps in 'ecc_cfg' unconditionally.
> 
> The correct number of the steps is calculated earlier in the
> function already, so use that instead of the hardcoded value.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-qpic-snand: don't hardcode ECC steps
      commit: f820034864dd463cdcd2bebe7940f2eca0eb4223

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
