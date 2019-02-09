Return-Path: <SRS0=3nsT=QQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29BE3C282C4
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Feb 2019 10:15:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F059920863
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Feb 2019 10:15:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n5U9M0ek"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F059920863
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xX/esem/Ccrw26FfLm34d6Mh5UPalKa80Uwv0UQ+0a4=; b=n5U9M0ekCKhGNm
	paZlKDpacGHY9kGY5Tvp40MesvMdpRAHqaFZKssXLPgyfHADx8lp24pVha8JOZVNl/yig5j6bur9N
	CqDYHoGZxktiCZDXOQPMOs4arGht5darIJJP3Te3LcFMuabX8iiaInN8PTgUEUmgyzrP6G3rGpqhs
	I/vOR7QOwSfFVu9jzMmOofgsYOpvHusmcyTsmC/0NJoou6ZHFOumsRbwKiCJIbxlgwp8wutQQbLIf
	o8Q83ameXy7apLhff+E8Ley/ReFflacGIeEyGtf8sC8LNJno8Pm64zNl7pFytx7exkSKk7INmU99w
	hbDuA/Q/2NG4t6PTCsyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsPfJ-0002h2-KJ; Sat, 09 Feb 2019 10:15:17 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsPfF-0002T8-U6
 for linux-mtd@lists.infradead.org; Sat, 09 Feb 2019 10:15:15 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3979A269D48;
 Sat,  9 Feb 2019 10:14:57 +0000 (GMT)
Date: Sat, 9 Feb 2019 11:14:54 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] mtd: Fixes for 5.0-rc6
Message-ID: <20190209111454.21c8c23b@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190209_021514_152139_77396B34 
X-CRM114-Status: GOOD (  12.83  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Marek Vasut <marex@denx.de>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Linus,

Here is the MTD fixes PR for 5.0-rc6.

Regards,

Boris

The following changes since commit 49a57857aeea06ca831043acbb0fa5e0f50602fd:

  Linux 5.0-rc3 (2019-01-21 13:14:44 +1300)

are available in the Git repository at:

  git://git.infradead.org/linux-mtd.git tags/mtd/fixes-for-5.0-rc6

for you to fetch changes up to d5d27fd9826b59979b184ec288e4812abac0e988:

  mtd: rawnand: gpmi: fix MX28 bus master lockup problem (2019-02-06 09:39:22 +0100)

----------------------------------------------------------------
- Fix a problem with the imx28 ECC engine
- Remove a debug trace introduced in 2b6f0090a333 ("mtd: Check
  add_mtd_device() ret code")
- Make sure partitions of size 0 can be registered
- Fix kernel-doc warning in the rawnand core
- Fix the error path of spinand_init() (missing manufacturer cleanup
  in a few places)
- Address a problem with the SPI NAND PROGRAM LOAD operation which
  does not work as expected on some parts.

----------------------------------------------------------------
Boris Brezillon (4):
      mtd: spinand: Handle the case where PROGRAM LOAD does not reset the cache
      mtd: spinand: Fix the error/cleanup path in spinand_init()
      mtd: Remove a debug trace in mtdpart.c
      mtd: Make sure mtd->erasesize is valid even if the partition is of size 0

Martin Kepplinger (1):
      mtd: rawnand: gpmi: fix MX28 bus master lockup problem

Randy Dunlap (1):
      mtd: rawnand: fix kernel-doc warnings

 drivers/mtd/mtdpart.c                     |  5 ++++-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c | 13 ++++++-------
 drivers/mtd/nand/raw/nand_base.c          |  1 +
 drivers/mtd/nand/raw/nand_bbt.c           |  2 +-
 drivers/mtd/nand/spi/core.c               | 46 ++++++++++++++++++++++------------------------
 5 files changed, 34 insertions(+), 33 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
