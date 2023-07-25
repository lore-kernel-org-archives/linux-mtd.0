Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3CDC001DF
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jul 2023 02:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8/vvkxRZEijk0SwVU70rwdodIPeqo8+jzNNf2UvnNWM=; b=qEIAx7PnciXtBj
	UX1ruwtK9Kmjtkxbb5dfIabgMq94pvJEG/B/cFGJHXrEusvTSEs1+ZG52ECgdoIQDaBKGZd/fwJsz
	Jxywzwbe9QKmCMC4PGoy5TYjd/HNNSMs580VIG1GFhhTPg4JOjfLeveP0DwmhAhy9mS2ut0tfzfEi
	yJdEJ/OatVzQXcsp1sxZmTF8APpghfYO4nZtvJLxMtQdjE/9UXaHTijEaMs2grfjIBYdWXfZsk91K
	rXr43oNW8NUWbAvJy3RY6596doELf37ey0K4rmCnwcW4CNY3CXYHBo5JmqnWGL5LXkm7olDoKdkQl
	0xusjlpILYM4gXJeXG3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO7iA-005ts4-1u;
	Tue, 25 Jul 2023 02:23:42 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO7i5-005tqq-0f
	for linux-mtd@lists.infradead.org;
	Tue, 25 Jul 2023 02:23:38 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bb81809ca8so22437135ad.3
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 19:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690251816; x=1690856616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zobaIRhTbAwnUiXlFiBM748j6X72wdRlOo58XPnGSgg=;
        b=VyP2rB4NO801D/78tEEHvp9USQUyVmL3V2itqe3AJJ/KQf2cp+UiHlu172t1+zo3xj
         TNKlMYi+D69Qs/6dtuJPaEIq5dKYdO1sC91lclNN10TU2uy1G5NfuobKcdb8XOjIShT0
         LEDyo2k6Duk/Xw+1/0DbYUc7Tra8G60BKX13922L1EVdFoH8kvAsDXN49TnZKB03J4Y4
         FRW2T3ulFAtelrfhmgEcwywfh7g1wMo+eQVZnBDLwfWDK2DUoPqaX9MfnSFtG2SYthHB
         TGJOsB9z9HdKU30NXAIXZIuyWiipj7e4tKvBTdyPgDzI9nATWFdN+O066PXw/4ALJIHJ
         G1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690251816; x=1690856616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zobaIRhTbAwnUiXlFiBM748j6X72wdRlOo58XPnGSgg=;
        b=cK2f/Z+i2Aqx+9jX9s7b7HollJtAsAiuynxRy3FftJnZgQNyoVZy0e/liCW2eVDjB7
         32i9+mexxYl0fY+ZsF5uY7jDPqOa+TydeKypKZXZezPdmeZHecyPLW8Ekm1ZPkaM00R9
         QhZDLxDkV6IJJn1HXwiaZ1v8owj9gvm4/yqSmeMhANiQxiohb+R1mDXktnkIcGjCIdr1
         Todb/XRQkG430mTDHPRTx82YffPDfBrLNfJCj5ZxVFu1cn+2XfrE4MagRh9xqO+zIYmY
         FdQbpO6ZJ9Krj+a3zOZdeFKwaRMdlo2Vw97+AuwhVGtkw6iJVc8wMlzpF1rJuaPEXTNb
         Au5Q==
X-Gm-Message-State: ABy/qLaqvhpW5YXzXdA7prZQMOrG/Cz2Fdmzv2e6m5QCenhi4f/z/kFw
	grEIHpeeXxjq85kX0l75aIA=
X-Google-Smtp-Source: APBJJlH6XLAmr4RtTSbnqw1O+BIbpzNHTHV3Zu4O8APDGmkEpIMkxnoCpWiEZLJ4Y0zaYnUrYYHrYA==
X-Received: by 2002:a17:902:d2c5:b0:1b6:68bb:6ad0 with SMTP id n5-20020a170902d2c500b001b668bb6ad0mr13432045plc.55.1690251815752;
        Mon, 24 Jul 2023 19:23:35 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id t18-20020a1709028c9200b001b866472e8dsm9620305plo.241.2023.07.24.19.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 19:23:35 -0700 (PDT)
Received: from linux-patcher.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id E419C80B31;
	Tue, 25 Jul 2023 10:22:39 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	JaimeLiao <jaimeliao.tw@gmail.com>
Subject: [PATCH v1 1/2] mtd: spi-nor: add Octal DTR support for Macronix flash
Date: Tue, 25 Jul 2023 10:23:01 +0800
Message-Id: <20230725022302.210275-2-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230725022302.210275-1-jaimeliao.tw@gmail.com>
References: <20230725022302.210275-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_192337_246040_515E38F4 
X-CRM114-Status: GOOD (  18.23  )
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

From: JaimeLiao <jaimeliao.tw@gmail.com>

Enable Octal DTR mode with 20 dummy cycles to allow running
at the maximum supported frequency for adding Macronix flash
in Octal DTR mode.

Signed-off-by: JaimeLiao <jaimeliao.tw@gmail.com>
Co-authored-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/macronix.c | 77 ++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 04888258e891..9010b81e098f 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -8,6 +8,12 @@
 
 #include "core.h"
 
+#define SPINOR_OP_RD_CR2		0x71		/* Read configuration register 2 */
+#define SPINOR_OP_WR_CR2		0x72		/* Write configuration register 2 */
+#define SPINOR_REG_MXIC_CR2_MODE	0x00000000	/* For setting octal DTR mode */
+#define SPINOR_REG_MXIC_OPI_DTR_EN	0x2		/* Enable Octal DTR */
+#define SPINOR_REG_MXIC_SPI_EN		0x0		/* Enable SPI */
+
 static int
 mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 			    const struct sfdp_parameter_header *bfpt_header,
@@ -32,6 +38,76 @@ static const struct spi_nor_fixups mx25l25635_fixups = {
 	.post_bfpt = mx25l25635_post_bfpt_fixups,
 };
 
+/**
+ * spi_nor_macronix_octal_dtr_enable() - Enable octal DTR on Macronix flashes.
+ * @nor:		pointer to a 'struct spi_nor'
+ * @enable:		whether to enable Octal DTR or switch back to SPI
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_macronix_octal_dtr_enable(struct spi_nor *nor, bool enable)
+{
+	struct spi_mem_op op;
+	u8 *buf = nor->bouncebuf, i;
+	int ret;
+
+	/* Set/unset the octal and DTR enable bits. */
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
+	if (enable) {
+		buf[0] = SPINOR_REG_MXIC_OPI_DTR_EN;
+	} else {
+		/*
+		 * The register is 1-byte wide, but 1-byte transactions are not
+		 * allowed in 8D-8D-8D mode. Since there is no register at the
+		 * next location, just initialize the value to 0 and let the
+		 * transaction go on.
+		 */
+		buf[0] = SPINOR_REG_MXIC_SPI_EN;
+		buf[1] = 0x0;
+	}
+
+	op = (struct spi_mem_op)
+		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_CR2, 1),
+			   SPI_MEM_OP_ADDR(4, SPINOR_REG_MXIC_CR2_MODE, 1),
+			   SPI_MEM_OP_NO_DUMMY,
+			   SPI_MEM_OP_DATA_OUT(enable ? 1 : 2, buf, 1));
+
+	if (!enable)
+		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
+
+	ret = spi_mem_exec_op(nor->spimem, &op);
+	if (ret)
+		return ret;
+
+	/* Read flash ID to make sure the switch was successful. */
+	op = (struct spi_mem_op)
+		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
+			   SPI_MEM_OP_ADDR(enable ? 4 : 0, 0, 1),
+			   SPI_MEM_OP_DUMMY(enable ? 4 : 0, 1),
+			   SPI_MEM_OP_DATA_IN(SPI_NOR_MAX_ID_LEN, buf, 1));
+
+	if (enable)
+		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
+
+	ret = spi_mem_exec_op(nor->spimem, &op);
+	if (ret)
+		return ret;
+
+	if (enable) {
+		for (i = 0; i < nor->info->id_len; i++)
+			if (buf[i * 2] != nor->info->id[i])
+				return -EINVAL;
+	} else {
+		if (memcmp(buf, nor->info->id, nor->info->id_len))
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
 static const struct flash_info macronix_nor_parts[] = {
 	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1)
@@ -108,6 +184,7 @@ static const struct flash_info macronix_nor_parts[] = {
 static void macronix_nor_default_init(struct spi_nor *nor)
 {
 	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
+	nor->params->octal_dtr_enable = spi_nor_macronix_octal_dtr_enable;
 }
 
 static void macronix_nor_late_init(struct spi_nor *nor)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
