Return-Path: <SRS0=GuhJ=7W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D80FFC433E2
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jun 2020 12:47:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A8B520853
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jun 2020 12:47:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HLlxs/Mg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WFGsSysa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A8B520853
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gX1tksl0CHDO1LH8AKSWustbp65haTmzmOfeovkSLmI=; b=HLlxs/MgHj/5Mx
	kEelHH0nXERnJCy06bAqiIY2L7ad+1O5eee2J5036/EGItfByouTPYDwsbCYJCw2xCQtCvqSkEE8+
	prErGjC7VOQBoKv3zQBgjNUzoMhWy3d0x6A/amyF3vbiu2Ak/HfCeuYIKsvnGia6uOyX7ALdqvWsm
	3HAAInuWYJ2vrGme6R/FYX9mgpoBUXgxg2LgsXim0Ls4Zyi52mkLvGwIDfILBuyM2q+D69/ff1rKi
	wgwBv/z5k0l0Y0w9i2GIO07eEzcRz6biBfSGvcS8WxthbCYl/5Q1q9kVz1WlKfVRTdrrejigJh02H
	9QP9hw3yimB2YmrlfFDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jidey-0001m8-Qm; Tue, 09 Jun 2020 12:47:21 +0000
Received: from perceval.ideasonboard.com
 ([2001:4b98:dc2:55:216:3eff:fef7:d647])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jideD-00010y-IT
 for linux-mtd@lists.infradead.org; Tue, 09 Jun 2020 12:46:34 +0000
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net
 [86.31.129.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D4B21314;
 Tue,  9 Jun 2020 14:46:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1591706784;
 bh=k2d6Fgi2DgTc07BY1d7t3Uj5hqRkZW7TQacEh7wmTzg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WFGsSysaYs+5unqI2BUTf63py99p8e6AsjzRDMPr/wx2ZOkReZbwRY72uyNfMcphz
 C5o/B9a1Gl/4fq7clChpv0yA0dkgMyCFVsiUfhNlzSB2skBccLhn0BOnanRGLgBB9B
 GMDi8Czfb+rWvc2bfNBYWfEib1hdQn3Vri9kHj9Y=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 04/17] drivers: mtd: nand: raw: Fix trivial spelling
Date: Tue,  9 Jun 2020 13:45:57 +0100
Message-Id: <20200609124610.3445662-5-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_054633_757678_FE7394BC 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
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
Cc: Wenwen Wang <wenwen@cs.uga.edu>, Jiri Kosina <trivial@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Richard Weinberger <richard@nod.at>, open list <linux-kernel@vger.kernel.org>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "open list:NAND FLASH SUBSYSTEM" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The word 'descriptor' is misspelled throughout the tree.

Fix it up accordingly:
    decriptors -> descriptors

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/mtd/nand/raw/mxc_nand.c | 2 +-
 drivers/mtd/nand/raw/nand_bbt.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index 59554c187e01..81659c09770a 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1432,7 +1432,7 @@ static int mxc_nand_get_features(struct nand_chip *chip, int addr,
 }
 
 /*
- * The generic flash bbt decriptors overlap with our ecc
+ * The generic flash bbt descriptors overlap with our ecc
  * hardware, so define some i.MX specific ones.
  */
 static uint8_t bbt_pattern[] = { 'B', 'b', 't', '0' };
diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index 96045d60471e..344a24fd2ca8 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -1226,7 +1226,7 @@ static int nand_scan_bbt(struct nand_chip *this, struct nand_bbt_descr *bd)
 		return -ENOMEM;
 
 	/*
-	 * If no primary table decriptor is given, scan the device to build a
+	 * If no primary table descriptor is given, scan the device to build a
 	 * memory based bad block table.
 	 */
 	if (!td) {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
