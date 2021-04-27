Return-Path: <SRS0=EgaJ=JY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF9CC433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Apr 2021 07:13:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8B7F610FB
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Apr 2021 07:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8B7F610FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cLyASXfjzAyyU1wrAvHheIEBHX23xwAfgrEjr0s6f7s=; b=BZyrGy16fRBoiuhW8ycbndOux
	lrbGrfid8CP4Y40yZAjtROtluBxZz7QuOtKrYipYa1/xIGVaME86gSPr2Jh3O7iN4py+08b0o0vXU
	lEG4i+e5pIdSxuFT+aULqkpXK6IUmZQL5izmbW4PRaH+BswCeFG4hsuZz+GaxwAUNLil8alrNvOhX
	xFtt6vK5ETUqooEwDkar7xIpPs+9NhfJm6stQEPAcWYlLETiQ5/5wSxLBu3896HcdWC37a+pPYX+V
	HrSQmp79gDh366oBOaeVg8agz/zRDwjF718ZO99XlOiv2tNWIV4hubEpEA/wZ8HH0uWjfCDBgej8V
	PRX2O7i+Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbHt5-000vuM-Gc; Tue, 27 Apr 2021 07:12:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbHqe-000vTD-5H
 for linux-mtd@desiato.infradead.org; Tue, 27 Apr 2021 07:09:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=yBFj+weq+k6Dd1LdPQHzr9yg0kIJfnYhl1IjAjuonac=; b=yaZnj4/o7vJzMJXbnX8jIg5WRU
 Y2hPFOPPtr+G+jeyF4XJ+Ahkhtz0lzHaLyRcfm36xQ4U2fCRRbXRHQHSC759I5xVNH9Kfzhg94cTG
 Ginqq45Ucu/b9mRzZiCp09O3UWNLFV6d+op8SGxH2SSWdCz1Z1qsEppMbys+An6D9nSJmq3yIo4XU
 UwkTaaKWt3xIUqsxVWWK5g9GuPCRIQXn7FrdzTOGKtzg/QY0U9jrWs+4TgYmkt/XyN8LNvoUT89o2
 R4hy/PuaGzVQ+zBnKvWVLhEp6ePuYtq68gRmwWXhp0hJtS8R75VJlysZHZmv+BiA3QCJQSHKGMXnh
 H7G2/wMQ==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbHqb-00GUgX-Ep
 for linux-mtd@lists.infradead.org; Tue, 27 Apr 2021 07:09:30 +0000
Received: by mail-pl1-x62e.google.com with SMTP id s20so14509030plr.13
 for <linux-mtd@lists.infradead.org>; Tue, 27 Apr 2021 00:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yBFj+weq+k6Dd1LdPQHzr9yg0kIJfnYhl1IjAjuonac=;
 b=I+oWfBenWU8jKFkbG2Ol4bRjkoTiqx9qappwy27SiDwnWbv06tOLrfFpZKYSRWQxeo
 rY2OIGpLUT77pkISGQBN1GwQiMX2pyBGFWwmlUgha8Zyh/sB/A6mS1OrcURfkD+vKchD
 f3dYwhgTgHi8n/UD5R3EoNSHyl3ttskTk/Xd7QTAQjbU9ET50hT8E3S4SU6tjp1RSHVi
 goNeO9sJ4bLxC1Rwh7gnDNJQODC8NZrHsoee6609rsoruzEl9pDgjC4pUFs3KOUfVpV8
 GQVpAHCx4E3sCodf40SXEzn/WX/7aJLBRVOpoefbFTU0iUvdQtBabwN1jxDusYzX+8bD
 iY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yBFj+weq+k6Dd1LdPQHzr9yg0kIJfnYhl1IjAjuonac=;
 b=Os6nZX2gd6YetDg7iZPC8OmOj1zF6qwk8QUPytgXHoVye6G2ny48puDVbUm2yZCI+Y
 fDIn5c5OY9HoJk5mWIQL6MKq4YOAY0OqnSCOFxvlw72T8vvXZrDEDJSQ3VXgxjD4vLjr
 X62unz6qhP0GksPKe9qJaIJa98QRUvq9uOV3aZQGFY4GmCRbWa5/rmTuIukWHujJCo3m
 9EWsxOgCtQZUUVzx8zC8SC0gaRJzyzVNtU1zZFVvU5xIrIAMBIU0owOddgqPA1oTqxtp
 58lrOwTUVV5ndUzu5y3Sr5fH9y+6cVWBsA/xTm10zcqzPv9jMkihYF+TOYTpWpk6yDaQ
 LLUw==
X-Gm-Message-State: AOAM530BbAgVbwbeV/a3mnH5SeB+Xiy41k2+bZ1IiMrS/snuZRXL6NW2
 y5CBQVdfu1qJHeFDoUD+cV2DINT+cHI=
X-Google-Smtp-Source: ABdhPJxcfA5Hxa6BO7dVXK/rAbXB0FaEB174N4bskI216q0fNw3Lz91SdwgiA0ZS3fQSjoo7ySlt+g==
X-Received: by 2002:a17:902:8d83:b029:e6:508a:7b8d with SMTP id
 v3-20020a1709028d83b02900e6508a7b8dmr23611636plo.18.1619507367411; 
 Tue, 27 Apr 2021 00:09:27 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id u189sm1589803pfb.151.2021.04.27.00.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 00:09:27 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v5 3/6] mtd: spi-nor: spansion: Add support for Read/Write Any
 Register
Date: Tue, 27 Apr 2021 16:08:58 +0900
Message-Id: <55919d6bce07a5b534edef10b56a6c1b3fecae9d.1619504535.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619504535.git.Takahiro.Kuwano@infineon.com>
References: <cover.1619504535.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_000929_521430_EA9F3E0A 
X-CRM114-Status: GOOD (  16.11  )
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
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
Changes in v5:
  - Fix 'if (ret == 1)' to 'if (ret < 0)' in spansion_read_any_reg()

Changes in v4:
  - Fix dummy cycle calculation in spansion_read_any_reg()
  - Modify comment for spansion_write_any_reg()
  
Changes in v3:
  - Cleanup implementation

 drivers/mtd/spi-nor/spansion.c | 106 +++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index b0c5521c1e27..436db8933dcf 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -19,6 +19,112 @@
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
+				   SPI_MEM_OP_DUMMY(reg_dummy, 0),
+				   SPI_MEM_OP_DATA_IN(1, reg_val, 0));
+
+		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+
+		op.dummy.nbytes = (reg_dummy * op.dummy.buswidth) / 8;
+		if (spi_nor_protocol_is_dtr(nor->reg_proto))
+			op.dummy.nbytes *= 2;
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
+/**
+ * spansion_write_any_reg() - Write Any Register.
+ * @nor:	pointer to a 'struct spi_nor'
+ * @reg_addr:	register address (should be a volatile register)
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
