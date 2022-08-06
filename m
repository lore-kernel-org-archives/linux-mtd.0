Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408C0C19F29
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Aug 2022 06:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bb67cH3LgOVLUDZ4WwCi2aw84mn/dI0YU/LG9jgf32w=; b=mi3tZnx68w/79n
	hHVMtLcNnx3BjoKVtoPDDY4tk0IurtWD4znUsWRIWxy6Gx90B4KxYHA+EQk2Sx1QvSWxkQZzcVmNi
	4xuhzsggLd1/9a9xZPRmownnqEUr/jtqeUaYMg85jdH58h6TYjeFRQMuvoCtmhAa272sqaCcy0APt
	UGbTT3V6mYLsjFP4pqI8pjUlFAt2B2JkSnnkywesaiF3diXeS63voMs1MjHROZIhF9WwU4Be3p1u0
	rsq4Uy/PQsqr6OwimrSajyhPp3Q0diS+BrZ246dReGggLmAtkLs1m38Jjg2yfguMbQ2HdGist+oXd
	nDfEZI2GXcxFjJfGvx1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKDPQ-004nXB-QC; Sat, 06 Aug 2022 06:35:40 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKDPL-004nLR-31
	for linux-mtd@lists.infradead.org; Sat, 06 Aug 2022 06:35:36 +0000
Received: by mail-pg1-x529.google.com with SMTP id d7so4304644pgc.13
        for <linux-mtd@lists.infradead.org>; Fri, 05 Aug 2022 23:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=oxEAWy2RBZzv7Rn8Zk2fGQR3tPRczcUHneOqZyqAznk=;
        b=GedsNNvkpKX+hKr6giKedXIwRA6jNbnGN5HK8g0UpyK0kJExak9wU8Nkp0e6l29HIM
         x7LY8Pt2mLZdCAQhehVEKrMlRlEAdnIbBnr1Qd9awiZ/t9WiK7TXiRRhvOR9gspdSVkY
         st20gMhm49QgCXkAqZAy+E5iV0tn1VUpsp9jdIfofMFk9/diCXnCZXabzMTmU8jItkzy
         qer/n+PkeUFC+LIyKLkWj1qL37TKQuzvnbMCfl32K7yhEOK50NGsZrByafh0nwmbCCKD
         g5xj/sdlYLmTIUocMzshiBtmVopDD3YX+I1EVcfjU3UEESijODgyXC/gNXXBNtHeH9gR
         rsyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=oxEAWy2RBZzv7Rn8Zk2fGQR3tPRczcUHneOqZyqAznk=;
        b=JsC4QyRpy1sAgDervgAvHS4stU2Il9mS8A+OcKP8SaZ4VXRQKZvbAzDL3hIYyO6tKw
         vBZvoVyjQavpcN/1VaJIiQBjjJ9yyyoFedjxH8JTYdtBAaYEQtR3+R7hZqbQc+dhoPVZ
         oU6Xe2bgTzleJas5I2AXqtbfxdHfjYvEeIAky0cgICqvprQI+j94bE52hAsPor8Mzx4m
         SDwEU/qoJ0zFqS2cQo/eBvI68/UFYynSxze7mlMgXumoOuBTbTa5T5yP7cAe+seLrpwJ
         URR7j4EmcLm/rJIqhVGA4SrUub3rRWGNZtvAatKqbr347Lh5JM8R8b+ptRlpeS5YTT0b
         Ek8g==
X-Gm-Message-State: ACgBeo3R4ANXChyXidhdOgYrHSdgzPgKBaYP6N+7octilmx++4jpyfaT
	Qx7xNfMBshzNVx+KzbQ9y77uqdBUaQ+VTA==
X-Google-Smtp-Source: AA6agR7Kl4bItkFJxZ1nOXDIFn/ztHt58+W6jP//6JuMhqHU84uFOn0K41Agfgedb88fGn4aXXkg4w==
X-Received: by 2002:a63:89c6:0:b0:41d:3589:5048 with SMTP id v189-20020a6389c6000000b0041d35895048mr1264017pgd.494.1659767733674;
        Fri, 05 Aug 2022 23:35:33 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id a18-20020a63e852000000b0041b67615584sm2418452pgk.68.2022.08.05.23.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 23:35:33 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH 5/8] mtd: spi-nor: spansion: Rework cypress_nor_quad_enable_volatile() for multi-chip device support
Date: Sat,  6 Aug 2022 15:34:23 +0900
Message-Id: <313749b6a30665e981296783a6978f17a0381097.1659764848.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659764848.git.Takahiro.Kuwano@infineon.com>
References: <cover.1659764848.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_233535_216226_533F581E 
X-CRM114-Status: GOOD (  14.71  )
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
index d82dd750da9a..d7a61ea63139 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -14,7 +14,7 @@
 #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
 #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
 #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
-#define SPINOR_REG_CYPRESS_CFR1V		0x00800002
+#define SPINOR_REG_CYPRESS_CFR1			0x2
 #define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN	BIT(1)	/* Quad Enable */
 #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
 #define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24	0xb
@@ -137,46 +137,47 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
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
 
-	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
-		return 0;
+		if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
+			return 0;
 
-	/* Update the Quad Enable bit. */
-	nor->bouncebuf[0] |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
-	op = (struct spi_mem_op)
-		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
-					  SPINOR_REG_CYPRESS_CFR1V, 1,
-					  nor->bouncebuf);
-	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
-	if (ret)
-		return ret;
+		/* Update the Quad Enable bit. */
+		nor->bouncebuf[0] |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
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
