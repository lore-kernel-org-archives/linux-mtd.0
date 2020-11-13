Return-Path: <SRS0=uMxP=ET=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF39C388F7
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:41:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E14702078D
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:41:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mVFM1d/9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E14702078D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FmRMKXfqjTucFil9km3OVnVbkPfrqMDZRb3T6rr1LD4=; b=mVFM1d/9juSwMrEHvmm1WoL1qx
	yqexkKa6lRnChVicIq3mIjrcc2eB8U2mqP5b+xopLC0p57EMI8sNBusf/HHnElg9kALr0hcxeKMDI
	IT9nFbhYwqKhMQF5vMc7zhRgyJHOzHRK8zPxbYE448GsVfw3k8bZulElnfAYPENE2Hn2FOppac86A
	Bh9JCu8DCPlUhZEcJ1SbPOb5BuWrgklc9ZRGRuIVdTzA5gGwrMMr3qxuqUk284fRSX8FtHyQ40+IA
	0yCfOlN9rVulPftUQ1skTjvCDNApucczapPoFJsbswsBRPYhbqGSERsLlHnM+C/liqAuBQ5J/sqsz
	0K7ks/bg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdYO8-0002bt-6r; Fri, 13 Nov 2020 12:41:12 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdYNk-0002QZ-Gn
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2020 12:40:56 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 37A59C0003;
 Fri, 13 Nov 2020 12:40:46 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: rawnand: davinci: Do not use extra dereferencing
Date: Fri, 13 Nov 2020 13:40:45 +0100
Message-Id: <20201113124045.32743-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_074048_830300_EE409000 
X-CRM114-Status: GOOD (  13.35  )
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

When the nand_chip structure is already available, there is no need to
dereference it through the info pointer. Use the chip pointer directly
in this case.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/davinci_nand.c | 38 ++++++++++++++---------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index f8c36d19ab47..118da9944e3b 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -586,10 +586,10 @@ static int davinci_nand_attach_chip(struct nand_chip *chip)
 		return PTR_ERR(pdata);
 
 	/* Use board-specific ECC config */
-	info->chip.ecc.engine_type = pdata->engine_type;
-	info->chip.ecc.placement = pdata->ecc_placement;
+	chip->ecc.engine_type = pdata->engine_type;
+	chip->ecc.placement = pdata->ecc_placement;
 
-	switch (info->chip.ecc.engine_type) {
+	switch (chip->ecc.engine_type) {
 	case NAND_ECC_ENGINE_TYPE_NONE:
 		pdata->ecc_bits = 0;
 		break;
@@ -601,7 +601,7 @@ static int davinci_nand_attach_chip(struct nand_chip *chip)
 		 * NAND_ECC_ALGO_HAMMING to avoid adding an extra ->ecc_algo
 		 * field to davinci_nand_pdata.
 		 */
-		info->chip.ecc.algo = NAND_ECC_ALGO_HAMMING;
+		chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
 		break;
 	case NAND_ECC_ENGINE_TYPE_ON_HOST:
 		if (pdata->ecc_bits == 4) {
@@ -628,12 +628,12 @@ static int davinci_nand_attach_chip(struct nand_chip *chip)
 			if (ret == -EBUSY)
 				return ret;
 
-			info->chip.ecc.calculate = nand_davinci_calculate_4bit;
-			info->chip.ecc.correct = nand_davinci_correct_4bit;
-			info->chip.ecc.hwctl = nand_davinci_hwctl_4bit;
-			info->chip.ecc.bytes = 10;
-			info->chip.ecc.options = NAND_ECC_GENERIC_ERASED_CHECK;
-			info->chip.ecc.algo = NAND_ECC_ALGO_BCH;
+			chip->ecc.calculate = nand_davinci_calculate_4bit;
+			chip->ecc.correct = nand_davinci_correct_4bit;
+			chip->ecc.hwctl = nand_davinci_hwctl_4bit;
+			chip->ecc.bytes = 10;
+			chip->ecc.options = NAND_ECC_GENERIC_ERASED_CHECK;
+			chip->ecc.algo = NAND_ECC_ALGO_BCH;
 
 			/*
 			 * Update ECC layout if needed ... for 1-bit HW ECC, the
@@ -651,20 +651,20 @@ static int davinci_nand_attach_chip(struct nand_chip *chip)
 			} else if (chunks == 4 || chunks == 8) {
 				mtd_set_ooblayout(mtd,
 						  nand_get_large_page_ooblayout());
-				info->chip.ecc.read_page = nand_davinci_read_page_hwecc_oob_first;
+				chip->ecc.read_page = nand_davinci_read_page_hwecc_oob_first;
 			} else {
 				return -EIO;
 			}
 		} else {
 			/* 1bit ecc hamming */
-			info->chip.ecc.calculate = nand_davinci_calculate_1bit;
-			info->chip.ecc.correct = nand_davinci_correct_1bit;
-			info->chip.ecc.hwctl = nand_davinci_hwctl_1bit;
-			info->chip.ecc.bytes = 3;
-			info->chip.ecc.algo = NAND_ECC_ALGO_HAMMING;
+			chip->ecc.calculate = nand_davinci_calculate_1bit;
+			chip->ecc.correct = nand_davinci_correct_1bit;
+			chip->ecc.hwctl = nand_davinci_hwctl_1bit;
+			chip->ecc.bytes = 3;
+			chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
 		}
-		info->chip.ecc.size = 512;
-		info->chip.ecc.strength = pdata->ecc_bits;
+		chip->ecc.size = 512;
+		chip->ecc.strength = pdata->ecc_bits;
 		break;
 	default:
 		return -EINVAL;
@@ -899,7 +899,7 @@ static int nand_davinci_remove(struct platform_device *pdev)
 	int ret;
 
 	spin_lock_irq(&davinci_nand_lock);
-	if (info->chip.ecc.placement == NAND_ECC_PLACEMENT_INTERLEAVED)
+	if (chip->ecc.placement == NAND_ECC_PLACEMENT_INTERLEAVED)
 		ecc4_busy = false;
 	spin_unlock_irq(&davinci_nand_lock);
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
