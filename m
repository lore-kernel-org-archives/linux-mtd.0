Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7228BC55822
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2026 14:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0L+X7vsQUZsSkyaw2yjeR1CW/NtbbTtswk3zLHq9oio=; b=WEdqRKFAl0/w2m
	RSnxXrGc8aIcGxmXfFDaPlfgMvFCh0zsnJeylx3FMYzC+UFjP4qwFfdqZUHigL+EGDlpfOGmWYpnx
	JHChtgKa3Nzn4QgpBoynMEHQar98nVfWXU5yKVyPHzHPy9dGVd7XNtDpWCVKhdHmCMk/Eu8vScYS+
	ONLWXsDzgk5ob2oXGR6xUvJGJSh1e+JV1WJ0V+p7D/n/jP6Mn+gG6ZnAJlT+dz75bB4SAZQk9sVsy
	eOaCyItimKwS7EM7ia1vmN4UbW1J0SnPtAxNH5P0MQZNIJCxi+A8/JsRowmWeYc4hwfiaNWi0+hlm
	mxuOJWjWcVYrpwcle8Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFl0-00000001zpA-0Men;
	Tue, 04 Aug 2026 14:04:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFky-00000001zon-1XyB
	for linux-mtd@bombadil.infradead.org;
	Tue, 04 Aug 2026 14:04:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=kDjJQ+aiIujhVXkb+nQFMiQdZXABqThgyQBVqI13I5U=; b=nrmt2NT0rbXexzGvVnfM+8ps8K
	AAWLg8W+PZ8OsU0whV2LAC7YYvz+O76gKB1d5HyC18gSIxc7OStnaII1ScNCfGYW5dM8YxCQAg6G6
	CD8A3kfom2HwboUeZOzKuE9i9k1VsB4/xx5T7PILd20XKyOVPq02knPjeVzyChheolz5HyX1KEs3O
	SqAO7yFQrLmJX1YEDDvAB0DX1B04h49t/nPdV6nGRJFYRYCORouseKaOJlzavVoi2gX3JUvq9twxH
	tVnSbudvW17LOOToG7xa2SkV/9NGo1VqEw1bVQl++eMFo7MMZeG+KRMp+X/uagCJWLqpy7yZ3Qz+4
	fdQyYFBA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrFku-00000009yFl-1o5n
	for linux-mtd@lists.infradead.org;
	Tue, 04 Aug 2026 14:04:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 65DDE1A138B;
	Tue,  4 Aug 2026 14:04:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3202B6029E;
	Tue,  4 Aug 2026 14:04:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2687311C32D29;
	Tue,  4 Aug 2026 16:04:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785852269; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=kDjJQ+aiIujhVXkb+nQFMiQdZXABqThgyQBVqI13I5U=;
	b=Wi1VFGSChLMUhL+Wm+NeeYqPwA7Ri4cw9V0fPVW+hl2cMDWFB6xIGzFHt2QfsI7wM+tgi6
	poUEjE5QIUB51+P1pJrNdAeqamTXditM8EvIUdpVnfQlHWncLFc2a8dS1u31227B6dcpEt
	wYSM6ddyIGyXdLSEYlOM5D/uup4ocGDviJJ7zPvrQPkiHn28QFDFzbkI7Z2gKTccmxon2K
	6IXl+y1rXDzaAbZ7tMnqj8IOXfCtvlxsRrZOjgzvj15YuoBm9SLmJeW24VmjCSHvZyICF7
	5+nezzCJYCPquiZGuoPN2nWl1hvu1AF/NGP5ZdZDNAqMrNm8FD1VGq4UQa6YSQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 00/28] mtd: spi-nor: Clean Winbond W25QxxJV family
Date: Tue, 04 Aug 2026 16:04:22 +0200
Message-Id: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-0-ee3445066e4e@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NQU7DMBCF4atUXjPIM3Gww4p7VCwSe0IHFTuyW
 wOqcnfcbqqqi7L83+J7J1U4Cxf1ujmpzFWKpNjCPG2U343xg0FCa0WaXnRPA3xLnFIMUC0glEU
 gpgyfFfyex3hcwKF1buAQcLaqKUvmWX4uD9v31jsph5R/L4cVz+v/7YqgwVnuQ4dEZMzblNJhL
 /HZpy911itdRdvhY5GaSL0ZeMYJx9ndi91VdNo8Frsm9oY8o7aTH+hWXNf1D96rw+90AQAA
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
X-CRM114-CacheID: sfid-20260804_150432_669999_CA3483E7 
X-CRM114-Status: GOOD (  26.09  )
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
