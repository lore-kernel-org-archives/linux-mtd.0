Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B104C4167B
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Nov 2023 14:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XDpzkZ4arxAm8f9V5bcn53UQbMIao8sTyVcOuei2Py4=; b=SdsAEq0cedlQv6
	tofxhjiNG0Wvd1t65wB0MkM3FWurN4IpymE/m+gQVMvGUmLKThKDDLWQAOhoBQC8OL5pq9a6LSj+e
	mKmQGJnMxG3NOvdEyFPdTqXkB5G3MKdPA72skuKrhPfbkWIAQIfm/dHpzTFKvnCc373OaC3Z2qtZS
	Z529nipwqn5vdXiblgcFCFU5YCqmGpmhQgBsyws3+tR7AByJVMQS5zfTZyRpKs5WdFf/quY22JI//
	02kBfjWEF6j2PWrnLK968i6KQNjgqvWbyOMx9NhgNPssWa/DxohM6n+GoyRoky2GTG0dZy8kU4xGg
	8yKQt50jnHkWPFrqicgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0jdH-0041SH-1E;
	Wed, 08 Nov 2023 14:34:15 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0jd9-0041Ia-2g
	for linux-mtd@lists.infradead.org;
	Wed, 08 Nov 2023 14:34:10 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50949b7d7ffso9335183e87.0
        for <linux-mtd@lists.infradead.org>; Wed, 08 Nov 2023 06:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699454044; x=1700058844; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pGzclwbFLS82d1Yy6hJpVSYEp7mUVdHhXoDoAeHaQ9o=;
        b=HFXabJBIvPEsFCdGOcpLB/SVS4rgICsBnkj6z8rM4SCxCAC+NanTKi28YSWA7VshOW
         wGBbWts72cyRLKMVcXo4/vY4kjNxZnPCyoxqAqAuR5RgdnDACJynF4xbTADqK0/aZUTq
         FwjQS5D96t86pWZmGrCAOLojDkmqm/sHNRJT/LmlgM3zbitF2oOEmME7SgRWv77lZ0F9
         +eikoc9XA4OJW62wdOT8dD8R1ZMg20rsTPNr6VVCLx8ARF6aFeFEue1gcn5066I3/rRE
         EHsUIFy8iNcLoxdsSQ7bXLMDDqkDAoRqhZn9Fs0WEsd7ojCViXOwt269vF9fPGXB78fP
         Vpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699454044; x=1700058844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGzclwbFLS82d1Yy6hJpVSYEp7mUVdHhXoDoAeHaQ9o=;
        b=o9RxZtTU5xO+dPrmtE7PBbLNCT7MPwP3vf8UjjrIFiWga2PzrC1VAV55veg9KJi7NF
         Ca1+EtHK4uZWzfYhzLjSxzY08ciRvyFkG5cU6KWEDyXAkQGLaV/tzSaqKCosH/bWlF5C
         Y8LFBhdaaekrH8RmXaFEOdmucxBsGv9FlZ5nZc/O/PHj447r0RTZxTt+6AhYDJou7+oW
         pi2iprwMJhKV/b0OEv8efJCHARv8ljDGp65yfHR7bW2R+JEWy5mYES6d6NrszDMUCfJO
         +iuPILr2U0lMTYmniUVQT8THBQBLNXsAHm97q5tboxJVX3WKOr48129w+PH34jran9gJ
         F3FQ==
X-Gm-Message-State: AOJu0YzfcKthiipPKROUSbhrH143lymdK33Nb7oCCE+c7nh6ldb5k/Vj
	2E0flRzhKBTbJwmA0tvifjEg2w==
X-Google-Smtp-Source: AGHT+IHO/EX+mYFpXV9cnozSua00aYKVLxHpApEI0ijPX+/t/mJFnU4RbkNl70WWo+NHt88Fl9uYmA==
X-Received: by 2002:ac2:5a1a:0:b0:509:4541:5e97 with SMTP id q26-20020ac25a1a000000b0050945415e97mr1368218lfn.29.1699454043887;
        Wed, 08 Nov 2023 06:34:03 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id q10-20020ac24a6a000000b00507a3b8b007sm686773lfp.110.2023.11.08.06.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 06:34:03 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 08 Nov 2023 15:33:53 +0100
Subject: [PATCH 5/6] mtd: rawnand: gpio: Support standard nand width
MIME-Version: 1.0
Message-Id: <20231108-fix-mips-nand-v1-5-5fc5586d04de@linaro.org>
References: <20231108-fix-mips-nand-v1-0-5fc5586d04de@linaro.org>
In-Reply-To: <20231108-fix-mips-nand-v1-0-5fc5586d04de@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_063407_958706_911FA20C 
X-CRM114-Status: GOOD (  13.35  )
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

The standard property for describing the band width of a NAND
memory is "nand-bus-width" not "bank-width". The new bindings
support both so make Linux check both in priority order.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/nand/raw/gpio.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/gpio.c
index 5553101c709c..d5bd245b0c0d 100644
--- a/drivers/mtd/nand/raw/gpio.c
+++ b/drivers/mtd/nand/raw/gpio.c
@@ -183,7 +183,15 @@ static int gpio_nand_get_config(struct device *dev,
 {
 	u32 val;
 
-	if (!device_property_read_u32(dev, "bank-width", &val)) {
+	/* The preferred binding takes precedence */
+	if (!device_property_read_u32(dev, "nand-bus-width", &val)) {
+		if (val == 16) {
+			chip->options |= NAND_BUSWIDTH_16;
+		} else if (val != 8) {
+			dev_err(dev, "invalid nand-bus-width %u\n", val);
+			return -EINVAL;
+		}
+	} else if (!device_property_read_u32(dev, "bank-width", &val)) {
 		if (val == 2) {
 			chip->options |= NAND_BUSWIDTH_16;
 		} else if (val != 1) {

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
