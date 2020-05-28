Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB5EC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 11:41:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B45F820888
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 11:41:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X+c8RNDB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B45F820888
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SCXw6Fv80MhcgCr2jcZaE5j1g8wwE5SOXKhRtP/N9IY=; b=X+c8RNDBNxoO9w
	X1L7g1OHjHqo8LzgQREzJE/cpOjUkq2Pbzg7tkba4YcilM8rcZtuB+B7hANYpIl268H3A1xWaWdRC
	vFFk8R2zbyZ3AJxwjGxg/v0tUqtFKLiu4zeOuqsiZIaDYXQFwG9I1per2WR0nhOawN0Kkz/ln2aHd
	uUN7wiGIWt0ZOO6v8Nfwavs5Liud2xf8coyMXG+tfabHDM1UPSgcLLhR7aiKEeu+WruG9kPrAlmMd
	bbJCR06L+heO8gPaxCaGeEF4rWhh+LO5yK425dzAarTNjR8yDQGBQHUTwWX+aJGcQVpcBrFOdYdAD
	wuqxHwwQeC8Uon+2IfNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeGu0-0005ss-Jj; Thu, 28 May 2020 11:40:48 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeGlK-0001hj-BS; Thu, 28 May 2020 11:31:52 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 9E5C4200007;
 Thu, 28 May 2020 11:31:46 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, <devicetree@vger.kernel.org>
Subject: [PATCH v6 14/18] mtd: nand: Add more parameters to the nand_ecc_props
 structure
Date: Thu, 28 May 2020 13:31:09 +0200
Message-Id: <20200528113113.9166-15-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200528113113.9166-1-miquel.raynal@bootlin.com>
References: <20200528113113.9166-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_043150_687081_79D864A7 
X-CRM114-Status: GOOD (  12.31  )
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
Cc: Julien Su <juliensu@mxic.com.tw>, Weijie Gao <weijie.gao@mediatek.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, Chuanhong Guo <gch981213@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Prepare the migration to the generic ECC framework by adding more
fields to the nand_ecc_props structure which will be used widely to
describe different kind of ECC properties.

Doing this imposes to move the engine type, ECC placement and
algorithm enumerations in a shared place: nand.h.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/nand.h    | 52 +++++++++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h | 44 -------------------------------
 2 files changed, 52 insertions(+), 44 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 6add464fd18b..2e9af24936cd 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -127,14 +127,66 @@ struct nand_page_io_req {
 	int mode;
 };
 
+/**
+ * enum nand_ecc_engine_type - NAND ECC engine type
+ * @NAND_ECC_ENGINE_TYPE_INVALID: Invalid value
+ * @NAND_ECC_ENGINE_TYPE_NONE: No ECC correction
+ * @NAND_ECC_ENGINE_TYPE_SOFT: Software ECC correction
+ * @NAND_ECC_ENGINE_TYPE_ON_HOST: On host hardware ECC correction
+ * @NAND_ECC_ENGINE_TYPE_ON_DIE: On chip hardware ECC correction
+ */
+enum nand_ecc_engine_type {
+	NAND_ECC_ENGINE_TYPE_INVALID,
+	NAND_ECC_ENGINE_TYPE_NONE,
+	NAND_ECC_ENGINE_TYPE_SOFT,
+	NAND_ECC_ENGINE_TYPE_ON_HOST,
+	NAND_ECC_ENGINE_TYPE_ON_DIE,
+};
+
+/**
+ * enum nand_ecc_placement - NAND ECC bytes placement
+ * @NAND_ECC_PLACEMENT_UNKNOWN: The actual position of the ECC bytes is unknown
+ * @NAND_ECC_PLACEMENT_OOB: The ECC bytes are located in the OOB area
+ * @NAND_ECC_PLACEMENT_INTERLEAVED: Syndrome layout, there are ECC bytes
+ *                                  interleaved with regular data in the main
+ *                                  area
+ */
+enum nand_ecc_placement {
+	NAND_ECC_PLACEMENT_UNKNOWN,
+	NAND_ECC_PLACEMENT_OOB,
+	NAND_ECC_PLACEMENT_INTERLEAVED,
+};
+
+/**
+ * enum nand_ecc_algo - NAND ECC algorithm
+ * @NAND_ECC_ALGO_UNKNOWN: Unknown algorithm
+ * @NAND_ECC_ALGO_HAMMING: Hamming algorithm
+ * @NAND_ECC_ALGO_BCH: Bose-Chaudhuri-Hocquenghem algorithm
+ * @NAND_ECC_ALGO_RS: Reed-Solomon algorithm
+ */
+enum nand_ecc_algo {
+	NAND_ECC_ALGO_UNKNOWN,
+	NAND_ECC_ALGO_HAMMING,
+	NAND_ECC_ALGO_BCH,
+	NAND_ECC_ALGO_RS,
+};
+
 /**
  * struct nand_ecc_props - NAND ECC properties
+ * @engine_type: ECC engine type
+ * @placement: OOB placement (if relevant)
+ * @algo: ECC algorithm (if relevant)
  * @strength: ECC strength
  * @step_size: Number of bytes per step
+ * @flags: Misc properties
  */
 struct nand_ecc_props {
+	enum nand_ecc_engine_type engine_type;
+	enum nand_ecc_placement placement;
+	enum nand_ecc_algo algo;
 	unsigned int strength;
 	unsigned int step_size;
+	unsigned int flags;
 };
 
 #define NAND_ECCREQ(str, stp) { .strength = (str), .step_size = (stp) }
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index c3411a08ce61..8f7f1cce3b4b 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -92,50 +92,6 @@ enum nand_ecc_mode {
 	NAND_ECC_ON_DIE,
 };
 
-/**
- * enum nand_ecc_engine_type - NAND ECC engine type
- * @NAND_ECC_ENGINE_TYPE_INVALID: Invalid value
- * @NAND_ECC_ENGINE_TYPE_NONE: No ECC correction
- * @NAND_ECC_ENGINE_TYPE_SOFT: Software ECC correction
- * @NAND_ECC_ENGINE_TYPE_ON_HOST: On host hardware ECC correction
- * @NAND_ECC_ENGINE_TYPE_ON_DIE: On chip hardware ECC correction
- */
-enum nand_ecc_engine_type {
-	NAND_ECC_ENGINE_TYPE_INVALID,
-	NAND_ECC_ENGINE_TYPE_NONE,
-	NAND_ECC_ENGINE_TYPE_SOFT,
-	NAND_ECC_ENGINE_TYPE_ON_HOST,
-	NAND_ECC_ENGINE_TYPE_ON_DIE,
-};
-
-/**
- * enum nand_ecc_placement - NAND ECC bytes placement
- * @NAND_ECC_PLACEMENT_UNKNOWN: The actual position of the ECC bytes is unknown
- * @NAND_ECC_PLACEMENT_OOB: The ECC bytes are located in the OOB area
- * @NAND_ECC_PLACEMENT_INTERLEAVED: Syndrome layout, there are ECC bytes
- *                                  interleaved with regular data in the main
- *                                  area
- */
-enum nand_ecc_placement {
-	NAND_ECC_PLACEMENT_UNKNOWN,
-	NAND_ECC_PLACEMENT_OOB,
-	NAND_ECC_PLACEMENT_INTERLEAVED,
-};
-
-/**
- * enum nand_ecc_algo - NAND ECC algorithm
- * @NAND_ECC_ALGO_UNKNOWN: Unknown algorithm
- * @NAND_ECC_ALGO_HAMMING: Hamming algorithm
- * @NAND_ECC_ALGO_BCH: Bose-Chaudhuri-Hocquenghem algorithm
- * @NAND_ECC_ALGO_RS: Reed-Solomon algorithm
- */
-enum nand_ecc_algo {
-	NAND_ECC_ALGO_UNKNOWN,
-	NAND_ECC_ALGO_HAMMING,
-	NAND_ECC_ALGO_BCH,
-	NAND_ECC_ALGO_RS,
-};
-
 /*
  * Constants for Hardware ECC
  */
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
