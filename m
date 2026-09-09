Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991C9C79FAD
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2026 08:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=50jD5oLsIhiRHCfeuodRiREaUK8mSW4uTKxQRy0xVak=; b=t/1S1IpvGAOT5Y
	JCxYRDjNCAgliYLLHkL/MKjV213Yaw3pMxLtqhIs6T5ZnQvbiGnN4Q+hXTQBhRp6zFXjvuCQMp+q7
	pFSI4kS9qI1Vu3MQOvvIIRImwRv5Sn6GanCYJvWmhhWsMQS9mgUIJy8cwODfQCwRm0FhXQoMaXeNB
	5um/Tulo43YbQYFXIeghabxXyMmWKqQeYnkV4qoRMoOZEbAGd+VJK9jQZt3JfrtnCYXqs4MkWGgvD
	7p8I7xkM3ov8/69rhAktGKYBYp+odvc3Ww6smBX9lSsjlJsGrtz/nL+cU47iovVfUy7ld612/VyQ4
	9rXzT5Y+Fq3VRchnq08g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DiT-0000000B6nC-1umZ;
	Wed, 09 Sep 2026 08:31:37 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Dhx-0000000B6PP-1W5e
	for linux-mtd@lists.infradead.org;
	Wed, 09 Sep 2026 08:31:07 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7f64ea07036so4942800a34.0
        for <linux-mtd@lists.infradead.org>; Wed, 09 Sep 2026 01:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942664; x=1789547464; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WcUOmAhLcGtei2/BcCp+jJsQASRhlEZ3b/VByXsoyLM=;
        b=R7rVZN5X6t8cZLdrwNV8+UwGSlXrFwZZTd4neSD7d0VTXVkSrFMOivMMxgsBbLQ2/8
         PGixmAwNK3GiLNLmDhupblPm9fKI15xRE37kQiGO3qESaMqyMj1y/1c09q/EgUEuzhwc
         sY3UzSTlsZUsrSlglYqVyAS0W+L4UO1fkYtt3bat6Lug8dWkKR2QqBEAV50TSqAOQzDd
         AvQzYz0BSQl7xKe6kNqwJjv1P9LOHPY5t2qKbOysylv45sgEDy5HUAP5+XsjwvNNha+X
         /ObfMUswZI1doH3uZ+oWki46NeaCygsSY0+jWt8TtAptCtl7wrPCMJ4D/wyaAV27e+4C
         ak4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942664; x=1789547464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WcUOmAhLcGtei2/BcCp+jJsQASRhlEZ3b/VByXsoyLM=;
        b=DmEsMcqb16aI0R2RzG+gSITvMimDEVn90qVw+jsJ2iPo1um4WZ+JISVp6MSPq/WxDn
         5DR1XaDVyHRceQSsvU/9ID1f/vAq+8l/l19vvAh6y+ZNswceIXgwzcUbZ7nSpb0s2qxo
         iTROT0ChjT7xWig5mM3CPdarX9D9awNPWjcFmQ2RsU+oK+VCioPU2CBDMnHBBEh+aNDE
         +g1LBJg9NPkQtU7hkaeC9lvQ/Cv8AytwHGjlEJzJHvKOg1KMQx+cUdge0E0MvlUhquyw
         tVBoaB8VQYA7WA6x/Z7CUj17lE27thAHq6kNxLuM4xw0ERzdjs9NKWlgqCfAfdA5RjM/
         pGfg==
X-Gm-Message-State: AFuF++kAmZIS2my5YdXAuHCoPAha3yR5g+P2qkDpe4PaiHzGZ1HhPPx1
	S4pS3b6oV/YVpZ/vCqMks30aleVxoigWbLxnPOg18o51issboMTvl4y5
X-Gm-Gg: AYBFou1ruPFR0U/SNJ4Q0rwgPjIrbyBN488HbYQzCnJ0hV/9aB/Lht98YsONsoXVigK
	GM54hJ3aXOlEFfkLU85k9J5FSVrZPbDtYf18KC4zGl3jnKLdC6n8viLGqPp7Ac4v0ebAGF5EK1U
	tCaRf320rmyUstP4EGt/p0f1rUXeaUS8JwbivN+rTnMC9bJsq3CbE/UtN/q9taphEN0Nsdb1byD
	prjQTtFZL0QwOwHSRFMTrBvdAvBVXs8DHnjF74ULWp928Xr8HPzqt1pygUmzaVhVT0oGN9ljVnI
	Z7CVDsSsH3x2c+/X8oZU7GcL5nBVq+VSs8WnHfHLLG/HVXumv+98EUamH7nuFDFiSdp3kpNgM50
	YyvxIAgduTjN0gz5PecYwT305+HUEFDpG0G0lsCobaALjdHa+rRIk7pQl5ELx2jWl+l/4a9z3le
	rej0+I9/KJY8+PW0IZYBlCY9fA9NVd9J6IChJG4MuUYYKy0h4unY7+8qIn+nu/kQov55pEn6C93
	G7xAw8gnoBwu4waQ6QIK5bgCdQQWE+Hf9fNtMrx6YfsYmUq20Y3xCouyJ8fUJbaHAZ3b18taZ8E
	JgNIqfdS59vGd/Ljg54O1+qFyd2kvwMJS2AG+o2BbqqgMVWwk9zWOPxOqhnSrZ94CJ8mWCk9i5P
	yttrbGGSv/I+HjMk07gGralannNk0
X-Received: by 2002:a05:6820:4d04:b0:6a0:f44b:1265 with SMTP id 006d021491bc7-6b6fa8e0837mr19303991eaf.4.1788942664083;
        Wed, 09 Sep 2026 01:31:04 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:41 -0600
Subject: [PATCH v3 08/15] mtd: rawnand: sunxi: clarify OOB register and
 step handling
MIME-Version: 1.0
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-8-838cb0ba1547@gmail.com>
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
X-CRM114-CacheID: sfid-20260909_013105_509400_1DDF1A8C 
X-CRM114-Status: GOOD (  25.36  )
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

PIO reuses hardware slot zero while the user-data length and OOB offset
belong to the logical page step. Name the two indices explicitly in the
helpers so their different roles are visible at each call site.

Share the variable-length user-data register-index calculation between
the protected-OOB read and write helpers, keeping the separate MMIO loops
and existing fixed-length register accesses. Clarify why the plain-marker
format compensates the bad-block marker around hardware randomization.

Rename raw_mode to erased_chunk_found in the page readers, using a
boolean in both paths. The flag suppresses randomization of the trailing
OOB after an erased chunk; it does not select MTD_OPS_RAW. No on-flash
format, register-access sequence or ECC accounting changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 143 ++++++++++++++++++--------------------
 1 file changed, 67 insertions(+), 76 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 16b2b39524a7..390782986a47 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -912,16 +912,33 @@ static inline u32 sunxi_nfc_buf_to_user_data(const u8 *buf)
 	return buf[0] | (buf[1] << 8) | (buf[2] << 16) | (buf[3] << 24);
 }
 
-static u8 sunxi_nfc_user_data_sz(struct sunxi_nand_chip *sunxi_nand, int step)
+static u8 sunxi_nfc_user_data_sz(struct sunxi_nand_chip *sunxi_nand,
+				 int logical_step)
 {
 	if (!sunxi_nand->user_data_bytes)
 		return USER_DATA_SZ;
 
-	return sunxi_nand->user_data_bytes[step];
+	return sunxi_nand->user_data_bytes[logical_step];
+}
+
+/*
+ * Variable-length user data is concatenated in four-byte registers.
+ * PIO uses hardware step zero; DMA slots follow the logical page steps.
+ */
+static unsigned int
+sunxi_nfc_user_data_reg_index(struct sunxi_nand_chip *sunxi_nand, int hw_step)
+{
+	unsigned int byte_offset = 0;
+	int i;
+
+	for (i = 0; i < hw_step; i++)
+		byte_offset += sunxi_nfc_user_data_sz(sunxi_nand, i);
+
+	return byte_offset / 4;
 }
 
 static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
-						int step, bool bbm, int page,
+						int hw_step, bool bbm, int page,
 						unsigned int user_data_sz)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
@@ -929,35 +946,22 @@ static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
 	u32 user_data;
 
 	if (!nfc->caps->reg_user_data_len) {
-		/*
-		 * For A10, the user data for step n is in the nth
-		 * REG_USER_DATA
-		 */
-		user_data = readl(nfc->regs + NFC_REG_USER_DATA(nfc, step));
+		user_data = readl(nfc->regs + NFC_REG_USER_DATA(nfc, hw_step));
 		sunxi_nfc_user_data_to_buf(user_data, oob);
 	} else {
-		/*
-		 * For H6 NAND controller, the user data for all steps is
-		 * contained in 32 user data registers, but not at a specific
-		 * offset for each step, they are just concatenated.
-		 */
-		unsigned int user_data_off = 0;
+		unsigned int reg_index = sunxi_nfc_user_data_reg_index(sunxi_nand, hw_step);
 		unsigned int reg_off;
 		u8 *ptr = oob;
 		unsigned int i;
 
-		for (i = 0; i < step; i++)
-			user_data_off += sunxi_nfc_user_data_sz(sunxi_nand, i);
-
-		user_data_off /= 4;
 		for (i = 0; i < user_data_sz / 4; i++, ptr += 4) {
-			reg_off = NFC_REG_USER_DATA(nfc, user_data_off + i);
+			reg_off = NFC_REG_USER_DATA(nfc, reg_index + i);
 			user_data = readl(nfc->regs + reg_off);
 			sunxi_nfc_user_data_to_buf(user_data, ptr);
 		}
 	}
 
-	/* De-randomize the Bad Block Marker. */
+	/* Undo hardware de-randomization for a plain on-flash BBM. */
 	if (bbm && (nand->options & NAND_NEED_SCRAMBLING))
 		sunxi_nfc_randomize_bbm(nand, page, oob);
 }
@@ -979,7 +983,7 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
 }
 
 static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
-					int len, int step)
+					int len, int hw_step)
 {
 	bool found = false;
 	u32 val;
@@ -1002,15 +1006,15 @@ static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
 		return;
 	}
 
-	val = readl(nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
+	val = readl(nfc->regs + NFC_REG_USER_DATA_LEN(nfc, hw_step));
 
-	val &= ~NFC_USER_DATA_LEN_MSK(step);
-	val |= field_prep(NFC_USER_DATA_LEN_MSK(step), i);
-	writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
+	val &= ~NFC_USER_DATA_LEN_MSK(hw_step);
+	val |= field_prep(NFC_USER_DATA_LEN_MSK(hw_step), i);
+	writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, hw_step));
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
-						const u8 *oob, int step,
+						const u8 *oob, int hw_step,
 						bool bbm, int page,
 						unsigned int user_data_sz)
 {
@@ -1018,7 +1022,7 @@ static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
 
-	/* Randomize the Bad Block Marker. */
+	/* Pre-randomize the BBM so the hardware writes it plain on flash. */
 	if (bbm && (nand->options & NAND_NEED_SCRAMBLING)) {
 		memcpy(user_data, oob, user_data_sz);
 		sunxi_nfc_randomize_bbm(nand, page, user_data);
@@ -1026,32 +1030,18 @@ static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 	}
 
 	if (!nfc->caps->reg_user_data_len) {
-		/*
-		 * For A10, the user data for step n is in the nth
-		 * REG_USER_DATA
-		 */
 		writel(sunxi_nfc_buf_to_user_data(oob),
-		       nfc->regs + NFC_REG_USER_DATA(nfc, step));
+		       nfc->regs + NFC_REG_USER_DATA(nfc, hw_step));
 	} else {
-		/*
-		 * For H6 NAND controller, the user data for all steps is
-		 * contained in 32 user data registers, but not at a specific
-		 * offset for each step, they are just concatenated.
-		 */
-		unsigned int user_data_off = 0;
+		unsigned int reg_index = sunxi_nfc_user_data_reg_index(sunxi_nand, hw_step);
 		const u8 *ptr = oob;
 		unsigned int i;
 
-		for (i = 0; i < step; i++)
-			user_data_off += sunxi_nfc_user_data_sz(sunxi_nand, i);
-
-		user_data_off /= 4;
 		for (i = 0; i < user_data_sz / 4; i++, ptr += 4) {
 			writel(sunxi_nfc_buf_to_user_data(ptr),
-			       nfc->regs + NFC_REG_USER_DATA(nfc, user_data_off + i));
+			       nfc->regs + NFC_REG_USER_DATA(nfc, reg_index + i));
 		}
 	}
-
 }
 
 static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
@@ -1102,7 +1092,7 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 }
 
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
-				    int step, u32 status, u32 pattern_found,
+				    int hw_step, u32 status, u32 pattern_found,
 				    unsigned int user_data_sz, bool *erased)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
@@ -1111,13 +1101,13 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 
 	*erased = false;
 
-	if (status & NFC_ECC_ERR(step))
+	if (status & NFC_ECC_ERR(hw_step))
 		return -EBADMSG;
 
-	if (pattern_found & BIT(step)) {
+	if (pattern_found & BIT(hw_step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(hw_step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;
@@ -1133,9 +1123,9 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 		return 0;
 	}
 
-	tmp = readl(nfc->regs + NFC_REG_ECC_ERR_CNT(nfc, step));
+	tmp = readl(nfc->regs + NFC_REG_ECC_ERR_CNT(nfc, hw_step));
 
-	return NFC_ECC_ERR_CNT(step, tmp);
+	return NFC_ECC_ERR_CNT(hw_step, tmp);
 }
 
 static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
@@ -1143,18 +1133,18 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 				       u8 *oob, int oob_off,
 				       int *cur_off,
 				       unsigned int *max_bitflips,
-				       int step, bool oob_required, int page)
+				       int logical_step, bool oob_required, int page)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
+	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, logical_step);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	u32 pattern_found;
-	bool bbm = !step;
+	bool bbm = !logical_step;
 	bool erased;
 	int ret, bitflips;
 	/* From the controller point of view, we are at step 0 */
-	const int nfc_step = 0;
+	const int hw_step = 0;
 
 	if (*cur_off != data_off) {
 		ret = nand_change_read_column_op(nand, data_off, NULL, 0, false);
@@ -1176,7 +1166,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
+	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -1193,7 +1183,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
 
 	bitflips = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
-					    nfc_step, readl(nfc->regs + NFC_REG_ECC_ST),
+					    hw_step, readl(nfc->regs + NFC_REG_ECC_ST),
 					    pattern_found, user_data_sz, &erased);
 	if (erased)
 		return 1;
@@ -1220,7 +1210,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 			if (ret)
 				return ret;
 
-			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, nfc_step,
+			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, hw_step,
 							    bbm, page, user_data_sz);
 		}
 	}
@@ -1235,12 +1225,12 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
  * (it includes the user data before the ECC data.)
  */
 static int sunxi_get_oob_offset(struct sunxi_nand_chip *sunxi_nand,
-				struct nand_ecc_ctrl *ecc, int step)
+				struct nand_ecc_ctrl *ecc, int logical_step)
 {
-	int ecc_off = step * ecc->bytes;
+	int ecc_off = logical_step * ecc->bytes;
 	int i;
 
-	for (i = 0; i < step; i++)
+	for (i = 0; i < logical_step; i++)
 		ecc_off += sunxi_nfc_user_data_sz(sunxi_nand, i);
 
 	return ecc_off;
@@ -1252,10 +1242,10 @@ static int sunxi_get_oob_offset(struct sunxi_nand_chip *sunxi_nand,
  * but it skips the next user data.
  */
 static int sunxi_get_ecc_offset(struct sunxi_nand_chip *sunxi_nand,
-				struct nand_ecc_ctrl *ecc, int step)
+				struct nand_ecc_ctrl *ecc, int logical_step)
 {
-	return sunxi_get_oob_offset(sunxi_nand, ecc, step) +
-		sunxi_nfc_user_data_sz(sunxi_nand, step);
+	return sunxi_get_oob_offset(sunxi_nand, ecc, logical_step) +
+		sunxi_nfc_user_data_sz(sunxi_nand, logical_step);
 }
 
 static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
@@ -1305,7 +1295,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 	unsigned int corrected = mtd->ecc_stats.corrected;
 	unsigned int failed = mtd->ecc_stats.failed;
 	unsigned int max_bitflips = 0;
-	int ret, i, raw_mode = 0;
+	bool erased_chunk_found = false;
+	int ret, i;
 	struct scatterlist sg;
 	u32 status, pattern_found, wait;
 
@@ -1385,7 +1376,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		}
 
 		if (erased)
-			raw_mode = 1;
+			erased_chunk_found = true;
 
 		sunxi_nfc_hw_ecc_update_stats(nand, &max_bitflips, bitflips);
 	}
@@ -1408,13 +1399,13 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 			if (ret < 0)
 				goto err_stats;
 			if (ret)
-				raw_mode = 1;
+				erased_chunk_found = true;
 		}
 	}
 
 	if (oob_required) {
 		ret = sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi,
-						      NULL, !raw_mode, page);
+						      NULL, !erased_chunk_found, page);
 		if (ret)
 			goto err_stats;
 	}
@@ -1431,17 +1422,17 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 					const u8 *data, int data_off,
 					const u8 *oob, int oob_off,
-					int *cur_off, int step,
+					int *cur_off, int logical_step,
 					int page)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
+	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, logical_step);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	bool bbm = !step;
+	bool bbm = !logical_step;
 	int ret;
 	/* From the controller point of view, we are at step 0 */
-	const int nfc_step = 0;
+	const int hw_step = 0;
 
 	if (data_off != *cur_off) {
 		ret = nand_change_write_column_op(nand, data_off, NULL, 0, false);
@@ -1465,8 +1456,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
-	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
+	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, hw_step, bbm, page,
 					    user_data_sz);
 
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
@@ -1523,7 +1514,7 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	unsigned int max_bitflips = 0;
 	int ret, i, cur_off = 0;
-	bool raw_mode = false;
+	bool erased_chunk_found = false;
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
@@ -1547,12 +1538,12 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 		if (ret < 0)
 			goto out;
 		else if (ret)
-			raw_mode = true;
+			erased_chunk_found = true;
 	}
 
 	if (oob_required) {
 		ret = sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi, &cur_off,
-						      !raw_mode, page);
+						      !erased_chunk_found, page);
 		if (ret)
 			goto out;
 	}

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
