Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F7FC0015E
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 09:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3bF/hBb0bmY5K8eml0KY6j7ud8fWYPFzVLtiU+eYecM=; b=oVf1PCYOsn4Ji0
	E0ZBPGP8d7wh2e/6Zq1aGRJ1uqY5mZ/RP45U9zLS4BiunVbrubt/d7jgRl4CPCceFcNugg/FoZqAD
	omXtftparuIueNnmDEF933lcic8UeDPHkRDCcL1+vaMjwJu/AIzKMUWuNrZFXh1sMRcXMEX12UwZh
	K7OKKrwL5GmISde/2qY8WbJS++WGbv8TB2Jnz0/WVIP/cls7tZM3YWnE+/ZaKMq/8+A9+Q2x9F43j
	sO6WGUOTWfvlgMFfIq2z2l5T31v2uBl/qicDvItjIBi/p5vm4eYJgiPuq/waXh8yivzPyM9IW5ksy
	7/8RJfKIH3TjG/EyWKFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOx79-00CoOA-1D;
	Thu, 27 Jul 2023 09:16:55 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOx74-00CoJN-0M
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 09:16:52 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-55c85b4b06bso384494a12.2
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 02:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690449407; x=1691054207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qBPyE5gxQ/zSPAkyIeG4+4ryn3ul5Iv7XPLjClEuFMA=;
        b=b/Mh9nHA8qVvj+AbIKFrJtP3Mb4BXISgn3nDIoio42xL7H83FJX67n/anLz0OjcwBx
         YI9LcCUL82pCUnx1h1j6+7sRHOMgdl4IjzD7RWzSd2cEhKgbiFM7lJvBsvheaRz+f2Gx
         UOndLCwN9FiKdcEX4Y1idK7eI/n2+oBtkCYEcACmHsmbYBe3HIi2vRLEnu80xlyoupuK
         A2cuKs1c5mphuBxnebjml5DnjmYKtT3ZipG+KeHnbmbW3E9OeT8is1Trjpyy6cn9Z33p
         R9omXpmhzkOOYSH0bY5JP5tACVYLILgpk3+VHUhUMnGl+24u+RJmPX/kD8xkhGCTki3+
         YdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690449407; x=1691054207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qBPyE5gxQ/zSPAkyIeG4+4ryn3ul5Iv7XPLjClEuFMA=;
        b=ctr10+GEfly5t5l0ikZRFvLillASKVa2BXmT51Kgjndi08+xcWasBslQ1yng8pKvyG
         67+4ogqUgkMEVko3q1VQhAYvCs2NL9nJIWX5HQxPbWQryv9iackHe5g6FuK5WXdOsD5x
         aWQnalHbzRg+r7/qkg+F1t4w2vQDDPIMLvUvlkVHKESOjxlEHJlbwyDg8DnHhnxBNqfB
         ZfnNf3MMa3ybMjNtoXBbuo1SBplF5PXTtj1vkGV4UXzo+6xi0QQrdgvRrDKByK7Cxmfn
         K5joKwpCzGzQRRJss9PoPCPvFhCTzG8q7Eto7EUj+d4EgBeJkZtNGPLZg6Q8fMkogVni
         4xYQ==
X-Gm-Message-State: ABy/qLaTqOuLysgs/4MHwkinyVBm7qBlnB00tZM84egg+ck7hVSU7V8v
	965q7eNs/jvI7cV4TKqrYeM=
X-Google-Smtp-Source: APBJJlE4/H/x6sjVZegplERisuyuegTzOZtZE+ikoVScBP2CzNl440z7QRq3UcqP+bUB2Yqg/vPTAQ==
X-Received: by 2002:a05:6a20:7494:b0:137:93d7:6ab7 with SMTP id p20-20020a056a20749400b0013793d76ab7mr3992097pzd.30.1690449407094;
        Thu, 27 Jul 2023 02:16:47 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9-20020aa78689000000b0064fa2fdfa9esm1019508pfo.81.2023.07.27.02.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 02:16:46 -0700 (PDT)
Received: from linux-patcher.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 3780C808AA;
	Thu, 27 Jul 2023 17:15:47 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	JaimeLiao <jaimeliao@mxic.com.tw>
Subject: [PATCH v2 1/2] mtd: spi-nor: add Octal DTR support for Macronix flash
Date: Thu, 27 Jul 2023 17:16:09 +0800
Message-Id: <20230727091610.234132-2-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230727091610.234132-1-jaimeliao.tw@gmail.com>
References: <20230727091610.234132-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_021650_157762_BBEF26F5 
X-CRM114-Status: GOOD (  18.06  )
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

For enable Macronix flashes in Octal DTR mode, Configuration
Register2 DOPI bit should be set and DC bit setting for dummy
cycles.

Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
Co-developed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/macronix.c | 97 ++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 04888258e891..b397fd274868 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -8,6 +8,22 @@
 
 #include "core.h"
 
+#define SPINOR_OP_MXIC_RD_ANY_REG	0x71		/* Read volatile configuration register 2 */
+#define SPINOR_OP_MXIC_WR_ANY_REG	0x72		/* Write volatile configuration register 2 */
+#define SPINOR_REG_MXIC_CR2_MODE	0x00000000	/* For setting octal DTR mode */
+#define SPINOR_REG_MXIC_CR2_DC		0x00000300	/* For setting dummy cycles */
+#define SPINOR_REG_MXIC_OPI_DTR_EN	0x2		/* Enable Octal DTR */
+#define SPINOR_REG_MXIC_SPI_EN		0x0		/* Enable SPI */
+#define SPINOR_REG_MXIC_DC_20		0x0		/* Setting dummy cycles to 20 */
+#define SPINOR_REG_MXIC_ADDR_BYTES	4		/* Fixed R/W volatile address bytes to 4 */
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
@@ -105,9 +121,90 @@ static const struct flash_info macronix_nor_parts[] = {
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 };
 
+static int macronix_nor_octal_dtr_en(struct spi_nor *nor)
+{
+	struct spi_mem_op op;
+	u8 *buf = nor->bouncebuf, i;
+	int ret;
+
+	/* Use 20 dummy cycles for memory array reads. */
+	buf[0] = SPINOR_REG_MXIC_DC_20;
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
+	nor->params->octal_dtr_enable = macronix_nor_octal_dtr_enable;
 }
 
 static void macronix_nor_late_init(struct spi_nor *nor)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
