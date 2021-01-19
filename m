Return-Path: <SRS0=wdd2=GW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B3EEC433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Jan 2021 15:55:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15A18208E4
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Jan 2021 15:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15A18208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hxJm5xe+cqYZuSIeIWjA5yIBNDwq77utF+P9Wz2amgY=; b=Cx4B8wrK9lNobdCGPwVL19P4yD
	u+UZhW9vA85TK21oFAnx+lmp5jt9YnW12k91EKzyElahEZBeLzD4Fitg2SZoWdK4XUH2qtOxZY32F
	pFoAv6312Vn7LRFlGNYaNwxFqtkkTPCmMIkG2h62drkUPsqSJNrEIgd9AP9SHXlyefN1wDCDQe2Ty
	QfAhRlSz9fD2hf4pFy6qRn7W2Qp3alktpoYu5dAS7BkgjDgas8VeKeLipsQnYs738HZnGZt7cqD8f
	bbdbko7Xgl4rRYIP54CYzH+uYQm/flmDhlj3mF4bVQHf9fhcln4bAadgdxzugZslF0o/2gjS1LZvb
	mc5ho9ng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1tLh-0006Ak-47; Tue, 19 Jan 2021 15:55:17 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1tLe-00069v-OH
 for linux-mtd@lists.infradead.org; Tue, 19 Jan 2021 15:55:15 +0000
X-Originating-IP: 86.201.233.230
Received: from localhost.localdomain
 (lfbn-tou-1-151-230.w86-201.abo.wanadoo.fr [86.201.233.230])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 59362C0002;
 Tue, 19 Jan 2021 15:55:12 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: rawnand: omap: Use BCH private fields in the specific
 OOB layout
Date: Tue, 19 Jan 2021 16:55:10 +0100
Message-Id: <20210119155510.5655-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_105514_967194_FDDF5153 
X-CRM114-Status: GOOD (  19.55  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Adam Ford <aford173@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The OMAP driver may leverage software BCH logic to locate errors while
using its own hardware to detect the presence of errors. This is
achieved with a "mixed" mode which initializes manually the software
BCH internal logic while providing its own OOB layout.

The issue here comes from the fact that the BCH driver has been
updated to only use generic NAND objects, and no longer depend on raw
NAND structures as it is usable from SPI-NAND as well. However, at the
end of the BCH context initialization, the driver checks the validity
of the OOB layout. At this stage, the raw NAND fields have not been
populated yet while being used by the layout helpers, leading to an
invalid layout.

The chosen solution here is to include the BCH structure definition
and to refer to the BCH fields directly (de-referenced as a const
pointer here) to know as early as possible the number of steps and ECC
bytes which have been chosen.

Note: I don't know which commit exactly triggered the error, but the
entire migration to a generic BCH driver got merged in one go, so this
should not be a problem for stable backports.

Reported-by: Adam Ford <aford173@gmail.com>
Fixes: 80fe603160a4 ("mtd: nand: ecc-bch: Stop using raw NAND structures")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/omap2.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index fbb9955f2467..2c3e65cb68f3 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -15,6 +15,7 @@
 #include <linux/jiffies.h>
 #include <linux/sched.h>
 #include <linux/mtd/mtd.h>
+#include <linux/mtd/nand-ecc-sw-bch.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/omap-dma.h>
@@ -1866,18 +1867,19 @@ static const struct mtd_ooblayout_ops omap_ooblayout_ops = {
 static int omap_sw_ooblayout_ecc(struct mtd_info *mtd, int section,
 				 struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_device *nand = mtd_to_nanddev(mtd);
+	const struct nand_ecc_sw_bch_conf *engine_conf = nand->ecc.ctx.priv;
 	int off = BADBLOCK_MARKER_LENGTH;
 
-	if (section >= chip->ecc.steps)
+	if (section >= engine_conf->nsteps)
 		return -ERANGE;
 
 	/*
 	 * When SW correction is employed, one OMAP specific marker byte is
 	 * reserved after each ECC step.
 	 */
-	oobregion->offset = off + (section * (chip->ecc.bytes + 1));
-	oobregion->length = chip->ecc.bytes;
+	oobregion->offset = off + (section * (engine_conf->code_size + 1));
+	oobregion->length = engine_conf->code_size;
 
 	return 0;
 }
@@ -1885,7 +1887,8 @@ static int omap_sw_ooblayout_ecc(struct mtd_info *mtd, int section,
 static int omap_sw_ooblayout_free(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *oobregion)
 {
-	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_device *nand = mtd_to_nanddev(mtd);
+	const struct nand_ecc_sw_bch_conf *engine_conf = nand->ecc.ctx.priv;
 	int off = BADBLOCK_MARKER_LENGTH;
 
 	if (section)
@@ -1895,7 +1898,7 @@ static int omap_sw_ooblayout_free(struct mtd_info *mtd, int section,
 	 * When SW correction is employed, one OMAP specific marker byte is
 	 * reserved after each ECC step.
 	 */
-	off += ((chip->ecc.bytes + 1) * chip->ecc.steps);
+	off += ((engine_conf->code_size + 1) * engine_conf->nsteps);
 	if (off >= mtd->oobsize)
 		return -ERANGE;
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
