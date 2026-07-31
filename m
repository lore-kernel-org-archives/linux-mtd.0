Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9ECCC54F54
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jul 2026 12:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UMk3msYH+7eIr1+pAjNL81tlIgyAQlbdkI7/HLonHFE=; b=3UfUaoHx8shIM+
	NcExqhnDY+MSIlI+xdRNLRV4qX+dPWfzh0MZ8VNNUWYsZozMyT+zxqR/InT2UWxLbnlvEaEfo2d/h
	ppWqAAY/AZH/zJxyTRGnNutI1ng7GfS6F9LV3fKmDCJhN+Gc5y1GnsGAD0qxHlSD9bSDSF/DuBBw/
	fs/7ReefXulp8xFNek7cpkyX7vEjRV2h5/+9+znHnyY/VGwuiHaSbGWYyFtJb5ai9o091RqoJdIfW
	nfTqkVVPeClKBm0ziSU8HyBIuq96mZ5mxqY/XlVXVD3tMWq8Yv4uHU43xNSBI1BNmGnYSuVzJ8UoM
	mk0oANHtyolHDm/HzUfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wplwa-0000000CQty-1bmv;
	Fri, 31 Jul 2026 12:02:28 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wplwW-0000000CQtT-3Le8
	for linux-mtd@lists.infradead.org;
	Fri, 31 Jul 2026 12:02:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D1A3A4E4104F;
	Fri, 31 Jul 2026 12:02:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9DB316039A;
	Fri, 31 Jul 2026 12:02:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13F4011C16798;
	Fri, 31 Jul 2026 14:02:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785499335; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=tyy+26fgmtdCdfBszqq6ga+1W0TEVVNmc017QcxuXb0=;
	b=uGMbNR4Sl8Bo1leHYuFpWoQQFX3kcpyPEYSdmiGoSewEpP29MHMagmDfBsCcmpthDTPbE7
	LBUJ+4YEacZG9y6Jt/Djn0YPVch8k30c4pk2a40tQtRa77xeJYJERy2QkNpmLRJUXib4Qk
	v9MMp/p6eP0COAQU2zltH9U0Vym10152XOft0cEPbFUr2cUHAUFhpgm/WRv4Pv+DsUKtbT
	iHKnjps2Peaj64LMdqvkejgFaFA2Pda5C4tisZQVnXOrPew6Xf7FHEW0Pt446Kh7ioh979
	PODX67n4rfyYf4G4wyDtOSuHjX/K7xStGWC52pXP/5Q6GNGgAFrKqIN/zsu6Zw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 00/23] mtd: spi-nor: Clean Winbond W25QxxJV family
Date: Fri, 31 Jul 2026 14:01:53 +0200
Message-Id: <20260731-winbond-v7-1-spi-nor-jv-cleanup-v2-0-2549ef1b1af8@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBAAv0L27BpawRZO/sNwALrIGmxJi1VD+
 LuVF3icOcysEMgzBaizFTxFDuxsAnnIoB9beyNkkxhkLs95KSt8se2cNRgVCgwzo3Ue7xH7iVr
 7nFELpXVFxohBQarMngZ+74drk3jksDj/2YdR/Oz/7SgwR62oNCchpSyKS+fcMrE99u4BzbZtX
 xwRGjnQAAAA
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
X-CRM114-CacheID: sfid-20260731_050225_010966_F31B5B84 
X-CRM114-Status: GOOD (  15.11  )
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
Miquel Raynal (23):
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

 drivers/mtd/spi-nor/winbond.c | 138 +++++++++++++++++++++++++++++-------------
 1 file changed, 97 insertions(+), 41 deletions(-)
---
base-commit: 61e14aacac415b8c7ccbc8a5434b1e316af21aea
change-id: 20260529-winbond-v7-1-spi-nor-jv-cleanup-817889edd1f7

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
