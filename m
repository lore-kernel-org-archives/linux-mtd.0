Received: from mail-yx0-f202.google.com ([209.85.210.202])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MzlTE-0000B6-Vr
	for linux-mtd@lists.infradead.org; Mon, 19 Oct 2009 06:11:57 +0000
Received: by yxe40 with SMTP id 40so3735384yxe.28
	for <linux-mtd@lists.infradead.org>;
	Sun, 18 Oct 2009 23:11:51 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: Add __nand_calculate_ecc() to NAND ECC functions
Date: Mon, 19 Oct 2009 15:11:45 +0900
Message-Id: <1255932706-23824-1-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <>
References: <>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Akinobu Mita <akinobu.mita@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add __nand_calculate_ecc() which does not take struct mtd_info.
The built-in 256/512 software ECC calculation and correction tester
will use it.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/nand/nand_ecc.c  |   25 ++++++++++++++++++++-----
 include/linux/mtd/nand_ecc.h |    6 ++++++
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/nand_ecc.c
index db7ae9d..809fb53 100644
--- a/drivers/mtd/nand/nand_ecc.c
+++ b/drivers/mtd/nand/nand_ecc.c
@@ -150,20 +150,19 @@ static const char addressbits[256] = {
 };
 
 /**
- * nand_calculate_ecc - [NAND Interface] Calculate 3-byte ECC for 256/512-byte
+ * __nand_calculate_ecc - [NAND Interface] Calculate 3-byte ECC for 256/512-byte
  *			 block
- * @mtd:	MTD block structure
  * @buf:	input buffer with raw data
+ * @eccsize:	data bytes per ecc step (256 or 512)
  * @code:	output buffer with ECC
  */
-int nand_calculate_ecc(struct mtd_info *mtd, const unsigned char *buf,
+void __nand_calculate_ecc(const unsigned char *buf, unsigned int eccsize,
 		       unsigned char *code)
 {
 	int i;
 	const uint32_t *bp = (uint32_t *)buf;
 	/* 256 or 512 bytes/ecc  */
-	const uint32_t eccsize_mult =
-			(((struct nand_chip *)mtd->priv)->ecc.size) >> 8;
+	const uint32_t eccsize_mult = eccsize >> 8;
 	uint32_t cur;		/* current value in buffer */
 	/* rp0..rp15..rp17 are the various accumulated parities (per byte) */
 	uint32_t rp0, rp1, rp2, rp3, rp4, rp5, rp6, rp7;
@@ -412,6 +411,22 @@ int nand_calculate_ecc(struct mtd_info *mtd, const unsigned char *buf,
 		    (invparity[par & 0x55] << 2) |
 		    (invparity[rp17] << 1) |
 		    (invparity[rp16] << 0);
+}
+EXPORT_SYMBOL(__nand_calculate_ecc);
+
+/**
+ * nand_calculate_ecc - [NAND Interface] Calculate 3-byte ECC for 256/512-byte
+ *			 block
+ * @mtd:	MTD block structure
+ * @buf:	input buffer with raw data
+ * @code:	output buffer with ECC
+ */
+int nand_calculate_ecc(struct mtd_info *mtd, const unsigned char *buf,
+		       unsigned char *code)
+{
+	__nand_calculate_ecc(buf,
+			((struct nand_chip *)mtd->priv)->ecc.size, code);
+
 	return 0;
 }
 EXPORT_SYMBOL(nand_calculate_ecc);
diff --git a/include/linux/mtd/nand_ecc.h b/include/linux/mtd/nand_ecc.h
index 052ea8c..9cb10ff 100644
--- a/include/linux/mtd/nand_ecc.h
+++ b/include/linux/mtd/nand_ecc.h
@@ -16,6 +16,12 @@
 struct mtd_info;
 
 /*
+ * Calculate 3 byte ECC code for eccsize byte block
+ */
+void __nand_calculate_ecc(const u_char *dat, unsigned int eccsize,
+				u_char *ecc_code);
+
+/*
  * Calculate 3 byte ECC code for 256 byte block
  */
 int nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat, u_char *ecc_code);
-- 
1.5.4.3
