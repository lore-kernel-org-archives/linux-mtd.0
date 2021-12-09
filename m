Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9AEC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Dec 2021 09:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LPp7af5m8dctOCBKdSBQ4mBPY41a4pnwQaJushK35vo=; b=OPOWnNFJ9oY077
	AHuv7Jz7nxsHQzrv703CmjBy8iCBhkajMZzJlBul4jXrV3eXopaNHOqIoLMjijHyGEzcyfgZulCZz
	cL4O2874SGMrvXu3Fk4U8mJzfgs4BqF1hXT5/X4XHETuvAwon5a/ne3PkI4RE1Rei3lk+HN3bywXZ
	i/4+ghY5sp2sUErVHkTWL+5SaDehXJ2rnwT5w5N8YBdccuudL+eQeXeoA0gMJLRSR6yBo3t2wSfUm
	nfZ+AGRA7yiPh1zULzwFoxKKlwtS4oDudvBGHfI/kR8LbMq/w/hAGaSwbe1mYyPKVEGxwx/r92n61
	cP3LjEvv9o7ROl2caPmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvFMV-00FJZV-EV; Thu, 09 Dec 2021 09:05:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvFMS-00FJXT-HH
 for linux-mtd@lists.infradead.org; Thu, 09 Dec 2021 09:05:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 48536B823F7;
 Thu,  9 Dec 2021 09:05:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6161DC004DD;
 Thu,  9 Dec 2021 09:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639040704;
 bh=+Uks86XpZtorbWZGFtvvEcGW8QVq+3G7N42yvIktwrk=;
 h=From:To:Cc:Subject:Date:From;
 b=NC0kBq1IL64fhjw5ghq+QUvQD5x9SwnDRKPAyQUo5W5qHuoLfeo1+Ji1fUCzyW0WM
 UsxydwVmeMN4ane9FpvxnabG/7ng4GFZ5drHA/qeEzUD2+2Vi+VipaKucXLi3btwhV
 EjG+eXYXYPyZEIqO/YoP+vGgDangZPKj1Lp+aeavV0Ql7fGMyDGZzX7G8R7IE0zeSO
 ZGlvrFGEi+Y2f4f+wdJH3G7uPqfyqOUn0T0IXs29LjhdbZqJz3IZ82DKRjPLnhv4Zb
 9m7Y2+6gCpR+HW62QBjhi0ziZsiZ20P7mj6du4kW7xNoIhvB+28iFTVdGmcoMhq5hz
 G3IZe0IoHb7qw==
From: Roger Quadros <rogerq@kernel.org>
To: miquel.raynal@bootlin.com,
	richard@nod.at
Cc: vigneshr@ti.com, kishon@ti.com, nm@ti.com, tony@atomide.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v2 0/6] mtd: nand: omap2: Switch to exec_ops, support AM64 SoC
Date: Thu,  9 Dec 2021 11:04:52 +0200
Message-Id: <20211209090458.24830-1-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_010508_754774_6C137835 
X-CRM114-Status: GOOD (  10.30  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

This series gets rid of the Legacy ops and switches to exec_ops framework.

Also add support for TI's AM64 SoC which contains a GPMC NAND controller.

Changelog:
v2
- Dropped the quirk code for AM64 SR1.0. Will add this later when
there is more clarity on compatible ID that will be used for this SoC.
Production version of AM64 SoC shouldn't require this quirk.
- Changed commit message title to "mtd: rawnand: omap2:"
- Added 2 new patches.
	1) fixes force_8bit behaviour for DMA mode
	2) drops unused variable

Roger Quadros (6):
  dt-bindings: mtd: ti,gpmc-nand: Add compatible for AM64 NAND
  mtd: rawnand: omap2: Allow build on K3 platforms
  mtd: rawnand: omap2: move to exec_op interface
  mtd: rawnand: omap2: Add compatible for AM64 SoC
  mtd: rawnand: omap2: fix force_8bit flag behaviour for DMA mode
  mtd: rawnand: omap2: drop unused variable

 .../devicetree/bindings/mtd/ti,gpmc-nand.yaml |   5 +-
 drivers/mtd/nand/raw/Kconfig                  |   2 +-
 drivers/mtd/nand/raw/omap2.c                  | 503 ++++++++----------
 3 files changed, 226 insertions(+), 284 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
