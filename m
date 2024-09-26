Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08D8CDE00B
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 14:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kp20bLaA25icVHCTxEZh+6D6n3neAm7P/axMYMnJtUU=; b=R2MRmchDHjXbyn
	v5vhoTpCTN5Y/AfTFyhKRoj/7O6RkxBSn9uh888Imp53521lkmJRvursQa/u7YejCnKOFakPcX8AG
	f/NVStkqTyY3XumLlhgHhWD86hzCQZrWMLCEpcA2MTrPmuXT0bS7IQo+hsN+XirghP5nIfFPievV8
	ffy1VXA9zhUk5XeG+v5qb5kjQP2N8wRvowM6A/FLNkkuyYpzUM6y6bxUPK+Ix5BH5Sbs8Bnezybqa
	qOlfTYNcJR2UtavK5oc+nkqNL7OTkB5iDcQr6uEvZNZNEoi5/gjm/eHBjmkejBj1cHxeMKOlUwupe
	dVRYif/gmo7KB22IUYrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stpQj-00000008aOS-3epC;
	Thu, 26 Sep 2024 14:25:17 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stpQg-00000008aMG-1ork
	for linux-mtd@lists.infradead.org;
	Thu, 26 Sep 2024 14:25:15 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2e0a950e2f2so391150a91.2
        for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2024 07:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727360713; x=1727965513; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MNbHUjaElO2sctpFFvlUsXRoBevroY7p0SuuxxIX0Q=;
        b=hnsTG+f+6CTB5X8fvy4RTOXc0L2aV7xxrv0JeWYbAyYAngvYz0FlQ16sHEou/0zhwa
         RBofWq8I/9EAb7hfV2GhfsIE3AW/BF5wWVoLfwU0tmjQxYdqDakjbKMDTaOuGzF1XU53
         WsDqfLD9VaMfOAyxoAbeNdjzl1Hjx8KzL0/uk7sM5ZgsKc2v9i1jCsO79dr3zEmb0Fdx
         wwgi2PZ0tPLx+dz02mRnr7MzvWAK1Xj5Cka6o91P+Et8A14H80iXmyIOA+2G6+FqoncX
         sofzUjrVkB3AIFTBJafHR+d/NZqgYku+Fby4xz3Y1/0lmwRIw7dnL58fGj3iixmCmXP8
         WdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727360713; x=1727965513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7MNbHUjaElO2sctpFFvlUsXRoBevroY7p0SuuxxIX0Q=;
        b=nXRyH9Aqiz9xZdCxHRq8kTjTgSpOjdhPVFU9VPJbD8s6bHYPGGqzkcdmsjgq3h6Ft8
         5D30t35GUGf6xJUS66l/nZ1etlHQNruKKcAMQ9Xjrm9WMeP8nq2UxkFundOX7Of+Xl2x
         WBLAY+dKP8vtfBH+SeJN1P2ORyaRORcb3EkZnNlwgtbwtVTOMBNZehojU7OoxQKFWxuf
         7UkRf7ggh12v3RS53yQLXjBPTrxCoriQZ0pDjraamY7MpKL7MIrzm99fooqm6yPRjsnx
         BJy6KGJ/FLQTZcWxL4wTix69UfxJ8d0qcjoU32OseaxLryjoyhqiNCkPSHlCy53yi/2j
         kWZA==
X-Gm-Message-State: AOJu0YxOdqEIztJ8SsyN1vKCEZT/h4qkrJumA6hnNG5NqsYwc9RkQDWV
	j+krbRNvpVHqWryUzX8y4W6cPRyIdXi5nEt5wkfDPX94cn6TGAUG
X-Google-Smtp-Source: AGHT+IGQ8aXlt5Srv+G0rBaxkopWyRA/YJw8UA5n/oKow7VUx+iht7yecIrSrolBtJ5uPPIGKRmQSg==
X-Received: by 2002:a17:90b:30ca:b0:2e0:90fe:cc2c with SMTP id 98e67ed59e1d1-2e090feee89mr3719879a91.26.1727360713363;
        Thu, 26 Sep 2024 07:25:13 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0b6c4bc3bsm49136a91.2.2024.09.26.07.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 07:25:12 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id A847E802C9;
	Thu, 26 Sep 2024 22:32:59 +0800 (CST)
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
Subject: [PATCH v10 1/6] mtd: spi-nor: add Octal DTR support for Macronix flash
Date: Thu, 26 Sep 2024 22:19:51 +0800
Message-Id: <20240926141956.2386374-2-alvinzhou.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240926141956.2386374-1-alvinzhou.tw@gmail.com>
References: <20240926141956.2386374-1-alvinzhou.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_072514_506508_0D3788F7 
X-CRM114-Status: GOOD (  20.22  )
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

Use Read ID to confirm that enabling/disabling octal DTR mode
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
