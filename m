Return-Path: <SRS0=joji=TV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C0BC04AAF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 07:08:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D53D2173C
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 07:08:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pYOsI9aM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D53D2173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PV8LLwbnPrsWEynm1c5JpcaHw8fRrgtZ2UscjqFWrrI=; b=pYOsI9aMbmi7ZZ
	IAAPR9f1uRRxCPjCIOatOhQEp/uActOYj93UZgnVTjRJRQa9379nUVdVe9TlzovfF4cyZGcLmeDOS
	Lnqsb+aVRPtu6LCVkPnD4F6FDMPULMYcJscu1LdVpUTRjNbsKNQ3Wo0+e9fhygMShigNLiYT9PyI3
	J8ePmDEUUh8hKN8U5hsTAAznQGMnyRSGFlY4dnx66TkrTpto7wvI1OQM3OYLpLWMdKnpVTsc39rD1
	DEa9taYj3ZfRltHj9TQfjdn/t8hfqJr2TwEG+vXaa4eqr3jpgEQ6RqkAZovRJZ9NpsiHlgI+o7zjD
	595K02S4SaQQtMpOIS7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSyt3-0004sk-Sj; Tue, 21 May 2019 07:08:37 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSyrZ-0002tf-CX
 for linux-mtd@lists.infradead.org; Tue, 21 May 2019 07:07:13 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hSyrH-0006cY-Hi; Tue, 21 May 2019 09:06:47 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1hSyrG-0001bF-5P; Tue, 21 May 2019 09:06:46 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v4 00/14] Implement exec_op for GPMI nand driver
Date: Tue, 21 May 2019 09:06:29 +0200
Message-Id: <20190521070643.6244-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_000706_216678_56E8C53B 
X-CRM114-Status: GOOD (  17.45  )
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
Cc: kernel@pengutronix.de, Richard Weinberger <richard@nod.at>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Han Xu <han.xu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

When rebasing on v5.2-rc1 I observe this backtrace:

[   10.789761] WARNING: CPU: 0 PID: 1 at /ptx/work/WORK_OOGHO/sha/backup/linux/linux/drivers/mtd/nand/raw/internals.h:
114 nand_reset_op+0x194/0x1c4
[   10.803137] Modules linked in:
[   10.806441] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.2.0-rc1-00014-g793f23e5adb0-dirty #676
[   10.815297] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[   10.822054] [<c0112928>] (unwind_backtrace) from [<c010d140>] (show_stack+0x10/0x14)
[   10.830054] [<c010d140>] (show_stack) from [<c0bd65cc>] (dump_stack+0xd8/0x110)
[   10.837609] [<c0bd65cc>] (dump_stack) from [<c0127148>] (__warn+0xe0/0x10c)
[   10.844791] [<c0127148>] (__warn) from [<c0127288>] (warn_slowpath_null+0x3c/0x48)
[   10.852604] [<c0127288>] (warn_slowpath_null) from [<c070be50>] (nand_reset_op+0x194/0x1c4)
[   10.861207] [<c070be50>] (nand_reset_op) from [<c070db44>] (nand_reset+0x58/0xb4)
[   10.868924] [<c070db44>] (nand_reset) from [<c070f454>] (nand_scan_with_ids+0x152c/0x1624)
[   10.877444] [<c070f454>] (nand_scan_with_ids) from [<c071a8a8>] (gpmi_nand_probe+0x2f8/0x6ac)
[   10.886235] [<c071a8a8>] (gpmi_nand_probe) from [<c067c2cc>] (platform_drv_probe+0x48/0x98)
[   10.894844] [<c067c2cc>] (platform_drv_probe) from [<c067a15c>] (really_probe+0xec/0x2c8)
[   10.903272] [<c067a15c>] (really_probe) from [<c067a494>] (driver_probe_device+0x5c/0x168)
[   10.911781] [<c067a494>] (driver_probe_device) from [<c067a748>] (device_driver_attach+0x58/0x60)
[   10.920909] [<c067a748>] (device_driver_attach) from [<c067a7d4>] (__driver_attach+0x84/0xc0)
[   10.929684] [<c067a7d4>] (__driver_attach) from [<c06785dc>] (bus_for_each_dev+0x70/0xb4)
[   10.938107] [<c06785dc>] (bus_for_each_dev) from [<c06795fc>] (bus_add_driver+0x154/0x1e0)
[   10.946615] [<c06795fc>] (bus_add_driver) from [<c067b430>] (driver_register+0x74/0x108)
[   10.954952] [<c067b430>] (driver_register) from [<c010317c>] (do_one_initcall+0x80/0x330)
[   10.963385] [<c010317c>] (do_one_initcall) from [<c11011a0>] (kernel_init_freeable+0x2e8/0x3cc)
[   10.972346] [<c11011a0>] (kernel_init_freeable) from [<c0bf0c60>] (kernel_init+0x8/0x114)
[   10.980768] [<c0bf0c60>] (kernel_init) from [<c01010b4>] (ret_from_fork+0x14/0x20)

I also reported this as an answer to the original patch introducing
this backtrace here:

http://lists.infradead.org/pipermail/linux-mtd/2019-May/089600.html

No idea what goes wrong here, but in the hope that it's not the fault of this
series I'm resending this rebased version anyway.

The GPMI nand driver suffers from very poor performance. The read
performance can be roughly doubled with two steps: First is to use
runtime PM for controlling the clocks which prevents the driver from
spending a good amount of time en/disabling the clocks. The second step
is to implement exec_op which allows us to combine the steps necessary
to do a page read into a single DMA transaction.

changes since v3:

- Rebase on v5.2-rc1

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
  mtd: rawnand: gpmi: Drop unnecessary restoring of previous
    chipselection
  mtd: rawnand: gpmi: use runtime PM to manage clocks
  dmaengine: mxs: Drop unnecessary flag
  mtd: rawnand: gpmi: drop unnecessary flag
  dmaengine: mxs: Add header file to be shared with gpmi nand driver
  dmaengine: mxs: rename custom flag
  mtd: rawnand: gpmi: Implement exec_op

 drivers/dma/mxs-dma.c                      |   25 +-
 drivers/mtd/nand/raw/fsmc_nand.c           |   19 +-
 drivers/mtd/nand/raw/gpmi-nand/Makefile    |    1 -
 drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c  |  923 -----------
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 1685 ++++++++++++++------
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h |   64 +-
 drivers/mtd/nand/raw/nand_base.c           |   30 +-
 include/linux/dma/mxs-dma.h                |   24 +
 include/linux/mtd/rawnand.h                |   36 +
 9 files changed, 1261 insertions(+), 1546 deletions(-)
 create mode 100644 include/linux/dma/mxs-dma.h

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
