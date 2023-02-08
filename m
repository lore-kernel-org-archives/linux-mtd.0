Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DC7C636CC
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Feb 2023 05:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/uKSWTz+duQJP33mihkZ+gWonlhdtq4VdJ/K4V84TdU=; b=mobSniQZjyaGEV
	oauYjG9bnI8fdN1w+k5Ygr3Wn6DZuY68zJp0PHT6h+yJ0tpt/m2rsrqNjDtkzQfXzD0dqO2rml8WA
	m7B4SoLbQEUvoWAkckStc7HT4Jlpr9/p01HUt8ZPSgpjocAr8PFE2rnpzRLlVhqaSkVYCHfvgvHr9
	ZCzP6Opk6Q56QCIpErwZLjNnJyCEG2Fq0Z8Eqy4/o7EHVzCSxPeyOCpzTCYYg3HsUDa+L8BRvt0Jq
	T87lmTbqQMG1Ap5tOZQRbGHUW+OXH6ZLYa/W5K81rz1LSBc33Pv6ulkZSLatrcYoT+3A1QCNdfBeO
	XGJOB+h+lN3yhASoZNGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPdPu-00EE4g-3p; Wed, 08 Feb 2023 05:54:50 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPdPq-00EDy7-9N
	for linux-mtd@lists.infradead.org; Wed, 08 Feb 2023 05:54:47 +0000
Received: by mail-pl1-x629.google.com with SMTP id g13so13333772ple.10
        for <linux-mtd@lists.infradead.org>; Tue, 07 Feb 2023 21:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Er+JSFDBh5oTxOwSj95fFMxz6IO6ysToZ41DLhWyCjY=;
        b=HLI14ijgsXw4TvW9eh7uQpbMIBMW20w/ErBLNW/gW740lwzVeYRJz1suUZyDRXv1X3
         iSbNC/NWn6ni4BkmN6Qod06PUf28L4l6W49SkewA3CKMqlVRJdXu5VXHvVhBFDMDuBGK
         bxCu3mNsxa8w4gkNXXuNKwRscnjzqnUdwfvABzLhTb7xFIWsHghImmip1XbCbW7b6vwz
         xltUIlBIjkK2lpch9XVyHhAtoYWIWs9ShM9XwcFAJr0CbqY+bZ5yVMPxPsmStTh/ElhF
         WFektlXMYVEHHZu1MHUrOyWbBzYwncTo9dOm2WPe5ChEP5gK81lhaYXiG/K//Zduuh+u
         ZtRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Er+JSFDBh5oTxOwSj95fFMxz6IO6ysToZ41DLhWyCjY=;
        b=0vq4L+oh2vKTcquaFzpJTcTdQA0uBVMP1mPU9eUOfHRa82t1T4MwPUBJYr+OwFbycx
         crbQV4X+bd83Kkvy6Rcqqz3tTlufr4gWjsbE2Lf3aKYmFarOadLFThGPJyqldvS5++uK
         bXRvQCT+ANKTetP1eFnThf7MbOYH+v9Q/uN8xs8MtQkF7POMle8iZ8LXPwqDcrC76P79
         x3LXjnr9TCEbk1u01VeYuqTiOOsp5QIjo2MKqPv1SgNYvkkU6/0EG0K6wK6FpNrddu2+
         VswBA7mMxASig3OmZ5xqsobDQAdwzE3jHAv5S1zqLq+72doT4d+eptGV/yUhP6r9K3ZQ
         XwyQ==
X-Gm-Message-State: AO0yUKXkp0eX3Shy9Twv8Z6jhKy0b9n247dcpycxtPzHRft6akbrYF/Y
	SDxXdS2DzRQgSu3kvEopfwYXYf4BlNI=
X-Google-Smtp-Source: AK7set9eN2H03vka6o1bnmpi8Hy/C1WpIrdhcumbujV+J5pTiNW+yt98IEoq0ASsys5ITCjQUow3rw==
X-Received: by 2002:a17:90b:4c8e:b0:230:c40d:45b4 with SMTP id my14-20020a17090b4c8e00b00230c40d45b4mr7197174pjb.13.1675835685895;
        Tue, 07 Feb 2023 21:54:45 -0800 (PST)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id r16-20020a638f50000000b004eca54eab50sm8915954pgn.28.2023.02.07.21.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 21:54:45 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v2 5/8] mtd: spi-nor: spansion: Rework cypress_nor_quad_enable_volatile() for multi-chip device support
Date: Wed,  8 Feb 2023 14:53:42 +0900
Message-Id: <07bd9e12e5c990e39d168fb528380fbc4d6be228.1675835253.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675835253.git.Takahiro.Kuwano@infineon.com>
References: <cover.1675835253.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_215446_365340_4B9ADEDD 
X-CRM114-Status: GOOD (  15.60  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

For multi-chip devices, we need to enable QUAD by updating CFR1V in all
dice in the device. That is done by for-loop with params->num_of_dice.
The volatile register address is calculated inside the loop by using die
number and volatile register offset.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 65 +++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 7c533737d7c3..33c8a5afcb76 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -14,7 +14,7 @@
 #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
 #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
 #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
-#define SPINOR_REG_CYPRESS_CFR1V		0x00800002
+#define SPINOR_REG_CYPRESS_CFR1			0x2
 #define SPINOR_REG_CYPRESS_CFR1_QUAD_EN		BIT(1)	/* Quad Enable */
 #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
 #define SPINOR_REG_CYPRESS_CFR2_MEMLAT_11_24	0xb
@@ -142,46 +142,47 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
 static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
 {
 	struct spi_mem_op op;
+	u32 addr;
+	u8 i;
 	u8 addr_mode_nbytes = nor->params->addr_mode_nbytes;
 	u8 cfr1v_written;
 	int ret;
 
-	op = (struct spi_mem_op)
-		CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes,
-					  SPINOR_REG_CYPRESS_CFR1V,
-					  nor->bouncebuf);
-
-	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
-	if (ret)
-		return ret;
+	for (i = 0; i < nor->params->num_of_dice; i++) {
+		addr = nor->params->vreg_offset[i] + SPINOR_REG_CYPRESS_CFR1;
+		op = (struct spi_mem_op)
+			CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes, addr,
+						  nor->bouncebuf);
+		ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+		if (ret)
+			return ret;
 
-	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR1_QUAD_EN)
-		return 0;
+		if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR1_QUAD_EN)
+			continue;
 
-	/* Update the Quad Enable bit. */
-	nor->bouncebuf[0] |= SPINOR_REG_CYPRESS_CFR1_QUAD_EN;
-	op = (struct spi_mem_op)
-		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
-					  SPINOR_REG_CYPRESS_CFR1V, 1,
-					  nor->bouncebuf);
-	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
-	if (ret)
-		return ret;
+		/* Update the Quad Enable bit. */
+		nor->bouncebuf[0] |= SPINOR_REG_CYPRESS_CFR1_QUAD_EN;
+		op = (struct spi_mem_op)
+			CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes, addr, 1,
+						  nor->bouncebuf);
+		ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
+		if (ret)
+			return ret;
 
-	cfr1v_written = nor->bouncebuf[0];
+		cfr1v_written = nor->bouncebuf[0];
 
-	/* Read back and check it. */
-	op = (struct spi_mem_op)
-		CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes,
-					  SPINOR_REG_CYPRESS_CFR1V,
-					  nor->bouncebuf);
-	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
-	if (ret)
-		return ret;
+		/* Read back and check it. */
+		op = (struct spi_mem_op)
+			CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes, addr,
+						  nor->bouncebuf);
+		ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+		if (ret)
+			return ret;
 
-	if (nor->bouncebuf[0] != cfr1v_written) {
-		dev_err(nor->dev, "CFR1: Read back test failed\n");
-		return -EIO;
+		if (nor->bouncebuf[0] != cfr1v_written) {
+			dev_err(nor->dev, "CFR1: Read back test failed\n");
+			return -EIO;
+		}
 	}
 
 	return 0;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
