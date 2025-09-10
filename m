Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA4BCA101F
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 18:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3ImOTBNAqpC9cKgbpuSMSfP46cOH98luye568NsOLDg=; b=wfd9NyAQ9CTljE
	n0u3XH8Fzh8PyYm5+iiDs6t5MaAZoKPLHCTWD9t6ZDyS7t4umm7bAoLb0E8QtyERkYIDzc8zEn6hn
	WkfJ1FMl5U4qcNzik2P/pJ6KFMniGzREJBC9slJ5Hxsl+BR4ZEe7ddnaRh3r9jp6arGRvBkwTnpxH
	iurp78Y/83wcx07YosRuIYJOs7gVOa7vOGPQi5BMxuhQqhBI34jqwgl3m9rLj7dpCnEWmRTW4Q3sD
	T7V6Mx0S9KdDeKqd2EIX9npJ1vZa1uLLNybZ6mCum8lvmYMiE5eNTP7rBZKBQXqWKYV5h/weJppXt
	aEqL44sWwFeSJbDsPLRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwPdA-0000000G494-0Gca;
	Wed, 10 Sep 2025 18:33:20 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwPd4-0000000G47X-3gin
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 18:33:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1757529191; x=1758133991;
	i=markus.stockhausen@gmx.de;
	bh=q4VhR8jZRvdHhqLEd+z1Ag1bu6I3xXU8xlvLMcuJu9M=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ag4LbCnweRfcvQWqHDewH/hy3i6KPCgY9YYS7rIikBWs4mmuPr/H3d47MhKsVSfY
	 Zpc38+VzBKmSBVdrNNLR4w16D5rTnvs7tEVlmMsFWMbAXZuJ32X5ZDF32GFctO7cg
	 jVCNa+VZ58AFhUkgFThpEWxWzCAgp+24lefhc9iHsqMXde3HVfjHAtJhGDCxcQKUF
	 SlNEBuQaH8jMVJGwwRc28v/R7uDkn1AQlguNJHxZ/MpcerKZoU31b6uO1W1rlHl21
	 PYwOakIFN4plX0WRqOJhm0EYJpbvYBorQT05ItJjohDJyAKuJzY92Hc1MEkYJuRwo
	 wa6crg3xmIheIINA/A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from openwrt ([94.31.70.55]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N49h5-1uDyAo107t-00s4yp; Wed, 10
 Sep 2025 20:33:11 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH] mtd: nand: move nand_check_erased_ecc_chunk() to nand/core
Date: Wed, 10 Sep 2025 14:32:58 -0400
Message-ID: <20250910183258.1147296-1-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:occEOkjDkyIHQ2YuX9737gasKJCJva0+VQmEiYuobELC4RGS3TV
 U8jNka+lWEejbeEl+mcX6WRqm3cACNpN7Y8PRbh0X0r1GnQpWjTs9QJGcoYZiiz9GFT70CX
 cc8jrWwkSGlHjHtzRWK3Jlz9ujn5tXf6nYNdIKf3KSwqSh2TMuUocbeNhHc3Wis+H3n0YLl
 c/aUxvAY55MbiPNe+2VnA==
UI-OutboundReport: notjunk:1;M01:P0:XH8lKcVpSlo=;ej2A5ae+dOiNZdI+WquinQZyyJl 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 G8Jpy5E=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_113315_226746_E4344E73 
X-CRM114-Status: GOOD (  21.91  )
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

The check function for bitflips in erased blocks will be needed
by the Realtek ECC engine driver (which is currently under
development). Right now it is located in raw/nand_base.c.
While this is sufficient for the current usecases, there is
no real dependency for an ECC engine on the raw nand library.

Move the function over to a more generic place in core library.

Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
---
 drivers/mtd/nand/core.c          | 131 +++++++++++++++++++++++++++++++
 drivers/mtd/nand/raw/nand_base.c | 131 -------------------------------
 include/linux/mtd/nand.h         |   5 ++
 include/linux/mtd/rawnand.h      |   5 --
 4 files changed, 136 insertions(+), 136 deletions(-)

diff --git a/drivers/mtd/nand/core.c b/drivers/mtd/nand/core.c
index 7737b1a4a177..3e76d127715f 100644
--- a/drivers/mtd/nand/core.c
+++ b/drivers/mtd/nand/core.c
@@ -12,6 +12,137 @@
 #include <linux/module.h>
 #include <linux/mtd/nand.h>
 
+/**
+ * nand_check_erased_buf - check if a buffer contains (almost) only 0xff data
+ * @buf: buffer to test
+ * @len: buffer length
+ * @bitflips_threshold: maximum number of bitflips
+ *
+ * Check if a buffer contains only 0xff, which means the underlying region
+ * has been erased and is ready to be programmed.
+ * The bitflips_threshold specify the maximum number of bitflips before
+ * considering the region is not erased.
+ * Note: The logic of this function has been extracted from the memweight
+ * implementation, except that nand_check_erased_buf function exit before
+ * testing the whole buffer if the number of bitflips exceed the
+ * bitflips_threshold value.
+ *
+ * Returns a positive number of bitflips less than or equal to
+ * bitflips_threshold, or -ERROR_CODE for bitflips in excess of the
+ * threshold.
+ */
+static int nand_check_erased_buf(void *buf, int len, int bitflips_threshold)
+{
+	const unsigned char *bitmap = buf;
+	int bitflips = 0;
+	int weight;
+
+	for (; len && ((uintptr_t)bitmap) % sizeof(long);
+	     len--, bitmap++) {
+		weight = hweight8(*bitmap);
+		bitflips += BITS_PER_BYTE - weight;
+		if (unlikely(bitflips > bitflips_threshold))
+			return -EBADMSG;
+	}
+
+	for (; len >= sizeof(long);
+	     len -= sizeof(long), bitmap += sizeof(long)) {
+		unsigned long d = *((unsigned long *)bitmap);
+		if (d == ~0UL)
+			continue;
+		weight = hweight_long(d);
+		bitflips += BITS_PER_LONG - weight;
+		if (unlikely(bitflips > bitflips_threshold))
+			return -EBADMSG;
+	}
+
+	for (; len > 0; len--, bitmap++) {
+		weight = hweight8(*bitmap);
+		bitflips += BITS_PER_BYTE - weight;
+		if (unlikely(bitflips > bitflips_threshold))
+			return -EBADMSG;
+	}
+
+	return bitflips;
+}
+
+/**
+ * nand_check_erased_ecc_chunk - check if an ECC chunk contains (almost) only
+ *				 0xff data
+ * @data: data buffer to test
+ * @datalen: data length
+ * @ecc: ECC buffer
+ * @ecclen: ECC length
+ * @extraoob: extra OOB buffer
+ * @extraooblen: extra OOB length
+ * @bitflips_threshold: maximum number of bitflips
+ *
+ * Check if a data buffer and its associated ECC and OOB data contains only
+ * 0xff pattern, which means the underlying region has been erased and is
+ * ready to be programmed.
+ * The bitflips_threshold specify the maximum number of bitflips before
+ * considering the region as not erased.
+ *
+ * Note:
+ * 1/ ECC algorithms are working on pre-defined block sizes which are usually
+ *    different from the NAND page size. When fixing bitflips, ECC engines will
+ *    report the number of errors per chunk, and the NAND core infrastructure
+ *    expect you to return the maximum number of bitflips for the whole page.
+ *    This is why you should always use this function on a single chunk and
+ *    not on the whole page. After checking each chunk you should update your
+ *    max_bitflips value accordingly.
+ * 2/ When checking for bitflips in erased pages you should not only check
+ *    the payload data but also their associated ECC data, because a user might
+ *    have programmed almost all bits to 1 but a few. In this case, we
+ *    shouldn't consider the chunk as erased, and checking ECC bytes prevent
+ *    this case.
+ * 3/ The extraoob argument is optional, and should be used if some of your OOB
+ *    data are protected by the ECC engine.
+ *    It could also be used if you support subpages and want to attach some
+ *    extra OOB data to an ECC chunk.
+ *
+ * Returns a positive number of bitflips less than or equal to
+ * bitflips_threshold, or -ERROR_CODE for bitflips in excess of the
+ * threshold. In case of success, the passed buffers are filled with 0xff.
+ */
+int nand_check_erased_ecc_chunk(void *data, int datalen,
+				void *ecc, int ecclen,
+				void *extraoob, int extraooblen,
+				int bitflips_threshold)
+{
+	int data_bitflips = 0, ecc_bitflips = 0, extraoob_bitflips = 0;
+
+	data_bitflips = nand_check_erased_buf(data, datalen,
+					      bitflips_threshold);
+	if (data_bitflips < 0)
+		return data_bitflips;
+
+	bitflips_threshold -= data_bitflips;
+
+	ecc_bitflips = nand_check_erased_buf(ecc, ecclen, bitflips_threshold);
+	if (ecc_bitflips < 0)
+		return ecc_bitflips;
+
+	bitflips_threshold -= ecc_bitflips;
+
+	extraoob_bitflips = nand_check_erased_buf(extraoob, extraooblen,
+						  bitflips_threshold);
+	if (extraoob_bitflips < 0)
+		return extraoob_bitflips;
+
+	if (data_bitflips)
+		memset(data, 0xff, datalen);
+
+	if (ecc_bitflips)
+		memset(ecc, 0xff, ecclen);
+
+	if (extraoob_bitflips)
+		memset(extraoob, 0xff, extraooblen);
+
+	return data_bitflips + ecc_bitflips + extraoob_bitflips;
+}
+EXPORT_SYMBOL(nand_check_erased_ecc_chunk);
+
 /**
  * nanddev_isbad() - Check if a block is bad
  * @nand: NAND device
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 13e4060bd1b6..c7d9501f646b 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -2783,137 +2783,6 @@ int nand_set_features(struct nand_chip *chip, int addr,
 	return nand_set_features_op(chip, addr, subfeature_param);
 }
 
-/**
- * nand_check_erased_buf - check if a buffer contains (almost) only 0xff data
- * @buf: buffer to test
- * @len: buffer length
- * @bitflips_threshold: maximum number of bitflips
- *
- * Check if a buffer contains only 0xff, which means the underlying region
- * has been erased and is ready to be programmed.
- * The bitflips_threshold specify the maximum number of bitflips before
- * considering the region is not erased.
- * Note: The logic of this function has been extracted from the memweight
- * implementation, except that nand_check_erased_buf function exit before
- * testing the whole buffer if the number of bitflips exceed the
- * bitflips_threshold value.
- *
- * Returns a positive number of bitflips less than or equal to
- * bitflips_threshold, or -ERROR_CODE for bitflips in excess of the
- * threshold.
- */
-static int nand_check_erased_buf(void *buf, int len, int bitflips_threshold)
-{
-	const unsigned char *bitmap = buf;
-	int bitflips = 0;
-	int weight;
-
-	for (; len && ((uintptr_t)bitmap) % sizeof(long);
-	     len--, bitmap++) {
-		weight = hweight8(*bitmap);
-		bitflips += BITS_PER_BYTE - weight;
-		if (unlikely(bitflips > bitflips_threshold))
-			return -EBADMSG;
-	}
-
-	for (; len >= sizeof(long);
-	     len -= sizeof(long), bitmap += sizeof(long)) {
-		unsigned long d = *((unsigned long *)bitmap);
-		if (d == ~0UL)
-			continue;
-		weight = hweight_long(d);
-		bitflips += BITS_PER_LONG - weight;
-		if (unlikely(bitflips > bitflips_threshold))
-			return -EBADMSG;
-	}
-
-	for (; len > 0; len--, bitmap++) {
-		weight = hweight8(*bitmap);
-		bitflips += BITS_PER_BYTE - weight;
-		if (unlikely(bitflips > bitflips_threshold))
-			return -EBADMSG;
-	}
-
-	return bitflips;
-}
-
-/**
- * nand_check_erased_ecc_chunk - check if an ECC chunk contains (almost) only
- *				 0xff data
- * @data: data buffer to test
- * @datalen: data length
- * @ecc: ECC buffer
- * @ecclen: ECC length
- * @extraoob: extra OOB buffer
- * @extraooblen: extra OOB length
- * @bitflips_threshold: maximum number of bitflips
- *
- * Check if a data buffer and its associated ECC and OOB data contains only
- * 0xff pattern, which means the underlying region has been erased and is
- * ready to be programmed.
- * The bitflips_threshold specify the maximum number of bitflips before
- * considering the region as not erased.
- *
- * Note:
- * 1/ ECC algorithms are working on pre-defined block sizes which are usually
- *    different from the NAND page size. When fixing bitflips, ECC engines will
- *    report the number of errors per chunk, and the NAND core infrastructure
- *    expect you to return the maximum number of bitflips for the whole page.
- *    This is why you should always use this function on a single chunk and
- *    not on the whole page. After checking each chunk you should update your
- *    max_bitflips value accordingly.
- * 2/ When checking for bitflips in erased pages you should not only check
- *    the payload data but also their associated ECC data, because a user might
- *    have programmed almost all bits to 1 but a few. In this case, we
- *    shouldn't consider the chunk as erased, and checking ECC bytes prevent
- *    this case.
- * 3/ The extraoob argument is optional, and should be used if some of your OOB
- *    data are protected by the ECC engine.
- *    It could also be used if you support subpages and want to attach some
- *    extra OOB data to an ECC chunk.
- *
- * Returns a positive number of bitflips less than or equal to
- * bitflips_threshold, or -ERROR_CODE for bitflips in excess of the
- * threshold. In case of success, the passed buffers are filled with 0xff.
- */
-int nand_check_erased_ecc_chunk(void *data, int datalen,
-				void *ecc, int ecclen,
-				void *extraoob, int extraooblen,
-				int bitflips_threshold)
-{
-	int data_bitflips = 0, ecc_bitflips = 0, extraoob_bitflips = 0;
-
-	data_bitflips = nand_check_erased_buf(data, datalen,
-					      bitflips_threshold);
-	if (data_bitflips < 0)
-		return data_bitflips;
-
-	bitflips_threshold -= data_bitflips;
-
-	ecc_bitflips = nand_check_erased_buf(ecc, ecclen, bitflips_threshold);
-	if (ecc_bitflips < 0)
-		return ecc_bitflips;
-
-	bitflips_threshold -= ecc_bitflips;
-
-	extraoob_bitflips = nand_check_erased_buf(extraoob, extraooblen,
-						  bitflips_threshold);
-	if (extraoob_bitflips < 0)
-		return extraoob_bitflips;
-
-	if (data_bitflips)
-		memset(data, 0xff, datalen);
-
-	if (ecc_bitflips)
-		memset(ecc, 0xff, ecclen);
-
-	if (extraoob_bitflips)
-		memset(extraoob, 0xff, extraooblen);
-
-	return data_bitflips + ecc_bitflips + extraoob_bitflips;
-}
-EXPORT_SYMBOL(nand_check_erased_ecc_chunk);
-
 /**
  * nand_read_page_raw_notsupp - dummy read raw page function
  * @chip: nand chip info structure
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 07486168d104..09c8c93e4dba 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -1136,4 +1136,9 @@ static inline bool nanddev_bbt_is_initialized(struct nand_device *nand)
 int nanddev_mtd_erase(struct mtd_info *mtd, struct erase_info *einfo);
 int nanddev_mtd_max_bad_blocks(struct mtd_info *mtd, loff_t offs, size_t len);
 
+int nand_check_erased_ecc_chunk(void *data, int datalen,
+				void *ecc, int ecclen,
+				void *extraoob, int extraooblen,
+				int threshold);
+
 #endif /* __LINUX_MTD_NAND_H */
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index e84522e31301..d30bdc3fcfd7 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1519,11 +1519,6 @@ int rawnand_sw_bch_correct(struct nand_chip *chip, unsigned char *buf,
 			   unsigned char *read_ecc, unsigned char *calc_ecc);
 void rawnand_sw_bch_cleanup(struct nand_chip *chip);
 
-int nand_check_erased_ecc_chunk(void *data, int datalen,
-				void *ecc, int ecclen,
-				void *extraoob, int extraooblen,
-				int threshold);
-
 int nand_ecc_choose_conf(struct nand_chip *chip,
 			 const struct nand_ecc_caps *caps, int oobavail);
 
-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
