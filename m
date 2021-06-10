Return-Path: <SRS0=9fF3=LE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA95CC47094
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 13:50:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 946A66109E
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 13:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 946A66109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6yGHQuuQLe3ox8NTJ12cpEOp7Qad/0/egVXs7MDBzls=; b=QFkqtMFp0KV1Yf
	7sE4ZMvPOfsZs9clNZ3Je+ypdqN/iy68QBxLTEnMaNFWatRS7LrZMewBtul/XJNFn5TQB7sBP/QEV
	5DI1/zcwXIA+jSk/Y+/CcHHONjuWnnReaV+J5e0TRWDYyjn2up6fusUVrqHVfPiLMPzx5vo2PaSqR
	Ls5uNEjEAR8Wz9qbCTn66oTJUIlSWQqJQS0teY8Lgf9AHNZYlYeVaCajUBnbPyT7W6Zx0Xep15558
	G1yYGzC7/xMGPBz20qSYWX/MrmcoKSX+6cNwiq6424NfcB68CQgMLQOtL9KEfQb488M/OyeBDtdtU
	oIA5W2oTmvyYPKizxxWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrL3h-000yZp-JF; Thu, 10 Jun 2021 13:49:21 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrL3X-000yUF-Au
 for linux-mtd@lists.infradead.org; Thu, 10 Jun 2021 13:49:14 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id A44DC24000B;
 Thu, 10 Jun 2021 13:49:06 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, ryan.barnett@collins.com,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/5] AM335x large page support
Date: Thu, 10 Jun 2021 15:49:01 +0200
Message-Id: <20210610134906.3503303-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_064911_588194_2A179314 
X-CRM114-Status: UNSURE (   6.80  )
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

The OMAP ELM is limited by the number of ECC chunks that it can process
in one go. Until now, we assumed that this was the maximum flash page
size supported by this engine, but with a small code addition we can
make it generic to fit any page size.

Miquel Raynal (5):
  mtd: rawnand: omap: Aggregate the HW configuration of the ELM
  mtd: rawnand: omap: Rename a macro
  mtd: rawnand: omap: Check return values
  mtd: rawnand: omap: Various style fixes
  mtd: rawnand: omap: Add larger page NAND chips support

 drivers/mtd/nand/raw/omap2.c    | 233 ++++++++++++++++++++------------
 drivers/mtd/nand/raw/omap_elm.c |   2 +-
 2 files changed, 144 insertions(+), 91 deletions(-)

-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
