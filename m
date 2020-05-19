Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66EECC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 07:46:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34203207E8
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 07:46:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KAIaSNoJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34203207E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9O/J+I/L4MMZ2sEWmETPzNBnVYfgn3kCsQMfcbT8A7A=; b=KAIaSNoJkpeiPw
	5r66PQXv5GWd8qn2hmrCnATV5r8PmipEGbyo3dAkAse6EFbO1Uz/jBSMo8QLFTjtTtzDwwbOrUAg2
	Y7Xu7vZmVLhZwOemTm1rS1T5vRrIUrRDBy36O89SJKAsyQyden6LHkjpU7cupPqV3XnO9crRrIz+D
	DjeVyDauNh/6akLSuXdoykSDuwgUQusU3O9TfPEE6MRHq4NAJV+mqzAZ6X5XvvksE5m0w6ijI77Lf
	8jnJTFxSBx8yk+Tbm52Af/2ap3bJQElHLIoPApq/Rtl+soqdPxgJczKkNwYN3wORrg8Z2Fmm/fflr
	nz0e03f6pY1is5lyFVfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jawxX-0007VC-0y; Tue, 19 May 2020 07:46:43 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jawwo-0006q3-Fl
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 07:45:59 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 2CCBF24000C;
 Tue, 19 May 2020 07:45:56 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v5 3/8] mtd: rawnand: Ensure the number of bitflips is
 consistent
Date: Tue, 19 May 2020 09:45:44 +0200
Message-Id: <20200519074549.23673-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200519074549.23673-1-miquel.raynal@bootlin.com>
References: <20200519074549.23673-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_004558_675427_BA825220 
X-CRM114-Status: GOOD (  13.55  )
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
Cc: Michal Simek <monstr@monstr.eu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The main NAND read page function can loop over "page reads" many times
in if the reading reports uncorrectable error(s) and if the chip
supports the read_retry feature.

In this case, the number of bitflips is summarized between
attempts. Fix this by re-initializing the entire mtd_ecc_stats object
each time we retry.

Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 2bef01e21533..65e9b2fa2fc5 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -3288,7 +3288,7 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 	oob_required = oob ? 1 : 0;
 
 	while (1) {
-		unsigned int ecc_failures = mtd->ecc_stats.failed;
+		struct mtd_ecc_stats ecc_stats = mtd->ecc_stats;
 
 		bytes = min(mtd->writesize - col, readlen);
 		aligned = (bytes == mtd->writesize);
@@ -3339,7 +3339,7 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 			 */
 			if (use_bounce_buf) {
 				if (!NAND_HAS_SUBPAGE_READ(chip) && !oob &&
-				    !(mtd->ecc_stats.failed - ecc_failures) &&
+				    !(mtd->ecc_stats.failed - ecc_stats.failed) &&
 				    (ops->mode != MTD_OPS_RAW)) {
 					chip->pagecache.page = realpage;
 					chip->pagecache.bitflips = ret;
@@ -3362,7 +3362,7 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 
 			nand_wait_readrdy(chip);
 
-			if (mtd->ecc_stats.failed - ecc_failures) {
+			if (mtd->ecc_stats.failed - ecc_stats.failed) {
 				if (retry_mode + 1 < chip->read_retries) {
 					retry_mode++;
 					ret = nand_setup_read_retry(chip,
@@ -3370,8 +3370,8 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 					if (ret < 0)
 						break;
 
-					/* Reset failures; retry */
-					mtd->ecc_stats.failed = ecc_failures;
+					/* Reset ecc_stats; retry */
+					mtd->ecc_stats = ecc_stats;
 					goto read_retry;
 				} else {
 					/* No more retry modes; real failure */
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
