Return-Path: <SRS0=ZJz0=G6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43CF9C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 20:31:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE7D460C3D
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 20:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE7D460C3D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pEBhSop67/kNQJ1+pL1BqdW2dAMpekmaOIiu1I5zIh4=; b=ehRlgk26+JoQvBfcAN1COL85e
	WuREjDFo1Mrj4QDxQ8dvHg1O9vzFOY3d8brXc6cRQNCFnqZxKGWk7WY+ZDF55ANQ3A9gc/tR3eSCA
	bWcrjo/39kPTwoOCA/RClLjOzsiQxEMAI25pH9eMx6UkllF54Lg4cZL3z9B4aQP8Oi+rrvNRt8X5L
	0npEzromwRpQG/G1I3aCiIUI2G7onmYEm0+pOB5jNlranthszqYtwJH2IvYk0pzcz5Xugl2LlePZP
	Z2df+rFxJVUFJVfGm0fP2ZrTM15yxv/pzuete5DwfrnT7pjpz+YsbUAlFtkhSljEhNLfO6RNbzAgR
	+qwYCLBHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4rSk-0002DG-Vn; Wed, 27 Jan 2021 20:30:51 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4rSR-00028G-3e
 for linux-mtd@lists.infradead.org; Wed, 27 Jan 2021 20:30:32 +0000
X-Originating-IP: 86.210.203.150
Received: from localhost.localdomain
 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr [86.210.203.150])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E4D741BF213;
 Wed, 27 Jan 2021 20:30:28 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 7/9] mtd: rawnand: omap: Use ECC information from the
 generic structures
Date: Wed, 27 Jan 2021 21:30:18 +0100
Message-Id: <20210127203020.9574-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210127203020.9574-1-miquel.raynal@bootlin.com>
References: <20210127203020.9574-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_153031_677493_23AE632C 
X-CRM114-Status: GOOD (  13.03  )
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
 Adam Ford <aford173@gmail.com>, ladis@triops.cz,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

As part of a previous fix, we imported the BCH internal structure in
order to get information about the BCH engine configuration.

It is best not to access private structure so instead, a small rework
has been done to export more information from the ECC engines. Now,
let's use these.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/omap2.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 2c3e65cb68f3..c75e7a0b101f 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -1868,18 +1868,19 @@ static int omap_sw_ooblayout_ecc(struct mtd_info *mtd, int section,
 				 struct mtd_oob_region *oobregion)
 {
 	struct nand_device *nand = mtd_to_nanddev(mtd);
-	const struct nand_ecc_sw_bch_conf *engine_conf = nand->ecc.ctx.priv;
+	unsigned int nsteps = nanddev_get_ecc_nsteps(nand);
+	unsigned int ecc_bytes = nanddev_get_ecc_bytes_per_step(nand);
 	int off = BADBLOCK_MARKER_LENGTH;
 
-	if (section >= engine_conf->nsteps)
+	if (section >= nsteps)
 		return -ERANGE;
 
 	/*
 	 * When SW correction is employed, one OMAP specific marker byte is
 	 * reserved after each ECC step.
 	 */
-	oobregion->offset = off + (section * (engine_conf->code_size + 1));
-	oobregion->length = engine_conf->code_size;
+	oobregion->offset = off + (section * (ecc_bytes + 1));
+	oobregion->length = ecc_bytes;
 
 	return 0;
 }
@@ -1888,7 +1889,8 @@ static int omap_sw_ooblayout_free(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *oobregion)
 {
 	struct nand_device *nand = mtd_to_nanddev(mtd);
-	const struct nand_ecc_sw_bch_conf *engine_conf = nand->ecc.ctx.priv;
+	unsigned int nsteps = nanddev_get_ecc_nsteps(nand);
+	unsigned int ecc_bytes = nanddev_get_ecc_bytes_per_step(nand);
 	int off = BADBLOCK_MARKER_LENGTH;
 
 	if (section)
@@ -1898,7 +1900,7 @@ static int omap_sw_ooblayout_free(struct mtd_info *mtd, int section,
 	 * When SW correction is employed, one OMAP specific marker byte is
 	 * reserved after each ECC step.
 	 */
-	off += ((engine_conf->code_size + 1) * engine_conf->nsteps);
+	off += ((ecc_bytes + 1) * nsteps);
 	if (off >= mtd->oobsize)
 		return -ERANGE;
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
