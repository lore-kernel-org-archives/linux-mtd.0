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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4191C12002
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jul 2021 08:05:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CEB560FE4
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jul 2021 08:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CEB560FE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6H2cnWIaqZVPgaThHUe+8Q3zjh1teZrcRj3dV8TJWGw=; b=lJsRVFfozUrMvq
	6k6em+Aeu922g2SFyaWI0c1YBwIjPRTUNW0XVocuyqI5wWm9jW+wrg3b2vIK/YZcs3QZZMjRkvk3s
	3hS22KxS6qcXfhvKKRvx9ys/S5YiHN/yChBrnJqPhZPI4u0YqCh350DOAt0G+E6PuVvPM0xvYAqJf
	q4dpxdc000xQimOqlb4Ir7P1FH2TnaHc/9Q8EwP9bwK3FTBDrl6P3zvwYFmrE42OptSeh1lb81Yc0
	aCo5aH1UnuOtRd+376i1Q2mLr1dza507T7fLUUqQbguId4wMUSmfqYLuzwjDb1j8WkUtVy+ibfT3C
	E6q/QQW+8US2HdZ5H4oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5OGe-008j9z-TH; Mon, 19 Jul 2021 08:04:48 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5OG4-008ivB-J7
 for linux-mtd@lists.infradead.org; Mon, 19 Jul 2021 08:04:14 +0000
Received: by mail-oi1-x22b.google.com with SMTP id s23so4115348oiw.12
 for <linux-mtd@lists.infradead.org>; Mon, 19 Jul 2021 01:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eE4U09yJSrDNbK89cW/aBKrRHaSK6EJkBMRvL3HB9tg=;
 b=BY1cf/SWOodmkT5V1CC9+XNmI5GvWBr2h/E9ok9OxNBuOYF7JjG/UYXzknHdjtQB99
 rZInxkqaAUiUC6KYnPBj2VQViVb7DCOAOcZEgHwIWCv4jecZ2jtjgE6wJlCKHgbSBY4x
 +q+Lbh6UVNwkS3KhAb++GFVGKKtAykU0Fje4hFyu+IV+vBEUXxm57rRK1bAYBuD3RlXJ
 CzfID2+Ib3lHypzUReKqgqY+AVWQdE/CCcG9OYA5uQi6DJW4lSuEwgwyW25RPB/uJq6f
 8FONIAk01RdS7JE+rHiVlkgI2qB3P9WLoiflsHmxrFhqEvreYlNtBMDexPgcbsyj/UZw
 fjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eE4U09yJSrDNbK89cW/aBKrRHaSK6EJkBMRvL3HB9tg=;
 b=c6mEScyE77VQsZtI4jWuIQ3l6xwrp5Yi5SyMh/Fe51B0nVdkOiAY5jjgAzfiTotaEu
 DCQ4iWxtBzFVm2IIp1xU2dPdYckSDvALA0JEN8WmvSiA2Zt8GnHQwzspai9hGCNgxd1x
 5QR1tLgjY96xKCLoIObD5uZVBjVmubNJxO+VVmpTYS4kvUMDbhwHjSygNn7TNEBEHpzG
 Ub2wA3TYbHP7L7f8MpvbRcQUo6tRjzexeEQ2IT7i6DRWj45lqw+YbK3U5AFjfHyaXsrv
 PWBeNxDd05b6phBv6YhZ7qCIxUIDJgySuWGkMdacuQMIjCTRCxrz1HVXjvlFP8MHkIZl
 vqzA==
X-Gm-Message-State: AOAM533tzFWEoPz4wQE7csLSsxFgghBcJHhIRNEiEkRRME+T5lH8Ji5h
 PPnhUw6/jvbLrJUI6hsskiKnqTWMKAM=
X-Google-Smtp-Source: ABdhPJwbDb00b/shFoJP5tQCcU5h+8DQ7wWyPOs/SWEdlipqUevec40UYoTcaBmWrslGwy54dvliWg==
X-Received: by 2002:a05:6808:14a:: with SMTP id
 h10mr14850004oie.17.1626681850883; 
 Mon, 19 Jul 2021 01:04:10 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id w24sm3533935otp.28.2021.07.19.01.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 01:04:10 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v7 1/3] mtd: spi-nor: spansion: Add support for Read/Write Any
 Register
Date: Mon, 19 Jul 2021 17:03:45 +0900
Message-Id: <07db2e3c5647d409941261d6fbeed81215dca16f.1626677855.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626677855.git.Takahiro.Kuwano@infineon.com>
References: <cover.1626677855.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_010412_686973_2FBAEF82 
X-CRM114-Status: GOOD (  17.98  )
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

Some of Spansion/Cypress chips support Read/Write Any Register commands.
These commands are mainly used to write volatile registers.

The Read Any Register instruction (65h) is followed by register address
and dummy cycles, then the selected register byte is returned.

The Write Any Register instruction (71h) is followed by register address
and register byte to write.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
Changes in v7:
  - No change

Changes in v6:
  - Add helper functions for controller_ops
  - Add 'reg_addr_width' parameter to spansion_read/write_any_reg()
  - Remove spi_nor_write_enable() from spansion_write_any_reg() and modified
    function header comment

Changes in v5:
  - Fix 'if (ret == 1)' to 'if (ret < 0)' in spansion_read_any_reg()

Changes in v4:
  - Fix dummy cycle calculation in spansion_read_any_reg()
  - Modify comment for spansion_write_any_reg()
  
Changes in v3:
  - Cleanup implementation

 drivers/mtd/spi-nor/spansion.c | 142 +++++++++++++++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index ee82dcd75310..5e7e62704e11 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -19,6 +19,148 @@
 #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	0
 #define SPINOR_OP_CYPRESS_RD_FAST		0xee
 
+/**
+ * controller_ops_read_any_reg() - Read Any Register using controller_ops.
+ * @nor:		pointer to a 'struct spi_nor'
+ * @reg_addr:		register address
+ * @reg_addr_width:	number of address bytes
+ * @reg_dummy:		number of dummy cycles for register read
+ * @reg_val:		pointer to a buffer where the register value is copied
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int controller_ops_read_any_reg(struct spi_nor *nor, u32 reg_addr,
+				       u8 reg_addr_width, u8 reg_dummy,
+				       u8 *reg_val)
+{
+	ssize_t ret;
+	enum spi_nor_protocol proto = nor->read_proto;
+	u8 opcode = nor->read_opcode;
+	u8 dummy = nor->read_dummy;
+	u8 addr_width = nor->addr_width;
+
+	nor->read_opcode = SPINOR_OP_RD_ANY_REG;
+	nor->read_dummy = reg_dummy;
+	nor->read_proto = nor->reg_proto;
+	nor->addr_width = reg_addr_width;
+
+	ret = nor->controller_ops->read(nor, reg_addr, 1, reg_val);
+
+	nor->read_opcode = opcode;
+	nor->read_dummy = dummy;
+	nor->read_proto = proto;
+	nor->addr_width = addr_width;
+
+	if (ret < 0)
+		return ret;
+	if (ret != 1)
+		return -EIO;
+
+	return 0;
+}
+
+/**
+ * controller_ops_write_any_reg() - Write Any Register using controller_ops.
+ * @nor:		pointer to a 'struct spi_nor'
+ * @reg_addr:		register address
+ * @reg_addr_width:	number of address bytes
+ * @reg_val:		register value to be written
+ * *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int controller_ops_write_any_reg(struct spi_nor *nor, u32 reg_addr,
+					u8 reg_addr_width, u8 reg_val)
+{
+	ssize_t ret;
+	enum spi_nor_protocol proto = nor->write_proto;
+	u8 opcode = nor->program_opcode;
+	u8 addr_width = nor->addr_width;
+
+	nor->program_opcode = SPINOR_OP_WR_ANY_REG;
+	nor->write_proto = nor->reg_proto;
+	nor->addr_width = reg_addr_width;
+
+	ret = nor->controller_ops->write(nor, reg_addr, 1, &reg_val);
+
+	nor->program_opcode = opcode;
+	nor->write_proto = proto;
+	nor->addr_width = addr_width;
+
+	if (ret < 0)
+		return ret;
+	if (ret != 1)
+		return -EIO;
+
+	return 0;
+}
+
+/**
+ * spansion_read_any_reg() - Read Any Register.
+ * @nor:		pointer to a 'struct spi_nor'
+ * @reg_addr:		register address
+ * @reg_addr_width:	number of address bytes
+ * @reg_dummy:		number of dummy cycles for register read
+ * @reg_val:		pointer to a buffer where the register value is copied
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spansion_read_any_reg(struct spi_nor *nor, u32 reg_addr,
+				 u8 reg_addr_width, u8 reg_dummy, u8 *reg_val)
+{
+	if (nor->spimem) {
+		struct spi_mem_op op =
+			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RD_ANY_REG, 0),
+				   SPI_MEM_OP_ADDR(reg_addr_width, reg_addr, 0),
+				   SPI_MEM_OP_DUMMY(reg_dummy, 0),
+				   SPI_MEM_OP_DATA_IN(1, reg_val, 0));
+
+		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+
+		/* convert the dummy cycles to the number of bytes */
+		op.dummy.nbytes = (reg_dummy * op.dummy.buswidth) / 8;
+		if (spi_nor_protocol_is_dtr(nor->reg_proto))
+			op.dummy.nbytes *= 2;
+
+		return spi_mem_exec_op(nor->spimem, &op);
+	}
+
+	return controller_ops_read_any_reg(nor, reg_addr, reg_addr_width,
+					   reg_dummy, reg_val);
+}
+
+/**
+ * spansion_write_any_reg() - Write Any Register.
+ * @nor:		pointer to a 'struct spi_nor'
+ * @reg_addr:		register address
+ * @reg_addr_width:	number of address bytes
+ * @reg_val:		register value to be written
+ *
+ * spi_nor_write_enable() and spi_nor_write_disable() need to be called before
+ * and after this function. Caller also need to poll status for non-volatile
+ * register. No need to poll status for volatile registers since volatile
+ * register write will be effective immediately after the operation.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spansion_write_any_reg(struct spi_nor *nor, u32 reg_addr,
+				  u8 reg_addr_width, u8 reg_val)
+{
+	if (nor->spimem) {
+		struct spi_mem_op op =
+			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 0),
+				   SPI_MEM_OP_ADDR(reg_addr_width, reg_addr, 0),
+				   SPI_MEM_OP_NO_DUMMY,
+				   SPI_MEM_OP_DATA_OUT(1, &reg_val, 0));
+
+		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+
+		return spi_mem_exec_op(nor->spimem, &op);
+	}
+
+	return controller_ops_write_any_reg(nor, reg_addr, reg_addr_width,
+					    reg_val);
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
