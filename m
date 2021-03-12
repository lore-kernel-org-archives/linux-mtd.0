Return-Path: <SRS0=p7xI=IK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE90EC433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 09:45:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FF8C64F70
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 09:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FF8C64F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UndaWA3TSNRSK1ykfQ4YVyL5sL4zuNOSs+KYMIafgow=; b=nmRsG+TYknrhkeCeyDIUrSEjq
	1rdi6tUGhdPZdam/Na5zAyZgH41Lb16xgcyHFw3zHcLBsrxuhaC6Vgg0rVUwHctHVR6l1QB0lerVN
	uY/ugiDxEfirS+klea+4P55ZyW+j9573XlEQB78W/PUIaAwHPza11cVI+8cRrsybuN+g00++RKH10
	ewlceW2/lHjAMj1FI70ORSn9m7OZiaKLgJSPO/OfuiQGADZLLXutb/OJCznOhub3iIdsP5s4ZOmeP
	dQdYSIiB9xUeMqkNLNUtrSdKGqSja2V+Ao0sEpt8J4V+DFZVeeRjjDAEGvfAGvdBXo+0Q0wghHVju
	0bRj/noTA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKeLM-00B3gc-1h; Fri, 12 Mar 2021 09:44:28 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKeLG-00B3fh-9G
 for linux-mtd@lists.infradead.org; Fri, 12 Mar 2021 09:44:24 +0000
Received: by mail-pg1-x536.google.com with SMTP id n10so15502912pgl.10
 for <linux-mtd@lists.infradead.org>; Fri, 12 Mar 2021 01:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QlBmpkj5JVnVhWyPp899LSyPQWCN5h8F6kCfQf995XI=;
 b=CembFGcF6MS/KExy2Ba+GLlMw/u9BFkIjFsOMp1kpWjQ8y5X6FCoZW3a5MpkdpNZ9y
 1vhDp6ztabUvjkODDipSA/qrtTTZcGqwOp3+pNalsDxWd/Pn6QZAW5Tm6H0BoXjiKR46
 jfdLLap6+475erX9+zTBDo5JhkRX6HfhD8xZ4kKULDKIPkaZSCdjqgIH2bfc4rM+T+Qz
 WqD1WiL4g/qZdiALzXZvKIg3juCJG7HE6GvzWCPYoQv7aX6TokSl9XX61zUuTKeRgnUH
 KqZp8b2kOh9mqkDVdecwc2z0cPZXL4mpEOZBRqMYVCf+c51okwVDqJ22Rq/l8+/1145Z
 IARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QlBmpkj5JVnVhWyPp899LSyPQWCN5h8F6kCfQf995XI=;
 b=esl9392Gowd4DijvMurecNeNcETr73fGWNr7VRmRIlC5de7yqVn81wil1ZIVHiJ/xg
 5ctWB7ObaSXh638DdKiG9yuJOiXr3sMZh7w0XW8CpMXBrMmCJsSR/NtpRIVZLsRtbIqc
 UMAZ0WDedkLpMbmotr7WoyXuCtunOCcMU3sxEqqHB314H7S90Hy34spPFZNZfQZVo2jr
 f+bvt3VjxTq4Q7WutSo9d22WVluaykddZgENTSmbLdxZlNfRdJoWbn9YxOlIwenskPOb
 ylC55cAuXEMnbDgCsk+5cCDAd7h5ZPxviEiP1OldgP/3Cn+hASbBS/iEyc16o7Xrn8dM
 SPBA==
X-Gm-Message-State: AOAM532OKqre5ZpQtP3N8M/NuXlguiWCICnmmYmdAafYInNL4OW6AnZb
 C1ENuk5A5IeAd0K6JWoyXXkNHxRATq1HmA==
X-Google-Smtp-Source: ABdhPJxb8XeTG2O37jltCsQdbzuvHwrRFcN2SwkXf6nVwxtmrULAJ6zZeopmHllSdWvf+/vxQdtU0w==
X-Received: by 2002:a65:498b:: with SMTP id r11mr10004622pgs.364.1615542260648; 
 Fri, 12 Mar 2021 01:44:20 -0800 (PST)
Received: from ISCNPF1JZGWX.tyo.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id i7sm1713899pjs.1.2021.03.12.01.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 01:44:20 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v3 3/6] mtd: spi-nor: spansion: Add support for Read/Write Any
 Register
Date: Fri, 12 Mar 2021 18:44:07 +0900
Message-Id: <1c8662f53f13c6e40b2383d7e7a1fe74ab1c3335.1615523176.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615523176.git.Takahiro.Kuwano@infineon.com>
References: <cover.1615523176.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_094422_636382_0F4EB1F3 
X-CRM114-Status: GOOD (  15.83  )
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
These commands are mainly used to write volatile registers and access to
the registers in second and subsequent die for multi-die package parts.

The Read Any Register instruction (65h) is followed by register address
and dummy cycles, then the selected register byte is returned.

The Write Any Register instruction (71h) is followed by register address
and register byte to write.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
Changes in v3:
  - Cleanup implementation
  
 drivers/mtd/spi-nor/spansion.c | 102 +++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index b0c5521c1e27..1bce95cb7896 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -19,6 +19,108 @@
 #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	0
 #define SPINOR_OP_CYPRESS_RD_FAST		0xee
 
+/**
+ * spansion_read_any_reg() - Read Any Register.
+ * @nor:	pointer to a 'struct spi_nor'
+ * @reg_addr:	register address
+ * @reg_dummy:	number of dummy cycles for register read
+ * @reg_val:	pointer to a buffer where the register value is copied into
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spansion_read_any_reg(struct spi_nor *nor, u32 reg_addr,
+				 u8 reg_dummy, u8 *reg_val)
+{
+	ssize_t ret;
+
+	if (nor->spimem) {
+		struct spi_mem_op op =
+			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RD_ANY_REG, 0),
+				   SPI_MEM_OP_ADDR(nor->addr_width, reg_addr, 0),
+				   SPI_MEM_OP_DUMMY((reg_dummy/8), 0),
+				   SPI_MEM_OP_DATA_IN(1, reg_val, 0));
+
+		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		enum spi_nor_protocol proto = nor->read_proto;
+		u8 opcode = nor->read_opcode;
+		u8 dummy = nor->read_dummy;
+
+		nor->read_opcode = SPINOR_OP_RD_ANY_REG;
+		nor->read_dummy = reg_dummy;
+		nor->read_proto = nor->reg_proto;
+
+		ret = nor->controller_ops->read(nor, reg_addr, 1, reg_val);
+
+		nor->read_opcode = opcode;
+		nor->read_dummy = dummy;
+		nor->read_proto = proto;
+
+		if (ret == 1)
+			return ret;
+		if (ret != 1)
+			return -EIO;
+
+		ret = 0;
+	}
+
+	return ret;
+}
+
+/**
+ * spansion_write_any_reg() - Write Any Register.
+ * @nor:	pointer to a 'struct spi_nor'
+ * @reg_addr:	register address
+ * @reg_val:	register value to be written
+ *
+ * Volatile register write will be effective immediately after the operation so
+ * this function does not poll the status.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spansion_write_any_reg(struct spi_nor *nor, u32 reg_addr, u8 reg_val)
+{
+	ssize_t ret;
+
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
+	if (nor->spimem) {
+		struct spi_mem_op op =
+			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 0),
+				   SPI_MEM_OP_ADDR(nor->addr_width, reg_addr, 0),
+				   SPI_MEM_OP_NO_DUMMY,
+				   SPI_MEM_OP_DATA_OUT(1, &reg_val, 0));
+
+		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		enum spi_nor_protocol proto = nor->write_proto;
+		u8 opcode = nor->program_opcode;
+
+		nor->program_opcode = SPINOR_OP_WR_ANY_REG;
+		nor->write_proto = nor->reg_proto;
+
+		ret = nor->controller_ops->write(nor, reg_addr, 1, &reg_val);
+
+		nor->program_opcode = opcode;
+		nor->write_proto = proto;
+
+		if (ret < 0)
+			return ret;
+		if (ret != 1)
+			return -EIO;
+
+		ret = 0;
+	}
+
+	return ret;
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
