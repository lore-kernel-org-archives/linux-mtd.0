Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1844CC636CC
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Feb 2023 07:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P8rrYYg9W+UinH79nwWvv8bzwrfg7DD68XqiBAFc760=; b=xGoLS4CmVUdbDK
	rBham1JjyLJdY/NcO2F2PUXxfmGHV4c5tERCTO6y20xCYigfmmmVV7OzMbKH7efHuWImJ4A/MjRYQ
	p08twYiPZ7Gt/iJaJwNnAHkUvRJ//sq6dVMWl2Oi7nmW/Mp1AW6mDmymR/bPkvJoCsJSlTSLDkiI7
	rqDqlFc7cNcz47T7vxQMaby192DyHgVMcmT0c/ZE0e/vQxc1+hb0nopvT246K02JYZo5LgS8dyVeV
	3niJMN49VFug/xUwjwBwIRpcZlgDloyNPbAw3MbHxME5r2S8Az6ZtZg3KnUlAJoE0teX3UEwwxtbX
	LNWL7fWZfkuwNLlDafIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPeRZ-00EN13-TJ; Wed, 08 Feb 2023 07:00:38 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPdPz-00EE4f-7P
	for linux-mtd@lists.infradead.org; Wed, 08 Feb 2023 05:54:56 +0000
Received: by mail-pl1-x62f.google.com with SMTP id b5so18142243plz.5
        for <linux-mtd@lists.infradead.org>; Tue, 07 Feb 2023 21:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fskUxGYzQdTuTj6tNJNFynP40xWfUhLjemq4tpLi2E=;
        b=D7VkinEr71h/gJHq9NDL5Z3bNmScL3zDHO40tUA+cKPvU0tVOm3t4mfpKFl86RzMfE
         joVRUKyoZvqtcTnY9HLFe00YNNIk297wqwE3U+R+QG4f0K6J1d4NoLRw8jSb9XukgGTj
         GQYW+mrCk17zgClPAyAZejNF59L2v4mm7jBrZ4VHEEPhE8dtwYSZyVMN6usiEx+MNqhX
         F2tU/iDEq3F8Zpo6YH3x/hBk4bVcQ2xLN5UGPR6xiMplBG6EeBUcLz/Fi10S0O5CS7ok
         koDDWUKhphOo75GtIZcj4MP+wNOn56fVDbTHrSVtoIK+cDGHOBAmo6J1UYicWMhKDgZp
         jCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/fskUxGYzQdTuTj6tNJNFynP40xWfUhLjemq4tpLi2E=;
        b=YlVcnbIQfm7U53zFP6Gbs9yRwXH0JS2dHHhkDAr1PHYJo7stt8esDaDlUg7Jl92//n
         mbcDG3B+h/CGMJrxOPYxy/cxysDeiIlHEkF4pEzNu/+SJH4FsOZ5mECeQpA6z9Hqom/B
         rI+V18PtrL2SzRwlCjPl1cJiyqwIQvQw3i+H7T5EkidNWV+JFPb52pDJRJfr5EV3YkqF
         vcYZzHMFWmfDohGfcwucsHDXgMXzYQUxpfWQEP7eqv6YSWlHKuYAGlihxmoAyhSgKmfh
         3F7D28GXdaH9GbEwETSzSH/r9xTjMNy4XKB4+a8LolQWuz98VvRXQvIaFRCFcxyr/avd
         eIHg==
X-Gm-Message-State: AO0yUKWOVWNzkT/uYqxOFd3TnABCkkK3F1sl98p4jckV41FQcri4LZq2
	bJCSvn0YBnYy72q3ajZxGeDekb2+Ar4=
X-Google-Smtp-Source: AK7set9fp+3xb9cbPToJV567ekqDJJX2cqi6aJRQLR0JVh1DlhO1hy5/ZcH2/vKBttrqwmwH9TOVkA==
X-Received: by 2002:a05:6a21:328f:b0:bc:b9d2:f0f8 with SMTP id yt15-20020a056a21328f00b000bcb9d2f0f8mr8235181pzb.24.1675835689582;
        Tue, 07 Feb 2023 21:54:49 -0800 (PST)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id r16-20020a638f50000000b004eca54eab50sm8915954pgn.28.2023.02.07.21.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 21:54:49 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v2 6/8] mtd: spi-nor: spansion: Add a new ->ready() hook for multi-chip device
Date: Wed,  8 Feb 2023 14:53:43 +0900
Message-Id: <cd8e3bb4372479989ae33685524afda749f6e02b.1675835253.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675835253.git.Takahiro.Kuwano@infineon.com>
References: <cover.1675835253.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_215455_311096_37D5AF96 
X-CRM114-Status: GOOD (  24.23  )
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
 drivers/mtd/spi-nor/spansion.c | 96 ++++++++++++++++++++++++++--------
 1 file changed, 73 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 33c8a5afcb76..45377566ecbd 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -14,6 +14,7 @@
 #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
 #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
 #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
+#define SPINOR_REG_CYPRESS_STR1			0x0
 #define SPINOR_REG_CYPRESS_CFR1			0x2
 #define SPINOR_REG_CYPRESS_CFR1_QUAD_EN		BIT(1)	/* Quad Enable */
 #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
@@ -49,6 +50,74 @@
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
 static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 {
 	struct spi_mem_op op;
@@ -272,6 +341,10 @@ static void s25hx_t_late_init(struct spi_nor *nor)
 
 	/* The writesize should be ECC data unit size */
 	params->writesize = 16;
+
+	/* Replace ready() with multi die version */
+	if (nor->params->num_of_dice > 1)
+		nor->params->ready = cypress_nor_sr_ready_and_clear;
 }
 
 static struct spi_nor_fixups s25hx_t_fixups = {
@@ -486,29 +559,6 @@ static const struct flash_info spansion_nor_parts[] = {
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
