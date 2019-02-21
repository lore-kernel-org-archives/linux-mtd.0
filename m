Return-Path: <SRS0=HEdT=Q4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F66C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 12:59:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C3C52070B
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 12:59:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l4wBvV/t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C3C52070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lWUPbVsSQ6Q5qEy3gxEfMh1lDJBhCrXhkgsZHS+uh2s=; b=l4wBvV/tWXQnf/
	rkB3e1FEfc91AvhrYG+TyOvuo1SPEVezeV8f7kU/Nylu81fLYrB1stdQsIBpMAJ7jTh7X4LakQ28E
	u5qFGcz+AvoJI+R6iKkABooSyycVmbhusgEuQMJFmwspmuV/Zfwz6Au1qoMa6HhGNsRkTV9OQi9za
	2oN/sfSZceVff8B5N1z6Ot+xOAyssBzDVz/BDR43ue00M4BNh2J70adf+umT1fDi8AegGNZHE/0/f
	XmQyrljnkBEITYGlPU1b2q3zy3vEJ18gJPKS/gdy2YGqmEfylA4Ze1wuG9OzhoMVl15Y6sCqcTS6p
	PIrb6lC4f3pzCp1n0QIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwnwf-0003yt-O4; Thu, 21 Feb 2019 12:59:21 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwnvr-0002sU-Bf; Thu, 21 Feb 2019 12:58:35 +0000
X-Originating-IP: 90.88.23.190
Received: from localhost.localdomain
 (aaubervilliers-681-1-81-190.w90-88.abo.wanadoo.fr [90.88.23.190])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 5FB51C0014;
 Thu, 21 Feb 2019 12:58:27 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [RFC PATCH 17/27] mtd: nand: ecc: Let the software Hamming ECC engine
 be unselected
Date: Thu, 21 Feb 2019 13:57:56 +0100
Message-Id: <20190221125806.28875-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190221125806.28875-1-miquel.raynal@bootlin.com>
References: <20190221125806.28875-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_045831_889434_9A826DFE 
X-CRM114-Status: GOOD (  14.87  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh R <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Julien Su <juliensu@mxic.com.tw>,
 Schrempf Frieder <frieder.schrempf@kontron.de>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

There is no reason to always embed the software Hamming ECC engine
implementation. By default it is, but we can let the user decide.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc/Kconfig               | 10 +++++-
 drivers/mtd/nand/raw/Kconfig               |  2 +-
 include/linux/mtd/nand-sw-hamming-engine.h | 38 ++++++++++++++++++++++
 3 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/ecc/Kconfig b/drivers/mtd/nand/ecc/Kconfig
index e0106b3a7ec1..ff20e621ffef 100644
--- a/drivers/mtd/nand/ecc/Kconfig
+++ b/drivers/mtd/nand/ecc/Kconfig
@@ -1,7 +1,15 @@
 menu "ECC engine support"
 
 config MTD_NAND_ECC_SW_HAMMING
-	tristate
+	tristate "Software Hamming ECC engine"
+	default y
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
index 995fa78bdedb..76a2a8493b1f 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -1,6 +1,5 @@
 menuconfig MTD_RAW_NAND
 	tristate "Raw/Parallel NAND Device Support"
-	select MTD_NAND_ECC_SW_HAMMING
 	help
 	  This enables support for accessing all type of raw/parallel
 	  NAND flash devices. For further information see
@@ -69,6 +68,7 @@ config MTD_NAND_AU1550
 config MTD_NAND_NDFC
 	tristate "IBM/MCC 4xx NAND controller"
 	depends on 4xx
+	depends on MTD_NAND_ECC_SW_HAMMING
 	select MTD_NAND_ECC_SW_HAMMING_SMC
 	help
 	  NDFC Nand Flash Controllers are integrated in IBM/AMCC's 4xx SoCs
diff --git a/include/linux/mtd/nand-sw-hamming-engine.h b/include/linux/mtd/nand-sw-hamming-engine.h
index c50da3a255b7..378ba46f7e1d 100644
--- a/include/linux/mtd/nand-sw-hamming-engine.h
+++ b/include/linux/mtd/nand-sw-hamming-engine.h
@@ -30,6 +30,8 @@ struct ecc_sw_hamming_conf {
 	unsigned int sm_order;
 };
 
+#if IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING)
+
 int __ecc_sw_hamming_calculate(const unsigned char *buf,
 			       unsigned int step_size,
 			       unsigned char *code, bool sm_order);
@@ -42,4 +44,40 @@ int __ecc_sw_hamming_correct(unsigned char *buf, unsigned char *read_ecc,
 int ecc_sw_hamming_correct(struct nand_device *nand, unsigned char *buf,
 			   unsigned char *read_ecc, unsigned char *calc_ecc);
 
+#else /* !CONFIG_MTD_NAND_ECC_SW_HAMMING */
+
+static inline int __ecc_sw_hamming_calculate(const unsigned char *buf,
+					     unsigned int step_size,
+					     unsigned char *code,
+					     bool sm_order)
+{
+	return -ENOTSUPP;
+}
+
+static inline int ecc_sw_hamming_calculate(struct nand_device *nand,
+					   const unsigned char *buf,
+					   unsigned char *code)
+{
+	return -ENOTSUPP;
+}
+
+static inline int __ecc_sw_hamming_correct(unsigned char *buf,
+					   unsigned char *read_ecc,
+					   unsigned char *calc_ecc,
+					   unsigned int step_size,
+					   bool sm_order)
+{
+	return -ENOTSUPP;
+}
+
+static inline int ecc_sw_hamming_correct(struct nand_device *nand,
+					 unsigned char *buf,
+					 unsigned char *read_ecc,
+					 unsigned char *calc_ecc)
+{
+	return -ENOTSUPP;
+}
+
+#endif /* CONFIG_MTD_NAND_ECC_SW_HAMMING */
+
 #endif /* __MTD_NAND_ECC_SW_HAMMING_H__ */
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
