Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by casper.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXWzg-0005Ek-2E
 for linux-mtd@lists.infradead.org; Thu, 03 Sep 2015 16:04:09 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Andrea Scian <rnd4@dave-tech.it>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [RESEND PATCH v3 1/5] mtd: nand: add nand_check_erased helper
 functions
Date: Thu,  3 Sep 2015 18:03:38 +0200
Message-Id: <1441296222-14989-2-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1441296222-14989-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1441296222-14989-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add two helper functions to help NAND controller drivers test whether a
specific NAND region is erased or not.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 128 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h     |   5 ++
 2 files changed, 133 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ceb68ca..a2687ea 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1101,6 +1101,134 @@ out:
 EXPORT_SYMBOL(nand_lock);
 
 /**
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
+		weight = hweight_long(*((unsigned long *)bitmap));
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
+/**
  * nand_read_page_raw - [INTERN] read raw page data without ecc
  * @mtd: mtd info structure
  * @chip: nand chip info structure
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 272f429..77affe9 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -1030,4 +1030,9 @@ struct nand_sdr_timings {
 
 /* get timing characteristics from ONFI timing mode. */
 const struct nand_sdr_timings *onfi_async_timing_mode_to_sdr_timings(int mode);
+
+int nand_check_erased_ecc_chunk(void *data, int datalen,
+				void *ecc, int ecclen,
+				void *extraoob, int extraooblen,
+				int threshold);
 #endif /* __LINUX_MTD_NAND_H */
-- 
1.9.1
