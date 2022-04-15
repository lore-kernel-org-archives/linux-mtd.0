Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1A7C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Apr 2022 03:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jy32tHGbhwrByf+ma9CxoyEbZfOqsHQTxAuHZYPMCok=; b=w0I9fu3vY+NHZv
	IWc8t4wof1GkZF67LUOchkvaBBUb292o27RrylFv2AtkKF+XsHjisj70KQyWotAV1LlDO2Y6PUK4o
	syggsgZzpKtgr+Ocbs/+GQCppYVvA9WNdGWByrOm14AcJt2nDdQHSoOUogbD9Rm83vg0lURywWHK4
	J0wKSGS/5Xoifr2tNGzmlRdtTpwPSWM/+JpY50gOTiXHe/LMLoqljsMY5iPM/2Wc4/c6+BRghOWlv
	qSZS6s2P8TilYmxexLzML8IV56ivBlr9L3Gz7FprLyclcz36g4oMUMlQsslqk1Ynv2wblaN3iMUQ3
	ghkuqMgrmlvrLIZ7bO1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfCxE-008Gzy-AI; Fri, 15 Apr 2022 03:49:04 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfCxA-008Gxm-9m
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2022 03:49:02 +0000
Received: by mail-pg1-x52e.google.com with SMTP id h5so6390781pgc.7
 for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2022 20:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DIl3AqikPZER6I4mKf6gSASG8Lh6vs6cR1nnnXqOKQY=;
 b=MJXz4Ho7xuiIss/oargKVAqXgRQvvxUMc7y2EqJpUpzb7Y7plRzjCGbmTSSFs8dhbF
 7URwyO+mQhwckawTecF2qPgg3qv7XOFYUsm8pY5fPyFsmkm27f/XTVe7FtpzOjJDtK3P
 1rBqqJQDNDgsyFAl9i8LgyoWFQWblXWNGjufCgmy9n6863WjOf/fL7LDES3k0aF3U8Xg
 Hv4EZa3CENbXIAhh+QW3OQjAYLwxi1f4CbTYcqlqkGsAGMNquPRYhwJ19OuZ8pKHHgQ6
 4wd9uHexkeZf4OzF2Dh944pq72Wgjzr7/E5H1dbSPUgQsRZK2EoZT5red5IqGX1isl6O
 3iAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DIl3AqikPZER6I4mKf6gSASG8Lh6vs6cR1nnnXqOKQY=;
 b=CEZgOJslE5q3ypKjqdHThP0sdMiJEjB6TX+sJd6cqpMQy9IVNh3Q5y3cOgdz/GtqxC
 ocNA6mvG53/9yReNJ+a6a8KvBeYK2WDfkJJvIcRW+Ywa2JNPXBoHXudZ1EyGlf8JRaxx
 ZtJlRdW6ObHBIrF0IsRR6AUDhH2iN3lTAakdLZZnSEGouBwGXBvq1aaI8qDZ03ChArOF
 Ndvv2Ycvz19lArq6XQe0ki/7ockp6CC3VMgXQfF9QLqtwve6G5kXJGUizrpJ6PI25cm8
 uqNZ6H6cYdfUbCEkrtRGucpHtbUuelpvrwOZ4WvGU7ZbHZgQNue9lAFXK7mQd/FsJ5DE
 yYWA==
X-Gm-Message-State: AOAM532LZkPNSOCDjhrzloH1UTMV956tag/zhFQ8HCxCGJRsotIpEJMp
 0j5cspk39Yfe9LVGWhjD+TNErktBTFI2Hg==
X-Google-Smtp-Source: ABdhPJwS+c+KhGwtHbJN3xlH20Hs/O2VnEsfuanibjXw1qDcTJlSqXCpnCd0R5Xk+F3Ol12lSl+h0A==
X-Received: by 2002:a63:64c5:0:b0:3a0:8b4:70ca with SMTP id
 y188-20020a6364c5000000b003a008b470camr4716406pgb.449.1649994538317; 
 Thu, 14 Apr 2022 20:48:58 -0700 (PDT)
Received: from guoguo-omen.lan ([2401:c080:1400:4da2:b701:47d5:9291:4cf9])
 by smtp.gmail.com with ESMTPSA id
 ng17-20020a17090b1a9100b001c9f79927bfsm7426380pjb.25.2022.04.14.20.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 20:48:57 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Chuanhong Guo <gch981213@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Mark Brown <broonie@kernel.org>, Daniel Palmer <daniel@0x0f.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/3] mtd: nand: extract some onfi functions to nandcore
Date: Fri, 15 Apr 2022 11:48:42 +0800
Message-Id: <20220415034844.1024538-2-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415034844.1024538-1-gch981213@gmail.com>
References: <20220415034844.1024538-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_204900_392470_965C2C23 
X-CRM114-Status: GOOD (  27.71  )
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

These functions will be shared between raw nand and spi nand.
Extract them into mtd/nand/onfi.c.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
Change since v1: new patch

 drivers/mtd/nand/Makefile         |   2 +-
 drivers/mtd/nand/onfi.c           | 115 ++++++++++++++++++++++++++++++
 drivers/mtd/nand/raw/internals.h  |   1 -
 drivers/mtd/nand/raw/nand_base.c  |  18 -----
 drivers/mtd/nand/raw/nand_jedec.c |   4 +-
 drivers/mtd/nand/raw/nand_onfi.c  |  70 ++----------------
 include/linux/mtd/onfi.h          |   8 +++
 7 files changed, 130 insertions(+), 88 deletions(-)
 create mode 100644 drivers/mtd/nand/onfi.c

diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 19e1291ac4d5..4251be5e655d 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-nandcore-objs := core.o bbt.o
+nandcore-objs := core.o bbt.o onfi.o
 obj-$(CONFIG_MTD_NAND_CORE) += nandcore.o
 obj-$(CONFIG_MTD_NAND_ECC_MEDIATEK) += ecc-mtk.o
 
diff --git a/drivers/mtd/nand/onfi.c b/drivers/mtd/nand/onfi.c
new file mode 100644
index 000000000000..bc8020cf70a9
--- /dev/null
+++ b/drivers/mtd/nand/onfi.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ONFI helpers shared between raw nand and spi nand support
+ */
+#include <linux/mtd/onfi.h>
+
+/**
+ * onfi_bit_wise_majority() - recover data from multiple copies using bit-wise
+ *			      majority
+ *
+ * @srcbufs: array of pointers to multiple copies
+ * @nsrcbufs: number of copies
+ * @dstbuf: pointer to the destination buffer
+ * @bufsize: length of data to recover
+ */
+void onfi_bit_wise_majority(const void **srcbufs, unsigned int nsrcbufs,
+			    void *dstbuf, unsigned int bufsize)
+{
+	int i, j, k;
+
+	for (i = 0; i < bufsize; i++) {
+		u8 val = 0;
+
+		for (j = 0; j < 8; j++) {
+			unsigned int cnt = 0;
+
+			for (k = 0; k < nsrcbufs; k++) {
+				const u8 *srcbuf = srcbufs[k];
+
+				if (srcbuf[i] & BIT(j))
+					cnt++;
+			}
+
+			if (cnt > nsrcbufs / 2)
+				val |= BIT(j);
+		}
+
+		((u8 *)dstbuf)[i] = val;
+	}
+}
+EXPORT_SYMBOL_GPL(onfi_bit_wise_majority);
+
+/**
+ * onfi_crc16() - calculate CRC16 in ONFI parameter page
+ * @crc: value to start with
+ * @p: data buffer
+ * @len: length of the data
+ */
+u16 onfi_crc16(u16 crc, u8 const *p, size_t len)
+{
+	int i;
+
+	while (len--) {
+		crc ^= *p++ << 8;
+		for (i = 0; i < 8; i++)
+			crc = (crc << 1) ^ ((crc & 0x8000) ? 0x8005 : 0);
+	}
+
+	return crc;
+}
+EXPORT_SYMBOL_GPL(onfi_crc16);
+
+/**
+ * onfi_parse_memorg() - parse nand memory organization from onfi parameters
+ * @p: ONFI parameters
+ * @memorg: nand memory organization struct to write to
+ */
+void onfi_parse_memorg(const struct nand_onfi_params *p,
+		       struct nand_memory_organization *memorg)
+{
+	memorg->pagesize = le32_to_cpu(p->byte_per_page);
+
+	/*
+	 * pages_per_block and blocks_per_lun may not be a power-of-2 size
+	 * (don't ask me who thought of this...). MTD assumes that these
+	 * dimensions will be power-of-2, so just truncate the remaining area.
+	 */
+	memorg->pages_per_eraseblock =
+		1 << (fls(le32_to_cpu(p->pages_per_block)) - 1);
+
+	memorg->oobsize = le16_to_cpu(p->spare_bytes_per_page);
+
+	memorg->luns_per_target = p->lun_count;
+	memorg->planes_per_lun = 1 << p->interleaved_bits;
+
+	/* See erasesize comment */
+	memorg->eraseblocks_per_lun =
+		1 << (fls(le32_to_cpu(p->blocks_per_lun)) - 1);
+	memorg->max_bad_eraseblocks_per_lun = le32_to_cpu(p->blocks_per_lun);
+	memorg->bits_per_cell = p->bits_per_cell;
+}
+EXPORT_SYMBOL_GPL(onfi_parse_memorg);
+
+/**
+ * onfi_sanitize_string() - Sanitize ONFI strings so we can safely print them
+ * @s: string to sanitize
+ * @len: length of the buffer
+ */
+void onfi_sanitize_string(uint8_t *s, size_t len)
+{
+	ssize_t i;
+
+	/* Null terminate */
+	s[len - 1] = 0;
+
+	/* Remove non printable chars */
+	for (i = 0; i < len - 1; i++) {
+		if (s[i] < ' ' || s[i] > 127)
+			s[i] = '?';
+	}
+
+	/* Remove trailing spaces */
+	strim(s);
+}
+EXPORT_SYMBOL_GPL(onfi_sanitize_string);
diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index 7016e0f38398..e41c7d6d2c69 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -110,7 +110,6 @@ int nand_read_param_page_op(struct nand_chip *chip, u8 page, void *buf,
 			    unsigned int len);
 void nand_decode_ext_id(struct nand_chip *chip);
 void panic_nand_wait(struct nand_chip *chip, unsigned long timeo);
-void sanitize_string(uint8_t *s, size_t len);
 
 static inline bool nand_has_exec_op(struct nand_chip *chip)
 {
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 6b67b7dfe7ce..b11b9042ff25 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4715,24 +4715,6 @@ static void nand_set_defaults(struct nand_chip *chip)
 		chip->buf_align = 1;
 }
 
-/* Sanitize ONFI strings so we can safely print them */
-void sanitize_string(uint8_t *s, size_t len)
-{
-	ssize_t i;
-
-	/* Null terminate */
-	s[len - 1] = 0;
-
-	/* Remove non printable chars */
-	for (i = 0; i < len - 1; i++) {
-		if (s[i] < ' ' || s[i] > 127)
-			s[i] = '?';
-	}
-
-	/* Remove trailing spaces */
-	strim(s);
-}
-
 /*
  * nand_id_has_period - Check if an ID string has a given wraparound period
  * @id_data: the ID string
diff --git a/drivers/mtd/nand/raw/nand_jedec.c b/drivers/mtd/nand/raw/nand_jedec.c
index 85b6d9372d80..e3fc59587da2 100644
--- a/drivers/mtd/nand/raw/nand_jedec.c
+++ b/drivers/mtd/nand/raw/nand_jedec.c
@@ -87,8 +87,8 @@ int nand_jedec_detect(struct nand_chip *chip)
 		goto free_jedec_param_page;
 	}
 
-	sanitize_string(p->manufacturer, sizeof(p->manufacturer));
-	sanitize_string(p->model, sizeof(p->model));
+	onfi_sanitize_string(p->manufacturer, sizeof(p->manufacturer));
+	onfi_sanitize_string(p->model, sizeof(p->model));
 	chip->parameters.model = kstrdup(p->model, GFP_KERNEL);
 	if (!chip->parameters.model) {
 		ret = -ENOMEM;
diff --git a/drivers/mtd/nand/raw/nand_onfi.c b/drivers/mtd/nand/raw/nand_onfi.c
index 7586befce7f9..1d5734942b08 100644
--- a/drivers/mtd/nand/raw/nand_onfi.c
+++ b/drivers/mtd/nand/raw/nand_onfi.c
@@ -18,18 +18,6 @@
 
 #define ONFI_PARAM_PAGES 3
 
-u16 onfi_crc16(u16 crc, u8 const *p, size_t len)
-{
-	int i;
-	while (len--) {
-		crc ^= *p++ << 8;
-		for (i = 0; i < 8; i++)
-			crc = (crc << 1) ^ ((crc & 0x8000) ? 0x8005 : 0);
-	}
-
-	return crc;
-}
-
 /* Parse the Extended Parameter Page. */
 static int nand_flash_detect_ext_param_page(struct nand_chip *chip,
 					    struct nand_onfi_params *p)
@@ -107,37 +95,6 @@ static int nand_flash_detect_ext_param_page(struct nand_chip *chip,
 	return ret;
 }
 
-/*
- * Recover data with bit-wise majority
- */
-static void nand_bit_wise_majority(const void **srcbufs,
-				   unsigned int nsrcbufs,
-				   void *dstbuf,
-				   unsigned int bufsize)
-{
-	int i, j, k;
-
-	for (i = 0; i < bufsize; i++) {
-		u8 val = 0;
-
-		for (j = 0; j < 8; j++) {
-			unsigned int cnt = 0;
-
-			for (k = 0; k < nsrcbufs; k++) {
-				const u8 *srcbuf = srcbufs[k];
-
-				if (srcbuf[i] & BIT(j))
-					cnt++;
-			}
-
-			if (cnt > nsrcbufs / 2)
-				val |= BIT(j);
-		}
-
-		((u8 *)dstbuf)[i] = val;
-	}
-}
-
 /*
  * Check if the NAND chip is ONFI compliant, returns 1 if it is, 0 otherwise.
  */
@@ -201,7 +158,7 @@ int nand_onfi_detect(struct nand_chip *chip)
 			srcbufs[j] = pbuf + j;
 
 		pr_warn("Could not find a valid ONFI parameter page, trying bit-wise majority to recover it\n");
-		nand_bit_wise_majority(srcbufs, ONFI_PARAM_PAGES, pbuf,
+		onfi_bit_wise_majority(srcbufs, ONFI_PARAM_PAGES, pbuf,
 				       sizeof(*pbuf));
 
 		crc = onfi_crc16(ONFI_CRC_BASE, (u8 *)pbuf, 254);
@@ -234,38 +191,19 @@ int nand_onfi_detect(struct nand_chip *chip)
 		goto free_onfi_param_page;
 	}
 
-	sanitize_string(p->manufacturer, sizeof(p->manufacturer));
-	sanitize_string(p->model, sizeof(p->model));
+	onfi_sanitize_string(p->manufacturer, sizeof(p->manufacturer));
+	onfi_sanitize_string(p->model, sizeof(p->model));
 	chip->parameters.model = kstrdup(p->model, GFP_KERNEL);
 	if (!chip->parameters.model) {
 		ret = -ENOMEM;
 		goto free_onfi_param_page;
 	}
 
-	memorg->pagesize = le32_to_cpu(p->byte_per_page);
+	onfi_parse_memorg(p, memorg);
 	mtd->writesize = memorg->pagesize;
-
-	/*
-	 * pages_per_block and blocks_per_lun may not be a power-of-2 size
-	 * (don't ask me who thought of this...). MTD assumes that these
-	 * dimensions will be power-of-2, so just truncate the remaining area.
-	 */
-	memorg->pages_per_eraseblock =
-			1 << (fls(le32_to_cpu(p->pages_per_block)) - 1);
 	mtd->erasesize = memorg->pages_per_eraseblock * memorg->pagesize;
-
-	memorg->oobsize = le16_to_cpu(p->spare_bytes_per_page);
 	mtd->oobsize = memorg->oobsize;
 
-	memorg->luns_per_target = p->lun_count;
-	memorg->planes_per_lun = 1 << p->interleaved_bits;
-
-	/* See erasesize comment */
-	memorg->eraseblocks_per_lun =
-		1 << (fls(le32_to_cpu(p->blocks_per_lun)) - 1);
-	memorg->max_bad_eraseblocks_per_lun = le32_to_cpu(p->blocks_per_lun);
-	memorg->bits_per_cell = p->bits_per_cell;
-
 	if (le16_to_cpu(p->features) & ONFI_FEATURE_16_BIT_BUS)
 		chip->options |= NAND_BUSWIDTH_16;
 
diff --git a/include/linux/mtd/onfi.h b/include/linux/mtd/onfi.h
index a7376f9beddf..728d9ee9dabe 100644
--- a/include/linux/mtd/onfi.h
+++ b/include/linux/mtd/onfi.h
@@ -12,6 +12,7 @@
 
 #include <linux/types.h>
 #include <linux/bitfield.h>
+#include <linux/mtd/nand.h>
 
 /* ONFI version bits */
 #define ONFI_VERSION_1_0		BIT(1)
@@ -186,4 +187,11 @@ struct onfi_params {
 	u8 vendor[88];
 };
 
+void onfi_bit_wise_majority(const void **srcbufs, unsigned int nsrcbufs,
+			    void *dstbuf, unsigned int bufsize);
+u16 onfi_crc16(u16 crc, u8 const *p, size_t len);
+void onfi_parse_memorg(const struct nand_onfi_params *p,
+		       struct nand_memory_organization *memorg);
+void onfi_sanitize_string(uint8_t *s, size_t len);
+
 #endif /* __LINUX_MTD_ONFI_H */
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
