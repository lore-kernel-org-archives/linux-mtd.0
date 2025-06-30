Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B634CC83030
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Jun 2025 12:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AKeyl+r6jnERUMNMme/Pa64/oSraD2/raD15AmhWjeY=; b=ut9mA372JK6hpE
	QGYhREe+kV8k8say0HbAkMRYNSH03Nttvset3DGoon/tjHFlTey1ZxmwxVn5ggcdvWs2aQ62NqbbP
	RUq7Kytcy6HA9TIKH4nuKYuD0FSvwPve+/lTIrA/PnxxCQB2l0+HZ+qqGPqf2A8eXGkpS3rrngahD
	HmVh9fqh6s6nVDyG2x8zA4yb25vsfCeltqiOKeBz5vL0T67PKyStNrfHj5gWluCIeVkEL7XtaEf6J
	pBx4E100unlSVml64Uu/AbaJqGdJTokE8fjZBIf5za2Y+AbfuOUez639GS0YRm8XxJYObMd38UIFL
	bcLXbCBh5/rpzvAaRAsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWDrJ-00000002E8E-3xFX;
	Mon, 30 Jun 2025 12:43:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWDlf-00000002Cwq-3fNh
	for linux-mtd@lists.infradead.org;
	Mon, 30 Jun 2025 12:37:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 72DF6463A2;
	Mon, 30 Jun 2025 12:37:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B7BC4CEEF;
	Mon, 30 Jun 2025 12:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751287071;
	bh=MgteINiIKUQxM+bP/XS1w/Exa/rjYBe6TpvG+0r5tHc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cVd4TYtVqTETn+Jn4o6QczGXELg7AdEF4TxhCrZ3a7C8RtfZFZTR+Nz/2dv33RhBq
	 9oSb4XxIjI4P3Tsah3SMIxBe4NvvjKm1ia/xWQ8uns3a7Ju/Ymph1qGxkpsH8f/HOl
	 qoX/VpIf8Qzz7b6YpMvGKMW1AG6tJdTkaGt9370dBjGKk5BNlF3LLDrOA+lpy9zHWg
	 vU43e1ouMJe+2adJHFJSPCJVHZ7V0FVtmTIXfSXPXziUK98IbgFz/nIgEHXlDMT5Vd
	 Mt7g9FR8PGkOafqN/gSs/UIUPvgPdQmJFRtA3LROK/gE1FqSQwnSMI0j5U1wda8RP/
	 x4oVZCYG+KUEw==
From: Mark Brown <broonie@kernel.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lakshmi Sowjanya D <quic_laksd@quicinc.com>
In-Reply-To: <20250618-qpic-snand-avoid-mem-corruption-v3-0-319c71296cda@gmail.com>
References: <20250618-qpic-snand-avoid-mem-corruption-v3-0-319c71296cda@gmail.com>
Subject: Re: [PATCH v3 0/2] spi: spi-qpic-snand: avoid memory corruption
Message-Id: <175128706885.37861.8770064610677476494.b4-ty@kernel.org>
Date: Mon, 30 Jun 2025 13:37:48 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_053751_939610_939F143E 
X-CRM114-Status: GOOD (  16.46  )
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

On Wed, 18 Jun 2025 22:22:48 +0200, Gabor Juhos wrote:
> The 'spi-qpic-nand' driver may cause memory corruption under some
> circumstances. The first patch in the series changes the driver to
> avoid that, whereas the second adds some sanity checks to the common
> QPIC code in order to make detecting such errors easier in the future.
> 
> Preferably, the two patches should go along in via the SPI tree.
> It is not a strict requirement though, in the case the second patch
> gets included separately through the MTD tree it reveals the bug
> which is fixed in the first patch.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: spi-qpic-snand: reallocate BAM transactions
      commit: d85d0380292a7e618915069c3579ae23c7c80339
[2/2] mtd: nand: qpic_common: prevent out of bounds access of BAM arrays
      commit: ddaad4ad774d4ae02047ef873a8e38f62a4b7b01

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
