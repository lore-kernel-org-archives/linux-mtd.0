Return-Path: <SRS0=Ie18=GH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A0FAC433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 09:31:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 091F521D79
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 09:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 091F521D79
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cQaZEPfaIlzOUpzoNMOdferWP6bb6ssQcOdijhoN7wM=; b=0B/VoYi/Pz5l03aBA3tQEOJOQC
	Fld5/oo39rYn45xcGyglwJJysuCc8QvIgnsX39rG5ZqjgXfCYHG5safMn1qSFFHMorPEXU1rKws7Y
	UjeqyffJ/O64qnxFcupAOgT29OWoLjh+OmDC0fS5x/R2dp5KXy5WvIHrl/5dyMbcuSLeoqQTDT80T
	c4VBMP69pitSRr+i6LI6S7lKdqKpgNVfvnV1LsG8nb3IQgLMyM/QhgDR/tAe2bddwiL+h73ll/hze
	zNbOFDmTFp+RJb8lnddFH03oP+OPUX17iJEWooXudXI+cpVfysDIrwh0q7s+41bjThAy+aAaps+vc
	sDjXq+8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwMCf-00071f-Gh; Mon, 04 Jan 2021 09:31:05 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwMCc-00070H-7R
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2021 09:31:03 +0000
X-Originating-IP: 90.89.98.255
Received: from localhost.localdomain
 (lfbn-tou-1-1535-bdcst.w90-89.abo.wanadoo.fr [90.89.98.255])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 9C0981BF20E;
 Mon,  4 Jan 2021 09:30:58 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: rawnand: nandsim: Fix the logic when selecting Hamming
 soft ECC engine
Date: Mon,  4 Jan 2021 10:30:57 +0100
Message-Id: <20210104093057.31178-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_043102_399861_2D206E1C 
X-CRM114-Status: GOOD (  10.64  )
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
Cc: kernel test robot <oliver.sang@intel.com>, stable@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

I have been fooled by the logic picking the right ECC engine which is
spread across two functions: *init_module() and *_attach(). I thought
this driver was not impacted by the recent changes around the ECC
engines DT parsing logic but in fact it is.

Reported-by: kernel test robot <oliver.sang@intel.com>
Fixes: d7157ff49a5b ("mtd: rawnand: Use the ECC framework user input parsing bits")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nandsim.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index f2b9250c0ea8..0750121ac371 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -2210,6 +2210,9 @@ static int ns_attach_chip(struct nand_chip *chip)
 {
 	unsigned int eccsteps, eccbytes;
 
+	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
+	chip->ecc.algo = bch ? NAND_ECC_ALGO_BCH : NAND_ECC_ALGO_HAMMING;
+
 	if (!bch)
 		return 0;
 
@@ -2233,8 +2236,6 @@ static int ns_attach_chip(struct nand_chip *chip)
 		return -EINVAL;
 	}
 
-	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
-	chip->ecc.algo = NAND_ECC_ALGO_BCH;
 	chip->ecc.size = 512;
 	chip->ecc.strength = bch;
 	chip->ecc.bytes = eccbytes;
@@ -2273,8 +2274,6 @@ static int __init ns_init_module(void)
 	nsmtd       = nand_to_mtd(chip);
 	nand_set_controller_data(chip, (void *)ns);
 
-	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
-	chip->ecc.algo   = NAND_ECC_ALGO_HAMMING;
 	/* The NAND_SKIP_BBTSCAN option is necessary for 'overridesize' */
 	/* and 'badblocks' parameters to work */
 	chip->options   |= NAND_SKIP_BBTSCAN;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
