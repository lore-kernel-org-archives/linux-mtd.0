Return-Path: <SRS0=01Ca=NV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97BFDC432BE
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Aug 2021 13:03:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D657E60E77
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Aug 2021 13:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D657E60E77
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=fris.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aGpNvmHJSxcW7owsptJlUf53qMRbs8WOk5I+DvHCy48=; b=q0agEU8NIXF14k
	kEAMyDKtcWONlW6RqntBNJh4YtLlww6Y6FT7kVe4Js7L47BIYpYfHE1Z0PbzUrH1FrMRrgU2LgRo/
	gxdquqsCeVww3q2bbvhlkpLuZPv6ZO35Tx9Ep/bybgz7A27Y0FGKZWjBQhA00IBfAAsk7LFsqkZJA
	+CrrqbXvtFgfIr8TGr/akF2UouysAs9Hs2XG9H+cDLUuwjI+SV3kzTN0T5uMbS84Hvzy4KRDsiVtP
	eJPYSxPdwVsHQralNVACvEp4HmocW5j+Gr3SqjcLV9mW4rWjJN0wYFh4neSTzK0U4uKmH21rSRVm7
	Gg1dufjp9FC4aoSJy4gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKgvi-00HHZx-NA; Mon, 30 Aug 2021 13:02:26 +0000
Received: from mail.fris.de ([116.203.77.234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKgvc-00HHZN-UX
 for linux-mtd@lists.infradead.org; Mon, 30 Aug 2021 13:02:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6AAF1BFAE8; Mon, 30 Aug 2021 15:02:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
 t=1630328536; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=J8EqyEThj2vYt1gLlGWAPjy92OKvfcflpYFCLx+6AN0=;
 b=0X5h4VsLaT3N7aHJkLXg5ZWUaii9HEHqc2H6UtAQqPuU/nWkmjqDalkyMY/kG3sjLyGIjz
 +Lv9BFISoFwHKJ3FYY5fsJmDjsg0Vnm8ddkYxnbUHLMIjlPj9nCnNFmsBdOY+dVHpAGYnc
 dxx+1ZWQD1Eq/JGXw6Brhm9F2chkjMdHfRFObkRfowKpDp6L6jmX5cOWT5Yu317iFtj8BX
 PmoRVoPWtoQdwwLjujQ0uHMGX/K1BqjUtMnVS06NGiydYbyDCEGCP2CnXsJysnKgAOI82j
 JCLzKNhC/QI9AJLkvaCV/84KV+KqrBPg/avn2yJgyfSwqmCA59lEctL0YZIOXA==
From: Frieder Schrempf <frieder@fris.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>, stable@vger.kernel.org,
 voice INTER connect GmbH <developer@voiceinterconnect.de>,
 Alexander Lobakin <alobakin@pm.me>, Felix Fietkau <nbd@nbd.name>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, YouChing Lin <ycllin@mxic.com.tw>
Subject: [PATCH v2 5.10.x] mtd: spinand: Fix incorrect parameters for on-die
 ECC
Date: Mon, 30 Aug 2021 15:02:10 +0200
Message-Id: <20210830130211.445728-1-frieder@fris.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_060221_342090_2E9CCA63 
X-CRM114-Status: GOOD (  12.25  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The new generic NAND ECC framework stores the configuration and
requirements in separate places since commit 93ef92f6f422 ("mtd: nand: Use
the new generic ECC object"). In 5.10.x The SPI NAND layer still uses only
the requirements to track the ECC properties. This mismatch leads to
values of zero being used for ECC strength and step_size in the SPI NAND
layer wherever nanddev_get_ecc_conf() is used and therefore breaks the SPI
NAND on-die ECC support in 5.10.x.

By using nanddev_get_ecc_requirements() instead of nanddev_get_ecc_conf()
for SPI NAND, we make sure that the correct parameters for the detected
chip are used. In later versions (5.11.x) this is fixed anyway with the
implementation of the SPI NAND on-die ECC engine.

Cc: stable@vger.kernel.org # 5.10.x
Reported-by: voice INTER connect GmbH <developer@voiceinterconnect.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v2:
  * Fix checkpatch error/warnings for commit message style
  * Add Miquel's A-b tag
---
 drivers/mtd/nand/spi/core.c     | 6 +++---
 drivers/mtd/nand/spi/macronix.c | 6 +++---
 drivers/mtd/nand/spi/toshiba.c  | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 558d8a14810b..8794a1f6eacd 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -419,7 +419,7 @@ static int spinand_check_ecc_status(struct spinand_device *spinand, u8 status)
 		 * fixed, so let's return the maximum possible value so that
 		 * wear-leveling layers move the data immediately.
 		 */
-		return nanddev_get_ecc_conf(nand)->strength;
+		return nanddev_get_ecc_requirements(nand)->strength;
 
 	case STATUS_ECC_UNCOR_ERROR:
 		return -EBADMSG;
@@ -1090,8 +1090,8 @@ static int spinand_init(struct spinand_device *spinand)
 	mtd->oobavail = ret;
 
 	/* Propagate ECC information to mtd_info */
-	mtd->ecc_strength = nanddev_get_ecc_conf(nand)->strength;
-	mtd->ecc_step_size = nanddev_get_ecc_conf(nand)->step_size;
+	mtd->ecc_strength = nanddev_get_ecc_requirements(nand)->strength;
+	mtd->ecc_step_size = nanddev_get_ecc_requirements(nand)->step_size;
 
 	return 0;
 
diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index 8e801e4c3a00..cd7a9cacc3fb 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -84,11 +84,11 @@ static int mx35lf1ge4ab_ecc_get_status(struct spinand_device *spinand,
 		 * data around if it's not necessary.
 		 */
 		if (mx35lf1ge4ab_get_eccsr(spinand, &eccsr))
-			return nanddev_get_ecc_conf(nand)->strength;
+			return nanddev_get_ecc_requirements(nand)->strength;
 
-		if (WARN_ON(eccsr > nanddev_get_ecc_conf(nand)->strength ||
+		if (WARN_ON(eccsr > nanddev_get_ecc_requirements(nand)->strength ||
 			    !eccsr))
-			return nanddev_get_ecc_conf(nand)->strength;
+			return nanddev_get_ecc_requirements(nand)->strength;
 
 		return eccsr;
 
diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshiba.c
index 21fde2875674..6fe7bd2a94d2 100644
--- a/drivers/mtd/nand/spi/toshiba.c
+++ b/drivers/mtd/nand/spi/toshiba.c
@@ -90,12 +90,12 @@ static int tx58cxgxsxraix_ecc_get_status(struct spinand_device *spinand,
 		 * data around if it's not necessary.
 		 */
 		if (spi_mem_exec_op(spinand->spimem, &op))
-			return nanddev_get_ecc_conf(nand)->strength;
+			return nanddev_get_ecc_requirements(nand)->strength;
 
 		mbf >>= 4;
 
-		if (WARN_ON(mbf > nanddev_get_ecc_conf(nand)->strength || !mbf))
-			return nanddev_get_ecc_conf(nand)->strength;
+		if (WARN_ON(mbf > nanddev_get_ecc_requirements(nand)->strength || !mbf))
+			return nanddev_get_ecc_requirements(nand)->strength;
 
 		return mbf;
 
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
