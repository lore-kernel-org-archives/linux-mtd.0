Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6AAEB64D7
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jun 2023 05:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LpOaqcg8jsP7WiUhvKd/yQDJmgnwGCDa2B1akJoCpSI=; b=ilka4lBOOMKia7
	37yeKUNNWGOKG93ZEvW8hFPSvXXppbZtPK/Gj7ok3n7aJ8UEVCZTunIXImnBAS2zqnJ0N0XL7K+bo
	ACaVrsIuK+bw+zIQgQFvJltEOvE1Guh5aOGI5ReApg177Cw5bVhkc8wNDqp4+YALyhKcQ6IMckCKB
	0PKSCjuq/SVuHsofab+nR4tt/Csh/akuMktL8Di5levPAze10vYPq7uVpb9mAvAFmniz0J6QMPSMA
	TW9INb7mFDErg+y5MaqVx7cUMnJbKLr9exRzEVZHJL+flNrUP0/Yw/dq2NYDNLLk1rF/FzW7tw247
	AmfFI0LFq3Juxi3CnfDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA1fp-00Grr0-1e;
	Fri, 16 Jun 2023 05:07:01 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA1fl-00GrqV-2w
	for linux-mtd@lists.infradead.org;
	Fri, 16 Jun 2023 05:06:59 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1b52bf6e669so2756955ad.2
        for <linux-mtd@lists.infradead.org>; Thu, 15 Jun 2023 22:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686892016; x=1689484016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hM8BPNlBF442xY4PSQAHNjuc8MQFpD+/zByPsZIFMlI=;
        b=rueKEZmpxV+MvrU+CDEeDaxQgq07aZqCjpzdhDWhR3ET7ZUmN3Fs2q+zBnVIN3fL3K
         ldFg/UPQB34fQ7Xvy9Ml8XBX6DBGwe4ZHAsdcySWI98DmWjen+3Q74yyGN8vmPkyuGpr
         ic5EmIkxsA3gXkBT9zOyPmyCl0GF/FuKq9FxdJxdJMRkoN5vZ+dzQ17bmZvdgEC60GDP
         ljY5GJumqfNGCQjFZUlivPqkeBu2aN7JZ2IGE3WAwojwmifmcVpxlmg9WMLAs2Hpgq8o
         tFegaoKsTBgQyybFaWNRl1mUkO5RKII7oCJBk6uFplHApuXIutfAwLMHJiYxSybRajyH
         atxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686892016; x=1689484016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hM8BPNlBF442xY4PSQAHNjuc8MQFpD+/zByPsZIFMlI=;
        b=iVKn3VhFFMTHn1Jc4rsWpf5pJdIIX8oio9fhYXdxdyogW+qG1GVI4pPvFmq3oopozC
         AaA1UWowhirsBNy95CjftFhXw/c6YMHYdQFj+T3WpLh6e+ARu8m5JHFkW41cKrz4acQw
         9AbEZ2BepQs+oIJanVN/FcOxuZ5+ddU9JBIZ1wVb+0OhFJIZvHts96YuPdT1xxEW1dRJ
         0Rb4J9akswnHlVv4UNa4qy86MzLCzPetJ7FpPnyD8GFyzcyIjf/xNFY7OKcMnuuvLYGk
         XTPoua7ncNLSjUEbfUnFx8kKUMtvS272pFbqOzgIzLGZ0r+JoVLj/snapo9PJdwcZL54
         PBxw==
X-Gm-Message-State: AC+VfDw3VUQtAdJ6/1Q3MHbZ26iPou+WCBkPD+uWUlV7+FtSHPRlbiK0
	g47QUG4ySjJPzd0Tna3MkiD3GzTLQOo=
X-Google-Smtp-Source: ACHHUZ7y1X5W7/oKntULnMu55UvJuyu7aiPHVS3rU4aWJnk7LQxrCovUTkk3XraMeB4yeQiz2QKOgQ==
X-Received: by 2002:a17:902:e74a:b0:1b0:3f89:9836 with SMTP id p10-20020a170902e74a00b001b03f899836mr1027905plf.22.1686892015860;
        Thu, 15 Jun 2023 22:06:55 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id z10-20020a170903018a00b001b1f991a4d0sm14904322plg.108.2023.06.15.22.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 22:06:55 -0700 (PDT)
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
Subject: [PATCH] mtd: spi-nor: Make octal_dtr_enable() dedicate for enabling Octal DTR
Date: Fri, 16 Jun 2023 14:06:00 +0900
Message-Id: <20230616050600.8793-1-Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_220657_974720_B3553F4A 
X-CRM114-Status: GOOD (  19.25  )
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

The function should be responsible only for enabling Octal DTR. Remove
'enable' parameter from octal_dtr_enable() and add octal_dtr_disable()
that takes care for disabling. This can remove 'enable' flag checks in
core and manufacturer drivers and improve readability.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/core.c      | 42 ++++++++++++++++++++++++++-------
 drivers/mtd/spi-nor/core.h      |  4 +++-
 drivers/mtd/spi-nor/micron-st.c | 11 +++------
 drivers/mtd/spi-nor/spansion.c  | 36 ++++++++++++++--------------
 4 files changed, 57 insertions(+), 36 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 143ca3c9b477..d2571f309f41 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3086,11 +3086,10 @@ static int spi_nor_init_params(struct spi_nor *nor)
 
 /** spi_nor_octal_dtr_enable() - enable Octal DTR I/O if needed
  * @nor:                 pointer to a 'struct spi_nor'
- * @enable:              whether to enable or disable Octal DTR
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int spi_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
+static int spi_nor_octal_dtr_enable(struct spi_nor *nor)
 {
 	int ret;
 
@@ -3104,14 +3103,39 @@ static int spi_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
 	if (!(nor->flags & SNOR_F_IO_MODE_EN_VOLATILE))
 		return 0;
 
-	ret = nor->params->octal_dtr_enable(nor, enable);
+	ret = nor->params->octal_dtr_enable(nor);
 	if (ret)
 		return ret;
 
-	if (enable)
-		nor->reg_proto = SNOR_PROTO_8_8_8_DTR;
-	else
-		nor->reg_proto = SNOR_PROTO_1_1_1;
+	nor->reg_proto = SNOR_PROTO_8_8_8_DTR;
+
+	return 0;
+}
+
+/** spi_nor_octal_dtr_disable() - disable Octal DTR I/O if it is enabled
+ * @nor:                 pointer to a 'struct spi_nor'
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_octal_dtr_disable(struct spi_nor *nor)
+{
+	int ret;
+
+	if (!nor->params->octal_dtr_disable)
+		return 0;
+
+	if (!(nor->read_proto == SNOR_PROTO_8_8_8_DTR &&
+	      nor->write_proto == SNOR_PROTO_8_8_8_DTR))
+		return 0;
+
+	if (!(nor->flags & SNOR_F_IO_MODE_EN_VOLATILE))
+		return 0;
+
+	ret = nor->params->octal_dtr_disable(nor);
+	if (ret)
+		return ret;
+
+	nor->reg_proto = SNOR_PROTO_1_1_1;
 
 	return 0;
 }
@@ -3165,7 +3189,7 @@ static int spi_nor_init(struct spi_nor *nor)
 {
 	int err;
 
-	err = spi_nor_octal_dtr_enable(nor, true);
+	err = spi_nor_octal_dtr_enable(nor);
 	if (err) {
 		dev_dbg(nor->dev, "octal mode not supported\n");
 		return err;
@@ -3267,7 +3291,7 @@ static int spi_nor_suspend(struct mtd_info *mtd)
 	int ret;
 
 	/* Disable octal DTR mode if we enabled it. */
-	ret = spi_nor_octal_dtr_enable(nor, false);
+	ret = spi_nor_octal_dtr_disable(nor);
 	if (ret)
 		dev_err(nor->dev, "suspend() failed\n");
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index fd61c4793a10..9c33d7c8395b 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -364,6 +364,7 @@ struct spi_nor_otp {
  *                      Table.
  * @otp:		SPI NOR OTP info.
  * @octal_dtr_enable:	enables SPI NOR octal DTR mode.
+ * @octal_dtr_disable:	disables SPI NOR octal DTR mode.
  * @quad_enable:	enables SPI NOR quad mode.
  * @set_4byte_addr_mode: puts the SPI NOR in 4 byte addressing mode.
  * @convert_addr:	converts an absolute address into something the flash
@@ -397,7 +398,8 @@ struct spi_nor_flash_parameter {
 	struct spi_nor_erase_map        erase_map;
 	struct spi_nor_otp		otp;
 
-	int (*octal_dtr_enable)(struct spi_nor *nor, bool enable);
+	int (*octal_dtr_enable)(struct spi_nor *nor);
+	int (*octal_dtr_disable)(struct spi_nor *nor);
 	int (*quad_enable)(struct spi_nor *nor);
 	int (*set_4byte_addr_mode)(struct spi_nor *nor, bool enable);
 	u32 (*convert_addr)(struct spi_nor *nor, u32 addr);
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 4b919756a205..15c70085085b 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -47,7 +47,7 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_NO_DATA)
 
-static int micron_st_nor_octal_dtr_en(struct spi_nor *nor)
+static int micron_st_nor_octal_dtr_enable(struct spi_nor *nor)
 {
 	struct spi_mem_op op;
 	u8 *buf = nor->bouncebuf;
@@ -84,7 +84,7 @@ static int micron_st_nor_octal_dtr_en(struct spi_nor *nor)
 	return 0;
 }
 
-static int micron_st_nor_octal_dtr_dis(struct spi_nor *nor)
+static int micron_st_nor_octal_dtr_disable(struct spi_nor *nor)
 {
 	struct spi_mem_op op;
 	u8 *buf = nor->bouncebuf;
@@ -120,15 +120,10 @@ static int micron_st_nor_octal_dtr_dis(struct spi_nor *nor)
 	return 0;
 }
 
-static int micron_st_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
-{
-	return enable ? micron_st_nor_octal_dtr_en(nor) :
-			micron_st_nor_octal_dtr_dis(nor);
-}
-
 static void mt35xu512aba_default_init(struct spi_nor *nor)
 {
 	nor->params->octal_dtr_enable = micron_st_nor_octal_dtr_enable;
+	nor->params->octal_dtr_disable = micron_st_nor_octal_dtr_disable;
 }
 
 static int mt35xu512aba_post_sfdp_fixup(struct spi_nor *nor)
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 15f9a80c10b9..a0231075e18a 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -141,7 +141,16 @@ static int cypress_nor_sr_ready_and_clear(struct spi_nor *nor)
 	return 1;
 }
 
-static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
+/**
+ * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
+ * @nor:		pointer to a 'struct spi_nor'
+ *
+ * This also sets the memory access latency cycles to 24 to allow the flash to
+ * run at up to 200MHz.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int cypress_nor_octal_dtr_enable(struct spi_nor *nor)
 {
 	struct spi_mem_op op;
 	u8 *buf = nor->bouncebuf;
@@ -184,7 +193,13 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 	return 0;
 }
 
-static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
+/**
+ * cypress_nor_octal_dtr_disable() - Disable octal DTR on Cypress flashes.
+ * @nor:		pointer to a 'struct spi_nor'
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int cypress_nor_octal_dtr_disable(struct spi_nor *nor)
 {
 	struct spi_mem_op op;
 	u8 *buf = nor->bouncebuf;
@@ -606,22 +621,6 @@ static struct spi_nor_fixups s25hx_t_fixups = {
 	.late_init = s25hx_t_late_init,
 };
 
-/**
- * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
- * @nor:		pointer to a 'struct spi_nor'
- * @enable:              whether to enable or disable Octal DTR
- *
- * This also sets the memory access latency cycles to 24 to allow the flash to
- * run at up to 200MHz.
- *
- * Return: 0 on success, -errno otherwise.
- */
-static int cypress_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
-{
-	return enable ? cypress_nor_octal_dtr_en(nor) :
-			cypress_nor_octal_dtr_dis(nor);
-}
-
 static int s28hx_t_post_sfdp_fixup(struct spi_nor *nor)
 {
 	/*
@@ -668,6 +667,7 @@ static int s28hx_t_post_bfpt_fixup(struct spi_nor *nor,
 static void s28hx_t_late_init(struct spi_nor *nor)
 {
 	nor->params->octal_dtr_enable = cypress_nor_octal_dtr_enable;
+	nor->params->octal_dtr_disable = cypress_nor_octal_dtr_disable;
 	cypress_nor_ecc_init(nor);
 }
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
