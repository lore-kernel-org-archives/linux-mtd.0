Return-Path: <SRS0=vdk9=IR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D493C433E6
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Mar 2021 06:59:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 980DA64F6E
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Mar 2021 06:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 980DA64F6E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uguXxXFhcSJKQkXIJo83lr3WCnlLUEu/2HiYD2qoRdA=; b=DyKpKDkmAhDxqFoUuI74mCd9v
	iqP0fYtqKUaQtGn8vnMC52D1x390COM+ynzeC+i/YeJ2P/lTb2EVeGtS97MFhZ9i0KNnLIqAmHheP
	XYYILfTi7YMTxQ6mhDoH/1A3guNJbeISv5kk1qGCQIDTZdwltVp037BMvytMl3NZD+zGBXlon3QWW
	WIjD4ecB/7xacB+DiBCjipIRAFHdeaxrivcx82m9ncVRG6YlwrWDYpAcWAZVSpLIPNbH9KA3y3uVE
	oQ0CNrECF1oAkB312FXEXKCbCu4AcCBNSm72OoH7pX87OozhvimjRL6FfibO0Fkg8jaj8sM0SsqfG
	HXc3psNjw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lN95N-006kCb-82; Fri, 19 Mar 2021 06:58:17 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lN95H-006kBP-M5
 for linux-mtd@lists.infradead.org; Fri, 19 Mar 2021 06:58:14 +0000
Received: by mail-pf1-x42d.google.com with SMTP id h3so5218886pfr.12
 for <linux-mtd@lists.infradead.org>; Thu, 18 Mar 2021 23:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OqKaSa2/R0uh8r7F2ABsUnuB/YWHoPmw1b8CwDU3yfE=;
 b=YWmiDECEsVNLVURk42mbFRY7UOnOnOCR/rlrZB7vIR80slo1uq/1Nn3vN3nHmpKLxm
 ZfquPlbupjwWxI1JIdyCbA1wIp78deldEft0eCXsNlS1mo+uQ0Fqo4P1terDmHwck1LD
 /DhPicB9RBjVwtOKcUAFUNWAX48UinzMDvEKqtUAXckH/P4IEyUwD9lEWSZbMhgpiws0
 jziEUMet0fBKM7l4xDIMFWftULXELvTzOETEBTSUvZThulLp5GY9kSV9Buo3KwUs1+C2
 54KK8LsqZW0s/6O59C3bPIEsarEZitM7n2WecTsnFLEBB2hWXxSMsqS76uIKNWPnoEjP
 AGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OqKaSa2/R0uh8r7F2ABsUnuB/YWHoPmw1b8CwDU3yfE=;
 b=Qe+kyvzxleVLm270nEOFaqSmI66VCyqYRZc8mPNfv3DlW/8oCpqJIf1Iu+EWB92gUI
 joA4q4IfGobT0rwy/V9N4LLn1KiZPPmOGwl9I/prGrJKKp/bNu4bDq6L3mo1/6WvO5L/
 nqJgfTKPwjbTDzP1xcYIYdE4U4VRRuZ2Orw3ZiksXreTpPIOjPk6HUxHaC10MoW91wON
 Cb8T+KIP42mKhpVeh+BSrReMnXDeMXhkhHBTklDvJiwqj9YiLxG6hQiEyUpdDt20mvwU
 6DhPg/apEGqZvLM+Zn0emeMVh6H1Sb/I5olL7AsmtHnrFw0bcCi/DReiZcWzB6yknlYF
 dMRQ==
X-Gm-Message-State: AOAM532Q+IHDksK+kVI+EwsMaBUeEzwui1FnPLKz4joKslN3ZJ4pyx9+
 jV0gDT5gJ1/+KFTk+/cYf+KUJ4UEBqEpbA==
X-Google-Smtp-Source: ABdhPJwX5XeZo6gj6T9YJPWRPk9K7//m+bVwSUaLpoVStg3xpK14Z5jefFd4STgUDAQPbYLmwNbaYw==
X-Received: by 2002:a63:fa07:: with SMTP id y7mr10400178pgh.213.1616137089832; 
 Thu, 18 Mar 2021 23:58:09 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id q95sm4400332pjq.20.2021.03.18.23.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 23:58:09 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v4 4/6] mtd: spi-nor: spansion: Add support for volatile QE bit
Date: Fri, 19 Mar 2021 15:57:56 +0900
Message-Id: <6beb496c47d2521c68f8b4d0867cd77c7f8a2821.1616130675.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616130675.git.Takahiro.Kuwano@infineon.com>
References: <cover.1616130675.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_065812_002465_73350EF4 
X-CRM114-Status: GOOD (  17.95  )
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
power interrupt. This patch adds a function to set Quad Enable bit in CFR1
volatile. The function supports multi-die package parts that require to
set the Quad Enable bit in each die.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
Changes in v4:
  - No change
  
Changes in v3:
  - Add multi-die package parts support

 drivers/mtd/spi-nor/spansion.c | 58 ++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 52a427d0af02..fdbf43bccc21 100644
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
@@ -125,6 +127,62 @@ static int spansion_write_any_reg(struct spi_nor *nor, u32 reg_addr, u8 reg_val)
 	return ret;
 }
 
+/**
+ * spansion_quad_enable_volatile() - enable Quad I/O mode in volatile register.
+ * @nor:	pointer to a 'struct spi_nor'
+ * @reg_dummy:	number of dummy cycles for register read
+ * @die_size:	size of each die to determine the number of dies
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
+static int spansion_quad_enable_volatile(struct spi_nor *nor, u8 reg_dummy,
+					 u32 die_size)
+{
+	int ret;
+	u32 base, reg_addr;
+	u8 cfr1v, cfr1v_written;
+
+	for (base = 0; base < nor->params->size; base += die_size) {
+		reg_addr = base + SPINOR_REG_CYPRESS_CFR1V;
+
+		ret = spansion_read_any_reg(nor, reg_addr, reg_dummy, &cfr1v);
+		if (ret)
+			return ret;
+
+		if (cfr1v & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
+			continue;
+
+		/* Update the Quad Enable bit. */
+		cfr1v |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
+
+		ret = spansion_write_any_reg(nor, reg_addr, cfr1v);
+		if (ret)
+			return ret;
+
+		cfr1v_written = cfr1v;
+
+		/* Read back and check it. */
+		ret = spansion_read_any_reg(nor, reg_addr, reg_dummy, &cfr1v);
+		if (ret)
+			return ret;
+
+		if (cfr1v != cfr1v_written) {
+			dev_err(nor->dev, "CFR1: Read back test failed\n");
+			return -EIO;
+		}
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
