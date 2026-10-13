Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83254CC6B0E
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 16:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pogc9WC4r89E7tTiV58yQ/b3udLMPvMlTOHb5jGVfvs=; b=G/eKmARxW1qfKq
	R8ZszCqaM702Fgmbh83Ge4An5dcVCrhdF7UJqb5Hzn/aJ8OcgKvyair1ngHj03in2FpyqbOSpYEoQ
	XwLKWBbMmqQ7IDMq6PsVgUVBiRG6wGNXzJCNcO2XDgPYLoRVWonR/7KlTDcLE/z8xz3+Bwh0XFrhF
	2dwtJeEQTO2Ea080cGZva+OyBt3XymK4fBqveM6ONsuZzkaDug0kXpF7KLqEJkPC8AADpbljwVoZ4
	sxGU2zNGWaDLmUoyqsypGk053hXEKnTl9CI2MzDA8Ul+nj/Ln9ludWu/CxiM6oHtt9tnf31d5JRLm
	EMOwcNjjpBEJPg5H+V1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfSY-0000000DWzc-0bb3;
	Tue, 13 Oct 2026 16:34:38 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfST-0000000DWyr-3Dr5
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 16:34:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7B4ABC653F4;
	Tue, 13 Oct 2026 16:35:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B24FB60362;
	Tue, 13 Oct 2026 16:34:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 760BC11D7180D;
	Tue, 13 Oct 2026 18:34:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791909265; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=X1mfwLlo25XYbvE4wLEXA72Z7W9FUyzbZTg3CqofoW4=;
	b=Fdj06cGT/kH00yLrzofFuv2FOS4Ot0dOXs8ZAlDydb2hySTyEKRB7GGg267kbmS6CD5px1
	DivsrYYLjJOieARh2SuZHwSU2GL142McxWv5hPP+llOUCqQINn0eDWTrQcvgC2qUU2ZUH4
	/fXLPEdvX8/FyDz4ewYvbGX+p8cJOAge69n40Rc4dGWa3lAKiKftOVkxDiHEhXsrXR+Wmu
	/p/q6xpb6NQq98e7JKItYRB8yfjpygwQeKo8hr9zpg3DY9lSwv9ifZL7zmvlIxGYT/Xje0
	2jR4AZsBuSqe7FC0LKHvz1kBI0KetXSAznnBtvcKArYls0gRhYD9ADeSECoQYA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 00/17] mtd: spi-nor: winbond: Add support for the
 W35TxxNW family
Date: Tue, 13 Oct 2026 18:33:50 +0200
Message-Id: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBCF4auYrh3TTgVSV97DuChQZBJpSdsUD
 eHuFhIT3bD83+J7MwvGkwnscpiZN4kCOZtDHg+s6bV9GKA2N0OOpeBcwES2draFQYdoPISRwDo
 PkywioKiUklyhaQXLwuhNR69Nv91z9xSi8+/tLIl1/bq46yYBHDSixk4VDZbmWjsXn2RPjRvYK
 if81c77GmatUNhJybmuePevLcvyAf2QY7YWAQAA
X-Change-ID: 20261001-winbond-master-spi-nor-w35t-217993092ed1
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_093433_977388_32ED3263 
X-CRM114-Status: GOOD (  13.44  )
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

First patches are misc fixes.

Then there are core enhancements to support ODTR chips.

Last set of patches is Winbond specific, where I add the bulk of the
changes for supporting the new Winbond Octal-DTR SPI NOR chips in the
winbond manufacturer driver, and then sparkle the ID table with the new
IDs and their respective testing logs.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v3:
- Drop all Flag Register mentions, which are unused (I added them for
  debugging purposes, but then removed the associated helpers).
- Bail early in the sr1_and_sr2 write_sr_ll case with ODTR chips: we
  should never face this issue at all. Add a comment to explain why.
- Move a comment fix earlier in the series.
- Link to v2: https://lore.kernel.org/r/20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com

Changes in v2:
- Fix the _careful() read helper in swp.c to make sure the buffer is
  initialized (zeroed).
- Fix the location of spi_nor_set_dummy() in order to be called at
  resume. This solves numerous problems reported by Sashiko.
- I am on purpose ignoring two comments from Sashiko, for which I have
  answered over the mailing list. Let me know if someone disagrees.
- Link to v1: https://lore.kernel.org/r/20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com

---
Miquel Raynal (17):
      mtd: spi-nor: Only switch to ODTR if the chip has a callback for it
      mtd: spi-nor: swp: Fix SR2 initialization
      mtd: spi-nor: Fix spacing between arguments
      mtd: spi-nor: Fix comment indentation to clarify the intent
      mtd: spi-nor: sfdp: Enhance a comment
      mtd: spi-nor: Fix the meaning of a comment
      mtd: spi-nor: Drop stale values
      mtd: spi-nor: Fix WRSR with ODTR chips
      mtd: spi-nor: Allow configuring the actual number of dummy cycles
      mtd: spi-nor: Fix SWP for octal DTR chips
      mtd: spi-nor: winbond: Prepare the introduction of W35TxxNW parts
      mtd: spi-nor: winbond: Add support for W35T64NW-C
      mtd: spi-nor: winbond: Add support for W35T12NW-C
      mtd: spi-nor: winbond: Add support for W35T25NW-C/E
      mtd: spi-nor: winbond: Add support for W35T51NW-C/E
      mtd: spi-nor: winbond: Add support for W35T01NW-C/E
      mtd: spi-nor: winbond: Add support for W35T02NW-C/E

 drivers/mtd/spi-nor/core.c    |  58 ++++++++++++++++----
 drivers/mtd/spi-nor/core.h    |   3 ++
 drivers/mtd/spi-nor/sfdp.c    |   4 +-
 drivers/mtd/spi-nor/swp.c     |  25 +++++++--
 drivers/mtd/spi-nor/winbond.c | 122 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h   |   4 --
 6 files changed, 197 insertions(+), 19 deletions(-)
---
base-commit: c1775ba88cd08853e3f401d725b2ad94e783c5ec
change-id: 20261001-winbond-master-spi-nor-w35t-217993092ed1

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
