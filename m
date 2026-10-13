Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96991CC6B30
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 10:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=em3E6fTlhNE2NqV6RwgmxK/kYAkGdodT/t30Pmqv1S8=; b=AnAsRQ9poZpgmm
	Rx3jZ9dfQ9tGhCPqhKUeeay4if5sY6AUDWuyyORWHFGiTqoSAkl7Q9OwX8w30Ysibvng5c2aNTkn9
	QCc2q2qb4GG+ONfVF6s41+lQVKGszfEg+OYCvJcQeuHcf8beRVLaqIE2OsRrtX5oBpSMJDQX7gIJf
	DMNxlmJhQhzVl9ryDU+86Xrt8U+XCjKSyy+mQS91K83NL7KmijfKyacqt4CckIEYihIsArkh1owtj
	pj5q2985+z4uHjGszPLhhAZti52T3WOVL3GNc3J2iugId63vWN1055jGhUfDlB5ugZ7JRlzmowO46
	LwD5SmvmUVlxE1jRhzOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIpf-0000000HSjO-3NMn;
	Thu, 15 Oct 2026 10:37:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIpe-0000000HSj6-1vAq
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 10:37:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 97BA960120;
	Thu, 15 Oct 2026 10:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE061F000C4;
	Thu, 15 Oct 2026 10:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792060625;
	bh=v5RWvFNNq8oSh1jVXcH3izOcYbsWvNE1qpoYoMGhrdY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YZfEiCbem2r1mXnggzRpBT+OQrlGyq483qKRTo+FJ1Ma9wFZ2U0N9jao4F7n6xS+8
	 HOBXqytjDLGV/knGtsJpOYuiQ1ocaoJw4zEM7BCtwXYjA89jR4rvi+ZEb6aVI1jAnm
	 gvilwK94uTXyxvmhmiwYK2zAFBzCCTX0sEEh12j/tS0TIi7AMR0s0DKLDFHigeVNK0
	 K/IzXJ8MqiRkI9ymi5yLt8y7jOBngTck1N2ZK9oJt6dxooi9/DyVcyc9txwmzTe1I4
	 rQzdbQClX9/Y0X/el/QMvRTb4Nmy2+1YrGdVmd7JgUHjEjCyal04FhFW8K1KbhpEB4
	 TMkllur6l4TYw==
From: Mark Brown <broonie@kernel.org>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org
In-Reply-To: <20261001-winbond-v7-0-rc1-cadence-cont-read-v2-1-703e040b2d07@bootlin.com>
References: <20261001-winbond-v7-0-rc1-cadence-cont-read-v2-1-703e040b2d07@bootlin.com>
Subject: Re: [PATCH v2] spi: cadence-qspi: Prevent SPI NAND continuous
 reads
Message-Id: <179192006107.42298.12241283635432521930.b4-ty@b4>
Date: Tue, 13 Oct 2026 20:34:21 +0100
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
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

On Thu, 01 Oct 2026 18:45:57 +0200, Miquel Raynal wrote:
> spi: cadence-qspi: Prevent SPI NAND continuous reads

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.4

Thanks!

[1/1] spi: cadence-qspi: Prevent SPI NAND continuous reads
      https://git.kernel.org/broonie/misc/c/3716c71d1c77

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
