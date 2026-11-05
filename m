Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F26606A330
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 18:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WuP2san0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=E6cyViqp;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CVQWVc68
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JUySTkgZnqETq68wP7cTMPXWe8phS562BMscbIYXJ/Y=; b=WuP2san0HZEEv+mYnnti6deoUo
	0htbpXuujHFwB7QHUzzCPB0nPulwFRaV5NWXS6JzLSFypK/hlTudSkYGxjzdRsRGKOCDJlENt8sjQ
	PRKZ2YDNiNpsiwIPwrpZihEMYJWGyz4vqGzGoGMPd0mnSKmsdMcczyJAUyIOZKzP/MF6K/bRH0hhV
	B2D+BPONcg4MMGRUn0mBZkkOQuHk5+PUcL47/Rj1qwhjxKcI0ptXKuHtQ5yWgkg4xUOO7fSySQ9fj
	igoe7KypETkMP55jmxEn3CF3NYHejSv3BujQTo++9arwRxsHHOqHNRgq3I18TSkHW5ySBwzPSJkZa
	qDEGdzNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2eZ-0000000AETu-0vJh;
	Thu, 05 Nov 2026 18:57:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2cw-0000000ADT9-45m1
	for linux-mtd@bombadil.infradead.org;
	Thu, 05 Nov 2026 18:56:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=TewWxDRlBExCimd2doTjt5ku/ZOc7YaK3BqCExDTIIk=; b=E6cyViqp1dMTWexrGU99iStAkP
	E26amOXgOrEom9jbRUVosdcLX8HU4Ztk0a9wQrJMIYfhIjW1EpWr0ggTE5cOMH6eySkHCBgLi/eKw
	EShJ0VxH5Ckvyt5IO+mftgTlrn8xiMy+FhjL1b2kEkdMQD/q9edOfgXcebhmc8Wq8QUYqOZrf20YZ
	GO9dXJ/5xWD7cRGXNS1XQVGye4cp1CEHbxwj07QDekYniWhF5DEGpX3Kzq/dY270wvvRpM3m5w7Hy
	ZgwknLAC20ge+kx2VNIExZo/4I7lmFT6ujTu+apvpqW8uGSix96liMNl7AXuIXz3wbf00w4PZQTG+
	T7+/FD8w==;
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2cu-00000003R0Y-16RO
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 18:55:57 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-6de2f213b7aso1047853eaf.0
        for <linux-mtd@lists.infradead.org>; Thu, 05 Nov 2026 10:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904953; x=1794509753; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TewWxDRlBExCimd2doTjt5ku/ZOc7YaK3BqCExDTIIk=;
        b=CVQWVc68Ygt+z1K8ghIIwAZO7lqFtSzdCbB0aiLRMkpFJ2deYkLS1R0MmMDS8WuauL
         NO+l1jAK4XUZ3GqbhPSIHqfOih9KnnbmvCVhbAfaymQeZtE3qChrJMMmOqo4SGYPT2H8
         sNS4ka5TkdlTPYUnvGjZqE1RGOdLyXY5FSbvmQoYJD4+qxuO4YnqVIeB7B1o5rhl49F4
         Vj0xELCYvvZrxyouQfSWuhEN/EYODT3BuSn9EKTuyaZdcYKXOo1dVYvA2EjB/zh2TzMz
         cBhOQvifdUORInr3zTWvZlEC7aWUM+apywhnIZp00Thomd8tTudWMUivv3GHHjEhTKs8
         avlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904953; x=1794509753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TewWxDRlBExCimd2doTjt5ku/ZOc7YaK3BqCExDTIIk=;
        b=I4316E+XYBsTQytNycS26tbafbLTFcmzpEQobFsPz9ua39gq9mcM7Wbq5KQai3i4sm
         hYymUVruhN7jowSf5Wdk3fYlpSPEvQvmWgkXcI5sgA51RVGqIDkkQpOVJiOet3II4tnm
         wV0082VHKM93URozj5JLhhYyKndiz8TgnLNUw2CCr8eSSVAfkEVGf5Dsch/IXpDjRRDD
         0BHFoOUV47EieoEW/AhMy33w6Ib1Iy5Z4VnKxutLMKBaBt/VX2bxE3KD2K1hxV0fraKS
         vV2DF++Ba0YdrlZOmLzEuMNDFWPY8liBVNI3RA/+JIY9TxFQWTMaHd7PMLWTJwAyJtOq
         wKSA==
X-Forwarded-Encrypted: i=1; AKwUvByu3A07a6kL4dEp0N8RAjAbiPaR7Qxi0zhIvZPJ0MR5aFgz7HVt/Ua8v9nFEsqGOiXDIdcOV5fURo4=@lists.infradead.org
X-Gm-Message-State: APuU4Z+rptAJaWK70q58xL4NDaOs9YgxZnp36rNGWId8vSyxeI7HwlLM
	9NiyiDfTYXMhCt07A/ra1zyUR6thIu+oMFZhPRO/9daWIaaIoiRZzSyTiNpROQtb
X-Gm-Gg: AYBFou3Njp5pweb0+BsLfuyoQjfIVw8KfOVtXWfYJWpYxqb9PTjmljpmuMElRmfpJTF
	Jg/reEmXxrk+c2xXbPsMBS6FCXPx+xWk98BXcsZ/dgFPo2m8s6uNTyJa8gE6GxCA/mhD0mkYlws
	B/fGf69DHruqqxE8dPJGurgdhtwaGGU1Ci/0Yb88DpQj2+xg97viffda/xHNjZ/tJLpnjDOgdo4
	OqODFg8Pt/hjfNn6TFx9oK1yocugBezIys3yZf5zXjNSbyknQ5mpKIypyhZlzdewOoGMB74HPb9
	QulfG6jl6bp1eH2+KC7v91CZ6tzBWtQFn++ZhGSRopVUK0qEPkRcA55f0QNijtoATSaA+LMMtz3
	vYeVlqwOeVJIrBpmwwEDNAU8FBhMx8VgGqWsReVrX4WzsfPtYCyQTXFPJuYDUncLdoPPbzycgLC
	6e7fm/VHvX6rdsu6lFA2FKVkKfWm5QxeOpknRovrjGdy3DfwSNI68S3YZD8ZF2gp05xhkiMYCTJ
	UFYhad62A3vyrubtiIcTygtXwSEXNxBnCr8yX0idipHKYHR1KTgJ2OF+Oc8syMTG7SuJN2W+33D
	5P3rQtZaidrexyNE9eV4U1aZ75kOh9QaaPa9Q3+/TcDI5Qg5+WlU0WhUqOv+4EjE4o8wO+arvPq
	IGZZR4GrWMESOI3drJvDwBQ5HBV04RVHXJRorBubtmUqsZV00qcAyENEvL2yGFmzF4dOY1KIKRQ
	cy3BdlF+5F7/D2Zc2dQ/uApHnyzcvZdPYq7tCaotZL02hcTJHhs+x/
X-Received: by 2002:a05:6820:340b:20b0:708:ccf9:886b with SMTP id 006d021491bc7-716e79e8540mr267932eaf.84.1793904953478;
        Thu, 05 Nov 2026 10:55:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:29 -0700
Subject: [PATCH v10 13/26] mtd: rawnand: sunxi: use page reads to
 reposition small-page NAND
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-13-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_185556_200063_E5686E8A 
X-CRM114-Status: GOOD (  19.77  )
X-Spam-Score: 0.1 (/)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The hardware-ECC reader moves between main data and OOB, and rereads raw
bytes when checking a possibly erased ECC step. It uses
nand_change_read_column_op(), which sends large-page random-output
commands and rejects NAND pages of 512 bytes or less. For a small-page
geometry accepted by hardware-ECC setup, these reads therefore fail when
they need to reposition, rather than using the small-page read commands.

Add a read-column helper that uses nand_read_page_op() on small pages.
The core selects READ0, READ1 or READOOB for the requested column and
sends the row address again. Pass the page number through the
erased-check path as well, and preserve errors from the resulting
operation. Keep the existing random-column operation for larger pages.

Select PIO for small pages even when DMA is available: the DMA PAGE_OP
sequencer uses large-page random-column commands internally.
This corrects read-side repositioning only; the write-column helper still
rejects small pages. Software-ECC and raw callbacks are unchanged.

This is a command-path correction found by inspection, not a claim that
ordinary 512+16 NAND becomes supported. The existing controller-ECC
limits still apply: it needs 512-byte ECC support and at least 28 parity
bytes plus four user-data bytes, so 512+16 remains rejected. No
small-page hardware validation is claimed.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260913041642.E28F81F000FF@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 40 ++++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 5f57c5998f03..931d437e196b 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1077,6 +1077,16 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 	}
 }
 
+static int sunxi_nfc_read_column(struct nand_chip *nand, int page,
+				 unsigned int column, void *buf, unsigned int len)
+{
+	/* Small-page NAND needs a new READ0/READ1/READOOB and the page address. */
+	if (nand_to_mtd(nand)->writesize <= 512)
+		return nand_read_page_op(nand, page, column, buf, len);
+
+	return nand_change_read_column_op(nand, column, buf, len, false);
+}
+
 /*
  * Return 1 for an erased chunk or 0 for an uncorrectable chunk, with ECC
  * statistics updated in either case. Negative values report transport errors.
@@ -1085,7 +1095,7 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 				       u8 *data, int data_off,
 				       u8 *oob, int oob_off,
 				       unsigned int user_data_sz,
-				       unsigned int *max_bitflips)
+				       unsigned int *max_bitflips, int page)
 {
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	unsigned int oob_len = ecc->bytes + user_data_sz;
@@ -1093,13 +1103,12 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 
 	/* Check the physical representation for bitflips in erased pages. */
 	if (nand->options & NAND_NEED_SCRAMBLING) {
-		ret = nand_change_read_column_op(nand, data_off, data,
-						 ecc->size, false);
+		ret = sunxi_nfc_read_column(nand, page, data_off, data, ecc->size);
 		if (ret)
 			return ret;
 	}
 
-	ret = nand_change_read_column_op(nand, oob_off, oob, oob_len, false);
+	ret = sunxi_nfc_read_column(nand, page, oob_off, oob, oob_len);
 	if (ret)
 		return ret;
 
@@ -1201,8 +1210,8 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 		return 0;
 
 	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
-		ret = nand_change_read_column_op(nand, mtd->writesize + offset,
-						 NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + offset,
+					    NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1268,14 +1277,14 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		if (read->oob_required) {
 			/* Keep the existing PIO and DMA representations of parity. */
 			if (read->dma) {
-				ret = nand_change_read_column_op(nand, mtd->writesize + oob_off,
-								 oob, ecc->bytes + user_data_sz,
-								 false);
+				ret = sunxi_nfc_read_column(nand, read->page,
+							    mtd->writesize + oob_off,
+							    oob, ecc->bytes + user_data_sz);
 				if (ret)
 					return ret;
 			} else {
-				ret = nand_change_read_column_op(nand, mtd->writesize + oob_off,
-								 NULL, 0, false);
+				ret = sunxi_nfc_read_column(nand, read->page,
+							    mtd->writesize + oob_off, NULL, 0);
 				if (ret)
 					return ret;
 
@@ -1310,7 +1319,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		ret = sunxi_nfc_hw_ecc_read_error(nand, read->buf + data_off, data_off,
 						  nand->oob_poi + oob_off,
 						  mtd->writesize + oob_off, user_data_sz,
-						  &read->max_bitflips);
+						  &read->max_bitflips, read->page);
 		if (ret < 0)
 			return ret;
 		if (ret)
@@ -1350,7 +1359,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	int ret;
 
 	if (*cur_off != data_off) {
-		ret = nand_change_read_column_op(nand, data_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, data_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1360,7 +1369,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 		return ret;
 
 	if (data_off + ecc->size != oob_off) {
-		ret = nand_change_read_column_op(nand, oob_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -2326,7 +2335,8 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	ecc->write_oob = sunxi_nfc_hw_ecc_write_oob;
 	mtd_set_ooblayout(mtd, &sunxi_nand_ooblayout_ops);
 
-	if (nfc->dmac || nfc->use_mdma) {
+	/* The DMA page sequencer uses large-page random-column commands. */
+	if (mtd->writesize > 512 && (nfc->dmac || nfc->use_mdma)) {
 		ecc->read_page = sunxi_nfc_hw_ecc_read_page_dma;
 		ecc->read_subpage = sunxi_nfc_hw_ecc_read_subpage_dma;
 		ecc->write_page = sunxi_nfc_hw_ecc_write_page_dma;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
