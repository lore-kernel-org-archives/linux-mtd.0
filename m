Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7ADC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 05:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bRRZv9w87JqZmK5QSPluiqsyHjKgOGAgbzSRmil+cTc=; b=UyNHLgYV0rvaSs
	ctQHvpiKenIzOprhOfcAc8IrmAtf4xlgIEqFIKtroHseWy/GjqUPRrbVx8TPMm6OPnrK64ojqcNPC
	ttbobV1WWZN13riTRH+XLEb34EtfmVAdorgvY55eVWiQTlQpO7K/EBWVbZFKSDgZHFw4GrSvdQbMr
	PF48PZWW5H+Ru8H7JKC1qJrJiI2zepiDKPdg0fm/P37oR3e1AXCX2WxtNZO5J0iJapQgEpUZ6LqmJ
	e1f57OXd+bmPsutYIk9dHMtRXmodK5/ZYgtd9fbLaHU9VxKD9EGb31sszPgBLp0F/RMln2snB7aWv
	ZKtJ8Kf22NerUWCCxP8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndmXR-006k0G-Nq; Mon, 11 Apr 2022 05:24:33 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndmX8-006jvN-Cd
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 05:24:15 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 md20-20020a17090b23d400b001cb70ef790dso3577281pjb.5
 for <linux-mtd@lists.infradead.org>; Sun, 10 Apr 2022 22:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cp/p8CZtTywEcwBcsSBs1eqI6mJJMilCvHhIqOtb5hM=;
 b=a46c7UDDrVj/GJbeWfIKTUPQ3JSRXV7LBuyCPUjuC3H50vNMS8Z9rB/lejQNtmblIE
 K1Mtc+xiBvNa0LyrHY8Ga1z9UpqRnE+VIO8soFqjWGagh3dILgdD4pmYkIMAQ03Ubkh4
 YwJ9GwOGgXJnrEluEsQpKhS2bGQ0BsOmSylvvazFtko/IoxLpm6N3+QHMVi6JbdUlR1O
 HWyKbn74DEX3RxlsRdNVaJSHv3Nr6iBq0m2ZkzNeADX5sm6q2ekynEctEYGz+C+i2dwR
 5/PnT81BVwL5Q8tcUglzEazR6bGGB6pPwkHzFCadq7L+28WGRImwnEyY/4pOhC1rSkRg
 Vapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cp/p8CZtTywEcwBcsSBs1eqI6mJJMilCvHhIqOtb5hM=;
 b=ra76cxxV0rGNpoFr2aQHFcEZfUMHx9zKKJD+wddZyTzk8ULtdXD0Kf0QK/O3cqvgzs
 e1JAxo8sYyMF6ujqU4VKTcOFY+PGHhq7ZTTVjBLfPL/vkAz+O39Q5laR87i5Dfizqp85
 XTTYO6Z/cWiOjVhEfKu9cmyc0aTp/RJm1Ik1/DHIYis02L6QQCuAEBeWTNoaZtQbnadF
 20OtmbRus3oJCTQhPxBKAl7oVMFxoUyjvTLhWinNjvISTmOKdcS4MntOtJN3H0wYctSe
 J1jxvIpin96iZ6b62XY55HA9dGskxYfq7027CgR5aENtIG6I3jElKOaL2AuvGYtlqnzh
 TZwg==
X-Gm-Message-State: AOAM531qzT22zuxIefTsQ1XYm0euBjalDXSdhZCJHELKdjEfjbZgWm/8
 kpbiOAJA4/VQInStKDbcRvRcAYwFhaQ=
X-Google-Smtp-Source: ABdhPJx0dytUmFagD4AzxeC/Sg3DZ3fU3TyTHPKVir8+0x9pBp+Y/wV58kv1Jm/ZTGpAPai2YbPZqA==
X-Received: by 2002:a17:902:b40c:b0:156:b616:e257 with SMTP id
 x12-20020a170902b40c00b00156b616e257mr30442990plr.44.1649654652461; 
 Sun, 10 Apr 2022 22:24:12 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77]) by smtp.gmail.com with ESMTPSA id
 ne24-20020a17090b375800b001cb62235013sm6064261pjb.5.2022.04.10.22.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 22:24:12 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v10 3/4] mtd: spi-nor: spansion: Add local function to
 discover page size
Date: Mon, 11 Apr 2022 14:23:24 +0900
Message-Id: <5543aa621cfa0c95ec64fef1bea4a8d471dfc5f5.1649641729.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649641729.git.Takahiro.Kuwano@infineon.com>
References: <cover.1649641729.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_222414_477932_7E2F0F07 
X-CRM114-Status: GOOD (  15.60  )
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

The page size check in s28hs512t fixup can be used for s25hs/hl-t as well.
Move that to a newly created local function. 

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 55 ++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index b073a7fe8e15..e58e864c308d 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -93,6 +93,38 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
 	return 0;
 }
 
+/**
+ * cypress_nor_set_page_size() - Set page size which corresponds to the flash
+ *                               configuration.
+ * @nor:	pointer to a 'struct spi_nor'
+ *
+ * The BFPT table advertises a 512B page size but the page size is actually
+ * configurable (with the default being 256B). Read from CFR3V[4] and set the
+ * correct size.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int cypress_nor_set_page_size(struct spi_nor *nor)
+{
+	struct spi_mem_op op =
+		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RD_ANY_REG, 1),
+			   SPI_MEM_OP_ADDR(3, SPINOR_REG_CYPRESS_CFR3V, 1),
+			   SPI_MEM_OP_NO_DUMMY,
+			   SPI_MEM_OP_DATA_IN(1, nor->bouncebuf, 1));
+	int ret;
+
+	ret = spi_mem_exec_op(nor->spimem, &op);
+	if (ret)
+		return ret;
+
+	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3V_PGSZ)
+		nor->params->page_size = 512;
+	else
+		nor->params->page_size = 256;
+
+	return 0;
+}
+
 /**
  * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
  * @nor:		pointer to a 'struct spi_nor'
@@ -226,28 +258,7 @@ static int s28hs512t_post_bfpt_fixup(struct spi_nor *nor,
 				     const struct sfdp_parameter_header *bfpt_header,
 				     const struct sfdp_bfpt *bfpt)
 {
-	/*
-	 * The BFPT table advertises a 512B page size but the page size is
-	 * actually configurable (with the default being 256B). Read from
-	 * CFR3V[4] and set the correct size.
-	 */
-	struct spi_mem_op op =
-		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RD_ANY_REG, 1),
-			   SPI_MEM_OP_ADDR(3, SPINOR_REG_CYPRESS_CFR3V, 1),
-			   SPI_MEM_OP_NO_DUMMY,
-			   SPI_MEM_OP_DATA_IN(1, nor->bouncebuf, 1));
-	int ret;
-
-	ret = spi_mem_exec_op(nor->spimem, &op);
-	if (ret)
-		return ret;
-
-	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3V_PGSZ)
-		nor->params->page_size = 512;
-	else
-		nor->params->page_size = 256;
-
-	return 0;
+	return cypress_nor_set_page_size(nor);
 }
 
 static const struct spi_nor_fixups s28hs512t_fixups = {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
