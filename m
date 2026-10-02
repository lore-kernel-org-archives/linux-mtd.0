Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3ED1CA5FC4
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2026 12:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z7/L/XkHRVh4SwrziWdd6LOooKmA4a3jw1up+74VsTo=; b=2nxCBPkX4gL0Hj
	xrm10z48BI8Yig0yFjfL52XokTgLzPesC2qq7YZdJWXC838ew762hqEcfz5ThaMLuQ2kIWw5p1if6
	Z+YwYnzTwTnwKGuhXUnsCPAxdFSDOHB5IiM4cn0YvasD+U1JAy0MSglTAkMbDA/UwrrhLD+eVJ1Y8
	v+tnF2q/hHnAVRnnIctOlk8Afn002enWrLC2Nz3+vHsWZuds9AmGBQVSzOaw7Tu5PZ0qd0WnWs19c
	5pdPZNhG+CiQKu7BjLA+gRI3VvgmXTvwrvPLHMejbZotnwW0KDfBgrU13QknrTujjI+ZxqrQ5xWvi
	ywRF02EbbhuD31TtK8Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcGh-0000000BYVQ-0hRG;
	Fri, 02 Oct 2026 12:21:39 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcGc-0000000BYUL-2fxR
	for linux-mtd@lists.infradead.org;
	Fri, 02 Oct 2026 12:21:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 194044E4110E;
	Fri,  2 Oct 2026 12:21:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C9BE6603DC;
	Fri,  2 Oct 2026 12:21:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 054B1103281D0;
	Fri,  2 Oct 2026 14:21:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790943683; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=oqAlVFXfMAcdUZksGidzaO1rRwjv8lqW4cFPdVMa7m0=;
	b=w4q/oLe6rszrm1kh2kX4hGyJSmDE5ZeAjIWURuCgBg1Jmwu06LlcINHFxb7CbG6FyQHINo
	YO79Fx0AE2UnhRFYED/ttghwJzURTFfIBSKRJQt8kTrxo6iHGrnCMgabPI2jWdmwo4JGaC
	+hPUXAy9Igz+T9H/26UT5dg6t9/TcIGq5X2c3vBvxfYv4LTdv4WTi+K9ZcSVz5qpjcb5pV
	ewOyMZAEUrpjPv8Ds97wro6NiVPGbEkgEof2X+THOTbVJBp8yyMIStlzb188z6owi1KYAB
	LOad+PSLKfaw8lhUQZVjyaJtbFLWCt/maTL1I0nGDojWeCFvslWjWuYLdbHgZA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 00/15] mtd: spi-nor: winbond: Add support for the W35TxxNW
 family
Date: Fri, 02 Oct 2026 14:21:13 +0200
Message-Id: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQqDMAwA0F+RnBdoKk66Xxk76BpnDkslERXEf
 1/Z8V3eCc4m7PBoTjDexKVoBd0aeM+DfhglV0MM8U4hEO6iY9GM38FXNvRFUIvh3nYrRupTakO
 KnAnqsBhPcvz35+u6fjRwfP5tAAAA
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
X-CRM114-CacheID: sfid-20261002_052134_844824_249D9AAF 
X-CRM114-Status: UNSURE (   8.24  )
X-CRM114-Notice: Please train this message.
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
Miquel Raynal (15):
      mtd: spi-nor: Only switch to ODTR if the chip has a callback for it
      mtd: spi-nor: Fix spacing between arguments
      mtd: spi-nor: Fix comment indentation to clarify the intent
      mtd: spi-nor: sfdp: Enhance a comment
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

 drivers/mtd/spi-nor/core.c    |  46 +++++++++++++---
 drivers/mtd/spi-nor/core.h    |   3 +
 drivers/mtd/spi-nor/sfdp.c    |   4 +-
 drivers/mtd/spi-nor/swp.c     |  23 +++++++-
 drivers/mtd/spi-nor/winbond.c | 124 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h   |   4 --
 6 files changed, 187 insertions(+), 17 deletions(-)
---
base-commit: c1775ba88cd08853e3f401d725b2ad94e783c5ec
change-id: 20261001-winbond-master-spi-nor-w35t-217993092ed1

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
