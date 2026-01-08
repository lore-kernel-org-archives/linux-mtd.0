Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C338D1D478
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jan 2026 16:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eEqY02OEj5Raym23QolJNqQgD1AascVXUTPI7PvvUiw=; b=Lb1zA/QGuRBHxX
	2MsvOGmrd0uy1Ktg9IfBgLMhcJh2eQuWub9EBsdSFc6Xi49hH/apLyQqeKYa59TyUiahI5TbTqOcQ
	6qJbVBI/XN2oUykALjalpo/hpx3gyYxl0OhAowKG29AGr3zaPUeVQkQzQoNO9+5FESQE1BVkW4sF0
	X8hys2Rvw/kpmdfOfNf1z3dgvMp2a/GMDB3xEAulibXep0vNuL9IcsEEMUUVgExx1nb1+TYtDv9IG
	Zg21GSrDd7G5p3CtLZFKbEKtk8gYrG/qNAultjTdHrbH4gpw3S54waDyYJNHvY8E6/NGwyS/NeGaL
	JjsKTiYn4q2SgnqNyVwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtLU-00000000F3o-1CKJ;
	Thu, 08 Jan 2026 16:58:48 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtLQ-00000000F1h-2Lre
	for linux-mtd@lists.infradead.org;
	Thu, 08 Jan 2026 16:58:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 62BD1C1ECBD;
	Thu,  8 Jan 2026 16:58:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96DB66072B;
	Thu,  8 Jan 2026 16:58:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 666D9103C8891;
	Thu,  8 Jan 2026 17:58:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767891520; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=E+E90BltAoO+qn8F30WKKOmABemNtGnZLPXKAjs4xnI=;
	b=MZ/dyuSyCdfnO7r8Z3aYcq+P7lQSXYQT08myG7d7wTE6630zfJ2I15slCXCRz/7JhWTMcn
	BbEUgkXvj6Q/z1Z5YOcn0BQjQp1JX3eAqh7WsEzjSDkP+JRuhgFKpIyp6CEU2qWFB4wH9I
	XsdYXe32VMhMMqKjazEqufx3ylFqdrktKZyVd11jqdIVnYDzHrocAF/9JGzRKzgTSnFB5j
	0sQs4EQPCZ8PBoJh8K0zoWpskcCTvtzkn97wLf05SeR7MeIp06NBAfduP1U0sjRcwXlqYB
	GIwIXgXhI8KPeKzS8ZBM3+ApAzuPTVNyRSaFGw6skA/WgiD81qluApSFKxHx0g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 00/27] mtd: spi-nor: Enhance software protection
Date: Thu, 08 Jan 2026 17:57:33 +0100
Message-Id: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-0-c462ef806130@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NQQ6CMBCF4auQWTuGKVDAlfcwLKQUmUQ7pCVFQ
 7i7lRO4/N7ifxsE69kGuGQbeBs5sLgEdcrATHf3sMhDMqhcVURU4squFzdg1EgNekMYZkYnHsM
 6Y6OrodBjOeq2gtSYvR35ffRvXfLEYRH/Oe4i/dZ/y5Ewx7Kpe1OTatuCrr3I8mR3NvKCbt/3L
 3o/I3LMAAAA
X-Change-ID: 20251114-winbond-v6-18-rc1-spi-nor-swp-865d36f4f695
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, stable@kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_085844_886516_A9D458CF 
X-CRM114-Status: GOOD (  21.39  )
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
base-commit: 99bb09369a9eaed5de0e647cc1aab215668ddc6f
change-id: 20251114-winbond-v6-18-rc1-spi-nor-swp-865d36f4f695

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
