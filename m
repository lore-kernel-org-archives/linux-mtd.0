Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EB5C7EE30
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Jun 2025 08:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PJX0pRppH4cr3OhppqJ1q0kI0E4e5clJXFNH4/wY5Cc=; b=doRjH2nkU6jHzq
	BJi/6sM0QAxefssKvVjvhkdNB1AMboIt4331cPmTrQ5mT54Xp9Yfs9d8rQQbUgQmPEHPvWh34CWjP
	tYsTpCRESw22KJuYmIe3Q28aB0ac6OPa4El+0UdgdEqYGFWF6JJaGOO4GjLuBrJ/UrvK93EKL6wyO
	1v5hMsztRYBEQ6I0gZkSb80qUtY6PhvxuRmcXt9oywzlTC7Na8umxUXRnb/scoUcjlZjj5/4vi+Op
	kEQkpycFUX/yDiE51xqhMlX4LLyFa1r2mIF/bFwPqxCY5AGJq8iXAj35iwrE0gPkKMXcWEVvMqXsi
	4Qa7Cvb6u1cOiAFBCw2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVnKM-000000001ZQ-1CT3;
	Sun, 29 Jun 2025 08:23:54 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVnKJ-000000001Ws-0Lnb;
	Sun, 29 Jun 2025 08:23:52 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso3487611a12.3;
        Sun, 29 Jun 2025 01:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751185430; x=1751790230; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbDY7+jLzrL1PT5ycGxldl2xKFdQgH0cPkLNWX9XASE=;
        b=PQRw6/qIPq+320iyhtljWMvPEUUsa7rQbx74w34RpHk/fKQ0iieF7SnYKjR2YBUyuI
         x+4QJHHEMxkz20dAF5+YSYdrslOqh098vaKghOLIbDj2bJbqX181yaV800KV8xycs3h5
         CxYGpWVD82KCAs5mKYnXbrSIxrNatMC0y0zfjk0+CdnybbfuyiHAHmML1iTXl4BaRGEx
         oi9bxZERT91K2rTWJNq1fbfGt0aMDDiMZsmopAxG7+BogKbatrJ2xox1M20lEeSOeXeh
         pSk0Ocxacmhz6yg7mKZ3mG1vXZAUgX5As2rNw651wEw7pJGKk1IYK3O+k/O2DLlIlmCn
         YtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751185430; x=1751790230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IbDY7+jLzrL1PT5ycGxldl2xKFdQgH0cPkLNWX9XASE=;
        b=m68qfocgK7s9BLR9Q1fzny2OgeNSftGZ95/dP83SQLCgWUpziZzR45fZAj76wJ3Zke
         6C6STEemvsUy9+gCBt03Ed0+U40zT3Ng6WDLaIu4q/OCXOEJA+6turts1pf2LqQTd0t3
         GyY0oaIL9TLt6kFi1eUitCBaPR7MpeTVrdyPNSy/ZpT3RVpJ1YRhfmX2N8DyZzBVuwl3
         nSKGZYFHP1Dtcr25/iK9EcWLj57CzS2d0vXy6XjIM634y8p/duqOU0NxZw0NOP0klVN3
         07fzsxfEMbeuaQc4YFbcIem/XkojKzh8ZFtM2wUQiHYmYCi7htBDW1XpJsMh1xGkLLJP
         KirA==
X-Forwarded-Encrypted: i=1; AJvYcCXEvmYrj3QHi08ib3dnK0VPAb6SRhjm6+H6dt9wVKGYwcXg/QSjcjaYVhXmbA26vHGAZR+jl3ymHV1/3A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8KPPzYgN5HtJgnrmWNoI+KZpztr7GnzjRG4SNK0CzweIttIyj
	cIqktuUvHKRjFkxngsOpOs+Me6bKqLTYoj7ynC1MQ5QYRzDYmSd2NqC9
X-Gm-Gg: ASbGnctaZzpUq7ED2Mq6yETbVf0Lmv3MsflQOvlbItcFspnbfN9+MGaQpPoLftFCVIk
	tDPXeEVYLmTs9AoDbRNfFcKD2IuTnd7R8+mu8CGnaQezFVSo6ni7HBfBBeqe1Svsd2CMvtgBkEx
	8EIsV2kmRyL+JOMDK7Kvbfl65zoQvKAUsPCl9gFuP7yZ3l3RfjM+u8GWUHE2lFtIIu7bCDy1ssK
	BkAWnub4MzeRoIPD3FxmxuhsWlokBkO8XVNTXLme6WUEGif2X3SYM7cXvn/AgRdFdaCPHNBz5Hy
	TB4LQJxroy1/hV0w67j6LWGQmkoth+qStWSh1OEJwqFYKs/Eq5YvFA==
X-Google-Smtp-Source: AGHT+IELHhhDxgnpw3MWnX1SUdpFfj8qVHJzMWazZcVe7MfSiD187uIdapbtW0jVyzAPN3EEEu1YGA==
X-Received: by 2002:a17:90b:528a:b0:311:d3a5:572a with SMTP id 98e67ed59e1d1-318c9225e52mr13102958a91.8.1751185429842;
        Sun, 29 Jun 2025 01:23:49 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::168a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f542661asm10495839a91.26.2025.06.29.01.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 01:23:49 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Sun, 29 Jun 2025 16:23:11 +0800
Subject: [PATCH v3 2/4] spi: spi-sg2044-nor: Add configurable chip info
MIME-Version: 1.0
Message-Id: <20250629-sfg-spifmc-v3-2-28db1f27e999@gmail.com>
References: <20250629-sfg-spifmc-v3-0-28db1f27e999@gmail.com>
In-Reply-To: <20250629-sfg-spifmc-v3-0-28db1f27e999@gmail.com>
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
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751185413; l=2775;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=vKeGv92LbibVttyHcTTbUTC0hNnYenpRL/AwLj3xchI=;
 b=1JEJ0sKTI6zYuq89x/DJJ95DWZmlHfX0cHx0z4Qe0aGYXpNYwXGQGNhVegUI0kLoyOVZ7AlyG
 v3WNK93YDK1B22T1yDK8uuuYFZIup4kI9OB8+ZxQ29TmQLBJHJ0lHxf
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_012351_136706_D58287DC 
X-CRM114-Status: GOOD (  14.70  )
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

Due to the differences in the SG2042 controller, a new configurable
chip_info structure is added to implement that.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 drivers/spi/spi-sg2044-nor.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-sg2044-nor.c b/drivers/spi/spi-sg2044-nor.c
index a59aa3fc55d277653d01df9c83b3f0aa08edab46..09a5712822e32c9da818684e7010b70aa94ae347 100644
--- a/drivers/spi/spi-sg2044-nor.c
+++ b/drivers/spi/spi-sg2044-nor.c
@@ -84,12 +84,18 @@
 
 #define SPIFMC_MAX_READ_SIZE			0x10000
 
+struct sg2044_spifmc_chip_info {
+	const u8 has_opt_reg;
+	const u32 rd_fifo_int_trigger_level;
+};
+
 struct sg2044_spifmc {
 	struct spi_controller *ctrl;
 	void __iomem *io_base;
 	struct device *dev;
 	struct mutex lock;
 	struct clk *clk;
+	const struct sg2044_spifmc_chip_info *chip_info;
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
 
+static const struct sg2044_spifmc_chip_info sg2044_chip_info = {
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
