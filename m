Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1AEC88E56
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2026 04:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ks7cbtGn9usTUIG/1Vhg0AFyoaKdJcNYEXQFM6CgqUE=; b=WEW7AjVNXeAGcA
	JzHIGLMU0hT076N5x5U6pGUgVOLZGz1T2LsabRltIDBFevP62xnP31Re5tUOr+YOSS8WQs2/vh5w8
	fQhwVNd1Spbo2qmuLpzgO7WVKP824UbB+U24LiX+c8E+pRPhDhZ5RvoF/H02g17FvkOkMgM5FlBEv
	HL9kAqj6Ob7Zq9LUdMAZJQ5oDlwaGPYREyJqLuzORNvu9hLsLHtNOuyXawfJo35L/QzvSAgpKcdQQ
	Wbq7caLqRKoeQTqNcZwsJbXobfaDRD3mPiJwxl4FHhldG9G9d6f6PZcX96BuNzSBOuUclYnZo6Atb
	ZKY28ySqLlTTUdrSyVYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bU3-00000001NpT-1WVt;
	Sun, 13 Sep 2026 04:06:27 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bTB-00000001MdW-0ygT
	for linux-mtd@lists.infradead.org;
	Sun, 13 Sep 2026 04:05:35 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-6c1983dfaffso1399410eaf.2
        for <linux-mtd@lists.infradead.org>; Sat, 12 Sep 2026 21:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272332; x=1789877132; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5rmncXijitRcj9RxOard0Heg+Nrz/VMzyCWVR9VWKLw=;
        b=YEQ3rdC+75LIAV/TZtu2LFGYDVmKHFOWZmVJtZ3+H4f+Xujf/0Y1yJkxd0F/pItCpO
         ejcc++r8GgFmJ1h6QXHJsSR/+g02hckVsQYyEMjpMHe4QKHQO/keM0v34isRTGEvT4aZ
         Gc3U9yj+jQjWiwx/SOTVe8Q/QBARcHSlAns/gDtzhtGvfu5+CSPVeNXxu+5r1fW4LoC7
         7ClHBi70P73TToPfCqfJ9DRVn8rzGMoJD0hUlc07nMYIjN2wT8xSaJ7NZIf5ajzPbcRu
         rcCdc5oTXunCp7D/OOom6BcJZ9NS3Ka3rEr2wfOs/vH405HL3FAK4baLahWIlQERMhuv
         QFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272332; x=1789877132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5rmncXijitRcj9RxOard0Heg+Nrz/VMzyCWVR9VWKLw=;
        b=pFwNi7uowUPafhVbzO5iD1fQD9c/Vj6BDqZNrsDbSIESdgtlI+LuvQtrh5FX6eYaOE
         NMJ5GyWxvUw9IjE8fIKhrQDLW7oVFWIIL/Xo8OGVXH6+NHOHq88DIkjqnpm2bEwV3/TJ
         I9TFSsQqDsUu7E6S3YgEJSoLlk4RVgnmWL+ltRotUy3tqQcnh2DkeazlHVLtckM7tdw2
         JJlUFKIDQ5wD20Cfhc6bbTw+9XBmek4uXge0Rai44peKtavMbbl/tN+WQ67CHs6CQDww
         HAsG/otk9vQTQLLzug25y8fUKLvuU+ODSgGFg8XLY/60KNA35bE2Q3GtZ4TOpemDLrKd
         DfcA==
X-Gm-Message-State: AFuF++mrFMKnjip8TVBzJuPyXQ20gpWP5oQOLbdcZjerWH5SS1mc5X4S
	3ELvahjVUGNHBnyvtE9L9BPYO82U1lLocybx6+CMbB36Dv5TrMiGSXGi
X-Gm-Gg: AYBFou1XYMxcqD4njmKFxD+2bEGrPKuXnQEoRpdR5+JWcYUKrQ1GX6smcDpXsS8aysA
	rtp/l1IN69L+0Q/u7DdlL591hAnyNYLn3uR8pIasUvLSXCETJtJQQcEZTWoUY79Gbpx3JSnk1Wv
	KCtdF++U9+sH0IZn7TIrirzmddKZmZq4NGwlJQjktglzVbjIw0OnpGq9pRWmdvhZ4hExxn10grS
	gOWaI27D83iDIhZ9ZgmT1kTarNrd36VhD3GdNu9bYWL/HcBlOSI/T/f2dXr5H7nA2d+QjPsvTZc
	YEDPgqBbQmXMM1ErCZa4K0vN8bQLber5Ts0T0v3YhzpP7SbzojO2xUErcFwzCugy1vCzuvk3VU1
	InqeRcakMgaloCqpH59CwKEEBWheivzsCwLav9TFs7VU+ZnyWsjjVntENVaJhpzr9ZjHj6G5jEi
	RqXrOP5vE4w77fZiKr+1AfopBmnf9j0iJdyM9sQ9Xez//IfdxjP2aZgdfN1GpBkRmaijDxgMu5A
	hzuad0vdlXEvG2gmnsVXZJ5eOKnhSt744cuCav6ZOaw+1odNzEiMn8bhudVjrhp54yI7UQJ1Tcc
	75bzO4dJJWVB94SYnQOGo3hrq8L0OBifI71p6ULC+l/DzVH9SZ7oaedlkW7QuxbziLCrGo8g1w+
	E6AzI5b1Dbhz5+veYYHQOy0hU8Z9QEQ==
X-Received: by 2002:a4a:ec4c:0:b0:6be:4eb3:e1c7 with SMTP id 006d021491bc7-6c0b985e1d1mr6850526eaf.14.1789272332039;
        Sat, 12 Sep 2026 21:05:32 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:05:08 -0600
Subject: [PATCH v4 17/17] mtd: rawnand: sunxi: bound DMA batches by the
 user-data register bank
MIME-Version: 1.0
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-17-4a64bed94229@gmail.com>
References: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
In-Reply-To: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
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
X-CRM114-CacheID: sfid-20260912_210533_398651_DC88FCAD 
X-CRM114-Status: GOOD (  21.21  )
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
Keep ECC accounting, erased-page classification and the trailing-OOB read
page-wide, and discard all partial DMA statistics before a PIO read retry.

Use one page-read setup or program-begin command for the whole page. Only
issue program-end after every batch and any trailing OOB transfer succeed.
Do not retry a write in PIO after a batch has already been transferred.
The allocator, free-OOB layout and raw-access callbacks are unchanged.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 270 +++++++++++++++++++++++---------------
 1 file changed, 161 insertions(+), 109 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 1303dca74cf9..c43d2d268d84 100644
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
@@ -946,44 +947,40 @@ static u8 sunxi_nfc_user_data_sz(struct sunxi_nand_chip *sunxi_nand,
 	return sunxi_nand->user_data_bytes[logical_step];
 }
 
-/*
- * Variable-length user data is concatenated in four-byte registers.
- * PIO uses hardware step zero; DMA slots follow the logical page steps.
- */
-static unsigned int
-sunxi_nfc_user_data_reg_index(struct sunxi_nand_chip *sunxi_nand, int hw_step)
+/* Keep the on-flash layout, but fit each DMA batch in the user-data bank. */
+static int sunxi_nfc_dma_batch_steps(struct nand_chip *nand,
+				     int first_step, int end_step)
 {
-	unsigned int byte_offset = 0;
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	unsigned int user_data_sz = 0;
 	int i;
 
-	for (i = 0; i < hw_step; i++)
-		byte_offset += sunxi_nfc_user_data_sz(sunxi_nand, i);
+	if (!nfc->caps->reg_user_data_len)
+		return end_step - first_step;
+
+	for (i = first_step; i < end_step; i++) {
+		user_data_sz += sunxi_nfc_user_data_sz(sunxi_nand, i);
+		if (user_data_sz > NFC_H6_USER_DATA_REGS * sizeof(u32))
+			break;
+	}
 
-	return byte_offset / 4;
+	return i - first_step;
 }
 
+/* PIO uses register zero; DMA concatenates user data within each batch. */
 static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
-						int hw_step, bool bbm, int page,
+						unsigned int reg_index, bool bbm, int page,
 						unsigned int user_data_sz)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	u32 user_data;
+	unsigned int i;
 
-	if (!nfc->caps->reg_user_data_len) {
-		user_data = readl(nfc->regs + NFC_REG_USER_DATA(nfc, hw_step));
-		sunxi_nfc_user_data_to_buf(user_data, oob);
-	} else {
-		unsigned int reg_index = sunxi_nfc_user_data_reg_index(sunxi_nand, hw_step);
-		unsigned int reg_off;
-		u8 *ptr = oob;
-		unsigned int i;
-
-		for (i = 0; i < user_data_sz / 4; i++, ptr += 4) {
-			reg_off = NFC_REG_USER_DATA(nfc, reg_index + i);
-			user_data = readl(nfc->regs + reg_off);
-			sunxi_nfc_user_data_to_buf(user_data, ptr);
-		}
+	for (i = 0; i < user_data_sz / 4; i++) {
+		user_data = readl(nfc->regs + NFC_REG_USER_DATA(nfc, reg_index + i));
+		sunxi_nfc_user_data_to_buf(user_data, oob + i * 4);
 	}
 
 	/* Undo hardware de-randomization for a plain on-flash BBM. */
@@ -1038,7 +1035,8 @@ static void sunxi_nfc_set_user_data_len_pio(struct sunxi_nfc *nfc, int len)
 	       nfc->regs + NFC_REG_USER_DATA_LEN(nfc, 0));
 }
 
-static void sunxi_nfc_set_user_data_len_dma(struct nand_chip *nand, int nchunks)
+static void sunxi_nfc_set_user_data_len_dma(struct nand_chip *nand,
+					    int first_step, int nchunks)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
@@ -1054,7 +1052,7 @@ static void sunxi_nfc_set_user_data_len_dma(struct nand_chip *nand, int nchunks)
 		val = 0;
 		for (step = first; step < nchunks &&
 		     step < first + NFC_REG_USER_DATA_LEN_CAPACITY; step++) {
-			len = sunxi_nfc_user_data_sz(sunxi_nand, step);
+			len = sunxi_nfc_user_data_sz(sunxi_nand, first_step + step);
 			code = sunxi_nfc_user_data_len_code(nfc, len);
 			if (code >= 0)
 				val |= field_prep(NFC_USER_DATA_LEN_MSK(step), code);
@@ -1064,13 +1062,14 @@ static void sunxi_nfc_set_user_data_len_dma(struct nand_chip *nand, int nchunks)
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
-						const u8 *oob, int hw_step,
+						const u8 *oob, unsigned int reg_index,
 						bool bbm, int page,
 						unsigned int user_data_sz)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
+	unsigned int i;
 
 	/* Pre-randomize the BBM so the hardware writes it plain on flash. */
 	if (bbm && (nand->options & NAND_NEED_SCRAMBLING) &&
@@ -1080,18 +1079,9 @@ static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 		oob = user_data;
 	}
 
-	if (!nfc->caps->reg_user_data_len) {
-		writel(sunxi_nfc_buf_to_user_data(oob),
-		       nfc->regs + NFC_REG_USER_DATA(nfc, hw_step));
-	} else {
-		unsigned int reg_index = sunxi_nfc_user_data_reg_index(sunxi_nand, hw_step);
-		const u8 *ptr = oob;
-		unsigned int i;
-
-		for (i = 0; i < user_data_sz / 4; i++, ptr += 4) {
-			writel(sunxi_nfc_buf_to_user_data(ptr),
-			       nfc->regs + NFC_REG_USER_DATA(nfc, reg_index + i));
-		}
+	for (i = 0; i < user_data_sz / 4; i++) {
+		writel(sunxi_nfc_buf_to_user_data(oob + i * 4),
+		       nfc->regs + NFC_REG_USER_DATA(nfc, reg_index + i));
 	}
 }
 
@@ -1374,7 +1364,7 @@ static int sunxi_get_ecc_offset(struct sunxi_nand_chip *sunxi_nand,
 				struct nand_ecc_ctrl *ecc, int logical_step)
 {
 	return sunxi_get_oob_offset(sunxi_nand, ecc, logical_step) +
-		sunxi_nfc_user_data_sz(sunxi_nand, logical_step);
+		 sunxi_nfc_user_data_sz(sunxi_nand, logical_step);
 }
 
 static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
@@ -1568,36 +1558,47 @@ sunxi_nfc_hw_ecc_finish_randomized_read(struct nand_chip *nand, u8 *buf,
 	return result->max_bitflips;
 }
 
-static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf,
-					    int oob_required, int page,
-					    int nchunks)
+static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
+					   int oob_required, int page,
+					   int first_step, int nchunks,
+					   struct sunxi_nfc_ecc_status *result,
+					   bool *erased_chunk_found)
 {
 	bool randomized = nand->options & NAND_NEED_SCRAMBLING;
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	struct sunxi_nfc_ecc_status result = {};
 	struct sunxi_nfc_ecc_snapshot snapshot;
-	unsigned int corrected = mtd->ecc_stats.corrected;
-	unsigned int failed = mtd->ecc_stats.failed;
+	unsigned int reg_index = 0, user_data_sz;
 	unsigned int max_bitflips = 0;
-	bool erased_chunk_found = false;
 	int ret, i;
 	struct scatterlist sg;
 	u32 wait;
 
+	if (first_step) {
+		ret = nand_change_read_column_op(nand, first_step * ecc->size,
+						 NULL, 0, false);
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
 
 	sunxi_nfc_hw_ecc_enable(nand);
-	sunxi_nfc_set_user_data_len_dma(nand, nchunks);
+	sunxi_nfc_set_user_data_len_dma(nand, first_step, nchunks);
+	/* exec_op() restores the page's spare base during column changes. */
+	if (first_step)
+		writel(mtd->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, first_step),
+		       nfc->regs + NFC_REG_SPARE_AREA(nfc));
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 
@@ -1628,18 +1629,21 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 
 	sunxi_nfc_hw_ecc_read_status(nand, &snapshot);
 
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
 		if (sunxi_nand->randomized_oob) {
-			sunxi_nfc_hw_ecc_record_status(nand, &result, i, i, &snapshot);
-			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, i, !i,
+			sunxi_nfc_hw_ecc_record_status(nand, result, logical_step, i,
+						       &snapshot);
+			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, reg_index, !logical_step,
 							    page, user_data_sz);
 			continue;
 		}
@@ -1659,44 +1663,73 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 							 oob, ecc->bytes + user_data_sz,
 							 false);
 			if (ret)
-				goto err_stats;
+				return ret;
 
-			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, i, !i,
+			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, reg_index, !logical_step,
 							    page, user_data_sz);
 		}
 
 		if (erased)
-			erased_chunk_found = true;
+			*erased_chunk_found = true;
 
 		sunxi_nfc_hw_ecc_update_stats(nand, &max_bitflips, bitflips);
 	}
 
 	if (sunxi_nand->randomized_oob)
-		return sunxi_nfc_hw_ecc_finish_randomized_read(nand, buf, &result,
-							     oob_required, true, page);
+		return 0;
 
 	if (snapshot.status & NFC_ECC_ERR_MSK(nfc)) {
 		for (i = 0; i < nchunks; i++) {
-			int data_off = i * ecc->size;
-			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
-			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
+			int logical_step = first_step + i;
+			int data_off = logical_step * ecc->size;
+			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, logical_step);
 			u8 *data = buf + data_off;
 			u8 *oob = nand->oob_poi + oob_off;
 
 			if (!(snapshot.status & NFC_ECC_ERR(i)))
 				continue;
 
+			user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, logical_step);
 			ret = sunxi_nfc_hw_ecc_read_error(nand, data, data_off, oob,
 							  mtd->writesize + oob_off,
 							  user_data_sz,
 							  &max_bitflips);
 			if (ret < 0)
-				goto err_stats;
+				return ret;
 			if (ret)
-				erased_chunk_found = true;
+				*erased_chunk_found = true;
 		}
 	}
 
+	return max_bitflips;
+}
+
+static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
+					    int oob_required, int page, int nchunks)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct mtd_info *mtd = nand_to_mtd(nand);
+	struct sunxi_nfc_ecc_status result = {};
+	unsigned int corrected = mtd->ecc_stats.corrected;
+	unsigned int failed = mtd->ecc_stats.failed;
+	unsigned int max_bitflips = 0;
+	bool erased_chunk_found = false;
+	int first_step, batch_steps, ret;
+
+	for (first_step = 0; first_step < nchunks; first_step += batch_steps) {
+		batch_steps = sunxi_nfc_dma_batch_steps(nand, first_step, nchunks);
+		ret = sunxi_nfc_hw_ecc_read_batch_dma(nand, buf, oob_required, page,
+						      first_step, batch_steps, &result,
+						      &erased_chunk_found);
+		if (ret < 0)
+			goto err_stats;
+		max_bitflips = max_t(unsigned int, max_bitflips, ret);
+	}
+
+	if (sunxi_nand->randomized_oob)
+		return sunxi_nfc_hw_ecc_finish_randomized_read(nand, buf, &result,
+							     oob_required, true, page);
+
 	if (oob_required) {
 		ret = sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi,
 						      NULL, !erased_chunk_found, page);
@@ -2029,68 +2062,87 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
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
 
-	sunxi_nfc_set_user_data_len_dma(nand, ecc->steps);
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
-	}
+		sunxi_nfc_set_user_data_len_dma(nand, first_step, batch_steps);
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
