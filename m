Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E22CA1014
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Sep 2025 12:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qwHOBE9IjI7RhixSj6t/UAaOV8K/FilLDKXwdH56fvo=; b=baZB8meHoLiDut
	GZ4cfzwMdQxm4dxZhFDmHYv9NWIGx+Hmkxws3cpvtILGAtFQBIAIdS8bgA/33jWWStoliXwJ8OcOt
	CbS2MjRVNWtcPUEvh9zSVYYqJaAG7dM4xUur8/rP94H71ahCj9wSZeMpZzsV3RblayWHjC0DsU6XG
	XOjNu0h9ZU5FxqdtXSqc+f0ZQCPISzJ4nY+S1ss+JC2pedLBpUGxb0PI9pF8F9mMMB1N83ZmgPvc6
	r2rXjjIzaLYRNR9OhAjyXqjPQ7uE+7ZQVTFDi7fBN89kzd3WHWyvIVAoDGRJQcsxJeCF3rlC46aJA
	8+alvvwNbMWSVN99DsFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmvp-00000006SLc-3kqh;
	Wed, 03 Sep 2025 12:49:45 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utm6K-00000006IVF-0tgX
	for linux-mtd@lists.infradead.org;
	Wed, 03 Sep 2025 11:56:33 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b0411b83aafso567358566b.1
        for <linux-mtd@lists.infradead.org>; Wed, 03 Sep 2025 04:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756900590; x=1757505390; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bgQ4mzV7w6xYRm/v1nasWaTRjoxbGycA47ijfOscHNI=;
        b=IlSi31pofe7tOp/T+84fNWzih5sCy73rr1kAEBjuCp2461SOyFoaKrdchF5/tSweDl
         JAXH5BqcekgCZStLoxBV0UN1oamRKzN0qWRPebIDwMX6iTCET7Kq4neB1/okS93+OWcF
         D8x6xkFa4rMEnchzida8J/PANH1xgWdmpib/yl9mdnyEwUEJpDxJ0fIAoZOG55UGJ3HS
         1P03lMLJsDUMXsCXGy+GFqIrbh0aKT9cBWOIzjyzxe+Tobnjla+N9WMe0Q1VTiGekioV
         JePSfwWqDlUZxM8FI0zAMogWWtcW3sKB2ZSfGtCxO6xIf5T5ZVoPNkbs60t7vxhnfxrU
         VbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900590; x=1757505390;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bgQ4mzV7w6xYRm/v1nasWaTRjoxbGycA47ijfOscHNI=;
        b=CpU57+hKbROVQ1wymUKCUzuEsL+YCsaUZri4t06aSW5Z/7jhRP4SNe0JrXBVeiHKqF
         ZXw0VMHE4KN4/Usk6YLSTVSJDyNHpyzT42xPdivM74sClAIIPUQeXFTzOdxumuMy+rbW
         PzOp4stqUnfiIbgZ+/jdYF+84QOBpbW4GYbH1oaBIA8rJ6UTbnMCzimm6D2Xsm/GkP1O
         7loR2ODoR2749kzfIL1NLUUaaMChMY6OPYmSqsdDhoko50xxyfMAeYj73imkwoKHHFCT
         mLVbBWe2RUto5Bv/mrvXJZaQF+4UUax+P7zWIATISFsCgO/gD5GAJqfYqQ7QlU7wQjQb
         o3BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFkOoz2Kkt/rUhOY+yDhbl9FxuspvxVnSRpR7mfHXk/0qreh3AzqEdWN9Pn1VcTMB8F0FXbA3N9+4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxihMUe/1JwbdcdXvScg7wWLdACZZq8Ki2JQGKL91xkqiqk2XU1
	e48sgxU44bKad03VrQ0VmP3qqT1OsL29oB0fvxEToGz2NPlzROZhU0Do7Lh6mw==
X-Gm-Gg: ASbGncu2L7g8oaLp9IWDWx3YpBM29j33HyC0Ow9Z9LWnXv3dYVFsRRP+xfYzHi9MBG1
	kI2zw8NEC4btXKxjVp7/jlXn76fQBUIT1n/t4hCkhIM92uxsWaddsKI6ZXJI7kc0smxzebmT4Hy
	h0kBJbk3l3i6C+1SblLpM7uhppurXOSM2tLC3f7pJwbPRDYV6m54qbUvtkhDEY7Za4i5muGVUUj
	cN3YTlrvOtsOgreoeasbbYhNQeFyfnyyTyZPR6opCp1RIYz/oRpG5tatkwZIaFPu/hic7a7bqiG
	6Qmc+gf08bW3grpahTrtwWtc7yCKHPq+gH3X4Daxs8S1r+NgJVD+EZZnoP58el1Gb3GfJ1Z/99e
	JWepvt8Cx5bT2tIVNlR4jQ7Q7ZfLsKuMoIUTv7Y2MWV1koBdpmlmP
X-Google-Smtp-Source: AGHT+IHlpVkoZ714lm9sCOc6c6toH/Ap2jpLri6VfZ+0i+mVGwiseAQ3UC1Rjt/7WHA2hxWgBLDh9A==
X-Received: by 2002:a17:906:9f8e:b0:afe:c6a0:d116 with SMTP id a640c23a62f3a-b01d8a6b700mr41197066b.18.1756900590218;
        Wed, 03 Sep 2025 04:56:30 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b04252103f2sm785506566b.50.2025.09.03.04.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 04:56:29 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 03 Sep 2025 13:56:24 +0200
Subject: [PATCH] spi: spi-qpic-snand: unregister ECC engine on probe error
 and device remove
MIME-Version: 1.0
Message-Id: <20250903-qpic-snand-unregister-ecceng-v1-1-ef5387b0abdc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOcsuGgC/x3MQQrCQAwF0KuUrA1MR4eiVxEXJf0zZhNroiKU3
 t3B5du8jQKuCLoMGzk+GvqwjvEwkNxna2BduimnXNI5ZX6uKhw228JvczSNF5whAmtcplxrmeS
 E40i9WB1Vv//+etv3H/Svi9RuAAAA
X-Change-ID: 20250902-qpic-snand-unregister-ecceng-572ff57c4e31
To: Mark Brown <broonie@kernel.org>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_045632_254547_03094DE4 
X-CRM114-Status: GOOD (  13.54  )
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

The on-host hardware ECC engine remains registered both when
the spi_register_controller() function returns with an error
and also on device removal.

Change the qcom_spi_probe() function to unregister the engine
on the error path, and add the missing unregistering call to
qcom_spi_remove() to avoid possible use-after-free issues.

Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 2812ffc421d27a7e932b8e11731bcbccd0d23600..28755dbce399d836ab6209e44f02f05532386344 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -1606,11 +1606,13 @@ static int qcom_spi_probe(struct platform_device *pdev)
 	ret = spi_register_controller(ctlr);
 	if (ret) {
 		dev_err(&pdev->dev, "spi_register_controller failed.\n");
-		goto err_spi_init;
+		goto err_register_controller;
 	}
 
 	return 0;
 
+err_register_controller:
+	nand_ecc_unregister_on_host_hw_engine(&snandc->qspi->ecc_eng);
 err_spi_init:
 	qcom_nandc_unalloc(snandc);
 err_snand_alloc:
@@ -1632,7 +1634,7 @@ static void qcom_spi_remove(struct platform_device *pdev)
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
 	spi_unregister_controller(ctlr);
-
+	nand_ecc_unregister_on_host_hw_engine(&snandc->qspi->ecc_eng);
 	qcom_nandc_unalloc(snandc);
 
 	clk_disable_unprepare(snandc->aon_clk);

---
base-commit: 793681dc7cc6482484fdeb658f5ac20bf0a570b9
change-id: 20250902-qpic-snand-unregister-ecceng-572ff57c4e31

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
