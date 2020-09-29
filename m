Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F205DC4727D
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:04:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7387720897
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:04:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uIsjpA3t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7387720897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Scf3sC0el1YLknr+0fdZe7tIZgUFLy/siqj8Vc1FgGY=; b=uIsjpA3tjLtrkm67n/4kijJRL
	T23D133xG4+hitxejQBQupWNuZT5RQITwGRMkTWdtcQsg+NWrtzZVQHGCk/tWdvkpKjmbn3IDVAMG
	MifbLQRi7kMe6+4P/DYZfzRRJz25xFdRuf02uI2Ee3BoSL5OqIFLN/sLlNQxASvT1TwtXg36C2afy
	bFpt7Zq17PAqS2Yc604C6yez4F5WyX00vYXTL5P0UZdovBboo7XL3BLLHJM76393NVuzzPuDVa1wz
	4GXgXiJSE67wVaSZv64f8/x3Pxu3tSHBmC1CVKZ+ZGAd4KtLZbVbSWM0nEpNf8wV0fQjPMoCKUeMi
	xxFypugCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNOef-00024J-2u; Tue, 29 Sep 2020 23:03:29 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNOd2-0001Go-Kk
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 23:01:53 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id E0A48200015;
 Tue, 29 Sep 2020 23:01:46 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 18/20] mtd: nand: ecc-hamming: Let the software Hamming ECC
 engine be unselected
Date: Wed, 30 Sep 2020 01:01:22 +0200
Message-Id: <20200929230124.31491-19-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200929230124.31491-1-miquel.raynal@bootlin.com>
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_190148_954448_87528471 
X-CRM114-Status: GOOD (  16.64  )
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
Cc: Julien Su <juliensu@mxic.com.tw>, ycllin@mxic.com.tw,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

There is no reason to always embed the software Hamming ECC engine
implementation. By default it is (with raw NAND), but we can let the
user decide.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/Kconfig                | 11 +++++++-
 drivers/mtd/nand/raw/Kconfig            |  2 +-
 include/linux/mtd/nand-ecc-sw-hamming.h | 36 +++++++++++++++++++++++++
 3 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 306c33ca3448..15ffe1a1b863 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -16,7 +16,16 @@ config MTD_NAND_ECC
        depends on MTD_NAND_CORE
 
 config MTD_NAND_ECC_SW_HAMMING
-	bool
+	bool "Software Hamming ECC engine"
+	default y if MTD_RAW_NAND
+	select MTD_NAND_ECC
+	help
+	  This enables support for software Hamming error
+	  correction. This correction can correct up to 1 bit error
+	  per chunk and detect up to 2 bit errors. While it used to be
+	  widely used with old parts, newer NAND chips usually require
+	  more strength correction and in this case BCH or RS will be
+	  preferred.
 
 config MTD_NAND_ECC_SW_HAMMING_SMC
 	bool "NAND ECC Smart Media byte order"
diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 6149096e32cb..cc86d6e4e042 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -3,7 +3,6 @@ menuconfig MTD_RAW_NAND
 	tristate "Raw/Parallel NAND Device Support"
 	select MTD_NAND_CORE
 	select MTD_NAND_ECC
-	select MTD_NAND_ECC_SW_HAMMING
 	help
 	  This enables support for accessing all type of raw/parallel
 	  NAND flash devices. For further information see
@@ -72,6 +71,7 @@ config MTD_NAND_AU1550
 config MTD_NAND_NDFC
 	tristate "IBM/MCC 4xx NAND controller"
 	depends on 4xx
+	select MTD_NAND_ECC_SW_HAMMING
 	select MTD_NAND_ECC_SW_HAMMING_SMC
 	help
 	  NDFC Nand Flash Controllers are integrated in IBM/AMCC's 4xx SoCs
diff --git a/include/linux/mtd/nand-ecc-sw-hamming.h b/include/linux/mtd/nand-ecc-sw-hamming.h
index 9d4b4d623741..5a39e96c3546 100644
--- a/include/linux/mtd/nand-ecc-sw-hamming.h
+++ b/include/linux/mtd/nand-ecc-sw-hamming.h
@@ -32,6 +32,8 @@ struct nand_ecc_sw_hamming_conf {
 	unsigned int sm_order;
 };
 
+#if IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING)
+
 int ecc_sw_hamming_calculate(const unsigned char *buf, unsigned int step_size,
 			     unsigned char *code, bool sm_order);
 int nand_ecc_sw_hamming_calculate(struct nand_device *nand,
@@ -44,4 +46,38 @@ int nand_ecc_sw_hamming_correct(struct nand_device *nand, unsigned char *buf,
 				unsigned char *read_ecc,
 				unsigned char *calc_ecc);
 
+#else /* !CONFIG_MTD_NAND_ECC_SW_HAMMING */
+
+static inline int ecc_sw_hamming_calculate(const unsigned char *buf,
+					   unsigned int step_size,
+					   unsigned char *code, bool sm_order)
+{
+	return -ENOTSUPP;
+}
+
+static inline int nand_ecc_sw_hamming_calculate(struct nand_device *nand,
+						const unsigned char *buf,
+						unsigned char *code)
+{
+	return -ENOTSUPP;
+}
+
+static inline int ecc_sw_hamming_correct(unsigned char *buf,
+					 unsigned char *read_ecc,
+					 unsigned char *calc_ecc,
+					 unsigned int step_size, bool sm_order)
+{
+	return -ENOTSUPP;
+}
+
+static inline int nand_ecc_sw_hamming_correct(struct nand_device *nand,
+					      unsigned char *buf,
+					      unsigned char *read_ecc,
+					      unsigned char *calc_ecc)
+{
+	return -ENOTSUPP;
+}
+
+#endif /* CONFIG_MTD_NAND_ECC_SW_HAMMING */
+
 #endif /* __MTD_NAND_ECC_SW_HAMMING_H__ */
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
