Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D10C624DE
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 17:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QZZRnaaEGBUXNPCU7BNHrRPPzi8SJ+DbAxvveB0vImk=; b=lxXovb2Jr2vbjL
	7s031xHNMKwl5GEn1KBNkGusxs6/W95M70VqO1VZG0Arqe1oXeFf9X3f2HEpqmb3n3zWAHGx+PUmA
	y7QJ2Y2HJYzggfq+WbRlX2UIgmPTwBToGJ4mmUW2AbQMMgTsVT41EPlchSCUsBCyqnDq2YKBw9ef/
	ZK+v517jTQ2Ib0E91ykbnUO8WAGvKacX19Z1cR4rF54tZAUNf8ohnhlW1vnVJPkrox6m3Qrnguqh9
	b+Xpdrb9wzUaEv2BgGaXMTFZJ/7p1fC/d8Ns0Wdf9Hc+5H3dhibeKJ/zy29PcmQckT65niQ6xdyG4
	PSjmPJgS3FfJ0o8sgJPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XZI-00000002qhH-0AeY;
	Fri, 04 Sep 2026 17:19:12 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XZF-00000002qgg-2Rv9
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 17:19:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 25BA01A186E;
	Fri,  4 Sep 2026 17:19:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E70846057F;
	Fri,  4 Sep 2026 17:19:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D28DB11C783E9;
	Fri,  4 Sep 2026 19:18:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542340; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=h2U3RyZAx6hs6YleYrOxURcBvWsXYUaQGg/3ZSMErVE=;
	b=TJo7+ER5AGDY1PtOwSHzXGc2oucYBZI29+iI4ArG35tJIpMt55qMdJa0I7DTWlGTtqfL1w
	pxOGBJS6hFXJi1gs6PI3NNTNpRyDPFwzPBd6d/FxD87BW8BDwlerMJCaR05LvFciYWMHV9
	RQW/+uYJE9/krahkpiitqa12x/WDMiE67taYMLSEoFKXGZU/5KkJ4Sjnpp8gok8h5kwoOM
	Z0mT1p8Un5FoKFoXkfZEPiuGY0dNicSsFF/pK2WkRK9jUxQGNOESCr6qPoUVgI895wwNrI
	HjEryq1Kc7dB5fm5RUUhB5tUBYBscz+0g/IiIxpYwmHKQlhRdXvbP7pc+i+1WA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v6 00/26] mtd: spi-nor: Clean Winbond W25QxxJV family
Date: Fri, 04 Sep 2026 19:18:53 +0200
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XQwU7EIBQF0F+ZsPYZeEChrvwP46KFVwczQgMja
 ib9d5luxthFdXnv4tzkXlihHKiwh8OFZaqhhBRb6O4OzB2H+EIQfMsMOXZcYw8fIY4peqgGBJQ
 5QEwZXiu4Ew3xfQYrjLU9eS8mw5oyZ5rC57rw9NzyMZRzyl/rYBXX9u92FcDBGtJeCkRU6nFM6
 XwK8d6lN3bVK95EI8W+iE1ErXqaxCiGyW5FeRMtV/uibKJW6EhwM7oet6L6p6iaSCSV0rzrSNF
 W1D9FvS/q9UeUlrQxpv/147Is3+ibQnAYAgAA
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
X-CRM114-CacheID: sfid-20260904_101909_790603_9477BC9C 
X-CRM114-Status: GOOD (  27.09  )
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
Changes in v6:
- Rebased on top of spi-nor/next, fixed the conflicts. In particular, I
  had to drop two patches which were Sashiko findings that were already
  fixed.
- Link to v5: https://lore.kernel.org/r/20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com

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
Miquel Raynal (26):
      mtd: spi-nor: Fix spacing in function call
      mtd: spi-nor: Garbage collection during sfdp parsing
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

 drivers/mtd/spi-nor/core.c    |   6 +-
 drivers/mtd/spi-nor/sfdp.c    |  30 ++++++---
 drivers/mtd/spi-nor/winbond.c | 138 +++++++++++++++++++++++++++++-------------
 3 files changed, 120 insertions(+), 54 deletions(-)
---
base-commit: 8fc3a53b905e7cda98aa80e0d13c3ea79543babf
change-id: 20260529-winbond-v7-1-spi-nor-jv-cleanup-817889edd1f7

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
