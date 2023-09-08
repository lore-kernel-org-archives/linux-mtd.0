Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13CEEE57CA
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 06:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qcvObTIrrMCQqzlutJ/hZUQF5Tni2VdJAr4LeMwdyPk=; b=E8tHJR5o7gvlGu
	xwZ/ypG32eGA5ODN31z+E5rhqNH4qSVZcSHf4yvpVamQBKcmSq+97ev6zVJyGBmA4jCLyExV4tCUi
	YXm8uSCPpKX4LDSrEokEKPEf0MyNoDa0itiBPKiZp3S+8DX7Pq/C3aAU6q3gmtpt4bsxOiai2oI2O
	bulhu1Ky+D3qKlFJeqaJQj4yRFY7NTW0nS200DX604kzXvAU1c7wohLJq5AX2e31EJvfd2zHIfGdM
	UZmM2JWM04ytUGUBK8LD1IdlfVB3fZ5d8gohMELC6BUXkO2Z/HVlrowgiULVvYhxHttk1mL5YLNEf
	K2Ua5fy8jWAUSxTRH9+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeVD4-00DBJI-1c;
	Fri, 08 Sep 2023 06:43:18 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeVCz-00DBGc-0C
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 06:43:15 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3a9f87adfe1so1285869b6e.1
        for <linux-mtd@lists.infradead.org>; Thu, 07 Sep 2023 23:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694155391; x=1694760191; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRECkfpSQnnouYPD9aJZI9ZgaK79vbjjUetUkrKtrrg=;
        b=GltXMz7G5uhAQUa4gphSPlVnJLaoh1tzDx2H6ecJJ1c2CdYAwyhN6sYzDaaCOGcLxA
         oPA7SJIDgUsSUDy6kTeKqyDeZax9xdz2HEt74OA8FhUHv9YcxSYAQgexHXbhOx+YVzlD
         h+q1HGRxklop2cJrhIXSttkkRCx1nqpd0UgnjTNraPks8bk1cjgRn2s/nDdDUBumRzwm
         jE/93qYrBfBXo+8qTvAfLCwLIXnWl5e3qf6oITdgXUV3xv0dX0XQ0AZTmm3sGFwz9C9g
         WoSlsgDXpXB0LLmRC5TdJlTrmd79rYNGoG4+3tGCt/Qk1Jkw5GxcMbHoJqUd4HH9gcmM
         nX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694155391; x=1694760191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pRECkfpSQnnouYPD9aJZI9ZgaK79vbjjUetUkrKtrrg=;
        b=soyQ0C5mO6C6gL5OlwD7ZvrWxJoYayJE8RP6IXl3Cz0EY8UKpiKPQvfH1mIw2dw24E
         NOTpJChoPKNpNLxT1ZE2rWz77PrMEJz5p7xaJ1jpkS9QonHFMeOAcbgpXi6j6EbgaxDl
         ok6fqMJ76T6M6rHcrDCm8Bved9xfr3E1IL/HDZIrp2CNjayiX91PfBfWYqFz8LWAlHWx
         EeTOilD0OGO8McWhbx1/qXCj6gsfZjut+6q8TJ0g9HFuhEOAeVN7NkSHMx1ZBQIa7VAN
         ZyDJWVrxRUHzGYRS9mQ544W1XygXVLsIa6Zi3RAQyT/ia/Ile9Xdp8O7zJ4GyD/tiYk4
         vHhw==
X-Gm-Message-State: AOJu0YzbDDy+tejUbE1wkFfgyzbDbKGkLlPWyIoxrZFEzkxooFa0t8Vo
	cQ9ToUVrC6MmIMBekEduimBWVn3hY6k=
X-Google-Smtp-Source: AGHT+IG3/vy0pxUGyBq3T8wsoFm/g+OHDSmy2cWKxqRViUbX/3KH2JD6rs6H4Wtl5mE4a+gM1hdSlw==
X-Received: by 2002:a05:6358:71d:b0:125:a552:4389 with SMTP id e29-20020a056358071d00b00125a5524389mr1999638rwj.22.1694155391046;
        Thu, 07 Sep 2023 23:43:11 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2-20020aa78142000000b00666b012baedsm671944pfn.158.2023.09.07.23.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 23:43:10 -0700 (PDT)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 7F85780E44;
	Fri,  8 Sep 2023 14:45:07 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v4 2/6] mtd: spi-nor: add Octal DTR support for Macronix flash
Date: Fri,  8 Sep 2023 14:43:00 +0800
Message-Id: <20230908064304.27757-3-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
References: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_234313_095981_CC4AD037 
X-CRM114-Status: GOOD (  18.00  )
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

From: JaimeLiao <jaimeliao@mxic.com.tw>

Create Macronix specify method for enable Octal DTR mode and
set 20 dummy cycles to allow running at the maximum supported
frequency for Macronix Octal flash.

Use number of dummy cycles which is parse by SFDP then convert
it to bit pattern and set in CR2 register.
Set CR2 register for enable octal dtr mode.

Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
Co-developed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/macronix.c | 97 ++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 8ab47691dfbb..28c49c98503a 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -8,6 +8,24 @@
 
 #include "core.h"
 
+#define SPINOR_OP_MXIC_RD_ANY_REG	0x71		/* Read volatile configuration register 2 */
+#define SPINOR_OP_MXIC_WR_ANY_REG	0x72		/* Write volatile configuration register 2 */
+#define SPINOR_REG_MXIC_CR2_MODE	0x00000000	/* CR2 address for setting octal DTR mode */
+#define SPINOR_REG_MXIC_CR2_DC		0x00000300	/* CR2 address for setting dummy cycles */
+#define SPINOR_REG_MXIC_OPI_DTR_EN	0x2		/* Enable Octal DTR */
+#define SPINOR_REG_MXIC_SPI_EN		0x0		/* Enable SPI */
+#define SPINOR_REG_MXIC_ADDR_BYTES	4		/* Fixed R/W volatile address bytes to 4 */
+/* Convert dummy cycles to bit pattern */
+#define SPINOR_REG_MXIC_DC(p) \
+		((20 - p)/2)
+
+/* Macronix SPI NOR flash operations. */
+#define MXIC_NOR_WR_ANY_REG_OP(naddr, addr, ndata, buf)		\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_MXIC_WR_ANY_REG, 0),		\
+		   SPI_MEM_OP_ADDR(naddr, addr, 0),			\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_DATA_OUT(ndata, buf, 0))
+
 static int
 mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 			    const struct sfdp_parameter_header *bfpt_header,
@@ -105,6 +123,84 @@ static const struct flash_info macronix_nor_parts[] = {
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 };
 
+static int macronix_nor_octal_dtr_en(struct spi_nor *nor)
+{
+	struct spi_mem_op op;
+	u8 *buf = nor->bouncebuf;
+	int ret;
+
+	/* Use dummy cycles which is parse by SFDP and convert to bit pattern. */
+	buf[0] = SPINOR_REG_MXIC_DC(nor->params->reads[SNOR_CMD_READ_8_8_8_DTR].num_wait_states);
+	op = (struct spi_mem_op)
+		MXIC_NOR_WR_ANY_REG_OP(SPINOR_REG_MXIC_ADDR_BYTES,
+				       SPINOR_REG_MXIC_CR2_DC, 1, buf);
+
+	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
+
+	/* Set the octal and DTR enable bits. */
+	buf[0] = SPINOR_REG_MXIC_OPI_DTR_EN;
+	op = (struct spi_mem_op)
+		MXIC_NOR_WR_ANY_REG_OP(SPINOR_REG_MXIC_ADDR_BYTES,
+				       SPINOR_REG_MXIC_CR2_MODE, 1, buf);
+	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
+
+	/* Read flash ID to make sure the switch was successful. */
+	ret = spi_nor_read_id(nor, 4, 4, buf, SNOR_PROTO_8_8_8_DTR);
+	if (ret) {
+		dev_dbg(nor->dev, "error %d reading JEDEC ID after enabling 8D-8D-8D mode\n", ret);
+		return ret;
+	}
+
+	if (memcmp(buf, nor->info->id, nor->info->id_len))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int macronix_nor_octal_dtr_dis(struct spi_nor *nor)
+{
+	struct spi_mem_op op;
+	u8 *buf = nor->bouncebuf;
+	int ret;
+
+	/*
+	 * The register is 1-byte wide, but 1-byte transactions are not
+	 * allowed in 8D-8D-8D mode. Since there is no register at the
+	 * next location, just initialize the value to 0 and let the
+	 * transaction go on.
+	 */
+	buf[0] = SPINOR_REG_MXIC_SPI_EN;
+	buf[1] = 0x0;
+	op = (struct spi_mem_op)
+		MXIC_NOR_WR_ANY_REG_OP(SPINOR_REG_MXIC_ADDR_BYTES,
+				       SPINOR_REG_MXIC_CR2_MODE, 2, buf);
+	ret = spi_nor_write_any_volatile_reg(nor, &op, SNOR_PROTO_8_8_8_DTR);
+	if (ret)
+		return ret;
+
+	/* Read flash ID to make sure the switch was successful. */
+	ret = spi_nor_read_id(nor, 0, 0, buf, SNOR_PROTO_1_1_1);
+	if (ret) {
+		dev_dbg(nor->dev, "error %d reading JEDEC ID after disabling 8D-8D-8D mode\n", ret);
+		return ret;
+	}
+
+	if (memcmp(buf, nor->info->id, nor->info->id_len))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int macronix_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
+{
+	return enable ? macronix_nor_octal_dtr_en(nor) :
+			macronix_nor_octal_dtr_dis(nor);
+}
+
 static void macronix_nor_default_init(struct spi_nor *nor)
 {
 	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
@@ -114,6 +210,7 @@ static int macronix_nor_late_init(struct spi_nor *nor)
 {
 	if (!nor->params->set_4byte_addr_mode)
 		nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_en4b_ex4b;
+	nor->params->set_octal_dtr = macronix_nor_set_octal_dtr;
 
 	return 0;
 }
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
