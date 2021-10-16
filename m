Return-Path: <SRS0=/XBI=PE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397E2C433F5
	for <linux-mtd@archiver.kernel.org>; Sat, 16 Oct 2021 13:24:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6E0A61163
	for <linux-mtd@archiver.kernel.org>; Sat, 16 Oct 2021 13:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6E0A61163
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pE26iBcOTPgUG1nkRX0h1pQZJh9M5uK4vXyCokdJ9iU=; b=EXRbQwQrcbQ7tE
	aQreFckscwMHZCUZXdnE83EhYLE4ctdQt20Le9XxqPMkiDHkhCw0MXE0Lc8njJD3YyKxtfxKL9ChB
	od5hZo3fdJKjhU0nA2F7/rb7T+b8/CEbS2Y4zWk0X7wifc2sNZ1BnjV0etleyxqoLZuRaONK7D2Ys
	ayNhn2GETLsn2jfBAGwkftZFEOhZtTfco8VT/jmujJLTGzF5wfe082YFd3cGH7U7WtsPZI7GatVo+
	Ymo26tf+G8ymLEez3hMWn0sI/3oqymFFw/wSAHTcHhXRZFVsQuPKmHY7yipO8BL4KuvUhp26Qb9vl
	yfs6y8XSfamVTOlfEZmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbjex-00Adzm-Vs; Sat, 16 Oct 2021 13:23:36 +0000
Received: from aposti.net ([89.234.176.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbjed-00Adw5-KN
 for linux-mtd@lists.infradead.org; Sat, 16 Oct 2021 13:23:17 +0000
From: Paul Cercueil <paul@crapouillou.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, list@opendingux.net,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 stable@vger.kernel.org
Subject: [PATCH v2 4/5] mtd: rawnand: Export nand_read_page_hwecc_oob_first()
Date: Sat, 16 Oct 2021 14:22:27 +0100
Message-Id: <20211016132228.40254-4-paul@crapouillou.net>
In-Reply-To: <20211016132228.40254-1-paul@crapouillou.net>
References: <20211016132228.40254-1-paul@crapouillou.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211016_062315_858969_D8BF20A8 
X-CRM114-Status: GOOD (  18.73  )
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

Move the function nand_read_page_hwecc_oob_first() (previously
nand_davinci_read_page_hwecc_oob_first()) to nand_base.c, and export it
as a GPL symbol, so that it can be used by more modules.

Cc: <stable@vger.kernel.org> # v5.2
Fixes: a0ac778eb82c ("mtd: rawnand: ingenic: Add support for the JZ4740")
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/mtd/nand/raw/davinci_nand.c | 69 +----------------------------
 drivers/mtd/nand/raw/nand_base.c    | 67 ++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h         |  2 +
 3 files changed, 70 insertions(+), 68 deletions(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index fe2511cdcae3..45fec8c192ab 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -371,73 +371,6 @@ static int nand_davinci_correct_4bit(struct nand_chip *chip, u_char *data,
 	return corrected;
 }
 
-/**
- * nand_davinci_read_page_hwecc_oob_first - Hardware ECC page read with ECC
- *                                          data read from OOB area
- * @chip: nand chip info structure
- * @buf: buffer to store read data
- * @oob_required: caller requires OOB data read to chip->oob_poi
- * @page: page number to read
- *
- * Hardware ECC for large page chips, which requires the ECC data to be
- * extracted from the OOB before the actual data is read.
- */
-static int nand_davinci_read_page_hwecc_oob_first(struct nand_chip *chip,
-						  uint8_t *buf,
-						  int oob_required, int page)
-{
-	struct mtd_info *mtd = nand_to_mtd(chip);
-	int i, eccsize = chip->ecc.size, ret;
-	int eccbytes = chip->ecc.bytes;
-	int eccsteps = chip->ecc.steps;
-	uint8_t *p = buf;
-	uint8_t *ecc_code = chip->ecc.code_buf;
-	unsigned int max_bitflips = 0;
-
-	/* Read the OOB area first */
-	ret = nand_read_oob_op(chip, page, 0, chip->oob_poi, mtd->oobsize);
-	if (ret)
-		return ret;
-
-	/* Move read cursor to start of page */
-	ret = nand_change_read_column_op(chip, 0, NULL, 0, false);
-	if (ret)
-		return ret;
-
-	ret = mtd_ooblayout_get_eccbytes(mtd, ecc_code, chip->oob_poi, 0,
-					 chip->ecc.total);
-	if (ret)
-		return ret;
-
-	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize) {
-		int stat;
-
-		chip->ecc.hwctl(chip, NAND_ECC_READ);
-
-		ret = nand_read_data_op(chip, p, eccsize, false, false);
-		if (ret)
-			return ret;
-
-		stat = chip->ecc.correct(chip, p, &ecc_code[i], NULL);
-		if (stat == -EBADMSG &&
-		    (chip->ecc.options & NAND_ECC_GENERIC_ERASED_CHECK)) {
-			/* check for empty pages with bitflips */
-			stat = nand_check_erased_ecc_chunk(p, eccsize,
-							   &ecc_code[i],
-							   eccbytes, NULL, 0,
-							   chip->ecc.strength);
-		}
-
-		if (stat < 0) {
-			mtd->ecc_stats.failed++;
-		} else {
-			mtd->ecc_stats.corrected += stat;
-			max_bitflips = max_t(unsigned int, max_bitflips, stat);
-		}
-	}
-	return max_bitflips;
-}
-
 /*----------------------------------------------------------------------*/
 
 /* An ECC layout for using 4-bit ECC with small-page flash, storing
@@ -647,7 +580,7 @@ static int davinci_nand_attach_chip(struct nand_chip *chip)
 			} else if (chunks == 4 || chunks == 8) {
 				mtd_set_ooblayout(mtd,
 						  nand_get_large_page_ooblayout());
-				chip->ecc.read_page = nand_davinci_read_page_hwecc_oob_first;
+				chip->ecc.read_page = nand_read_page_hwecc_oob_first;
 			} else {
 				return -EIO;
 			}
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 3d6c6e880520..113a2e9f43b1 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -3160,6 +3160,73 @@ static int nand_read_page_hwecc(struct nand_chip *chip, uint8_t *buf,
 	return max_bitflips;
 }
 
+/**
+ * nand_read_page_hwecc_oob_first - Hardware ECC page read with ECC
+ *                                  data read from OOB area
+ * @chip: nand chip info structure
+ * @buf: buffer to store read data
+ * @oob_required: caller requires OOB data read to chip->oob_poi
+ * @page: page number to read
+ *
+ * Hardware ECC for large page chips, which requires the ECC data to be
+ * extracted from the OOB before the actual data is read.
+ */
+int nand_read_page_hwecc_oob_first(struct nand_chip *chip, uint8_t *buf,
+				   int oob_required, int page)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	int i, eccsize = chip->ecc.size, ret;
+	int eccbytes = chip->ecc.bytes;
+	int eccsteps = chip->ecc.steps;
+	uint8_t *p = buf;
+	uint8_t *ecc_code = chip->ecc.code_buf;
+	unsigned int max_bitflips = 0;
+
+	/* Read the OOB area first */
+	ret = nand_read_oob_op(chip, page, 0, chip->oob_poi, mtd->oobsize);
+	if (ret)
+		return ret;
+
+	/* Move read cursor to start of page */
+	ret = nand_change_read_column_op(chip, 0, NULL, 0, false);
+	if (ret)
+		return ret;
+
+	ret = mtd_ooblayout_get_eccbytes(mtd, ecc_code, chip->oob_poi, 0,
+					 chip->ecc.total);
+	if (ret)
+		return ret;
+
+	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize) {
+		int stat;
+
+		chip->ecc.hwctl(chip, NAND_ECC_READ);
+
+		ret = nand_read_data_op(chip, p, eccsize, false, false);
+		if (ret)
+			return ret;
+
+		stat = chip->ecc.correct(chip, p, &ecc_code[i], NULL);
+		if (stat == -EBADMSG &&
+		    (chip->ecc.options & NAND_ECC_GENERIC_ERASED_CHECK)) {
+			/* check for empty pages with bitflips */
+			stat = nand_check_erased_ecc_chunk(p, eccsize,
+							   &ecc_code[i],
+							   eccbytes, NULL, 0,
+							   chip->ecc.strength);
+		}
+
+		if (stat < 0) {
+			mtd->ecc_stats.failed++;
+		} else {
+			mtd->ecc_stats.corrected += stat;
+			max_bitflips = max_t(unsigned int, max_bitflips, stat);
+		}
+	}
+	return max_bitflips;
+}
+EXPORT_SYMBOL_GPL(nand_read_page_hwecc_oob_first);
+
 /**
  * nand_read_page_syndrome - [REPLACEABLE] hardware ECC syndrome based page read
  * @chip: nand chip info structure
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index b2f9dd3cbd69..5b88cd51fadb 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1539,6 +1539,8 @@ int nand_read_data_op(struct nand_chip *chip, void *buf, unsigned int len,
 		      bool force_8bit, bool check_only);
 int nand_write_data_op(struct nand_chip *chip, const void *buf,
 		       unsigned int len, bool force_8bit);
+int nand_read_page_hwecc_oob_first(struct nand_chip *chip, uint8_t *buf,
+				   int oob_required, int page);
 
 /* Scan and identify a NAND device */
 int nand_scan_with_ids(struct nand_chip *chip, unsigned int max_chips,
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
