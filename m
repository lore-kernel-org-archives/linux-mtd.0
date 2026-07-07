Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E00C44501
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2026 11:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o88arVTMpMX7MBMLMarc6H1SUyfHL19nxdCjomoj4b4=; b=amTx/+qY2/7ywa
	dKEK6ZDPPS8SiksypWf/Brh7T7LRQ/CKHWsiwBj/QJt6EF06kPzFZtzSvthrCGSZLWKXQGs3n9LZF
	Fi6fMpk/HBJVEW65abhhKlrcyV87snMNKMXjNVn8Y8EcZVyfyb6TomvwYQEW1E9mgHfakYSy4EmIS
	RjFxM7rU572PONVMaz799tPPw9Xlys09IluWieBORBJoxbn7NCryEcM9OoqReXs6pMQCc+QZoM9+h
	anR6r3FDCh6NlUReTn8XzlQWOhrlpP2jO52vHKUy+q/LvNyi0QvibxGiJVv6dFH19RGegfZxyDnhA
	1LtQ5xzle7ITN3D2q4zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4Pd-0000000Eti6-2dia;
	Tue, 07 Jul 2026 11:56:29 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4PZ-0000000EtfS-1mOd
	for linux-mtd@lists.infradead.org;
	Tue, 07 Jul 2026 11:56:28 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-493b1710405so25942545e9.2
        for <linux-mtd@lists.infradead.org>; Tue, 07 Jul 2026 04:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783425384; x=1784030184; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+BRFTSXmxEyf0zn6J40dawyzSU98C1I44YPIDxQ+qYw=;
        b=RdH8/t0ezmRqJwT95Y5BVvx0OzW/MlamaTXXLA0XoTl1Sep8PCAMaiCUqAQPIE5D9A
         7MMoniSX75lWWHxZmhw4kMQy3QcOg9S61t9IL8hRXc3Hbx86WWjgsUJSdwucbu3evFUD
         A0m5aLVljGRn58vloN5vdyh7q5GVuFwkHKUNuvEuE/egEU5v/APK9o9uGy8HTXRbiTlG
         7DM4/pBfRnyH3CRD43aY2fdc5pCYKJSSMryvgYYxEM+gIN6uINdtWRqW7PO4AZNaYg8F
         mV+U3Ongz9B/1t0X1SLp+K3S37pms6RGOMNFrZHJOiob4jn5H9+3Aoox4P2bukJff2+f
         8psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783425384; x=1784030184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+BRFTSXmxEyf0zn6J40dawyzSU98C1I44YPIDxQ+qYw=;
        b=OidkcCLc4jgzLqB90MSAEIDE1U1onUZbEyz3Cxp/X2s8smwQWG9L785QHLxgyeL1+I
         2hxIyhYpvPfh7DNaqqBnmSc3JRCZXKL4x2dQQb5EC1iFIi6i7YfNZJZyGLvZs5hhZEQt
         00mXHGW/yQVdZBIgs1Fs9j+a4RKb2rP72LRgAaHTN0gk5mT3P2WmfXYm6jhBxwnxuekm
         eEhiuLQEEI2Pb7BmsvHmiXa63UQj9gIqe7hmi2SbYYR4iIvsGwjv4ux/t94pUVqgxVF7
         rhA6oFRiVFk8b//o7vGGbRmcBOAdskkN+kwHM1wSD+AUjg5TptjBeAQdoIahHnSz3188
         spHQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPj8t28lXsaKRIsRP2aWdAopoueD5S2UWAFGPnUQ98vwlkeJWw69sDOjmnBYsI1hwE6oTEXXKtgNM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz04aRuzIyHTZqttSIsZg5IEsNRhAGiPdeV15dsM/eYUMQ6l1db
	oYoqjxCdVh003skgw0TtIvkjz71B0WjfxMCnZQrCO/A0JugvcdLN8fnXWeap1yWcBqg=
X-Gm-Gg: AfdE7ck2JKvuGwKWTcxKoT68teFW3V/hCvsHFm+9DDtOFUs25ZiTD82LySMm43MTYuD
	drNSESdP23kUJjSJsvFLao+UNndX5c+eMD+MPF7X1d5X5ore6hhFSnOlMUZDQ3nagOTI2ST5eHG
	UVBWJU+/nrlBNSj7LQoqYg0vHiP34fSzyJpewDloqsQs9yzB48wCG7slBF06GAInKwK2XzvojDq
	Q65fsCTazx90tXLYdlfTRMgI4lTc8bODTeaVtcmqh9roS2iEiNhc+YwfGz+lWJAXQLTea51EonI
	QCbtJBbTR2WZBBi44I+OfIhCrQ3MobbYlWBvOs1W/KZIS93advkbNgO7aPkFj2RPOH5QHMat5aS
	6xymb/9o2FPrK5QJMGuCiSwa9UUA8AIeAh0/wCnYRK7JvRWbLMy3aVae/NgfvcNwwq1qqhVzr6S
	TDaYalRGOWS45Bqskjs+0zjok4nQ==
X-Received: by 2002:a05:600c:548d:b0:493:c76a:2363 with SMTP id 5b1f17b1804b1-493df062bbfmr53504795e9.6.1783425383827;
        Tue, 07 Jul 2026 04:56:23 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:adab:817c:53a0:8f31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f5ca1fsm55401235e9.15.2026.07.07.04.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:56:23 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 07 Jul 2026 13:56:02 +0200
Subject: [PATCH v2 2/4] mtd: rawnand: qcom: Make "aon" clock optional
MIME-Version: 1.0
Message-Id: <20260707-qcom-nandc-mdm9607-v2-2-d906f7e8b814@linaro.org>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_045625_502962_AEE4C20C 
X-CRM114-Status: GOOD (  15.77  )
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

Some SoCs (e.g. MDM9607, SDX55) have only a single separately controllable
clock for the NAND controller. The actual clocks in the hardware are
managed by the firmware and turned on all together when needed. In this
case, there is no separate "aon" clock that can be described in the device
tree from the OS point of view.

Make the second "aon" clock optional to avoid an error when it is missing.
For platforms that really need it, the dt-bindings are responsible for
validating that.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 4b80ce084d9a..0251dd591d40 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2280,7 +2280,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	if (IS_ERR(nandc->core_clk))
 		return PTR_ERR(nandc->core_clk);
 
-	nandc->aon_clk = devm_clk_get(dev, "aon");
+	nandc->aon_clk = devm_clk_get_optional(dev, "aon");
 	if (IS_ERR(nandc->aon_clk))
 		return PTR_ERR(nandc->aon_clk);
 

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
