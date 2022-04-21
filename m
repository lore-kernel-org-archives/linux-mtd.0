Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7132C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 09:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xclYYwYmEBOuV2cRkriUP2fm4OVeOwLPPuKis71MOxc=; b=a5Jw1CZlvtpCaL
	nKOPMEddbtcCIIOKrOqoXUdiWm6RoLTh0oI8Cfaox0wWTlpa1rmyC5k95lXDtbnvfTGZHDyOQZ+bt
	/pq1lKtod2J5lecBaA0V0ctdPeF/tOQ/66YEpTT2jKUPwY388y8Zojnqk/nntCljXgNZdB8pODM+w
	NSoRRgf1eNW0FmwIOPMBm/Wf2iyq3xU6SE7PYlAKsVjYlDaRvaelsjcYuhxD/fJmMEQ+60Lwy2Y9p
	8e2XFy84/IsXXrSglzU0YLBOFj25cudUmYFP1IlyCdSNi7Qy8X/hf1UgRglx+2LOLBDOP2qgGHNv+
	Xdey4a3jkkoXSvc9WlVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhTJ0-00Cokb-DF; Thu, 21 Apr 2022 09:40:54 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhTIq-00Cofq-PE
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 09:40:47 +0000
Received: by mail-pf1-x434.google.com with SMTP id j17so4498695pfi.9
 for <linux-mtd@lists.infradead.org>; Thu, 21 Apr 2022 02:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y9trfA71sOmeedqs01QBYCEfyuupVDSePtWt9h3Fc28=;
 b=EDUrjOT7zDUT39u+V3zBpKTpAe+K3AF8DR81/UXJkMpjmnzwPyParNQpHppE6ppUQS
 wWXmUFdCMXtP/gYl93wreGq8m+klP+3SjYbodIo7PSlPz0eQI5mJsxrXewk7AIVQZYxb
 RlXfMRSNiA7D07Rt8w8Nxg8cz3uAREJiCcXEvxoM+h00EordfqZrbzMjBrrKdlSBDprC
 BAG4yoZq/Xi93b8dKvAi730GepeewAyum9ML31qsSh9S+07GFCk21AqR6C/EPtxH1tbc
 sEmff7+dVsGKkS+LnCNCF74zx9h+U4XqsfClV2ATgH9idgmXonO6MLwgeE9xWY4OUNwO
 rLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y9trfA71sOmeedqs01QBYCEfyuupVDSePtWt9h3Fc28=;
 b=io+r8FvhXFWqBnOKN7E8F3rDBgG5uDK039rd7NJWG+rZZHgAeerwfhGf0Oz9EJcNzB
 h/sJbV5q7XuGB0a3tt+URMcrAtChT3KYE7FJSXAaCcZ4x6F3dQtXCJWF4mb0cEgE3u8m
 0+fpdh832gosa3zpVRvpQ9yfgslrkAu+GNo+bozGsvMqcViOrfNlmCQy8k6Gg6M33GTe
 bsvqN8cwLgbCYkYHrIx45LyPUyFgvSDWVRrucLG2EB08MXeKUVrXFzEDz6xcAxaHpZbR
 PYrhS6L08x/7TZAxAIRdCTxHL2gFOy55J+T5pD24WY/kcYovZTV/wFNb7TcvJide1aXv
 G4wQ==
X-Gm-Message-State: AOAM530lFp7IavsakG2NZsA4bPdsZxGHYcp2T4NaZszIo0UV7OkVO67f
 dwqXpzLBmlKY9r284IHp9sosG/wVEcU=
X-Google-Smtp-Source: ABdhPJwbFFgafCSjWv2Kwf0MBdXAGo/TRX9cgnWZ6ZKMnNjwnKY0cEb1h1oAxfPChhbkDfEivuJdlw==
X-Received: by 2002:a05:6a02:116:b0:39c:c779:b480 with SMTP id
 bg22-20020a056a02011600b0039cc779b480mr22932104pgb.311.1650534043551; 
 Thu, 21 Apr 2022 02:40:43 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77]) by smtp.gmail.com with ESMTPSA id
 k198-20020a633dcf000000b003aa9116ba17sm1503970pga.35.2022.04.21.02.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 02:40:43 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v13 2/4] mtd: spi-nor: spansion: Add support for volatile QE
 bit
Date: Thu, 21 Apr 2022 18:40:22 +0900
Message-Id: <2c04068f34e4dbd25da541062f5309b1d9878c22.1650532121.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650532121.git.Takahiro.Kuwano@infineon.com>
References: <cover.1650532121.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_024044_934160_659A7BF6 
X-CRM114-Status: GOOD (  18.08  )
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

Some of Infineon chips support volatile version of configuration registers
and it is recommended to update volatile registers in the field application
due to a risk of the non-volatile registers corruption by power interrupt.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
Changes in v13:
  - Use 3-byte address width

Changes in v12:
  - Rebase on top of Tudor's series
    https://patchwork.ozlabs.org/project/linux-mtd/list/?series=295933
  - Use macro directly instead of local variable
  - Use nor->reg_proto instead of SNOR_PROTO_1_1_1
    
Changes in v11:
  - Rebase on top of Tudor's series
    https://patchwork.ozlabs.org/project/linux-mtd/list/?series=294490
  
Changes in v10:
  - Remove dependencies on other series
  
Changes in v9:
  - Rename function per mwalle's series
  
Changes in v8:
  - Use spi_nor_read/write_reg() functions
  - Use nor->bouncebuf instead of a variable on stack
  
Changes in v7:
  - Add missing macro definitions in v6
  
Changes in v6:
  - Remove multi die package support

Changes in v5:
  - No change
  
Changes in v4:
  - No change
  
Changes in v3:
  - Add multi-die package parts support

 drivers/mtd/spi-nor/spansion.c | 59 ++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 43cd6cd92537..65ae3ade0b95 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -14,6 +14,8 @@
 #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
 #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
 #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
+#define SPINOR_REG_CYPRESS_CFR1V		0x00800002
+#define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN	BIT(1)	/* Quad Enable */
 #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
 #define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24	0xb
 #define SPINOR_REG_CYPRESS_CFR3V		0x00800004
@@ -113,6 +115,63 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
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
+	struct spi_mem_op op;
+	u8 cfr1v_written;
+	int ret;
+
+	op = (struct spi_mem_op)
+		CYPRESS_NOR_RD_ANY_REG_OP(3, SPINOR_REG_CYPRESS_CFR1V,
+					  nor->bouncebuf);
+	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
+
+	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
+		return 0;
+
+	/* Update the Quad Enable bit. */
+	nor->bouncebuf[0] |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
+	op = (struct spi_mem_op)
+		CYPRESS_NOR_WR_ANY_REG_OP(3, SPINOR_REG_CYPRESS_CFR1V, 1,
+					  nor->bouncebuf);
+	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
+
+	cfr1v_written = nor->bouncebuf[0];
+
+	/* Read back and check it. */
+	op = (struct spi_mem_op)
+		CYPRESS_NOR_RD_ANY_REG_OP(3, SPINOR_REG_CYPRESS_CFR1V,
+					  nor->bouncebuf);
+	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
+
+	if (nor->bouncebuf[0] != cfr1v_written) {
+		dev_err(nor->dev, "CFR1: Read back test failed\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
 /**
  * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
  * @nor:		pointer to a 'struct spi_nor'
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
