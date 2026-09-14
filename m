Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B576C88E5C
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 03:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z7a0RWrrBcZcCkkb8DmBcKAUhZ1yOPFVvtXwHo4bEz8=; b=vIw89cdxb6FSsB
	HSKqktgCOhZAxNZkrWH9CgeWU4EtnPMxNPFrqpQa/Da6OmczSfgWdKwrC6iZF5kx8j2sgTIF8DYNu
	tIz1P+YMIr8ig2QX5sCZeuSnz4UtffOJVFN1GbWMQBsUJmT7x+udJzeHh9yHkpGK5sk3cRN8A99Bc
	mt6ZYLQFC1rWS9EaENl4slC4LLN1y8TASX+UjnCm5Q8G0relaWf1XG9mUH9HvcLBsOYA0ljxRzWiH
	KuOxW5Vv85DpcBVk+zvmvg+yk4np2B+VHz2HEDcF2feRbGL7p04JG7HTCGr/ZX6VkL1KhaBeHJT5T
	Yu+0aoBxMIY9ggj34hUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wxQ-00000002DGH-0l4K;
	Mon, 14 Sep 2026 03:02:12 +0000
Received: from mail-oo2-x0c.google.com ([2607:f8b0:4864:31::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wx7-00000002ClQ-2jw0
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 03:01:55 +0000
Received: by mail-oo2-x0c.google.com with SMTP id 46e09a7af769-7f4f1354074so249939a34.0
        for <linux-mtd@lists.infradead.org>; Sun, 13 Sep 2026 20:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354913; x=1789959713; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+fPDpmxms4ltLqy8HoVcRfs0if/gr5P6/mMAZPDSTxM=;
        b=K5KaKs1eddp0v/34O/UPu8mRyzlDl8MX2hiYz9tOBakF2GL48bAop0iF62R00+IlwQ
         3QiWfE1/nEdR83dAlkvEmNiA3nZXUuvRELRE483kdy3wZUuJG0tFn+ggNW2JCHuRhYZ+
         kE4He8ExHF9heakADRrOBxYbtncj/wHqT8wQitk4VAJtHMytv1MPsoBMp5rpm/hTIKyh
         BBqMvDVe7K+n0Nesy61bVfPmWT43dPmdqzENycu0HkO9WpFDVg4GFn0oITSl1Ps2dhg3
         BlqksDLv+kgo9tqpO6bh0vbjOpFXUS08ObJbJ2WROOD8g0+t5AtxVr7bLrs8nJ6OVFTh
         oqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354913; x=1789959713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fPDpmxms4ltLqy8HoVcRfs0if/gr5P6/mMAZPDSTxM=;
        b=rXcD0FoQzFqy82YPVxAFBrNu+p+vjyIFYAhTGw6lLOaMDSFpLgRFda2TA0s7aIqKi2
         p+E+a9+e2NQSY1m1HWMiDlZzAg+9UoM872jE1akz7SZaQVf5QsC+TdtdAXDPl+mx0pJ7
         UIMOnnUdzZRz/6peoj9uCmhk1vl+oCkLaBkJS5bixLn4G83PmaoL4D4TkhZcpPQ0hOuX
         fc0r6ge9CXiswPabA4Ap1B0Sjh9XE+cxdUvpfKzroi7lpwFuR7S+XS21+oNo9ZPHZs1j
         xuzcs8rUUFDBzLHYL+eawygEEeriefPaNvMTCsh7jOPeKO+e07WIUZ15cWDXjQtaQItZ
         QcnA==
X-Gm-Message-State: AFuF++ktsId2TYo2gdcT3WXV2mdA8tkoN0mF0VmCgw4bpQSDpnVnYY0b
	1tGN5l/OOOGnfXrhKjz2UDzXFpuynEoT7/Jj7h+s2/mwxwIgZSG3pp9C
X-Gm-Gg: AYBFou2vrufepRgayunL0w1owxIXneOgYE3Uu8koU+zuT1kTkSoj00aOjLdvXAy4u0D
	QmX3vkv2mT2w6ezRi1reclQPBKaoaOlRYPg6hyOex8lVuhBcJMEo2LKktCpehfwdW30hCtfmgLU
	vc+02OwMS98DnEuBjzx8KXX18wYax/VJGgutzdzHqJyYjA2DjGlFIsE5FpiE5IO21MHPPfrFmfN
	cWbXsUg+jNJQXKrzodKDgIySBWlE6yybon8ptRgM5G2Mr4nzP/aJvDWpb2cV86/qENXFkqH9Sf+
	WRlIs7dPcFT0qPPqN+pUU+PpK5mS1HZiGHv1sxh3OvAGmTQAKDxM4mOMJb7nmMzSJtwJFePfR0F
	U+5/PDtzKmqvRVaEmF7NrNjmxWgYVVj/5urCXxXU1TU8rwf1e8mv7+s6kaCvW3eoYtJNUoMUlHt
	GMc1FvBkTiwVZsRge+tNdsY+WMvcLsavtEjwjFzFdeHS7kxFWbEgUaynpqN+lQ/ohDWQX0KCfxC
	OEMo+XtmCEZclMsXODgtC/XQ+KXBPJz3UTT3iJ4rNA76O/Pkx7h52e6iwyv/0+ngZXQmdgKBg0S
	Z4d4Yar2cnF8cOhXWFFU0mPe81um/zHrmaaWAkCumTyLLkQQfedQE3ph/SN27qPaFEHOrxZVOcx
	/3K7stxKtlpTzoouXSyd15pOcDpDT2w==
X-Received: by 2002:a05:6830:2548:b0:805:b4a8:724e with SMTP id 46e09a7af769-80884ad0cb3mr373073a34.6.1789354912706;
        Sun, 13 Sep 2026 20:01:52 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:16 -0600
Subject: [PATCH v5 10/18] mtd: rawnand: sunxi: bound DMA batches by the
 user-data register bank
MIME-Version: 1.0
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-10-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
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
X-CRM114-CacheID: sfid-20260913_200153_768238_70585809 
X-CRM114-Status: GOOD (  22.32  )
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

The H6/H616 controller concatenates protected user data in a bank of 32
four-byte registers. The default layout can allocate more than 128 bytes
across a page, even though each ECC step fits its individual length limit.
DMA transfers then access beyond the user-data register bank. For example,
a 16 KiB page with 1280 OOB bytes and BCH40/1024 has 160 user-data bytes,
while a 16 KiB page with 1664 OOB bytes can allocate 512 bytes.

Do not cap that allocation: changing the lengths would move ECC offsets
and make existing pages written through PIO incompatible. Instead, split
DMA transfers into batches whose aggregate user data fits the bank. Reuse
hardware slots and user-data registers from zero in each batch, retaining
the original logical main-data and OOB offsets. Reposition the main column
and spare-area base before subsequent batches. Keep pages whose user data
already fits on the existing single-batch path.

Pass the user-data register index directly to the protected-OOB helpers
and program length fields from the batch's logical starting step. Collect
each batch's ECC status and protected OOB before reusing the registers.
Keep ECC accounting and trailing-OOB handling page-wide, remembering
whether any batch found an erased chunk. Discard all partial DMA statistics
before a PIO read retry.

Use one page-read setup or program-begin command for the whole page. Only
issue program-end after every batch and any trailing OOB transfer succeed.
Do not retry a write in PIO after a batch has already been transferred.
The allocator, free-OOB layout and raw-access callbacks are unchanged.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 276 +++++++++++++++++++++-----------------
 1 file changed, 155 insertions(+), 121 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index e29638c828ca..fbea6f16ea9d 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -54,6 +54,7 @@
 #define NFC_REG_H6_RDATA_1	0x004C
 #define NFC_REG_A10_USER_DATA	0x0050
 #define NFC_REG_H6_USER_DATA	0x0080
+#define NFC_H6_USER_DATA_REGS	32
 #define NFC_REG_USER_DATA(nfc, x)	(nfc->caps->reg_user_data + ((x) * 4))
 #define NFC_REG_H6_USER_DATA_LEN 0x0070
 /* A USER_DATA_LEN register can hold the length of 8 USER_DATA registers */
@@ -932,41 +933,39 @@ static u8 sunxi_nfc_user_data_sz(struct sunxi_nand_chip *sunxi_nand, int step)
 	return sunxi_nand->user_data_bytes[step];
 }
 
+/* Keep the on-flash layout, but fit each DMA batch in the user-data bank. */
+static int sunxi_nfc_dma_batch_steps(struct nand_chip *nand,
+				     int first_step, int end_step)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	unsigned int user_data_sz = 0;
+	int i;
+
+	if (!nfc->caps->reg_user_data_len)
+		return end_step - first_step;
+
+	for (i = first_step; i < end_step; i++) {
+		user_data_sz += sunxi_nfc_user_data_sz(sunxi_nand, i);
+		if (user_data_sz > NFC_H6_USER_DATA_REGS * sizeof(u32))
+			break;
+	}
+
+	return i - first_step;
+}
+
+/* PIO uses register zero; DMA concatenates user data within each batch. */
 static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
-						int step, bool bbm, int page,
+						unsigned int reg_index, bool bbm, int page,
 						unsigned int user_data_sz)
 {
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	u32 user_data;
+	unsigned int i;
 
-	if (!nfc->caps->reg_user_data_len) {
-		/*
-		 * For A10, the user data for step n is in the nth
-		 * REG_USER_DATA
-		 */
-		user_data = readl(nfc->regs + NFC_REG_USER_DATA(nfc, step));
-		sunxi_nfc_user_data_to_buf(user_data, oob);
-	} else {
-		/*
-		 * For H6 NAND controller, the user data for all steps is
-		 * contained in 32 user data registers, but not at a specific
-		 * offset for each step, they are just concatenated.
-		 */
-		unsigned int user_data_off = 0;
-		unsigned int reg_off;
-		u8 *ptr = oob;
-		unsigned int i;
-
-		for (i = 0; i < step; i++)
-			user_data_off += sunxi_nfc_user_data_sz(sunxi_nand, i);
-
-		user_data_off /= 4;
-		for (i = 0; i < user_data_sz / 4; i++, ptr += 4) {
-			reg_off = NFC_REG_USER_DATA(nfc, user_data_off + i);
-			user_data = readl(nfc->regs + reg_off);
-			sunxi_nfc_user_data_to_buf(user_data, ptr);
-		}
+	for (i = 0; i < user_data_sz / 4; i++) {
+		user_data = readl(nfc->regs + NFC_REG_USER_DATA(nfc, reg_index + i));
+		sunxi_nfc_user_data_to_buf(user_data, oob + i * 4);
 	}
 
 	/* De-randomize the Bad Block Marker. */
@@ -1022,13 +1021,13 @@ static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
-						const u8 *oob, int step,
+						const u8 *oob, unsigned int reg_index,
 						bool bbm, int page,
 						unsigned int user_data_sz)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
+	unsigned int i;
 
 	/* Randomize the Bad Block Marker. */
 	if (bbm && (nand->options & NAND_NEED_SCRAMBLING)) {
@@ -1037,33 +1036,10 @@ static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 		oob = user_data;
 	}
 
-	if (!nfc->caps->reg_user_data_len) {
-		/*
-		 * For A10, the user data for step n is in the nth
-		 * REG_USER_DATA
-		 */
-		writel(sunxi_nfc_buf_to_user_data(oob),
-		       nfc->regs + NFC_REG_USER_DATA(nfc, step));
-	} else {
-		/*
-		 * For H6 NAND controller, the user data for all steps is
-		 * contained in 32 user data registers, but not at a specific
-		 * offset for each step, they are just concatenated.
-		 */
-		unsigned int user_data_off = 0;
-		const u8 *ptr = oob;
-		unsigned int i;
-
-		for (i = 0; i < step; i++)
-			user_data_off += sunxi_nfc_user_data_sz(sunxi_nand, i);
-
-		user_data_off /= 4;
-		for (i = 0; i < user_data_sz / 4; i++, ptr += 4) {
-			writel(sunxi_nfc_buf_to_user_data(ptr),
-			       nfc->regs + NFC_REG_USER_DATA(nfc, user_data_off + i));
-		}
+	for (i = 0; i < user_data_sz / 4; i++) {
+		writel(sunxi_nfc_buf_to_user_data(oob + i * 4),
+		       nfc->regs + NFC_REG_USER_DATA(nfc, reg_index + i));
 	}
-
 }
 
 static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
@@ -1313,27 +1289,35 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 	return 0;
 }
 
-static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf,
-					    int oob_required, int page,
-					    int nchunks)
+static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
+					   int oob_required, int page,
+					   int first_step, int nchunks,
+					   int *raw_mode)
 {
 	bool randomized = nand->options & NAND_NEED_SCRAMBLING;
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	unsigned int corrected = mtd->ecc_stats.corrected;
-	unsigned int failed = mtd->ecc_stats.failed;
+	unsigned int reg_index = 0, user_data_sz;
 	unsigned int max_bitflips = 0;
-	int ret, i, raw_mode = 0;
+	int ret, i;
 	struct scatterlist sg;
 	u32 status, pattern_found, wait;
 
+	if (first_step) {
+		ret = sunxi_nfc_read_column(nand, page, first_step * ecc->size,
+					    NULL, 0);
+		if (ret)
+			return ret;
+	}
+
 	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 	if (ret)
 		return ret;
 
-	ret = sunxi_nfc_dma_op_prepare(nfc, buf, ecc->size, nchunks,
+	ret = sunxi_nfc_dma_op_prepare(nfc, buf + first_step * ecc->size,
+				       ecc->size, nchunks,
 				       DMA_FROM_DEVICE, &sg);
 	if (ret)
 		return ret;
@@ -1341,7 +1325,12 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 	sunxi_nfc_hw_ecc_enable(nand);
 	sunxi_nfc_reset_user_data_len(nfc);
 	for (i = 0; i < nchunks; i++)
-		sunxi_nfc_set_user_data_len(nfc, sunxi_nfc_user_data_sz(sunxi_nand, i), i);
+		sunxi_nfc_set_user_data_len(nfc,
+					    sunxi_nfc_user_data_sz(sunxi_nand, first_step + i), i);
+	/* exec_op() restores the page's spare base during column changes. */
+	if (first_step)
+		writel(mtd->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, first_step),
+		       nfc->regs + NFC_REG_SPARE_AREA(nfc));
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 
@@ -1374,15 +1363,17 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
 	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
 
-	for (i = 0; i < nchunks; i++) {
-		int data_off = i * ecc->size;
-		unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
-		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
+	for (i = 0; i < nchunks; i++, reg_index += user_data_sz / 4) {
+		int logical_step = first_step + i;
+		int data_off = logical_step * ecc->size;
+		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, logical_step);
 		u8 *data = buf + data_off;
 		u8 *oob = nand->oob_poi + oob_off;
 		bool erased;
 		int bitflips;
 
+		user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, logical_step);
+
 		bitflips = sunxi_nfc_hw_ecc_correct(nand, randomized ? data : NULL,
 						    oob_required ? oob : NULL,
 						    i, status, pattern_found,
@@ -1397,40 +1388,64 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 			ret = sunxi_nfc_read_column(nand, page, mtd->writesize + oob_off,
 						    oob, ecc->bytes + user_data_sz);
 			if (ret)
-				goto err_stats;
+				return ret;
 
-			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, i, !i,
+			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, reg_index, !logical_step,
 							    page, user_data_sz);
 		}
 
 		if (erased)
-			raw_mode = 1;
+			*raw_mode = 1;
 
 		sunxi_nfc_hw_ecc_update_stats(nand, &max_bitflips, bitflips);
 	}
 
 	if (status & NFC_ECC_ERR_MSK(nfc)) {
 		for (i = 0; i < nchunks; i++) {
-			int data_off = i * ecc->size;
-			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
-			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
+			int logical_step = first_step + i;
+			int data_off = logical_step * ecc->size;
+			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, logical_step);
 			u8 *data = buf + data_off;
 			u8 *oob = nand->oob_poi + oob_off;
 
 			if (!(status & NFC_ECC_ERR(i)))
 				continue;
 
+			user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, logical_step);
 			ret = sunxi_nfc_hw_ecc_read_error(nand, data, data_off, oob,
 							  mtd->writesize + oob_off,
 							  user_data_sz,
 							  &max_bitflips, page);
 			if (ret < 0)
-				goto err_stats;
+				return ret;
 			if (ret)
-				raw_mode = 1;
+				*raw_mode = 1;
 		}
 	}
 
+	return max_bitflips;
+}
+
+static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
+					    int oob_required, int page, int nchunks)
+{
+	struct mtd_info *mtd = nand_to_mtd(nand);
+	unsigned int corrected = mtd->ecc_stats.corrected;
+	unsigned int failed = mtd->ecc_stats.failed;
+	unsigned int max_bitflips = 0;
+	int raw_mode = 0;
+	int first_step, batch_steps, ret;
+
+	for (first_step = 0; first_step < nchunks; first_step += batch_steps) {
+		batch_steps = sunxi_nfc_dma_batch_steps(nand, first_step, nchunks);
+		ret = sunxi_nfc_hw_ecc_read_batch_dma(nand, buf, oob_required, page,
+						      first_step, batch_steps,
+						      &raw_mode);
+		if (ret < 0)
+			goto err_stats;
+		max_bitflips = max_t(unsigned int, max_bitflips, ret);
+	}
+
 	if (oob_required) {
 		ret = sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi,
 						      NULL, !raw_mode, page);
@@ -1761,69 +1776,88 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct scatterlist sg;
 	u32 wait;
-	int ret, i;
+	int first_step, batch_steps, ret, i;
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
-	if (ret)
-		return ret;
+	for (first_step = 0; first_step < ecc->steps; first_step += batch_steps) {
+		unsigned int reg_index = 0;
 
-	ret = sunxi_nfc_dma_op_prepare(nfc, buf, ecc->size, ecc->steps,
-				       DMA_TO_DEVICE, &sg);
-	if (ret)
-		goto pio_fallback;
+		batch_steps = sunxi_nfc_dma_batch_steps(nand, first_step, ecc->steps);
+		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
+		if (ret)
+			return ret;
 
-	sunxi_nfc_reset_user_data_len(nfc);
-	for (i = 0; i < ecc->steps; i++) {
-		unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
-		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
-		const u8 *oob = nand->oob_poi + oob_off;
+		ret = sunxi_nfc_dma_op_prepare(nfc, buf + first_step * ecc->size,
+					       ecc->size, batch_steps, DMA_TO_DEVICE, &sg);
+		if (ret) {
+			/* Only retry before any part of the page has been transferred. */
+			if (first_step)
+				return ret;
+			goto pio_fallback;
+		}
 
-		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page,
-						    user_data_sz);
-		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
-	}
+		sunxi_nfc_reset_user_data_len(nfc);
+		for (i = first_step; i < first_step + batch_steps; i++) {
+			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
+			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
+			const u8 *oob = nand->oob_poi + oob_off;
 
-	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
-	if (ret) {
-		sunxi_nfc_dma_op_abort(nfc);
-		sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
-		return ret;
-	}
+			sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, reg_index, !i,
+							    page, user_data_sz);
+			sunxi_nfc_set_user_data_len(nfc, user_data_sz, i - first_step);
+			reg_index += user_data_sz / 4;
+		}
 
-	sunxi_nfc_hw_ecc_enable(nand);
-	sunxi_nfc_randomizer_config(nand, page, false);
-	sunxi_nfc_randomizer_enable(nand);
+		if (first_step)
+			ret = nand_change_write_column_op(nand, first_step * ecc->size,
+							  NULL, 0, false);
+		else
+			ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+		if (ret) {
+			sunxi_nfc_dma_op_abort(nfc);
+			sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+			return ret;
+		}
 
-	writel((NAND_CMD_RNDIN << 8) | NAND_CMD_PAGEPROG,
-	       nfc->regs + NFC_REG_WCMD_SET);
+		/* exec_op() restores the page's spare base during column changes. */
+		if (first_step)
+			writel(mtd->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, first_step),
+			       nfc->regs + NFC_REG_SPARE_AREA(nfc));
+		sunxi_nfc_hw_ecc_enable(nand);
+		sunxi_nfc_randomizer_config(nand, page, false);
+		sunxi_nfc_randomizer_enable(nand);
 
-	wait = NFC_CMD_INT_FLAG;
+		writel((NAND_CMD_RNDIN << 8) | NAND_CMD_PAGEPROG,
+		       nfc->regs + NFC_REG_WCMD_SET);
 
-	if (nfc->use_mdma)
-		wait |= NFC_DMA_INT_FLAG;
-	else
-		dma_async_issue_pending(nfc->dmac);
+		wait = NFC_CMD_INT_FLAG;
 
-	writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD |
-	       NFC_DATA_TRANS | NFC_ACCESS_DIR,
-	       nfc->regs + NFC_REG_CMD);
+		if (nfc->use_mdma)
+			wait |= NFC_DMA_INT_FLAG;
+		else
+			dma_async_issue_pending(nfc->dmac);
 
-	ret = sunxi_nfc_wait_events(nfc, wait, false, 0);
-	if (ret)
-		sunxi_nfc_dma_op_abort(nfc);
+		writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD |
+		       NFC_DATA_TRANS | NFC_ACCESS_DIR,
+		       nfc->regs + NFC_REG_CMD);
 
-	sunxi_nfc_randomizer_disable(nand);
-	sunxi_nfc_hw_ecc_disable(nand);
+		ret = sunxi_nfc_wait_events(nfc, wait, false, 0);
+		if (ret)
+			sunxi_nfc_dma_op_abort(nfc);
 
-	sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+		sunxi_nfc_randomizer_disable(nand);
+		sunxi_nfc_hw_ecc_disable(nand);
 
-	if (ret)
-		return ret;
+		sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+
+		if (ret)
+			return ret;
+	}
 
 	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING)) {
 		/* TODO: use DMA to transfer extra OOB bytes ? */

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
