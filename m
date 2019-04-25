Return-Path: <SRS0=0ANE=S3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8DB3C10F03
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Apr 2019 12:57:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F139C20678
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Apr 2019 12:57:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="khKCM8w5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F139C20678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/J5RUPWlstvKpttUUEJP6u+MleXZcaO+4I6OJMaCXhI=; b=khKCM8w5jQXqbr
	gio23OPhMYNnnEfXvUOAB6KZX42oWVcy+ELac75Pjtd8/tOgGN1VOy6zDt3BVlcTddMiiWTA8rR1V
	PODsr4AQjusGL6/+xcZp/77+uQiHe6ipIpVbHSJM/lP7YQowhzMS/M9nD5NklJQ69YCDwSi9JO9Qx
	bmMXnACqajRtZE1VeNK32S3iFZXn/+zcv4JYjfot5YOPIcis4shumH+lT5DPGNjhk+m5nPliIwp6m
	SGzEjEwJwMUmJSaU9IP3lVQ6I+gMPmnGsas3Ihq+OCH7U14kOHwYaYaoJBknqTs+ZvcirPtuGk0DF
	OpsIlIzXHn9QuQnbtiTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJdwM-0006cM-VR; Thu, 25 Apr 2019 12:57:26 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJdvo-0005vY-5S
 for linux-mtd@lists.infradead.org; Thu, 25 Apr 2019 12:56:54 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hJdvk-0002TU-AW; Thu, 25 Apr 2019 14:56:48 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92-RC6)
 (envelope-from <sha@pengutronix.de>)
 id 1hJdvi-0008Dt-U3; Thu, 25 Apr 2019 14:56:46 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v3 00/14] Implement exec_op for GPMI nand driver
Date: Thu, 25 Apr 2019 14:56:29 +0200
Message-Id: <20190425125643.29990-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_055652_365741_5C891E2C 
X-CRM114-Status: GOOD (  16.08  )
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
Cc: kernel@pengutronix.de, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Han Xu <han.xu@nxp.com>, Shawn Guo <shawnguo@kernel.org>
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

I would prefer to let this go through the mtd tree with the ack of the
dmaengine maintainers

changes since v2:

- s/dma/dmaengine in dmaengine specific patches
- s/nand/NAND/
- Add reviewed-by Miquel
- Add Acked-by Vinod

changes since v1:

- tested and fixed on i.MX28
- remove debugging leftover
- Add mxs dma specific header files to put the oddities of the mxs dma
  driver in
- Turn off BCH engine interrupts when not needed as they result in
  calling complete() on an uninitialized completion. This crashes
  on i.MX28

Sascha Hauer (14):
  mtd: rawnand: export NAND operation tracer
  mtd: rawnand: fsmc: Use nand_op_trace for operation tracing
  mtd: rawnand: gpmi: move all driver code into single file
  mtd: rawnand: gpmi: remove unused variable
  mtd: rawnand: gpmi: Remove unnecessary variables
  mtd: rawnand: gpmi: read buf in nand_read_page_op
  mtd: rawnand: gpmi: remove unused parameters
  mtd: rawnand: gpmi: Drop unnecessary restoring of previous chipselection
  mtd: rawnand: gpmi: use runtime PM to manage clocks
  dmaengine: mxs: Drop unnecessary flag
  mtd: rawnand: gpmi: drop unnecessary flag
  dmaengine: mxs: Add header file to be shared with gpmi nand driver
  dmaengine: mxs: rename custom flag
  mtd: rawnand: gpmi: Implement exec_op

 drivers/dma/mxs-dma.c                      |   25 +-
 drivers/mtd/nand/raw/fsmc_nand.c           |   19 +-
 drivers/mtd/nand/raw/gpmi-nand/Makefile    |    1 -
 drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c  |  936 -----------
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 1687 ++++++++++++++------
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h |   64 +-
 drivers/mtd/nand/raw/nand_base.c           |   30 +-
 include/linux/dma/mxs-dma.h                |   24 +
 include/linux/mtd/rawnand.h                |   37 +
 9 files changed, 1264 insertions(+), 1559 deletions(-)
 delete mode 100644 drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
 create mode 100644 include/linux/dma/mxs-dma.h

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
