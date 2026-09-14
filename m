Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F85CC88E5C
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 03:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I3G8fcbv/8jkLUEeAb83s8g+AEsbkiQCJLWcq1WPKVw=; b=DHwk78F3TzwAim
	qeinhaSw85/ftKVw3XAC7fQdzP8lCwSZTP8pQzCjAo49i5CaDYZ5nJcFDRvmlA2R9kjWZ67ZyROTp
	wIeFl1zBXTVKA7dt6iKhDqktjXPLvbmq4Np9V6kAH7RXlMCcj0W9lIG5AG+cFrLa1irQ70zVOtGVV
	daBbD7TUZkkdxICx8r/X07aeq4vHIdLp9M0YwEUvDXRt5PdFPUZsNP65pWMXH5XK1BYDd5Tsnp0to
	acevoGK/TGbecDYNPDRf3WKs+UUAQIDMyBt4LpNgXT8Zpq8BPz7nrQl5c9HCqF1a1q7Ck1VDGUvvW
	3XMq4VEPLCUlY47qcFzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wxn-00000002Dsx-0UfC;
	Mon, 14 Sep 2026 03:02:35 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wxI-00000002D28-2iRr
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 03:02:10 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-8049e44d0c3so2350416a34.3
        for <linux-mtd@lists.infradead.org>; Sun, 13 Sep 2026 20:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354923; x=1789959723; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IWbz9jOOwHMkOzJhcyeNlTXZtZx9bja+bTwtbiwOKWk=;
        b=e+A1x6Jc2x4xXKlitruE589x8QnC/tyuWscBtmDAxzZcE4KHVNqbc8hhynWcOpH6JB
         lE1Neag73UlsXcC9ZgwSFQkLhAMXdXuLQvf90ZtKewM/7OLUOjcflziUBT9KIGgzXKJW
         L1Aia1Q8K+ZfkOnvBwFJsdc/KtvVo45pgg04DzNRCPveZEGNOvi2OcQfjddc1yywnizx
         MTvUktR2Q/tClnj/5vzLrJ5FEv7neRqM6Qxrj6uWaZaakEIbn6ozxNzgH3SfSgz3llex
         lgnMk+3oZCOlj5XT6BmFvuVkZORYaLo0IrTz3+F8JD5EWrUI1lpQTSe8Yjn6hn7OFRXv
         wQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354923; x=1789959723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IWbz9jOOwHMkOzJhcyeNlTXZtZx9bja+bTwtbiwOKWk=;
        b=pP1vhkzIn3ZHAeugJiTnbvH8EQDPs3NDEkr/bo/X8YAQlKCneQM0gNcpVZ9V421pv6
         r9jMzI7o9a69BRyfurlxjX3XnV7tv4zNYfQb4cBqC3jkBuiPyN2GpPp1jp8bj2zLBCFP
         dem691Xm6OSt9WvvYgz1Sm7kb5WLgshM8Xmbqn3BWidYPUBDZ9mEV9ii/o9QXiAal5BS
         +ni2Xt86N2waazYadAOuoDKOPi1it8oTIjIQlLjKYu/VB3leiqZylxhLZ2Wu5xk6rM2t
         dm2UChImOYXeU0U9HgD7ccinARAyrRtPEzWvWXA0O7CxFUCCRzF5moexAAY1xM2NWrA5
         ZSmw==
X-Gm-Message-State: AFuF++mzGjyzAFSY876N8YVh/w/teXivg2j5j+9DrA1FPqoGVmTxamjw
	7zczseI2IeQMZ4sPpgvvobaxnz1VLZJhwHG8ojm7+psBqGKWz7qZTPD9
X-Gm-Gg: AYBFou3mdbujF62d8/F75GGoGHWUslws3+FY5oI86gvhcdcECqFev16S/bKnk3aiA50
	qiSRFdACWI41nU4JZF5tpnlxkpAusJIwjrgS/LeDhC8nhxxgdSJlKbvjqqpBMn4LYV/9K2xH0S6
	DsShW8rg/NQDn1WC9JUzhgwjI6pbea1sdf4Katn0ulkhWxFehMYu//q7SaSFwkwbp/T5s7bdruJ
	PHZLgQ5R33tPTqjAirg+XbakPK/TecrtOVEeGYyhKDeg6Z2HWPheXx3tfBA+DLALmHTXEDnWCPM
	Lf7osTs2y2yBfE+ZVzcN+2XzG6CACbenoYt4XLeH6Q4cZxiyBqf1FNhLzG2B/d4v9pB60Y1Z1HD
	c3NoX9vlAzxj8mTBWBFiyRhalpGJ0XuaoffJiXIn3TnUf3OZbSGqSypbh32bX8lKoFuG6V92eIA
	bE76Sa00qp8yW+qg5mZuTtk5pKdgubv5YW8lFHtalVtQV4G7GAFe9zzo43YGhIXdz41GfxXG5z1
	4KBTMcWuMeSG67YkKQn04J3TSEizn2WhJVccd3JbB0px1xZm5yuUKMV0zi0jM750/aOv7jEEU/o
	WLq8c6T7J+C6DDAyrfRbOmXRPGc3yAuFxhrWZzI9Q3G7GNjlHkVTp91Jh7kYsVjuk795WOFUpKc
	1daoKJTcJOqjzjlKBPCNaq7CVBJspkh2Nz9Y+PfoT
X-Received: by 2002:a05:6830:3888:b0:7e9:ead3:4449 with SMTP id 46e09a7af769-80897489f75mr263437a34.6.1789354923503;
        Sun, 13 Sep 2026 20:02:03 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:02:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:23 -0600
Subject: [PATCH v5 17/18] mtd: rawnand: sunxi: reduce user-data length
 register accesses
MIME-Version: 1.0
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-17-7d711076a6f7@gmail.com>
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
X-CRM114-CacheID: sfid-20260913_200205_558587_D451CEAD 
X-CRM114-Status: GOOD (  18.20  )
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
index 4103337f6a07..2b8ed142c9bf 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1005,35 +1005,60 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
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
@@ -1223,7 +1248,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -1540,10 +1565,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
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
@@ -1733,7 +1755,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, hw_step, bbm, page,
 					    user_data_sz);
 
@@ -2037,7 +2059,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 			goto pio_fallback;
 		}
 
-		sunxi_nfc_reset_user_data_len(nfc);
+		sunxi_nfc_set_user_data_len_dma(nand, first_step, batch_steps);
 		for (i = first_step; i < first_step + batch_steps; i++) {
 			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
 			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
@@ -2045,7 +2067,6 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
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
