Return-Path: <SRS0=+O2D=RP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FD4C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 08:46:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3422E214AE
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 08:46:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MtOLdY8L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="D8w+qk0l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3422E214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zneTJ3QwGPOWKGJGeeQIx6zZWMikCj25VHRf9HUF+tw=; b=MtOLdY8LRoe2LL6o5LaD+gP2BX
	HAxQs9H/378TxDx8ENyLblluYZX3Z459bADNPnrf1B4Y6Ocfs9+i4Q3xvW1VxTNWDRzqY2mm+yu4F
	v0gaP3PbpT1RTksFx3xYzDil3WjJOCADYYtU+CerD627JmUazLiMQ5eY9bBPnNMmV94AMBQ9JXcVK
	t/sGfrX9Hx18kORQjVrd2M7yGux0SFMfRsjm3QxeEo0DXWn8JQwOaG5I7nudaCLTy2FsdY/An3zBE
	g5QWZgDmlS3plIRh573YVQODqFDKt9dxGv1hPeOakXKC8LIvtPpP4sav8iErDhGE8ZJ2CWM1rruUu
	ZsdipyTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3d3U-0001KB-Ai; Tue, 12 Mar 2019 08:46:36 +0000
Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3d2e-00007B-IY
 for linux-mtd@lists.infradead.org; Tue, 12 Mar 2019 08:45:48 +0000
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-09.nifty.com with ESMTP id x2C8j6Zc004092;
 Tue, 12 Mar 2019 17:45:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x2C8j6Zc004092
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1552380317;
 bh=OB+Je34CBXvI/Tvi8MqBviuF5fgs6TuosjQ9uD7FCmk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D8w+qk0lIXCyXCh9jmGAMWnAVjt5BelAUCKxXBnkYu1ElNeSbaubThuxsBNHT0kTp
 HU4iXE6uqauQYpRj5++f+ZzULKGaMWPcfHgEhPBD0ScGxHwmqgESvIHqVjWKyvT+Um
 IJ7umZOOIFC2cC2m9U97aCJsrWWB3Hs1kZNIuxifBmMRWf90Y1y7LzYZy3ZElK76oR
 W3VKBlny6O9jC5H7hypPJuItLHn9EpZNgW8CMGkwSFeoiwiBTzXqMe4tQLMltMM7Pf
 iPEQYvXlCtl3coNlpdmBtbCGlNQ2qnv/Rpd/eWiyWywI2aHN3B3gyHrh1F7fvZoY8O
 IDl3vfPNFUIgA==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 2/9] mtd: rawnand: denali: refactor syndrome layout
 handling for raw access
Date: Tue, 12 Mar 2019 17:44:43 +0900
Message-Id: <1552380290-19951-3-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552380290-19951-1-git-send-email-yamada.masahiro@socionext.com>
References: <1552380290-19951-1-git-send-email-yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_014544_988304_2D99366D 
X-CRM114-Status: GOOD (  22.03  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The Denali IP adopts the syndrome page layout (payload and ECC are
interleaved). The *_page_raw() and *_oob() callbacks are complicated
because they must hide the underlying layout used by the hardware,
and always return contiguous in-band and out-of-band data.

Currently, similar code is duplicated to reorganize the data layout.
For example, denali_read_page_raw() and denali_write_page_raw() look
almost the same.

The idea for refactoring is to split the code into two parts:
  [1] conversion of page layout
  [2] what to do at every ECC chunk boundary

For [1], I wrote denali_raw_payload_op() and denali_raw_oob_op().
They manipulate data for the Denali controller's specific page layout
of in-band, out-of-band, respectively.

The difference between write and read is just the operation at
ECC chunk boundaries. For example, denali_read_oob() calls
nand_change_read_column_op(), whereas denali_write_oob() calls
nand_change_write_column_op(). So, I implemented [2] as a callback
passed into [1].

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3:
  - Add comments to denali_raw_payload_op() and denali_oob_payload_op()

Changes in v2: None

 drivers/mtd/nand/raw/denali.c | 380 +++++++++++++++++++++---------------------
 1 file changed, 189 insertions(+), 191 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index 4ac1314..ebeedbd 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -608,159 +608,236 @@ static int denali_data_xfer(struct nand_chip *chip, void *buf, size_t size,
 		return denali_pio_xfer(denali, buf, size, page, write);
 }
 
-static void denali_oob_xfer(struct mtd_info *mtd, struct nand_chip *chip,
-			    int page, int write)
+typedef int denali_change_column_callback(void *buf, unsigned int offset,
+					  unsigned int len, void *priv);
+
+/**
+ * denali_raw_payload_op() - arrange the payload data for syndrome layout
+ *
+ * The NAND framework passes the payload and ECC separately, but the Denali ECC
+ * engine cannot handle it directly because it writes/reads page data in the
+ * syndrome layout (payload and ECC are interleaved). This helper is useful to
+ * convert the layout between the two formats.
+ *
+ * @chip: NAND chip structure
+ * @buf:  buffer passed from the NAND framework
+ * @cb:   callback invoked whenever the column address is changed
+ * @priv: private data passed to @cb
+ */
+static int denali_raw_payload_op(struct nand_chip *chip, void *buf,
+				 denali_change_column_callback *cb, void *priv)
 {
-	struct denali_nand_info *denali = mtd_to_denali(mtd);
+	struct denali_nand_info *denali = to_denali(chip);
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
+	int writesize = mtd->writesize;
+	int oob_skip = denali->oob_skip_bytes;
+	int ret, i, pos, len;
+
+	for (i = 0; i < ecc->steps; i++) {
+		pos = i * (ecc->size + ecc->bytes);
+		len = ecc->size;
+
+		if (pos >= writesize) {
+			pos += oob_skip;
+		} else if (pos + len > writesize) {
+			/* This chunk overwraps the BBM area. Must be split */
+			ret = cb(buf, pos, writesize - pos, priv);
+			if (ret)
+				return ret;
+
+			buf += writesize - pos;
+			len -= writesize - pos;
+			pos = writesize + oob_skip;
+		}
+
+		ret = cb(buf, pos, len, priv);
+		if (ret)
+			return ret;
+
+		buf += len;
+	}
+
+	return 0;
+}
+
+/**
+ * denali_raw_oob_op() - arrange the oob data for syndrome layout
+ *
+ * The NAND framework passes the payload and ECC separately, but the Denali ECC
+ * engine cannot handle it directly because it writes/reads page data in the
+ * syndrome layout (payload and ECC are interleaved). This helper is useful to
+ * convert the layout between the two formats.
+ *
+ * @chip: NAND chip structure
+ * @buf:  buffer passed from the NAND framework
+ * @cb:   callback invoked whenever the column address is changed
+ * @priv: private data passed to @cb
+ */
+static int denali_raw_oob_op(struct nand_chip *chip, void *buf,
+			     denali_change_column_callback *cb, void *priv)
+{
+	struct denali_nand_info *denali = to_denali(chip);
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	int writesize = mtd->writesize;
 	int oobsize = mtd->oobsize;
-	uint8_t *bufpoi = chip->oob_poi;
-	int ecc_steps = chip->ecc.steps;
-	int ecc_size = chip->ecc.size;
-	int ecc_bytes = chip->ecc.bytes;
 	int oob_skip = denali->oob_skip_bytes;
-	size_t size = writesize + oobsize;
-	int i, pos, len;
+	int ret, i, pos, len;
 
 	/* BBM at the beginning of the OOB area */
-	if (write)
-		nand_prog_page_begin_op(chip, page, writesize, bufpoi,
-					oob_skip);
-	else
-		nand_read_page_op(chip, page, writesize, bufpoi, oob_skip);
-	bufpoi += oob_skip;
+	ret = cb(buf, writesize, oob_skip, priv);
+	if (ret)
+		return ret;
 
-	/* OOB ECC */
-	for (i = 0; i < ecc_steps; i++) {
-		pos = ecc_size + i * (ecc_size + ecc_bytes);
-		len = ecc_bytes;
+	buf += oob_skip;
 
-		if (pos >= writesize)
-			pos += oob_skip;
-		else if (pos + len > writesize)
-			len = writesize - pos;
+	for (i = 0; i < ecc->steps; i++) {
+		pos = ecc->size + i * (ecc->size + ecc->bytes);
 
-		if (write)
-			nand_change_write_column_op(chip, pos, bufpoi, len,
-						    false);
+		if (i == ecc->steps - 1)
+			/* The last chunk includes OOB free */
+			len = writesize + oobsize - pos - oob_skip;
 		else
-			nand_change_read_column_op(chip, pos, bufpoi, len,
-						   false);
-		bufpoi += len;
-		if (len < ecc_bytes) {
-			len = ecc_bytes - len;
-			if (write)
-				nand_change_write_column_op(chip, writesize +
-							    oob_skip, bufpoi,
-							    len, false);
-			else
-				nand_change_read_column_op(chip, writesize +
-							   oob_skip, bufpoi,
-							   len, false);
-			bufpoi += len;
+			len = ecc->bytes;
+
+		if (pos >= writesize) {
+			pos += oob_skip;
+		} else if (pos + len > writesize) {
+			/* This chunk overwraps the BBM area. Must be split */
+			ret = cb(buf, pos, writesize - pos, priv);
+			if (ret)
+				return ret;
+
+			buf += writesize - pos;
+			len -= writesize - pos;
+			pos = writesize + oob_skip;
 		}
+
+		ret = cb(buf, pos, len, priv);
+		if (ret)
+			return ret;
+
+		buf += len;
 	}
 
-	/* OOB free */
-	len = oobsize - (bufpoi - chip->oob_poi);
-	if (write)
-		nand_change_write_column_op(chip, size - len, bufpoi, len,
-					    false);
-	else
-		nand_change_read_column_op(chip, size - len, bufpoi, len,
-					   false);
+	return 0;
+}
+
+static int denali_memcpy_in(void *buf, unsigned int offset, unsigned int len,
+			    void *priv)
+{
+	memcpy(buf, priv + offset, len);
+	return 0;
 }
 
 static int denali_read_page_raw(struct nand_chip *chip, uint8_t *buf,
 				int oob_required, int page)
 {
+	struct denali_nand_info *denali = to_denali(chip);
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	int writesize = mtd->writesize;
-	int oobsize = mtd->oobsize;
-	int ecc_steps = chip->ecc.steps;
-	int ecc_size = chip->ecc.size;
-	int ecc_bytes = chip->ecc.bytes;
 	void *tmp_buf = denali->buf;
-	int oob_skip = denali->oob_skip_bytes;
-	size_t size = writesize + oobsize;
-	int ret, i, pos, len;
+	size_t size = mtd->writesize + mtd->oobsize;
+	int ret;
+
+	if (!buf)
+		return -EINVAL;
 
 	ret = denali_data_xfer(chip, tmp_buf, size, page, 1, 0);
 	if (ret)
 		return ret;
 
-	/* Arrange the buffer for syndrome payload/ecc layout */
-	if (buf) {
-		for (i = 0; i < ecc_steps; i++) {
-			pos = i * (ecc_size + ecc_bytes);
-			len = ecc_size;
-
-			if (pos >= writesize)
-				pos += oob_skip;
-			else if (pos + len > writesize)
-				len = writesize - pos;
-
-			memcpy(buf, tmp_buf + pos, len);
-			buf += len;
-			if (len < ecc_size) {
-				len = ecc_size - len;
-				memcpy(buf, tmp_buf + writesize + oob_skip,
-				       len);
-				buf += len;
-			}
-		}
-	}
+	ret = denali_raw_payload_op(chip, buf, denali_memcpy_in, tmp_buf);
+	if (ret)
+		return ret;
 
 	if (oob_required) {
-		uint8_t *oob = chip->oob_poi;
-
-		/* BBM at the beginning of the OOB area */
-		memcpy(oob, tmp_buf + writesize, oob_skip);
-		oob += oob_skip;
-
-		/* OOB ECC */
-		for (i = 0; i < ecc_steps; i++) {
-			pos = ecc_size + i * (ecc_size + ecc_bytes);
-			len = ecc_bytes;
-
-			if (pos >= writesize)
-				pos += oob_skip;
-			else if (pos + len > writesize)
-				len = writesize - pos;
-
-			memcpy(oob, tmp_buf + pos, len);
-			oob += len;
-			if (len < ecc_bytes) {
-				len = ecc_bytes - len;
-				memcpy(oob, tmp_buf + writesize + oob_skip,
-				       len);
-				oob += len;
-			}
-		}
-
-		/* OOB free */
-		len = oobsize - (oob - chip->oob_poi);
-		memcpy(oob, tmp_buf + size - len, len);
+		ret = denali_raw_oob_op(chip, chip->oob_poi, denali_memcpy_in,
+					tmp_buf);
+		if (ret)
+			return ret;
 	}
 
 	return 0;
 }
 
-static int denali_read_oob(struct nand_chip *chip, int page)
+static int denali_memcpy_out(void *buf, unsigned int offset, unsigned int len,
+			     void *priv)
 {
+	memcpy(priv + offset, buf, len);
+	return 0;
+}
+
+static int denali_write_page_raw(struct nand_chip *chip, const uint8_t *buf,
+				 int oob_required, int page)
+{
+	struct denali_nand_info *denali = to_denali(chip);
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	void *tmp_buf = denali->buf;
+	size_t size = mtd->writesize + mtd->oobsize;
+	int ret;
 
-	denali_oob_xfer(mtd, chip, page, 0);
+	if (!buf)
+		return -EINVAL;
 
-	return 0;
+	/*
+	 * Fill the buffer with 0xff first except the full page transfer.
+	 * This simplifies the logic.
+	 */
+	if (!oob_required)
+		memset(tmp_buf, 0xff, size);
+
+	ret = denali_raw_payload_op(chip, (void *)buf, denali_memcpy_out,
+				    tmp_buf);
+	if (ret)
+		return ret;
+
+	if (oob_required) {
+		ret = denali_raw_oob_op(chip, chip->oob_poi, denali_memcpy_out,
+					tmp_buf);
+		if (ret)
+			return ret;
+	}
+
+	return denali_data_xfer(chip, tmp_buf, size, page, 1, 1);
+}
+
+static int denali_change_read_column_op(void *buf, unsigned int offset,
+					unsigned int len, void *priv)
+{
+	return nand_change_read_column_op(priv, offset, buf, len, false);
+}
+
+static int denali_read_oob(struct nand_chip *chip, int page)
+{
+	int ret;
+
+	ret = nand_read_page_op(chip, page, 0, NULL, 0);
+	if (ret)
+		return ret;
+
+	return denali_raw_oob_op(chip, chip->oob_poi,
+				 denali_change_read_column_op, chip);
+}
+
+static int denali_change_write_column_op(void *buf, unsigned int offset,
+					 unsigned int len, void *priv)
+{
+	return nand_change_write_column_op(priv, offset, buf, len, false);
 }
 
 static int denali_write_oob(struct nand_chip *chip, int page)
 {
-	struct mtd_info *mtd = nand_to_mtd(chip);
+	int ret;
+
+	ret = nand_prog_page_begin_op(chip, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
-	denali_oob_xfer(mtd, chip, page, 1);
+	ret = denali_raw_oob_op(chip, chip->oob_poi,
+				denali_change_write_column_op, chip);
+	if (ret)
+		return ret;
 
 	return nand_prog_page_end_op(chip);
 }
@@ -798,85 +875,6 @@ static int denali_read_page(struct nand_chip *chip, uint8_t *buf,
 	return stat;
 }
 
-static int denali_write_page_raw(struct nand_chip *chip, const uint8_t *buf,
-				 int oob_required, int page)
-{
-	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	int writesize = mtd->writesize;
-	int oobsize = mtd->oobsize;
-	int ecc_steps = chip->ecc.steps;
-	int ecc_size = chip->ecc.size;
-	int ecc_bytes = chip->ecc.bytes;
-	void *tmp_buf = denali->buf;
-	int oob_skip = denali->oob_skip_bytes;
-	size_t size = writesize + oobsize;
-	int i, pos, len;
-
-	/*
-	 * Fill the buffer with 0xff first except the full page transfer.
-	 * This simplifies the logic.
-	 */
-	if (!buf || !oob_required)
-		memset(tmp_buf, 0xff, size);
-
-	/* Arrange the buffer for syndrome payload/ecc layout */
-	if (buf) {
-		for (i = 0; i < ecc_steps; i++) {
-			pos = i * (ecc_size + ecc_bytes);
-			len = ecc_size;
-
-			if (pos >= writesize)
-				pos += oob_skip;
-			else if (pos + len > writesize)
-				len = writesize - pos;
-
-			memcpy(tmp_buf + pos, buf, len);
-			buf += len;
-			if (len < ecc_size) {
-				len = ecc_size - len;
-				memcpy(tmp_buf + writesize + oob_skip, buf,
-				       len);
-				buf += len;
-			}
-		}
-	}
-
-	if (oob_required) {
-		const uint8_t *oob = chip->oob_poi;
-
-		/* BBM at the beginning of the OOB area */
-		memcpy(tmp_buf + writesize, oob, oob_skip);
-		oob += oob_skip;
-
-		/* OOB ECC */
-		for (i = 0; i < ecc_steps; i++) {
-			pos = ecc_size + i * (ecc_size + ecc_bytes);
-			len = ecc_bytes;
-
-			if (pos >= writesize)
-				pos += oob_skip;
-			else if (pos + len > writesize)
-				len = writesize - pos;
-
-			memcpy(tmp_buf + pos, oob, len);
-			oob += len;
-			if (len < ecc_bytes) {
-				len = ecc_bytes - len;
-				memcpy(tmp_buf + writesize + oob_skip, oob,
-				       len);
-				oob += len;
-			}
-		}
-
-		/* OOB free */
-		len = oobsize - (oob - chip->oob_poi);
-		memcpy(tmp_buf + size - len, oob, len);
-	}
-
-	return denali_data_xfer(chip, tmp_buf, size, page, 1, 1);
-}
-
 static int denali_write_page(struct nand_chip *chip, const uint8_t *buf,
 			     int oob_required, int page)
 {
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
