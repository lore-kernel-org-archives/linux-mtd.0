Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE979C6FD1D
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Apr 2023 06:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zc+F1MlPDsp3nWQfAWJY6EO64r71F8b2wC7wY39XI1w=; b=WcKtbwngFplhfU
	vIU8IRzdisizEfBhRUqeAcGThWi9xzDLsaP/25SePkONXATI1AU9mBTguK0wwCS9/p+IaVH+yQ9Tl
	IZbRFY03+6LeU02T2eTVH/YK11t8C4qXSyG40/DKGfp/Tm5p+yOtmF6molwxZvbfMbiB2zhAHH5zE
	vD7nr4Fm1GhmbwQO5MZduCQgw9Y9+TfphiXCCLHgDt64PAnZAFntJhHF/IeF5P633L7/S67dKYky/
	ADlZFoDOsC3ky6alsMF8pWvwtmhuwjbOSRRnirnBE2x6gJq5zyOuQGYiye0b/pKtG7WxDEJ/eTgWl
	TjxdRqU1WKs0G1UAoYZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfnZ-009IJo-0L;
	Fri, 07 Apr 2023 06:42:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfnX-009IJ3-2H
	for linux-mtd@bombadil.infradead.org;
	Fri, 07 Apr 2023 06:42:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=l5qNLrlyHyG7Nplbz8tqvhzEVmTmr0S/5njiSbBjBAI=; b=F69Yfe6USFM1dd+NUnb9ZJK45r
	WA78NpP7cW5f0vRjKpa54o2VUDi6CGy3lyK9AGYAUg3zvBqjUkh7qVNMBfBOs2I3IMoFb76to6fPo
	fhNDyJERzhO4dS9zlUCoaLlxWc6D0OFdHZiN7xvH4KDyqWLife79DWRU1Tb1L5jEmr0RIeuWztx8L
	j/rBlXwOosCQB55iZA+AhvG06ovnKR46G+Dwzk4Vl9+twjlievWEXoHGZ6UUVuxBz3xMwG2apukBp
	i4tg4OCz0jcN/JyBe6DQv6MKAunWVC/lHhWrcyJBnJCVc6d6ADt7ELYOIZ5mRe0KQJfDYbwBoYeC6
	31vL2WkA==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfnO-00AwYU-2F
	for linux-mtd@lists.infradead.org;
	Fri, 07 Apr 2023 06:42:08 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1a4f88a0bd1so699685ad.0
        for <linux-mtd@lists.infradead.org>; Thu, 06 Apr 2023 23:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680849718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5qNLrlyHyG7Nplbz8tqvhzEVmTmr0S/5njiSbBjBAI=;
        b=eH967IcP0kCn3LbEX97bILCMguuvFFk4zpdO5/4gHQi7lKDeqtV3lhmiUAv1HGJoDc
         oJlsk0/4HK+nR7CPKNUHYNb9r5KuoK5I0pd1lQpnTkxjNDXQspPpNGqf4x0nO8FNs7MO
         Yb7P0Y/fFsiHW+N0EDCoEsS9RTeQY6SNfJESK2YwbNLTApA2TflT4gaJFzr2YZiMNdvy
         4V1aP0cLi4GqmkQI+F6EEsHsw2VN0vu0chSzMZGBll9zMoc2gLegi+ws4N3VsLwNsZu3
         EMaO4ymUEA9PSWmEpBd3y596KKfkTAFh2ZZbgFhZhYOkI5HsyB0RJswx6R9755F25VAX
         Ehbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680849718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5qNLrlyHyG7Nplbz8tqvhzEVmTmr0S/5njiSbBjBAI=;
        b=oqIkDczHWTuvmK/AC6rtI/75DnUMimDW0WqN4x4Bl/SE3hOIRRcyzZEnq3dKDtD/FU
         d02+JEVZzttn/KYGWdc4ls233/vIhviTHYZCEpUL64pDmpmr1a+1Jkjij/2IJ2HPzB2H
         zhWMqXGn8BgAbHUSAFnpWORT5/ehZwYFJmzQxbCrNq2J5VtQVMS+2XhnL+CxZtg8GBq6
         KUO1iL5ekSJaQA7t2BYMIYh0feI3iFqcc8a7yXWdYPv/4jg8VGH5UURO7SorW2GWtJB+
         NgIj033bfQEyhsmqPzxTPC9o7KfGYS0iKD6uywMWTt0Ct0wpyrScTXY02Zix2ZQsY3Ko
         wrig==
X-Gm-Message-State: AAQBX9cOhMwQquEM1XQIUJx7gHEWav1ndNRlu0qESPUoDnzAEPeG7fOV
	Br1Fbkhi/G8U248HfPRjie6J/Zowq7Y=
X-Google-Smtp-Source: AKy350bILaDuF971jA6XTcbQDZYyupeSDQJUOOgwnD3Hvgag3g8ICOLASG5Fbi0vDiFSmrv8zVEpQQ==
X-Received: by 2002:a62:844e:0:b0:626:658:c998 with SMTP id k75-20020a62844e000000b006260658c998mr1629746pfd.10.1680849717832;
        Thu, 06 Apr 2023 23:41:57 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-220-119.msd.spmode.ne.jp. [49.98.220.119])
        by smtp.gmail.com with ESMTPSA id k14-20020aa790ce000000b005abc0d426c4sm2309806pfk.54.2023.04.06.23.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 23:41:57 -0700 (PDT)
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
Subject: [PATCH v4 7/8] mtd: spi-nor: spansion: Add a new ->ready() hook for multi-chip device
Date: Fri,  7 Apr 2023 15:41:03 +0900
Message-Id: <3e4a64613ee733e002279349c75083433be45bf5.1680849425.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680849425.git.Takahiro.Kuwano@infineon.com>
References: <cover.1680849425.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_074205_765675_4683B7D3 
X-CRM114-Status: GOOD (  22.19  )
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
