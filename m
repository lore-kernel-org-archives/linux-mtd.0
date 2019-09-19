Return-Path: <SRS0=PkFq=XO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD5FC3A5A6
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 19:51:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7B4020678
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 19:51:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AKGnC1P0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7B4020678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1KY4NL3m07vp8QrFi6gneS3e8FgQC9HejQL5bK1q1iM=; b=AKGnC1P0cgYnkT
	YHky9vSAR55dOLVv05COOSL9Byz/bocs+D0+g4vdhZpKDCrjq90lTEXbBU+km6BPUHDvZfql9XWAF
	qejgXVF2u6749mRJxGNaa+aQU0smA+fVP0B6RyEgIYaIB8VjMdZJLzPGadg6iBBOw7i9kBT554Juj
	T0OKrt2RKFY//B6e1FmYqn3gTrHS/a8jDrNgmdz0QVpX3xxO2xYtRHWHB+e2+FEnlVC1IrI3agfDB
	/rMQqLN+Tk9Gm1ftcZAJU6qn+12kIDptTZoWBA/4xQcdSpVq1AIBA6vTOkQAlMa1Y0GIAcGCE1yG+
	DJQWLLof77dx/1VLUqRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iB2T3-0004MQ-P8; Thu, 19 Sep 2019 19:51:53 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iB2AY-0002aE-SN; Thu, 19 Sep 2019 19:32:48 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 40D9C240009;
 Thu, 19 Sep 2019 19:32:43 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v3 28/40] mtd: nand: Let software ECC engines be retrieved
 from the NAND core
Date: Thu, 19 Sep 2019 21:31:28 +0200
Message-Id: <20190919193141.7865-29-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190919193141.7865-1-miquel.raynal@bootlin.com>
References: <20190919193141.7865-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_123247_311272_D313DA34 
X-CRM114-Status: GOOD (  10.99  )
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

Before making use of the ECC engines, we must retrieve them. Add the
boilerplate for the ones already available: software engines (Hamming
and BCH).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc.c                  | 20 ++++++++++++++++++++
 include/linux/mtd/nand-ecc-sw-bch.h     |  3 +++
 include/linux/mtd/nand-ecc-sw-hamming.h |  3 +++
 include/linux/mtd/nand.h                |  3 +++
 4 files changed, 29 insertions(+)

diff --git a/drivers/mtd/nand/ecc.c b/drivers/mtd/nand/ecc.c
index 8e7859355a10..da3aa2379b94 100644
--- a/drivers/mtd/nand/ecc.c
+++ b/drivers/mtd/nand/ecc.c
@@ -480,6 +480,26 @@ bool nand_ecc_correction_is_enough(struct nand_device *nand)
 }
 EXPORT_SYMBOL(nand_ecc_correction_is_enough);
 
+struct nand_ecc_engine *nand_ecc_get_sw_engine(struct nand_device *nand)
+{
+	unsigned int algo = nand->ecc.user_conf.algo;
+
+	if (algo == NAND_ECC_UNKNOWN)
+		algo = nand->ecc.defaults.algo;
+
+	switch (algo) {
+	case NAND_ECC_HAMMING:
+		return nand_ecc_sw_hamming_get_engine();
+	case NAND_ECC_BCH:
+		return nand_ecc_sw_bch_get_engine();
+	default:
+		break;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL(nand_ecc_get_sw_engine);
+
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com>");
 MODULE_DESCRIPTION("Generic ECC engine");
diff --git a/include/linux/mtd/nand-ecc-sw-bch.h b/include/linux/mtd/nand-ecc-sw-bch.h
index eec5373a2423..3c0cf42b7a1d 100644
--- a/include/linux/mtd/nand-ecc-sw-bch.h
+++ b/include/linux/mtd/nand-ecc-sw-bch.h
@@ -11,6 +11,9 @@
 #include <linux/mtd/nand.h>
 #include <linux/bch.h>
 
+/* Needed for cross inclusion with nand.h */
+struct nand_device;
+
 /**
  * struct nand_ecc_sw_bch_conf - private software BCH ECC engine structure
  * @reqooblen: Save the actual user OOB length requested before overwriting it
diff --git a/include/linux/mtd/nand-ecc-sw-hamming.h b/include/linux/mtd/nand-ecc-sw-hamming.h
index 3ae51bd2e2ab..d79a72393ef4 100644
--- a/include/linux/mtd/nand-ecc-sw-hamming.h
+++ b/include/linux/mtd/nand-ecc-sw-hamming.h
@@ -12,6 +12,9 @@
 
 #include <linux/mtd/nand.h>
 
+/* Needed for cross inclusion with nand.h */
+struct nand_device;
+
 /**
  * struct nand_ecc_sw_hamming_conf - private software Hamming ECC engine structure
  * @reqooblen: Save the actual user OOB length requested before overwriting it
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 9d7b62933cc1..b410ef778e52 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -11,6 +11,8 @@
 #define __LINUX_MTD_NAND_H
 
 #include <linux/mtd/mtd.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
+#include <linux/mtd/nand-ecc-sw-bch.h>
 
 struct nand_device;
 
@@ -270,6 +272,7 @@ int nand_ecc_prepare_io_req(struct nand_device *nand,
 int nand_ecc_finish_io_req(struct nand_device *nand,
 			   struct nand_page_io_req *req, void *oobbuf);
 bool nand_ecc_correction_is_enough(struct nand_device *nand);
+struct nand_ecc_engine *nand_ecc_get_sw_engine(struct nand_device *nand);
 
 /**
  * struct nand_ecc - High-level ECC object
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
