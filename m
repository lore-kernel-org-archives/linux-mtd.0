Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AA5C79FAD
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2026 08:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NraYnX1R0efVrJi6eOn9F7dQq9b7j4LytuaEk4kt1BE=; b=qItmW0oP8Nnda5
	B8PpqwR2X8ZeSIVT8TF6Wt44qk16LInmMRZavllXue5Ggytdp216cKNfFjzzn0PgKoFfEEbVq80MG
	KWbi1veXYObNH/xl1rCIbBCEh/XQRWatAw4uiBNvgsL3rF1qh14GKClxtr+0wDVlx9KI5Aj4C4Tb4
	xoM/G3Ezop2JjJGTh/KVraJPyYcjZr0texq5shDwmOO+3z9rI2CZTm1i3PaNUka5Xtsp6UZjkiANa
	pUXol1234V4jxo0q/c8w3U6GIe7WOqbaPCwJ+BU70ae2PD7/EVffq0vwiwbPoW2YYPchqzOtmCkdo
	V0/+kQ4qR/DB1acuNx2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DjB-0000000B7i0-4925;
	Wed, 09 Sep 2026 08:32:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DiD-0000000B6cn-42XT
	for linux-mtd@bombadil.infradead.org;
	Wed, 09 Sep 2026 08:31:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZVBoL4uLYSK7OhzJyk+4QlEDJCrYxUZn9Ns/nhu2ClA=; b=fu0Wrh2j0e3yB8dJdBVTrC0857
	VESwHJXYzd0rQ1bHiFNoRX3bwy+TrbSqz0ObzCy/D7Brbv2nj3AIcteYsHSJAeMfhSdyVwIHIHMII
	pWJyrbxhWvLvfN0wiFN0CZj6mjNj9wE2d2wYAY9hs0Lmqt4gE4DdE0cpDG3O4BJjW5DusOZLKwECG
	2fdbSgONf4eyFD2fZ2ZtnKFQHAPPuAdmaKco9Mf1dsLkvpXs2vQxqjpXXrB6oGDgPoJHi815hmfff
	zWR81wKb19OvE23jlSus1ZbAnb69VQh71Hi5sMG8l0wbOAU/6Czp4JQW0tX9t+m2XDahyBmBmPYos
	oggHgZcA==;
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Di9-00000000upB-49aD
	for linux-mtd@lists.infradead.org;
	Wed, 09 Sep 2026 08:31:20 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-43b7e186a0cso2946514fac.0
        for <linux-mtd@lists.infradead.org>; Wed, 09 Sep 2026 01:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942675; x=1789547475; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZVBoL4uLYSK7OhzJyk+4QlEDJCrYxUZn9Ns/nhu2ClA=;
        b=mP4W22h/Hz6Eudeope9wBla4ritdKYZoXE7mngNNwPqgHMdqNMWg0H4/razD1NNZLL
         4Jis/0h3bFTsjbm4YHpYmdHEoVju8EhNgBYpln6SqWSWZ+dGkBS6YEYVwQBQwhhB3Sp+
         /EtBJFVRhbQKghkYUN+Qb9zKkjIzefpryVByp2+WRYMS/9a9HfoKDvfM4NLU371fEz/v
         e+Xl6GLykn8G2qHE6N848oJdHPNhGOuLOx29fNs/EkBSUL7b3+6ILMUPFOGYlPmsaC6Z
         BfWDTM8+rG1wy66QyEVyeZ37HT6cMXiC7n+BNCRrisMYxAw/Cgz/xrPCqHCi/Rv1YOri
         VaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942675; x=1789547475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZVBoL4uLYSK7OhzJyk+4QlEDJCrYxUZn9Ns/nhu2ClA=;
        b=NgmYsGsXKOUZ7ZD4h2xsVCQ01+Pl31e4YbVurizmFV4zb6Lq0af5RjVluioY9kBXbK
         J4kAe6SQcdLF6i/C6T3yfi05lYI4N2Cwz3MqfcD/eu69u+uZeXK4jSCeaH7YQQkiQJPW
         /JGVIm2JpSZSzFd1flerhiOqksID86iV0T/UZJpaBe56tAoEjp7CT5zcDh7yOoPlby09
         aEoK0kAaiSZBvpUcoUe7rINPEKbhBhP+AUNqH7Jyb4RkJHQri0bmCYhkqmuv/YksDy13
         ZMvsT3ru32uEfFnRTOJBSkBJEnvovjPPgn81Tko63D7Bofg//y0RXqZNfYHWHNcwGoEJ
         /vNA==
X-Gm-Message-State: AFuF++kqdHb74PKk9LPm0HfGATCMYGQBXTuq45XuOF6c2xKgzwFD1tt2
	qT+LE0P6nWn55vXCftEa19lcTndt2cXQkiQrDiiShW0+hP0RqaG+TLAF
X-Gm-Gg: AYBFou0NKufVSMfMJPrVY/V5cAEjtdw9H1zGtj3aSYB2Nykx7LCNg3zQoo1AAMvsB0T
	EUck4myioPtB56CqxG3AVq+3lnrTvjzIqSL0TchLIE84BrgtRXD7ahPu9nr6iiyHS1nWlRlWwIO
	Q645DQ2mRgZCT3VbkYsBrCv/3YLhKSFkfZE57medTLZrBXmsu3rhGRhkA5RfsgppDuaqMKijnqE
	nPWKjhtnmzJp+b+ro4mW9a+eOzE7/7drnNHEaft4ERBCN2ckS+9ThLvES1mrxhYTTLUGIM25Zrt
	KkF2SU2fEHA0D97BOLgxbZo3MKEgffJ70C29+tThq6iS2k2QV+FFklbq2mQa2VJtdIhpUkT2/1Z
	cf+KlEk29p0QdE2FqLvozBgsLG8a/uzlDOUSlYfyyQ6yxHw6Oa8Y/ivrk7VuXG/F6rkmilJhv3h
	wtbJavqW2Cxe7h2BhtyCDOqRwfG3RHSF2Nu/q3rrzb1uG3sErjgUXjoukD8J2ZcytXWmRcWEs4o
	Y0XgQIZsKopl08L+m7z3ft+RLov/NfLbfnFz8nv5Hj4pRxh8pV/w6US/LW/dOc684nx/Xx0gHMV
	ttrN2ooJnT2JRDDKSt9CwaSPqlStbw96RBMVk9CexoNbnuSeuR0tzwQ9K3dH8F3Y0Ihc3YhZhsT
	ureHF7tv6vs7QnYk/cPCXnDYoxnvePa3KdZrFE1gs
X-Received: by 2002:a05:6820:1987:b0:6ae:a950:9faa with SMTP id 006d021491bc7-6b6faee2564mr17826769eaf.10.1788942675012;
        Wed, 09 Sep 2026 01:31:15 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:48 -0600
Subject: [PATCH v3 15/15] mtd: rawnand: sunxi: reuse ECC status within each
 DMA read
MIME-Version: 1.0
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-15-838cb0ba1547@gmail.com>
References: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
In-Reply-To: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_093118_344226_F96DE56A 
X-CRM114-Status: GOOD (  20.39  )
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

The DMA completion loop reads the pattern ID repeatedly and reads the
same packed error-counter word for each of its four ECC steps.

Snapshot the completed operation status and pattern ID, and retain the
last counter word while visiting consecutive DMA steps. Read counters
only for steps which use them. Reuse the shared status register value on
older controllers which place the pattern flags in its upper half.
Keep the existing error and pattern priority in both the plain-marker
and randomized-format paths.

Start a fresh snapshot after every PIO ECC operation so reuse of hardware
slot zero cannot reuse status from a previous step. The snapshot is local
to one callback and does not survive controller resets or DMA-to-PIO
retries.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 100 +++++++++++++++++++++++++-------------
 1 file changed, 67 insertions(+), 33 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 1c1fcea69108..8710e91ffbaa 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1138,46 +1138,87 @@ struct sunxi_nfc_ecc_status {
 	unsigned int max_bitflips;
 };
 
+struct sunxi_nfc_ecc_snapshot {
+	u32 status;
+	u32 pattern_found;
+	u32 pattern_id;
+	u32 count_reg;
+	u32 count;
+};
+
+static void sunxi_nfc_hw_ecc_read_status(struct nand_chip *nand,
+					 struct sunxi_nfc_ecc_snapshot *snapshot)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	u32 pattern_found;
+
+	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
+	snapshot->pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	if (nfc->caps->reg_pat_found == NFC_REG_ECC_ST)
+		snapshot->status = pattern_found;
+	else
+		snapshot->status = readl(nfc->regs + NFC_REG_ECC_ST);
+	snapshot->pattern_id = 0;
+	if (snapshot->pattern_found &&
+	    (to_sunxi_nand(nand)->randomized_oob ||
+	     (snapshot->pattern_found & ~snapshot->status)))
+		snapshot->pattern_id = readl(nfc->regs + NFC_REG_PAT_ID(nfc));
+	/* A new operation, including every PIO step, invalidates the count word. */
+	snapshot->count_reg = ~0U;
+}
+
+static unsigned int
+sunxi_nfc_hw_ecc_read_count(struct nand_chip *nand,
+			    struct sunxi_nfc_ecc_snapshot *snapshot, int hw_step)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	u32 reg = NFC_REG_ECC_ERR_CNT(nfc, hw_step);
+
+	/* Four consecutive DMA steps share one error-counter register. */
+	if (snapshot->count_reg != reg) {
+		snapshot->count = readl(nfc->regs + reg);
+		snapshot->count_reg = reg;
+	}
+
+	return NFC_ECC_ERR_CNT(hw_step, snapshot->count);
+}
+
 static void sunxi_nfc_hw_ecc_record_status(struct nand_chip *nand,
 					   struct sunxi_nfc_ecc_status *result,
-					   int logical_step, int hw_step, u32 status,
-					   u32 pattern_found)
+					   int logical_step, int hw_step,
+					   struct sunxi_nfc_ecc_snapshot *snapshot)
 {
-	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	u32 count;
 
-	if ((pattern_found & BIT(hw_step)) &&
-	    !(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(hw_step)))
+	if ((snapshot->pattern_found & BIT(hw_step)) &&
+	    !(snapshot->pattern_id & BIT(hw_step)))
 		result->zero_steps |= BIT(logical_step);
 
-	if (status & NFC_ECC_ERR(hw_step)) {
+	if (snapshot->status & NFC_ECC_ERR(hw_step)) {
 		result->error_steps |= BIT(logical_step);
 		return;
 	}
 
-	count = readl(nfc->regs + NFC_REG_ECC_ERR_CNT(nfc, hw_step));
-	count = NFC_ECC_ERR_CNT(hw_step, count);
+	count = sunxi_nfc_hw_ecc_read_count(nand, snapshot, hw_step);
 	result->corrected += count;
 	result->max_bitflips = max(result->max_bitflips, count);
 }
 
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
-				    int hw_step, u32 status, u32 pattern_found,
+				    int hw_step, struct sunxi_nfc_ecc_snapshot *snapshot,
 				    unsigned int user_data_sz, bool *erased)
 {
-	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	u32 tmp;
 
 	*erased = false;
 
-	if (status & NFC_ECC_ERR(hw_step))
+	if (snapshot->status & NFC_ECC_ERR(hw_step))
 		return -EBADMSG;
 
-	if (pattern_found & BIT(hw_step)) {
+	if (snapshot->pattern_found & BIT(hw_step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(hw_step)))) {
+		if (unlikely(!(snapshot->pattern_id & BIT(hw_step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;
@@ -1193,9 +1234,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 		return 0;
 	}
 
-	tmp = readl(nfc->regs + NFC_REG_ECC_ERR_CNT(nfc, hw_step));
-
-	return NFC_ECC_ERR_CNT(hw_step, tmp);
+	return sunxi_nfc_hw_ecc_read_count(nand, snapshot, hw_step);
 }
 
 static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
@@ -1210,7 +1249,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, logical_step);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	u32 pattern_found;
+	struct sunxi_nfc_ecc_snapshot snapshot;
 	bool bbm = !logical_step;
 	bool erased;
 	int ret, bitflips;
@@ -1250,13 +1289,11 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
 	*cur_off = oob_off + ecc->bytes + user_data_sz;
 
-	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
-	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	sunxi_nfc_hw_ecc_read_status(nand, &snapshot);
 
 	if (sunxi_nand->randomized_oob) {
 		sunxi_nfc_hw_ecc_record_status(nand, result, logical_step, hw_step,
-					       readl(nfc->regs + NFC_REG_ECC_ST),
-					       pattern_found);
+					       &snapshot);
 		memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
 		sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, hw_step, bbm,
 						    page, user_data_sz);
@@ -1264,8 +1301,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	}
 
 	bitflips = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
-					    hw_step, readl(nfc->regs + NFC_REG_ECC_ST),
-					    pattern_found, user_data_sz, &erased);
+					    hw_step, &snapshot, user_data_sz, &erased);
 	if (erased)
 		return 1;
 
@@ -1530,13 +1566,14 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct sunxi_nfc_ecc_status result = {};
+	struct sunxi_nfc_ecc_snapshot snapshot;
 	unsigned int corrected = mtd->ecc_stats.corrected;
 	unsigned int failed = mtd->ecc_stats.failed;
 	unsigned int max_bitflips = 0;
 	bool erased_chunk_found = false;
 	int ret, i;
 	struct scatterlist sg;
-	u32 status, pattern_found, wait;
+	u32 wait;
 
 	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 	if (ret)
@@ -1577,9 +1614,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 	if (ret)
 		return ret;
 
-	status = readl(nfc->regs + NFC_REG_ECC_ST);
-	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
-	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	sunxi_nfc_hw_ecc_read_status(nand, &snapshot);
 
 	for (i = 0; i < nchunks; i++) {
 		int data_off = i * ecc->size;
@@ -1591,8 +1626,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		int bitflips;
 
 		if (sunxi_nand->randomized_oob) {
-			sunxi_nfc_hw_ecc_record_status(nand, &result, i, i, status,
-						       pattern_found);
+			sunxi_nfc_hw_ecc_record_status(nand, &result, i, i, &snapshot);
 			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, i, !i,
 							    page, user_data_sz);
 			continue;
@@ -1600,7 +1634,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 
 		bitflips = sunxi_nfc_hw_ecc_correct(nand, randomized ? data : NULL,
 						    oob_required ? oob : NULL,
-						    i, status, pattern_found,
+						    i, &snapshot,
 						    user_data_sz, &erased);
 
 		/* ECC errors are handled in the second loop. */
@@ -1629,7 +1663,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		return sunxi_nfc_hw_ecc_finish_randomized_read(nand, buf, &result,
 							     oob_required, true, page);
 
-	if (status & NFC_ECC_ERR_MSK(nfc)) {
+	if (snapshot.status & NFC_ECC_ERR_MSK(nfc)) {
 		for (i = 0; i < nchunks; i++) {
 			int data_off = i * ecc->size;
 			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
@@ -1637,7 +1671,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 			u8 *data = buf + data_off;
 			u8 *oob = nand->oob_poi + oob_off;
 
-			if (!(status & NFC_ECC_ERR(i)))
+			if (!(snapshot.status & NFC_ECC_ERR(i)))
 				continue;
 
 			ret = sunxi_nfc_hw_ecc_read_error(nand, data, data_off, oob,

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
