Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90122C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 05:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zJQR2NYiYx05XV9/lySNQ2zBX6kbL5u53Kds4YiZLHk=; b=Bfq2Kvub9L+bvf
	qHBAzN8HgsSd8OOY7XG4/IRS8ERzVj6tZTlOK8uJoD4KVkMFYCUlZLUkAjCSU81XKxIQXWN0tykMS
	x4nqH+S84yvfPg3ePq8RJFoGRv8A1q3gz8LMBM4dNXm3WmMEyYqQTCQymmoUf0k2l5poNzdtVUu9F
	mJulKUT53iz+RGq2c4ahHA2CaClUL2bRL9blL0LsUHh7vE+81pfyemcFw0MXI4GMCXb9W/kLRJob5
	bpt5kE+fzxpNLw5gtgl4tvPZu/Qd3tbn65L+Wdi7tup/gxDOmqKirTxNJ3qNQUeDisQ81cvWlQbrA
	p3tpTXAW900AHI7wTdUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndmXK-006jyl-8c; Mon, 11 Apr 2022 05:24:26 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndmX5-006jug-Sb
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 05:24:13 +0000
Received: by mail-pf1-x42f.google.com with SMTP id p25so6882708pfn.13
 for <linux-mtd@lists.infradead.org>; Sun, 10 Apr 2022 22:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EB0vQ0XNRgCW1YkKahpSaNX8vJALs/K5F4HXqNGGxCA=;
 b=TUcVBXRO2m1umo5kcL7qyUJXjkrqpGf6tFWy2HwoHY6rVw2iFZi1zfRy1XwDrYYG2R
 6x81pNty/4/SOynNo4sbsYx4CoCteiLfpqncyKLXUiK1lrTAAxGc2UPB/9JQkkvdwbNI
 o0IWhaOytBkTnO3Fg0MAzA2j7wwQEdxIdM+TTHnCI+2OxwEYy4+bLyCIdto63yTL0gDn
 dXCpPfSRowm96F6C/czjcsbKEC8DStGxdZLOvkF26/Z+VtUSzFzT1KdAm/quuNQOXDH9
 gdHbFSNUe9KEO80FkKGv1hjZG6nfQzEHuhdjHbABUdMpwXE40cDKzA1vxjtgRGCCo/Bl
 Y/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EB0vQ0XNRgCW1YkKahpSaNX8vJALs/K5F4HXqNGGxCA=;
 b=JR/i6SFYyNHB35GYLksbT/WmXfFcRyMVo2WvwMEtwFDaGVE9kX+/Gn8HBmdlDw5dzG
 ugMyaXhn/nhM+gF7Sm5hlMjdSEMgk3OAO8JcV1wNqTNBIxXRWdfFd3WCJDbmCFMnGo1E
 Y519WANkKlvigb3P4ecNXhjlQs3bxQBnMbglP0stFvyHinkp6SCv+5mjKkykyzk5XVXJ
 OQh0t0Bfs4CG8q52UNHf/IIgF1ZBMVewbZ586KrQ9ZNlZGueHRMN6L7YI5cijww+kS1R
 +FjW373lu2qMWJ3cZfAE8YCDJ6+qpOaI1zCDRLTtSS4FNZ+NdqX/hWHyqvb4hp/yYeyp
 L89w==
X-Gm-Message-State: AOAM532iAyMu52EHPptciETvl/58VX/DBnUeki9DvMkn8tvQS4rdVF+U
 DOPagaC7vO7/kTrL4ZYEDnKZFd16tmI=
X-Google-Smtp-Source: ABdhPJwEhPQXH5OV4Hi/FzkCLsQ/TF+dW/SNRHyvHLNhF2CcC4K9fi8Azc6CPBGvxosBBVnQVIZkxA==
X-Received: by 2002:a05:6a00:10c2:b0:4fd:a140:d5a9 with SMTP id
 d2-20020a056a0010c200b004fda140d5a9mr31116305pfu.77.1649654649914; 
 Sun, 10 Apr 2022 22:24:09 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77]) by smtp.gmail.com with ESMTPSA id
 ne24-20020a17090b375800b001cb62235013sm6064261pjb.5.2022.04.10.22.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 22:24:09 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v10 2/4] mtd: spi-nor: spansion: Add support for volatile QE
 bit
Date: Mon, 11 Apr 2022 14:23:23 +0900
Message-Id: <8669d17c7dad0abed63e9f057ce3cfa6105de3c7.1649641729.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649641729.git.Takahiro.Kuwano@infineon.com>
References: <cover.1649641729.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_222411_970763_C9D300EE 
X-CRM114-Status: GOOD (  16.49  )
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

 drivers/mtd/spi-nor/spansion.c | 70 ++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index f24e546e04a5..b073a7fe8e15 100644
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
@@ -23,6 +25,74 @@
 #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	0
 #define SPINOR_OP_CYPRESS_RD_FAST		0xee
 
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
+	u8 *buf = nor->bouncebuf;
+	u8 cfr1v_written;
+	int ret;
+
+	op = (struct spi_mem_op)
+		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RD_ANY_REG, 1),
+			   SPI_MEM_OP_ADDR(3, SPINOR_REG_CYPRESS_CFR1V, 1),
+			   SPI_MEM_OP_NO_DUMMY,
+			   SPI_MEM_OP_DATA_IN(1, buf, 1));
+	ret = spi_mem_exec_op(nor->spimem, &op);
+	if (ret)
+		return ret;
+
+	if (buf[0] & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
+		return 0;
+
+	/* Update the Quad Enable bit. */
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
+	buf[0] |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
+	op = (struct spi_mem_op)
+		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 1),
+				SPI_MEM_OP_ADDR(3, SPINOR_REG_CYPRESS_CFR1V, 1),
+				SPI_MEM_OP_NO_DUMMY,
+				SPI_MEM_OP_DATA_OUT(1, buf, 1));
+	ret = spi_mem_exec_op(nor->spimem, &op);
+	if (ret)
+		return ret;
+
+	cfr1v_written = buf[0];
+
+	/* Read back and check it. */
+	op = (struct spi_mem_op)
+		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RD_ANY_REG, 1),
+			   SPI_MEM_OP_ADDR(3, SPINOR_REG_CYPRESS_CFR1V, 1),
+			   SPI_MEM_OP_NO_DUMMY,
+			   SPI_MEM_OP_DATA_IN(1, buf, 1));
+	ret = spi_mem_exec_op(nor->spimem, &op);
+	if (ret)
+		return ret;
+
+	if (buf[0] != cfr1v_written) {
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
