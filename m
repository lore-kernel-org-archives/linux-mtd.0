Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D9EC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 07:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zDSIA1O+Zo/GKNLSmqgigsPHGWYRP0xlERF0Q4jELJg=; b=IUFr0UHohhRbMy
	3jVklRKtFlTs2yUP6TlaFD59JmhumqmqOaTcaEuH1LWMXCd6KJtTbsJybsfslzJtHdxZ2ElSDILzd
	tjZtYTKz5+KJk5nSdFP5soDdZxHz6ZhwaFABVsl6XOFozAdea62PRZqkyehJD6tpAXwoksPeVe+P9
	HccYdU4lcG3P70DQSx1D9soe52fBzOAhM1mqqCNTN7uw9x3X+GwxJnZogNF3x/Me4z9EiAOvrXxOw
	1zAx58KRUT1MqJl0UOvoJGqMYRlC/E7v967EqABkL6RBg/Wo/e9yfxIpd71NL8nNrUzrU1Vd+jht3
	pTwl9RtLURLuyhdFW2Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM2vx-003x1x-4f; Mon, 21 Feb 2022 07:16:33 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM2vc-003wzb-6l
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 07:16:13 +0000
Received: by mail-pf1-x42b.google.com with SMTP id u16so7978147pfg.12
 for <linux-mtd@lists.infradead.org>; Sun, 20 Feb 2022 23:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iNyfq/npW+LrJv/yrj4bCL4CxfFGt8USX8Tk8fgWrTg=;
 b=AIcbxyU432nv8yTg9ecsD+NLqKYzLHt70e8XHyNm2xGv0vDkhinLRT85c8jMTEQddT
 IM7sqHQ4h3b8CL985dL4eo3za9lP+94yYaFK/0BY9XlXQP/HBA09ugDqvos7HQu1BAmQ
 Pa0D+p69kMw8yOuCuFZPf3ccADA4WXc+MJC/jIOZJb3a5nVfcjfIqc52DhZxf0APKpYF
 4A8NbsNdr9B/Tk3niKA7XCTDb8QxEPqs+MK8rn9Dsf8FTzC0kKMTr9521m8484vEJnvL
 pMUQWudt/RUvCmPUgnn3IGoGYM9UaPqqR9Bj+PfBQd20SrOxdk6ggN9SPwGwPNl50B5j
 0Q7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iNyfq/npW+LrJv/yrj4bCL4CxfFGt8USX8Tk8fgWrTg=;
 b=hyd5uTqlQlX/+4sT3C86/S4UgYYQeIymP9MVjelIdcGyMWEqgkUh9e22PZzI9f+oFu
 1seXd6VPod7MsG2dPguSpvSnTmLrign6LGj28e8aa0/byqqm9W2YBbvRq+7qsdSJ9GBL
 U1vzfPr4gOjgbfXW9nV/1uEpJZ9oD6/PPFOPi+1r2JBq8RegvM4+giPv+qWM/VmUoXEu
 j0rgkoQxTL7zuSJroJEieJtYbyFcJZDxnGWqw/GnEFo6scWhqyy7ErjhlJACHl/1C9wP
 XvzPqPDbK2mfXBVvZGf2CYk+1qZTfDO5w8JiXzOpRUAhpx6xwDaDZhKW3E1PIzHzd0kw
 g/QQ==
X-Gm-Message-State: AOAM5315SPmyTW6Pfj92cCbbfgKKdXq6rchSq+IadFa4U6LNL/AKXp6M
 ydTTaB00vvZfLQuRa6S/qbPOjW+840U=
X-Google-Smtp-Source: ABdhPJyabBsiKrvZnW/jq7uyerFm5nnhFroGZzLpDCeE6CuZ2ZbMHdZaQVQiRJl0RZ8Je2pfozM7Hg==
X-Received: by 2002:aa7:9dde:0:b0:4e0:5125:a72d with SMTP id
 g30-20020aa79dde000000b004e05125a72dmr18852764pfq.83.1645427771112; 
 Sun, 20 Feb 2022 23:16:11 -0800 (PST)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id f16sm12323326pfa.147.2022.02.20.23.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 23:16:10 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v8 2/3] mtd: spi-nor: spansion: Add support for volatile QE bit
Date: Mon, 21 Feb 2022 16:14:11 +0900
Message-Id: <dc30b0262fa977a3e87a2244d6bb3710e76b78fb.1645426789.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645426789.git.Takahiro.Kuwano@infineon.com>
References: <cover.1645426789.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_231612_279577_B3A27CCC 
X-CRM114-Status: GOOD (  17.08  )
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
---
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

 drivers/mtd/spi-nor/spansion.c | 61 ++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 9040edf7359f..5453b89a1c22 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -10,6 +10,8 @@
 
 #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
 #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
+#define SPINOR_REG_CYPRESS_CFR1V		0x00800002
+#define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN	BIT(1)	/* Quad Enable */
 #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
 #define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24	0xb
 #define SPINOR_REG_CYPRESS_CFR3V		0x00800004
@@ -105,6 +107,65 @@ static int spi_nor_cypress_octal_dtr_dis(struct spi_nor *nor)
 	return 0;
 }
 
+/**
+ * spansion_quad_enable_volatile() - enable Quad I/O mode in volatile register.
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
+static int spansion_quad_enable_volatile(struct spi_nor *nor, u8 reg_dummy)
+{
+	struct spi_mem_op op;
+	u32 reg_addr = SPINOR_REG_CYPRESS_CFR1V;
+	u8 cfr1v_written;
+	int ret;
+
+	op = (struct spi_mem_op)
+		SPI_NOR_SPANSION_RD_ANY_REG_OP(nor->addr_width, reg_addr,
+					       reg_dummy, 1, nor->bouncebuf);
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
+		SPI_NOR_SPANSION_WR_ANY_REG_OP(nor->addr_width, reg_addr,
+					       1, nor->bouncebuf);
+	ret = spi_nor_write_reg(nor, &op, SNOR_PROTO_1_1_1);
+	if (ret)
+		return ret;
+
+	cfr1v_written = nor->bouncebuf[0];
+
+	/* Read back and check it. */
+	op = (struct spi_mem_op)
+		SPI_NOR_SPANSION_RD_ANY_REG_OP(nor->addr_width, reg_addr,
+					       reg_dummy, 1, nor->bouncebuf);
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
  * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
  * @nor:		pointer to a 'struct spi_nor'
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
