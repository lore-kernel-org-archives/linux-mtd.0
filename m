Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1D3C88E73
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 21:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j/nMW1gEXHXrg2GBJ6ATULKfvROZ7WCn3v9750v9KMw=; b=TBOGSs1h8PmcBS
	mjaadkyb2cBrn0cr3/NtlgaY7HN3YU6HvTC7ivjCezmThtSibGXgnZN+rm0etMkUz9bW2opvxJ1jB
	yqqDIEpvGdek42vL3jshMpMvSw20ykYUEqT3Pf2EhZYntpP07lzCVeiWouv123hM5vCfsjEs7b+4D
	aoWImbwtTSpfoDZ9crzNb8kKT88OAYNMy5jVg2kK62QBzWjXrpm0jwaVOc6on8dBpf4y2OrYlfZOh
	unPBLzkujyBBsBIxwIlSYXoQK3+3edsewWMqc/Sx+hmp/R6vyiQigbdHTzjuYcWmVsmcOGjNQPWDa
	lAA7jyN7ABssX6nw9pzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dwq-00000004gMV-0xbi;
	Mon, 14 Sep 2026 21:10:44 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DwT-00000004fnr-0I2t
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 21:10:22 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-6bc7a8b4802so4255096eaf.2
        for <linux-mtd@lists.infradead.org>; Mon, 14 Sep 2026 14:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420220; x=1790025020; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqAKP8KvklWhrAanMl0NJZL0/+j+O7CDNjnmlHeKJxw=;
        b=dYSaB0JKd/M3r3RlQHzWLa1Fb0cph2d2JgkoxIcmRMALSXctsaek8/qLgsCr3jdvSe
         ZIuKbs7cQU63OtAgD6ZRG8JNbmSBuE5DzPwu1xwILPm2yI+B+LScxpre8n6G9qo3Nr2Z
         Ydp0o8lKgavK6AOxbCvKBXm0HbcAUX3PpxYs583n7ZnadPdRrr0af8CmAPpjqqz15HjZ
         oKQZKEzzGgjJBotbkV7wGfDXbdeQG4UlVqVQudcS5phY7FL65B3GMupZJiAM8SRoOWJ0
         FXe1GMUiJNBJgd1MJSPssOEQqh/vP0cgGuul+GYy3tZpoDxMASsOAYbJob8NdbI+Dwwa
         R4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420220; x=1790025020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eqAKP8KvklWhrAanMl0NJZL0/+j+O7CDNjnmlHeKJxw=;
        b=HId13TpzL0mGNrRHqW2HkwtMa0dyyn+vDGC41CHk9AYVE/av+LHygnF1BltxQPZzUh
         6/kFKgFewBJnjrdGi675uFKy5e6tKYRcaciKTDqMNBQZZdSFOOddiwv6A6Al9d3TWiUC
         SR/hql+DCff8QRtEDgiDxP+dbdiowPgJQip5asnalKUa5Ibe+EvwOILKxqWOjupzi3C4
         GrVpS/Mnx3RIh9YbZizp+/9qBmVnYDYTRQ2x8AFwO6o1imPg3s6GUNh9aogUqq8BzIvf
         AVPn9XBBdhH99J9S02xN0wDbKW6fm3rVFrSsvi/N60gpbqHW5pd1q5G2DspXsj2eqwKc
         +vtw==
X-Gm-Message-State: AFuF++n7q3aFCNOqVx27h1BCrFuYtaC4IjE3Edo+N8mKDiSc9noJ5cRN
	+zPzwx4lCtZBL9v+5aozDFeQIvQxKSEcoeE/WClmBTYLqMBGPpYkwtUR
X-Gm-Gg: AYBFou1bc6soEQ0CpkrncpkdNP+gQcWh5CCGK6x3mD8mv3AIxkqYnrDJliqro8vGcOJ
	QcsK1eRsDE3o58QhU0X4yQ1OeugHszj5rz9d920Rf2OrzfEzoMZoP4zK+TFDPCi4FDSpYjgOlLn
	R6C66Vu4vVYqYV6CTSP0Q2Ykh/ZhZeDPYsfZSUfAVJypPLNrcdz0XAdCD9lpk6jl7nPURoDaC1g
	AACRS7Ykwo8y1cnTZW89MJD7wY3K1Z0tAMXVQMW/oktz5kJvhDazti9zAMjJ68LljUkPx2HsPUb
	a0oML8ag4Fz8e+6MuPcZEbgp7zrqbhu4aJw3VImwICUMx3uIdqcaEyPRU5iWJ7IRBUrUH+AnBuJ
	nsNUV2EuCfTvHSb54TSfWZamd0aTjCaZ5HfbqL88s2vJZzCb21H0doYJqPQ7PljfO1FKLQhyeWd
	W5B+yDol/l68KRD6IkucHlW+Rm3RFFMLXWd+QMfQiU0PWUkAkwdehEJ19p6Z5KFbOdMQDPeDXKG
	Q/dXNdCbjTKoRdu0uD0GKgCRFLdgy1HEnFyAvHDuFFtxLrdec+c7qTFYeAkYZ9bElQgd7blhidN
	a3h8u3VI8itpUXVEcs6X5HM8WHKGGQpUCVj64rUEkR34EZidTtoicmTSujbcOabCN7vU/D88NrC
	Kp463Beq7fwyM8yhUA/WlG0JNf0OH
X-Received: by 2002:a05:6820:1628:b0:6b8:ef7d:e181 with SMTP id 006d021491bc7-6c544daaf8cmr2777294eaf.54.1789420219820;
        Mon, 14 Sep 2026 14:10:19 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:10:04 -0600
Subject: [PATCH v6 18/18] mtd: rawnand: sunxi: reuse ECC status within each
 DMA read
MIME-Version: 1.0
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-18-2fb084fe0751@gmail.com>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
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
X-CRM114-CacheID: sfid-20260914_141021_144006_3C0E869B 
X-CRM114-Status: GOOD (  21.01  )
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
 drivers/mtd/nand/raw/sunxi_nand.c | 103 +++++++++++++++++++++++++-------------
 1 file changed, 69 insertions(+), 34 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 41d6ef31ea3d..b79bf13f3ff0 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1157,16 +1157,60 @@ struct sunxi_nfc_ecc_status {
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
 
 	/*
@@ -1174,35 +1218,32 @@ static void sunxi_nfc_hw_ecc_record_status(struct nand_chip *nand,
 	 * Classify these steps with the vendor page check too, and do not use
 	 * their correction counters. Keep their decoded data until then.
 	 */
-	if ((status & NFC_ECC_ERR(hw_step)) ||
-	    (pattern_found & BIT(hw_step))) {
+	if ((snapshot->status & NFC_ECC_ERR(hw_step)) ||
+	    (snapshot->pattern_found & BIT(hw_step))) {
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
@@ -1218,9 +1259,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 		return 0;
 	}
 
-	tmp = readl(nfc->regs + NFC_REG_ECC_ERR_CNT(nfc, hw_step));
-
-	return NFC_ECC_ERR_CNT(hw_step, tmp);
+	return sunxi_nfc_hw_ecc_read_count(nand, snapshot, hw_step);
 }
 
 static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
@@ -1235,7 +1274,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, logical_step);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	u32 pattern_found;
+	struct sunxi_nfc_ecc_snapshot snapshot;
 	bool bbm = !logical_step;
 	bool erased;
 	int ret, bitflips;
@@ -1275,13 +1314,11 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
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
@@ -1289,8 +1326,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	}
 
 	bitflips = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
-					    hw_step, readl(nfc->regs + NFC_REG_ECC_ST),
-					    pattern_found, user_data_sz, &erased);
+					    hw_step, &snapshot, user_data_sz, &erased);
 	if (erased)
 		return 1;
 
@@ -1555,11 +1591,12 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	struct sunxi_nfc_ecc_snapshot snapshot;
 	unsigned int reg_index = 0, user_data_sz;
 	unsigned int max_bitflips = 0;
 	int ret, i;
 	struct scatterlist sg;
-	u32 status, pattern_found, wait;
+	u32 wait;
 
 	if (first_step) {
 		ret = sunxi_nfc_read_column(nand, page, first_step * ecc->size,
@@ -1612,9 +1649,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 	if (ret)
 		return ret;
 
-	status = readl(nfc->regs + NFC_REG_ECC_ST);
-	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
-	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	sunxi_nfc_hw_ecc_read_status(nand, &snapshot);
 
 	for (i = 0; i < nchunks; i++, reg_index += user_data_sz / 4) {
 		int logical_step = first_step + i;
@@ -1628,8 +1663,8 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 		user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, logical_step);
 
 		if (sunxi_nand->randomized_oob) {
-			sunxi_nfc_hw_ecc_record_status(nand, result, logical_step, i, status,
-						       pattern_found);
+			sunxi_nfc_hw_ecc_record_status(nand, result, logical_step, i,
+						       &snapshot);
 			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, reg_index, !logical_step,
 							    page, user_data_sz);
 			continue;
@@ -1637,7 +1672,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 
 		bitflips = sunxi_nfc_hw_ecc_correct(nand, randomized ? data : NULL,
 						    oob_required ? oob : NULL,
-						    i, status, pattern_found,
+						    i, &snapshot,
 						    user_data_sz, &erased);
 
 		/* ECC errors are handled in the second loop. */
@@ -1664,7 +1699,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 	if (sunxi_nand->randomized_oob)
 		return 0;
 
-	if (status & NFC_ECC_ERR_MSK(nfc)) {
+	if (snapshot.status & NFC_ECC_ERR_MSK(nfc)) {
 		for (i = 0; i < nchunks; i++) {
 			int logical_step = first_step + i;
 			int data_off = logical_step * ecc->size;
@@ -1672,7 +1707,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 			u8 *data = buf + data_off;
 			u8 *oob = nand->oob_poi + oob_off;
 
-			if (!(status & NFC_ECC_ERR(i)))
+			if (!(snapshot.status & NFC_ECC_ERR(i)))
 				continue;
 
 			user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, logical_step);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
