Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D575C76196
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Apr 2023 06:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zc+F1MlPDsp3nWQfAWJY6EO64r71F8b2wC7wY39XI1w=; b=eLV1cv7cXFwAkl
	h2oMvnHJiIyme955A3G/SSvMEdhCV18q/3KzTLsCJSYnf98Qvb2R7X+DpTYZmPWaa7UdfkPgdDM7G
	Asa0MnU9HVWFxzx6PBtrC2NuOzrqwvDr5byj3+xBVXqE9RiAmZkprZbMmyRsZet3AoLj6yYr26F6M
	j0+CmACr6OI5pJNX5OV/EKT3LgNH/IaLPMz6m0b8onHr4dS9fZG/VuCXpvS0c+aze1112X3jhizqT
	n20rEvLJt7EaF4IhAP9xDKeBv72aJuJxHqXfZ7PnFziMUTSc3n8Morj6XXHRlO4n5v32KM5oyVv+B
	jjAle2vjNwKhQuo/Nd6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkIyR-006THF-0G;
	Thu, 06 Apr 2023 06:19:55 +0000
Received: from mail-pl1-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkIyN-006TDa-0r
	for linux-mtd@lists.infradead.org;
	Thu, 06 Apr 2023 06:19:52 +0000
Received: by mail-pl1-f177.google.com with SMTP id o2so36639100plg.4
        for <linux-mtd@lists.infradead.org>; Wed, 05 Apr 2023 23:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680761989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5qNLrlyHyG7Nplbz8tqvhzEVmTmr0S/5njiSbBjBAI=;
        b=QyjU5S3/26S5ZZk90Q0QqmB/XWMPeiKcE60Mw3IWUedci2kdsXZa/7Wgl4GDumkt1v
         Z+gn5CXo6C/lTiMzbSqkdype+7hjAd1Aqo0XvbfzrC7RngWiHdfvXQcWJrYfTmsPnKLE
         vYUjAFJVrN7fnv+zLABMm7fFOuSxATRgIqwyFH9R57kvtGtw6hyU1RualZBQiw7hqCEz
         GczSdhXmKLirWLnubVDNVgKzTsYCOZqP0PvP5C3Rd6kH/L5qYkfijrqo4pSqCVDXORHC
         fdrQfVorRx9qHPgrxCVHIeLxHlgE/Oda/SW9fUKkpKC6LJuv0ehVxWYWuzYTZjzuk56C
         BXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680761989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5qNLrlyHyG7Nplbz8tqvhzEVmTmr0S/5njiSbBjBAI=;
        b=EVGumUeNzxToNUqtnFKv+waHRexKgcHqs9wRIr3Ci8+vzqCcUW2fHtP6pXTpvqkciu
         WrCIKRQvZSqkBmSbTIpuKAtIz1sX8DNR4Q+hcV4/NPs1VkhdfAsqVYagjl772XGOxyQf
         D2t3MTkXgaLgPMQFfFejDHkgrBSwG+YSJWek0142dsMJd/HKug+mO0Fqx5dSlQEJl3kt
         enhSQ01CnWduwSfXOPJzXyA7HlAT2kF90KpQzXvlfuxHh+BMuv8IWfIXD6njbwnXfyon
         OUde/LuOrsSaPfIH+654AI56ZnSRa4x/8hkK6gftmtnpMkA7PaGAXIzuuVkap3H2EQbv
         krag==
X-Gm-Message-State: AAQBX9e+k6PeghK7Q0IZ2VHDv/zcWbmaK90SAf830OB1lgkDjnb9aWnD
	zv5XudB/DvH0xO8/Lou1nKUV9Ejd4Xv1iw==
X-Google-Smtp-Source: AKy350Yc6C5o5uoa0sVGJCf53VAOQABNJQLO6bTSS4eParHdu78W5v/7aEfzss42HYtsqlK4yVQR+g==
X-Received: by 2002:a05:6a20:2d98:b0:e7:4f8a:d04d with SMTP id bf24-20020a056a202d9800b000e74f8ad04dmr1871897pzb.57.1680761989129;
        Wed, 05 Apr 2023 23:19:49 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-38-119.msd.spmode.ne.jp. [49.98.38.119])
        by smtp.gmail.com with ESMTPSA id 18-20020aa79152000000b0062dbafd2980sm450542pfi.65.2023.04.05.23.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 23:19:48 -0700 (PDT)
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
Subject: [PATCH v3 7/8] mtd: spi-nor: spansion: Add a new ->ready() hook for multi-chip device
Date: Thu,  6 Apr 2023 15:18:58 +0900
Message-Id: <8c76ab26451241f6940ec29ac7280b2339c1d1cb.1680749578.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680749577.git.Takahiro.Kuwano@infineon.com>
References: <cover.1680749577.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_231951_316441_1E5905CF 
X-CRM114-Status: GOOD (  22.90  )
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

For multi-chip devices, we need to make sure the all dice in the device
are ready. The cypress_nor_sr_ready_and_clear() reads SR in each die and
returns true only when all dice are ready. This function also takes care
for program or erase error handling by reusing spansion_nor_clear_sr().
To do that, spansion_nor_clear_sr() is moved to top.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 109 +++++++++++++++++++++++++--------
 1 file changed, 85 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 91bc0aace516..deb93ab6fe98 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -63,6 +63,84 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_NO_DATA)
 
+/**
+ * spansion_nor_clear_sr() - Clear the Status Register.
+ * @nor:	pointer to 'struct spi_nor'.
+ */
+static void spansion_nor_clear_sr(struct spi_nor *nor)
+{
+	int ret;
+
+	if (nor->spimem) {
+		struct spi_mem_op op = SPANSION_CLSR_OP;
+
+		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
+						       NULL, 0);
+	}
+
+	if (ret)
+		dev_dbg(nor->dev, "error %d clearing SR\n", ret);
+}
+
+static int cypress_nor_sr_ready_and_clear_reg(struct spi_nor *nor, u64 addr)
+{
+	struct spi_mem_op op =
+		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes, addr,
+					  0, nor->bouncebuf);
+	int ret;
+
+	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
+
+	if (nor->bouncebuf[0] & (SR_E_ERR | SR_P_ERR)) {
+		if (nor->bouncebuf[0] & SR_E_ERR)
+			dev_err(nor->dev, "Erase Error occurred\n");
+		else
+			dev_err(nor->dev, "Programming Error occurred\n");
+
+		spansion_nor_clear_sr(nor);
+
+		ret = spi_nor_write_disable(nor);
+		if (ret)
+			return ret;
+
+		return -EIO;
+	}
+
+	return !(nor->bouncebuf[0] & SR_WIP);
+}
+/**
+ * cypress_nor_sr_ready_and_clear() - Query the Status Register of each die by
+ * using Read Any Register command to see if the whole flash is ready for new
+ * commands and clear it if there are any errors.
+ * @nor:	pointer to 'struct spi_nor'.
+ *
+ * Return: 1 if ready, 0 if not ready, -errno on errors.
+ */
+static int cypress_nor_sr_ready_and_clear(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+	u64 addr;
+	int ret;
+	u8 i;
+
+	for (i = 0; i < params->n_dice; i++) {
+		addr = params->vreg_offset[i] + SPINOR_REG_CYPRESS_STR1;
+		ret = cypress_nor_sr_ready_and_clear_reg(nor, addr);
+		if (ret < 0)
+			return ret;
+		else if (ret == 0)
+			return 0;
+	}
+
+	return 1;
+}
+
 static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 {
 	struct spi_mem_op op;
@@ -506,10 +584,16 @@ static int s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
 
 static void s25hx_t_late_init(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
+
 	/* Fast Read 4B requires mode cycles */
-	nor->params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
+	params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
 
 	cypress_nor_ecc_init(nor);
+
+	/* Replace ready() with multi die version */
+	if (params->n_dice)
+		params->ready = cypress_nor_sr_ready_and_clear;
 }
 
 static struct spi_nor_fixups s25hx_t_fixups = {
@@ -741,29 +825,6 @@ static const struct flash_info spansion_nor_parts[] = {
 	},
 };
 
-/**
- * spansion_nor_clear_sr() - Clear the Status Register.
- * @nor:	pointer to 'struct spi_nor'.
- */
-static void spansion_nor_clear_sr(struct spi_nor *nor)
-{
-	int ret;
-
-	if (nor->spimem) {
-		struct spi_mem_op op = SPANSION_CLSR_OP;
-
-		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
-
-		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
-						       NULL, 0);
-	}
-
-	if (ret)
-		dev_dbg(nor->dev, "error %d clearing SR\n", ret);
-}
-
 /**
  * spansion_nor_sr_ready_and_clear() - Query the Status Register to see if the
  * flash is ready for new commands and clear it if there are any errors.
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
