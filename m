Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB46CC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 16:53:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67E3A60ED7
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 16:53:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67E3A60ED7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JY0OdbzWdjUeFPf1lY8QY8P3KV9b7P/SZQEPwV7ycEE=; b=aiR6ER//lb5Ujx
	grbWcgC+BouYrm3hKQwamZK+veBXLtYBBDVssP1wSVsaU7UeLdhxbADYLTHElc2faGCtcq+nMijwP
	brCzMfjOxBt6Zm4MTC/6yANqecc0tnCx+5qDug6kHMtHxpn/TTfPDusLAsD30XnvnThYZ7tc38efF
	w4Ws/tR3SofoegKG8YjRWQBnVJ8ZyOYFdjHeIozmrR0W0FOJ+poZF2yL1WSdUcHp7GylRwInux3jo
	4SF6QQ4fBohMbyQChQJ5oSOCxPH+PGgCrLSRBQZBKbuQVBdVbgfXBf2KthqvqcUHhPuhd7vtXppxy
	xHZUtGoCu/R9fklhZXLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYt7J-003bv1-RP; Fri, 08 Oct 2021 16:53:05 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYsrV-003XSo-Vu
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 16:36:47 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 56175FF80D;
 Fri,  8 Oct 2021 16:36:41 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc: <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2] mtd: rawnand: arasan: Prevent an unsupported configuration
Date: Fri,  8 Oct 2021 18:36:40 +0200
Message-Id: <20211008163640.1753821-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_093646_225028_DF99A377 
X-CRM114-Status: GOOD (  13.42  )
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

Under the following conditions:
* after rounding up by 4 the number of bytes to transfer (this is
  related to the controller's internal constraints),
* if this (rounded) amount of data is situated beyond the end of the
  device,
* and only in NV-DDR mode,
the Arasan NAND controller timeouts.

This currently can happen in a particular helper used when picking
software ECC algorithms. Let's prevent this situation by refusing to use
the NV-DDR interface with software engines.

Fixes: 4edde6031458 ("mtd: rawnand: arasan: Support NV-DDR interface")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Changes in v2:
As v1 was too invasive Boris suggested to adopt a much simpler approach:
let's just avoid the situation. That's what I am doing here.

 drivers/mtd/nand/raw/arasan-nand-controller.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 9cbcc698c64d..53bd10738418 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -973,6 +973,21 @@ static int anfc_setup_interface(struct nand_chip *chip, int target,
 		nvddr = nand_get_nvddr_timings(conf);
 		if (IS_ERR(nvddr))
 			return PTR_ERR(nvddr);
+
+		/*
+		 * The controller only supports data payload requests which are
+		 * a multiple of 4. In practice, most data accesses are 4-byte
+		 * aligned and this is not an issue. However, rounding up will
+		 * simply be refused by the controller if we reached the end of
+		 * the device *and* we are using the NV-DDR interface(!). In
+		 * this situation, unaligned data requests ending at the device
+		 * boundary will confuse the controller and cannot be performed.
+		 *
+		 * This is something that happens in nand_read_subpage() when
+		 * selecting software ECC support and must be avoided.
+		 */
+		if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_SOFT)
+			return -ENOTSUPP;
 	} else {
 		sdr = nand_get_sdr_timings(conf);
 		if (IS_ERR(sdr))
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
