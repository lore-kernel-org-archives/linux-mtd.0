Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA3CC83F22
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Jul 2025 08:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=73QvCl6YFlCYMJXO2wlDUXZVouv4zhCoPhCMDlwzWjY=; b=UpLVUlYm1DJLou
	j80KUOz0R0cwSVElC59Y6s+ivP7AjOl7qXle6yD6wJwLmg3wuXLjwODdeEXusptMW4TxN6VT96CP4
	rG3VbzmzyfZ+O/98AweN4SlhvE7+50AjGLHUJC65rlCik81tj8yUoGJC3EOLutfOTHsJ16DbpfcWR
	QqsH8zKstrNjK+s63VRXirSZJkVB4pp+ukfMrtZwmOmiH8bZPKaN2ZRCA9hBaiueOdJMGiABl5+rk
	GL4OssKyUHfLL5j4onoiPs4NQ7TAC0PoSv32SS88pEcosKP/IPUOocB1qaAw5+jTIFwg5dfkbCxlR
	x1sgRJ9uTfNi+xF2tblA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udPTo-0000000F1y3-3zjv;
	Sun, 20 Jul 2025 08:33:08 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udPTm-0000000F1ww-1gwb;
	Sun, 20 Jul 2025 08:33:07 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-31ca042d3b8so2775781a91.0;
        Sun, 20 Jul 2025 01:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753000385; x=1753605185; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i5wbWJbaeWY+aCgMCUPKFnVolPrX/Znw1ZkbaA0O6dg=;
        b=eS5IcY0wpV++jkenWuyd8SRYhPyFTgvjQO4MGeatr0lp1U4wvqKfvZrCIsqBtWqvEw
         tUb9OYJB81VXU6iIybAdYNhRip5+C1CUJC+Fa4vrZ9nIaHQyu9pxrx6fBi63upVBTuZL
         oXTuLfShtatjlaTY4MQ/CBpx+DPcQIGgnq01TwADWmFzuU1GwjtcJkes/kg023tqUhuK
         dC3KLM7J69xMl6ny29t9jHckpUct6NHaHiLvVK/EzqELX/gbmh6bmVWP1rkZ1ZKDtaP5
         NZVJ9yVHcGF9+wp5o637+7vW431A+5Q7ACcu2T+VA7mMTIqxcU5XeYVWHcCB+SBLgBy9
         bqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753000385; x=1753605185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5wbWJbaeWY+aCgMCUPKFnVolPrX/Znw1ZkbaA0O6dg=;
        b=EhR3I4cUifccxcTJQFwrER9UiLQ8ydqaSMnZTcbWUuEFAeCSI3ltGuCEauu2LrTPMC
         M77xMmAO66ba43Y9f40FsiSOec4At6pBC8N/Kaj91vJ4GtGGG/YMP+WIEBobuY8BxwWW
         mAF6vyAAIcWsXz5CN3c8I09arCDwd5pcBYt41xRhm2LkRdb+cUg2F/2ouL6NeVNx+n1m
         fdElQewim1ecjFqTLecV299JPHTer08crx18kkw1UokfbxhpwADc0+hrmhnVmpIc4wc/
         Og/7jWzHUyDgLHzSiN8NATprxRpcpnKT/ccv23wGFK8qUal+/Ye+dX08ma2FJU7rycq/
         ElVA==
X-Forwarded-Encrypted: i=1; AJvYcCXMEdq7GNJUU+nIXV/Jaaj0c9+kGJqrljIc1JBVivbv2rk966S+NlM2UOOpH2Pxll7Jbu4iVPOW7hKxaA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAh6LHoWDKAxqOUKWg61d+WJv3NehJGfT5lnMT1UDJTX5UKjOB
	V8BIeXhlkCyu1FJB6PG6Ol+cvu9h0+7JTM8QjKvT9gmcX5kK5JxaBVx1
X-Gm-Gg: ASbGncthDssjoZkoCauaURh8kl45INSpm6VFBXL5EEghayj0hcqqj0a/kUQwJjPfRL7
	Z8jDqcUgDZBiJdGyxT02Vs3+jzutaMjshWnSjLpl42GsTSi4XC6/D2R6pXbdzvlsOtLzLw70BCV
	A9NrYKGSdc/FWXXGOalxe+gSwUcqUIKDa3Tlb9NjWpNVCwjp12/192X7YLvrwYN3InOmOLpWpy6
	63gOZccMFYC1swImL+W4dwvRbdld7+CiQu9zSk5Gm5RD+9e71ZtNWz+LR7BnIKAzRPHoaeqp4iX
	xDJZKDorFXvur2WWODB9VugUz6lcHpIZ1kxmNZK/33Ls4M1xnJQ8MklFGu2tM1L1pJtjcWX3D7p
	8h9nBT4Q5jCH+kA==
X-Google-Smtp-Source: AGHT+IEIyn/EvzX9sOaySrc2fPhMzwDi1IA4hwef15+G6nshGtYUjbbJ9FoduKOhpG+jz6ytWli4wQ==
X-Received: by 2002:a17:90b:5483:b0:311:c970:c9bc with SMTP id 98e67ed59e1d1-31c9e79000emr23616583a91.30.1753000385221;
        Sun, 20 Jul 2025 01:33:05 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1002::1d55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3f46b97sm4079721a91.41.2025.07.20.01.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 01:33:04 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Sun, 20 Jul 2025 16:31:44 +0800
Subject: [PATCH v4 2/4] spi: spi-sg2044-nor: Add configurable chip_info
MIME-Version: 1.0
Message-Id: <20250720-sfg-spifmc-v4-2-033188ad801e@gmail.com>
References: <20250720-sfg-spifmc-v4-0-033188ad801e@gmail.com>
In-Reply-To: <20250720-sfg-spifmc-v4-0-033188ad801e@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753000358; l=3096;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=g46DzEpcJPn1i0I3gZxZ5oIULesc7GWeVCVQQpgoe9c=;
 b=YukjZRjuG7zBKFA+bLUHLliBzwC6HfzWrgebpe6NZrnhXBeKuzke63c7trXlc8ATk42WV+NB4
 W3cceLQ0bkGCGS/lgwlQfEoVojsHeaYJy9zSK89/okcCCNQrWR90uBB
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_013306_445641_63A2C879 
X-CRM114-Status: GOOD (  14.86  )
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

SG2044 and SG2042 have similar SPI-NOR flash controller design,
but have incompatibility which causes existing driver
not working on SG2042:
1. SPI-NOR flash controller on SG2042 have no OPT register.
2. FIFO trigger level on SG2042 should be strictly less than 8.

So introduce a new configurable chip_info structure to hold the
different configuration.

Link: https://github.com/sophgo/sophgo-doc/blob/main/SG2042/TRM/source/SPI-flash.rst
Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 drivers/spi/spi-sg2044-nor.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-sg2044-nor.c b/drivers/spi/spi-sg2044-nor.c
index a59aa3fc55d277653d01df9c83b3f0aa08edab46..0ef569eb28b7609df1f23d89a6b3e7afc2569c80 100644
--- a/drivers/spi/spi-sg2044-nor.c
+++ b/drivers/spi/spi-sg2044-nor.c
@@ -84,12 +84,18 @@
 
 #define SPIFMC_MAX_READ_SIZE			0x10000
 
+struct sg204x_spifmc_chip_info {
+	bool has_opt_reg;
+	u32 rd_fifo_int_trigger_level;
+};
+
 struct sg2044_spifmc {
 	struct spi_controller *ctrl;
 	void __iomem *io_base;
 	struct device *dev;
 	struct mutex lock;
 	struct clk *clk;
+	const struct sg204x_spifmc_chip_info *chip_info;
 };
 
 static int sg2044_spifmc_wait_int(struct sg2044_spifmc *spifmc, u8 int_type)
@@ -139,7 +145,7 @@ static ssize_t sg2044_spifmc_read_64k(struct sg2044_spifmc *spifmc,
 
 	reg = sg2044_spifmc_init_reg(spifmc);
 	reg |= (op->addr.nbytes + op->dummy.nbytes) << SPIFMC_TRAN_CSR_ADDR_BYTES_SHIFT;
-	reg |= SPIFMC_TRAN_CSR_FIFO_TRG_LVL_8_BYTE;
+	reg |= spifmc->chip_info->rd_fifo_int_trigger_level;
 	reg |= SPIFMC_TRAN_CSR_WITH_CMD;
 	reg |= SPIFMC_TRAN_CSR_TRAN_MODE_RX;
 
@@ -335,7 +341,8 @@ static ssize_t sg2044_spifmc_trans_reg(struct sg2044_spifmc *spifmc,
 		reg |= SPIFMC_TRAN_CSR_TRAN_MODE_RX;
 		reg |= SPIFMC_TRAN_CSR_TRAN_MODE_TX;
 
-		writel(SPIFMC_OPT_DISABLE_FIFO_FLUSH, spifmc->io_base + SPIFMC_OPT);
+		if (spifmc->chip_info->has_opt_reg)
+			writel(SPIFMC_OPT_DISABLE_FIFO_FLUSH, spifmc->io_base + SPIFMC_OPT);
 	} else {
 		/*
 		 * If write values to the Status Register,
@@ -457,6 +464,11 @@ static int sg2044_spifmc_probe(struct platform_device *pdev)
 	ret = devm_mutex_init(dev, &spifmc->lock);
 	if (ret)
 		return ret;
+	spifmc->chip_info = device_get_match_data(&pdev->dev);
+	if (!spifmc->chip_info) {
+		dev_err(&pdev->dev, "Failed to get specific chip info\n");
+		return -EINVAL;
+	}
 
 	sg2044_spifmc_init(spifmc);
 	sg2044_spifmc_init_reg(spifmc);
@@ -468,8 +480,13 @@ static int sg2044_spifmc_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct sg204x_spifmc_chip_info sg2044_chip_info = {
+	.has_opt_reg = true,
+	.rd_fifo_int_trigger_level = SPIFMC_TRAN_CSR_FIFO_TRG_LVL_8_BYTE,
+};
+
 static const struct of_device_id sg2044_spifmc_match[] = {
-	{ .compatible = "sophgo,sg2044-spifmc-nor" },
+	{ .compatible = "sophgo,sg2044-spifmc-nor", .data = &sg2044_chip_info },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sg2044_spifmc_match);

-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
