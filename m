Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25107EB64DC
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 07:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2Xlmr5E70T6swbrJkXr0OGb79rpY+PSqAvYSYSAmbU=; b=g0RfODNGZScOPM
	50H9HF48M2DzKrEIo8OJ/wAvggrm1FY5cmCOr4ksuXHqpQrVeHoZH/oHacngHgXBJ3O0CTyhYhlYU
	6MyUJvGyeezpMxF6pbHNsBguCppiVhNi8OqqrWM3CHo/L/AQ+Us7XbNK1BZV53uWZtOa4K4dwZ4fy
	ic1jUYzqP/E3hfiqkAsaW9w9Q2U3sxcFuTUhfGdaq7sjCMwQffPp6TnNhVuoiIvesiyDRSg8wcKp9
	9GVBLEj809+HQEYO3MtbSAJ68khxVH8dZzuIYDXhj4a60BRLzz5exzTDSjq2FcDT82LlHXnHtUpze
	wW7hlIE7HNq3LnlmQoow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNo6-00A4Xo-0d;
	Thu, 20 Jul 2023 07:10:38 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNo1-00A4Rn-1l
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jul 2023 07:10:34 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1b8b4748fe4so2812775ad.1
        for <linux-mtd@lists.infradead.org>; Thu, 20 Jul 2023 00:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689837030; x=1690441830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lwcDiUdKk51zhKCTRMB/n0583jDIW9kWLD5I4PL3Ak4=;
        b=fQbhyQv0HJvLlFrgiRp8KlexNxXvW13jIDWrRnO590Vxe9AvDPeSdb33zHUJRF9QjX
         x9eXmCjWHsBYyptjh36U3ZFUcAgGnDEA3rX1WEjisSO3RAgBPC3hX2skxnhV2nsRsAeg
         0qp0bOLMbYteUMve1mMuFGZ2FZu5nzevhFo3ujw2JRC+lKLrEp20wLN/Tl/XEvDgzNAC
         qiragwMioPZ372H7dG+Lp60p2DrJK8JCV2msHgP3Vq0eZUGwUBDAza5pdBNKPuKK45fV
         vxg2z8dXrajSlv9CfBdEWBD8AtlkWa4n8PM6yl+11Q3dAqM9n3nGCpaPLcmiWYEelVHm
         0DBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689837030; x=1690441830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwcDiUdKk51zhKCTRMB/n0583jDIW9kWLD5I4PL3Ak4=;
        b=UkXTW0B09HOPeVsof47QGC8fBWUFYBgg/qNBhG76Rbu6RhTMoyZioZ8lyrHg0dfvvi
         K66FoyKd+gmF+9fgSvPhjkj1qolUkJO+1FzO4Y3B/rGJZoHVrqmAxr5gHhrPybFkfThb
         l0J+yaTLIwURKno8FACGEn91KidklaN/Qty9sT5R2QTepRwIgXIfVoYT7Hi/WwWMlwE2
         VesDcHZ9uBtQyiNr2FarO3qRG2dN4lxoT6y350+dWlWhkN6jDMFeBTek74LRSTNPi9fW
         TeedlHxDFNif8AwFockdd0pySk/dA6CRhpIQqyj/6LPWsJgsuZRnANfIVPUf10uTZw/v
         Fc+w==
X-Gm-Message-State: ABy/qLaQcfUguNHwdSLjYtVLG3KejcOZn93oE9L0eyeOLEISwjIg8mcQ
	KxWvJCFOb/SiiF1JNyseNXbvDUki/w4=
X-Google-Smtp-Source: APBJJlGwwYK8xDWAKAN0gGTFIeVtbxaJn61NcAXd72jyVyscTYpFb/X6l8RxPHymnZL5fM3RWq+UHA==
X-Received: by 2002:a17:902:d4c7:b0:1b1:76c2:296a with SMTP id o7-20020a170902d4c700b001b176c2296amr4845963plg.60.1689837030221;
        Thu, 20 Jul 2023 00:10:30 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902c18500b001bb20380bf2sm515821pld.13.2023.07.20.00.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 00:10:29 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	d-gole@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v2 3/8] mtd: spi-nor: spansion: prepare octal dtr methods for multi chip support
Date: Thu, 20 Jul 2023 16:09:58 +0900
Message-Id: <dd2efed51e26fe74f4a0262f17d5ff779a493a53.1689836066.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689836065.git.Takahiro.Kuwano@infineon.com>
References: <cover.1689836065.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_001033_586055_890E5DF4 
X-CRM114-Status: GOOD (  12.85  )
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

Infineon's multi-chip package (MCP) devices require the octal DTR
configuration to be set for each die. Split common code in
dedicated methods to ease the octal DDR MCP support addition.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 50 +++++++++++++++++++++++++---------
 1 file changed, 37 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 8515f7e56715..b99ed088b377 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -156,7 +156,7 @@ static int cypress_nor_sr_ready_and_clear(struct spi_nor *nor)
 	return 1;
 }
 
-static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
+static int cypress_nor_set_memlat(struct spi_nor *nor, u64 addr)
 {
 	struct spi_mem_op op;
 	u8 *buf = nor->bouncebuf;
@@ -164,8 +164,7 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 	u8 addr_mode_nbytes = nor->params->addr_mode_nbytes;
 
 	op = (struct spi_mem_op)
-		CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes,
-					  SPINOR_REG_CYPRESS_CFR2V, 0, buf);
+		CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes, addr, 0, buf);
 
 	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
 	if (ret)
@@ -176,8 +175,7 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 	*buf |= FIELD_PREP(SPINOR_REG_CYPRESS_CFR2_MEMLAT_MASK,
 			   SPINOR_REG_CYPRESS_CFR2_MEMLAT_11_24);
 	op = (struct spi_mem_op)
-		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
-					  SPINOR_REG_CYPRESS_CFR2V, 1, buf);
+		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes, addr, 1, buf);
 
 	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
 	if (ret)
@@ -185,13 +183,33 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 
 	nor->read_dummy = 24;
 
+	return 0;
+}
+
+static int cypress_nor_set_octal_dtr_bits(struct spi_nor *nor, u64 addr)
+{
+	struct spi_mem_op op;
+	u8 *buf = nor->bouncebuf;
+
 	/* Set the octal and DTR enable bits. */
 	buf[0] = SPINOR_REG_CYPRESS_CFR5_OCT_DTR_EN;
 	op = (struct spi_mem_op)
-		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
-					  SPINOR_REG_CYPRESS_CFR5V, 1, buf);
+		CYPRESS_NOR_WR_ANY_REG_OP(nor->params->addr_mode_nbytes,
+					  addr, 1, buf);
 
-	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
+	return spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
+}
+
+static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
+{
+	u8 *buf = nor->bouncebuf;
+	int ret;
+
+	ret = cypress_nor_set_memlat(nor, SPINOR_REG_CYPRESS_CFR2V);
+	if (ret)
+		return ret;
+
+	ret = cypress_nor_set_octal_dtr_bits(nor, SPINOR_REG_CYPRESS_CFR5V);
 	if (ret)
 		return ret;
 
@@ -209,11 +227,10 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 	return 0;
 }
 
-static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
+static int cypress_nor_set_single_spi_bits(struct spi_nor *nor, u64 addr)
 {
 	struct spi_mem_op op;
 	u8 *buf = nor->bouncebuf;
-	int ret;
 
 	/*
 	 * The register is 1-byte wide, but 1-byte transactions are not allowed
@@ -223,9 +240,16 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
 	buf[0] = SPINOR_REG_CYPRESS_CFR5_OCT_DTR_DS;
 	buf[1] = 0;
 	op = (struct spi_mem_op)
-		CYPRESS_NOR_WR_ANY_REG_OP(nor->addr_nbytes,
-					  SPINOR_REG_CYPRESS_CFR5V, 2, buf);
-	ret = spi_nor_write_any_volatile_reg(nor, &op, SNOR_PROTO_8_8_8_DTR);
+		CYPRESS_NOR_WR_ANY_REG_OP(nor->addr_nbytes, addr, 2, buf);
+	return spi_nor_write_any_volatile_reg(nor, &op, SNOR_PROTO_8_8_8_DTR);
+}
+
+static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
+{
+	u8 *buf = nor->bouncebuf;
+	int ret;
+
+	ret = cypress_nor_set_single_spi_bits(nor, SPINOR_REG_CYPRESS_CFR5V);
 	if (ret)
 		return ret;
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
