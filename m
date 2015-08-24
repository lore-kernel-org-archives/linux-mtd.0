Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZToNo-0004nx-Uz
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2015 09:49:41 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Andrea Scian <rnd4@dave-tech.it>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v2 1/2] mtd: nand: add nand_check_erased helper functions
Date: Mon, 24 Aug 2015 11:47:21 +0200
Message-Id: <1440409642-5495-2-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1440409642-5495-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1440409642-5495-1-git-send-email-boris.brezillon@free-electrons.com>
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
 drivers/mtd/nand/nand_base.c | 108 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h     |   8 ++++
 2 files changed, 116 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ceb68ca..4d2ef65 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1101,6 +1101,114 @@ out:
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
+ * Returns a positive number of bitflips or -ERROR_CODE.
+ */
+int nand_check_erased_buf(void *buf, int len, int bitflips_threshold)
+{
+	const unsigned char *bitmap = buf;
+	int bitflips = 0;
+	int weight;
+	int longs;
+
+	for (; len && ((unsigned long)bitmap) % sizeof(long);
+	     len--, bitmap++) {
+		weight = hweight8(*bitmap);
+		bitflips += BITS_PER_BYTE - weight;
+		if (unlikely(bitflips > bitflips_threshold))
+			return -EINVAL;
+	}
+
+
+	for (longs = len / sizeof(long); longs;
+	     longs--, bitmap += sizeof(long)) {
+		BUG_ON(longs >= INT_MAX / BITS_PER_LONG);
+		weight = hweight_long(*((unsigned long *)bitmap));
+		bitflips += BITS_PER_LONG - weight;
+		if (unlikely(bitflips > bitflips_threshold))
+			return -EINVAL;
+	}
+
+	len %= sizeof(long);
+
+	for (; len > 0; len--, bitmap++) {
+		weight = hweight8(*bitmap);
+		bitflips += BITS_PER_BYTE - weight;
+		if (unlikely(bitflips > bitflips_threshold))
+			return -EINVAL;
+	}
+
+	return bitflips;
+}
+EXPORT_SYMBOL(nand_check_erased_buf);
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
+ * Returns a positive number of bitflips or -ERROR_CODE.
+ */
+int nand_check_erased_ecc_chunk(void *data, int datalen,
+				void *ecc, int ecclen,
+				void *extraoob, int extraooblen,
+				int bitflips_threshold)
+{
+	int bitflips = 0;
+	int ret;
+
+	ret = nand_check_erased_buf(data, datalen, bitflips_threshold);
+	if (ret < 0)
+		return ret;
+
+	bitflips += ret;
+	bitflips_threshold -= ret;
+
+	ret = nand_check_erased_buf(ecc, ecclen, bitflips_threshold);
+	if (ret < 0)
+		return ret;
+
+	bitflips += ret;
+	bitflips_threshold -= ret;
+
+	ret = nand_check_erased_buf(extraoob, extraooblen, bitflips_threshold);
+	if (ret < 0)
+		return ret;
+
+	memset(data, 0xff, datalen);
+	memset(ecc, 0xff, ecclen);
+	memset(extraoob, 0xff, extraooblen);
+
+	return bitflips + ret;
+}
+EXPORT_SYMBOL(nand_check_erased_ecc_chunk);
+
+/**
  * nand_read_page_raw - [INTERN] read raw page data without ecc
  * @mtd: mtd info structure
  * @chip: nand chip info structure
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 272f429..ae06a07 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -1030,4 +1030,12 @@ struct nand_sdr_timings {
 
 /* get timing characteristics from ONFI timing mode. */
 const struct nand_sdr_timings *onfi_async_timing_mode_to_sdr_timings(int mode);
+
+int nand_check_erased_buf(void *data, int datalen,
+			  int threshold);
+
+int nand_check_erased_ecc_chunk(void *data, int datalen,
+				void *ecc, int ecclen,
+				void *extraoob, int extraooblen,
+				int threshold);
 #endif /* __LINUX_MTD_NAND_H */
-- 
1.9.1
