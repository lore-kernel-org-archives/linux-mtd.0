Return-Path: <SRS0=DZ8H=ML=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B13C9C636C9
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jul 2021 08:05:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B52760FE4
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jul 2021 08:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B52760FE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sW/icPK/bxtXbEHZ5tZwf6yhgQL/exkFCLOVrBIrTIs=; b=EJqXwMM7wcZ/Le
	LczGufqVNeZ1bxRpn3B1k7LuB9/3B07r019ewVEtY0LGX8jp/+Y8zDAjFlz5OD0lBwKyJ21+GIerw
	dyXmRAK3bVuCK7JEJszUfZyTiXNYzL8QXAWSAid4fkjrRNWY6UyPIf6Gu1FwZqCNhv4FYfXQQU4tt
	fH6BGZ002N4mHGrgESyP4QxVZafEbzDBt1lITU6JBdMpENtZis8RodZ4Ohk6Z2gCpxwCBoeKmy+as
	+L1QqSEsX/bko1Q89BRe8exPc+5j5NQ4731sQuzS0Oo2L0qVoqXYzHZj7ND4tcxNW/U6ba8n9dzql
	yul/vwFGz/S1n3uEhLbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5OGv-008jG7-UY; Mon, 19 Jul 2021 08:05:06 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5OG6-008iwP-S9
 for linux-mtd@lists.infradead.org; Mon, 19 Jul 2021 08:04:16 +0000
Received: by mail-ot1-x32a.google.com with SMTP id
 i12-20020a05683033ecb02903346fa0f74dso17352259otu.10
 for <linux-mtd@lists.infradead.org>; Mon, 19 Jul 2021 01:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9KVSsECmUprH0Tnnhqc+7V64FcU74zgk57Z5efD23Pg=;
 b=e1y7nfHM2xIWJWiQXZK8fH6nDguMhlZAvawkPs2FLWb5FwTWt0eYVTskKmRsh8wd44
 LLnLohP5TKZxN7fvq2OKgPr5qoe6XAyyqp3nTyKwVxbugjQS+T0LG8HY9zWrID6AMkkj
 Wkxkbs680kXGzEVBPlDmhgfKTsU7Z8cFoNmZg4VcwJLxw8WgjXdi39LN9rtGEp5TWg7l
 7UIE31xePbN52WQTsjqL3TMvWVg+mBSqfdOn7Zl7PDx6ODDgM/lrhwiwEM2fGyeNpK4M
 ZfEQtO07wxps2ZSfE7y01VOoCigHnS7kB6oYb1+4AdfezRE+lqmfTXLaZ3jDHK/l5CCk
 YWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9KVSsECmUprH0Tnnhqc+7V64FcU74zgk57Z5efD23Pg=;
 b=Zp+VUYTY3yvv6M7fk9RwWLZNILCeB86Nd+OVtIKSR1wpXbNiP+Xnzjf5i2IlkTNo9m
 T82i+ZScIaQ+aih3pNcsWQh+tDEq0Lwe1MnA3RLwgXS2DrteTD6RuRk+oovaX/ICmg55
 z0KUJ2htRo/LaJjJsvImTr0ROYQSZpjlFJowUBm+H0FMivOr3kQ2cGqEpLBbKoQz+3Z8
 wkaUtDDjxUErmx76v7x5GOorYkvyoZaLPZHYXd66WbHpGdbs27e0qJORhECdQpVQEsgT
 BbyHjRFl2pCYGApHgX0E6+2mwfCH9iWezCvlKCHYXdYB3yYWGbgk9lKw5+GQyUCNjKsK
 dhUQ==
X-Gm-Message-State: AOAM531xjG9QodnKuSAjrC0NSg+yoeYz/PkxTCn511NSBFw1MdioXJwy
 vDxm1bGceokNQ5uxquHUu5Ya76elsGQ=
X-Google-Smtp-Source: ABdhPJyWyusA0TpSqbhumtRw7MLMW8lNvz5MskYR0cWWq4DC4Hgl1LcvyXOtVfdqybOP6sKwzvU5mA==
X-Received: by 2002:a9d:6453:: with SMTP id m19mr17876097otl.63.1626681853084; 
 Mon, 19 Jul 2021 01:04:13 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id w24sm3533935otp.28.2021.07.19.01.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 01:04:12 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v7 2/3] mtd: spi-nor: spansion: Add support for volatile QE bit
Date: Mon, 19 Jul 2021 17:03:46 +0900
Message-Id: <26f6a4d7e1d3c4dfdf7bf161a72f140c3364a3da.1626677855.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626677855.git.Takahiro.Kuwano@infineon.com>
References: <cover.1626677855.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_010415_005654_DCFBB71D 
X-CRM114-Status: GOOD (  17.45  )
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

Some of Spansion/Cypress chips support volatile version of configuration
registers and it is recommended to update volatile registers in the field
application due to a risk of the non-volatile registers corruption by
power interrupt.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
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
index 5e7e62704e11..ca50e77b4220 100644
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
@@ -161,6 +163,63 @@ static int spansion_write_any_reg(struct spi_nor *nor, u32 reg_addr,
 					    reg_val);
 }
 
+/**
+ * spansion_quad_enable_volatile() - enable Quad I/O mode in volatile register.
+ * @nor:	pointer to a 'struct spi_nor'
+ * @reg_dummy:	number of dummy cycles for register read
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
+	u32 reg_addr = SPINOR_REG_CYPRESS_CFR1V;
+	u8 cfr1v, cfr1v_written;
+	int ret;
+
+	ret = spansion_read_any_reg(nor, reg_addr, nor->addr_width, reg_dummy,
+				    &cfr1v);
+	if (ret)
+		return ret;
+
+	if (cfr1v & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
+		return 0;
+
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
+	/* Update the Quad Enable bit. */
+	cfr1v |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
+
+	ret = spansion_write_any_reg(nor, reg_addr, nor->addr_width, cfr1v);
+
+	if (ret)
+		return ret;
+
+	cfr1v_written = cfr1v;
+
+	/* Read back and check it. */
+	ret = spansion_read_any_reg(nor, reg_addr, nor->addr_width, reg_dummy,
+				    &cfr1v);
+	if (ret)
+		return ret;
+
+	if (cfr1v != cfr1v_written) {
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
