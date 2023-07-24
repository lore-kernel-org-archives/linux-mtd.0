Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADA0C001B0
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jul 2023 08:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WGhJvaN6ykLsT6LmmH1sfwncgE1/ouSJs5/FueRfVM0=; b=THNoXfrzSWQSS2
	yuodSHroSd0NB5rAf3itRmdiVOBZQcNkYg7MHvfC4HG7R4WXCAr3mBwGLMKpPKkZkZDuFtonJkIYn
	I7TL3ls/jlGh2aIHUCp0KMVhPgibqtu67qvv61ZzxoM+0tYzU434GmMANywfHboubt3Ic+43kt2l9
	w81XIrm8/SsVnjBddqb2eSSsi3G6yB2ryV8myTOml7m2lkUl2ep+poYKtRk7U1NndWd9RqiYuaBBd
	HGVI70sHJmxtusOvoUtoLTDgmmgXvjqTGIzdKbaysQR/afsCX1amA9nfqg10FxXQf2IY+pYlJ18eH
	7GxBISLQ/vAsHD0sKWMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqh7-003Cd7-2k;
	Mon, 24 Jul 2023 08:13:30 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqh3-003CX8-2R
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jul 2023 08:13:28 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-991c786369cso642432366b.1
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 01:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690186402; x=1690791202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1B2NCe5HAwiQi6+47CtZiZu+Vu5z0uOnlROiU8PNpA=;
        b=QY7rh/pAquoo378N4CyA6AZKj1v++zcN/3Ww5oKLwMS3+S8dU4IF0lj7RjaS2CAEGY
         Isr3wXYFsc2lc8QS2yD1D2FJqI7UWjW1EGh2Uz37QduASB1I2QFVv6nvGDEPHZDpgWEJ
         caiwYhTdWpH8yTEsQgO33RIiWs8ZZECP+CSrEhw5ml0u8wqwCmgxN5dYzbScDuQ6vFuI
         qE4OlLll9IbgR9gIMy/vEiJaDjST4+OBEn+2LyWHetaIgG0cWPg2ZGKZ4/pXN05UroPC
         Vu+QMggpzaQegiisHi/LhJUGDM4gu/zQ2SV73D6bgaIYcPi23lRNAbpIl4vJStFs6izi
         7gTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690186402; x=1690791202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1B2NCe5HAwiQi6+47CtZiZu+Vu5z0uOnlROiU8PNpA=;
        b=aV4A/Nzr34ZWeu9YaPrRSxmMX5OKRRhsYusNraqMC6w0nHJ32wvONOVIiK13jFQYrW
         lIpt4ilo3G0hDi4m4Jawe7IrLh6xuB/Qc8fIGq9EHszmATEPu90sbVXzxVpJz+L1toom
         /ESdynWRtHlGFbBz2juYu4w69DJ5FpxrIG0i3JDXNa4dUWEs2nsI2bsEdsAeBiCC3yTb
         H4/XoXagKC+5kTHK4+i5oFv/njRGuz/W5zCq4QjYAz/egXSNFcxqecsF5YSBdgnQfj6b
         2rrOCsW1hzWzku306GLz0i7tVL2J4CARYtF2/xLVMwqM4LDV2UGYc64oA8Z5CSqTiiKN
         wGZA==
X-Gm-Message-State: ABy/qLZklzIumrpePj1/ZLNzJTGZ7Ijq81MAChFN9sovY/o3M3OuBIIh
	LzOKe4C82pr6vRrhy6heuVRZAA==
X-Google-Smtp-Source: APBJJlEaKG5Dt3U+fEqgqoE/BxTER41uI27lLaRY7hkr8e7uknLgy0tvjNvR5pFAKRwACqZEycM3Xg==
X-Received: by 2002:a17:906:5393:b0:99b:4956:e4df with SMTP id g19-20020a170906539300b0099b4956e4dfmr8859714ejo.11.1690186401974;
        Mon, 24 Jul 2023 01:13:21 -0700 (PDT)
Received: from 1.. ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id a6-20020a1709065f8600b0098ec690e6d7sm6355395eju.73.2023.07.24.01.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 01:13:19 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com,
	takahiro.kuwano@infineon.com,
	michael@walle.cc
Cc: pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bacem.daassi@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [RESEND PATCH v3 10/11] mtd: spi-nor: spansion: switch s25hx_t to use vreg_offset for quad_enable()
Date: Mon, 24 Jul 2023 11:12:46 +0300
Message-Id: <20230724081247.4779-11-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724081247.4779-1-tudor.ambarus@linaro.org>
References: <20230724081247.4779-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1722; i=tudor.ambarus@linaro.org; h=from:subject; bh=m09E4D2SbSB/QXfTnPlKEg92z13fHEFqiJ3l0puhOlE=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkvjJ/rJZTBzC/giI8SYKUWTg+y0y5OCBsOq+TO AFXiVivf7SJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZL4yfwAKCRBLVU9HpY0U 6Y8XCACdkKLonzkXNLmbOIc30Xy4RMFAPgZZN2E71+WJcm6QkDzPko/G6Itava2mbzFlxNn2mCS jaOK4RXgSkuGI7jLfPHBzGyfYf0GJEtpvIjobh+3jbFtKK2+YzzhDb8c4lfOW3nWl6kAQh9i8Ng OU+9x/jecpEDS4wOZH+4vYrgEfb0bVSFqr5OBf2crbsYi+CC4mJZijeym7Pxc0cUkiho3fCJzjh oZVjQU3rlbe7bczuwe6LJg7dOwjoq2/O6AGCT4y2jje/TM4zAB5gvlDXK5phT14S3iyuNANp1dX sSYnWD/CE8b6UJNyfnashTsrOal7yU/Xd9jkRcgwh54rnV75
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_011325_829401_C0F3CD13 
X-CRM114-Status: GOOD (  12.33  )
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

All s25hx_t flashes have single or multi chip flavors and already use
n_dice and vreg_offset in cypress_nor_sr_ready_and_clear. Switch s25hx_t
to always use vreg_offset for the quad_enable() method, so that we use
the same code base for both single and multi chip package flashes.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/spansion.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 413573cdb4fc..4027f0038ce5 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -350,10 +350,6 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
 	u8 i;
 	int ret;
 
-	if (!params->n_dice)
-		return cypress_nor_quad_enable_volatile_reg(nor,
-						SPINOR_REG_CYPRESS_CFR1V);
-
 	for (i = 0; i < params->n_dice; i++) {
 		addr = params->vreg_offset[i] + SPINOR_REG_CYPRESS_CFR1;
 		ret = cypress_nor_quad_enable_volatile_reg(nor, addr);
@@ -659,15 +655,17 @@ static int s25hx_t_late_init(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 
+	if (!params->n_dice || !params->vreg_offset) {
+		dev_err(nor->dev, "%s failed. The volatile register offset could not be retrieved from SFDP.\n",
+			__func__);
+		return -EOPNOTSUPP;
+	}
+
 	/* Fast Read 4B requires mode cycles */
 	params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
-
+	params->ready = cypress_nor_sr_ready_and_clear;
 	cypress_nor_ecc_init(nor);
 
-	/* Replace ready() with multi die version */
-	if (params->n_dice)
-		params->ready = cypress_nor_sr_ready_and_clear;
-
 	return 0;
 }
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
