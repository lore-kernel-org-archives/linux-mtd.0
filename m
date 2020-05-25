Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EDE7C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 14:52:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39A322078B
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 14:52:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rGFDYbcd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=axis.com header.i=@axis.com header.b="A/Qp00XN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39A322078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=axis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LDBs0fAUCBBB4iRRKgh8jQ0rQZ4Q+s85G+MPF50O1v8=; b=rGFDYbcdLSC1AW
	nIm6poGPQ6Jgdwag+nG78Cct9BLtId3s9V5gISFAxE0rPTrprAEryznQwTHhFOOyRwk453OqX1NDB
	Z7welMCC9N1Y6zl0KHLdS9aFYMAtBY7dc6xBeET0oHhS3PQwkeBsMpzjYYcP2SU1fZ4x0vvVQ3VcY
	cgY5cZi1iE286gaQRmpurQ+o02TCu5MHjQtMJdrLuEhJ37jCM1PcsCM8Cu+BSOwxVAcFHg98tsLDh
	itEPGV+owXzuVhUpbtgfvpTQAsspb8Jzd/tAGIRlivGDiWNP7d/tpV21XDAC3J9kX/YKRaCucPx0b
	FVzhk0vcapFLdNlZ9BXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdESK-00015p-AF; Mon, 25 May 2020 14:51:56 +0000
Received: from smtp2.axis.com ([195.60.68.18])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdESH-00014S-Al
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 14:51:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=3320; q=dns/txt; s=axis-central1;
 t=1590418313; x=1621954313;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=eAtHvHGIzIQ0QtxAOofcK++GFnOe4KLZhrkoqq9PviM=;
 b=A/Qp00XNn7oT5Va1TxxRplR6p6SaOeRPRZ9BO1ZOGRK7NBLQzrXlFyxH
 h0QCaE24ez7nUgOwV/vRppnI7iGME8PXPk99Beuztc+2NeYDRBgWjfFRe
 BTLwkNzBD6zGZY1fgSJrUqxsZ8q/VRVVHEBFT2ZvtJSKYEKIX02JGKB2Z
 qfi7Az4+r5S6AwOubm8gLtDMnwrRSOUAG9gePC5cc/AnDevXEzl/YxpBm
 1RU06k03TFv/fN0up74bVgrAq5di9WIQMaIxdm3OJAsrvDjiYFvM5MWPd
 jQqyIhL4hZMpLWJgxnEgUfpMshhSSi1L2ElAxoqwiqLPyKP6ChHIOVIFR A==;
IronPort-SDR: mAegP5cBFCG6M520SKO7BIpu6XWvvBZtF9WiBgR8vDLV9qHva4b6mNx8Pbn08gsGX/8ej58lW1
 dCCI+7xW2KVFs5MpGMRrACQOmUDDeUQtVq9zKjG8/mHRFQSZYBmujnzbNS2T8Gw9i8zh4FkwCG
 bfUth6jXmZwcFG27vQPNIaDhPXpJ6Ff0rIBnLhFkny1NW1yVOT2FvHAfDjopy5mW9RsIelhahQ
 wIQo05VNQ9bEt8GTFsxre/oUt+seoJb8VAD/ooehpNZQdHx4L3fTl8dPrYl6h58Q1vDEVYHi7Z
 S+8=
X-IronPort-AV: E=Sophos;i="5.73,433,1583190000"; 
   d="scan'208";a="8833158"
From: Rickard Andersson <rickaran@axis.com>
To: <miquel.raynal@bootlin.com>, <linux-mtd@lists.infradead.org>,
 <boris.brezillon@collabora.com>
Subject: [PATCH v3 1/2] mtd: rawnand: Add and use helper for testing data
 interface
Date: Mon, 25 May 2020 16:51:32 +0200
Message-ID: <20200525145133.8298-1-rickaran@axis.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX04.axis.com (10.0.5.18) To XBOX02.axis.com (10.0.5.16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_075153_778352_491F9B8C 
X-CRM114-Status: GOOD (  15.16  )
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
Cc: rickaran@axis.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Rickard x Andersson <rickaran@axis.com>

This helper checks if the controller supports the current
data interface timings. If the timings are not supported
the vendor provided corresponding onfi mode will be tried,
and if that fails we will fall back to onfi mode 0.

The helper can also be used by NAND vendor driver for
testing different timings.

Signed-off-by: Rickard x Andersson <rickaran@axis.com>
---
 drivers/mtd/nand/raw/internals.h | 24 ++++++++++++++++++++++++
 drivers/mtd/nand/raw/nand_base.c | 28 ++++++++++++++++++----------
 2 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index 615677820338..6dacf110b559 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -148,6 +148,30 @@ static inline bool nand_can_choose_data_interface(struct nand_chip *chip)
 	return chip->ops.choose_data_interface;
 }
 
+/**
+ * nand_controller_supports_data_interface - Check if controller can handle
+ * the current timings.
+ *
+ * @chip: The NAND chip
+ */
+static inline int
+nand_controller_supports_data_interface(struct nand_chip *chip)
+{
+	int ret;
+	const struct nand_controller_ops *ops = chip->controller->ops;
+
+	/*
+	 * Pass NAND_DATA_IFACE_CHECK_ONLY to only check if the
+	 * controller supports the requested timings.
+	 */
+	ret = ops->setup_data_interface(chip,
+					NAND_DATA_IFACE_CHECK_ONLY,
+					&chip->data_interface);
+
+	return ret;
+}
+
+
 /* BBT functions */
 int nand_markbad_bbt(struct nand_chip *chip, loff_t offs);
 int nand_isreserved_bbt(struct nand_chip *chip, loff_t offs);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index c42cbeb7e446..e3c57649380b 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -982,8 +982,24 @@ static int nand_choose_data_interface(struct nand_chip *chip)
 	 */
 	if (nand_can_choose_data_interface(chip)) {
 		ret = chip->ops.choose_data_interface(chip);
+		if (ret)
+			return ret;
+
+		/*
+		 * Check if the controller can handle the NAND vendor specific
+		 * best timings.
+		 */
+		ret = nand_controller_supports_data_interface(chip);
 		if (!ret)
 			return ret;
+
+		/*
+		 * Specific timings did not work, try using corresponding
+		 * onfi mode provided by vendor.
+		 */
+		if (chip->data_interface.timings.mode)
+			chip->default_timing_mode =
+				chip->data_interface.timings.mode;
 	}
 
 	/*
@@ -994,9 +1010,6 @@ static int nand_choose_data_interface(struct nand_chip *chip)
 	if (chip->parameters.onfi) {
 		modes = chip->parameters.onfi->async_timing_mode;
 	} else {
-		if (!chip->default_timing_mode)
-			return 0;
-
 		modes = GENMASK(chip->default_timing_mode, 0);
 	}
 
@@ -1005,13 +1018,8 @@ static int nand_choose_data_interface(struct nand_chip *chip)
 		if (ret)
 			continue;
 
-		/*
-		 * Pass NAND_DATA_IFACE_CHECK_ONLY to only check if the
-		 * controller supports the requested timings.
-		 */
-		ret = chip->controller->ops->setup_data_interface(chip,
-						 NAND_DATA_IFACE_CHECK_ONLY,
-						 &chip->data_interface);
+		/* Check if the controller supports the requested timings. */
+		ret = nand_controller_supports_data_interface(chip);
 		if (!ret) {
 			chip->default_timing_mode = mode;
 			break;
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
