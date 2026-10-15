Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0513CC6B2D
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 01:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QDWYsyTiBZACV8EfqpMA8CNQ19ilZq8wFrm3IAMA9UE=; b=neRaJX3swhrXaX
	UPytmF1DD25KCmxiXsu7aZlu+kykelicCdCcjhcZVw+IL7znJjspW2CJQIsmzA0rnyMCzl5ilkg1I
	9BywfO0LvjzpCTXUAwTiXoEDUNioJ0vlNWb0q7ddT/09covW9tU0GT486ciwzCLEgK/mxtRaBBWYk
	ZfuRIPI30Rr8K8BeJpH/7nLITnhaaQhs7YrHYY/iA2hvwqQS/18DjWieeiHtmSQRZxKm3376BBQRq
	nOI5NLsyzVEtRirvExmT1t+zwRzHduIZRrgUCeNFw2XdN2OtaVJmDklWjHTNhUgxC2eXfLZPwe8wB
	0q4SffI4lmNPsxpCf2YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHANI-0000000GZeG-1goW;
	Thu, 15 Oct 2026 01:35:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMq-0000000GYtW-2KbT
	for linux-mtd@bombadil.infradead.org;
	Thu, 15 Oct 2026 01:34:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=UFOJulppXNuW58TbWJxKvDHpAzEnFrxmkp8urYvlaAM=; b=O/oyZEMVnKSxsRs6NSY/twLXYy
	crbuUzKl/mUTEOgJMSIaCJqAfSpq3x9Pvbib0obhYWI7XFX/R1CSelb6B9rPA97IBnQD9A+YET+D/
	CETB8SWApOL+fFOt71PYlw2v2dWHbaOg6Ep92GrlEImseGJ6rELPxk2Wvfv5uzSg/LXCy9s2AnNxx
	OdDg+Z8j8gWGtdirHFbjnMIdZZqrt9BrLGAPKDYIJjov+34U9xmGchwM2g1gd2T75O0UxSbXirvqQ
	dUb9d4UncbYJOBCQUYy76bIp/KN2yZPSSTj3xw1iyKteXxQP0Z0grQqaCvq2TizigZ+mUFWsnv19N
	43KXb5gQ==;
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHAMi-0000000HLaZ-0X5L
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 01:34:42 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-49e1251674cso407735fac.2
        for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 18:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028078; x=1792632878; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UFOJulppXNuW58TbWJxKvDHpAzEnFrxmkp8urYvlaAM=;
        b=Hdjdl3zyjRXl4NMD5pJNpBL9m/7SAPRkOwxwO8a2bxzw9enmDKXFXC7hjX2W3iUsWz
         BS/vQ4/osGde4WCTarfXgT620aJhGds1/PdUAeXvTVuNQRW4/AbvQPKcrEf3iFV5/i86
         YZ/F3zyl80lWiWoRCXjZ17QKYI419NsP0dgYtZ4M123Rp2H8VgMGjX9uxiFmoCh45YeE
         btcnm6oDe99NgbYQSYzr3/+Ep+fSU2FlkDseq4GEA4SsMANtLuJMBJ5FZT7446kZ6dKa
         0L/JUWlmrye2335kYvu9ovjh7mJQy3lNOFa5q3XAawCE+7INi4PihCl3xJ78Kb/Yq0/U
         xcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028078; x=1792632878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFOJulppXNuW58TbWJxKvDHpAzEnFrxmkp8urYvlaAM=;
        b=CLx9w4QKMM5jKUv8x5nKFjdsFHzAZGtRk5tTdY2rijgJVELrcZmdb3kbKIyS6G9GzI
         jBI7bWIm1+KERosuq3EbUyNG1ki4ITVQSDhoKUNDyzUy+zjOXWDclrz7a6XPsAOxMGwB
         r4gwsTHffMyhqq03BzfYSkaKmq81oxxTHt8Wy0RWIfa/GMRfWdIyfMevE5HlZaRg39Xt
         1FgkDbUQYx0oSCf6vWy7rln4g+lLFMXIYRccespTcoukQ/fN0sfoZdWKDSi6F3bzkDJ0
         F8JL1SJFUwDG39XB+Pk561arRppgsGZqHEU9VPc3nmonsj2yDx68dq6+vU5cGEBHM+Mf
         e5Pg==
X-Forwarded-Encrypted: i=1; AKwUvByUn1bwhfVidLe5PM00xal/1J1Njqu+sdiccNoq9olUV/NW2/pJ2SCkczpyVWUddCY/hrhLkD2AyJQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYKZ7ASb++9Z6BJGvsqo2RJFIhC9BOvT9LG+0muRCPFysMbK5m5f
	+KhPnx+MVgjswWGcSz5WUHvtPFB8RqEVqVp6bJPOUCVbnM6gokMns8OI
X-Gm-Gg: AYBFou2yhToR1b8R/Kv05z9ujCjLOnwpNWw34PBmdhBodfy11+wrovcxxrh2mNuuutA
	Nm4FFL/tjml1szIahZhYtlJLZn0qeJvp0zW6BTGRwIwt5zW9gR30VXJ+lg/6tA6qUCANkOyp9Hu
	Kz5RfEjZEbTtQlqL2v3c+cqdKzxzUPq37GjxBFOgEzpqQw00O4JpPNbQ6vbjxGDAR+8z4zwyTe6
	UbaCRLqixA0wLCtP3oj46PxidWzITKcfUeN69lc6QGewYqlpIKr3K/tm6iAmYwAUbknlgNDKzT2
	uLEpT9DxiQZxoQa3NhxTOnvCMapoC2AqWipRo39CtVeu0q21CEkRPIjAtb6aelVa5+Rq2EnXZPH
	HMxBbrwaF4mqT+WLknhI+9Il9uws99VxFkRTA3QOHAY3o1BIBEZB55iKQdf2dbpEyemKy1U/l7K
	7lDzl8j+pVEGB+PcdUvshzmGLCQI7C+X+L+UQ6qGV7wGTWr9LXlQwHTAwy3eGkUC/k5N1xfEQMj
	qhPOiEOCuoEm9eTfeX6Jn2e3I9d3AH+HewT95SbHuwdHLT9sJvQ0U8WdKl0IDFCC/w/30tqaGnA
	buJrzGs2wj4fKRw/z4OCYjhARTC1MES2Ecj8TIbhBK+dKLaWHRB9AVo9GfbXVgIHgFWfFZM0vwN
	XX0z5vfm4zIKdPR8efmqca7hXLPIMVmg=
X-Received: by 2002:a05:6870:b3ca:b0:47b:7709:5568 with SMTP id 586e51a60fabf-4a2a89dc998mr15538918fac.10.1792028077989;
        Wed, 14 Oct 2026 18:34:37 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:34:01 -0600
Subject: [PATCH v7 14/16] mtd: rawnand: sunxi: reduce user-data length
 register accesses
MIME-Version: 1.0
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-14-5d3fc6ad2da1@gmail.com>
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
In-Reply-To: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
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
X-CRM114-CacheID: sfid-20261015_023440_629785_EC0B67F5 
X-CRM114-Status: GOOD (  21.53  )
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
index 4e6fcf1e7aaf..601c272d8c54 100644
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
@@ -1018,35 +1018,60 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
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
@@ -1417,7 +1442,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, 0);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -1446,7 +1471,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 	struct sunxi_nfc_ecc_snapshot snapshot;
 	struct scatterlist sg;
 	int page = read->page;
-	int ret, i;
+	int ret;
 	u32 wait;
 
 	if (first_step) {
@@ -1467,10 +1492,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
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
@@ -1580,7 +1602,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
 					    user_data_sz);
 
@@ -1847,7 +1869,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 			goto pio_fallback;
 		}
 
-		sunxi_nfc_reset_user_data_len(nfc);
+		sunxi_nfc_set_user_data_len_dma(nand, first_step, batch_steps);
 		for (i = first_step; i < first_step + batch_steps; i++) {
 			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
 			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
@@ -1855,7 +1877,6 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
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
