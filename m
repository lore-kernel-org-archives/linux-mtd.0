Return-Path: <SRS0=PkFq=XO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 207A7C3A5A6
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 19:52:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E246520678
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 19:52:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fALo4Yjc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E246520678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Us03UzM3KoLeI5yHnWEn/UkpPJZtF15oJVNbymfWvOU=; b=fALo4Yjc2rOXV2
	qNvoiAfwHf+4dHDt3hCK8dwGEdSZI7dkqR7Pc09a8ggf+8ZJpJXLFciuxg8LiGPQ1aFvGA4oHSCZT
	VbiudsM730u+I30PNfDMbyKNZ3Da+FkmwDdVkFO2d5Ntx3Mc2hyqyZ0WgIXgqeyOWQ9OWvhhyXvJs
	dIeHWGj2SVx9yo7HCgJBhsJlnLYP4NwNdf1AxpIbUTB0tA24KgfC3riWAmc04HiOwfyU/USMQp4D+
	8QyvGZKySD9gfEXcpgNh8z9pn+IJ6AipsTcdBi+EHxr+x1xSd6b8CM5N2FJVwCan5eijCf5ZSVx0N
	KKef3rpoL5Ikfm4yL+6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iB2U0-0005OR-EA; Thu, 19 Sep 2019 19:52:52 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iB2Ad-0002dI-J0; Thu, 19 Sep 2019 19:32:53 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 754DD240003;
 Thu, 19 Sep 2019 19:32:47 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v3 30/40] mtd: spinand: Move ECC related definitions earlier
 in the driver
Date: Thu, 19 Sep 2019 21:31:30 +0200
Message-Id: <20190919193141.7865-31-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190919193141.7865-1-miquel.raynal@bootlin.com>
References: <20190919193141.7865-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_123252_091753_C9073317 
X-CRM114-Status: GOOD (  15.34  )
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Julien Su <juliensu@mxic.com.tw>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Prepare the creation of a SPI-NAND on-die ECC engine by gathering the
ECC-related code earlier enough in the core to avoid the need for
forward declarations.

The next step is to actually create that engine by implementing the
generic ECC interface.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c              | 106 +++++++++++------------
 drivers/mtd/nand/spi/on-die-ecc-engine.c |   0
 2 files changed, 53 insertions(+), 53 deletions(-)
 create mode 100644 drivers/mtd/nand/spi/on-die-ecc-engine.c

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 7f6b0adbba26..49b252bc1352 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -192,6 +192,59 @@ static int spinand_ecc_enable(struct spinand_device *spinand,
 			       enable ? CFG_ECC_ENABLE : 0);
 }
 
+static int spinand_check_ecc_status(struct spinand_device *spinand, u8 status)
+{
+	struct nand_device *nand = spinand_to_nand(spinand);
+
+	if (spinand->eccinfo.get_status)
+		return spinand->eccinfo.get_status(spinand, status);
+
+	switch (status & STATUS_ECC_MASK) {
+	case STATUS_ECC_NO_BITFLIPS:
+		return 0;
+
+	case STATUS_ECC_HAS_BITFLIPS:
+		/*
+		 * We have no way to know exactly how many bitflips have been
+		 * fixed, so let's return the maximum possible value so that
+		 * wear-leveling layers move the data immediately.
+		 */
+		return nand->ecc.ctx.conf.strength;
+
+	case STATUS_ECC_UNCOR_ERROR:
+		return -EBADMSG;
+
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static int spinand_noecc_ooblayout_ecc(struct mtd_info *mtd, int section,
+				       struct mtd_oob_region *region)
+{
+	return -ERANGE;
+}
+
+static int spinand_noecc_ooblayout_free(struct mtd_info *mtd, int section,
+					struct mtd_oob_region *region)
+{
+	if (section)
+		return -ERANGE;
+
+	/* Reserve 2 bytes for the BBM. */
+	region->offset = 2;
+	region->length = 62;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops spinand_noecc_ooblayout = {
+	.ecc = spinand_noecc_ooblayout_ecc,
+	.free = spinand_noecc_ooblayout_free,
+};
+
 static int spinand_write_enable_op(struct spinand_device *spinand)
 {
 	struct spi_mem_op op = SPINAND_WR_EN_DIS_OP(true);
@@ -400,35 +453,6 @@ static int spinand_lock_block(struct spinand_device *spinand, u8 lock)
 	return spinand_write_reg_op(spinand, REG_BLOCK_LOCK, lock);
 }
 
-static int spinand_check_ecc_status(struct spinand_device *spinand, u8 status)
-{
-	struct nand_device *nand = spinand_to_nand(spinand);
-
-	if (spinand->eccinfo.get_status)
-		return spinand->eccinfo.get_status(spinand, status);
-
-	switch (status & STATUS_ECC_MASK) {
-	case STATUS_ECC_NO_BITFLIPS:
-		return 0;
-
-	case STATUS_ECC_HAS_BITFLIPS:
-		/*
-		 * We have no way to know exactly how many bitflips have been
-		 * fixed, so let's return the maximum possible value so that
-		 * wear-leveling layers move the data immediately.
-		 */
-		return nand->ecc.ctx.conf.strength;
-
-	case STATUS_ECC_UNCOR_ERROR:
-		return -EBADMSG;
-
-	default:
-		break;
-	}
-
-	return -EINVAL;
-}
-
 static int spinand_read_page(struct spinand_device *spinand,
 			     const struct nand_page_io_req *req,
 			     bool ecc_enabled)
@@ -928,30 +952,6 @@ static int spinand_detect(struct spinand_device *spinand)
 	return 0;
 }
 
-static int spinand_noecc_ooblayout_ecc(struct mtd_info *mtd, int section,
-				       struct mtd_oob_region *region)
-{
-	return -ERANGE;
-}
-
-static int spinand_noecc_ooblayout_free(struct mtd_info *mtd, int section,
-					struct mtd_oob_region *region)
-{
-	if (section)
-		return -ERANGE;
-
-	/* Reserve 2 bytes for the BBM. */
-	region->offset = 2;
-	region->length = 62;
-
-	return 0;
-}
-
-static const struct mtd_ooblayout_ops spinand_noecc_ooblayout = {
-	.ecc = spinand_noecc_ooblayout_ecc,
-	.free = spinand_noecc_ooblayout_free,
-};
-
 static int spinand_init(struct spinand_device *spinand)
 {
 	struct device *dev = &spinand->spimem->spi->dev;
diff --git a/drivers/mtd/nand/spi/on-die-ecc-engine.c b/drivers/mtd/nand/spi/on-die-ecc-engine.c
new file mode 100644
index 000000000000..e69de29bb2d1
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
