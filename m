Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4792C28B30
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Mar 2025 15:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cQubJZbovAjcLH23SlKSjXY/AlJNjYy/P/Dx5JmUNZA=; b=wMWDVRVo+IYVCP
	EqQbQwzu+IAVFgNMREwVagBUgnDokf+pcLg5R0MSgtg9Ga88FtqDWZ+0Er9R9QJcbGROChIUAvgsz
	kKs1yGksTj/voiejHqhxFRy/3bn3HucQAh3hHgG7Ab9onm5jgebPegIWEAQPsNzhLQ76f2IxGllRW
	RYZ11WwNf9Vn1kmxZeC2v4qJlgVmZY2XmF5365qQ+tdeOVQFnAnNpy817bolSed1+QdWWafmHXkJl
	Snt01Zn7FoCFnZ/lmt9xuDbCc9RfzPs3ny2pTmGKfHJg18sib/fHEz9QG9RLdtDpJQHJUPsrqOZGI
	VvlWOaqxcPaDCgQyG4Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvHfs-0000000CW3H-0E1t;
	Thu, 20 Mar 2025 15:19:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvHfr-0000000CW37-20dJ
	for linux-mtd@lists.infradead.org;
	Thu, 20 Mar 2025 15:19:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A28561145;
	Thu, 20 Mar 2025 15:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E66F3C4CEDD;
	Thu, 20 Mar 2025 15:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742483950;
	bh=qb5dLKIrfE/3SIP/jCYUnPGXb75Ce06vY+B+cKEJ0Ic=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uNDIFuk73iVzhG7OfjLqHxdVaSqXMAmSh/ZJ/eY8c7/QzVEjIGq2imP3jK4mYe9v0
	 tS/Brm4ZsGoq8ngZcwPn+k8XKP1NY6Wh9GeOzsq8n2NP3+rElU5kkPfRf2YeT4oLXW
	 QD1LV1V9486TA0wn5C28RGUhd1Auj6pLLPpUfZDeTU7zmvO+XHj5zynQE9YcxO7WKb
	 dfZAw5N66jtlG0oA5ZkoW2ek6V+jHB3ozDb+IIrPIvMBd4woBHFR2nb+wgVyI9EUdM
	 G3sSAmWRZkS4dyv7nhfVavpxNdnSL553/UmIdRsVJizaceRHddE0c5Whjnl0TihqZJ
	 selvCPtF49D3Q==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
 linux-mtd@lists.infradead.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250320115644.2231240-1-miquel.raynal@bootlin.com>
References: <20250320115644.2231240-1-miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2] spi: spi-mem: Introduce a default ->exec_op() debug
 log
Message-Id: <174248394868.69458.14767560574685655973.b4-ty@kernel.org>
Date: Thu, 20 Mar 2025 15:19:08 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-1b0d6
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

On Thu, 20 Mar 2025 12:56:44 +0100, Miquel Raynal wrote:
> Many spi-mem controller drivers have a very similar debug log at the
> beginning of their ->exec_op() callback implementation. This debug log is
> effectively useful, so let's create one that is complete and concise
> enough, so developers no longer need to write their own. The verbosity
> being high, VERBOSE_DEBUG will be required in this case.
> 
> Remove the debug log from individual drivers and propose a common one.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-mem: Introduce a default ->exec_op() debug log
      commit: ad4488845193e81549c11903a5083b4c9cc19785

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
