Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A164C76196
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Apr 2023 06:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7FUWdRwSusR4Me4CSCs4U5lM+7ildSrvTJL2Gct6SEw=; b=i+OZBMFIrUjcKb
	slzCjTkoOgMUXTCPLmMSecYrUAs658C1uxfDUZl6rZMj5TVTe9xvWXT+SZ9Bvu7nuUXQdSeAv74b9
	JACbSliFyp8zSdEkOXrsV7ThsmXZ8o3QWkAr7KPhIO9q5rJ7YqiXxjtnItXBME3VpdrCoY2QzAfXZ
	aEhDhRT5YZcG+H9Z5CvBFbRhx1cNY/5n8A6UXOFpJaSZLVcOH9cxkf1FNGdVuM3kfn0Ov2mJkQ2YW
	v1r5bhpa99FILixQsVOah6HWVDTAP69owbURYmSffA3WHb+HmXy2AikUBqvQKkdLYtOOmMMkuFpKW
	jmipoXTUXS1n1BoxoZUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfnL-009IEf-0G;
	Fri, 07 Apr 2023 06:41:59 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfnG-009IBp-2n
	for linux-mtd@lists.infradead.org;
	Fri, 07 Apr 2023 06:41:57 +0000
Received: by mail-pl1-x634.google.com with SMTP id iw3so39341985plb.6
        for <linux-mtd@lists.infradead.org>; Thu, 06 Apr 2023 23:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680849713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WsaAzMK7NsfVaQbDoNPOvf2AK+4muKRB7TYhUL83ko=;
        b=P8kFiPVh56LUFHKXW27qZWDeD4T/Fa8NhoAudSMfMzVj3i1zBEty8O2Kb8yzmZKKHc
         js3Lelo72Xhq262+aiHofF4SX93jc5rlTfBrFBZLmV6l4nulG8XYEJTqosTBqMvtMGyj
         UcjM/e6WcRhZNNWgR3lRoaDb8n2ypG/2x0TAv2Xm9Bi6gWvDs8LvsTjvCrzYPd3q//Py
         FHZsaretSnmOUnF1d2Pp5RngSeoiFThUC0gBDL5jzxvy7ow6uMlyhHqY4vJiYe+r6aJ+
         IMzgNUC8jxxKRU/iZ+Wq4QjHH991BUULg9MwvFkpsigFQdDPEHgYIhr9D+5Afoazf3aE
         n1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680849713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6WsaAzMK7NsfVaQbDoNPOvf2AK+4muKRB7TYhUL83ko=;
        b=bGUIXCjaQdXmRnwErtJZrYesp+vrh34TY7FCpmWGfFgvhpkRy6rTToBJdAJcK0diB1
         emmchi9bHV5RMohaTP8jGG4RZTwid+0+vhvATpkIlVf8JafY+SSkIsegbtpPdATO6VNX
         m/FclBrMzYbm+zr3wUA1p2Zn1UqK41AGJfZA8D/16QLjbfRfgEbBU8hsqnvsBa0OMpq6
         a8F4Rc1EsC10+MJlbXBPBrYgczhr6fVtmNVqAupfN3/246ku8oaaHQGCNVT7Q6dMzM/B
         kWqLb/rpStcLHECvlm2PMBZc2y0IxoqZLYlU83NrCD+ZFjTJjiQ715I7AvfOuJJ2pKkJ
         lwNA==
X-Gm-Message-State: AAQBX9ePiwJUmrVEc0xF9o6VWepUW12aJSSdN913jh1gWi7DkfCBn9sw
	04WCPaNNxuNut9xzlc7OCA7uKdRKqOo=
X-Google-Smtp-Source: AKy350bM5u//fjb5RFVXGSx+VYfEuKcreUOkX54ZUKcUrEmLXY7FZoMNUBe7v++bo/3rQLchv45YRw==
X-Received: by 2002:a05:6a20:8014:b0:d9:4269:4d23 with SMTP id e20-20020a056a20801400b000d942694d23mr1000230pza.48.1680849712868;
        Thu, 06 Apr 2023 23:41:52 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-220-119.msd.spmode.ne.jp. [49.98.220.119])
        by smtp.gmail.com with ESMTPSA id k14-20020aa790ce000000b005abc0d426c4sm2309806pfk.54.2023.04.06.23.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 23:41:52 -0700 (PDT)
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
Subject: [PATCH v4 6/8] mtd: spi-nor: spansion: Rework cypress_nor_quad_enable_volatile() for multi-chip device support
Date: Fri,  7 Apr 2023 15:41:02 +0900
Message-Id: <1b5606dbcc11b3432c306a75880f05c68e927fb9.1680849425.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680849425.git.Takahiro.Kuwano@infineon.com>
References: <cover.1680849425.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_234154_909354_AD93CEA5 
X-CRM114-Status: GOOD (  15.90  )
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
