Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6353CD5B16E
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Dec 2025 13:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zzuVm/cSibT7OUcF5wEMmAfT5gLckbM9P5giU1Flhjc=; b=IDYb8xxFKz4jFu
	nSLB8xoEtHrdbyNJTsKwmPDOlda9Zx4vnCVipJY3ceXedWJy6ExyY6CgCI4Vr43KpDVx5+Isiu6sJ
	6Ge95rx417mIKJyIy5zQwbzsRzOAOtVE/ianXKRvWKpRByHbaic7feodr8cJzCJez90/ttY+yXKJY
	mw5DjFygkwXMnhEduBid15EErtA39s2z/8084Bdnaw+mdszrWQl/2b0oTCD2vVhXfZMOeNvNglCCU
	GRABqcAHsxCufRP/8CtY8YOwnYvk4APAbKEES+wH8GzWuqj3uip0zV9slgpHjU/6NJo4Q6lTh5Cds
	OFxLsxdNZrYH7Mh1UlnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV96j-00000003j5P-0dCY;
	Mon, 15 Dec 2025 13:59:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV96h-00000003j4f-3kzr
	for linux-mtd@lists.infradead.org;
	Mon, 15 Dec 2025 13:59:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 56EDD60133;
	Mon, 15 Dec 2025 13:59:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1225C4CEF5;
	Mon, 15 Dec 2025 13:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765807163;
	bh=aCAKHeRz0R1Pp79NnKo9Pw2t9f3vwIJOW1wBLc3sFv8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XUK+XdN8VUJ/wmD7y7N6QNnA34TyypFdS29JvTN/YGUNcI4c7vdL8gka52RXgnwLv
	 K8mNzrvmdgPLTaXXd+oqdHpksRcE2Od1s2qx6g0cWz+5IYrl7N3ZVyIVDN9PkLjMCk
	 /yxWNE2o6Qt/tiDpcCZaqGzkPuLjWumIDPfjmXM1SZHY6RFOtV50zDfq4zhECOYTs7
	 j4eLQ3dZ0p9EnNSpGxukd3vVE7PdwvQZQVn/kyRP3+9ejEK8Zqs7+sxzn3HuQ/6nZd
	 aC04MkhkJ8XBTKzBz6eThK8aPobIWV1Hdc1Q7KKV2GouYgNI19V24VkFtntT/O9ZOe
	 0S/dwYZwXIyoQ==
From: Mark Brown <broonie@kernel.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20251129-qpic-snand-superfluous-readloc-v1-1-b84ca17095d9@gmail.com>
References: <20251129-qpic-snand-superfluous-readloc-v1-1-b84ca17095d9@gmail.com>
Subject: Re: [PATCH] spi: spi-qpic-snand: remove superfluous
 qcom_spi_set_read_loc() calls
Message-Id: <176580716116.161463.15413695989499192950.b4-ty@kernel.org>
Date: Mon, 15 Dec 2025 22:59:21 +0900
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-47773
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

On Sat, 29 Nov 2025 11:29:27 +0100, Gabor Juhos wrote:
> Before configuring the registers related to page read, both the
> qcom_spi_read_page_ecc() and the qcom_spi_read_page_oob() functions
> are calling qcom_spi_set_read_loc() to set the read location for the
> first codeword.
> 
> However the qcom_spi_set_read_loc() function puts the passed value
> into the register write cache only, from where those gets written
> to the corresponding register later via DMA.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-qpic-snand: remove superfluous qcom_spi_set_read_loc() calls
      commit: cde4e63e847b4d41f017c2beb119c2668106a88a

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
