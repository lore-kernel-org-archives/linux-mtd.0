Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10610C76196
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Apr 2023 06:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7FUWdRwSusR4Me4CSCs4U5lM+7ildSrvTJL2Gct6SEw=; b=FlqhHC25L0HPKY
	x1HIHenQWcFDd9hlJyh2no2YDUnTSnNMj5tjQyfssV0ngY1HFJIeQ9ozq48rOmTptwRsFxLOL4J0o
	Hp218UK+nQHyr5S/Aevr3AcfnWAPAQewjKEVsRCTaO4wdMqwvw3dMnkp5sR5bptlArh9BqvGHBVeZ
	yT5gCFz6S/fFJJ7VqYJsXDxEJl1no5X9a+uSFWba9p6ekBxGDOfpyOv1IXd9O+CYzAPHpUun1N7Ks
	pDKRmNfdTMVAeFx/wh5Cj8IM3IbEsChyoZx4lCEIvgx6/RDIQYfpsuG4x0v44srNGzrTNI/q6QP4L
	/ZlShxaP04FRN1KgJXFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkJN9-006WZx-12;
	Thu, 06 Apr 2023 06:45:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkJN8-006WZj-0N
	for linux-mtd@bombadil.infradead.org;
	Thu, 06 Apr 2023 06:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6WsaAzMK7NsfVaQbDoNPOvf2AK+4muKRB7TYhUL83ko=; b=dm/h/SXAi4maQDKlfjjUcX9U3u
	AovtL0eI5HW3VgQ1oBxvgrY+60jxcj5eE+FaFt/orf4xghfKAgSRFTJuspS1zh3TU3lcQH0lpylmX
	gUq9vGXDOU8YTtJ+TkNVP+geRidCT+Av4y1U+OosZ0k3O+nbUELWNi4xgTP13zN8metvCakxAhddI
	/wIeDiYDOmIoBLMZhOeJrLk/OFVl+DBp+C+CRCp8fCdCVMKEtpYF6sqnFLf/sJ7Goq1aR7GzgI92E
	LMosFiQJJ6St6BK0xw1x/0kO/15fch/dma5jlYg6NIhROlW112bsq4pVptWCoGIMuGu93zIiALI2J
	jEm28kuQ==;
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkIyL-00ARK0-1R
	for linux-mtd@lists.infradead.org;
	Thu, 06 Apr 2023 06:19:52 +0000
Received: by mail-pj1-x1033.google.com with SMTP id om3-20020a17090b3a8300b0023efab0e3bfso41916393pjb.3
        for <linux-mtd@lists.infradead.org>; Wed, 05 Apr 2023 23:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680761984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WsaAzMK7NsfVaQbDoNPOvf2AK+4muKRB7TYhUL83ko=;
        b=Sghkqw9vEDGT8GmdBHwNcLbJb/szTywUqRYSQAQZtqg17Ny3YoxTh5bMLMqBTXBR7Q
         UjUG+dW2PhQZ73KgZLR6HA14x/3X0PvPOmc2MV4tTMWSXr2OKFjxrOY/+z2s5Dht2kbS
         9X9FV/wjFaFi0tqEb/QTumeXhYmIcvRqPrCjtnI6EjvhRD1CccOyjAwRq3C12OAOnmKr
         gecV8e9ZPF3gmb2bo4DVKqRonmMPj9xKQqizzhnhhXCKia5I4uvP1J2srscpNs6WXYi7
         dG4kJUwmJZ21mcCsUoQ6MGPO3KgnP2y6p2hec0rVuCX81l+ATouhn4Hc8SiKdQtmm2iK
         S8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680761984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6WsaAzMK7NsfVaQbDoNPOvf2AK+4muKRB7TYhUL83ko=;
        b=kWq03iLc8QLZGHxKQIkEzWS46gjtI1qqIdyGCXpHkUURhQCW/NHMgmdw6m5Z/JQqnM
         H7U9fR0GpGVIZrED/sPCgRTgh0nG9ouOrIWcFdlD/bOLsO/jZ9u+WvEuBf3DMT5HRQcH
         L0xyLzCVlauTIb9B/BJhDb0TL0Eirkuiv8B0dj0t7rbYUwww/TSlNh/X3+MFV1QqJRhf
         c/R5K3bNyvevS1Xng0rdPqPCFlttUuAvjLrUpAUyz2CXn8Ic3e6J4ZK5RSioFF2NVl8S
         //GMbTfC+D1simD5KSXt87j2fJSeNl9S67TKK7R0V10N2gkui0gskf9Xw01DT/M9u1u1
         IO2A==
X-Gm-Message-State: AAQBX9dq2E3yKe2d33Qa9+HzGaXKk2FLhA9JMrQedx+5/0iT5+9tuCPh
	8t6LDn5GIPKUp1cBTlkydZy1LgzK+kwlXw==
X-Google-Smtp-Source: AKy350YpHY2mDXnA2eDUvRAHbPhXNQ8vYj8RbCUn7W0b3BXyBGRCyxJKvufHXV0PTdU75FyWyB5oFg==
X-Received: by 2002:a05:6a20:4b05:b0:cc:eb3b:56e9 with SMTP id fp5-20020a056a204b0500b000cceb3b56e9mr1994664pzb.1.1680761984112;
        Wed, 05 Apr 2023 23:19:44 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-38-119.msd.spmode.ne.jp. [49.98.38.119])
        by smtp.gmail.com with ESMTPSA id 18-20020aa79152000000b0062dbafd2980sm450542pfi.65.2023.04.05.23.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 23:19:43 -0700 (PDT)
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
Subject: [PATCH v3 6/8] mtd: spi-nor: spansion: Rework cypress_nor_quad_enable_volatile() for multi-chip device support
Date: Thu,  6 Apr 2023 15:18:57 +0900
Message-Id: <fbdfc011fae770ab2d1e97f0e981bd59030a7360.1680749578.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680749577.git.Takahiro.Kuwano@infineon.com>
References: <cover.1680749577.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_071949_846549_D8FB1582 
X-CRM114-Status: GOOD (  16.51  )
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

Rework quad method for multi-chip devices by updating CFR1V in all
dice in the device.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 60 ++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 5e021e20497b..91bc0aace516 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -139,21 +139,7 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
 	return 0;
 }
 
-/**
- * cypress_nor_quad_enable_volatile() - enable Quad I/O mode in volatile
- *                                      register.
- * @nor:	pointer to a 'struct spi_nor'
- *
- * It is recommended to update volatile registers in the field application due
- * to a risk of the non-volatile registers corruption by power interrupt. This
- * function sets Quad Enable bit in CFR1 volatile. If users set the Quad Enable
- * bit in the CFR1 non-volatile in advance (typically by a Flash programmer
- * before mounting Flash on PCB), the Quad Enable bit in the CFR1 volatile is
- * also set during Flash power-up.
- *
- * Return: 0 on success, -errno otherwise.
- */
-static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
+static int cypress_nor_quad_enable_volatile_reg(struct spi_nor *nor, u64 addr)
 {
 	struct spi_mem_op op;
 	u8 addr_mode_nbytes = nor->params->addr_mode_nbytes;
@@ -161,8 +147,7 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
 	int ret;
 
 	op = (struct spi_mem_op)
-		CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes,
-					  SPINOR_REG_CYPRESS_CFR1V, 0,
+		CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes, addr, 0,
 					  nor->bouncebuf);
 
 	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
@@ -175,8 +160,7 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
 	/* Update the Quad Enable bit. */
 	nor->bouncebuf[0] |= SPINOR_REG_CYPRESS_CFR1_QUAD_EN;
 	op = (struct spi_mem_op)
-		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
-					  SPINOR_REG_CYPRESS_CFR1V, 1,
+		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes, addr, 1,
 					  nor->bouncebuf);
 	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
 	if (ret)
@@ -186,8 +170,7 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
 
 	/* Read back and check it. */
 	op = (struct spi_mem_op)
-		CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes,
-					  SPINOR_REG_CYPRESS_CFR1V, 0,
+		CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes, addr, 0,
 					  nor->bouncebuf);
 	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
 	if (ret)
@@ -201,6 +184,41 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
 	return 0;
 }
 
+/**
+ * cypress_nor_quad_enable_volatile() - enable Quad I/O mode in volatile
+ *                                      register.
+ * @nor:	pointer to a 'struct spi_nor'
+ *
+ * It is recommended to update volatile registers in the field application due
+ * to a risk of the non-volatile registers corruption by power interrupt. This
+ * function sets Quad Enable bit in CFR1 volatile. If users set the Quad Enable
+ * bit in the CFR1 non-volatile in advance (typically by a Flash programmer
+ * before mounting Flash on PCB), the Quad Enable bit in the CFR1 volatile is
+ * also set during Flash power-up.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+	u64 addr;
+	u8 i;
+	int ret;
+
+	if (!params->n_dice)
+		return cypress_nor_quad_enable_volatile_reg(nor,
+						SPINOR_REG_CYPRESS_CFR1V);
+
+	for (i = 0; i < params->n_dice; i++) {
+		addr = params->vreg_offset[i] + SPINOR_REG_CYPRESS_CFR1;
+		ret = cypress_nor_quad_enable_volatile_reg(nor, addr);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 /**
  * cypress_nor_determine_addr_mode_by_sr1() - Determine current address mode
  *                                            (3 or 4-byte) by querying status
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
