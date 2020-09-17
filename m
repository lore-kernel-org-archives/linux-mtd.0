Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B81C43461
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 07:54:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56EDC21D90
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 07:54:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1lQbAunK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="rH9LkZxa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56EDC21D90
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gHM4acDBSdT+YKRNBvfWuIy3Om+/uFS0PQ3/lPFRiqI=; b=1lQbAunKkNuXYZLwyMtpbmK4r
	2e3A+QyBesjTA3ALao9lr7Xq+xOzr0FLpj5zNUAtjB9AM9Smam5/s+KM84JBCQPYzdf/fKqKY/4S4
	8QjwYz/MK6miVfgvveDmUZspmAj+boWnWaw1UC4kOJDkQ0jc806j9t5BMcNwiIA8IGz63uku/33Gk
	kchIyXHzGramRj/hwKS2pDaVlXI/ac5R8P/0FSpwmKHyqyi788+6HF8XNZ10woMaM/BcS576s2eLU
	p+e62yBsGnhz9EeU/Wztx7yQcgG7wzveKjrABjwoP1AglimPf/TWrka7xMKZm6BZvhei4mlmtWyvG
	w23t2CeLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIoj1-0002a9-9k; Thu, 17 Sep 2020 07:53:03 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIoio-0002P2-RS
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 07:52:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1600329170; x=1631865170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=990gfkWFBkj91RwbZ5Q8ijqtxbunpByRG5b116/U3Gk=;
 b=rH9LkZxaDNBzVl/0C/LF/+Ahrx7iQpSWJbM1+L2Q3jBfitpsxBScTWO8
 /lnhWoZpZW/vlt6kgn2CcdvLAsKDUwyEMCWnKLoWQ1a1Qd2Pif75OZH8l
 HXs2Uk2f+iYWbSyFwS2NcYFW7KS1FVgK5o5NDU+Xv0jUmw26odp5YDHbr
 JHDmxUH6nzIzzS17T42D+Ll7PrpFChfrXaBWIa2TLb6yj9qVuoCm0fzCf
 G2zIFYmtNPWhW/v7yfVKc63u2lm4loUh/EtOHUOlje+2kwnU2VsQCRndw
 PR8q67pAjLS4XUayPdhYSSBGUlRO5IETwWhSIL+eZVHKZLTPl1VCFjJTd Q==;
IronPort-SDR: cNfujoE7IN0vlnFSOu8x8yjYH9gIQ86xMm0w1LXMSzf/uv05rBM7QaySbm1qJjhf+MYEttR9XW
 9A30ZcdzrgYZGuLZUX4SLeBoJduhodF065A1ewds8LnAdoDIi+9PufQOCFWIR/yq8Mc/XlUK2Q
 J3NUFC4vv5WoNBpDwuC1AJ2ELzDKsnpA5s9ESX5fcm3X3t6VtTOUkVxvODPJI5WIwm0REt7Yr6
 gFCQS6aEmBVvkfRMfrOytMbUOZOD2Xju4NZO3VZHfwd2+MEkUTDagZgwEBGBs7/GwMzBpPX/Wy
 zN0=
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="92140729"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Sep 2020 00:52:50 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 17 Sep 2020 00:52:17 -0700
Received: from atudor-ThinkPad-T470p.local (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 17 Sep 2020 00:52:15 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>
Subject: [PATCH 2/3] mtd: rawnand: Introduce nand_set_ecc_on_host_ops()
Date: Thu, 17 Sep 2020 10:52:12 +0300
Message-ID: <20200917075213.532161-3-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200917075213.532161-1-tudor.ambarus@microchip.com>
References: <20200917075213.532161-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_035251_068670_9F141F30 
X-CRM114-Status: GOOD (  13.79  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Tudor
 Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

There were too many levels of indentation and the code was
hard to read. Introduce a new function, similar to
nand_set_ecc_soft_ops().

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/nand/raw/nand_base.c | 114 +++++++++++++++++--------------
 1 file changed, 61 insertions(+), 53 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index bd30f6632fe2..d3e0ca66382f 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5139,6 +5139,65 @@ static void nand_scan_ident_cleanup(struct nand_chip *chip)
 	kfree(chip->parameters.onfi);
 }
 
+static int nand_set_ecc_on_host_ops(struct nand_chip *chip)
+{
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
+
+	switch (ecc->placement) {
+	case NAND_ECC_PLACEMENT_UNKNOWN:
+	case NAND_ECC_PLACEMENT_OOB:
+		/* Use standard hwecc read page function? */
+		if (!ecc->read_page)
+			ecc->read_page = nand_read_page_hwecc;
+		if (!ecc->write_page)
+			ecc->write_page = nand_write_page_hwecc;
+		if (!ecc->read_page_raw)
+			ecc->read_page_raw = nand_read_page_raw;
+		if (!ecc->write_page_raw)
+			ecc->write_page_raw = nand_write_page_raw;
+		if (!ecc->read_oob)
+			ecc->read_oob = nand_read_oob_std;
+		if (!ecc->write_oob)
+			ecc->write_oob = nand_write_oob_std;
+		if (!ecc->read_subpage)
+			ecc->read_subpage = nand_read_subpage;
+		if (!ecc->write_subpage && ecc->hwctl && ecc->calculate)
+			ecc->write_subpage = nand_write_subpage_hwecc;
+		fallthrough;
+
+	case NAND_ECC_PLACEMENT_INTERLEAVED:
+		if ((!ecc->calculate || !ecc->correct || !ecc->hwctl) &&
+		    (!ecc->read_page ||
+		     ecc->read_page == nand_read_page_hwecc ||
+		     !ecc->write_page ||
+		     ecc->write_page == nand_write_page_hwecc)) {
+			WARN(1, "No ECC functions supplied; hardware ECC not possible\n");
+			return -EINVAL;
+		}
+		/* Use standard syndrome read/write page function? */
+		if (!ecc->read_page)
+			ecc->read_page = nand_read_page_syndrome;
+		if (!ecc->write_page)
+			ecc->write_page = nand_write_page_syndrome;
+		if (!ecc->read_page_raw)
+			ecc->read_page_raw = nand_read_page_raw_syndrome;
+		if (!ecc->write_page_raw)
+			ecc->write_page_raw = nand_write_page_raw_syndrome;
+		if (!ecc->read_oob)
+			ecc->read_oob = nand_read_oob_syndrome;
+		if (!ecc->write_oob)
+			ecc->write_oob = nand_write_oob_syndrome;
+		break;
+
+	default:
+		pr_warn("Invalid NAND_ECC_PLACEMENT %d\n",
+			ecc->placement);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int nand_set_ecc_soft_ops(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
@@ -5619,60 +5678,9 @@ static int nand_scan_tail(struct nand_chip *chip)
 
 	switch (ecc->engine_type) {
 	case NAND_ECC_ENGINE_TYPE_ON_HOST:
-
-		switch (ecc->placement) {
-		case NAND_ECC_PLACEMENT_UNKNOWN:
-		case NAND_ECC_PLACEMENT_OOB:
-			/* Use standard hwecc read page function? */
-			if (!ecc->read_page)
-				ecc->read_page = nand_read_page_hwecc;
-			if (!ecc->write_page)
-				ecc->write_page = nand_write_page_hwecc;
-			if (!ecc->read_page_raw)
-				ecc->read_page_raw = nand_read_page_raw;
-			if (!ecc->write_page_raw)
-				ecc->write_page_raw = nand_write_page_raw;
-			if (!ecc->read_oob)
-				ecc->read_oob = nand_read_oob_std;
-			if (!ecc->write_oob)
-				ecc->write_oob = nand_write_oob_std;
-			if (!ecc->read_subpage)
-				ecc->read_subpage = nand_read_subpage;
-			if (!ecc->write_subpage && ecc->hwctl && ecc->calculate)
-				ecc->write_subpage = nand_write_subpage_hwecc;
-			fallthrough;
-
-		case NAND_ECC_PLACEMENT_INTERLEAVED:
-			if ((!ecc->calculate || !ecc->correct || !ecc->hwctl) &&
-			    (!ecc->read_page ||
-			     ecc->read_page == nand_read_page_hwecc ||
-			     !ecc->write_page ||
-			     ecc->write_page == nand_write_page_hwecc)) {
-				WARN(1, "No ECC functions supplied; hardware ECC not possible\n");
-				ret = -EINVAL;
-				goto err_nand_manuf_cleanup;
-			}
-			/* Use standard syndrome read/write page function? */
-			if (!ecc->read_page)
-				ecc->read_page = nand_read_page_syndrome;
-			if (!ecc->write_page)
-				ecc->write_page = nand_write_page_syndrome;
-			if (!ecc->read_page_raw)
-				ecc->read_page_raw = nand_read_page_raw_syndrome;
-			if (!ecc->write_page_raw)
-				ecc->write_page_raw = nand_write_page_raw_syndrome;
-			if (!ecc->read_oob)
-				ecc->read_oob = nand_read_oob_syndrome;
-			if (!ecc->write_oob)
-				ecc->write_oob = nand_write_oob_syndrome;
-			break;
-
-		default:
-			pr_warn("Invalid NAND_ECC_PLACEMENT %d\n",
-				ecc->placement);
-			ret = -EINVAL;
+		ret = nand_set_ecc_on_host_ops(chip);
+		if (ret)
 			goto err_nand_manuf_cleanup;
-		}
 
 		if (mtd->writesize >= ecc->size) {
 			if (!ecc->strength) {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
