Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71421CA0EFF
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Aug 2025 17:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YOrGH2zAihHpECNSMCtUPBR7A+ssadnc6wDv2/pllss=; b=xTqX/ORBOFe1mo
	MlwycpbMnTUsF5J5/oUl1/o6Ed4x3N7b6x5jPKR7x10NnOE0lJpTrApu7+EqIdRVPLRnlLURZc5bK
	jTBj4/5OKARA1fZvhr+CfL5RTlnBfX+3mxSDzOF59Sa/C/ScxxhETbeMB6n8r4jx8Ba/gPHaf/S9b
	qEg8UTqz98uZxS6faUCDeCie0zVryKDzo7jaHw7LF1f95tsM3hp6IVpPMPjSWz/v6yJBIMen8igdX
	f7XAnqxk/yhaeDxXEF3yRc1nsj1P/woV0gkPnsugdoY6OdEjxMWY0OKFkHNvCTVSP8TQoJwdhfJhx
	rDKTHNAvyTcI02L0oHIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usP6p-00000008CuI-00Nf;
	Sat, 30 Aug 2025 17:11:23 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usOx5-00000008BaN-1tAl
	for linux-mtd@lists.infradead.org;
	Sat, 30 Aug 2025 17:01:20 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-afe7584b6c1so43091766b.0
        for <linux-mtd@lists.infradead.org>; Sat, 30 Aug 2025 10:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756573278; x=1757178078; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RdB5MqNC+p3bmf/ntWx5h3e+QQrokyQ+em8wO8bj1sc=;
        b=t2xuC+iCdyBtBkSsEGhE8swIH6NQrJDVL4waM+Hxas3qNRadpxQTukAE8od6DcgFh5
         s9DJTA06SP9uBjGamrNf2xJ+l8tN81wfTiSbPSeD8pwrhYpUTPTYFQB/CiQMc6C0uFGd
         0UY67rvXvMSr72PbKEkmdpPhxabdHHf7NrLCMQgqOnfPL+RjSGcZEVM1AampXRTyfYBJ
         CWNjj3OgjgAdDZqFCOZJdpmmMPT89fIbpyYK47qmmD6UvSFarNnSJHWQwxDo3qXar48l
         xHfhTTnbX8s/7TcRJtTBN4XvQ+VwQ8N6jWCxrjBBwkbDhaTXj/jxiQSGK8HTNXqq6xem
         qWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756573278; x=1757178078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdB5MqNC+p3bmf/ntWx5h3e+QQrokyQ+em8wO8bj1sc=;
        b=bHoa+NjVcPs2NA0r9JpqdNIRvm2O6hY7EhjB/FiWQXGe3MOAk3nKL1YarDig+gKt8Z
         24vUQlrGhbtZWnshQ/dvfEnJ3SWU6FG0DDyQcnPeES+XhvHoSJNub276sHQ0JT3+7hIz
         JRPqL01kRZkP4w0zthRF/jVD4Oj9GdRwHFLpNcBk7I14lQy7L4uZw36MxQGlzDKr6Z2f
         vQ2gXMXn7oZuvF4q7HZyGK2szbZOB5IOhVeHBA/uHCLvd+YEEOrs5/6wAmeUrDWlewLg
         D8OsTwgQgxU+qYavhdKmLdWr3DrJyHoWKdCzdm1lxbgZx56DZAgtG2Aze+EneNQp++lK
         df0A==
X-Gm-Message-State: AOJu0YwFFdAwxOLcxeXz2PrZl8PRUazPgPNDVcEfAQV+b6em91HJJDvR
	e439qe9Dtg0HzdOINa9sN6YrQROVjOorx1rJruKjORBmfIuLMdzx+8SpWJiv3IuFbpM=
X-Gm-Gg: ASbGncsq8cKk/xLa/LEdLPALdMP8YXf6UO0y0p6C0Qr3fIrloxaXWQw7+pUoWWqYQGI
	mEskS+d6KeY0IpaugQ5QS4mfDsSTp37qfH87z8aONlmdQxoaNEUWo7NQxSf0qMNzJShkYk58OmS
	nBSCN082Ub/AVExfAjYuRnabHNVWSliz0w+vVjGib34wyGC4dkfouUTPR05+uvL0LEutsTROgLz
	KAuswnXA0IjTOluS8a77d5i3SXZE5MuyPyMVaHN1cHchLV8sYofrBBQVNdxInkhlHETwpffUSZr
	uT/knKj+sNlpoF1ZJed20NRrZ8D9nMXgtI6CEhQiUeUJy4vE+bPw+GPsy5b6qYe+jZ5gMgHMvOX
	Cpnb8wtCBw5cgCUIJ78007xqZqHlDlvIFUrNfxPUtArEwxnbPow==
X-Google-Smtp-Source: AGHT+IHe++mZhWzLj+V2kR1/YfRvNVOIAhKLNUILUb6vPmc6HP8S/l0mFC1K58GUtxiQDbdzEfLucA==
X-Received: by 2002:a17:906:9f85:b0:afe:ae6c:4141 with SMTP id a640c23a62f3a-aff0ee05414mr274464566b.2.1756573277761;
        Sat, 30 Aug 2025 10:01:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff12a6b404sm309038766b.88.2025.08.30.10.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 10:01:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 19:01:09 +0200
Subject: [PATCH 1/4] mtd: rawnand: s3c2410: Drop S3C2410 support
MIME-Version: 1.0
Message-Id: <20250830-s3c-cleanup-nand-v1-1-05b99ef990fe@linaro.org>
References: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
In-Reply-To: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2620;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=RPUJbg100xa0IEvnoF3u1mdVLmvj7pTfHeSRkyLDqeE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosy5XzOuvSuRgZYrPBWhcA/8cx0Ta1ZMMtq3VA
 U97dWTDNgGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLMuVwAKCRDBN2bmhouD
 15CkD/9SA+hmrUU/1U3lo3ofl7xEfszMtOVsHre48VzovCwtJVbvY66wq2HilKGrcKVaCJzaThw
 /0pxt9R8+UI8qBpXmErjOiZoOSArSvZwnPrY2IQiynNufwCqsoBkvKOEuIaOtPTOJnsxkJKCk4H
 x9fLs6FX74gWPS9K38wmcebzL+rWDEy+oVtVB+L78jnjI64mH4xo2bv8HKnBQa9ZfCL1LdLNMbR
 d8VElMJoGEsZkOOZxR/stuuVdZD3dXombq/YjrCw2nRpJtyLap6CcTg5TmpVKGL35wdcmXI/OZI
 MjekuYui0ID1Ft43KT0xlyAQUK/IoESXLBVRuIUChjCFuyEuP7RY1u50r+ETJDQb7y8xTWHBE/D
 ZKRpBXP5BP8IiclImSst1JMUfKoM8+gzYSgQd/mOxY+iiUHv9Gb5j/hzNrkI4XBakbHWlHXd+C+
 ndvykMkA5Ymrasd+5bVN6fSUaY0gMUeu8vf+X1Zo4XP4fdMl6MlC6XXSAMvmwO39AxEt8zKVgZm
 dDoFqaKhVT0CHbg2mQfgG8Wr9wGRZ3Rwo5r+mqebEQ0E7kQ3Y9i4h3c18MrGoGn2HVRYpD/mYee
 C1izWKtMDfyU0Yhn1qP+CovK8XgHtSzrkczRxDC/VAivNBM4SJcrnRlUJt0qeZTRqoRew7wjkQu
 3z+KzqjjHeF0x4w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_100119_498922_B0F44BC5 
X-CRM114-Status: GOOD (  15.33  )
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

Samsung S3C24xx family of SoCs was removed from the Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of its compatibles and platform IDs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mtd/nand/raw/s3c2410.c | 38 --------------------------------------
 1 file changed, 38 deletions(-)

diff --git a/drivers/mtd/nand/raw/s3c2410.c b/drivers/mtd/nand/raw/s3c2410.c
index 229f2e87d56eeacf5fda0ad29df59655b328658e..33130d75c5bab709a3e5cfd6e95b273cf62e4d46 100644
--- a/drivers/mtd/nand/raw/s3c2410.c
+++ b/drivers/mtd/nand/raw/s3c2410.c
@@ -169,18 +169,6 @@ struct s3c24XX_nand_devtype_data {
 	enum s3c_cpu_type type;
 };
 
-static const struct s3c24XX_nand_devtype_data s3c2410_nand_devtype_data = {
-	.type = TYPE_S3C2410,
-};
-
-static const struct s3c24XX_nand_devtype_data s3c2412_nand_devtype_data = {
-	.type = TYPE_S3C2412,
-};
-
-static const struct s3c24XX_nand_devtype_data s3c2440_nand_devtype_data = {
-	.type = TYPE_S3C2440,
-};
-
 /* conversion functions */
 
 static struct s3c2410_nand_mtd *s3c2410_nand_mtd_toours(struct mtd_info *mtd)
@@ -944,22 +932,6 @@ static const struct nand_controller_ops s3c24xx_nand_controller_ops = {
 	.setup_interface = s3c2410_nand_setup_interface,
 };
 
-static const struct of_device_id s3c24xx_nand_dt_ids[] = {
-	{
-		.compatible = "samsung,s3c2410-nand",
-		.data = &s3c2410_nand_devtype_data,
-	}, {
-		/* also compatible with s3c6400 */
-		.compatible = "samsung,s3c2412-nand",
-		.data = &s3c2412_nand_devtype_data,
-	}, {
-		.compatible = "samsung,s3c2440-nand",
-		.data = &s3c2440_nand_devtype_data,
-	},
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(of, s3c24xx_nand_dt_ids);
-
 static int s3c24xx_nand_probe_dt(struct platform_device *pdev)
 {
 	const struct s3c24XX_nand_devtype_data *devtype_data;
@@ -1194,15 +1166,6 @@ static int s3c24xx_nand_resume(struct platform_device *dev)
 
 static const struct platform_device_id s3c24xx_driver_ids[] = {
 	{
-		.name		= "s3c2410-nand",
-		.driver_data	= TYPE_S3C2410,
-	}, {
-		.name		= "s3c2440-nand",
-		.driver_data	= TYPE_S3C2440,
-	}, {
-		.name		= "s3c2412-nand",
-		.driver_data	= TYPE_S3C2412,
-	}, {
 		.name		= "s3c6400-nand",
 		.driver_data	= TYPE_S3C2412, /* compatible with 2412 */
 	},
@@ -1219,7 +1182,6 @@ static struct platform_driver s3c24xx_nand_driver = {
 	.id_table	= s3c24xx_driver_ids,
 	.driver		= {
 		.name	= "s3c24xx-nand",
-		.of_match_table = s3c24xx_nand_dt_ids,
 	},
 };
 

-- 
2.48.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
