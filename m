Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36265C5B56C
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 15:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yiZw0o8skh4iBjmbbBBWpbLP1urqLd6+SAT2Cmtr2TM=; b=0Rd9MJDmSRCcid
	4K62eYkuT8f6cTNdeFaz2HOWeC9x+72yFYaAq5TSWLs74dGkRstH1mFptYu0fb+zTHLm/v6IPng69
	DOGrFiA9DhLex+zAwrx04kONil8CRS8CEmZfRN0jqaNGgaDa+CQOHLo51qCKxKys+hHPCJ/XZ3zT6
	6C+Zm0ejms2IZLpL2P0jxrKy/YNHqG20fceySTmtek4CF6bSJ3KEabylKFwvF70n8YncPSTlJwQfk
	YesI7OV61at8UBktcdFUcaeX7xTYBmFXi+Rg8IEKaBKUjh9YeroQQW+D6Gqgo+CJUSP0UfW/eI1zR
	NM5IK0d3YucCo9HgOdgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRei-0000000C9lT-2Kf8;
	Mon, 10 Aug 2026 15:11:12 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRef-0000000C9kY-04Ah
	for linux-mtd@lists.infradead.org;
	Mon, 10 Aug 2026 15:11:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F283B4E411AA;
	Mon, 10 Aug 2026 15:11:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BEFA06033B;
	Mon, 10 Aug 2026 15:11:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B8FA211C4A9ED;
	Mon, 10 Aug 2026 17:10:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786374654; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=AYZpRo8QZhMYf4x7YOSDEZsDXhhJ8EVY0i30yMilJOk=;
	b=eBNMLc/duJnc6TnzbZ8bQ1kUtqiO/LiUXcrt31JmFMYAl2TXdxeKm12nIe4RdKiFJXOYUC
	pg0sxfPWv7xzXU5z657/tUxT0aPoqCpnwU+II9gmEa9IswhZs6pOqoMI5qfhrJm9bziLcf
	Z2KWDi2aEYuWQLx3ZASsusJSVj3zxYXrbdvIJikYu3rg1RhXpZLao1WUiuXVWsJ3IuXrgZ
	OkSKt6TBAgbTtDOjetLTDEliKTWcl3CRYFG1yKZ0OQUkLvFBCc0Q/0aQJmCuKpHKZJEVty
	uKp++9Tkq2Mp09NH4sB3Bc0EDBu3UHVS4+fPAK5UaRZpLMbodplgSynfhm0Rnw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 0/3] mtd/spi-mem: Enable DQS support
Date: Mon, 10 Aug 2026 17:10:41 +0200
Message-Id: <20260810-winbond-nand-next-phy-tuning-v3-0-a97c3a61e675@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NsQ6CMBDG8Vcxna052pSCk+9hHApc4RK9EkCEE
 N7dwmKcdLnkf8PvW0SPHWEvzodFdDhST4Fj6ONBlI3jGiVVsYUClYICI1/EReBKstsOToNsm1k
 OTyaupXMF+hKSDLQSkWg79DTt/PUWu6F+CN28r43J9v0THhMJ0qCtdG5TDz65FCEMd+JTGR5io
 0f14TKwPzgVOatNbjDLqxT1N7eu6xujhfhuGQEAAA==
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
X-CRM114-CacheID: sfid-20260810_081109_199074_7A20527D 
X-CRM114-Status: GOOD (  14.11  )
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
Changes in v3:
- Rebased on top of linux-spi/for-7.3 and dopped all existing
  dependencies on the MTD bits.
- Link to v2: https://lore.kernel.org/r/20260807-winbond-nand-next-phy-tuning-v2-0-73595e89d6e3@bootlin.com

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
base-commit: 1ec281b42ee249cfe9bad52a54149de29ed6aa78
change-id: 20260205-winbond-nand-next-phy-tuning-aabefc018032

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
