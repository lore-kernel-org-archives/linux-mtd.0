Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F4BC531D3
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2026 13:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYCKcgCSghVOoNM0qn899lqIOq32q/DbK3UbjYNaGAY=; b=OLric+Yi3Sj8mz
	KIYlImbOnbhumX9URhQJULIcCqiJBh6ytoBUaJaG15wxJ8hkvjOmA55rTJgl2oyfaGSU62lUU4P9e
	TTCPm3KPa6Kawbrr1s1QizFz1y1KG2Guop/+y4WZJYnavxDcECRnOBOOxjTySf2kyd8eMHJoTuBFL
	ogLlbjj3dSBeq2rVlpIfkJBct/NA+cswAdxnZD+UVcvURtDaGzXGadKrQJLlLXkQNtVKf5aqsb6NR
	zCNjaQX3IDvHOnUDbLw9cfBXl7tau8GB+Aby4cW5HKlocv1B0CX9g5z1vlM6ifm8UUBavP06AqH0P
	4Oigcc617UiJAf4GmUIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmtfo-0000000EOvI-1SSk;
	Thu, 23 Jul 2026 13:41:16 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmtfk-0000000EOtW-3QOG
	for linux-mtd@lists.infradead.org;
	Thu, 23 Jul 2026 13:41:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 05D621A11AC;
	Thu, 23 Jul 2026 13:41:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C87D3602B8;
	Thu, 23 Jul 2026 13:41:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A37DE11C10CF7;
	Thu, 23 Jul 2026 15:41:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784814066; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aJe6iIBz31HfN24k+/q6gdaOXkqI9N3Yg0L4GhhIx5k=;
	b=Sa9Tbf5Dlr9rlVG9ompl70COm9vEHYUMtJ/cbJ5wgq1OMmTrsM48hCP+VMuvizBjHtgjpG
	IojY5FwQEiHL4aoqHi6XDt9F4dYWD7fjh7Ovf/pHXjngfmK/davJsqRUm9B+w4SdUGVjsb
	2bJ8KS5D1byMo1uYczb5NnuMv+DUfIS1U/mOfAkyjn+XHNTVrFAP8iAywAbeTW3Xp9mDpK
	v32ADMY2uQwAEe+YSCAfuHgjqwGTrd64yX944hUbWrrHbyxHh6ORPqUbyNeMh2eOiAO3zZ
	hsX8bgw07kR074beEkrLtPk22dxEbvjyth4U7TiToF3NaT8G6kzgQ/mp62FhAw==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
Date: Thu, 23 Jul 2026 15:41:01 +0200
Subject: [PATCH 1/4] nand: hamming: Replace sm_order boolean with enum
MIME-Version: 1.0
Message-Id: <20260723-mix-ecc-v1-1-7361c3baeb07@bootlin.com>
References: <20260723-mix-ecc-v1-0-7361c3baeb07@bootlin.com>
In-Reply-To: <20260723-mix-ecc-v1-0-7361c3baeb07@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_064113_004839_1804B5D9 
X-CRM114-Status: GOOD (  16.85  )
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

The ECC bit ordering with Hamming code isn't standardized so we
can find several kind of ordering. So far two ordering are handled: the
'regular' one and the 'smart media' one. The 'smart media' ordering is
selected through the sm_order boolean. Using a boolean to choose the bit
ordering prevents from supporting more than two ECC bit orderings.

Create a new enum to represent the supported ECC bit ordering for
Hamming code.
Replace the sm_order boolean with this enum.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/mtd/nand/ecc-sw-hamming.c       | 29 ++++++++++++++++++-----------
 drivers/mtd/nand/raw/nand_base.c        |  4 +++-
 include/linux/mtd/nand-ecc-sw-hamming.h | 19 +++++++++++++------
 3 files changed, 34 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/nand/ecc-sw-hamming.c b/drivers/mtd/nand/ecc-sw-hamming.c
index 460acc1029c3..d4127e30726e 100644
--- a/drivers/mtd/nand/ecc-sw-hamming.c
+++ b/drivers/mtd/nand/ecc-sw-hamming.c
@@ -113,7 +113,7 @@ static const char addressbits[256] = {
 };
 
 int ecc_sw_hamming_calculate(const unsigned char *buf, unsigned int step_size,
-			     unsigned char *code, bool sm_order)
+			     unsigned char *code, enum ecc_hamming_order ecc_order)
 {
 	const u32 *bp = (uint32_t *)buf;
 	const u32 eccsize_mult = (step_size == 256) ? 1 : 2;
@@ -309,7 +309,8 @@ int ecc_sw_hamming_calculate(const unsigned char *buf, unsigned int step_size,
 	 * possible, but benchmarks showed that on the system this is developed
 	 * the code below is the fastest
 	 */
-	if (sm_order) {
+	switch (ecc_order) {
+	case ECC_HAMMING_SM_ORDER:
 		code[0] = (invparity[rp7] << 7) | (invparity[rp6] << 6) |
 			  (invparity[rp5] << 5) | (invparity[rp4] << 4) |
 			  (invparity[rp3] << 3) | (invparity[rp2] << 2) |
@@ -318,7 +319,8 @@ int ecc_sw_hamming_calculate(const unsigned char *buf, unsigned int step_size,
 			  (invparity[rp13] << 5) | (invparity[rp12] << 4) |
 			  (invparity[rp11] << 3) | (invparity[rp10] << 2) |
 			  (invparity[rp9] << 1) | (invparity[rp8]);
-	} else {
+		break;
+	case ECC_HAMMING_REGULAR_ORDER:
 		code[1] = (invparity[rp7] << 7) | (invparity[rp6] << 6) |
 			  (invparity[rp5] << 5) | (invparity[rp4] << 4) |
 			  (invparity[rp3] << 3) | (invparity[rp2] << 2) |
@@ -327,6 +329,7 @@ int ecc_sw_hamming_calculate(const unsigned char *buf, unsigned int step_size,
 			  (invparity[rp13] << 5) | (invparity[rp12] << 4) |
 			  (invparity[rp11] << 3) | (invparity[rp10] << 2) |
 			  (invparity[rp9] << 1) | (invparity[rp8]);
+		break;
 	}
 
 	if (eccsize_mult == 1)
@@ -364,15 +367,16 @@ int nand_ecc_sw_hamming_calculate(struct nand_device *nand,
 {
 	struct nand_ecc_sw_hamming_conf *engine_conf = nand->ecc.ctx.priv;
 	unsigned int step_size = nand->ecc.ctx.conf.step_size;
-	bool sm_order = engine_conf ? engine_conf->sm_order : false;
+	enum ecc_hamming_order order = engine_conf ? engine_conf->ecc_order :
+				       ECC_HAMMING_REGULAR_ORDER;
 
-	return ecc_sw_hamming_calculate(buf, step_size, code, sm_order);
+	return ecc_sw_hamming_calculate(buf, step_size, code, order);
 }
 EXPORT_SYMBOL(nand_ecc_sw_hamming_calculate);
 
 int ecc_sw_hamming_correct(unsigned char *buf, unsigned char *read_ecc,
 			   unsigned char *calc_ecc, unsigned int step_size,
-			   bool sm_order)
+			   enum ecc_hamming_order ecc_order)
 {
 	const u32 eccsize_mult = step_size >> 8;
 	unsigned char b0, b1, b2, bit_addr;
@@ -383,14 +387,16 @@ int ecc_sw_hamming_correct(unsigned char *buf, unsigned char *read_ecc,
 	 * we might need the xor result  more than once,
 	 * so keep them in a local var
 	*/
-	if (sm_order) {
+	switch (ecc_order) {
+	case ECC_HAMMING_SM_ORDER:
 		b0 = read_ecc[0] ^ calc_ecc[0];
 		b1 = read_ecc[1] ^ calc_ecc[1];
-	} else {
+		break;
+	case ECC_HAMMING_REGULAR_ORDER:
 		b0 = read_ecc[1] ^ calc_ecc[1];
 		b1 = read_ecc[0] ^ calc_ecc[0];
+		break;
 	}
-
 	b2 = read_ecc[2] ^ calc_ecc[2];
 
 	/* check if there are any bitfaults */
@@ -457,10 +463,11 @@ int nand_ecc_sw_hamming_correct(struct nand_device *nand, unsigned char *buf,
 {
 	struct nand_ecc_sw_hamming_conf *engine_conf = nand->ecc.ctx.priv;
 	unsigned int step_size = nand->ecc.ctx.conf.step_size;
-	bool sm_order = engine_conf ? engine_conf->sm_order : false;
+	enum ecc_hamming_order ecc_order = engine_conf ? engine_conf->ecc_order :
+					   ECC_HAMMING_REGULAR_ORDER;
 
 	return ecc_sw_hamming_correct(buf, read_ecc, calc_ecc, step_size,
-				      sm_order);
+				      ecc_order);
 }
 EXPORT_SYMBOL(nand_ecc_sw_hamming_correct);
 
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index a5b278ab9384..f6b6a4fa2b1f 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5657,7 +5657,9 @@ int rawnand_sw_hamming_init(struct nand_chip *chip)
 	engine_conf = base->ecc.ctx.priv;
 
 	if (chip->ecc.options & NAND_ECC_SOFT_HAMMING_SM_ORDER)
-		engine_conf->sm_order = true;
+		engine_conf->ecc_order = ECC_HAMMING_SM_ORDER;
+	else
+		engine_conf->ecc_order = ECC_HAMMING_REGULAR_ORDER;
 
 	chip->ecc.size = base->ecc.ctx.conf.step_size;
 	chip->ecc.strength = base->ecc.ctx.conf.strength;
diff --git a/include/linux/mtd/nand-ecc-sw-hamming.h b/include/linux/mtd/nand-ecc-sw-hamming.h
index 2aa2f8ef68d2..ac6f28f35f77 100644
--- a/include/linux/mtd/nand-ecc-sw-hamming.h
+++ b/include/linux/mtd/nand-ecc-sw-hamming.h
@@ -12,6 +12,11 @@
 
 #include <linux/mtd/nand.h>
 
+enum ecc_hamming_order {
+	ECC_HAMMING_REGULAR_ORDER = 0,
+	ECC_HAMMING_SM_ORDER,
+};
+
 /**
  * struct nand_ecc_sw_hamming_conf - private software Hamming ECC engine structure
  * @req_ctx: Save request context and tweak the original request to fit the
@@ -19,14 +24,14 @@
  * @code_size: Number of bytes needed to store a code (one code per step)
  * @calc_buf: Buffer to use when calculating ECC bytes
  * @code_buf: Buffer to use when reading (raw) ECC bytes from the chip
- * @sm_order: Smart Media special ordering
+ * @ecc_order: ECC ordering
  */
 struct nand_ecc_sw_hamming_conf {
 	struct nand_ecc_req_tweak_ctx req_ctx;
 	unsigned int code_size;
 	u8 *calc_buf;
 	u8 *code_buf;
-	unsigned int sm_order;
+	enum ecc_hamming_order ecc_order;
 };
 
 #if IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING)
@@ -34,13 +39,13 @@ struct nand_ecc_sw_hamming_conf {
 int nand_ecc_sw_hamming_init_ctx(struct nand_device *nand);
 void nand_ecc_sw_hamming_cleanup_ctx(struct nand_device *nand);
 int ecc_sw_hamming_calculate(const unsigned char *buf, unsigned int step_size,
-			     unsigned char *code, bool sm_order);
+			     unsigned char *code, enum ecc_hamming_order ecc_order);
 int nand_ecc_sw_hamming_calculate(struct nand_device *nand,
 				  const unsigned char *buf,
 				  unsigned char *code);
 int ecc_sw_hamming_correct(unsigned char *buf, unsigned char *read_ecc,
 			   unsigned char *calc_ecc, unsigned int step_size,
-			   bool sm_order);
+			   enum ecc_hamming_order ecc_order);
 int nand_ecc_sw_hamming_correct(struct nand_device *nand, unsigned char *buf,
 				unsigned char *read_ecc,
 				unsigned char *calc_ecc);
@@ -56,7 +61,8 @@ static inline void nand_ecc_sw_hamming_cleanup_ctx(struct nand_device *nand) {}
 
 static inline int ecc_sw_hamming_calculate(const unsigned char *buf,
 					   unsigned int step_size,
-					   unsigned char *code, bool sm_order)
+					   unsigned char *code,
+					   enum ecc_hamming_order ecc_order)
 {
 	return -ENOTSUPP;
 }
@@ -71,7 +77,8 @@ static inline int nand_ecc_sw_hamming_calculate(struct nand_device *nand,
 static inline int ecc_sw_hamming_correct(unsigned char *buf,
 					 unsigned char *read_ecc,
 					 unsigned char *calc_ecc,
-					 unsigned int step_size, bool sm_order)
+					 unsigned int step_size,
+					 enum ecc_hamming_order ecc_order)
 {
 	return -ENOTSUPP;
 }

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
