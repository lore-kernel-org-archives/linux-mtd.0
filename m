Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED6FC5ACAB
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 14:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S1S8Z3xGKi8zmnOVcPSm9aMxhH1WRwDkYQnkd0QaYOk=; b=aIWL6M+3YVGCun
	uKlSKBO+M+dl7E9G4LlHNlufSoDEbVQJBHGfIWy2hIvUFiXbKwevICA1MQeO1ho0lf321TOqOyLFT
	psVAt7c1UwrGVGhWKSv/q9lvnW0sGCuGnqWkxzrdf1xTq9X6yVMygrdA5itjIcGZa9YaH7HP7NRhT
	vo4bOUw2Gg8vI1kaRvKuVqxZQ5LYCKnu9FLOKnZRcJItVN/mGvnao60Bb0f0Wu4LtuNEXNEWx11q2
	ZIokfG6xHzDfTsw4UPbGNtYHWl+vUYoMeabUKZfFy4ekhKrSUxlnmnvhQgNkPZH5DYwfDOU6W1asP
	w2PqnlHRNOs572LAWvqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsLqg-00000008HvD-1GL6;
	Fri, 07 Aug 2026 14:47:02 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsLqd-00000008HuL-0MlG
	for linux-mtd@lists.infradead.org;
	Fri, 07 Aug 2026 14:47:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1E3151A14B1;
	Fri,  7 Aug 2026 14:46:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E0876603F0;
	Fri,  7 Aug 2026 14:46:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D3C2311C37A53;
	Fri,  7 Aug 2026 16:46:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786114013; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=3U7zmB0jNuLDEjK8WDzNya+qqpQQtuz/BAdCFoUahL0=;
	b=kZw213R+pTzitdHxqYdmusyT/SFJdxWZGvTmo5T0FkB4h0rJV/xIfT2hnPXaPyJoy73c/w
	D+hhlaZEYHZc1LktNKpEGCcLUyVuCH83SLa/xmuef4A/Fnf0jitiHMxx9Z367A8UjDVk9G
	SP8HykE7mV0aNEnmYwilLFAZYqdk7+494ZGc8EM+i0O6vC/O3D6K5CEuY7PVupKZdddjbA
	zvKXpv3dXrxjEs63ZAwBZK1yaK+GiQwmw/YzCi0nlTrYcNr+E0DwOcpEA4IHfi28M8HXWW
	C1fqJZnkWNcP7X2T0vPDCMtoSWebdD3hGs04nmZLvBZlnG5tfPMxS7SRbotksg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 0/3] mtd/spi-mem: Enable DQS support
Date: Fri, 07 Aug 2026 16:46:46 +0200
Message-Id: <20260807-winbond-nand-next-phy-tuning-v2-0-73595e89d6e3@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0K6dkxbAqgr7mFYFJjCJDolbUUI4
 e4WTuDmJ+8v3ttEQE8YxCPbhMeZAjlOoC+Z6EbDAwL1iYWWupRaFvAlbh33wOYYXCJM4wrxw8Q
 DGNOi7aS6yVyLpJg8WlpO/bNJPFKIzq9nbVbH+6d4ViChwKrP71VppVV161x8EV879xbNvu8/H
 GkA4coAAAA=
X-Change-ID: 20260205-winbond-nand-next-phy-tuning-aabefc018032
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praneeth@ti.com, 
 u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_074659_277140_89DC9A20 
X-CRM114-Status: GOOD (  13.18  )
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

For his PHY tuning series on the Cadence QSPI controller embedded in TI
SoCs, Santhosh initially needed to access the availability of the DQS
(data strobe) signal. This is a chip dependent capability, which may
sometimes be enabled.

Create a SPI memory flag for it, let the SPI NAND core set this flag
when it knows about the capability, and expect manufacturer drivers to
enable it for octal needs when the chips are compatible.

This is an alternative at needing a DT property. Please note that there
are a few blind spots:
- the line may not be wired (this would be surprising, but can be
  flagged this time by a DT property)
- manufacturer drivers must enable the feature if it is
  available (especially for high speed DTR modes)
- this implementation is proposed for SPI NANDs only, if this proposal
  is accepted the same approach may be taken in SPI NOR.

Here is the original thread which lead to this series:
https://lore.kernel.org/linux-spi/87v7gbdwdh.fsf@bootlin.com/T/#ma79fc364d7b882a48dbdf47203dde75df4bb0ec4

This series was compile tested only at this stage. As DDR tuning does
not yet work on my board, I cannot make sure this change has a real
impact.

Mark, as agreed, you can take the spi-mem patch through spi for this
cycle, and I will pick up the remaining spi-nand patches after the merge
window.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v2:
- Dropped the RFC prefix.
- Rebased on top of v7.2-rc1.
- Dropped the spi patch for now, just allowing to use DQS on a few
  Winbond SPI NANDs (can be improved later).
- Link to v1: https://lore.kernel.org/r/20260205-winbond-nand-next-phy-tuning-v1-0-5e7d3976f0f1@bootlin.com

---
Miquel Raynal (3):
      spi: spi-mem: Flag DQS capability
      mtd: spi-nand: Set the DQS spi-mem capability if available
      mtd: spi-nand: winbond: Enable the DQS pin on W35N**JW series

 drivers/mtd/nand/spi/core.c    |  4 ++++
 drivers/mtd/nand/spi/winbond.c |  8 ++++----
 drivers/spi/spi-mem.c          | 32 ++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h    |  1 +
 include/linux/spi/spi-mem.h    |  4 ++++
 5 files changed, 45 insertions(+), 4 deletions(-)
---
base-commit: 6f787fd9f19e4e1bc80d3eee1a394eb65defdff7
change-id: 20260205-winbond-nand-next-phy-tuning-aabefc018032

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
