Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D45C54754
	for <linux-mtd@archiver.kernel.org>; Thu, 15 May 2025 07:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q7gIdi24Q480Sd0+6gp3EWXbfR/F+1NZlaX9Hwrf9bI=; b=CQwy/HEnnCFMIF
	pd4sqlmKsUymEkwmrFJxKvFMqnVQrJkd9fTAZHJfLBigE2Dv4CWU5u9W677YZrXocr7qJuxUyTEz0
	LXP0Uqe3/100iTh6w2hfjIUb6RJ4Ctk/xjWpAMJQyWQuk6TxlxjiJClb5+txHP84aGP/N9jXRuI0k
	rae/oF8T+pUTeQ1hZIn6YBsw/fyqQZSFTVvFtdOhlLx8ymnlIK6fu/V1WdjWkcdnwzVBcNmtCbulb
	jvT2UOdleEfD/zJXIAuwZ53PKsn0gA9D1KIDJ1F9ZNz2GK2l2Hrfg44HLSYecPTaHs/XltFo6UtF5
	O22gKzrS3lfnqpiCavcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFT9p-0000000HNHO-3PGo;
	Thu, 15 May 2025 07:37:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFT84-0000000HMyK-1dps
	for linux-mtd@lists.infradead.org;
	Thu, 15 May 2025 07:35:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CA42D614B3;
	Thu, 15 May 2025 07:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7B9C4CEE7;
	Thu, 15 May 2025 07:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747294543;
	bh=ZGqhlVU+6Emh7nm8gXe/l4szD7AQKdUsT7UjppTo/Hc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bRoFcG1SGszUdhO8yF6/iWM2ASI88v+yD+FMjtga4NajMtvxYMmKnhSadVU6m6YZB
	 fMJP7UuJNH3o2CWQx59nSf7vHBEJhe+ra1CRbL+0vg4zOdBYXibpiwSbN9eu/m8GQ3
	 jrECyqJ5tNOesY5uVqwc2IPM6hRTOyRhmsxe85VyqnbjOO9O5EKPtva5SMvo5iZwmG
	 1WPp3WyeNmvuJzgrYpEv79LXOX2Nxrm5NaTs3rnkWqe5O/LKvWdDgFywLzlo45kpA0
	 rGOgT88iJCt6yT5Nn0qtfk4t58bFfikBKx2RMlIqQTHmGsGakldAQzdSGYZrQiqLgp
	 LMbP/Y8oUeyXQ==
From: Mark Brown <broonie@kernel.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250501-qpic-snand-validate-ecc-v1-1-532776581a66@gmail.com>
References: <20250501-qpic-snand-validate-ecc-v1-1-532776581a66@gmail.com>
Subject: Re: [PATCH next] spi: spi-qpic-snand: validate user/chip specific
 ECC properties
Message-Id: <174729453999.272648.10698524382095396308.b4-ty@kernel.org>
Date: Thu, 15 May 2025 09:35:39 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c25d1
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

On Thu, 01 May 2025 18:19:16 +0200, Gabor Juhos wrote:
> The driver only supports 512 bytes ECC step size and 4 bit ECC strength
> at the moment, however it does not reject unsupported step/strength
> configurations. Due to this, whenever the driver is used with a flash
> chip which needs stronger ECC protection, the following warning is shown
> in the kernel log:
> 
>   [    0.574648] spi-nand spi0.0: GigaDevice SPI NAND was found.
>   [    0.635748] spi-nand spi0.0: 256 MiB, block size: 128 KiB, page size: 2048, OOB size: 128
>   [    0.649079] nand: WARNING: (null): the ECC used on your system is too weak compared to the one required by the NAND chip
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-qpic-snand: validate user/chip specific ECC properties
      commit: 65cb56d49f6edea409600a3c61effc70ee5d43d8

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
