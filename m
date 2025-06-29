Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBBAC83013
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Jun 2025 08:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E5hduJNVITwz61iUDKgc+QNe58+mQBZ+Toridn8oCec=; b=gxhCXLVWSl7JPY
	MIVf89bNrVHmuiz0W2rTJGhu2CIOk5zrl8F4PwbIeaAOqfdmWPn6qwDNQHhP0H5IEPlWDeAkijL4Z
	02BF0SsJvMfIqmTNc++rikVRBlHMy+8lY9NqTbmNWTbMqrGs2nNKrdRrctLXg1B9YYPxwmXxMjckw
	a+doTTDFA4p4Zt7e50p02idDUUmfQXriwHVmWJ4KdNJ7/h8BKueFacKORTyXsfCT5hLD8cLY+svP4
	ZmVqEqGMJYyVIbNKlWKcNPn6sqnyO/tcsi8q2C8q/jQhk7tLvYoT3/Ii+flELpXl4a1pBXVSviHLo
	OaSfUx7PNslBp4y7dgyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVnKR-000000001c5-1LtB;
	Sun, 29 Jun 2025 08:23:59 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVnKO-000000001aU-2k83;
	Sun, 29 Jun 2025 08:23:57 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-236470b2dceso6465895ad.0;
        Sun, 29 Jun 2025 01:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751185436; x=1751790236; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mt+ql+PrjmzYyafappxb+kroF0DLVLujfMoQHbjak4k=;
        b=dD3hE/IBihV3ObJr/vxdluQlZK7p/NvreFGfxelpgEM9EHlaG51wNLI7cheOafGcdb
         7262ablw4ETch+EDCpSs5jI1UOdkT1X6Xgbs82FHeKwKw96rFYEPlQZMyEHPmvuZO/3H
         a3siK8yUEHWo9m6Hc2vwPDiYfnntc4WvN9n5S5UJLwScKi7tOEo2Pi1wK2uX++CEtQ1P
         tfULvD8vOlYeVp4blHBx4KD21PNAGvOtStVLUXkGvyeLt0H3LtuqTEI8YU8CtaiqSVka
         dHN1WUAjxRb5LxWncn7Zr8QwuIxIQVOu3rL4jy/ACDgL2qM+m0v8lwIiYLOzaZkng7IL
         N5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751185436; x=1751790236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mt+ql+PrjmzYyafappxb+kroF0DLVLujfMoQHbjak4k=;
        b=QqLc9FGdNmZdstfjzEdPFFSthEhNjkcBKfOQmeKZz+9b4UYFhpfpyyJ2Vu3DAxDepr
         WEHjH8ieZJqkrXqel6xmMkT6udKDhlkrNiJhkq2NRoPO7lSNVyClQqFIQHbTPW20CSfU
         VCTq/HZKnoJKa4Xm2xsEsDq4doQFnAK1JU4TS/gfmiyO+XxMosOuBghbwGq9lx53l2ZV
         5g7C4zkjgSSEZk6J3pjry6pFp+w8Q35GiLgEUy78dMpDHA5ClRdK87NwKonICfc/vs93
         8FtShMbCi3cC/MbxsnSO9j3qvdb69r+IL2JaJJIeVdz8PYkG4n7BRkf3HZSv1e4D5Y9G
         iBpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqI0Md3J3EIzMd1JGDSUAurkFTSIuoWTevjvIsiw6X/8gXK5IaUAaY0I2jcEVWcj6QAA6Pagjy0l/GoQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh6E50B/tCXNvEW4V6E+f17ZZ379PHw6UHT14CihMBHygSQq3X
	Pc6ynF1dqs+Qo22mp+KvcFG/FGQv26XaVG9ybOYJgkHKC5ZdR6ZzCFUA
X-Gm-Gg: ASbGncuUmXo0J3lb+JfYcuoAOUBdTrlxAoHo9DZQ23PGc7ei7H11jpWN2ZzfrUtfIlE
	TEIIKLOo7lahihAMWrBYJS29+CbMyaFUXx1Xi2TTIZkjkaVJ+QjhoNjJvq3Zho5a+RmR0hFTcEH
	zUKDaKBoC/2HYY0NLlqhFUXhL9RJ6sQJgRqvAKldIkoN2ard0ooOKMx01GTgP5RA0tT17gu1rO5
	DcwYtxhtPP9amTGRmOV6jyuSWSylqwEJ3eibtbcU7FqgpS7k0ZZPELoPjoxxqzBa7AP/BRvy7M0
	K3PE66cHvphIOSW50k2f/typGEZjNjEaXELMaHO44MoloHMXorgkZA==
X-Google-Smtp-Source: AGHT+IGHSGmVXaH1qzRx8krEwxIKwAdC/CaF24fxPdx796M/L8k62EbYQxOG2adPibF6rWxhZKMrig==
X-Received: by 2002:a17:90b:2f88:b0:311:ba32:164f with SMTP id 98e67ed59e1d1-318c9223bc9mr14517657a91.8.1751185435487;
        Sun, 29 Jun 2025 01:23:55 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::168a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f542661asm10495839a91.26.2025.06.29.01.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 01:23:55 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Sun, 29 Jun 2025 16:23:12 +0800
Subject: [PATCH v3 3/4] spi: spi-sg2044-nor: Fix reading bytes issue on
 SG2042
MIME-Version: 1.0
Message-Id: <20250629-sfg-spifmc-v3-3-28db1f27e999@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751185413; l=1655;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=9hfluPES3NJNacigLt9GPHetnqMVb+nAsHw5PVH/j0c=;
 b=R3LSjxSyIuRG9w/LW3zvpCkqpEFDEkeviRHy6Y1wZb2EF5IOFZcZRrcTpA9XenOZVYr94SeIF
 alftbtOoyPEBBnhJa3VJMdnFzrtAvre4ooQIwpIt9DDaVZahZFOQDcW
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_012356_698154_8D38459F 
X-CRM114-Status: GOOD (  12.21  )
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

SG2042 spi flash controller specification[1] states that:
> For Receive, an interrupt and DMA request are generated
> when the number of valid bytes in the FIFO is greater than
> or equal to the number of bytes defined by FFTrgLvl.

Auto-detecting flash with SFDP only requires reading 4 bytes
in spi_nor_check_sfdp_signature().
Because of that, no interrupt is triggered and a timeout happens instead.
Since we want to reuse this driver for SG2042, setting FFTrgLvl to a value
which is less than or equal to 4 should solve the issue.

Link: https://github.com/sophgo/sophgo-doc/blob/main/SG2042/TRM/source/SPI-flash.rst [1]
Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 drivers/spi/spi-sg2044-nor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/spi/spi-sg2044-nor.c b/drivers/spi/spi-sg2044-nor.c
index 09a5712822e32c9da818684e7010b70aa94ae347..c1fe43e09c549328c0d046fc95bed130083dbbcb 100644
--- a/drivers/spi/spi-sg2044-nor.c
+++ b/drivers/spi/spi-sg2044-nor.c
@@ -485,8 +485,14 @@ static const struct sg2044_spifmc_chip_info sg2044_chip_info = {
 	.rd_fifo_int_trigger_level = SPIFMC_TRAN_CSR_FIFO_TRG_LVL_8_BYTE,
 };
 
+static const struct sg2044_spifmc_chip_info sg2042_chip_info = {
+	.has_opt_reg = false,
+	.rd_fifo_int_trigger_level = SPIFMC_TRAN_CSR_FIFO_TRG_LVL_1_BYTE,
+};
+
 static const struct of_device_id sg2044_spifmc_match[] = {
 	{ .compatible = "sophgo,sg2044-spifmc-nor", .data = &sg2044_chip_info },
+	{ .compatible = "sophgo,sg2042-spifmc-nor", .data = &sg2042_chip_info },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sg2044_spifmc_match);

-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
