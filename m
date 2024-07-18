Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF6CC3DA60
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jul 2024 03:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=48mAe0xvXGPPr+fVRgzQt4DPSkug+3yHd5tsl05IDn0=; b=HJaBaWJdDTzJN/
	lPvusVoVLLJvYN0MjdY9egML2CX8VsgOWWNyS34jDXG3n//aVxgkXGGTOzDyNxWSNNvrf6DkTMLlE
	tSk5lr94ooVOzj7w1zta9Q4M3L4xyiPp24/sTvuD2SfCy0NkJ+x+dMSxcr6BlUXs0p13ssYE3JMww
	X0rKTRl6/cIeNGppQvECSeF356AISyPDLDow96dUUePXaPRJfhsrcCW4Tp8Y4jYJozuWddxEeba4E
	JLBN5LwD46LeV6hlSyOTrJRpGp1JH9JIoubgH6wo9i79Q4ixjJ4sEekuLEbv+LW1EHe8duhXU4zgc
	bSgqo4z94jXTY888UTPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUI7Q-0000000FeR9-2HWq;
	Thu, 18 Jul 2024 03:47:48 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUI7N-0000000FePT-1A14
	for linux-mtd@lists.infradead.org;
	Thu, 18 Jul 2024 03:47:47 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-70b1808dee9so239762b3a.2
        for <linux-mtd@lists.infradead.org>; Wed, 17 Jul 2024 20:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721274464; x=1721879264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzLxElrWQ9zwK7gS/JxRiE2f82xa98E1x4NzX0Ply7k=;
        b=TfZWFoBOTuNaRA93b0jx161qtOr3as5ZBw3+6JHpETbcmJ0KIN17HjNqM+FQWLIrBp
         TIUpwLYow8th5WVzOrF6IuPQ+bmAojfxk1Vxtrj2sZtEbIaA2XfGMBE+uGjUyJia4kPQ
         c3GV75ZhozIaDYD0VzW70ZvK/j0iusHFmtC57cu36B/W4hGcK2XrC0N4TzEWIA1XsJ8j
         oBuwnwKzBbG/4Jdkil4m7UZ835Lv0D8fK0+Xme4vuJZMB3d6zffhl/kMzovAfxjV1JnY
         pieo4Ad5b8UGdRP21yATmPKL3pIeFQJlTTyAI2EGlE+M8SgvmPgDfVTkqjecok0HOcaE
         2AJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721274464; x=1721879264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pzLxElrWQ9zwK7gS/JxRiE2f82xa98E1x4NzX0Ply7k=;
        b=Jv4Cq2SCsniSUamkQz1TGM+/zeCsKtFSbjElr25OSgKZrOJFSVD2c0EyEK2xzEcvH/
         6bO7jLUdnMpKhlyqwbX5bZIFKbaot66uOQGXRlsLfgNu0j/R38MGUPbMvjWBlMt4YQVH
         +hkM4wB6MEiyB2Lg62RmmnAyCKDql255FMmAw1mbcRG7SirsnXvqxfEkLzvdUt/sk5LI
         QA0LDfTizmwYB7YG7syLtBZ1eKYdoB+Fj5D0JJ89HTGAQgbB22eTTPlEawYrGTTFdvaW
         hrF9TpPDsop7rRD0NUuRcgnG/v7liTHlflN1psfcxC6EAf/luDt3QWBj3KwfI8d9vOdJ
         eCwg==
X-Gm-Message-State: AOJu0YwL/qi02evJU5nOiAUTDDsPAIhEvBLawWPlv91c9DJlQ8NV/juA
	1yNArpuYu9icjIYLNV/QlPHH+HZVgEYJWLNYpwDHXUn1gJJv6XJL
X-Google-Smtp-Source: AGHT+IFr1OWqAhW4l4NG6tilVdQj6eglU6t3bObxxl3lVgpLLrts4FrIjsoB2bkVwVjv0ARFggj79A==
X-Received: by 2002:a05:6a21:78a2:b0:1c0:f0be:1536 with SMTP id adf61e73a8af0-1c3fddb3cadmr4714398637.40.1721274464165;
        Wed, 17 Jul 2024 20:47:44 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc265f9cccsm62394835ad.66.2024.07.17.20.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 20:47:43 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 65583800D3;
	Thu, 18 Jul 2024 11:56:55 +0800 (CST)
From: AlvinZhou <alvinzhou.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	broonie@kernel.org
Cc: chengminglin@mxic.com.tw,
	leoyu@mxic.com.tw,
	AlvinZhou <alvinzhou@mxic.com.tw>,
	JaimeLiao <jaimeliao@mxic.com.tw>
Subject: [PATCH v9 1/6] mtd: spi-nor: add Octal DTR support for Macronix flash
Date: Thu, 18 Jul 2024 11:46:09 +0800
Message-Id: <20240718034614.484018-2-alvinzhou.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240718034614.484018-1-alvinzhou.tw@gmail.com>
References: <20240718034614.484018-1-alvinzhou.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_204745_763077_93522EBE 
X-CRM114-Status: GOOD (  19.85  )
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

From: AlvinZhou <alvinzhou@mxic.com.tw>

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

Co-developed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
Signed-off-by: AlvinZhou <alvinzhou@mxic.com.tw>
---
 drivers/mtd/spi-nor/macronix.c | 91 ++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index ea6be95e75a5..f039819a5252 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -8,6 +8,24 @@
 
 #include "core.h"
 
+#define MXIC_NOR_OP_RD_CR2	0x71		/* Read configuration register 2 opcode */
+#define MXIC_NOR_OP_WR_CR2	0x72		/* Write configuration register 2 opcode */
+#define MXIC_NOR_ADDR_CR2_MODE	0x00000000	/* CR2 address for setting spi/sopi/dopi mode */
+#define MXIC_NOR_ADDR_CR2_DC	0x00000300	/* CR2 address for setting dummy cycles */
+#define MXIC_NOR_REG_DOPI_EN	0x2		/* Enable Octal DTR */
+#define MXIC_NOR_REG_SPI_EN	0x0		/* Enable SPI */
+
+/* Convert dummy cycles to bit pattern */
+#define MXIC_NOR_REG_DC(p) \
+	((20 - (p)) >> 1)
+
+/* Macronix write CR2 operations */
+#define MXIC_NOR_WR_CR2(addr, ndata, buf)			\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(MXIC_NOR_OP_WR_CR2, 0),	\
+		   SPI_MEM_OP_ADDR(4, addr, 0),			\
+		   SPI_MEM_OP_NO_DUMMY,				\
+		   SPI_MEM_OP_DATA_OUT(ndata, buf, 0))
+
 static int
 mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 			    const struct sfdp_parameter_header *bfpt_header,
@@ -185,6 +203,78 @@ static const struct flash_info macronix_nor_parts[] = {
 	}
 };
 
+static int macronix_nor_octal_dtr_en(struct spi_nor *nor)
+{
+	struct spi_mem_op op;
+	u8 *buf = nor->bouncebuf, i;
+	int ret;
+
+	/* Use dummy cycles which is parse by SFDP and convert to bit pattern. */
+	buf[0] = MXIC_NOR_REG_DC(nor->params->reads[SNOR_CMD_READ_8_8_8_DTR].num_wait_states);
+	op = (struct spi_mem_op)MXIC_NOR_WR_CR2(MXIC_NOR_ADDR_CR2_DC, 1, buf);
+	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
+
+	/* Set the octal and DTR enable bits. */
+	buf[0] = MXIC_NOR_REG_DOPI_EN;
+	op = (struct spi_mem_op)MXIC_NOR_WR_CR2(MXIC_NOR_ADDR_CR2_MODE, 1, buf);
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
+		if (buf[i * 2] != buf[(i * 2) + 1] || buf[i * 2] != nor->info->id->bytes[i])
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
+	buf[0] = MXIC_NOR_REG_SPI_EN;
+	buf[1] = 0x0;
+	op = (struct spi_mem_op)MXIC_NOR_WR_CR2(MXIC_NOR_ADDR_CR2_MODE, 2, buf);
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
+	return enable ? macronix_nor_octal_dtr_en(nor) : macronix_nor_octal_dtr_dis(nor);
+}
+
 static void macronix_nor_default_init(struct spi_nor *nor)
 {
 	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
@@ -194,6 +284,7 @@ static int macronix_nor_late_init(struct spi_nor *nor)
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
