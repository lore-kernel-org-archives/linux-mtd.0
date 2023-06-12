Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EDCC7EE2E
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jun 2023 10:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=obUIbs9pbhc+TBZcvRMOtHpO99SP0YE0qx2+Yh5j4OA=; b=UUnuhX0+FFrml5
	Ps3Toh7BgiKC5G9XTq9BwPUGzAGxlQBNJ5UXTCAHjPRIg8ata1L720w4ig6Taq9K/zo7bCpFFG9i5
	TvXRSLAJ3TWj38FdS4EoVDaUZZkwtGNSFOgdinCAAe4zzZFpCqcNi1pD/hW0zw5u7vJvTTU9SK8fG
	4vFE7giCX4noNaWDFw+4rIOs9KuqZdNsabYLphSDD6W5X7FwcE+lry1hWhPFOVuvWA4FlCFI6kN+M
	gnr36OqpYzBmAGK9AdYlb4EcjO9gfLvCURz/ixO/nM3us8dZYMeNDHoSqDgAZCiPoxMVcxEDCSPYv
	qU6FthH9LHX6OvlPX9QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8ePi-003QIJ-0x;
	Mon, 12 Jun 2023 10:04:42 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8ePg-003QGt-0M
	for linux-mtd@lists.infradead.org;
	Mon, 12 Jun 2023 10:04:41 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-650c89c7e4fso4435518b3a.0
        for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2023 03:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686564278; x=1689156278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ksmcxBAeF5aEpeseKLZqTKVYNSqlTdX2jGFyZUt/Vg=;
        b=lmP5GUaJvG8uNHgegCFbj0MzSNpsrDZFdqGE0E5QfLZeA13mgvS5mDzmfWiG+6D9Hr
         b+ZYXD/LlXAe+/xCSw8vzXBPFJwxJX2P7O/5wB/gW0DiZ5EMVxkhru39DrCT4HQMiGWy
         TuI5ERh1lwBSOkqOtEsxlbLl7kgn7jnmsZ8OgToc6K0jJZdDgXzdLGYjjGr1hMrn5Lo7
         72gUpA9jOLxJSzoFudqEa42Cf3+3p279aLs5QrjD/srpQGeuYqxGvWoTa4nANp0FGr23
         lp9YKjij5TdPy9xeKLgH5B8T2qLAsLydmd7GYksJq8xt7B94ias6eD/fW1N3tCs10CKv
         wY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686564278; x=1689156278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ksmcxBAeF5aEpeseKLZqTKVYNSqlTdX2jGFyZUt/Vg=;
        b=KsOoOUrzjhxpby9jY3ka1/f0e3SCxSbP5ugV4pChpjWf5C5nqnHUg55l6a1Y5TWfH+
         G/KbZ9KW2cZpXDrEe5InHcG1M9VKGAScbyR+XTN+IU+GgLXoh42lXr9hBXzkR//mPo3y
         eZ8CmVCrFAu1aaqkB3R9L+jdPb51e8hCJa6NMptmmV9lWaEaiX7xcEOVKW9Lm7Y01I4R
         7Ogofui5c5wzqkpnuUUsYY3xR0S+Hq8Bq6W4ipijSFQGKp5xvhwslwoQKAmeBc0jxzeB
         EkBBFsUX/bUpmGp6AKHb/HAH6x2RVMH9KqNyAazNOxgqve1UVAtfVJNhDF3XLjyKqSo2
         sbgg==
X-Gm-Message-State: AC+VfDyqx5vr0Yrvy6mR0Hu8twqVho1BdHe0YsKSwFnt/FS8sYXSN3Lg
	ncCvqrA7bJ9GRgnIx8aVeBJCihvEFOQ=
X-Google-Smtp-Source: ACHHUZ6NY/KaZhBwHsntssezQ4UBDgXEoP1TCPk9b2ZJ1HlQtyo4CBXbWKopP5dBQ7daF3n4bMTrkQ==
X-Received: by 2002:a05:6a20:8e13:b0:10b:4539:fa0a with SMTP id y19-20020a056a208e1300b0010b4539fa0amr11640586pzj.1.1686564278298;
        Mon, 12 Jun 2023 03:04:38 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id 17-20020aa79211000000b00662610cf7a8sm6723376pfo.172.2023.06.12.03.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 03:04:37 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	d-gole@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH 2/5] mtd: spi-nor: spansion: Rework octal_dtr_enable()
Date: Mon, 12 Jun 2023 19:04:06 +0900
Message-Id: <381f7f66c68136a2de1d768b44fb6bcf9eebbebe.1686557139.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686557139.git.Takahiro.Kuwano@infineon.com>
References: <cover.1686557139.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_030440_147305_FEF06DEB 
X-CRM114-Status: GOOD (  16.83  )
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

S28HS02GT is multi-chip package (MCP) device that requires Octal DTR
configuraion for each die. As preparation for MCP support, this patch
replaces cypress_nor_octal_dtr_en/dis() with cypress_nor_setup_memlat()
and cypress_nor_setup_opiddr(). And the ID check part is moved to
cypress_nor_octal_dtr_enable().

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 118 +++++++++++++++++----------------
 1 file changed, 62 insertions(+), 56 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 7804be3a9f2a..0daa3a357ae8 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -156,7 +156,7 @@ static int cypress_nor_sr_ready_and_clear(struct spi_nor *nor)
 	return 1;
 }
 
-static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
+static int cypress_nor_setup_memlat(struct spi_nor *nor)
 {
 	struct spi_mem_op op;
 	u8 *buf = nor->bouncebuf;
@@ -178,67 +178,37 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
 					  SPINOR_REG_CYPRESS_CFR2V, 1, buf);
 
-	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
-	if (ret)
-		return ret;
-
-	nor->read_dummy = 24;
-
-	/* Set the octal and DTR enable bits. */
-	buf[0] = SPINOR_REG_CYPRESS_CFR5_OCT_DTR_EN;
-	op = (struct spi_mem_op)
-		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
-					  SPINOR_REG_CYPRESS_CFR5V, 1, buf);
-
-	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
-	if (ret)
-		return ret;
-
-	/* Read flash ID to make sure the switch was successful. */
-	ret = spi_nor_read_id(nor, nor->addr_nbytes, 3, buf,
-			      SNOR_PROTO_8_8_8_DTR);
-	if (ret) {
-		dev_dbg(nor->dev, "error %d reading JEDEC ID after enabling 8D-8D-8D mode\n", ret);
-		return ret;
-	}
-
-	if (memcmp(buf, nor->info->id, nor->info->id_len))
-		return -EINVAL;
-
-	return 0;
+	return spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
 }
 
-static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
+static int cypress_nor_setup_opiddr(struct spi_nor *nor, bool enable)
 {
 	struct spi_mem_op op;
 	u8 *buf = nor->bouncebuf;
-	int ret;
-
-	/*
-	 * The register is 1-byte wide, but 1-byte transactions are not allowed
-	 * in 8D-8D-8D mode. Since there is no register at the next location,
-	 * just initialize the value to 0 and let the transaction go on.
-	 */
-	buf[0] = SPINOR_REG_CYPRESS_CFR5_OCT_DTR_DS;
-	buf[1] = 0;
-	op = (struct spi_mem_op)
-		CYPRESS_NOR_WR_ANY_REG_OP(nor->addr_nbytes,
-					  SPINOR_REG_CYPRESS_CFR5V, 2, buf);
-	ret = spi_nor_write_any_volatile_reg(nor, &op, SNOR_PROTO_8_8_8_DTR);
-	if (ret)
-		return ret;
 
-	/* Read flash ID to make sure the switch was successful. */
-	ret = spi_nor_read_id(nor, 0, 0, buf, SNOR_PROTO_1_1_1);
-	if (ret) {
-		dev_dbg(nor->dev, "error %d reading JEDEC ID after disabling 8D-8D-8D mode\n", ret);
-		return ret;
+	if (enable) {
+		/* Set the octal and DTR enable bits. */
+		buf[0] = SPINOR_REG_CYPRESS_CFR5_OCT_DTR_EN;
+		op = (struct spi_mem_op)
+			CYPRESS_NOR_WR_ANY_REG_OP(nor->params->addr_mode_nbytes,
+						  SPINOR_REG_CYPRESS_CFR5V, 1,
+						  buf);
+	} else {
+		/*
+		 * The register is 1-byte wide, but 1-byte transactions are not
+		 * allowed in 8D-8D-8D mode. Since there is no register at the
+		 * next location, just initialize the value to 0 and let the
+		 * transaction go on.
+		 */
+		buf[0] = SPINOR_REG_CYPRESS_CFR5_OCT_DTR_DS;
+		buf[1] = 0;
+		op = (struct spi_mem_op)
+			CYPRESS_NOR_WR_ANY_REG_OP(nor->addr_nbytes,
+						  SPINOR_REG_CYPRESS_CFR5V, 2,
+						  buf);
 	}
 
-	if (memcmp(buf, nor->info->id, nor->info->id_len))
-		return -EINVAL;
-
-	return 0;
+	return spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
 }
 
 static int cypress_nor_quad_enable_volatile_reg(struct spi_nor *nor, u64 addr)
@@ -642,8 +612,44 @@ static struct spi_nor_fixups s25hx_t_fixups = {
  */
 static int cypress_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
 {
-	return enable ? cypress_nor_octal_dtr_en(nor) :
-			cypress_nor_octal_dtr_dis(nor);
+	int ret;
+	u8 naddr, ndummy;
+	enum spi_nor_protocol proto;
+
+	if (enable) {
+		ret = cypress_nor_setup_memlat(nor);
+		if (ret)
+			return ret;
+
+		nor->read_dummy = 24;
+	}
+
+	ret = cypress_nor_setup_opiddr(nor, enable);
+	if (ret)
+		return ret;
+
+	/* Read flash ID to make sure the switch was successful. */
+	if (enable) {
+		naddr = nor->addr_nbytes;
+		ndummy = 3;
+		proto = SNOR_PROTO_8_8_8_DTR;
+	} else {
+		naddr = 0;
+		ndummy = 0;
+		proto = SNOR_PROTO_1_1_1;
+	}
+
+	ret = spi_nor_read_id(nor, naddr, ndummy, nor->bouncebuf, proto);
+	if (ret) {
+		dev_dbg(nor->dev, "error %d reading JEDEC ID after %s 8D-8D-8D mode\n",
+			ret, enable ? "enabling" : "disabling");
+		return ret;
+	}
+
+	if (memcmp(nor->bouncebuf, nor->info->id, nor->info->id_len))
+		return -EINVAL;
+
+	return 0;
 }
 
 static int s28hx_t_post_sfdp_fixup(struct spi_nor *nor)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
