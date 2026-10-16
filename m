Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F140CC6B2D
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 03:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wBLMd/IRhYLbf63P8NWTx0123vOmbHYBWf6PzUMtPsQ=; b=EQ2/BzKyZitXeZ
	zSEvO9s7p8KtW1TQb7MroYsbLUgXuXamIaxXoy65Gi0HrPA+2YO9/bfjQUMVN9BHF6RF3DAcyVi0e
	o3LnCOiRZNyxm8IydNJ80cSOl+ziLo4bHt7yLtVj8sGMDmG2hQGetHJaah6ux9pX8JmG3VJE9IQu6
	3LkF8NJ5nsKsHBzgA1mjGs/APaakKPhi5RPTG8rOQJyTrxEAsoi3An7H+T6BSKarIREQjAHJ5V7A0
	mnw2abxaUhKXZ7GmZz0p6hU8KHDzfzFpUR/Gve/YdVA+M1B2h8Z6XdaM+riPmdNsKozt/eubwZ9Ct
	MsVd9qLgRiwTctckOVjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYta-00000001tLZ-0fa2;
	Fri, 16 Oct 2026 03:46:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYtT-00000001t4z-2Voh
	for linux-mtd@bombadil.infradead.org;
	Fri, 16 Oct 2026 03:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=zAN0y/NlYSkso/Y1xGAc/UgZ/A9idw6Kq1nSbL1jYtY=; b=LQBtX++dLq9tMQcMReW+BHNgKq
	aYuFQr010uI/stYtUzmkylmjlVL79ln2OcUfvEiZy3xedCW6asjgUDRu8OAfRuIerM1SOv8PHDdXq
	/6q/Uf3Hz6xKXv80s/wnHobkI1AtM1zwDM3L/E/oUBY6wO6pWg7w92z30lW1Wo105N2W3XdIkh2qZ
	zp2Dl28pAg1VcxbBrC8nhl45uPR4xKnRvUiN1JevYB7xc0Voa4i5cOvjmcdlQiO2FEfzwWd6+/IMZ
	Wgr4czozJkwRCnY6PcKVUTHXSoUbRoDwX53mrMclHKxcvxwhRYeovZxwqJGaTMwAGtaxO8RXQcsf3
	aGtCjI3w==;
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHYtI-000000014A0-1OSQ
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 03:45:58 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-81b54d0cb17so4421607a34.1
        for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2026 20:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122354; x=1792727154; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zAN0y/NlYSkso/Y1xGAc/UgZ/A9idw6Kq1nSbL1jYtY=;
        b=KcebGqxRuKx6YPqOM6gCCtb1Hz4AR3l1g4q0Qx9g+pISMPJzQ24sUEr/x2mMM42otW
         RyeIZubkehAuJdJDO4vGzpNFc+aMNi5V8KISvlKeDVmVcC8Uqf4HI1NCX6ICNpPvA/Pe
         pIUVI45AXwg0c2PFWVt6weCY01+5MUNBjV4MdDGLl6JJV4x+EuvRzgXqitz9DeHU6ntg
         H9q3U2C1Yyr/4nSpV21dZz48aN6afArVxwM8N+nQv7BoUgHD/MofWZ2w9dRSO7PlAkgu
         JFJBWPBf7Ar+3eAVWNvhhLCcmuYfZewWaccM7RRicYAkRasdXUDbvg0KMlMNkbJ5nGMR
         RqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122354; x=1792727154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zAN0y/NlYSkso/Y1xGAc/UgZ/A9idw6Kq1nSbL1jYtY=;
        b=W1SyrCYlUL3MNKIdZR5KdY17qGspx2LayaO0M+31cA5Ixoyt5GDpQjiZwL9juQu/a3
         +KrIWITEckC9cnVkLu0nDCRMFtyQuifpErmHTDzyMx9bPZJPoZaaJGYUuruIc+25Hbuv
         MJJhw86Gh/JhdCL6csvL8PM5hcs47eWCj05caNgiOHh87WtN0+IDH11BKKOS/eBXB0kS
         y+KkiYTotR4Y8eKG/k/Vqaql9QEAnuXiMKUmUwv1H4SBe1xJw9uJF/62bF+V8pTA6yxM
         /ls1Q3NDrKp5FXOLVos7URVbqZKZw9sJMB9iULhp3dtbjKJWiDE2zMgwB1SuSKguKJST
         Y6ww==
X-Forwarded-Encrypted: i=1; AKwUvBw5Q1Hr9zDa34R9E45auSjZ71nfYdxWKIBSDzle1L8Sf5IFH/+u5bHoWMhnYP5WTtsldEtncuEA4C0=@lists.infradead.org
X-Gm-Message-State: AFq9FYImVMmeVwA1MDnuefhZMkiM+KOgbnuFmEXCL4nJRJHVzeMbppDJ
	W5S++I5BXU591a+hk4ow66K+BVo9F8dCxxE78PkiAe1uaerMUitZZLEo
X-Gm-Gg: AYBFou1NxDdW+k3vR5aQzKeGOSH84Lp99UtQmDes4RgT6t3yRq5kO2hiEMEP7EOEDxm
	vhce/+J7FbkUHCHU3V/5Jo74a4HRQdEOIwdWPj3HYIII2XA8g7+Fyw/Op30IIy2Q0YyAY+VZOql
	IsswRszgWgGrFxuSapEjAT6mJdO41QSipv8aIFaAXO7ze/qrDxzBIGpKkubYJ6JuDFZ1oz0l256
	3iMI5ajptsXWPjbufrx9HHxmJ+3WxZZZzb0aQevImKnpWE+32Hy/f7wkESgWoaxR+HkdPq4ImSw
	iH/GWvOorG+OeDM8XsSc/DAWen4oDinZkRH+d2anXPxlkldS+L/kXsOq9Z6FjJL4K1iydbx5mcs
	n2NUHyAUbb0kg3TiRKgavjWmD4+B+OoE/pv8q+tBmy0nH53cIcRmwKxu7tI6zF9V+VfEPlwgQ6B
	Nq/9DWUr7uxquceModIRLLzHk9ctzx+QjZeWJwiWOsOXnOty9jwlnzU/74AY5HTbPRELO9unfXr
	FwrBGnbajAIXv1y/89VkytMpGEPD0yO3qON8wt1fBpBDjty4JDcUrhKGppkMEmYO0ardzzpmXZj
	QfEHdFVMN0OcVzWLAwSSA68xjTCCghiRqUVQ0MyUkF1+W+a5gllrouwTtoB8iRsObbzBCs+4H60
	YiRJwWothCE84CMz4wU9rYg2of/oUb7iU
X-Received: by 2002:a05:6830:4c0a:b0:80a:b8da:2792 with SMTP id 46e09a7af769-83094e783camr22214084a34.6.1792122354047;
        Thu, 15 Oct 2026 20:45:54 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:30 -0600
Subject: [PATCH v8 15/17] mtd: rawnand: sunxi: reduce user-data length
 register accesses
MIME-Version: 1.0
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-15-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_044556_590563_3C306AEC 
X-CRM114-Status: GOOD (  21.44  )
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

H6/H616 pack eight ECC steps' user-data length codes into each 32-bit
register. DMA currently clears all these registers, then
read-modify-writes one field per step, repeatedly accessing the same
words. Code zero means no user data; the other codes select lengths from
the controller's table.

Build each packed value in memory and write it once per DMA batch,
including zeros for unused slots. Take each length from the batch's
logical step but encode it in the corresponding batch-local hardware
slot. Rewrite every register on each batch rather than caching values
across resets or changes of chip.

Share the encoding with a PIO setter. PIO always uses hardware slot
zero, and its page callbacks clear all length registers before the chunk
loop. It can therefore write the slot-zero code directly, without a
read-modify-write. Keep the page-level clearing so unused slots are also
cleared after a DMA-to-PIO fallback. Older controllers without length
registers remain unaffected, and the chosen lengths and on-flash layout
do not change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 79 +++++++++++++++++++++++++--------------
 1 file changed, 50 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 2a9fe89b1ba5..56594bb41193 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -57,7 +57,7 @@
 #define NFC_H6_USER_DATA_REGS	32
 #define NFC_REG_USER_DATA(nfc, x)	(nfc->caps->reg_user_data + ((x) * 4))
 #define NFC_REG_H6_USER_DATA_LEN 0x0070
-/* A USER_DATA_LEN register can hold the length of 8 USER_DATA registers */
+/* Each USER_DATA_LEN register holds eight 4-bit ECC-step user-data length codes. */
 #define NFC_REG_USER_DATA_LEN_CAPACITY 8
 #define NFC_REG_USER_DATA_LEN(nfc, step) \
 	 (nfc->caps->reg_user_data_len + \
@@ -1025,35 +1025,60 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
 		writel(0, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, i));
 }
 
-static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
-					int len, int step)
+static int sunxi_nfc_user_data_len_code(struct sunxi_nfc *nfc, int len)
 {
-	bool found = false;
-	u32 val;
 	int i;
 
+	for (i = 0; i < nfc->caps->nuser_data_tab; i++) {
+		if (len == nfc->caps->user_data_len_tab[i])
+			return i;
+	}
+
+	dev_warn(nfc->dev, "Unsupported length for user data reg: %d\n", len);
+	return -EINVAL;
+}
+
+static void sunxi_nfc_set_user_data_len_pio(struct sunxi_nfc *nfc, int len)
+{
+	int code;
+
 	/* not all SoCs have this register */
 	if (!nfc->caps->reg_user_data_len)
 		return;
 
-	for (i = 0; i < nfc->caps->nuser_data_tab; i++) {
-		if (len == nfc->caps->user_data_len_tab[i]) {
-			found = true;
-			break;
-		}
-	}
-
-	if (!found) {
-		dev_warn(nfc->dev,
-			 "Unsupported length for user data reg: %d\n", len);
+	code = sunxi_nfc_user_data_len_code(nfc, len);
+	if (code < 0)
 		return;
-	}
 
-	val = readl(nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
+	/* PIO uses slot zero; the page callback clears all other slots. */
+	writel(FIELD_PREP(NFC_USER_DATA_LEN_MSK(0), code),
+	       nfc->regs + NFC_REG_USER_DATA_LEN(nfc, 0));
+}
+
+static void sunxi_nfc_set_user_data_len_dma(struct nand_chip *nand,
+					    int first_step, int nchunks)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	int first, step, len, code;
+	u32 val;
+
+	if (!nfc->caps->reg_user_data_len)
+		return;
 
-	val &= ~NFC_USER_DATA_LEN_MSK(step);
-	val |= field_prep(NFC_USER_DATA_LEN_MSK(step), i);
-	writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
+	/* Write each packed register once, including zeroes for unused slots. */
+	for (first = 0; first < nfc->caps->max_ecc_steps;
+	     first += NFC_REG_USER_DATA_LEN_CAPACITY) {
+		val = 0;
+		for (step = first; step < nchunks &&
+		     step < first + NFC_REG_USER_DATA_LEN_CAPACITY; step++) {
+			len = sunxi_nfc_user_data_sz(sunxi_nand, first_step + step);
+			code = sunxi_nfc_user_data_len_code(nfc, len);
+			if (code >= 0)
+				val |= field_prep(NFC_USER_DATA_LEN_MSK(step), code);
+		}
+		writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, first));
+	}
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
@@ -1425,7 +1450,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, 0);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -1454,7 +1479,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 	struct sunxi_nfc_ecc_snapshot snapshot;
 	struct scatterlist sg;
 	int page = read->page;
-	int ret, i;
+	int ret;
 	u32 wait;
 
 	if (first_step) {
@@ -1475,10 +1500,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
-	sunxi_nfc_reset_user_data_len(nfc);
-	for (i = 0; i < nchunks; i++)
-		sunxi_nfc_set_user_data_len(nfc,
-					    sunxi_nfc_user_data_sz(sunxi_nand, first_step + i), i);
+	sunxi_nfc_set_user_data_len_dma(nand, first_step, nchunks);
 	/* exec_op() restores the page's spare base during column changes. */
 	if (first_step)
 		writel(mtd->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, first_step),
@@ -1588,7 +1610,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
 					    user_data_sz);
 
@@ -1855,7 +1877,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 			goto pio_fallback;
 		}
 
-		sunxi_nfc_reset_user_data_len(nfc);
+		sunxi_nfc_set_user_data_len_dma(nand, first_step, batch_steps);
 		for (i = first_step; i < first_step + batch_steps; i++) {
 			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
 			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
@@ -1863,7 +1885,6 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
 			sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, reg_index, !i,
 							    page, user_data_sz);
-			sunxi_nfc_set_user_data_len(nfc, user_data_sz, i - first_step);
 			reg_index += user_data_sz / 4;
 		}
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
