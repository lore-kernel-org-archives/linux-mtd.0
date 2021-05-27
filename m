Return-Path: <SRS0=eog2=KW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A103C4707F
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 08:44:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFB1F61028
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 08:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFB1F61028
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M11SXDP/skh3bVAd81oO6yuUm9n/5iaM3K/7+vfXFVM=; b=qEkX9yU3DojVsR
	HyFpiY7o7osaIneKPRZFKKE1IPCF5qXAtYdXf1TH2zUv0fIlpiwn8WE2ei2QRxR+rZgDXcV54NExE
	TuLG6LJ57yhTVjvvvLva6uCseLTDLhi+sYLM5+OelF0aSJ+B0HT271nlKRGAl7E+h4BSbsv5Zjx8/
	OcJgwdGt/u9b2HokTztvhYJjsUKQRYiyoPMt0AiCeBCGvnJ4dCfC9O3balmr7tvKQsty/EuLIZER7
	iTeOmrWgj+b2bvtAkF2/tsGk3hcz+L8pHlqdX4Jy2S6TT+cAPSM0R4+g5CfA8eEjpNwD4FaskLxUY
	kcH/aObooYW+g+KH/QQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmBcT-003yM9-4f; Thu, 27 May 2021 08:43:57 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmBcP-003yIZ-9n
 for linux-mtd@lists.infradead.org; Thu, 27 May 2021 08:43:55 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id ACDDA100005;
 Thu, 27 May 2021 08:43:45 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>, YouChing Lin <ycllin@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: spinand: Fix double counting of ECC stats
Date: Thu, 27 May 2021 10:43:45 +0200
Message-Id: <20210527084345.208215-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_014353_500259_5F425872 
X-CRM114-Status: GOOD (  18.10  )
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

In the raw NAND world, ECC engines increment ecc_stats and the final
caller is responsible for returning -EBADMSG if the verification
failed.

In the SPI-NAND world it was a bit different until now because there was
only one possible ECC engine: the on-die one. Indeed, the
spinand_mtd_read() call was incrementing the ecc_stats counters
depending on the outcome of spinand_check_ecc_status() directly.

So now let's split the logic like this:
- spinand_check_ecc_status() is specific to the SPI-NAND on-die engine
  and is kept very simple: it just returns the ECC status (bonus point:
  the content of this helper can be overloaded).
- spinand_ondie_ecc_finish_io_req() is the caller of
  spinand_check_ecc_status() and will increment the counters and
  eventually return -EBADMSG.
- spinand_mtd_read() is not tied to the on-die ECC implementation and
  should be able to handle results coming from other ECC engines: it has
  the responsibility of returning the maximum number of bitflips which
  happened during the entire operation as this is the only helper that
  is aware that several pages may be read in a row.

Fixes: 945845b54c9c ("mtd: spinand: Instantiate a SPI-NAND on-die ECC engine")
Reported-by: YouChing Lin <ycllin@mxic.com.tw>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Tested-by: YouChing Lin <ycllin@mxic.com.tw>
---
 drivers/mtd/nand/spi/core.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 17f63f95f4a2..54ae540bc66b 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -290,6 +290,8 @@ static int spinand_ondie_ecc_finish_io_req(struct nand_device *nand,
 {
 	struct spinand_ondie_ecc_conf *engine_conf = nand->ecc.ctx.priv;
 	struct spinand_device *spinand = nand_to_spinand(nand);
+	struct mtd_info *mtd = spinand_to_mtd(spinand);
+	int ret;
 
 	if (req->mode == MTD_OPS_RAW)
 		return 0;
@@ -299,7 +301,13 @@ static int spinand_ondie_ecc_finish_io_req(struct nand_device *nand,
 		return 0;
 
 	/* Finish a page write: check the status, report errors/bitflips */
-	return spinand_check_ecc_status(spinand, engine_conf->status);
+	ret = spinand_check_ecc_status(spinand, engine_conf->status);
+	if (ret == -EBADMSG)
+		mtd->ecc_stats.failed++;
+	else if (ret > 0)
+		mtd->ecc_stats.corrected += ret;
+
+	return ret;
 }
 
 static struct nand_ecc_engine_ops spinand_ondie_ecc_engine_ops = {
@@ -620,13 +628,10 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
 		if (ret < 0 && ret != -EBADMSG)
 			break;
 
-		if (ret == -EBADMSG) {
+		if (ret == -EBADMSG)
 			ecc_failed = true;
-			mtd->ecc_stats.failed++;
-		} else {
-			mtd->ecc_stats.corrected += ret;
+		else
 			max_bitflips = max_t(unsigned int, max_bitflips, ret);
-		}
 
 		ret = 0;
 		ops->retlen += iter.req.datalen;
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
