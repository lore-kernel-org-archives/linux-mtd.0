Return-Path: <SRS0=vdk9=IR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F5BC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Mar 2021 06:58:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2C5164F6B
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Mar 2021 06:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2C5164F6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lObY9u70KhBdo7+WKoX552sHhlmI1D8JfS6p+EsK5IY=; b=o58SNdf4Wy7pWtje8fA9E1RI5
	kg3M0T5+VoVymQxbHWKlY31TZ6sXigmnMiVJ4PlMcDefBOYc0SIW1HNTb/jGkro0O/3NoQQSiSr+b
	XOxCRaryiplti6SFdYCwh2pmqo2vvvgXOAs1VyUibcapVj1+VPsCcVdd6o7msQv/ADLRr0L5Ae7Jn
	cM8qKNGHIlzm1oF5iCjWuDKU3i+KqoavfJ+BbiQ9T7lZQ09lhvlRh5nGDNPUB5/tq5wGtiySYugw7
	RncursQ/9/H84Uqs0JjuwrgP2vxheg+zcdlej6VrEkEqNiJWkD6UsIgXd8WqDvmMxlngjQpv9g8pt
	LmDfQLvfQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lN94A-006jxS-Po; Fri, 19 Mar 2021 06:57:02 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lN942-006jwc-UV
 for linux-mtd@lists.infradead.org; Fri, 19 Mar 2021 06:56:57 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 kr3-20020a17090b4903b02900c096fc01deso4374655pjb.4
 for <linux-mtd@lists.infradead.org>; Thu, 18 Mar 2021 23:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DT3o+vyjq5h9JvVM7AnYK9reB4mzHg6A95AtdiN7zdA=;
 b=soKsbpgxseEo9IcXxEmag6c+08vzytKO+JBqvUJU60ihq+yTcoIdqeZv764TlpH4yv
 2f86+5DEQs+DEfslUsc7igQNG2sGSWzMV5wL0xg2oFFs6O2xi1lM2VolY6KKGOvPM+yV
 b2nG0L7kt231lGQlLQ4gCDuMAKcwHhkKlNU4FeOjMCpZN1glQ6iL9WQ24Sl/Wd8KoIAY
 +2YUSw8Q+Ixwti1X72onf5ujkXNTYcGX/ECVi8eEHat0xNHwOwrvU17BgFafPJkHWsvx
 q5OOgKZYY28f6U3L4RXLkPoVMVC6+yZ8WygvwWqNnvEGdrn+qGeMSbf9opvHnoX4DHWE
 0dmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DT3o+vyjq5h9JvVM7AnYK9reB4mzHg6A95AtdiN7zdA=;
 b=VlXErqovWdXlm8BSF+eq+8rNG2+u2VdPCGIsf+3aobFex03/stiT/2oYn+JkuM4hiE
 lylO71+qgMmRgl3IUEkTqKXxyHy4toCILXa+E8JsLFFk/bT+ECWQ4WjXguSxUmfwHabW
 cNUm2GdrZBbzJCD7M9nQWmZaPE8s86R8D58z7y1HmfU8EFtIWgypDgiSrv0+4F/0KC5z
 L1S7+cS7mezIA4yndEvapnQaj7hoEnEnhKliA8HrF697d23gpNcKXw4HO/O8gKXxr3MT
 HUgTS8NOtVfI3WI5TmG828qmoL+q4Abwu7CW/FOULBDnCtV01Qe7zKrbhd8V0B0gngdF
 4/FA==
X-Gm-Message-State: AOAM5300lFnK2DVOHPC+4XsxKwdx48DHkigdLczDDZvfGxGsUMMsi5Iw
 QS88SCPldaOIhINo3QHILt3U+m61Wo8IFQ==
X-Google-Smtp-Source: ABdhPJxzL9wWZkh2j9Ylrs6MYK+eFIz1aee84GYFCso7eNH49cBW9zhqyDma/mx+NtSxfBeDT22pXA==
X-Received: by 2002:a17:902:bd82:b029:e6:1ef0:82dd with SMTP id
 q2-20020a170902bd82b02900e61ef082ddmr13201940pls.43.1616137012797; 
 Thu, 18 Mar 2021 23:56:52 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id o123sm4333414pfb.16.2021.03.18.23.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 23:56:52 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v4 3/6] mtd: spi-nor: spansion: Add support for Read/Write Any
 Register
Date: Fri, 19 Mar 2021 15:56:31 +0900
Message-Id: <af93c67815185940b02e95dfddcedda0dd1a6d36.1616130675.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616130675.git.Takahiro.Kuwano@infineon.com>
References: <cover.1616130675.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_065655_917576_1EC6CD88 
X-CRM114-Status: GOOD (  16.14  )
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
Changes in v4:
  - Fix dummy cycle calculation in spansion_read_any_reg()
  - Modify comment for spansion_write_any_reg()
  
Changes in v3:
  - Cleanup implementation

 drivers/mtd/spi-nor/spansion.c | 106 +++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index b0c5521c1e27..52a427d0af02 100644
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
