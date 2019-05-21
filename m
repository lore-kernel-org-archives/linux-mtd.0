Return-Path: <SRS0=joji=TV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F2EFC04AAF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 07:12:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC3BC20856
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 07:12:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eCegPk8j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC3BC20856
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aWf61Jglz2acF2g4GSbPNCkL39aL67Jb1LT5GHv3C4I=; b=eCegPk8jRzWITa
	8qGVWgvP2jW9IvyqX5XCNuD3PhVo3jALbHm0xKD1D9M3m45rJA1ka0nvxF1DClXbiK3LlnBi7JsNB
	FTbg7I6UzNruUqY+msuVtQD8Bu72lMm67MSxZp5bWrv142IqNeC5o8DlZuOP+8FPn8lADOyDbGG+0
	ZUUZYR2BPzD9R90CN8uN5D4kyPbwYeoGWPt+ArZAA7jicb+aEuzF43MsY/7RAB4JSV8/H91w3KBRd
	nTHa60mISOO6mHGUoVBu4CfcYiNBUKALAiQQARYHq6m8CV5oInFaQZTI2JpLivMzlTuGOQ1R7lqKU
	75T2CpA8eEvwvmnZQmxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSyx0-0007vu-Cm; Tue, 21 May 2019 07:12:42 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSyww-0007vP-OK
 for linux-mtd@lists.infradead.org; Tue, 21 May 2019 07:12:40 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hSywu-0007rD-Rd; Tue, 21 May 2019 09:12:36 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hSywu-0004n6-73; Tue, 21 May 2019 09:12:36 +0200
Date: Tue, 21 May 2019 09:12:36 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 00/14] Implement exec_op for GPMI nand driver
Message-ID: <20190521071236.zuoqdy5yspymxwp4@pengutronix.de>
References: <20190425125643.29990-1-s.hauer@pengutronix.de>
 <20190520163038.7f38b54a@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520163038.7f38b54a@xps13>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:08:05 up 3 days, 13:26, 49 users, load average: 0.10, 0.14, 0.11
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_001238_996524_E9C39383 
X-CRM114-Status: GOOD (  26.93  )
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
 Richard Weinberger <richard@nod.at>, Vinod Koul <vkoul@kernel.org>,
 linux-mtd@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, May 20, 2019 at 04:30:38PM +0200, Miquel Raynal wrote:
> Hi Sascha,
> 
> Sascha Hauer <s.hauer@pengutronix.de> wrote on Thu, 25 Apr 2019
> 14:56:29 +0200:
> 
> > The GPMI nand driver suffers from very poor performance. The read
> > performance can be roughly doubled with two steps: First is to use
> > runtime PM for controlling the clocks which prevents the driver from
> > spending a good amount of time en/disabling the clocks. The second step
> > is to implement exec_op which allows us to combine the steps necessary
> > to do a page read into a single DMA transaction.
> > 
> > I would prefer to let this go through the mtd tree with the ack of the
> > dmaengine maintainers
> > 
> > changes since v2:
> > 
> > - s/dma/dmaengine in dmaengine specific patches
> > - s/nand/NAND/
> > - Add reviewed-by Miquel
> > - Add Acked-by Vinod
> > 
> > changes since v1:
> > 
> > - tested and fixed on i.MX28
> > - remove debugging leftover
> > - Add mxs dma specific header files to put the oddities of the mxs dma
> >   driver in
> > - Turn off BCH engine interrupts when not needed as they result in
> >   calling complete() on an uninitialized completion. This crashes
> >   on i.MX28
> > 
> > Sascha Hauer (14):
> >   mtd: rawnand: export NAND operation tracer
> >   mtd: rawnand: fsmc: Use nand_op_trace for operation tracing
> >   mtd: rawnand: gpmi: move all driver code into single file
> >   mtd: rawnand: gpmi: remove unused variable
> >   mtd: rawnand: gpmi: Remove unnecessary variables
> >   mtd: rawnand: gpmi: read buf in nand_read_page_op
> >   mtd: rawnand: gpmi: remove unused parameters
> >   mtd: rawnand: gpmi: Drop unnecessary restoring of previous chipselection
> >   mtd: rawnand: gpmi: use runtime PM to manage clocks
> >   dmaengine: mxs: Drop unnecessary flag
> >   mtd: rawnand: gpmi: drop unnecessary flag
> >   dmaengine: mxs: Add header file to be shared with gpmi nand driver
> >   dmaengine: mxs: rename custom flag
> >   mtd: rawnand: gpmi: Implement exec_op
> > 
> >  drivers/dma/mxs-dma.c                      |   25 +-
> >  drivers/mtd/nand/raw/fsmc_nand.c           |   19 +-
> >  drivers/mtd/nand/raw/gpmi-nand/Makefile    |    1 -
> >  drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c  |  936 -----------
> >  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 1687 ++++++++++++++------
> >  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h |   64 +-
> >  drivers/mtd/nand/raw/nand_base.c           |   30 +-
> >  include/linux/dma/mxs-dma.h                |   24 +
> >  include/linux/mtd/rawnand.h                |   37 +
> >  9 files changed, 1264 insertions(+), 1559 deletions(-)
> >  delete mode 100644 drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
> >  create mode 100644 include/linux/dma/mxs-dma.h
> > 
> 
> Please ignore the previous message telling the patch was applied, I
> have to manually fix all the conflicts, I canceled the operation: would
> you mind rebasing on v5.2-rc1 and respin?

Yes, due to the patch merging the two files into one the rebase was a
bit tricky with the changes to the driver in the last merge window. It
basically meant redoing "mtd: rawnand: gpmi: move all driver code into
single file" completely to get the changes from the last window into
that patch. Don't worry, I pretty much expected that. Find a new version
in your inbox.

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
