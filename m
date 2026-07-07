Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B1BC44502
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2026 11:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ESTrUNw7I8Wgr4TjtETmnXyuxXTMBt8rxfLzqA2nIDU=; b=FwpuyRCvKYVnFq
	w0QfgK9gC+HrizElTKSQ9HAfMuXZe8CrvLs7CGsY1nWvVbUmNzDTfjmMUvDQ/AJfiFVAPXt7Pwoya
	fxPyo3QwiB7bf2BbkCUKNuldOgvuEPfj8airROygTo76Pvqutx5YwXHQPquoO3aDf8oAVuquzfgNy
	3SgOJ+4CKeE5DOdGOkEtoFZE8ozX3vjMdPlYzOk+IAIxa2CFEj4lTPz1bI1Re2cXNEcGMNsDHte/e
	jGfw1kd4cC726juzoTyW1ZHBg7lBGaAUUSXSZlvN8Osfd6GhLjM8LDQO1UGUxO1PLyqatEgyPBH8L
	NJvknRdHNmGUKVpdqh0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4Pg-0000000EtjZ-1DJZ;
	Tue, 07 Jul 2026 11:56:32 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4Pb-0000000EtgO-200Z
	for linux-mtd@lists.infradead.org;
	Tue, 07 Jul 2026 11:56:29 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so2053480f8f.1
        for <linux-mtd@lists.infradead.org>; Tue, 07 Jul 2026 04:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783425386; x=1784030186; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f2S6rAWtiJyKZBEDfHqasxM//kokkelrrLcftHh2iTo=;
        b=qX1U2f93f0Q1CUy4KZEuKMtiiKzhMwLKGbwqt7jEhKFJqrLfcMKY6+x7+M6q0KrPbv
         Y1pwOPOs1Qkx3BTuot3fHtsI/1VnyXo4/ujagaKp6J2tZGzpvj1nBUBGXdpYKLC3AYOO
         YFuzARi+3jasqLpY6nQl+DSKqvuciPJ+jBA5j/bv2/V7vzOPD2OE9LvJkQo9EeOrce+j
         /+pN7P8mnH3pyxtCDPliUCvSEVVQ5G8uvrrE7D7Tp4f928XpZAy0wIYntlsgvk5EdieC
         kcTe77QAi64BJpcj8+iewfZmO8fwOtTTkM028czYkyMytbOU1b6luoTb/ckiw09RIvso
         LCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783425386; x=1784030186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f2S6rAWtiJyKZBEDfHqasxM//kokkelrrLcftHh2iTo=;
        b=kxYoYs1HxiXN06MyNntoOz+psdmoCffB5qUMjysr11gsP0XNk0PlDHeytBQxQwP/7e
         ODgXAKZMXh/4FzJzJPFjUNnmda9yTB8W2bu8nBYmjR+l7+rdYs+qS2wsJWo4BHRXU4VQ
         wz/ITLIzrZm5tajBwzuFslFN/WuDjQ+NS4HRQA1gEapzIlLwJlGebin7+p/26Beu/k/D
         HGEJ+lDXEU+pDzneZJVw2uIsOOa4MCpikZo692I5BLmB3Ezl6lRN1T+eJe/WXFmSl2UW
         pAMTsYwbNjLBOlpJrDXo6c676E1iDQBhKoAueGn7m/Uz1AYYk5QBFUsrjS7/5EBwl5Tz
         GV6g==
X-Forwarded-Encrypted: i=1; AHgh+RrWmjlgF5gaNpckMuh0PYLG+kf5rB18mUQPMv0IUr0N/xpaqsxC3npUHl0Lu26J0z5Ee4LhCS70NpQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxeEs9xoqtlGodsznrBH4pfFoh34kBPURBcTJoQ558TFQi2+L2B
	1GeTHiPd2TXXFZt2Uj4h8af8xIgrr+TJ9M29aeQNPM/6r4JTMS4KCUw5L3k2AELKfow=
X-Gm-Gg: AfdE7clRLhAdMszCHGP76fe1GUpDOqD4aKSS0Kx2aD7xwjcY3Nq5G81gd5UJteR3o9J
	fYd8s6LjSKkA93YPusRBzT6flxVebpkOXIWS0YdeRdD7GFx+UZ6QRv0EEOQFoEssQz9SW23OzbN
	S0lJCLXWpA22sJsWUsjwCVhOARQYjurJ7+czo5eAKRSDeI+3+v4SPWpER2n9CeAYOXbMwOycYAa
	K2ej+7TNbZ4lID9IlBO75eWLPaDogrQZtqnMp2ldyX48m6+hVR1/1KuI32BO9eFnQZ/Jw0pfMSV
	SbjJKmEVj6zsIDqiqbIar2PRLUNdZWNSqqz7Q/PeZ1qQyhzSxFCVRkAPAnadMUAcnDnqZS2O7ix
	OOnYZoorKlWLaiNAZXeUayRITSxtl7YnqPAGAItRFyNgA1MpxSKt9YuvMfbtVnBYYKduqd/b08g
	095LsyjqRo+POFi6fsgHWNm4wZjQ==
X-Received: by 2002:a05:600c:82c3:b0:492:3e69:a86f with SMTP id 5b1f17b1804b1-493df1c9602mr49298465e9.1.1783425385675;
        Tue, 07 Jul 2026 04:56:25 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:adab:817c:53a0:8f31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f5ca1fsm55401235e9.15.2026.07.07.04.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:56:25 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 07 Jul 2026 13:56:04 +0200
Subject: [PATCH v2 4/4] mtd: rawnand: qcom: Add MDM9607 compatible
MIME-Version: 1.0
Message-Id: <20260707-qcom-nandc-mdm9607-v2-4-d906f7e8b814@linaro.org>
References: <20260707-qcom-nandc-mdm9607-v2-0-d906f7e8b814@linaro.org>
In-Reply-To: <20260707-qcom-nandc-mdm9607-v2-0-d906f7e8b814@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_045627_920242_F10BDCA5 
X-CRM114-Status: GOOD (  12.02  )
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

MDM9607 has QPIC v1.5 that supports the OP_PAGE_READ_ONFI_READ command, but
is missing the rest of the hardware changes in QPIC v2. Add the new
qcom,mdm9607-nand compatible and set it to use has_onfi_read_op without
also setting qpic_version2.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 9217e8de5512..d7642db2e2df 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2381,6 +2381,15 @@ static const struct qcom_nandc_props ipq8074_nandc_props = {
 	.bam_offset = 0x30000,
 };
 
+static const struct qcom_nandc_props mdm9607_nandc_props = {
+	.ecc_modes = (ECC_BCH_4BIT | ECC_BCH_8BIT),
+	.supports_bam = true,
+	.nandc_part_of_qpic = true,
+	.has_onfi_read_op = true,
+	.dev_cmd_reg_start = 0x7000,
+	.bam_offset = 0x30000,
+};
+
 static const struct qcom_nandc_props sdx55_nandc_props = {
 	.ecc_modes = (ECC_BCH_4BIT | ECC_BCH_8BIT),
 	.supports_bam = true,
@@ -2412,6 +2421,10 @@ static const struct of_device_id qcom_nandc_of_match[] = {
 		.compatible = "qcom,ipq8074-nand",
 		.data = &ipq8074_nandc_props,
 	},
+	{
+		.compatible = "qcom,mdm9607-nand",
+		.data = &mdm9607_nandc_props,
+	},
 	{
 		.compatible = "qcom,sdx55-nand",
 		.data = &sdx55_nandc_props,

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
