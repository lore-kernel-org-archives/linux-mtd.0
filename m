Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CF1ECD997
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Feb 2026 19:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Rd0mGpKdtMfumIk+WjOH1AY2jD3JFjK4A3GeeT7yNoA=; b=taJvOav1Y7bi+W
	oqI7PKKOe85EGKR/P54UcjZm3IXl4eIvgWqDinQGNZCEeORi1JUDh5Gokbbf9iaLSwUqFZn+Zu/YP
	Nz3F9u7Ys8FigP3X5K0hmEsV9rQ1QzBpM7wMlAKBbUMufVnWXAGLEG47jHxC5kwsWdVY/8FvCCKxi
	9NgG8MuqQHm85ZJlNPOOVefMkT8S2QB5rrjI2fQ1v9Zp+Voys+ThDlq0n6IOtXjNX77/Z/RxpxXY0
	vMREIj7w/V5g1YtiUtPxnpP8eWgnGdS+hi+/GTq1Q8iAqXVxw4/s6Bl1voExYZX5eWibbAM0RUe4R
	IUYGr50vkX9LvKRgWfzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo4h9-0000000APOB-3OB5;
	Thu, 05 Feb 2026 19:07:15 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo4h6-0000000APMm-1rq0
	for linux-mtd@lists.infradead.org;
	Thu, 05 Feb 2026 19:07:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 150814E42428;
	Thu,  5 Feb 2026 19:07:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BF0DE6074D;
	Thu,  5 Feb 2026 19:07:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62FCB119D175D;
	Thu,  5 Feb 2026 20:07:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770318429; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=KTeTMB3O5osR3rrRni/7ouiJ09Dn2ufAokhrH7lIdiI=;
	b=Rxs1sDHcH47lcvuGsxttX2cuhHmXF87fgtHXC9t7Yr9JgMzK9GesHuyxJpzHVA0zbOOjAg
	hDup6LmZjvsCYrjr0IhBJG+5D76zbrYU52Tj5hgXZzbysHiXmZjgKWy9OC3GrfE1r9Z/rK
	KuDrcEPfMh/Ieqxb4k7ALu/SY+ZF7Or/Q77G5IS5FMAuNOZMCxlfVDO2VoxC5NSjDUHsOc
	iKlnUlgPEQxyPKfRxoBEfMG1Uz5M24hhofcsOjd/fB/JlokG0J7Of0wGc17qVrSFlgztpS
	NdVmDMI6s7zLlt3iLmcLCKFoGXVM+7bnj+P1t/4C05VQFwk+tBzx3jmoWqeVyw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH RFC 0/4] mtd/spi-mem: Enable DQS support
Date: Thu, 05 Feb 2026 20:06:57 +0100
Message-Id: <20260205-winbond-nand-next-phy-tuning-v1-0-5e7d3976f0f1@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MPQqEQAxA4atIagNxFkVsBQ9gu2wxatQ0UWZcf
 xDv7mjz4GveCZ6dsIciOsHxKl4mDUjiCNrR6sAoXTAYMhkZSnETbSbtUO0T3hecxwOXv4oOaG3
 DfUtJTh8DYTE77mV/91+oqxJ+13UDRwozE3MAAAA=
X-Change-ID: 20260205-winbond-nand-next-phy-tuning-aabefc018032
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praneeth@ti.com, 
 u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_110712_620497_8BB6D82B 
X-CRM114-Status: GOOD (  13.94  )
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
SoCs, Santhosh needs to access the availability of the DQS (data strobe)
signal. This is a chip dependent capability, which may sometimes be
enabled.

Create a SPI memory flag for it, let the SPI NAND core set this flag
when it knows about the capability, and show how to use it from a SPI
controller driver.

This is an alternative at needing a DT property. Please note that there
are a few blind spots:
- the line may not be wired (this would be surprising, but can be
  flagged this time by a DT property)
- manufacturer drivers must enable the feature if it is
  available (especially for high speed DTR modes)
- this implementation is proposed for SPI NANDs only, if this proposal
  is accepted the same approach must be taken in SPI NOR.

Here is the original thread which lead to this series:
https://lore.kernel.org/linux-spi/87v7gbdwdh.fsf@bootlin.com/T/#ma79fc364d7b882a48dbdf47203dde75df4bb0ec4

This series was compile tested only at this stage. As DDR tuning does
not yet work on my board, I cannot make sure this change has a real
impact.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Miquel Raynal (4):
      spi: spi-mem: Flag DQS capability
      mtd: spi-nand: Set the DQS spi-mem capability if available
      mtd: spi-nand: winbond: Enable the DQS pin on W35N**JW series
      [DO NOT MERGE] spi: cadence-qspi: Retrieve DQS capability using the core helper

 drivers/mtd/nand/spi/core.c       |  4 ++++
 drivers/mtd/nand/spi/winbond.c    |  8 ++++----
 drivers/spi/spi-cadence-quadspi.c |  8 ++++++--
 drivers/spi/spi-mem.c             | 32 ++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h       |  1 +
 include/linux/spi/spi-mem.h       |  4 ++++
 6 files changed, 51 insertions(+), 6 deletions(-)
---
base-commit: c5884449d02575c7984000eb30d2a2971c7dfcc7
change-id: 20260205-winbond-nand-next-phy-tuning-aabefc018032

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
