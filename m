Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1F8C61DA4
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Feb 2023 21:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TqH37AZ8y7RTxHiqn306Q+UOIpDjdZ+1tZQNQZSAINk=; b=vH4SxHJQwnZRzA
	EaorjUBBC9piwVufd7Pd/K7itdKdnM9LjnJ9R3d5MNBpfEFw0Ft4FpZFChJkXcJTfwHTqH0hzC510
	C1PfxC8lGYAAxSXKMvyNfNGd6lhRUEvq3fG77xDsc/GneQ6E/IZomP7RvMkjCpB+4TsN1fG3Gq8Me
	cCa5Oi1pKHgiAgbR1YTn5GMBFOWE1ZOVA5zovjziWAx35IaaGIAZSE1vCRO69OsuZTm3KxAgH7ceq
	ziwKHnGEtyeSo3mweOPVpqC26lhbwbga+Iq3xXPq9jjvKf3IiAviV22X8NTL5ijmIF497fRE3TyP2
	R5JPbZa0/KJiQS58H1Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS2a2-003SYx-T5; Tue, 14 Feb 2023 21:11:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS2Zo-003SWO-VB; Tue, 14 Feb 2023 21:11:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8ADD6618CE;
	Tue, 14 Feb 2023 21:11:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F2DC4339B;
	Tue, 14 Feb 2023 21:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676409059;
	bh=fDIAaeLvnV9bS7cSr3lrCN+H7tSKNpzTS60LB1VS550=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OYpoOHHcfZA2DoLCNbBAVzJp8sFxNPyS2f/SZUonAGV6v84jwoP6HqzaINqJtJx+V
	 eNmLIK6bSwMZgADeM3pRNmocG+FeYNk+b2jLHgYGEO4Syrmg1sms51h2Pt1t/JASMr
	 YnRDg5v8rcyKFFpsgpX5QG1bx89dNfflDCBybv4Y0t943O27UPUnPCpGi1M2wRZYDv
	 ydw57lZOktRsllTgxazuatWX1dI+cHkYEl/g3N0VhTVcuQON4t471d8GUtHahLcnQ6
	 r+PRS9MX7YFgBVhye1WUn+fM7FlmI66WbRT7vi9zOQaMcfmuR/grFUbU7g36CKCWBf
	 FShqN3cntzCKA==
From: Mark Brown <broonie@kernel.org>
To: Dhruva Gole <d-gole@ti.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vignesh Raghavendra <vigneshr@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Takahiro.Kuwano@infineon.com, Pratyush Yadav <ptyadav@amazon.de>, 
 Pratyush Yadav <pratyush@kernel.org>
In-Reply-To: <20230125081023.1573712-1-d-gole@ti.com>
References: <20230125081023.1573712-1-d-gole@ti.com>
Subject: Re: [PATCH v2 0/4] STIG Mode Fixes for spi-cadence-qspi driver
Message-Id: <167640905650.3115947.2076945563527929294.b4-ty@kernel.org>
Date: Tue, 14 Feb 2023 21:10:56 +0000
MIME-Version: 1.0
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_131101_089657_360DBCDF 
X-CRM114-Status: GOOD (  17.13  )
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

On Wed, 25 Jan 2023 13:40:19 +0530, Dhruva Gole wrote:
> * Reset the CMD_CTRL Register, without which read/writes in STIG mode
> were failing in some cases. The issue came to light while using STIG
> Mode for small reads.
> * Also add a flag that can allow us to do direct reads but distinguish
> direct writes, thus enabling us to disable writes in DAC mode in some
> cases that require it. (Like to write to some connected Flash registers)
> * Fix register reads in STIG mode and also use STIG mode while reading flash
> registers.
> Currently if you try to read a register while in STIG mode there is no
> support for ADDR and thus naturally a register never gets read from the
> flash.
> 
> [...]

Applied to

   broonie/spi.git for-next

Thanks!

[1/4] spi: cadence-quadspi: Reset CMD_CTRL Reg on cmd r/w completion
      commit: d4f43a2d05faf7febb839edb2e9e8f85dfb9d2d2
[2/4] spi: cadence-quadspi: Add flag for direct mode writes
      commit: e8c51b164355c1d519a4b8ad0873f131035d26b7
[3/4] spi: cadence-quadspi: setup ADDR Bits in cmd reads
      commit: a8674ae02db232927385c2d0a063e10c0118f5ca
[4/4] spi: cadence-quadspi: use STIG mode for small reads
      commit: d403fb6e76bf854ef0f7d84e797e51b9494788e0

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
