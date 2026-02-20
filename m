Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF895C5ACD4
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Feb 2026 16:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XrPXRGBPWa+HqUVfUXQ2PFg0Uh1oAs9c1IelolBiRig=; b=BCWgBuY2JvJXfZ
	V4ii2SbvXyjcU59Xn782t9/7dRwomW6kD4vhYXCT338v0MWs5/bxWP7Gjr224+vMdGDZmYo4NH2Z4
	GsarF+GUQg+9fgsT8bGPjMsthPWJcvqq/i+x1uamPg3qGg8CZzV2ObxI+af15YklCqzl9yQ24CAB1
	hgXupT6CwAWW9ydKNczQy2s5HsGiq/3ZeXNOalmyPX8PtQEaDmm6qbWzI7Be++qSQ7SBiaXpVdFer
	+VfrnsJatjReSDnSHNPSJQ0/1/jh/GYipyUwn5gBqmuw8HMOPZ0/7tKBSziFQYQtvBjkhlQv96ywR
	w4XwaxE1ccP4S73jBQ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtT5h-0000000FBn4-3Ik4;
	Fri, 20 Feb 2026 16:10:53 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtT5X-0000000FBY7-0Xop
	for linux-mtd@lists.infradead.org;
	Fri, 20 Feb 2026 16:10:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A8AF54E4096B;
	Fri, 20 Feb 2026 16:10:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 795C05FA8F;
	Fri, 20 Feb 2026 16:10:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8E30D10368D4B;
	Fri, 20 Feb 2026 17:10:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771603840; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=UqpZTvvt0fMC9dbVr1f07YoDPUQAVg+MQ+VVonZm8Rg=;
	b=yhJmCVCP4qGYwVk0PIeSeCC4BajSstWTbNZUl9vo/aqAc8S8AmHnbGcj2djGfofCrIcg1t
	yKj+sLKvZ3huTs1myiFylrcqIgvEv/JD8yRhGrOA3Yiu79ojkERc07e6iH0mad2DfiJULo
	T5xqOCkFQYNiOjwm7pXBfyN2M8oAZMxtGfsK9MFNMQDRF1CoZXKUGWHsZTjjF2t54gh748
	abBuKQK9uPFvZfN7pl2Dp8AyS6jkj9BHGAjfz01HspZY0JTtwKiWCqQttpy4tcDbBceL4E
	N5ouJfQ/9Qj8kbTRFG25pm9yGiTqCEurEMJsTmcs6XJI7FqXMLOsXX8uov390Q==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH 6/6] mtd: rawnand: sunxi: introduce variable user data length
Date: Fri, 20 Feb 2026 17:10:11 +0100
Message-ID: <20260220161011.999642-7-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260220161011.999642-1-richard.genoud@bootlin.com>
References: <20260220161011.999642-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_081043_444498_CE47A836 
X-CRM114-Status: GOOD (  24.68  )
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

In Allwinner SoCs, user data can be added in OOB before each ECC data.
For older SoCs like A10, the user data size was the size of a register
(4 bytes) and was mandatory before each ECC step.
So, the A10 OOB Layout is:
[4Bytes USER_DATA_STEP0] [ECC_STEP0 bytes]
[4bytes USER_DATA_STEP1] [ECC_STEP1 bytes]
...
NB: the BBM is stored at the beginning of the USER_DATA_STEP0.

Now, for H6/H616 NAND flash controller, this user data can have a
different size for each step.
And the vendor has chosen a different layout from the one on A10, using
8 bytes for step 0 and nothing for further steps:
[8bytes USER_DATA_STEP0] [ECC_STEP0 bytes] [ECC_STEP1 bytes]...
(Still with BBM stored at the beginning of the USER_DATA_STEP0)

In order to be compatible with this layout, the current one for H6/H616
has to be changed.

Fixes: 88fd4e4deae8 ("mtd: rawnand: sunxi: Add support for H616 nand controller")
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 267 ++++++++++++++++++++++--------
 1 file changed, 201 insertions(+), 66 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index b3a0f70dd4e9..0b6be18a0aaa 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -213,17 +213,6 @@
 
 #define NFC_MAX_CS		7
 
-/*
- * On A10/A23, this is the size of the NDFC User Data Register, containing the
- * mandatory user data bytes following the ECC for each ECC step.
- * Thus, for each ECC step, we need the ECC bytes + USER_DATA_SZ.
- * Those bits are currently unsused, and kept as default value 0xffffffff.
- *
- * On H6/H616, this size became configurable, from 0 bytes to 32, via the
- * USER_DATA_LEN registers.
- */
-#define USER_DATA_SZ 4
-
 /**
  * struct sunxi_nand_chip_sel - stores information related to NAND Chip Select
  *
@@ -306,6 +295,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  *			bytes to write
  * @nuser_data_tab:	Size of @user_data_len_tab
  * @sram_size:		Size of the NAND controller SRAM
+ * @user_data_len	Function returning the user data length for a step
  */
 struct sunxi_nfc_caps {
 	bool has_mdma;
@@ -332,6 +322,7 @@ struct sunxi_nfc_caps {
 	unsigned int nuser_data_tab;
 	unsigned int max_ecc_steps;
 	int sram_size;
+	unsigned int (*user_data_len)(int step);
 };
 
 /**
@@ -830,11 +821,40 @@ static inline u32 sunxi_nfc_buf_to_user_data(const u8 *buf)
 }
 
 static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
-						int step, bool bbm, int page)
+						int step, bool bbm, int page,
+						unsigned int user_data_sz)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	u32 user_data;
 
-	sunxi_nfc_user_data_to_buf(readl(nfc->regs + NFC_REG_USER_DATA(nfc, step)), oob);
+	if (!nfc->caps->reg_user_data_len) {
+		/*
+		 * For A10, the user data for step n is in the nth
+		 * REG_USER_DATA
+		 */
+		user_data = readl(nfc->regs + NFC_REG_USER_DATA(nfc, step));
+		sunxi_nfc_user_data_to_buf(user_data, oob);
+	} else {
+		/*
+		 * For H6 NAND controller, the user data for all steps is
+		 * contained in 32 user data registers, but not at a specific
+		 * offset for each step, they are just concatenated.
+		 */
+		unsigned int user_data_off = 0;
+		unsigned int reg_off;
+		u8 *ptr = oob;
+		unsigned int i;
+
+		for (i = 0; i < step; i++)
+			user_data_off += nfc->caps->user_data_len(i);
+
+		user_data_off /= 4;
+		for (i = 0; i < user_data_sz / 4; i++, ptr += 4) {
+			reg_off = NFC_REG_USER_DATA(nfc, user_data_off + i);
+			user_data = readl(nfc->regs + reg_off);
+			sunxi_nfc_user_data_to_buf(user_data, ptr);
+		}
+	}
 
 	/* De-randomize the Bad Block Marker. */
 	if (bbm && (nand->options & NAND_NEED_SCRAMBLING))
@@ -893,17 +913,45 @@ static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 						bool bbm, int page)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	u8 user_data[USER_DATA_SZ];
+	unsigned int user_data_sz = nfc->caps->user_data_len(step);
+	u8 *user_data = NULL;
 
 	/* Randomize the Bad Block Marker. */
 	if (bbm && (nand->options & NAND_NEED_SCRAMBLING)) {
-		memcpy(user_data, oob, sizeof(user_data));
+		user_data = kmalloc(user_data_sz, GFP_KERNEL);
+		memcpy(user_data, oob, user_data_sz);
 		sunxi_nfc_randomize_bbm(nand, page, user_data);
 		oob = user_data;
 	}
 
-	writel(sunxi_nfc_buf_to_user_data(oob),
-	       nfc->regs + NFC_REG_USER_DATA(nfc, step));
+	if (!nfc->caps->reg_user_data_len) {
+		/*
+		 * For A10, the user data for step n is in the nth
+		 * REG_USER_DATA
+		 */
+		writel(sunxi_nfc_buf_to_user_data(oob),
+		       nfc->regs + NFC_REG_USER_DATA(nfc, step));
+	} else {
+		/*
+		 * For H6 NAND controller, the user data for all steps is
+		 * contained in 32 user data registers, but not at a specific
+		 * offset for each step, they are just concatenated.
+		 */
+		unsigned int user_data_off = 0;
+		const u8 *ptr = oob;
+		unsigned int i;
+
+		for (i = 0; i < step; i++)
+			user_data_off += nfc->caps->user_data_len(i);
+
+		user_data_off /= 4;
+		for (i = 0; i < user_data_sz / 4; i++, ptr += 4) {
+			writel(sunxi_nfc_buf_to_user_data(ptr),
+			       nfc->regs + NFC_REG_USER_DATA(nfc, user_data_off + i));
+		}
+	}
+
+	kfree(user_data);
 }
 
 static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
@@ -924,6 +972,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 				    bool *erased)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	unsigned int user_data_sz = nfc->caps->user_data_len(step);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	u32 tmp;
 
@@ -946,7 +995,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 			memset(data, pattern, ecc->size);
 
 		if (oob)
-			memset(oob, pattern, ecc->bytes + USER_DATA_SZ);
+			memset(oob, pattern, ecc->bytes + user_data_sz);
 
 		return 0;
 	}
@@ -961,12 +1010,14 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 				       u8 *oob, int oob_off,
 				       int *cur_off,
 				       unsigned int *max_bitflips,
-				       bool bbm, bool oob_required, int page)
+				       int step, bool oob_required, int page)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	unsigned int user_data_sz = nfc->caps->user_data_len(step);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int raw_mode = 0;
 	u32 pattern_found;
+	bool bbm = !step;
 	bool erased;
 	int ret;
 	/* From the controller point of view, we are at step 0 */
@@ -984,8 +1035,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_reset_user_data_len(nfc);
-	sunxi_nfc_set_user_data_len(nfc, USER_DATA_SZ, nfc_step);
+	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -996,7 +1046,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	*cur_off = oob_off + ecc->bytes + USER_DATA_SZ;
+	*cur_off = oob_off + ecc->bytes + user_data_sz;
 
 	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
 	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
@@ -1020,10 +1070,10 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 				      ecc->size);
 
 		nand_change_read_column_op(nand, oob_off, oob,
-					   ecc->bytes + USER_DATA_SZ, false);
+					   ecc->bytes + user_data_sz, false);
 
 		ret = nand_check_erased_ecc_chunk(data,	ecc->size, oob,
-						  ecc->bytes + USER_DATA_SZ,
+						  ecc->bytes + user_data_sz,
 						  NULL, 0, ecc->strength);
 		if (ret >= 0)
 			raw_mode = 1;
@@ -1033,11 +1083,11 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 		if (oob_required) {
 			nand_change_read_column_op(nand, oob_off, NULL, 0,
 						   false);
-			sunxi_nfc_randomizer_read_buf(nand, oob, ecc->bytes + USER_DATA_SZ,
+			sunxi_nfc_randomizer_read_buf(nand, oob, ecc->bytes + user_data_sz,
 						      true, page);
 
 			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, nfc_step,
-							    bbm, page);
+							    bbm, page, user_data_sz);
 		}
 	}
 
@@ -1046,13 +1096,41 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	return raw_mode;
 }
 
+/*
+ * Returns the offset of the OOB for each step.
+ * (it includes the user data before the ECC data.)
+ */
+static int sunxi_get_oob_offset(struct sunxi_nfc *nfc,
+				struct nand_ecc_ctrl *ecc, int step)
+{
+	int ecc_off = step * ecc->bytes;
+	int i;
+
+	for (i = 0; i < step; i++)
+		ecc_off += nfc->caps->user_data_len(i);
+
+	return ecc_off;
+}
+
+/*
+ * Returns the offset of the ECC for each step.
+ * So, it's the same as sunxi_get_oob_offset(),
+ * but it skips the next user data.
+ */
+static int sunxi_get_ecc_offset(struct sunxi_nfc *nfc,
+				struct nand_ecc_ctrl *ecc, int step)
+{
+	return sunxi_get_oob_offset(nfc, ecc, step) + nfc->caps->user_data_len(step);
+}
+
 static void sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 					    u8 *oob, int *cur_off,
 					    bool randomize, int page)
 {
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int offset = ((ecc->bytes + USER_DATA_SZ) * ecc->steps);
+	int offset = sunxi_get_oob_offset(nfc, ecc, ecc->steps);
 	int len = mtd->oobsize - offset;
 
 	if (len <= 0)
@@ -1096,7 +1174,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 
 	sunxi_nfc_hw_ecc_enable(nand);
 	sunxi_nfc_reset_user_data_len(nfc);
-	sunxi_nfc_set_user_data_len(nfc, USER_DATA_SZ, 0);
+	for (i = 0; i < nchunks; i++)
+		sunxi_nfc_set_user_data_len(nfc, nfc->caps->user_data_len(i), i);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 
@@ -1131,7 +1210,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 
 	for (i = 0; i < nchunks; i++) {
 		int data_off = i * ecc->size;
-		int oob_off = i * (ecc->bytes + USER_DATA_SZ);
+		unsigned int user_data_sz = nfc->caps->user_data_len(i);
+		int oob_off = sunxi_get_oob_offset(nfc, ecc, i);
 		u8 *data = buf + data_off;
 		u8 *oob = nand->oob_poi + oob_off;
 		bool erased;
@@ -1149,10 +1229,10 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 			/* TODO: use DMA to retrieve OOB */
 			nand_change_read_column_op(nand,
 						   mtd->writesize + oob_off,
-						   oob, ecc->bytes + USER_DATA_SZ, false);
+						   oob, ecc->bytes + user_data_sz, false);
 
-			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, i,
-							    !i, page);
+			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, i, !i,
+							    page, user_data_sz);
 		}
 
 		if (erased)
@@ -1164,7 +1244,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 	if (status & NFC_ECC_ERR_MSK(nfc)) {
 		for (i = 0; i < nchunks; i++) {
 			int data_off = i * ecc->size;
-			int oob_off = i * (ecc->bytes + USER_DATA_SZ);
+			unsigned int user_data_sz = nfc->caps->user_data_len(i);
+			int oob_off = sunxi_get_oob_offset(nfc, ecc, i);
 			u8 *data = buf + data_off;
 			u8 *oob = nand->oob_poi + oob_off;
 
@@ -1184,10 +1265,10 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 			/* TODO: use DMA to retrieve OOB */
 			nand_change_read_column_op(nand,
 						   mtd->writesize + oob_off,
-						   oob, ecc->bytes + USER_DATA_SZ, false);
+						   oob, ecc->bytes + user_data_sz, false);
 
 			ret = nand_check_erased_ecc_chunk(data,	ecc->size, oob,
-							  ecc->bytes + USER_DATA_SZ,
+							  ecc->bytes + user_data_sz,
 							  NULL, 0,
 							  ecc->strength);
 			if (ret >= 0)
@@ -1208,11 +1289,13 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 					const u8 *data, int data_off,
 					const u8 *oob, int oob_off,
-					int *cur_off, bool bbm,
+					int *cur_off, int step,
 					int page)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	unsigned int user_data_sz = nfc->caps->user_data_len(step);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	bool bbm = !step;
 	int ret;
 	/* From the controller point of view, we are at step 0 */
 	const int nfc_step = 0;
@@ -1231,8 +1314,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_reset_user_data_len(nfc);
-	sunxi_nfc_set_user_data_len(nfc, USER_DATA_SZ, nfc_step);
+	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
 	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page);
 
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
@@ -1244,7 +1326,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	*cur_off = oob_off + ecc->bytes + USER_DATA_SZ;
+	*cur_off = oob_off + ecc->bytes + user_data_sz;
 
 	return 0;
 }
@@ -1255,7 +1337,8 @@ static void sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int offset = ((ecc->bytes + USER_DATA_SZ) * ecc->steps);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	int offset = sunxi_get_oob_offset(nfc, ecc, ecc->steps);
 	int len = mtd->oobsize - offset;
 
 	if (len <= 0)
@@ -1274,6 +1357,7 @@ static void sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 				      int oob_required, int page)
 {
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	unsigned int max_bitflips = 0;
@@ -1286,16 +1370,17 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
+	sunxi_nfc_reset_user_data_len(nfc);
 	for (i = 0; i < ecc->steps; i++) {
 		int data_off = i * ecc->size;
-		int oob_off = i * (ecc->bytes + USER_DATA_SZ);
+		int oob_off = sunxi_get_oob_offset(nfc, ecc, i);
 		u8 *data = buf + data_off;
 		u8 *oob = nand->oob_poi + oob_off;
 
 		ret = sunxi_nfc_hw_ecc_read_chunk(nand, data, data_off, oob,
 						  oob_off + mtd->writesize,
 						  &cur_off, &max_bitflips,
-						  !i, oob_required, page);
+						  i, oob_required, page);
 		if (ret < 0)
 			return ret;
 		else if (ret)
@@ -1333,6 +1418,7 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 					 u32 data_offs, u32 readlen,
 					 u8 *bufpoi, int page)
 {
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret, i, cur_off = 0;
@@ -1344,17 +1430,18 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
+	sunxi_nfc_reset_user_data_len(nfc);
 	for (i = data_offs / ecc->size;
 	     i < DIV_ROUND_UP(data_offs + readlen, ecc->size); i++) {
 		int data_off = i * ecc->size;
-		int oob_off = i * (ecc->bytes + USER_DATA_SZ);
+		int oob_off = sunxi_get_oob_offset(nfc, ecc, i);
 		u8 *data = bufpoi + data_off;
 		u8 *oob = nand->oob_poi + oob_off;
 
 		ret = sunxi_nfc_hw_ecc_read_chunk(nand, data, data_off,
 						  oob,
 						  oob_off + mtd->writesize,
-						  &cur_off, &max_bitflips, !i,
+						  &cur_off, &max_bitflips, i,
 						  false, page);
 		if (ret < 0)
 			return ret;
@@ -1389,6 +1476,7 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 				       const uint8_t *buf, int oob_required,
 				       int page)
 {
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret, i, cur_off = 0;
@@ -1399,15 +1487,16 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
+	sunxi_nfc_reset_user_data_len(nfc);
 	for (i = 0; i < ecc->steps; i++) {
 		int data_off = i * ecc->size;
-		int oob_off = i * (ecc->bytes + USER_DATA_SZ);
+		int oob_off = sunxi_get_oob_offset(nfc, ecc, i);
 		const u8 *data = buf + data_off;
 		const u8 *oob = nand->oob_poi + oob_off;
 
 		ret = sunxi_nfc_hw_ecc_write_chunk(nand, data, data_off, oob,
 						   oob_off + mtd->writesize,
-						   &cur_off, !i, page);
+						   &cur_off, i, page);
 		if (ret)
 			return ret;
 	}
@@ -1426,6 +1515,7 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 					  const u8 *buf, int oob_required,
 					  int page)
 {
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret, i, cur_off = 0;
@@ -1436,16 +1526,17 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
+	sunxi_nfc_reset_user_data_len(nfc);
 	for (i = data_offs / ecc->size;
 	     i < DIV_ROUND_UP(data_offs + data_len, ecc->size); i++) {
 		int data_off = i * ecc->size;
-		int oob_off = i * (ecc->bytes + USER_DATA_SZ);
+		int oob_off = sunxi_get_oob_offset(nfc, ecc, i);
 		const u8 *data = buf + data_off;
 		const u8 *oob = nand->oob_poi + oob_off;
 
 		ret = sunxi_nfc_hw_ecc_write_chunk(nand, data, data_off, oob,
 						   oob_off + mtd->writesize,
-						   &cur_off, !i, page);
+						   &cur_off, i, page);
 		if (ret)
 			return ret;
 	}
@@ -1479,10 +1570,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
 	sunxi_nfc_reset_user_data_len(nfc);
 	for (i = 0; i < ecc->steps; i++) {
-		const u8 *oob = nand->oob_poi + (i * (ecc->bytes + USER_DATA_SZ));
+		unsigned int user_data_sz = nfc->caps->user_data_len(i);
+		int oob_off = sunxi_get_oob_offset(nfc, ecc, i);
+		const u8 *oob = nand->oob_poi + oob_off;
 
 		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page);
-		sunxi_nfc_set_user_data_len(nfc, USER_DATA_SZ, i);
+		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
 	}
 
 	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
@@ -1746,11 +1839,12 @@ static int sunxi_nand_ooblayout_ecc(struct mtd_info *mtd, int section,
 {
 	struct nand_chip *nand = mtd_to_nand(mtd);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 
 	if (section >= ecc->steps)
 		return -ERANGE;
 
-	oobregion->offset = section * (ecc->bytes + USER_DATA_SZ) + USER_DATA_SZ;
+	oobregion->offset = sunxi_get_ecc_offset(nfc, ecc, section);
 	oobregion->length = ecc->bytes;
 
 	return 0;
@@ -1761,18 +1855,20 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 {
 	struct nand_chip *nand = mtd_to_nand(mtd);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	unsigned int user_data_sz = nfc->caps->user_data_len(section);
 
 	if (section > ecc->steps)
 		return -ERANGE;
 
 	/*
 	 * The first 2 bytes are used for BB markers, hence we
-	 * only have USER_DATA_SZ - 2 bytes available in the first user data
+	 * only have user_data_sz - 2 bytes available in the first user data
 	 * section.
 	 */
 	if (!section && ecc->engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST) {
 		oobregion->offset = 2;
-		oobregion->length = USER_DATA_SZ - 2;
+		oobregion->length = user_data_sz - 2;
 
 		return 0;
 	}
@@ -1784,10 +1880,10 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 	if (section == ecc->steps && ecc->engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST)
 		return -ERANGE;
 
-	oobregion->offset = section * (ecc->bytes + USER_DATA_SZ);
+	oobregion->offset = sunxi_get_ecc_offset(nfc, ecc, section);
 
 	if (section < ecc->steps)
-		oobregion->length = USER_DATA_SZ;
+		oobregion->length = user_data_sz;
 	else
 		oobregion->length = mtd->oobsize - oobregion->offset;
 
@@ -1808,14 +1904,18 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	const u8 *strengths = nfc->caps->ecc_strengths;
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_device *nanddev = mtd_to_nanddev(mtd);
+	int total_user_data_sz = 0;
 	int nsectors;
 	int i;
 
-	if (nanddev->ecc.user_conf.flags & NAND_ECC_MAXIMIZE_STRENGTH) {
-		int bytes;
+	ecc->size = 1024;
+	nsectors = mtd->writesize / ecc->size;
 
-		ecc->size = 1024;
-		nsectors = mtd->writesize / ecc->size;
+	for (i = 0; i < nsectors; i++)
+		total_user_data_sz += nfc->caps->user_data_len(i);
+
+	if (nanddev->ecc.user_conf.flags & NAND_ECC_MAXIMIZE_STRENGTH) {
+		int bytes = mtd->oobsize;
 
 		/*
 		 * The 2 BBM bytes should not be removed from the grand total,
@@ -1825,15 +1925,15 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 		 * compatibility.
 		 */
 		if (nfc->caps->legacy_max_strength)
-			bytes = (mtd->oobsize - 2) / nsectors;
-		else
-			bytes = mtd->oobsize / nsectors;
+			bytes -= 2;
+
+		bytes -= total_user_data_sz;
 
 		/*
-		 * USER_DATA_SZ non-ECC bytes are added before each ECC bytes
-		 * section, they contain the 2 BBM bytes
+		 * Once all user data has been subtracted, the rest can be used
+		 * for ECC bytes
 		 */
-		bytes -= USER_DATA_SZ;
+		bytes /= nsectors;
 
 		/* and bytes has to be even. */
 		if (bytes % 2)
@@ -1886,7 +1986,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 
 	nsectors = mtd->writesize / ecc->size;
 
-	if (mtd->oobsize < ((ecc->bytes + USER_DATA_SZ) * nsectors))
+	if (mtd->oobsize < (ecc->bytes * nsectors + total_user_data_sz))
 		return -EINVAL;
 
 	ecc->read_oob = sunxi_nfc_hw_ecc_read_oob;
@@ -2383,6 +2483,38 @@ static void sunxi_nfc_remove(struct platform_device *pdev)
 		dma_release_channel(nfc->dmac);
 }
 
+static unsigned int sunxi_user_data_len_h616(int step)
+{
+	/*
+	 * On H6/H616, the user data size became configurable,
+	 * from 0 bytes to 32, via the USER_DATA_LEN registers.
+	 *
+	 * In H616 vendor image, the user data length is 8 byte on step 0
+	 * (that includes the BBM) and 0 bytes for the rest.
+	 * So the OOB layout is:
+	 * [BBM] [BBM] [6bytes USER_DATA_STEP0] [ECC_STEP0 bytes] [ECC_STEP1 bytes]...
+	 */
+	if (step == 0)
+		return 8;
+	return 0;
+}
+
+static unsigned int sunxi_user_data_len_a10(int step)
+{
+	/*
+	 * On A10/A23, this is the size of the NDFC User Data Register,
+	 * containing the mandatory user data bytes preceding the ECC for each
+	 * ECC step (and including the BBM)
+	 * Thus, for each ECC step, we need USER_DATA_SZ + ECC bytes.
+	 *
+	 * So the layout is:
+	 * [BBM] [BBM] [2Bytes USER_DATA_STEP0] [ECC_STEP0 bytes]
+	 * [4bytes USER_DATA_STEP1] [ECC_step1 bytes]...
+	 */
+
+	return 4;
+}
+
 static const u8 sunxi_ecc_strengths_a10[] = {
 	16, 24, 28, 32, 40, 48, 56, 60, 64
 };
@@ -2414,6 +2546,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.nstrengths = ARRAY_SIZE(sunxi_ecc_strengths_a10),
 	.max_ecc_steps = 16,
 	.sram_size = 1024,
+	.user_data_len = &sunxi_user_data_len_a10,
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
@@ -2436,6 +2569,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.nstrengths = ARRAY_SIZE(sunxi_ecc_strengths_a10),
 	.max_ecc_steps = 16,
 	.sram_size = 1024,
+	.user_data_len = &sunxi_user_data_len_a10,
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
@@ -2460,6 +2594,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
 	.nuser_data_tab = ARRAY_SIZE(sunxi_user_data_len_h6),
 	.max_ecc_steps = 32,
 	.sram_size = 8192,
+	.user_data_len = &sunxi_user_data_len_h616,
 };
 
 static const struct of_device_id sunxi_nfc_ids[] = {

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
