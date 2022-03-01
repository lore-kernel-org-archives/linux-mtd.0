Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211DCC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 05:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GGlQLoOoFwTxGGTTvhyL2xZvamTha6BrMztGCYyAgSY=; b=Zq1MFF7DjuxbJg
	A/PyctY+hBwWcVvCZzoTKDJOtdEuldjKjlMIRAQNk1I7fFqtbuC1G01Rfxqid355lFR7Zz11oiBy2
	ZfEAO2OsJJT5S23alUABo+HPP7HyRjYAzRiA6GjQZxAInlbLffg+HMQChWW1hJcmNOULzmQznZEB4
	UqLeIYpLxjCtUvx9mlAuaLjyr5R6QvytmED5/r2R+7IVAonAPPfAzjLTMvIPFXLTl3oslT8kNW3s/
	WeFpFlRZ4BW/UcshmvHa+mFYVaIPIoLHk36pIH0YqL6ukGl+dqJt4JU6dla3w7kf8DYR75PesgfQ8
	wHC73Y8sU7wBC0+qcWAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOuyJ-00EyXi-14; Tue, 01 Mar 2022 05:22:51 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOuxy-00EyUg-1M
 for linux-mtd@lists.infradead.org; Tue, 01 Mar 2022 05:22:31 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 v5-20020a17090ac90500b001bc40b548f9so1159009pjt.0
 for <linux-mtd@lists.infradead.org>; Mon, 28 Feb 2022 21:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FY2HM0KbbfXH+G7dSMt9VX6sZGZpySbCyLPTYA5ZFk0=;
 b=bElTtF/WXeNh84kpZNhV8S9y2CY8EUdHAmCjWaEgAA7nx7+pkE1gxppp4umzCXoTX0
 IN6k0cS2pHfp0xsipIy5rWjdaa43L2aZZtj9LwTNOda4EQEc6iPeWl1LEHB0WYwwX0di
 iFR9vughy/LCw36tQPFDOrAO/uCHscGvNPSMsIUBuqpa+P37yjZTYolfPevwSBB/jj5r
 70INsa/bVvgvyzlBb5p1OCtewP65b5vwPmvfft4w302jrVi93+fPFJ/BFbA1fe/tqT0t
 qXrDFkXGn1gAd8n15KuOPSfXwKG7JRxrtLF3ECcAd2AKtgUOqf2nUei2B8LBela23ioL
 aCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FY2HM0KbbfXH+G7dSMt9VX6sZGZpySbCyLPTYA5ZFk0=;
 b=lKge7u9tSEQGKaFokA8L77ufiK4J+VO6uOtLhcUSw5MZHzVmydWgWqyvGyg7KhE7bS
 Tf/4R26wXdGxImnDkc55CT0IxgdX7dPc3YMb4DdqfAZGWbiBovlzuen+rKXM94Ou0MU6
 fijgucampSWHGAPkQ19xqfoa1z9Ld2JU3ce7N/9ij3lTH8+k6FPfwAi96EeXhTRfcoEk
 hEuRUxk/DFeAulR0KeDHKqGztAshX2zLy6nDdU/FIG2y8wNICDuCduyndeltLmCF9zCZ
 zdle6DkhrCD1HCcUryayBnFs59OTIW+QSq+TQS2gRKTfeXQKrDskLIr7nXBHZWT770hc
 vI6g==
X-Gm-Message-State: AOAM533Mq3jMFhflXc5OPLFWseUrSVowdPvzgWnkCf+Qd7LKpst1D3FA
 wvoGsJhkpIzYyQXKY3Nx8gPmh4WQ39Y=
X-Google-Smtp-Source: ABdhPJyj4J/iHw02gNTQYRt4FEukKc/EvU9jhipoSSeWM2HIgVaNeOc9ZQLXKXtYWB9qZvFtRbk7Qw==
X-Received: by 2002:a17:902:f254:b0:151:5e24:960 with SMTP id
 j20-20020a170902f25400b001515e240960mr10629475plc.79.1646112148952; 
 Mon, 28 Feb 2022 21:22:28 -0800 (PST)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77]) by smtp.gmail.com with ESMTPSA id
 63-20020a630942000000b00372a99c1821sm11433111pgj.21.2022.02.28.21.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 21:22:28 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v9 2/3] mtd: spi-nor: spansion: Add support for volatile QE bit
Date: Tue,  1 Mar 2022 14:21:54 +0900
Message-Id: <e3b9a819eb93db6114c220bdf3a08fc53d74b3d9.1646109817.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646109817.git.Takahiro.Kuwano@infineon.com>
References: <cover.1646109817.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_212230_112879_E2199E85 
X-CRM114-Status: GOOD (  17.43  )
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
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
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

 drivers/mtd/spi-nor/spansion.c | 62 ++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index ba0f79bfe859..db027cb92cf5 100644
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
@@ -106,6 +108,66 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
 	return 0;
 }
 
+/**
+ * cypress_nor_quad_enable_volatile() - enable Quad I/O mode in volatile
+ *                                      register.
+ * @nor:	pointer to a 'struct spi_nor'
+ * @reg_dummy:	number of dummy bytes for register read
+ *
+ * It is recommended to update volatile registers in the field application due
+ * to a risk of the non-volatile registers corruption by power interrupt. This
+ * function sets Quad Enable bit in CFR1 volatile. If users set the Quad Enable
+ * bit in the CFR1 non-volatile in advance (typically by a Flash programmer
+ * before mounting Flash on PCB), the Quad Enable bit in the CFR1 volatile is
+ * also set during Flash power-up. This function supports multi-die package
+ * parts that require to set the Quad Enable bit in each die.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int cypress_nor_quad_enable_volatile(struct spi_nor *nor, u8 reg_dummy)
+{
+	struct spi_mem_op op;
+	u32 reg_addr = SPINOR_REG_CYPRESS_CFR1V;
+	u8 cfr1v_written;
+	int ret;
+
+	op = (struct spi_mem_op)
+		CYPRESS_NOR_RD_ANY_REG_OP(nor->addr_width, reg_addr, reg_dummy,
+					  1, nor->bouncebuf);
+	ret = spi_nor_read_reg(nor, &op, SNOR_PROTO_1_1_1);
+	if (ret)
+		return ret;
+
+	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
+		return 0;
+
+	/* Update the Quad Enable bit. */
+	nor->bouncebuf[0] |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
+	op = (struct spi_mem_op)
+		CYPRESS_NOR_WR_ANY_REG_OP(nor->addr_width, reg_addr, 1,
+					  nor->bouncebuf);
+	ret = spi_nor_write_reg(nor, &op, SNOR_PROTO_1_1_1);
+	if (ret)
+		return ret;
+
+	cfr1v_written = nor->bouncebuf[0];
+
+	/* Read back and check it. */
+	op = (struct spi_mem_op)
+		CYPRESS_NOR_RD_ANY_REG_OP(nor->addr_width, reg_addr, reg_dummy,
+					  1, nor->bouncebuf);
+	ret = spi_nor_read_reg(nor, &op, SNOR_PROTO_1_1_1);
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
