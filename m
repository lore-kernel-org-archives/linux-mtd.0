Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FDAC04A94
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Aug 2023 09:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zuoeu85YLsRnfW9XGrjuuOmTHYMXq4exBHN/5yI7nss=; b=kKC5QWIi5K/W7f
	xx/JGUMIQiw9mBaYOw8LwQDDoSSbSrJd1p9ESgKIwXJySiz6ubb0/T2/sxZAO3OtjZPoBV//hhuTL
	yS03EoaU9adeXAkr+X2EByyZtrka/6Vs7gykUcAH8nGKpAu5+Q/YPlN17Df6hA+KOA1NxyPA5DQqq
	GXnAL4h64OwSsFm9F3bksoUrEp6ZkvEnfcEvYM2mq4bKWMLVURI+ns6fsxgi91brwLWbvNzN+lT2h
	tPhhVCECxWHa03dBiMKHvWFHMXjXMI498KyrSVrbt5tIQ/Ms94ERkovu9nURNN0a1jRcBmcv9Qbza
	2Brh3JQs11N8GQ1F8YLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRrWP-00C47d-3D;
	Fri, 04 Aug 2023 09:55:02 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRrWM-00C45R-1N
	for linux-mtd@lists.infradead.org;
	Fri, 04 Aug 2023 09:54:59 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3a3df1ee4a3so1175419b6e.3
        for <linux-mtd@lists.infradead.org>; Fri, 04 Aug 2023 02:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691142895; x=1691747695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6JgVuuCVgjerzUVMkCS3MQr0fiLnGbx75zr7gfOHwY=;
        b=Vh7UWdWY50pNxnh91DVJ6O6YS6cS8rMxLWzwei0zpzc2hZ9CVJVpX+J3sSCWAt4Qqy
         vA0h6LXq/D3Ax9QUHcLfqBMGK2GTSN2pXZqa64jhsk0+Cl0d9UjwfcnTHDIwWvjRFany
         vlj67uK+TtRG9MtdtSgC9CC+wKnEXQ08IpzXKWYdmmTedbskSxsN4/cXqryVZ0J6+sto
         7VlEyVr6WtxK1crv+zre3A6fHsrZB2pmEgDh3FDvJ/36aQOPyGi0+5RGc5/27bnzx8pp
         PttzGai+/IvIY6+gJrH99nV/KkQje4KzYpzdzXjmUI/bOos+v06zb40It1IWqBG08hLB
         Y1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691142895; x=1691747695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6JgVuuCVgjerzUVMkCS3MQr0fiLnGbx75zr7gfOHwY=;
        b=ApxEFsCmiKTZIpYLk8wJE/QGM2uxIlqja5S1ifUiFb0Mkd2gRVnjDxW6zO31t98KUn
         VmD1Wi1x/+b3LPy5m+0kV06r/t/BaOAi1bI6S7KW+TucAZCQnAV5EQRerjr/TqY0IIHe
         1E4sJcGzq6tT82Rynu2C/OBic3KRySYifgYiRZFut6Y0mVWOzRmVQtUau7UOxPCblpj4
         VX0qrV+rqhKjhJJZzdOe3a3peS2Csz+wWqtPJaFnIMpL0OTGKlLdUAGzYDp/1Juh4tR4
         K8J4JGoHSw7TJv+ru2dRUa3CNvg/JZLcLbQ1GBxlCzvnCGtxVOLQ/83745cpWcxPIk3y
         0WMw==
X-Gm-Message-State: AOJu0Yz061EdV4Co7I5lhqoPzm4aloDYrrWF18s7CPCkS+4tC14qfib4
	kEJYugwN+bMdK/npIsBloN0=
X-Google-Smtp-Source: AGHT+IH+r7cCUfO2o/cEGXUbaWfK3tH5i3PY8tJ9heEUjtj6A9l+AFiCs/E9/9mFo9QX4g9Z2G4Bag==
X-Received: by 2002:a05:6808:1788:b0:3a7:5314:e572 with SMTP id bg8-20020a056808178800b003a75314e572mr1665426oib.53.1691142895230;
        Fri, 04 Aug 2023 02:54:55 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id o21-20020a17090aac1500b00262eb0d141esm1199892pjq.28.2023.08.04.02.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 02:54:54 -0700 (PDT)
Received: from linux-patcher.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id C789F8052B;
	Fri,  4 Aug 2023 17:53:42 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	JaimeLiao <jaimeliao@mxic.com.tw>
Subject: [PATCH v3 1/5] mtd: spi-nor: add Octal DTR support for Macronix flash
Date: Fri,  4 Aug 2023 17:54:05 +0800
Message-Id: <20230804095409.278419-2-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230804095409.278419-1-jaimeliao.tw@gmail.com>
References: <20230804095409.278419-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_025458_462692_E508D1DA 
X-CRM114-Status: GOOD (  18.83  )
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
 drivers/mtd/spi-nor/macronix.c | 99 ++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 04888258e891..679266cfbe8c 100644
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
@@ -105,6 +123,86 @@ static const struct flash_info macronix_nor_parts[] = {
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
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
+	for (i = 0; i < nor->info->id_len; i++)
+		if (buf[i * 2] != nor->info->id[i])
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
+	if (memcmp(buf, nor->info->id, nor->info->id_len))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int macronix_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
+{
+	return enable ? macronix_nor_octal_dtr_en(nor) :
+			macronix_nor_octal_dtr_dis(nor);
+}
+
 static void macronix_nor_default_init(struct spi_nor *nor)
 {
 	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
@@ -114,6 +212,7 @@ static void macronix_nor_late_init(struct spi_nor *nor)
 {
 	if (!nor->params->set_4byte_addr_mode)
 		nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_en4b_ex4b;
+	nor->params->octal_dtr_enable = macronix_nor_octal_dtr_enable;
 }
 
 static const struct spi_nor_fixups macronix_nor_fixups = {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
