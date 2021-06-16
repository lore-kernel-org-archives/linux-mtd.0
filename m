Return-Path: <SRS0=4SWJ=LK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D0CBC48BE5
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jun 2021 08:50:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBD146109D
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jun 2021 08:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBD146109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hBWPQsTRRz6co1ofxXHf52cRoZjN5VfDmpvmtR8k4MQ=; b=WccNHujLderPlj
	4obFYEdAMKALn21MunHsGCqoW2h/N5hdo/YLxmd+cZstKpgmSB2YMmzOlYCJ78AGMc1kGmDgkD6H0
	MpJvcN9Dv0y7G/KHH4t//E7yy20AHQduavakmpIBABTbpa0b64Qw5/XZH9ka2ugBa/wsEKKlm7fgi
	pX82Q4rpvX0NAxURoSpke12v0j6YoS3Fc03xshtGEhl9UTxXZ0WU8VuWxQCDoAKak54lQ7T3GMaae
	040a+eHS6sTFd0Dsy9OW4Y9h9Yw9JDN8WGplQquZQZV37mM9p4O9oTilNTXYcTEnFSNFyOy8qjwRN
	q6bVnAQ8LiPwjRRiG7wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltRF2-005RF2-D6; Wed, 16 Jun 2021 08:49:44 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltREx-005RDf-UF
 for linux-mtd@lists.infradead.org; Wed, 16 Jun 2021 08:49:41 +0000
Received: by mail-oi1-x22e.google.com with SMTP id q10so1762488oij.5
 for <linux-mtd@lists.infradead.org>; Wed, 16 Jun 2021 01:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X0diEJoSxYugEmt4G7PvShB7DLsJUc8rjkUo3x75vjU=;
 b=T29TJRQZE5S048K5mOTiPBr+Z43GyneIHOX+oLImiYzlcnaDcWo8NRJzDDi2i3vST1
 0UflPBQ9Ce4m+ApJTKrw03jK1E7z9WwMDC5QfuivoDXX8WcDj+NhDEsX8nPtH20wfKC/
 mpw8vhPIZJ9Z8r+gHMepbt7dS+MwjRcQKxMvnT9wXUp9Q0TJpXqAFFIgLJukHXKQGVH5
 t8l8YUYvM5rDwXQ2es1HfweEKNPV2wN4TsYH0brK4bry/twSrUB2pNCjtvkTK00B90KU
 I85iSkl/mTx9aYmBiymJY1CYm/S9O7DcMZxJompUpEOeDS2rXi7LW/KqszxdL4SnR8A+
 Kaog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X0diEJoSxYugEmt4G7PvShB7DLsJUc8rjkUo3x75vjU=;
 b=dnIUqRqjoL6CERiCEAMgC1XwlMqF70NUzm93ghyx3XPn0lzvnkC2xlFlgBZZTOTych
 g3RZWK5AmfuH7TUJREultLNWSTZD88jv3DEmLwq5y/HcJ9PQGaJ8FE3XI/Qqtri7pY2o
 /0SseXg5N7vEfL0JKcDN7ST6welo/3mmQkUuTRvujoONqkJ19+Oi+2gKmRARoGBbYs6W
 rLbN//sDP3ppVF0sysX1BHoRc59wxYj61Nhkz/wMXiTuMZOMhELUFl9K4qamjgO8LA7j
 TXT6z0IB+NGtGhNYYyZhOBzwoB63jBqAnrZ+npBMIWrJd0Kb3yA4GnFF65W/82zFKKyv
 5/yQ==
X-Gm-Message-State: AOAM532DBf3oRiq+J1poDzerMPDORz1PV6jnd3nDpGRJtoXyHCX2GFCK
 We8XWLQDz8ndVAbphUnG9v12FSlKTPE=
X-Google-Smtp-Source: ABdhPJzQ5t8fmefdxoUHL5lA4/GCyV7GYIBRPewvWMT+BM+4CpAKd9ejio6mBeQOXvKk+IojH3ZMYw==
X-Received: by 2002:aca:e142:: with SMTP id y63mr2323654oig.57.1623833378760; 
 Wed, 16 Jun 2021 01:49:38 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id e15sm325272oow.38.2021.06.16.01.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 01:49:38 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v6 1/3] mtd: spi-nor: spansion: Add support for Read/Write Any
 Register
Date: Wed, 16 Jun 2021 17:44:53 +0900
Message-Id: <91b246601147a57527e7ceed7303332fae171f52.1623831222.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623831222.git.Takahiro.Kuwano@infineon.com>
References: <cover.1623831222.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_014940_032569_4866FE3B 
X-CRM114-Status: GOOD (  16.84  )
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
index b0c5521c1e27..2dd692a7ff24 100644
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
