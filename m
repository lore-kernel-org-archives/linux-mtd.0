Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7455CC531D4
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2026 13:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qnR4q8h7N6G6YXPS3V7Q6hnvWgzIJyeRjBsGzJP9krQ=; b=yeSggo6cBdY1XR
	YuzFRaUIaHnDJ3JaXIbRQUa3kGKh+kSuwG6ckvXTlHVez7oEkaiNIOY5jcyx90efXd248CIr9b0dL
	/8XqX4cR3exCmnC7YsibaW273Qp3xvLNnumnbSltTNSdZ4qXAlk8PURHnS2cKtPcb5+SWpFusXu+k
	2TSDpIQqtP7sYJhpAM7KG/+mfPw6YbPLkLEgS212kmmUyTrAIU0kESlJi0zOCoTDq9y/pDli/s5Lh
	6N+44pbO1hCH1Na+NEB/s3NPNrAEXa+6owwiRsjVRyKFaySsIGAjR0e08hjozHzYrhb6aNMjtUAiD
	D+ItQvmbADDFfqgmLVGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmtfu-0000000EOxJ-0SsV;
	Thu, 23 Jul 2026 13:41:22 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmtfk-0000000EOtY-3J5Q
	for linux-mtd@lists.infradead.org;
	Thu, 23 Jul 2026 13:41:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5ADDF4E40F0E;
	Thu, 23 Jul 2026 13:41:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A432602B8;
	Thu, 23 Jul 2026 13:41:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8076F11C10E94;
	Thu, 23 Jul 2026 15:41:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784814067; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6C/oeJlxlhroVeY4J/H0jgbBKM8DwwJyzWPAp0mGJr4=;
	b=em3KKgEr2xK4JYRVZqojT8G7n5BSOEeaF8ntS/SjdejUDyrDRUvQ8jNr881WACpbWMO/is
	fAcGju93yA+S995sdAn/uP6d73Qa9knO8GFNi0GpFtOfdLJbDYfFS1c/QTQBYIMqVgQA5Q
	ZMs1RZoxWgdwTV8iQYoBRLZrxaqCWSMUzeMsRiBwG5gfjz0qEup05Tfkgyyy3Yiigamz42
	E4lbBTlvnFiRG470BNUs6HFlfFr2fhK2eXpQDjDGXJmXjMeoQcmvxYXaBXIbvqWBfhXLFq
	NFmO96HR+dOhYi2jsU6xyE4qt/cXTQltl78/eWEtsHCxLeyyxPYoiMQ3LjHxug==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
Date: Thu, 23 Jul 2026 15:41:02 +0200
Subject: [PATCH 2/4] nand: hamming: Add support for the PL35x ECC bit
 ordering
MIME-Version: 1.0
Message-Id: <20260723-mix-ecc-v1-2-7361c3baeb07@bootlin.com>
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
X-CRM114-CacheID: sfid-20260723_064113_117081_1ED347F1 
X-CRM114-Status: GOOD (  26.81  )
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

The PL353's HW-ECC engine is broken and fails to report some errors
on reading (cf errata 721059 in [1]). So, to still benefit a bit from the
HW acceleration, a mixed approach has to be used: where writes are
performed by the HW-ECC engine and reads by software. To do so, the
software part has to use the same bit ordering than the hardware engine.

Add support for the PL35x bit ordering in the generic hamming helpers.
Create a new option flag to enable this bit ordering. For consistency
this new flag is put next to the SM_ORDER flag which shifts the CACHEPRG
one bit away.

[1] : https://developer.arm.com/documentation/rlnc000227/a
Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/mtd/nand/ecc-sw-hamming.c       | 150 ++++++++++++++++++++++----------
 drivers/mtd/nand/raw/nand_base.c        |   2 +
 include/linux/mtd/nand-ecc-sw-hamming.h |   1 +
 include/linux/mtd/rawnand.h             |   5 +-
 4 files changed, 111 insertions(+), 47 deletions(-)

diff --git a/drivers/mtd/nand/ecc-sw-hamming.c b/drivers/mtd/nand/ecc-sw-hamming.c
index d4127e30726e..40f453299c7a 100644
--- a/drivers/mtd/nand/ecc-sw-hamming.c
+++ b/drivers/mtd/nand/ecc-sw-hamming.c
@@ -320,6 +320,24 @@ int ecc_sw_hamming_calculate(const unsigned char *buf, unsigned int step_size,
 			  (invparity[rp11] << 3) | (invparity[rp10] << 2) |
 			  (invparity[rp9] << 1) | (invparity[rp8]);
 		break;
+	case ECC_HAMMING_PL35X_ORDER:
+		code[1] = (invparity[rp0] << 7) |
+			  (invparity[par & 0x0f] << 6) |
+			  (invparity[par & 0x33] << 5) |
+			  (invparity[par & 0x55] << 4) |
+			  (invparity[rp17] << 3) |
+			  (invparity[rp15] << 2) |
+			  (invparity[rp13] << 1) |
+			  (invparity[rp11] << 0);
+		code[0] = (invparity[rp9] << 7) |
+			  (invparity[rp7] << 6) |
+			  (invparity[rp5] << 5) |
+			  (invparity[rp3] << 4) |
+			  (invparity[rp1] << 3) |
+			  (invparity[par & 0xf0] << 2) |
+			  (invparity[par & 0xcc] << 1) |
+			  (invparity[par & 0xaa] << 0);
+		break;
 	case ECC_HAMMING_REGULAR_ORDER:
 		code[1] = (invparity[rp7] << 7) | (invparity[rp6] << 6) |
 			  (invparity[rp5] << 5) | (invparity[rp4] << 4) |
@@ -332,25 +350,38 @@ int ecc_sw_hamming_calculate(const unsigned char *buf, unsigned int step_size,
 		break;
 	}
 
-	if (eccsize_mult == 1)
-		code[2] =
-		    (invparity[par & 0xf0] << 7) |
-		    (invparity[par & 0x0f] << 6) |
-		    (invparity[par & 0xcc] << 5) |
-		    (invparity[par & 0x33] << 4) |
-		    (invparity[par & 0xaa] << 3) |
-		    (invparity[par & 0x55] << 2) |
-		    3;
-	else
-		code[2] =
-		    (invparity[par & 0xf0] << 7) |
-		    (invparity[par & 0x0f] << 6) |
-		    (invparity[par & 0xcc] << 5) |
-		    (invparity[par & 0x33] << 4) |
-		    (invparity[par & 0xaa] << 3) |
-		    (invparity[par & 0x55] << 2) |
-		    (invparity[rp17] << 1) |
-		    (invparity[rp16] << 0);
+	switch (ecc_order) {
+	case ECC_HAMMING_PL35X_ORDER:
+		code[2] = (invparity[rp16] << 7) |
+			  (invparity[rp14] << 6) |
+			  (invparity[rp12] << 5) |
+			  (invparity[rp10] << 4) |
+			  (invparity[rp8] << 3) |
+			  (invparity[rp6] << 2) |
+			  (invparity[rp4] << 1) |
+			  (invparity[rp2] << 0);
+		break;
+	case ECC_HAMMING_REGULAR_ORDER:
+	case ECC_HAMMING_SM_ORDER:
+		if (eccsize_mult == 1)
+			code[2] = (invparity[par & 0xf0] << 7) |
+				  (invparity[par & 0x0f] << 6) |
+				  (invparity[par & 0xcc] << 5) |
+				  (invparity[par & 0x33] << 4) |
+				  (invparity[par & 0xaa] << 3) |
+				  (invparity[par & 0x55] << 2) |
+				  3;
+		else
+			code[2] = (invparity[par & 0xf0] << 7) |
+				  (invparity[par & 0x0f] << 6) |
+				  (invparity[par & 0xcc] << 5) |
+				  (invparity[par & 0x33] << 4) |
+				  (invparity[par & 0xaa] << 3) |
+				  (invparity[par & 0x55] << 2) |
+				  (invparity[rp17] << 1) |
+				  (invparity[rp16] << 0);
+		break;
+	}
 
 	return 0;
 }
@@ -380,6 +411,7 @@ int ecc_sw_hamming_correct(unsigned char *buf, unsigned char *read_ecc,
 {
 	const u32 eccsize_mult = step_size >> 8;
 	unsigned char b0, b1, b2, bit_addr;
+	bool single_bit_err = false;
 	unsigned int byte_addr;
 
 	/*
@@ -388,6 +420,7 @@ int ecc_sw_hamming_correct(unsigned char *buf, unsigned char *read_ecc,
 	 * so keep them in a local var
 	*/
 	switch (ecc_order) {
+	case ECC_HAMMING_PL35X_ORDER:
 	case ECC_HAMMING_SM_ORDER:
 		b0 = read_ecc[0] ^ calc_ecc[0];
 		b1 = read_ecc[1] ^ calc_ecc[1];
@@ -407,33 +440,60 @@ int ecc_sw_hamming_correct(unsigned char *buf, unsigned char *read_ecc,
 	if ((b0 | b1 | b2) == 0)
 		return 0;	/* no error */
 
-	if ((((b0 ^ (b0 >> 1)) & 0x55) == 0x55) &&
-	    (((b1 ^ (b1 >> 1)) & 0x55) == 0x55) &&
-	    ((eccsize_mult == 1 && ((b2 ^ (b2 >> 1)) & 0x54) == 0x54) ||
-	     (eccsize_mult == 2 && ((b2 ^ (b2 >> 1)) & 0x55) == 0x55))) {
 	/* single bit error */
-		/*
-		 * rp17/rp15/13/11/9/7/5/3/1 indicate which byte is the faulty
-		 * byte, cp 5/3/1 indicate the faulty bit.
-		 * A lookup table (called addressbits) is used to filter
-		 * the bits from the byte they are in.
-		 * A marginal optimisation is possible by having three
-		 * different lookup tables.
-		 * One as we have now (for b0), one for b2
-		 * (that would avoid the >> 1), and one for b1 (with all values
-		 * << 4). However it was felt that introducing two more tables
-		 * hardly justify the gain.
-		 *
-		 * The b2 shift is there to get rid of the lowest two bits.
-		 * We could also do addressbits[b2] >> 1 but for the
-		 * performance it does not make any difference
-		 */
-		if (eccsize_mult == 1)
-			byte_addr = (addressbits[b1] << 4) + addressbits[b0];
-		else
-			byte_addr = (addressbits[b2 & 0x3] << 8) +
-				    (addressbits[b1] << 4) + addressbits[b0];
-		bit_addr = addressbits[b2 >> 2];
+	/*
+	 * rp17/rp15/13/11/9/7/5/3/1 indicate which byte is the faulty
+	 * byte, cp 5/3/1 indicate the faulty bit.
+	 */
+	switch (ecc_order) {
+	case ECC_HAMMING_SM_ORDER:
+	case ECC_HAMMING_REGULAR_ORDER:
+		if ((((b0 ^ (b0 >> 1)) & 0x55) == 0x55) &&
+		    (((b1 ^ (b1 >> 1)) & 0x55) == 0x55) &&
+		    ((eccsize_mult == 1 && ((b2 ^ (b2 >> 1)) & 0x54) == 0x54) ||
+		     (eccsize_mult == 2 && ((b2 ^ (b2 >> 1)) & 0x55) == 0x55))) {
+			single_bit_err = true;
+			/*
+			 * A lookup table (called addressbits) is used to filter
+			 * the bits from the byte they are in.
+			 * A marginal optimisation is possible by having three
+			 * different lookup tables.
+			 * One as we have now (for b0), one for b2
+			 * (that would avoid the >> 1), and one for b1 (with all values
+			 * << 4). However it was felt that introducing two more tables
+			 * hardly justify the gain.
+			 *
+			 * The b2 shift is there to get rid of the lowest two bits.
+			 * We could also do addressbits[b2] >> 1 but for the
+			 * performance it does not make any difference
+			 */
+			if (eccsize_mult == 1)
+				byte_addr = (addressbits[b1] << 4) + addressbits[b0];
+			else
+				byte_addr = (addressbits[b2 & 0x3] << 8) +
+					    (addressbits[b1] << 4) + addressbits[b0];
+			bit_addr = addressbits[b2 >> 2];
+		}
+		break;
+	case ECC_HAMMING_PL35X_ORDER:
+		if (((((b0 >> 4) ^ b2) & 0xF) == 0xF) &&
+		    ((((b1 >> 4) ^ b0) & 0xF) == 0xF) &&
+		    ((((b2 >> 4) ^ b1) & 0xF) == 0xF)) {
+			single_bit_err = true;
+			/*
+			 * We can't use the addressbits table here because the
+			 * bit ordering in the ECC bytes has nothing to do with
+			 * the other ordering
+			 */
+			byte_addr = (b0 >> 3) & 0xF;
+			byte_addr |= (b0 >> 7) & 0x10;
+			byte_addr |= (b1 << 5) & 0x1e0;
+			bit_addr = b0 & 0x7;
+		}
+		break;
+	}
+
+	if (single_bit_err) {
 		/* flip the bit */
 		buf[byte_addr] ^= (1 << bit_addr);
 		return 1;
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index f6b6a4fa2b1f..c04c3e74f661 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5658,6 +5658,8 @@ int rawnand_sw_hamming_init(struct nand_chip *chip)
 
 	if (chip->ecc.options & NAND_ECC_SOFT_HAMMING_SM_ORDER)
 		engine_conf->ecc_order = ECC_HAMMING_SM_ORDER;
+	else if (chip->ecc.options & NAND_ECC_SOFT_HAMMING_PL35X_ORDER)
+		engine_conf->ecc_order = ECC_HAMMING_PL35X_ORDER;
 	else
 		engine_conf->ecc_order = ECC_HAMMING_REGULAR_ORDER;
 
diff --git a/include/linux/mtd/nand-ecc-sw-hamming.h b/include/linux/mtd/nand-ecc-sw-hamming.h
index ac6f28f35f77..4a0e08dc7f04 100644
--- a/include/linux/mtd/nand-ecc-sw-hamming.h
+++ b/include/linux/mtd/nand-ecc-sw-hamming.h
@@ -15,6 +15,7 @@
 enum ecc_hamming_order {
 	ECC_HAMMING_REGULAR_ORDER = 0,
 	ECC_HAMMING_SM_ORDER,
+	ECC_HAMMING_PL35X_ORDER,
 };
 
 /**
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 5c70e7bd3ed5..3658315752bf 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -113,10 +113,11 @@ struct gpio_desc;
  * When using software implementation of Hamming, we can specify which byte
  * ordering should be used.
  */
-#define NAND_ECC_SOFT_HAMMING_SM_ORDER	BIT(2)
+#define NAND_ECC_SOFT_HAMMING_SM_ORDER		BIT(2)
+#define NAND_ECC_SOFT_HAMMING_PL35X_ORDER	BIT(3)
 
 /* Chip has cache program function */
-#define NAND_CACHEPRG		BIT(3)
+#define NAND_CACHEPRG		BIT(4)
 /* Options valid for Samsung large page devices */
 #define NAND_SAMSUNG_LP_OPTIONS NAND_CACHEPRG
 

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
