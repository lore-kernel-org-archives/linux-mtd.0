Return-Path: <SRS0=uMxP=ET=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DB0C4742C
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:35:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1279E2224B
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:35:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VTFE8+BM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1279E2224B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j38dkAkCqtrCTq/18YuPdcFBj5Q7zy5WJAFt4T4+gZY=; b=VTFE8+BMVZY+LRr+O/Nc7KsK9
	5iBmyA0GKoGfEyUQf8/h36oZQLe3mvdmsDvPHZ0+WtTPdlMfL2zQy5vVNIkElPMLgF30qC0uDUQDZ
	7A0TrMedTxvy1tnRsVHkErWpWvsW4DxFvmpb5pbbJKcz1ADS6uxEiNvNLQaLqT0DkZNgyA5EUFKEH
	YPpbsrGlezdEQrXfBpQBrVyIAl2yCIFOL9KH7ePohM4MVQYl7eewxotZCpmSPnSdhssiSBqR6TlKN
	dx/+GfMvPJqcdLD5LpbKwKGjtq1/e5vdOcKChF9kI9f55JPQFWTXPgdKkXoGNoycN0aury9Nsb4vj
	uuNCKE4pA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdYI4-00088g-JZ; Fri, 13 Nov 2020 12:34:56 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdYHf-0007zh-UX
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2020 12:34:33 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 62884C000F;
 Fri, 13 Nov 2020 12:34:30 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 06/19] mtd: rawnand: davinci: Move the ECC initialization to
 ->attach_chip()
Date: Fri, 13 Nov 2020 13:34:11 +0100
Message-Id: <20201113123424.32233-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201113123424.32233-1-miquel.raynal@bootlin.com>
References: <20201113123424.32233-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_073432_099837_E84F7508 
X-CRM114-Status: GOOD (  12.49  )
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
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The probe function is only supposed to initialize the controller
hardware but not the ECC engine. Indeed, we don't know anything about
the NAND chip(s) at this stage. Let's move the logic initializing the
ECC engine, even pretty simple, to the ->attach_chip() hook which gets
called during nand_scan() routine, after the NAND chip discovery. As
the previously mentioned logic is supposed to parse the DT for us, it
is likely that the chip->ecc.* entries be overwritten. So let's avoid
this by moving these lines to ->attach_chip().

Fixes: d7157ff49a5b ("mtd: rawnand: Use the ECC framework user input parsing bits")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/mtd/nand/raw/davinci_nand.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 427f320fb79b..f8c36d19ab47 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -585,6 +585,10 @@ static int davinci_nand_attach_chip(struct nand_chip *chip)
 	if (IS_ERR(pdata))
 		return PTR_ERR(pdata);
 
+	/* Use board-specific ECC config */
+	info->chip.ecc.engine_type = pdata->engine_type;
+	info->chip.ecc.placement = pdata->ecc_placement;
+
 	switch (info->chip.ecc.engine_type) {
 	case NAND_ECC_ENGINE_TYPE_NONE:
 		pdata->ecc_bits = 0;
@@ -850,10 +854,6 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	info->mask_ale		= pdata->mask_ale ? : MASK_ALE;
 	info->mask_cle		= pdata->mask_cle ? : MASK_CLE;
 
-	/* Use board-specific ECC config */
-	info->chip.ecc.engine_type = pdata->engine_type;
-	info->chip.ecc.placement = pdata->ecc_placement;
-
 	spin_lock_irq(&davinci_nand_lock);
 
 	/* put CSxNAND into NAND mode */
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
