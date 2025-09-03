Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1A7CA1015
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Sep 2025 02:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9abWdlyD1JzZ0wOH07imOj2w5zmZlL3nKAC6ae5kmc=; b=yYp4bLSQSf5Qo9
	ucBluKZH/zWOhuVaAcdsRhc7uejXJOOy1+FYfUHz+9spCUS2njnNR+YN7LwnKLPyM2xvzZEWASXXh
	mMmlY+vUIwnCqUtEahkH4ekWykmrqPME+4QT7RqOYWVthGJ7XlxaAQZB6RpTZCHSscZhrGUfmWwnH
	rU39/pMAM7+Lot3hlG1n4GpuxKNQjYtjZd8aoBm8+IPt9ycMv5PfFciEmjLuL3LLTsWRGIx/M53GE
	6MIjHYmgVtJSD2VGoZx6n55pv6I2xZKB7GBG7O5hM6SIROP+vRQWiAX4YiJzEDs+YVnpHsqUvhG6Q
	+2yTLQU3OV3R91wFNN1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzQY-00000008E65-3ExJ;
	Thu, 04 Sep 2025 02:10:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uttxq-00000007YHA-2fsk
	for linux-mtd@lists.infradead.org;
	Wed, 03 Sep 2025 20:20:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AFA79601BA;
	Wed,  3 Sep 2025 20:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3DFCC4CEE7;
	Wed,  3 Sep 2025 20:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756930817;
	bh=49+4uYtFX1QMJbxzSswGEGQCDnZWGMG/+guZnJI0h88=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RT6qb/t9B6J06t3tkRoM6uZL1bJFe0R4Q99BJw553PFaESTKtBu3XHcUL4sbheHQt
	 7lkjpOUHn9OpcOJm1IPsa2H7ErwQv1pAOe23CMNJd6KCJs2hq6DYFk1Gq4XZUGiPyJ
	 +M5zEFDCbASpxD2lzOpiRYmoZWMy4+n7KRC0insh9iF+o/WLoHqUovPJSTSCQoDHCT
	 kEv4h+cuZI+1vJpgDerNcGMSYxSwd/YKdGt9DOBIb9xW3zGKpk7AR+74FLft4zpOoR
	 01NIxLMgtZIQ3w60GtEbZerwiilBb/vv7z7FzVj9EOc3VZuJakWWuhYg/j6sBF01cc
	 eA9ZW7P0LEHYQ==
From: Mark Brown <broonie@kernel.org>
To: Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250903-qpic-snand-unregister-ecceng-v1-1-ef5387b0abdc@gmail.com>
References: <20250903-qpic-snand-unregister-ecceng-v1-1-ef5387b0abdc@gmail.com>
Subject: Re: [PATCH] spi: spi-qpic-snand: unregister ECC engine on probe
 error and device remove
Message-Id: <175693081575.280569.13359616771206407047.b4-ty@kernel.org>
Date: Wed, 03 Sep 2025 21:20:15 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-dfb17
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

On Wed, 03 Sep 2025 13:56:24 +0200, Gabor Juhos wrote:
> The on-host hardware ECC engine remains registered both when
> the spi_register_controller() function returns with an error
> and also on device removal.
> 
> Change the qcom_spi_probe() function to unregister the engine
> on the error path, and add the missing unregistering call to
> qcom_spi_remove() to avoid possible use-after-free issues.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-qpic-snand: unregister ECC engine on probe error and device remove
      commit: 1991a458528588ff34e98b6365362560d208710f

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
