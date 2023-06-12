Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E190C7EE2E
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jun 2023 10:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cEDXUmn433klWQ57HrURKhZ0tqzuRO8tLo7TJtr1CA4=; b=a1BOFHfFh/Ex+T
	ad8xAzVnfoAD+rNjM/xd03br92GOkyMy0r16GlAuVNE1P4sJJhWEJuUFLxzdydVQD44M3sZ2/1efT
	tkPz4Ol0CcaJwYPlKduY+MWVNUlCtdjIRwTFpyXpFuVQCW3RGHf/+qyUSx6u0MwoSCSNcV7QX2HNX
	8dbxZLa0yoz5m0XC5Ezs+IFFizcd7QKLle13UQvX7YYFKM2PgVBO/NmrY/OnpTRRI0mo6qFDjvBLR
	mZg/IDZoztUhLJi82B61BSlx60UpOvucDIKVT19yRz1fmlS/rZsSRmhEnyn0fal9DH9RT9IWkkXFs
	ilieMeL1k4CcNNueQ0IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8ePm-003QK2-0N;
	Mon, 12 Jun 2023 10:04:46 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8ePi-003QIa-30
	for linux-mtd@lists.infradead.org;
	Mon, 12 Jun 2023 10:04:44 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-665a18f5643so234478b3a.0
        for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2023 03:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686564282; x=1689156282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nAm8XcBOqNgLf3Z13lKw06Fhl84cvZ3QF9Y39YR3Bc=;
        b=H8Na9p8imHj0nI4HuToOAoDAlxO4AJco0fy8/aWZ1PkbDbyqhHLay7gNxziS90TVZ4
         Vg8keKORDipMAlHkPRl8yiuA6JbZEG9j8ApzeaZeW6N49Yt20yTMEOVrBO1L3ylNZZqr
         jE0CFhlh7ULExaa35FIoH3xMkS4vr/vcHT/wLtxIzyFofAM0OezKToqIb11oKBDdcLZY
         OaRmtKnSmTsLdDQrmS1eHIT6kATVktLZTvvmOJXGDOYVqAUYVxd1cHOIpcdvdUYOM5Y+
         unHMgHjEDHmcsm2CuPHUjMFo2CdRgSJuyhdUeD3yZmBRj+7h1uiEIgYo32rBwNGGx0uO
         3KBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686564282; x=1689156282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0nAm8XcBOqNgLf3Z13lKw06Fhl84cvZ3QF9Y39YR3Bc=;
        b=EIBw8dIbIYhgCIIw3bNdJyQ4aoIhopAZGgp/AcMZEZHHZXRU7wzH9AJ3aU+2CrkFcj
         gbUWYk9+9H6Bgk2vXkjz2duUH3EpMxx6/UeeqBdyWWXf+xu5ufGt02ru3/6BN1RJqr7K
         CkAdSGcfTtJHe01cDdL0SFs1bd/0sDNXxtA8jon9AoabIiPybNuyS/7ObeOzXdNkuOD1
         CtPWkw/Hyu9S8HwqEQidVCsgbUz7vcLGwYb57KM95wLHew8OyCI0gh8hrwk6mtxTStHS
         iEca0UFjWq+rogVycjKZ1ZnHmOPIF03RMmt6I5XDelTICANFJo9ha6DX05+NofEMexwD
         AoKw==
X-Gm-Message-State: AC+VfDx0hsP5zUh5oxcXLEFiQ1Eli2jePuskSjy1IzVmGvrB5fGBwurv
	3rt7Gc0+XWNBoFnJiv2lPVjau84+e+Q=
X-Google-Smtp-Source: ACHHUZ6WNFzLYIrB0e5AqSITfDa2Uf0bxfFNRelHAcspbY7YleyEC4X4t8hoycLpjw2IsKWKD6iJyw==
X-Received: by 2002:a05:6a20:a123:b0:10a:b812:bcc7 with SMTP id q35-20020a056a20a12300b0010ab812bcc7mr10144769pzk.17.1686564282194;
        Mon, 12 Jun 2023 03:04:42 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id 17-20020aa79211000000b00662610cf7a8sm6723376pfo.172.2023.06.12.03.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 03:04:41 -0700 (PDT)
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
Subject: [PATCH 3/5] mtd: spi-nor: spansion: Add MCP support in octal_dtr_enable()
Date: Mon, 12 Jun 2023 19:04:07 +0900
Message-Id: <cac44f4d9ed06e250c2fa8aa900d8de3de4c4337.1686557139.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686557139.git.Takahiro.Kuwano@infineon.com>
References: <cover.1686557139.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_030442_968445_DD04D07B 
X-CRM114-Status: GOOD (  16.17  )
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

S28HS02GT is multi-chip package (MCP) device that requires Octal DTR
configuraion for each die. We can access to configuration registers in each
die by using params->n_dice and params->vreg_offset[] populated from SFDP.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 71 +++++++++++++++++++++++++---------
 1 file changed, 53 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 0daa3a357ae8..eda3731c17be 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -156,7 +156,7 @@ static int cypress_nor_sr_ready_and_clear(struct spi_nor *nor)
 	return 1;
 }
 
-static int cypress_nor_setup_memlat(struct spi_nor *nor)
+static int cypress_nor_setup_memlat(struct spi_nor *nor, u64 addr)
 {
 	struct spi_mem_op op;
 	u8 *buf = nor->bouncebuf;
@@ -164,8 +164,7 @@ static int cypress_nor_setup_memlat(struct spi_nor *nor)
 	u8 addr_mode_nbytes = nor->params->addr_mode_nbytes;
 
 	op = (struct spi_mem_op)
-		CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes,
-					  SPINOR_REG_CYPRESS_CFR2V, 0, buf);
+		CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes, addr, 0, buf);
 
 	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
 	if (ret)
@@ -175,13 +174,12 @@ static int cypress_nor_setup_memlat(struct spi_nor *nor)
 	*buf &= ~SPINOR_REG_CYPRESS_CFR2_MEMLAT_MASK;
 	*buf |= SPINOR_REG_CYPRESS_CFR2_MEMLAT_11_24;
 	op = (struct spi_mem_op)
-		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
-					  SPINOR_REG_CYPRESS_CFR2V, 1, buf);
+		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes, addr, 1, buf);
 
 	return spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
 }
 
-static int cypress_nor_setup_opiddr(struct spi_nor *nor, bool enable)
+static int cypress_nor_setup_opiddr(struct spi_nor *nor, u64 addr, bool enable)
 {
 	struct spi_mem_op op;
 	u8 *buf = nor->bouncebuf;
@@ -191,8 +189,7 @@ static int cypress_nor_setup_opiddr(struct spi_nor *nor, bool enable)
 		buf[0] = SPINOR_REG_CYPRESS_CFR5_OCT_DTR_EN;
 		op = (struct spi_mem_op)
 			CYPRESS_NOR_WR_ANY_REG_OP(nor->params->addr_mode_nbytes,
-						  SPINOR_REG_CYPRESS_CFR5V, 1,
-						  buf);
+						  addr, 1, buf);
 	} else {
 		/*
 		 * The register is 1-byte wide, but 1-byte transactions are not
@@ -203,8 +200,7 @@ static int cypress_nor_setup_opiddr(struct spi_nor *nor, bool enable)
 		buf[0] = SPINOR_REG_CYPRESS_CFR5_OCT_DTR_DS;
 		buf[1] = 0;
 		op = (struct spi_mem_op)
-			CYPRESS_NOR_WR_ANY_REG_OP(nor->addr_nbytes,
-						  SPINOR_REG_CYPRESS_CFR5V, 2,
+			CYPRESS_NOR_WR_ANY_REG_OP(nor->addr_nbytes, addr, 2,
 						  buf);
 	}
 
@@ -600,6 +596,49 @@ static struct spi_nor_fixups s25hx_t_fixups = {
 	.late_init = s25hx_t_late_init,
 };
 
+static int cypress_nor_octal_dtr_enable_single_chip(struct spi_nor *nor,
+						    bool enable)
+{
+	int ret;
+
+	if (enable) {
+		ret = cypress_nor_setup_memlat(nor, SPINOR_REG_CYPRESS_CFR2V);
+		if (ret)
+			return ret;
+
+		nor->read_dummy = 24;
+	}
+
+	return cypress_nor_setup_opiddr(nor, SPINOR_REG_CYPRESS_CFR5V, enable);
+}
+
+static int cypress_nor_octal_dtr_enable_mcp(struct spi_nor *nor, bool enable)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+	u64 addr;
+	u8 i;
+	int ret;
+
+	if (enable) {
+		for (i = 0; i < params->n_dice; i++) {
+			addr = params->vreg_offset[i] + SPINOR_REG_CYPRESS_CFR2;
+			ret = cypress_nor_setup_memlat(nor, addr);
+			if (ret)
+				return ret;
+		}
+		nor->read_dummy = 24;
+	}
+
+	for (i = 0; i < params->n_dice; i++) {
+		addr = params->vreg_offset[i] + SPINOR_REG_CYPRESS_CFR5;
+		ret = cypress_nor_setup_opiddr(nor, addr, enable);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 /**
  * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
  * @nor:		pointer to a 'struct spi_nor'
@@ -616,15 +655,11 @@ static int cypress_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
 	u8 naddr, ndummy;
 	enum spi_nor_protocol proto;
 
-	if (enable) {
-		ret = cypress_nor_setup_memlat(nor);
-		if (ret)
-			return ret;
-
-		nor->read_dummy = 24;
-	}
+	if (nor->params->n_dice)
+		ret = cypress_nor_octal_dtr_enable_mcp(nor, enable);
+	else
+		ret = cypress_nor_octal_dtr_enable_single_chip(nor, enable);
 
-	ret = cypress_nor_setup_opiddr(nor, enable);
 	if (ret)
 		return ret;
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
