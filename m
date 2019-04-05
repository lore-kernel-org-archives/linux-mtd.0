Return-Path: <SRS0=PylK=SH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E852C4360F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 10:09:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4ED05217D4
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 10:09:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bf3DRLRb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4ED05217D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i3jwGJoC+56cHaIS5WsYpePWtR7UYNGFPL30cxhCJmQ=; b=Bf3DRLRb6MNHhS
	c22tLYCWUP7vnDD44Uh5urp2PB2Rn7BgCmT6Z0Kj2RSusjhTcq/8prP0TYolDQlmGd6k1Bs07cmeE
	3XfReMYHXVDj15Z3YDdljoW6se9M41O2+7C5wHCDutEydZ891bZk06GKuoer5lG78XFKMA4HP2sEg
	sCj1FYbfU7faAuT6mGZOW399PxDnKEravgiVAle9xXSenTnns8NvvYFHNaVRouUfB3GMTa1MJuivr
	yrogo0EhJrTlmo4KGSNLaFWmfuC9nOYrThrJDCyFAUMq8Xsn1R2vNS9CmPfbhTn3sYX/78u2ArXl9
	CFwFljcVvdcdVkDzx5UA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCLmY-0002WS-7F; Fri, 05 Apr 2019 10:09:10 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCLlb-0001Jr-Lp
 for linux-mtd@lists.infradead.org; Fri, 05 Apr 2019 10:08:46 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hCLlB-0000RI-TP; Fri, 05 Apr 2019 12:07:45 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92-RC6)
 (envelope-from <sha@pengutronix.de>)
 id 1hCLlA-0008Ik-F8; Fri, 05 Apr 2019 12:07:44 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 00/10] Implement exec_op for GPMI nand driver
Date: Fri,  5 Apr 2019 12:07:30 +0200
Message-Id: <20190405100740.5074-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_030812_371144_C59EF193 
X-CRM114-Status: GOOD (  11.93  )
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
Cc: Sam Lefebvre <sam.lefebvre@essensium.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
 Miquel Raynal <miquel.raynal@bootlin.com>, Han Xu <han.xu@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The GPMI nand driver suffers from very poor performance. The read
performance can be roughly doubled with two steps: First is to use
runtime PM for controlling the clocks which prevents the driver from
spending a good amount of time en/disabling the clocks. The second step
is to implement exec_op which allows us to combine the steps necessary
to do a page read into a single DMA transaction.

Sascha

Sascha Hauer (10):
  mtd: rawnand: export nand operation tracer
  mtd: rawnand: fsmc: Use nand_op_trace for operation tracing
  mtd: rawnand: gpmi: move all driver code into single file
  mtd: rawnand: gpmi: remove unused variable
  mtd: rawnand: gpmi: Remove unnecessary variables
  mtd: rawnand: gpmi: read buf in nand_read_page_op
  mtd: rawnand: gpmi: remove unused parameters
  mtd: rawnand: gpmi: Drop unnecessary restoring of previous chipselection
  mtd: rawnand: gpmi: use runtime PM to manage clocks
  mtd: rawnand: gpmi: Implement exec_op

 drivers/dma/mxs-dma.c                      |    3 +
 drivers/mtd/nand/raw/fsmc_nand.c           |   19 +-
 drivers/mtd/nand/raw/gpmi-nand/Makefile    |    1 -
 drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c  |  936 -----------
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 1694 ++++++++++++++------
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h |   64 +-
 drivers/mtd/nand/raw/nand_base.c           |   30 +-
 include/linux/mtd/rawnand.h                |   37 +
 8 files changed, 1236 insertions(+), 1548 deletions(-)
 delete mode 100644 drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
