Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A52C55182
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Aug 2026 08:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kR/Q6SxIO5/ApOEH5+ID14uiM7fEbSw8QpuSIO9fbsA=; b=wpma4gm1ijU37M
	9XV7S53flhfJla0NH9UFru2dRU1ccItpV5W0f2lgeRIrXtwYPbShVkcvrczZrLG6zkpVxOEo39L2H
	LpML1DGFilxZixN7+p6Y14oJlYFxhSF/+85UrRckRgA+nOErT/L4RUmTEssCB+y8+CxK4iEULgeJ2
	EjXbfPaex0S9a/JAJdeAlqGe19mSMNbrqMwJtco12tB4dIk/vASxU0ootv0XmKgKSco+MJgcIz5y4
	yu2xMipvagUGvWJtnuhLRXcNnbtI3DClRB2ultG9VDJXYPyZgCa00Y4PR7hBDfrgCJJuNJDjhS8jN
	YkatruCTQXD2uSGQl3Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWaB-00000003SMa-3RqM;
	Wed, 05 Aug 2026 08:02:35 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWa8-00000003SLl-1Vuf
	for linux-mtd@lists.infradead.org;
	Wed, 05 Aug 2026 08:02:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 888924E4104C;
	Wed,  5 Aug 2026 08:02:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D1A9602AB;
	Wed,  5 Aug 2026 08:02:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98DD511C34363;
	Wed,  5 Aug 2026 10:02:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785916949; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Oe0SOXmDjkZilaHufIr+/+FWzxdekAH0meqVAdDkzVQ=;
	b=TKbqafsQazD9MUISH8y2oSyF9eO791oJcmJ85TTr68iUj579FoETyy/udSFX0q1xOhPtsh
	J5VqtOuSQ1CbEDrwvmWmj4dfkCKQaBG0tUzhm7wzjUkCdPEhxVzG9Y1Yn88HKUdoaWyS6j
	j8bj0xRfINwHQTJLO4h9cHWr14HZ9U2Mx9CfylRykH0uvI6QRssIkEdR6W6o46gUftIP2J
	5jND+glsNxs/58V+0TtQ6ys/eqqQ9D/NWhsaOv0aIu7K0UyFk1dqkFJ8p8QYp7c9Tl7w+n
	TL/zR3BPp+a5GWJkP6Tia1SpSnR3EjD1lvNw3mBnIHEIJYoto+uH8WWA6dhmNQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 00/28] mtd: spi-nor: Clean Winbond W25QxxJV family
Date: Wed, 05 Aug 2026 10:02:25 +0200
Message-Id: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XNQW7DIBCF4atErDsVDIPBWfUeVRY2jBuqFCyT0
 FaR716STVRlkXb5v8X3zqLwErmI7eYsFq6xxJxamKeN8PshvTHE0FqgxE4a7OEzpjGnANWCgjJ
 HSHmB9wr+wEM6zeCUda7nENRkRVPmhaf4dX143bXex3LMy/f1sKrL+ne7KpDgLJugFSISvYw5H
 w8xPfv8IS56xZtotXosYhPRUM+TGtUwuXtR30Qn6bGom2gIPStpR9/jvUj/FKmJzJrIyK5j4t/
 iuq4/v8iOEMYBAAA=
X-Change-ID: 20260529-winbond-v7-1-spi-nor-jv-cleanup-817889edd1f7
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_010232_688863_EED7AC3C 
X-CRM114-Status: GOOD (  26.99  )
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

Thanks to Winbond collaboration, I was able to test almost the entire JV
SPI NOR family. A few chips could not be sourced, I decided to apply the
very same logic than the other chips, all of them behave identically as
shown in all the logs that I am sharing in each and every commit.

This series is pretty straightforward, it is here to cleanup the JV
entries by:
- Aligning the comments and "fixing" the chip names in them
- Reordering the chips by density and family
- Testing and showing all the SFDP content and passing all the SPI NOR
  tests to ensure a good level of support.
- Adding all the locking information when it is missing.

Since v3, these Winbond changes are prefixed with core changes, to make
the whole support work with legacy chips and SFDP compliant chips at the
same time.

This work is necessary because I am about to propose the addition of the
W25QxxRV family, whose IDs actually collide with the JV chips. The chips
are similar, they have been "improved" (especially the silicon/engraving
smoothness) and we have a way to differentiate them based on their SFDP
content, but that will be for a following series.

Two Winbond-wide fixups are applied, non SFDP compatible chips do not
have CMP nor QUAD_PP support, so let's make sure the additions we do in
the table do not affect the old flags. Keeping the legacy flash handling
in a separate function means that it will be easier to handle the day we
want to drop support for them. So I picked that solution instead of
enabling conditionally the fields at runtime (which makes the ID table
real content harder to consolidate).

NB: There is one collision with a Spansion chip as well (S25FL064K). On
my side I commented out the Spansion entry to make sure the core was
taking the Winbond entry (by alphabetical order) but it is due to an old
joint agreement and is a legitimate ID duplication. We haven't found a
good way to differentiate them so far, so I am keeping this aside for
the moment and just assume we will have a solution later. In all cases,
the colliding Winbond ID exist and is already fulfilled, so let's make
sure the definition is accurate.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
New Sahiko hallucinations:
- Sashiko complains about breaking legacy chips, its description of the
  problem is incomplete and already very well documented in the commit
  log, so a bit annoying to get that same answer repeated over and over
  again.
- I don't know why it continuously complains about swp.c being
  *fundamentally broken* all the time. Winbond datasheets clearly state
  "The write to registers (without input address) instructions will write
  simultaneously to all the die registers as long as the die are not
  busy". Now please shut up about that, Sashiko.

Changes in v5:
- Fixed a wrong clearing operation: s/sfdp = NULL/nor->sfdp = NULL/,
  repeated ad nauseam in the review.
- Link to v4: https://lore.kernel.org/r/20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-0-ee3445066e4e@bootlin.com

Sahiko hallucinations:
- Unconditional SFDP probing is intentional, it is explained, but it
  will very likely not break backward compatibility for legacy non-SFDP
  chips. First, there is a flag to skip SFDP parsing if it exist and is
  wrong. If the SFDP command does not exist, this is handled early and I
  believe it is fine paying the cost of this extra check on legacy
  chips. Finally the deprecated path already parses SFDP, and actually
  claims it does. The only change here is the fact that it is now done
  even on chips not advertizing dual/quad/octal support, which is an
  justified condition. It would be much more dangerous to flag the
  dual/quad capabilities of these chips (which could have been done
  otherwise) given that we cannot test it.
- I disagree with Sashiko's feedback about the multi-die SWP issue: it
  is not fundamentally broken since there is only one set of Status
  Registers for the whole chip and all the bytes are addressed with
  those 4 bits. This is a false positive. So no, SR-based locking on the
  multi-die flash does not break partial locking nor incorrectly reports
  hardware lock state.
- SPI_NOR_BP3_SR_BIT6 is not used in Winbond driver: slop (it is
  probably a vendor mixup since Micron does use it, whereas Winbond uses
  SPI_NOR_TB_SR_BIT6).
- 254Mb devices do have 4 BP bits, I don't know why Sashiko compains
  about this. It is clearly stated in their datasheets.

Changes in v4:
- Fixed the handling of one error in the garbage collection patch (at
  the end of SFDP parsing).
- Fixed an issue in the commit log (s/CMP/QUAD_PP).
- Improved the SFDP parsing failure rollback mechanism.
- Link to v3: https://lore.kernel.org/r/20260804-winbond-v7-1-spi-nor-jv-cleanup-v3-0-542ce107bc92@bootlin.com

Changes in v3:
- Added several core patches to change the deprecated SFDP parsing step
  a bit: do not limit SFDP parsing only to chips advertizing
  dual/quad/octal capabiltities.
- Make sure the nor->sfdp pointer is not left dangling.
- Ensure proper garbage collection in the SFDP parsing logic to avoid
  cluttering RAM with useless allocations.
- Fixed typos in commit logs.
- Fixed one (unrelated) extra typo in the sfdp.c file.
- Fixed an out-of-band access on the ID buffer raised by Sashiko.
- Link to v2: https://lore.kernel.org/r/20260731-winbond-v7-1-spi-nor-jv-cleanup-v2-0-2549ef1b1af8@bootlin.com

Changes in v2:
- Dropped the patches removing the no_sfdp_flags (they do not hurt)
  since this would drop support for !SFDP chips (~until 2016).
- Stopped removing the .names. They are part of the ABI. I will
  try to drop them at runtime when adding the RV chips. At this stage,
  all the existing entries remain.
- Reordered the patches a bit.
- Added a catch all entry in the ID table as advised.
- Added two fixups for non SFDP chips, one removing the CMP bit and the
  other removing the QUAD_PP flag.
- Link to v1: https://lore.kernel.org/r/20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com

---
Miquel Raynal (28):
      mtd: spi-nor: Fix spacing in function call
      mtd: spi-nor: Complete error rollback on sfdp parsing failure
      mtd: spi-nor: Garbage collection during sfdp parsing
      mtd: spi-nor: Unconditionally parse SFDP in the deprecated path
      mtd: spi-nor: Init flags before manufacturer late_init() hooks
      mtd: spi-nor: winbond: Move W25Q01NW to its right place
      mtd: spi-nor: winbond: Normalize names
      mtd: spi-nor: winbond: Properly document the chip names
      mtd: spi-nor: winbond: Make the RDCR fixup Winbond wide
      mtd: spi-nor: winbond: W25Q32JV-Q/N: Add quad page program capability
      mtd: spi-nor: winbond: W25Q64JV-Q/N: Add quad page program capability
      mtd: spi-nor: winbond: W25Q128JV-Q/N: Add quad page program capability
      mtd: spi-nor: winbond: W25Q32JV-M: Add quad page program capability
      mtd: spi-nor: winbond: W25Q64JV-M: Add quad page program capability
      mtd: spi-nor: winbond: W25Q128JV-M: Add quad page program capability
      mtd: spi-nor: winbond: W25QxxJV-Q/N/M: Add quad page program capability
      mtd: spi-nor: winbond: W25Q32JV-Q/N: Fill locking information
      mtd: spi-nor: winbond: W25Q64JV-Q/N: Fill locking information
      mtd: spi-nor: winbond: W25Q128JV-Q/N: Fill locking information
      mtd: spi-nor: winbond: W25Q512JV-Q/N: Fill locking information
      mtd: spi-nor: winbond: W25Q01JV-Q/N: Fill locking information
      mtd: spi-nor: winbond: W25Q32JV-M: Fill locking information
      mtd: spi-nor: winbond: W25Q64JV-M: Fill locking information
      mtd: spi-nor: winbond: W25Q128JV-M: Fill locking information
      mtd: spi-nor: winbond: W25Q02JV-M: Fill locking information
      mtd: spi-nor: winbond: W25QxxJV-Q/N/M: Fill locking information
      mtd: spi-nor: winbond: W25Q512JV-M: New chip
      mtd: spi-nor: winbond: W25Q01JV-M: New chip

 drivers/mtd/spi-nor/core.c    |  19 +++---
 drivers/mtd/spi-nor/sfdp.c    |  30 ++++++---
 drivers/mtd/spi-nor/winbond.c | 138 +++++++++++++++++++++++++++++-------------
 3 files changed, 127 insertions(+), 60 deletions(-)
---
base-commit: 61e14aacac415b8c7ccbc8a5434b1e316af21aea
change-id: 20260529-winbond-v7-1-spi-nor-jv-cleanup-817889edd1f7

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
