Return-Path: <SRS0=j3xG=SL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DB02C10F0E
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 12:31:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0E4F2084F
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 12:31:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CKOKCa1a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LCRGBLbT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0E4F2084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IzztL2brVB8CNjj7RW9HzoNFbgY2U9JRP2LdYmGAkl4=; b=CKOKCa1apcALap
	cKWsz0nfGfmPEY5uBwM2F2ugpZldOzEufjisRukCKI63SePUU2sVKdcHk0y1dU0JVf4A5sGX8xVFc
	KVyRqv9UTs9r7CIyZEYioph15dQv6w6DAkO5lSm7zbGpBW8QHiUNbRP0zucqe7HcYcCY8tv/Z+tsd
	KXFVMyEKJFfnavB5cvwCVTa4P97dck9/l4LUkV3zoSy2ta/0t+Zl2rA1O3/dWvsl9vlfe3xQQjWRi
	j2+Sx74JwlLYVm4cua04G2qfNv+T0EkZlmACCItC7T9ZoESg7tceEwbs4A2lJvGhHPz9EDawSNVhL
	Xz08pK5dltiXygTn64UA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDpuF-0007UT-8g; Tue, 09 Apr 2019 12:31:15 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDpuB-0007GP-KA
 for linux-mtd@bombadil.infradead.org; Tue, 09 Apr 2019 12:31:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8uNFxDmyLdgWz/h7IzafViHWynulNI/t0GExmpnaMaM=; b=LCRGBLbT17tFtpg0GhOTgSsqGG
 jLvOOMgf6gzzJ3v90iOqTZ3YEDbcDThT7k+uRTRxEwBWMoT17SW9Tm990tmA/W8EIshzxXYXImVEC
 tIWS62GRqdnjMZjbAwpPD6C6TmndVarLEOkkaLdsBnuiKEI9T3dMggV7SUC2TpujWB4t2in+Qest+
 oxU5W1Q2Dt0fZ8540TnMY5AIGvd6v3AYIb0X21sjbZfRABxczkUaZ0q7UEo9OqdYQlPIw33dokrve
 aUXmvMSZS50q0V7W8u8UyXBJyXTnFSlISvfupSDR3CjbpDBLa9hZxox5BnwQlddym5XdSwe4cZFX7
 mg520+QQ==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDp29-0006t7-C8
 for linux-mtd@lists.infradead.org; Tue, 09 Apr 2019 11:35:22 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hDp1D-0001OL-Mn; Tue, 09 Apr 2019 13:34:23 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92-RC6)
 (envelope-from <sha@pengutronix.de>)
 id 1hDp1C-0001bb-Dx; Tue, 09 Apr 2019 13:34:22 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 00/14] Implement exec_op for GPMI nand driver
Date: Tue,  9 Apr 2019 13:34:07 +0200
Message-Id: <20190409113421.3037-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_073521_604552_012571C2 
X-CRM114-Status: GOOD (  15.86  )
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

changes since v1:

- tested and fixed on i.MX28
- remove debugging leftover
- Add mxs dma specific header files to put the oddities of the mxs dma
  driver in
- Turn off BCH engine interrupts when not needed as they result in
  calling complete() on an uninitialized completion. This crashes
  on i.MX28

-----------------------------8<--------------------------------
Sascha Hauer (14):
  mtd: rawnand: export nand operation tracer
  mtd: rawnand: fsmc: Use nand_op_trace for operation tracing
  mtd: rawnand: gpmi: move all driver code into single file
  mtd: rawnand: gpmi: remove unused variable
  mtd: rawnand: gpmi: Remove unnecessary variables
  mtd: rawnand: gpmi: read buf in nand_read_page_op
  mtd: rawnand: gpmi: remove unused parameters
  mtd: rawnand: gpmi: Drop unnecessary restoring of previous
    chipselection
  mtd: rawnand: gpmi: use runtime PM to manage clocks
  dma: mxs: Drop unnecessary flag
  mtd: rawnand: gpmi: drop unnecessary flag
  dma: mxs: Add header file to be shared with gpmi nand driver
  dma: mxs: rename custom flag
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
