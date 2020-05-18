Return-Path: <SRS0=rUMq=7A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 013E0C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 16:29:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2B2C207ED
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 16:29:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TXXqfGi2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2B2C207ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7Xxr5Cz4qoudqFaZmd/waCzUShfZkk5/y4NoX6En4KE=; b=TXXqfGi2H/PE+N
	u9yKPV+ypM0EEXtlNah0KH30J1Lmf9C7Y43al53hLl0DyDD7KYtNLsLEP5e0fM18wbCy4JGEouBRp
	/ppbNeGDTC0k1Hbli9gxmSOHrlxacEKi4lSoThcgV+0EoDulZYsXxVuqeCfz0xVFY2Lx2mLc3YWDj
	BzxaE87psX4Tcyjyw6GBNqTxQjEau0Rb81+drG1LW/4QBOMHm7T9bjibplSEmnL3FZbY0mJUf7MwO
	EXpWytmLgrF1UKE75ak3QBpX5pgoc36Q60N55ZUke58zNwbYdZ/BDumfiozxeCxeyAtaNV3MjMMEN
	E465ZK12L8oBPpoyY+2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaidO-0006U0-HF; Mon, 18 May 2020 16:28:58 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaid9-0006Ge-4C
 for linux-mtd@lists.infradead.org; Mon, 18 May 2020 16:28:44 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 74E8F2A0D72;
 Mon, 18 May 2020 17:28:41 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 linux-mips@vger.kernel.org
Subject: [PATCH v2 0/8] mtd: rawnand: bcm47xx: Convert to exec_op() (and more)
Date: Mon, 18 May 2020 18:28:29 +0200
Message-Id: <20200518162837.304471-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_092843_297441_AE22309B 
X-CRM114-Status: GOOD (  14.21  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

A bit of context to explain the motivation behind those conversions
I've been sending for the last couple of weeks. The raw NAND subsystem
carries a lot of history which makes any rework not only painful, but
also subject to regressions which we only detect when someone dares to
update its kernel on one of those ancient HW. While carrying drivers
for old HW is not a problem per se, carrying ancient and unmaintained
drivers that are not converted to new APIs is a maintenance burden,
hence this massive conversion attempt I'm conducting here.

So here is a series converting the BCM47XX NAND controller driver to
exec_op(), plus a bunch of minor improvements done along the way.
I hope I'll find someone to test those changes, but if there's no one
still having access to this  HW or no interest in keeping it supported
in recent kernel versions, we should definitely consider removing the
driver instead.

No major changes in this v2, apart from fixes for things reported by
Miquel. See the changelog on each patch for more details.

Regards,

Boris

Boris Brezillon (8):
  mtd: rawnand: Add an is_last flag to nand_subop
  mtd: rawnand: bcm47xx: Drop dependency on BCMA
  mtd: rawnand: bcm47xx: Allow compiling the driver when COMPILE_TEST=y
  mtd: rawnand: bcm47xx: Demistify a few more things
  mtd: rawnand: bcm47xx: Implement the exec_op() interface
  mtd: rawnand: bcm47xx: Get rid of the legacy implementation
  mtd: rawnand: bcm47xx: Simplify the init() function
  mtd: rawnand: bcm47xx: Merge all source files

 drivers/mtd/nand/raw/Kconfig                  |   3 +-
 drivers/mtd/nand/raw/Makefile                 |   2 +-
 .../mtd/nand/raw/bcm47xx-nand-controller.c    | 343 +++++++++++++
 drivers/mtd/nand/raw/bcm47xxnflash/Makefile   |   5 -
 .../nand/raw/bcm47xxnflash/bcm47xxnflash.h    |  26 -
 drivers/mtd/nand/raw/bcm47xxnflash/main.c     |  77 ---
 .../mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c  | 450 ------------------
 drivers/mtd/nand/raw/nand_base.c              |   2 +
 include/linux/mtd/rawnand.h                   |   2 +
 9 files changed, 349 insertions(+), 561 deletions(-)
 create mode 100644 drivers/mtd/nand/raw/bcm47xx-nand-controller.c
 delete mode 100644 drivers/mtd/nand/raw/bcm47xxnflash/Makefile
 delete mode 100644 drivers/mtd/nand/raw/bcm47xxnflash/bcm47xxnflash.h
 delete mode 100644 drivers/mtd/nand/raw/bcm47xxnflash/main.c
 delete mode 100644 drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c

-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
