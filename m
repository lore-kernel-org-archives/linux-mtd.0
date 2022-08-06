Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E12CC19F29
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Aug 2022 06:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jtb4yvNluL5HFf+d7uR2urhIVDNuPXEybSl24LlBc+U=; b=1CAQAVhWO3PJOn
	9UEnLHR41o11OZnyelZQxjPbIvuh1kxSnM0GGNRBXQ9i/ly/X65YP8XisfaNX2L/oFljLEyLdtpJC
	KzIVKahsuUCXuy3yXtfanDg5PC+JSbGI67RO5l6LqPtffsWhsonmFp1E3X3dyUBZRSyqFHMTIZHy8
	98bhEcrqoEqBZ1omiJQuDXNYy/Wh9ksddmB4lLW+XZ9ahK4dYrfpgFMr3hcOyEbW9TO5uya9auRJa
	5mR3VQske2rweXxlpgBFzUtjRhpJXpl02/7BvFRZI/kaCg+WmDZGubzYu6b/Y4ufdDoUdk9Cs4wD9
	AgCN3epX/qb6A4WNwUcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKDPT-004ndD-FP; Sat, 06 Aug 2022 06:35:43 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKDPN-004nP7-Eh
	for linux-mtd@lists.infradead.org; Sat, 06 Aug 2022 06:35:39 +0000
Received: by mail-pf1-x435.google.com with SMTP id y141so3953686pfb.7
        for <linux-mtd@lists.infradead.org>; Fri, 05 Aug 2022 23:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=cdIXVQ2/OMw3LzAdyelH4DaVmyUqEkkr5xbgZaG6scM=;
        b=dkfB3ckvN6e8N74VUthxLHISMUIv9bmjxyEnBpU8zEOhZhrDSEO8eF7jK8IRoK6CNx
         VdClDcPa+UzVId5DDGg6RCoow2+E2QFs0I/TwL5x9jRXCuC0joA0FsSr0lt2yu8pl5yl
         on7gJNetRo6nfsk3VpGeX0eba4NFTZho7PJD2e9xcy/QJB3oJXmEo22qzzPJKKmQyDRJ
         1Y0sg5IFu+5oMlakDfuykMT+0kbiGK31Gc/ou4xUS309QNNQArPolbkwJuV3Z5zpEIzn
         H07aZViG42Y78A+BKSGn1zXD1LRGIkCEMC18PKsSwqGKZVVjV7EJL3uHNSv8M6v4cbkz
         y8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=cdIXVQ2/OMw3LzAdyelH4DaVmyUqEkkr5xbgZaG6scM=;
        b=ffvlAgapdy7hQFyrlgz/4pPBe0iyFgHucfyiDVBCZeoiH5uThmshb9pnzbfr+6eCMl
         UDuXoa7QlO8TfASOgYX84sq+oszPxC2TxbBxa5nAuMNPw83vjkWawC+pTknzY0mzdPPX
         /kxWvUKSkbOLDte+iuxp8/9uB0xCHeKqaY5hUsXGtG8WxUH47HmTHdmDTsrImfQUhwGc
         rgo1HAv8fxjFjuMNNBp5i+bEFcB1ygmos2o6sLQ3gslzDLac5VARsY457lsW1o84aX4A
         rWWICVfGB3JkTHP3YdY1CJLdHfFoP2FYOS70la9VMhFZ/QodwSzuj35StQhFmZO5wSSY
         L+Xg==
X-Gm-Message-State: ACgBeo0giWRAb3GXIAKw3f5CmGxIwdf69Yu9G1zy/EWt1YlIuYSnYNPv
	vURVCUTejPrE2UUsog803nvKm06G0saMng==
X-Google-Smtp-Source: AA6agR6KEpqSvxx1+tQ9nxPvsnyHajfvv0NCUJP8/u3PyjY85er3v9nMiDUC/d3kImbkhkeOUmWGcA==
X-Received: by 2002:a63:1502:0:b0:411:4cc0:3ec1 with SMTP id v2-20020a631502000000b004114cc03ec1mr8451045pgl.91.1659767736041;
        Fri, 05 Aug 2022 23:35:36 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id a18-20020a63e852000000b0041b67615584sm2418452pgk.68.2022.08.05.23.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 23:35:35 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH 6/8] mtd: spi-nor: spansion: Add a new ->ready() hook for multi-chip device
Date: Sat,  6 Aug 2022 15:34:24 +0900
Message-Id: <058c6966e61ca5eaacfb547f4d55194edfbae61a.1659764848.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659764848.git.Takahiro.Kuwano@infineon.com>
References: <cover.1659764848.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_233537_550651_24942002 
X-CRM114-Status: GOOD (  22.13  )
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
 drivers/mtd/spi-nor/spansion.c | 95 ++++++++++++++++++++++++++--------
 1 file changed, 72 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index d7a61ea63139..fc9cc3484aa3 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -14,6 +14,7 @@
 #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
 #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
 #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
+#define SPINOR_REG_CYPRESS_STR1			0x0
 #define SPINOR_REG_CYPRESS_CFR1			0x2
 #define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN	BIT(1)	/* Quad Enable */
 #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
@@ -44,6 +45,29 @@
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
 static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 {
 	struct spi_mem_op op;
@@ -221,6 +245,51 @@ static void cypress_nor_set_page_size(struct spi_nor *nor)
 	params->page_size = 512;
 }
 
+/**
+ * cypress_nor_sr_ready_and_clear() - Query the Status Register of each die by
+ * using Read Any Regiser command to see if the whole flash is ready for new
+ * commands and clear it if there are any errors.
+ * @nor:	pointer to 'struct spi_nor'.
+ *
+ * Return: 1 if ready, 0 if not ready, -errno on errors.
+ */
+static int cypress_nor_sr_ready_and_clear(struct spi_nor *nor)
+{
+	struct spi_mem_op op =
+		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes, 0,
+					  nor->bouncebuf);
+	int ret;
+	u8 i;
+
+	for (i = 0; i < nor->params->num_of_dice; i++) {
+		op.addr.val =
+			nor->params->vreg_offset[i] + SPINOR_REG_CYPRESS_STR1;
+		ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+		if (ret)
+			return ret;
+
+		if (nor->bouncebuf[0] & (SR_E_ERR | SR_P_ERR)) {
+			if (nor->bouncebuf[0] & SR_E_ERR)
+				dev_err(nor->dev, "Erase Error occurred\n");
+			else
+				dev_err(nor->dev, "Programming Error occurred\n");
+
+			spansion_nor_clear_sr(nor);
+
+			ret = spi_nor_write_disable(nor);
+			if (ret)
+				return ret;
+
+			return -EIO;
+		}
+
+		if (nor->bouncebuf[0] & SR_WIP)
+			return 0;
+	}
+
+	return 1;
+}
+
 static int
 s25hx_t_post_bfpt_fixup(struct spi_nor *nor,
 			const struct sfdp_parameter_header *bfpt_header,
@@ -267,6 +336,9 @@ static void s25hx_t_late_init(struct spi_nor *nor)
 
 	/* The writesize should be ECC data unit size */
 	params->writesize = 16;
+
+	if (nor->params->num_of_dice > 1)
+		nor->params->ready = cypress_nor_sr_ready_and_clear;
 }
 
 static struct spi_nor_fixups s25hx_t_fixups = {
@@ -470,29 +542,6 @@ static const struct flash_info spansion_nor_parts[] = {
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
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
