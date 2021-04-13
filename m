Return-Path: <SRS0=Vrwx=JK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE802C433ED
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 16:21:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D4BA6124B
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 16:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D4BA6124B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zM/TqG81E6y0J9sKKPOzA1tQj4tTfoqA7TJoIeHis3M=; b=I3F2lY2QACg+gQXVBHgyQVdnIE
	22DqV9Tp6H7SPjGZCKPuH1ZzSwmfxokw7T8N2jifHiTvqkRXkcarcrZRuN9e5/aIDNwkNmwt/O2/n
	8CyB2h6vMbvCk49+Tk6QBXK6TuhXVKwbL4SCefTZ+Giikv2nrnvMBryyxLaOhFSeHD461QgbE8K1k
	J2DpEHcbXiZW8gs6NB7Qw0uwIUgm3Hxfx7HF6ZonlP+tfo/t0kST4cN/y/3WA/WlXvVhb73AmzpyB
	ekmvHRgIs4ZsWnaxjDV6CXJOQVzCG1r09Fukj5q1j2Rkz14LCK75sUCCmgyHOQMWM71RImDyn84XX
	KxS/Rm7A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWLls-009lxS-V3; Tue, 13 Apr 2021 16:20:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWLkZ-009lmD-J0
 for linux-mtd@desiato.infradead.org; Tue, 13 Apr 2021 16:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=T3RdeeZCDY+n9TExje9p0PjJqF8SNnT2otLpjtsxLS8=; b=lOnZbPXvDy04ugv/al/zwH+XzU
 S0/FIf4ZGi5Tr42Xdi+sqVPo1tK3XPG0oH/xzYkExeTeJK0TB+QEWUKqJSmdLnjwC8H/gScmSiI1K
 cnEJe2z57M+iNfbhqLqbd7lGtnlmoZpOENyYZKJHh55oKUp+POdwFQ5ODF1B9FBmnTBQ3/kuY88vB
 WktKTJMJd/Quv6APyj8Sk9wWFr9c+Q5d+oilFBlNJ7DyETeD8mH/uxX8WiYyoKTgGRzpRfWQMDcXY
 XmpSFQgxvobdf/I4Yfleu3IoTAZT7SpYDy/dfc8a/rs/hySmhpn8Cx5ac0NzNsGlfKCkszry10N4v
 kpY9yZbw==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWLkV-007AlA-NP
 for linux-mtd@lists.infradead.org; Tue, 13 Apr 2021 16:18:50 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 6FAFAFF804;
 Tue, 13 Apr 2021 16:18:41 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 0/7] Fix use of Hamming helpers
Date: Tue, 13 Apr 2021 18:18:33 +0200
Message-Id: <20210413161840.345208-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_091847_918144_EF104DAE 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

In one of my previous code reorganization I broke several
drivers. Recently spotted by Trevor on the lpc32xx_slc driver, I updated
several other drivers to benefit from this change.

Basically, I did a rename of the software Hamming ECC helpers, creating
this way a proper ECC engine and also rawnand helpers. The problem is,
using the raw NAND helpers from the various raw NAND drivers only works
now if the ECC engine has been properly initialized and the necessary
buffers allocated and pointers initialized. But in most cases of these
cases, the actual engine is a on host hardware ECC engine which lacks
correctness support. Using the bare helpers (which only do the
calculations) on provided buffers is enough. So switch to use these bare
helpers instead of the rawnand_* helpers which currently lead to a NULL
pointer dereference.

Changes since v2:
- Fix all drivers suffering from the same issue.
- Update the Fixes line to point to the real commit which introduce the
  problem.
- Added Trevor's Tested-by tag on the lpc32xx_slc fix.

Miquel Raynal (7):
  mtd: rawnand: cs553x: Fix external use of SW Hamming ECC helper
  mtd: rawnand: fsmc: Fix external use of SW Hamming ECC helper
  mtd: rawnand: lpc32xx_slc: Fix external use of SW Hamming ECC helper
  mtd: rawnand: ndfc: Fix external use of SW Hamming ECC helper
  mtd: rawnand: sharpsl: Fix external use of SW Hamming ECC helper
  mtd: rawnand: tmio: Fix external use of SW Hamming ECC helper
  mtd: rawnand: txx9ndfmc: Fix external use of SW Hamming ECC helper

 drivers/mtd/nand/raw/cs553x_nand.c | 11 ++++++++++-
 drivers/mtd/nand/raw/fsmc_nand.c   | 12 +++++++++++-
 drivers/mtd/nand/raw/lpc32xx_slc.c | 15 ++++++++++++++-
 drivers/mtd/nand/raw/ndfc.c        | 12 +++++++++++-
 drivers/mtd/nand/raw/sharpsl.c     | 12 +++++++++++-
 drivers/mtd/nand/raw/tmio_nand.c   |  8 +++++---
 drivers/mtd/nand/raw/txx9ndfmc.c   |  5 +++--
 7 files changed, 65 insertions(+), 10 deletions(-)

-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
