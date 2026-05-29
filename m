Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E123BCD6E52
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2026 15:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/j1QCTFUU7oVHFmjEweCc/RsYvEaMgGfLti/CRAzwkc=; b=UP7Bn9bJvB8oM9
	Hz9N3vgQKFCLgmKZjwNSsVXhynWu0MFlTTS0zrydmirGe0QRZH8wJsyJZ1ci3JV+yehk+arcErt3S
	lW23AcoNaZxPdcswYdg6cGizJ2c7IZm1InPxovhv01JB6t5+8M3YNSgb4VC/6mt0CksQt4LB5ni3I
	jMmMZXeagGmKWSpE4eAoKeuH9q9YvHCSAC3I7sragPIu716P/hGEJw2F12OuIkyvano53Vg/vIsAB
	RgWeLmXRnuHVlkQy18e/UUTdGz8htmcmxSPV1oZhVIm231kmQotfiAv9DRcdt57MIoYrYXrXcCOIP
	YO5f3VQSWVMb/syahS8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz2x-00000007fDH-2Z2Y;
	Fri, 29 May 2026 15:22:51 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz2s-00000007fA2-1qi1
	for linux-mtd@lists.infradead.org;
	Fri, 29 May 2026 15:22:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6E49A1A373A;
	Fri, 29 May 2026 15:22:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3B23B601FA;
	Fri, 29 May 2026 15:22:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B56410888CC6;
	Fri, 29 May 2026 17:22:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780068160; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Rwz8MVu9AyyOye3Lt9KYd/V//GRrLoKGKoOKdm8qB1k=;
	b=o3u6sL8Ic7B+p/DU+duqAmhpgcw+SCG3DbdJqOdplSr8ScfcCKKK0EI27nfXsL12TmaiNO
	VCDahvaKL5QLjvClzDxc3+uQwwxqlCr0hqYWgaqCd9THJKD4pt29SgXIr9EEIh9DDWR9aR
	H6C1nr2smoKjfUU753oHZKNU5LkDj4RLlShSsJksHmyjBXiy8oEFjOgJTNserHwpJNvUJC
	dPXoFM6lyqzNwZSKdaJ8vIuZVJSjHfQDIqFLRgQog1U9HEZZBNx0Q3MqdoFbLOnriV08ig
	v+9sElxkKCMyRGg4/858GPpcMQ54dm0WK6TUhnijdKaLo5qZ56jXAFMW3BEqNw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 00/30] mtd: spi-nor: Clean Winbond W25QxxJV family
Date: Fri, 29 May 2026 17:22:20 +0200
Message-Id: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQrCMBBG4auUWfeHJqBJe5XSRW2mOiKTkGAUS
 u9ucPlt3juocBYuNHUHZa5SJGqD6TvaHqveGRKayQ72OlzsiI/oLWpAdTAoSaAx41mxvXjVd4I
 3zvuRQzC7o1ZJmXf5/g/zcp4/KWD13HEAAAA=
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
X-CRM114-CacheID: sfid-20260529_082246_645901_D94ABF8D 
X-CRM114-Status: GOOD (  10.63  )
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
- Removing the useless part names (which are going to become a problem)
- Aligning the comments and "fixing" the chip names in them
- Reordering the chips by density and family
- Testing and showing all the SFDP content and passing all the SPI NOR
  tests to ensure a good level of support.
- Describing only what needs to be described, parsing the SFDP tables
  otherwise.
- Adding all the locking information when it is missing.

This work is necessary because I am about to propose the addition of the
W25QxxRV family, whose IDs actually collide with the JV chips. The chips
are similar, they have been "improved" (especially the silicon/engraving
smoothness) and we have a way to differentiate them based on their SFDP
content, but that will be for a following series.

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
Miquel Raynal (30):
      mtd: spi-nor: winbond: Move W25Q01NW to its right place
      mtd: spi-nor: winbond: Normalize names
      mtd: spi-nor: winbond: Stop filling the .name entry
      mtd: spi-nor: winbond: Make the RDCR fixup Winbond wide
      mtd: spi-nor: winbond: W25Q32JV-Q/N: Drop redundant data
      mtd: spi-nor: winbond: W25Q64JV-Q/N: Drop redundant data
      mtd: spi-nor: winbond: W25Q512JV-Q/N: Drop redundant data
      mtd: spi-nor: winbond: W25Q32JV-Q/N: Add quad page program capability
      mtd: spi-nor: winbond: W25Q64JV-Q/N: Add quad page program capability
      mtd: spi-nor: winbond: W25Q128JV-Q/N: Add quad page program capability
      mtd: spi-nor: winbond: W25Q32JV-Q/N: Fill locking information
      mtd: spi-nor: winbond: W25Q64JV-Q/N: Fill locking information
      mtd: spi-nor: winbond: W25Q128JV-Q/N: Fill locking information
      mtd: spi-nor: winbond: W25Q512JV-Q/N: Fill locking information
      mtd: spi-nor: winbond: W25Q01JV-Q/N: Fill locking information
      mtd: spi-nor: winbond: W25Q32JV-M: Drop redundant data
      mtd: spi-nor: winbond: W25Q64JV-M: Drop redundant data
      mtd: spi-nor: winbond: W25Q128JV-M: Drop redundant data
      mtd: spi-nor: winbond: W25Q32JV-M: Add quad page program capability
      mtd: spi-nor: winbond: W25Q64JV-M: Add quad page program capability
      mtd: spi-nor: winbond: W25Q128JV-M: Add quad page program capability
      mtd: spi-nor: winbond: W25Q32JV-M: Fill locking information
      mtd: spi-nor: winbond: W25Q64JV-M: Fill locking information
      mtd: spi-nor: winbond: W25Q128JV-M: Fill locking information
      mtd: spi-nor: winbond: W25Q02JV-M: Fill locking information
      mtd: spi-nor: winbond: W25Q512JV-M: New chip
      mtd: spi-nor: winbond: W25Q01JV-M: New chip
      mtd: spi-nor: winbond: W25QxxJV-Q/N/M: Drop redundant data
      mtd: spi-nor: winbond: W25QxxJV-Q/N/M: Add quad page program capability
      mtd: spi-nor: winbond: W25QxxJV-Q/N/M: Fill locking information

 drivers/mtd/spi-nor/winbond.c | 147 +++++++++++++++++++++---------------------
 1 file changed, 73 insertions(+), 74 deletions(-)
---
base-commit: 361a4eb81d0bb23dd27919f969e14a4a372af6e2
change-id: 20260529-winbond-v7-1-spi-nor-jv-cleanup-817889edd1f7

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
