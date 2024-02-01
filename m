Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14554C47DDB
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Feb 2024 09:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=egyKdqmhqMvuKYK1ewm+m81JyFGXbLTI6TtpGAtwXm4=; b=x6mOvhcZWK9u2R
	ZrBFOYH6jUh/HJBNoew11WKjhUINlJKuj0XGnMmDyUbz1PodsCQfuh3j+jriC1nh50oVzdPIy34Qp
	6ufzfiIDkJmBw327Qw5SSdi1tpz1QLSoahlaQ5xYQdksCuwmUaDfmShUk5Xe2DVG+uBmbk3igJ3vf
	GgJssWMHWwCDIxF/WDZ/gUzGFJ1U02Cf9qIcFxFtzrkfkfBto3DWiwje/CL5JKOFwilivAT4Z97/E
	ryKti6ZDDX2LILRVdJ6gThFt9edqc6Pzu8BngToeDnyoBCLsuVWB76qFDNF/fxVpOxpzhJd/WBe1h
	G2qpRg67Fs8EXN9nHw/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVTc6-00000007K5q-3lP4;
	Thu, 01 Feb 2024 09:44:06 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVTc3-00000007K3Q-0SNs
	for linux-mtd@lists.infradead.org;
	Thu, 01 Feb 2024 09:44:04 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5d8b276979aso530920a12.2
        for <linux-mtd@lists.infradead.org>; Thu, 01 Feb 2024 01:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706780641; x=1707385441; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BwZAV3NIoDVdtDo0hEnlccNiKcSAuJpwvstHeklmZU=;
        b=TTWQZvBtAqv04BXLSxVYonyIsCX0bmkeXjwuhn71OdplZ7jBpD4j6uj0+hSDCb5qjb
         /MRTWsEtDWRxdewc3s6nSZE5VpJ1PHWGC9uDppwlg8BcaJeURa7Dag7z5Jz/K6HzacrZ
         CrLiVFeGP97qYWC0/TCSaKN53llqwtgUfnLvbrMuZ0iF+GRBWfR3cexksQShOUHo+Hxy
         rVXkLONy/bl1csRnY5byDrbxeXmpaDsWSU/nFr5oryRE5bXKORqfMSHZG3/q5Mq4B4jR
         XjIbaWgveiVaV2PW1f17Qx7YEwjJsvCuBKutiVSXPtBRgRo/P9SCUKteE1SQ32Ssh3LJ
         4vig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706780641; x=1707385441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/BwZAV3NIoDVdtDo0hEnlccNiKcSAuJpwvstHeklmZU=;
        b=PkEXPnuCCuF05Flj/pwvn696CDzfSK3t306WdXQXYJ9wPF4Zla0glOArYC8y23D/8/
         NphcP0wK1NRA9gX+Ug87IsKYYNrce0uHfaHBF6XSYl2Y6WSYfFxjvyY8F8rab3soKsJF
         5wiTg0+4yIwMN3W8HYSU5Y+bJ3aiqLGbHjld0BR4N4ec417UqpAkwv16m3pJlYR0GOmo
         oEsw5De7BSem5CkJ9/AzJ+NDXFmcQr3dCtgpeW8A97K/Wz6yjWrHzkmuqg5QLyX5dsNB
         jVkusLPICRaTg9nlTDEl85zz3EEQlfM0S/4omCyWFt3pbQ600hD19Nfm6cvlHKGzem9H
         QOow==
X-Gm-Message-State: AOJu0Yxln9TdEJllHRd8L87z8gK7cnq2uBfq8fTCKBexK2I/OrbMJgaQ
	Onf28AG8g4NM0deUz8w5wC11PPNgMAwX7zrnykCBVc7M84DYXqU7
X-Google-Smtp-Source: AGHT+IGa3xXJ02wWLHWB9JdeXCbgHUy/p/uqnVlX+SQX/VuU6o+dSvF2hgmOPGCsWsDsMyQDkqQetg==
X-Received: by 2002:a17:90a:be0e:b0:295:cd91:1314 with SMTP id a14-20020a17090abe0e00b00295cd911314mr4264292pjs.1.1706780641301;
        Thu, 01 Feb 2024 01:44:01 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVFGPogJoeAj0GiG82znaKn2YQOJ6mfFLndDPsCvY2mDZJOV0e5OM0Z8LcuVON8th67anqeFIduRTK0In3sjfLZ4gaMRHOW+27RNDnMtZxl87xohPqeEBruHct2eQvTkIIqwh1Dz4Oxthy8vguRDatUkwiVtkddMmJO3ZP0rMj3k8Z9Q0JiJBXtAKu9hu3HZF8869E06SeSbEHHMAy7zqeSHTSD+cR8HGejGSoYBNs5uQcInHkN0UR+y3jhoGbNOGrAVPL0uF3PLFqW0PWJAYu++a8rxtvCSb2HPLlftTopBwRw72pAb0Axb2dkAbNFnh7rqg==
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id j4-20020a17090a31c400b002961fc85e6bsm599979pjf.23.2024.02.01.01.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 01:44:01 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 4A8978074F;
	Thu,  1 Feb 2024 17:50:01 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	broonie@kernel.org
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v8 1/9] mtd: spi-nor: add Octal DTR support for Macronix flash
Date: Thu,  1 Feb 2024 17:43:45 +0800
Message-Id: <20240201094353.33281-2-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240201094353.33281-1-jaimeliao.tw@gmail.com>
References: <20240201094353.33281-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_014403_180144_5B5E66F0 
X-CRM114-Status: GOOD (  20.40  )
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

Co-developed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
Acked-by: Michael Walle <mwalle@kernel.org>
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
