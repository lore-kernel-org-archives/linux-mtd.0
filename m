Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0332C83F22
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Jul 2025 08:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LnyV9/+n/aNP74Suoxk5aoTY7GIt121gpHrRltFv7Go=; b=eimqejJ561B07i
	/T5NxKVcwjJy/8WckM5r/Ujdour4KXXJhl6J3XMcILusBwtBETUXbE7SrWY/3uzRfyE/fkOEB5G22
	iSyodDPpHFjYXhlmLWdAeon9meG4AJgrEiXkmLiSDUnUzGtqxaYwg6kjM9fGnxRSInJsnxjvQX9XL
	KiOpP88CRs48GHxn1W2SSlTRP5r71BTqIp1kfyol9DpJCjnU0Ddx22PkhrCL7yZp47AOT6wzrqjAP
	neuT1hDVheLfdoh34EJk5xzRyMrkaXInZdKR944Jy/40LyUfkNOS+D5gftvYJRXw7mDGLQPm9QfgB
	ZqVHVjZ6vPzbkKUynK6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udPTy-0000000F23X-0DJZ;
	Sun, 20 Jul 2025 08:33:18 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udPTv-0000000F225-3UnF;
	Sun, 20 Jul 2025 08:33:16 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b3508961d43so3032026a12.3;
        Sun, 20 Jul 2025 01:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753000395; x=1753605195; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nq9V4nWfYcJsLfYnrUeKCl4BP7Q+oHE4ZTsPuy9Af74=;
        b=RRiYAJm2/92moy+txkd58DbJvk6RmtkKO/9E0u/rxTWyJwaLvtO5TTmpZca2u7i/7x
         HQeUWcugLikFfelaPDwK4H2gNKq2tiOe+GMfXxvcy4USVzKL1Lo/5Xeg0sb9SzOHrcoL
         QjR9x9gfmZ86gIbXUXY+nfS1Ow0s7FhuQk/ayIcPApUdqSzpp78S81bqZugjGLpBGxH5
         02IzXRSX+LE98L/hqfntKGMlPH2WmSLyQOnbQrL2mjeFaup7jN8D2NzBMPy+UHeIgPl5
         /1PikiMQydeAEKNgYrwrsnMato3+sw9zQ4Drnugx44vedCsmX/fMcv/NG8dkD+0YcdCo
         /8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753000395; x=1753605195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nq9V4nWfYcJsLfYnrUeKCl4BP7Q+oHE4ZTsPuy9Af74=;
        b=pgoBPFtuOFiIRgZcSvdzlIheXZZ+fAw03D9Ux2lcjQgeg4WFjpwvUGYiwiyBuu3/2a
         GMOCQGvEdRa2Hox9C3IjwvDJWqWtf+CK2WEu+seGefAaml3RAwBm8+wPuLVTQOJBe/Hn
         o2G3C89dRFUAQ0RtVz2u0poE8Px1AH288g66IaNQvI867s4aSdf53N8CheeV5Iv49xCA
         t9g0imnkQOA+G2CsO36tQ/YHTSFJCSiNa3+CsD0Mi0kL6gaRDjCon1bjo/9DRJqzNAXh
         +ZHOfEknQ5yMck8xyHjbWdvwV5qC9avi5B/SnoXXou2ehMQf/Pn9nOvq6iMzsYRKZRrL
         FYIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHqD8FkaPEB4sCtqnTx7ZdCqvCqwk/yDzXvpcEr7SIikIcwvQOq6UJZi8u8IzynrR+PNa6UiMYIKh8tg==@lists.infradead.org
X-Gm-Message-State: AOJu0YywjzlwJga2ca2PNg/bTJL933BPXtt9CRGrGrVUKuRpos/AYB2R
	GaToixfUH+ELbdBdA2JMd0psbOehxdXRkL2+S67PVK87W43zyzx/Rj49
X-Gm-Gg: ASbGncvyN8rX06C3IoWzSN7GNJ9vUl6aj2bjobhRavVPOjvDGN9/CW7np9HGmtTHFyu
	jGT+MsGEyiVCOiiUI4U5Xv2dTYz8Cdb3dCIl/5NtwCwXv1IQJ/jlDl7nquHAMjKj0o7Yrxh1I1P
	2c0XfFohRio8DqWsinTWXmixqyB3Pgp9Nkz8rTQG+LtqQ9gsXnE/cAgRGCNCJlsaG82w8zyM/+8
	9n0VVwsZf1R9UtOUe3pKrVtt+v90rkGp3AlfZfejWRTZ2/f4mpbMkxtG7reJuGLjqqqdXtqC2Dr
	olVvB9TWReqVfMYK5/t/LcmMNrrGFB8C/tM8/ylKxCvF6hDckahvtxF85L9G76+Uu7VwxilYLWj
	7WjfgUKshN5ma9A==
X-Google-Smtp-Source: AGHT+IEpU7ppf8Ier2F7amqI42rtLsgYRSxajHznZeT7Ire18+UMD7933EljvqHA+AOKkjcPgT9mKg==
X-Received: by 2002:a17:902:cf0d:b0:235:7c6:eba2 with SMTP id d9443c01a7336-23e3b84e8fdmr114036045ad.37.1753000394653;
        Sun, 20 Jul 2025 01:33:14 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1002::1d55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3f46b97sm4079721a91.41.2025.07.20.01.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 01:33:14 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Sun, 20 Jul 2025 16:31:45 +0800
Subject: [PATCH v4 3/4] spi: spi-sg2044-nor: Add SPI-NOR controller for
 SG2042
MIME-Version: 1.0
Message-Id: <20250720-sfg-spifmc-v4-3-033188ad801e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753000358; l=1077;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=invs7khMKVNjBA2XGVM7X5zuJ+fCJ3XQUvHieDAkEjI=;
 b=d+ztnvccC+X0a+IaXeQ4YkUZ41YMfOYok04lF94NFY4peKxfthcRHU5Vd3KA1PF3HomUiCxxz
 pvgOE7rHvSkDFItDqH9m2wD99AXpdFdKrdGzn2NdJDgsLUdHxDEmixP
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_013315_887682_22C91DE4 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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

Add support for SOPHGO SG2042 SPI-NOR flash controller.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 drivers/spi/spi-sg2044-nor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/spi/spi-sg2044-nor.c b/drivers/spi/spi-sg2044-nor.c
index 0ef569eb28b7609df1f23d89a6b3e7afc2569c80..af48b1fcda930f3cd0bdd57d80e076918d94010d 100644
--- a/drivers/spi/spi-sg2044-nor.c
+++ b/drivers/spi/spi-sg2044-nor.c
@@ -485,8 +485,14 @@ static const struct sg204x_spifmc_chip_info sg2044_chip_info = {
 	.rd_fifo_int_trigger_level = SPIFMC_TRAN_CSR_FIFO_TRG_LVL_8_BYTE,
 };
 
+static const struct sg204x_spifmc_chip_info sg2042_chip_info = {
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
