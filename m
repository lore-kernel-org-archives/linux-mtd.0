Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42CDC4360F
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 23:10:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F753206B6
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 23:10:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n72sZvXE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qLXq6nNp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F753206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D/wE3aBQ8V8AElCrbjeUzXo4i1r9/G0KOHtO7yR6Jkw=; b=n72sZvXEhU5U1k
	4LWv1cOoRRN01NEZW7m1Z7W/eK5fxTc/PfmLxisQnEN7EHgFu675OuPpGwZwEjP8c89LGYkq24H6k
	oyhL+jqwHmpn8fHXEkJtZTuB61kNY6mexuY1QB5WRopDB0IDhEMINmvpZ4E5YdsM676iM3d2zsSv4
	oFVdAkCaqSswzkxWB9y4hZ2jvG878gt6kpAyXPlm019pijdbodSQkAMgtaHaLd6MfcJb9ah+Mh0SE
	0XwCfmn2hfAKPfcOhs3cm+wQukK95Q2pfRfzs2hap/dCqSKhLmUFD2cOqRnAbj/oDLkwH5Dy+12Ay
	fZSXqyewlOAtlYqxJZYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0wjW-0007LV-0n; Mon, 04 Mar 2019 23:10:54 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0wjN-0007DE-EY; Mon, 04 Mar 2019 23:10:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6UtddXKGVNvbSNZwhc8PRAup+BKAFfJSLn2HgdIJoDc=; b=qLXq6nNpa4vrPAupO+bMiPtvK6
 prUKgmFxGXWLL/eqMyMxVqiQsXEOuGIIu7I6wtdDncSZVehQsFwet9I3DZx4lCXFRZLhLcHpszOdx
 DvEXdtC5x2zJ1vQ4MEKTaUfUiK5e+zKiL/94EGtk8Zgvk3p2TafWB9dihab5w+gjRTydtrPmuiOcM
 dOYvMEwnquCZiAmbKHmBSq8sBhBwp/p0vrIO4tw0OVSdB3s/o3wPIsbyQAxLXRkACRhkWtK0F9Uxf
 Y5WcsRH8RbeXu9MpT8pEsOVjGHrlKwEQhL88rvzxVa44sxSrtgFsaYbToFo79g6vqbCeM0BG26MV9
 PIBy625w==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0w7C-0001Aw-N2; Mon, 04 Mar 2019 22:31:19 +0000
X-Originating-IP: 90.5.42.199
Received: from localhost.localdomain
 (atoulouse-657-1-1088-199.w90-5.abo.wanadoo.fr [90.5.42.199])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C5D9B240006;
 Mon,  4 Mar 2019 22:30:52 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 24/36] mtd: nand: ecc: Let the software Hamming ECC engine
 be unselected
Date: Mon,  4 Mar 2019 23:28:29 +0100
Message-Id: <20190304222841.13899-25-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190304222841.13899-1-miquel.raynal@bootlin.com>
References: <20190304222841.13899-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_173118_968620_85EB3950 
X-CRM114-Status: GOOD (  16.62  )
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
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

There is no reason to always embed the software Hamming ECC engine
implementation. By default it is (with raw NAND), but we can let the
user decide.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc/Kconfig            | 11 +++++++-
 drivers/mtd/nand/raw/Kconfig            |  2 +-
 include/linux/mtd/nand-ecc-sw-hamming.h | 36 +++++++++++++++++++++++++
 3 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/ecc/Kconfig b/drivers/mtd/nand/ecc/Kconfig
index a9ab9bab252c..a2593faf46f3 100644
--- a/drivers/mtd/nand/ecc/Kconfig
+++ b/drivers/mtd/nand/ecc/Kconfig
@@ -4,7 +4,16 @@ config MTD_NAND_ECC
 	tristate
 
 config MTD_NAND_ECC_SW_HAMMING
-	tristate
+	tristate "Software Hamming ECC engine"
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
index 770c73c1bb7d..390cba259167 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -2,7 +2,6 @@ menuconfig MTD_RAW_NAND
 	tristate "Raw/Parallel NAND Device Support"
 	select MTD_NAND_CORE
 	select MTD_NAND_ECC
-	select MTD_NAND_ECC_SW_HAMMING
 	help
 	  This enables support for accessing all type of raw/parallel
 	  NAND flash devices. For further information see
@@ -71,6 +70,7 @@ config MTD_NAND_AU1550
 config MTD_NAND_NDFC
 	tristate "IBM/MCC 4xx NAND controller"
 	depends on 4xx
+	select MTD_NAND_ECC_SW_HAMMING
 	select MTD_NAND_ECC_SW_HAMMING_SMC
 	help
 	  NDFC Nand Flash Controllers are integrated in IBM/AMCC's 4xx SoCs
diff --git a/include/linux/mtd/nand-ecc-sw-hamming.h b/include/linux/mtd/nand-ecc-sw-hamming.h
index f2d28e5d1888..4d41d6ec9fe7 100644
--- a/include/linux/mtd/nand-ecc-sw-hamming.h
+++ b/include/linux/mtd/nand-ecc-sw-hamming.h
@@ -30,6 +30,8 @@ struct nand_ecc_sw_hamming_conf {
 	unsigned int sm_order;
 };
 
+#if IS_REACHABLE(CONFIG_MTD_NAND_ECC_SW_HAMMING)
+
 int ecc_sw_hamming_calculate(const unsigned char *buf, unsigned int step_size,
 			     unsigned char *code, bool sm_order);
 int nand_ecc_sw_hamming_calculate(struct nand_device *nand,
@@ -42,4 +44,38 @@ int nand_ecc_sw_hamming_correct(struct nand_device *nand, unsigned char *buf,
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
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
