Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE43C88E72
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 21:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ky9Rflp2DkZo9SDTk/zw9X+wN5WNllyljO2t6zCd3XU=; b=VaH2gU9K/xsM7M
	oNk5BsNNiTVJ1JgLD5E52Lrzj7t+/VTKdMRB0uZ2fBaNVUCYekKHWoTCwn6EEkHpde0iro7GtL7AA
	tRPMc3sP3PQ8Kv2ShZZfd2IrO8ckJQonmhLTf2sd+QKJFUnvaEkfRpoYKn3dKWu5WBCNPBIxmM7tS
	rNgEPY2WbmuXvzyLl02RqbnWgfbiSvQpg7DxcYgqbUQLwul56MAC522++uqQRBop5Z93gypCRUE3F
	Jk1OZwfStKKU27HsKvYiJWeZVGchlbgjglIETSHMu+YNVl6x9VQJkbWMZCoyR4OKVYXZb1Cz5asG2
	R89beWgJerMt/es5JQTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dwh-00000004gBQ-1oYN;
	Mon, 14 Sep 2026 21:10:35 +0000
Received: from mail-oi2-x10.google.com ([2607:f8b0:4864:32::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DwR-00000004flZ-267N
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 21:10:20 +0000
Received: by mail-oi2-x10.google.com with SMTP id 5614622812f47-4b37a2ffef2so1042918b6e.3
        for <linux-mtd@lists.infradead.org>; Mon, 14 Sep 2026 14:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420218; x=1790025018; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+GbSlDHSjNPM9B5dSRFNO0YLnNdNTULtbcSEuiC7wJc=;
        b=Ql8D2McCqGfe9aKB/43UCo1BdZvgdXc2TvuvjgY+Uvy/cljeLfVH78L0EtlXi2BuVf
         HZ4naU03SDlMnPVXTS2pvt5bvG9gORIdMNQMiWcCLmwpOd+ve+90skf5o5VXxZKtMjnh
         Av0gZAspJ+vkMoFFRA5Nm3q2lndx3oYqsB4Nh6qHX5ynYwfZxKfbAybvuj0bIEghw2Jf
         GA3ftBNImeAjVd2tcl9V6wQw6WWYWuGStsCBgzK742xOD6pTVqG0AM5J2G0NZkZRGTPF
         DJq6TUsY9My4Od694w5Arl9qSmrGrsztxFx/Hu87Yval15bPNpOGPR/ZsY8lB+gZYhVV
         TTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420218; x=1790025018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GbSlDHSjNPM9B5dSRFNO0YLnNdNTULtbcSEuiC7wJc=;
        b=gkQRiDu34m3Zx23bkdmXzWvIv/Pu+5icp2t6jHR32xfzWjQukeBl5KCdYo6nRq1Hvd
         eLu0QmDYEnNYuLXeVC9EB3aRLo//SXPxpptK9XkT/MMGvL0CmPCvUfpgtxlPNYOyuVP3
         NbfPFrktWOSVwJFG9lGM6RlH8uJUM2oZH9oqpLpEJxOlt/71sLdvF7TmANr7sN7OYcrV
         hSPWB0GHkcE6LZUNa5sl8k3DCrd4eZaKXr42Zo07cylwXZpjqGnkuXjMVG9XV4JIwhp0
         Tnoe0cvPGDC0tSsCTklJjwZDdQ67ogjuW2eokXZmMBSQgmLHREy/PeM+WbQCJveNnQKC
         ODsw==
X-Gm-Message-State: AFuF++lTvaR1RjUFsVy80GnzhRudvVbMAS+XNCeqG00Dc0kzDD6p3J9y
	kXXMUy6BlUP3/jlCZLDfl5M44RQ1pRInpKE+74eMRBZV0XT4KyTA4ST+
X-Gm-Gg: AYBFou1+XUsPjeQABuBqT9i/X/wjkAUfuTiG03LOy4jNu06T2P/LhyCvuDeLea0ZVUO
	5KByuNV/Rihx8HIO/wQxfsxpm+iCsSEbrLvJmNU+7zH5GH9AdbzUn7/4xDqu972NsnejqHTm8q7
	t9GSbltIZuBYsYN0zL+NdMnCx1dTHYJABN3cxfq1JEoGdGwj/5PWucav8IMlDnN0oww5mmjyAL/
	K7blbLLPdg4vATLinRzeBhF+zq1Ewny1JP4noluhDPMqvSmgKU6+f1kK4QSotw8TC1tI9ZRzSy/
	XpuJOo+73BcysIL2ha+F/hp9ZsPcMp43umazaHQFdMid3I3ctIwnIedfMKK7xqbYVqW6bsdJFwn
	iX4brKAm1AN5rxYQTVJ66b9Czxgb0s8Gds9i0labzuIk6X9o+c9tBbDbzKtSKnFgODyVPgNMWl3
	eDBoii8Zs+ZPPn027DF/dhMjJ+TxOjxZ3Q4fmN2tGbqgZdJTRKb0xNmZnj9pnj8PWQbproWYQqV
	dcodEiW0XDRO7GSndi1/6cVB6oFQUC5Ll+TX4QwCxwC6SSsvshP976CG7aYVlJqdTUifDnR93bA
	vi6+Gr9WhF2pNW5vLwAhHqEb3k8drVizHiVFQ273i8ChmnRFMV7keuMRxBWKuuW1viUIzjnZRPx
	VkOgMbtohazeLwatlfAcpKvxKmuaT
X-Received: by 2002:a05:6820:1893:b0:6b7:8396:f3e3 with SMTP id 006d021491bc7-6c542249981mr2544577eaf.69.1789420218531;
        Mon, 14 Sep 2026 14:10:18 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:10:03 -0600
Subject: [PATCH v6 17/18] mtd: rawnand: sunxi: reduce user-data length
 register accesses
MIME-Version: 1.0
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-17-2fb084fe0751@gmail.com>
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
X-CRM114-CacheID: sfid-20260914_141019_582259_6CBE2D41 
X-CRM114-Status: GOOD (  18.35  )
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

DMA reads and writes clear every user-data length register and then
read-modify-write one field at a time. Multiple ECC steps share each
register, so this repeats MMIO accesses to the same words.

Build each register value in memory and write it once, including zero
lengths for unused slots. Reprogram every word for every DMA operation
instead of caching hardware state, so controller resets and switches
between chips need no special cache invalidation.

Share the length encoding with a PIO-specific setter. PIO always uses
hardware slot zero, and its page callbacks clear all length registers
before the chunk loop. Write the slot-zero value directly instead of
reading and modifying the same register for every chunk. Keep the
per-operation clearing so other slots remain zero after DMA fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 75 +++++++++++++++++++++++++--------------
 1 file changed, 48 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 773ba55ecc07..41d6ef31ea3d 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1013,35 +1013,60 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
 		writel(0, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, i));
 }
 
-static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
-					int len, int hw_step)
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
 
-	val = readl(nfc->regs + NFC_REG_USER_DATA_LEN(nfc, hw_step));
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
 
-	val &= ~NFC_USER_DATA_LEN_MSK(hw_step);
-	val |= field_prep(NFC_USER_DATA_LEN_MSK(hw_step), i);
-	writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, hw_step));
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
@@ -1237,7 +1262,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -1554,10 +1579,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
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
@@ -1747,7 +1769,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, hw_step, bbm, page,
 					    user_data_sz);
 
@@ -2051,7 +2073,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 			goto pio_fallback;
 		}
 
-		sunxi_nfc_reset_user_data_len(nfc);
+		sunxi_nfc_set_user_data_len_dma(nand, first_step, batch_steps);
 		for (i = first_step; i < first_step + batch_steps; i++) {
 			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
 			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
@@ -2059,7 +2081,6 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
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
