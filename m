Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598EBFD7074
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 10:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XxLx95U4Rf7voYB7IF7htEtOz1YDbHD381Bh/iyP/Rg=; b=S29RBwcrtEPN5o
	pkt9VR+gNSs6yTYcbOtnMOGRcunir54Fm2HDb1e6dZX8mfWGhrrCraDu7I9Jko5PeOnr4wmEp2/O8
	aFBQOEGOEFTuiNMfiykX5h1Kfsf4nuVVrmMy2scwkn1hm6JAHYaJ7+aU4WlDMbGsLkALwgDQDzZkX
	N3J1Bin2UOhWqlgUuo580FxdEAQhNef8N8QfktTVwE5usNHd/DO4+kuDJ6EOApssDmubG2G7cplBU
	OAHz86R5ZsZX2TUvgsETksMYqSTGNrlntd+EN7PMUj67DB0CRoCe/pdcoPgQ9tsGg3K/yXuoUMBle
	qlCDduvtoQ1agprzjCLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Rb1-00000005zKG-2gUW;
	Tue, 17 Mar 2026 10:24:19 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Ray-00000005zJC-1452
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 10:24:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0B5821A2D73;
	Tue, 17 Mar 2026 10:24:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D42185FC9A;
	Tue, 17 Mar 2026 10:24:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 85263104503A6;
	Tue, 17 Mar 2026 11:24:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773743052; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=sElk1a0rbyXJo2pC2tiqhDCKfLfW9ww2qocJ8ozGUyk=;
	b=Aaqk0gG1QlXT/xNCx4Y55fzfBGepX7CPp5up8bZbeaSh+ZD11vCeer/h8+MOiz56iZRZc8
	s35NETAlpIeX6f/7dJo5YKeFA2NZUQ3M7LkFHWCyEVAN4YJjk8qqadn5y+NuwvB3anCeYy
	q3PHGFEAq3S4Xy92r0rhjLdmkdQ/g9POg4dcSFXucIRMp01TNNMSvfKmtcXHIxPMMg09Ue
	3on305oxf5qEiN2uQ6a2BWZczyu10yn8hQr6/igEVJr8WzwkoAWKgc6lFOCBXk3/7YskY3
	O3xnOr3cyRz15SBFEtool9Zu8QUTpmU2gwsmHTUTAuWP4P0G5d4GriRvQMxGxg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 00/27] mtd: spi-nor: Enhance software protection
Date: Tue, 17 Mar 2026 11:24:03 +0100
Message-Id: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-0-2ca9ea4e7b9b@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NsQ6CMBSF4Vcxnb2mt5RSnHwP4yClyE20JS0pG
 sK7W0gcnHT8z/CdmUUbyEZ23M0s2ESRvMtR7HfM9Fd3s0Btbia4KBFRwkSu8a6FpAA1BIMQBwL
 nA8RpAK3KtlCd7FRdsmwMwXb03PzzJXdPcfThtd0lXNd/5YTAQeqqMRWKui7w1Hg/3skdjH+w1
 U7i4ymOXP/yRPaMVMJ2miss+Le3LMsbwPZprhwBAAA=
X-Change-ID: 20251114-winbond-v6-18-rc1-spi-nor-swp-865d36f4f695
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, stable@kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_032416_434274_F0310738 
X-CRM114-Status: GOOD (  21.58  )
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

Hello,

As recently raised on the mailing-list (link below), it seems that the
"locking" support in SPI NOR could benefit from some enhancements. As I
myself had to dig into it recently, here is a proposal.

First issue that I see, the MEMLOCK ioctl is not behaving correctly
in some cases, as addressed in:

    mtd: spi-nor: swp: Improve locking user experience

Then there is no clear explanation of the shortcuts taken by the kernel
in terms of uAPI, so there is an attempt to list them in:

    mtd: spi-nor: swp: Explain the MEMLOCK ioctl implementation behaviour

Plus, Tudor also asked if we could cover locking in the testing
procedure, which is done in:

    mtd: spi-nor: Add steps for testing locking support

In order to simplify this procedure, and because it got very helpful
during my testing/development, I want to propose additions to the
debugfs output:

    mtd: spi-nor: debugfs: Add locking support TODO: make the captures again

Finally, I am providing an implementation for the complement (CMP)
feature in order to allow finer control of the regions locked. This
feature is for instance available on Winbond chips:

    [core] mtd: spi-nor: swp: Add support for the complement feature
    [doc]  mtd: spi-nor: Add steps for testing locking with CMP
    [use]  mtd: spi-nor: winbond: Add CMP locking support

Disclaimer: it was much less straightforward than I initially thought to
get the CMP feature working correctly. I tested it with as much focus as
I could, and I am improving the test coverage for the new cases, I am
also providing extra test cases in the metadata of the commit (which do
not make sense to test for chip additions, but may be sensible show when
making core additions like this one), but honestly there are so many
possibilities, I may still be missing corner cases. I hope this will
anyway be helpful to others!

All the other patches are misc improvements or style fixes which I faced
and fixed during my development.

Link: https://lore.kernel.org/linux-mtd/92e99a96-5582-48a5-a4f9-e9b33fcff171@linux.dev/

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v3:
- No change at all, just rebased on top of v7.0-rc1.
- Collected 2 R-by from M. Walle.
- Link to v2: https://lore.kernel.org/r/20260108-winbond-v6-18-rc1-spi-nor-swp-v2-0-c462ef806130@bootlin.com

Changes in v2:
- Collect tags.
- Add missing Fixes/Cc: stable tags.
- Add a comment explaining why can_be_top && can_be_bottom is a specific
  condition.
- Fix commit logs following Michael Walle's reviews.
- Amend the documentation following our discussion with Michael Walle as
  well.
- Cache the SR register for debugfs use.
- Create a locked sector map file instead of dumping it as part of the
  `params` file output.
- Improved greatly the output of the map as suggested by Michael.
- Add a patch fixing a duplicate dependency in Kconfig.
- Add an important comment in the doc about the small 4kiB erase size
  choice.
- Add test runs for each and every chip for which the CMP feature is
  added. This prove me that testing of each and every chip was needed,
  as some of them seem to feature a broken BFPT table which does not
  advertise a working 35h (Read CR) command.
- Added a condition on which the CMP feature is enabled: RDCR must be
  possible.
- Link to v1: https://lore.kernel.org/r/20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com

---
Miquel Raynal (27):
      mtd: spi-nor: Drop duplicate Kconfig dependency
      mtd: spi-nor: debugfs: Fix the flags list
      mtd: spi-nor: swp: Improve locking user experience
      mtd: spi-nor: Improve opcodes documentation
      mtd: spi-nor: debugfs: Align variable access with the rest of the file
      mtd: spi-nor: debugfs: Enhance output
      mtd: spi-nor: swp: Explain the MEMLOCK ioctl implementation behaviour
      mtd: spi-nor: swp: Clarify a comment
      mtd: spi-nor: swp: Use a pointer for SR instead of a single byte
      mtd: spi-nor: swp: Create a helper that writes SR, CR and checks
      mtd: spi-nor: swp: Rename a mask
      mtd: spi-nor: swp: Create a TB intermediate variable
      mtd: spi-nor: swp: Create helpers for building the SR register
      mtd: spi-nor: swp: Simplify checking the locked/unlocked range
      mtd: spi-nor: swp: Cosmetic changes
      mtd: spi-nor: Create a local SR cache
      mtd: spi-nor: debugfs: Add locking support
      mtd: spi-nor: debugfs: Add a locked sectors map
      mtd: spi-nor: Add steps for testing locking support
      mtd: spi-nor: swp: Add support for the complement feature
      mtd: spi-nor: Add steps for testing locking with CMP
      mtd: spi-nor: winbond: Add W25H512NWxxAM CMP locking support
      mtd: spi-nor: winbond: Add W25H01NWxxAM CMP locking support
      mtd: spi-nor: winbond: Add W25H02NWxxAM CMP locking support
      mtd: spi-nor: winbond: Add W25H01NWxxIQ CMP locking support
      mtd: spi-nor: winbond: Add W25Q01NWxxIM CMP locking support
      mtd: spi-nor: winbond: Add W25Q02NWxxIM CMP locking support

 Documentation/driver-api/mtd/spi-nor.rst | 164 ++++++++++++++
 drivers/mtd/spi-nor/Kconfig              |   1 -
 drivers/mtd/spi-nor/core.c               |  74 ++++++-
 drivers/mtd/spi-nor/core.h               |  10 +
 drivers/mtd/spi-nor/debugfs.c            |  63 +++++-
 drivers/mtd/spi-nor/swp.c                | 359 ++++++++++++++++++++++++-------
 drivers/mtd/spi-nor/winbond.c            |  41 +++-
 include/linux/mtd/spi-nor.h              |   7 +-
 8 files changed, 631 insertions(+), 88 deletions(-)
---
base-commit: 7ec0b5645131696d2ae9423ae32a80441ce201d6
change-id: 20251114-winbond-v6-18-rc1-spi-nor-swp-865d36f4f695

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
