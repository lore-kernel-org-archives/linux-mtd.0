Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123B7C197A0
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Nov 2023 08:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e06xr4jsutLxJQs1gB1vBkPr3A7RgpI6p4eD9xZWnkw=; b=g5F8ow51Kt7g3X
	GdK73fn+QZvKEaQRRALC/KmfX7qgHR/5ptPhgWUJEx42xbweabp3IWMmdjsnb9JId0yB1IVEVXju8
	QKnbmCvqHwUrnqXtQgPLw1hjcD3V3BFccLY/w71F/gcwB2rS4EhWkwCvzjBg74gWEprFxwb6nYZei
	pTi+/TRZtTMOKlKmea3ClyCRjWmRehqg95imwYd0B/94SeP3KrSCVBNavcfWCP3In+jWs7URG5xAx
	ml0ag8E3tkebn7aFFfXh9FpYC/lqlUk70Qd5LguoCRYWhfC8ffkHlGh0LeHDcbRX4XPsQSL1KVS6T
	oLFKtf/VN9fhpEnF2CSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3uNV-005xD8-3D;
	Fri, 17 Nov 2023 08:39:06 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3uNS-005xCM-0r
	for linux-mtd@lists.infradead.org;
	Fri, 17 Nov 2023 08:39:03 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6b709048f32so1601059b3a.0
        for <linux-mtd@lists.infradead.org>; Fri, 17 Nov 2023 00:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700210341; x=1700815141; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1fVaQ8xpYXerpjyXRXvWiYuEY8K4e6Teiic9m4/R+I=;
        b=V9/GoVjGr1HZB8I3JpOl3Yg+KsV6SgUxtHgka2TOEGSyZtkilprHReik96Ugm8yIwl
         fVZ6igQQiejbGJsKZcldh3qohr2jVx8Nn2X54dcCqdNAaX1dQAkQgpbhqyYn6+XNZX3q
         fhjK61GutvHBgD4TV1nP9L8F+mlGuUqzJACzFL+xNn5bw23xlG79v7diVw8LlJO4WayF
         5zzji7k2hoR5s7Lb8U9kY4O8ztj6np5ZRTzC8vdaLdbSUVqwTl38dBqig0nPrXr+BRGY
         xTPHFnFMIEx/yCQQznUGc8NJ0DW/F0yeubalMWAjHJpE1VVKhUQwLEuuvzxkDgmRhm+h
         H3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700210341; x=1700815141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1fVaQ8xpYXerpjyXRXvWiYuEY8K4e6Teiic9m4/R+I=;
        b=cSZzRc2e9UiUw9y9/OEWeQTNBujkorYTBNIMUGeps2k6YAEj7+SkY5HqVda2PWCTkk
         afpR+aB8p2pympO4L7YXAwhNaCtbWZh5NH22H6OWL1YtcHresqgNIQ46MnVBQjmf6xsU
         GW1wuuwAjlB8XVqFaHL0JPxbeeq+RxqmBUJOBcTF4SF/moKEFJ/PpCiVl7hbovLQgMFv
         XXbT5dsWcc6rANq6/zJQqb60HRsi/PLOdrleeMW1gfuD3OGFi8KJWuoSV72WsRoiYr3c
         9lpOENf+kYbx5g+SEfxZVJaOVsMdW5LNOdtpZH4MZqJw8clYtUhr73hw0LJYgZY/NqrO
         PplQ==
X-Gm-Message-State: AOJu0Yzg3OgpJFeV2CTuOW9fngTXP296eREjwjcJ9l16+XEvvmwsPAn1
	yJfpZ+EHQzm8W5efxpFrf5ZkNWLSPpc=
X-Google-Smtp-Source: AGHT+IGv4ILPaEH5FZIhvEfQYcHlhidNK1eXpQ+OcKa/bRI32B42pdocaE2hcCAf5NUxIknfanNMJQ==
X-Received: by 2002:a05:6a00:2e25:b0:6c3:3213:2d17 with SMTP id fc37-20020a056a002e2500b006c332132d17mr19904275pfb.29.1700210340980;
        Fri, 17 Nov 2023 00:39:00 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id i20-20020aa79094000000b00690c0cf97c9sm964138pfa.73.2023.11.17.00.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 00:39:00 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 504138050E;
	Fri, 17 Nov 2023 16:39:00 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v5 1/6] mtd: spi-nor: add Octal DTR support for Macronix flash
Date: Fri, 17 Nov 2023 16:38:48 +0800
Message-Id: <20231117083853.33329-2-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
References: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_003902_310563_C3C72DA4 
X-CRM114-Status: GOOD (  19.66  )
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
Set CR2 register for enable octal DTR mode.

Use Read ID to confirm that enabling/diabling octal DTR mode
was successful.

Macronix ID format is A-A-B-B-C-C in octal DTR mode.
To ensure the successful enablement of octal DTR mode, confirm
that the 6-byte data is entirely correct.

Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
Co-developed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/macronix.c | 100 +++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index ea6be95e75a5..dee71776b1a8 100644
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
@@ -185,6 +203,87 @@ static const struct flash_info macronix_nor_parts[] = {
 	}
 };
 
+static int macronix_nor_octal_dtr_en(struct spi_nor *nor)
+{
+	struct spi_mem_op op;
+	u8 *buf = nor->bouncebuf, i;
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
+	/* Macronix SPI-NOR flash 8D-8D-8D read ID would get 6 bytes data A-A-B-B-C-C */
+	for (i = 0; i < nor->info->id->len; i++)
+		if (buf[i * 2] != buf[(i * 2) + 1] ||
+		    buf[i * 2] != nor->info->id->bytes[i])
+			return -EINVAL;
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
+	if (memcmp(buf, nor->info->id->bytes, nor->info->id->len))
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
@@ -194,6 +293,7 @@ static int macronix_nor_late_init(struct spi_nor *nor)
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
