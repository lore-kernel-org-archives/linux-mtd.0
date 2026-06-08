Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E0BCD8C9D
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jun 2026 13:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7PGO5VxbVP/1mTPrHyCIDPB+4UuqsNBQTPTfhOaWQ4I=; b=xSuSpsa6tncuQr
	rQsZR6tetMou9zmck+DxmwfDuS98kOpZYlCDtYPMQrYX5123vR6TKRVUt/c4glaLnqV5UOYlLx3F4
	T+DZ8xXE1mIG1hLh37AfqU0Mlt5YxdT/3K7HjcXeeCbUf9IQVKLmtRTsHfP6d3xeavBbaNG7gKCPP
	v1t293EjluSL61a0zrAjg9zaWqa1qCNf3iu7yegt8kEKN/AkdLCIgjc6pP810g1dPkEt1rSTc/Alm
	UFJSichNdknvWHMgY4RQjKYY1jWqEbibiN6zmwoNgYi+lgnb9Ufcxy/4461m1BqVwcMrtc55ExfY0
	dW/QTwrsI8pupjs4GsLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZuP-00000003bUr-3MmY;
	Mon, 08 Jun 2026 13:20:53 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZuN-00000003bT2-0lpN
	for linux-mtd@lists.infradead.org;
	Mon, 08 Jun 2026 13:20:52 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-490af320e2aso48304975e9.2
        for <linux-mtd@lists.infradead.org>; Mon, 08 Jun 2026 06:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780924849; x=1781529649; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0KpA3ZQAr7zIXn0uGbXscgdRewtZO5/SMCNOMBE13D8=;
        b=bsOm4awmNTjDrjSKO+NN3NJqn25AWhgrJfnOIlU1Gu8eg7gx1FOoyO5I37Ybh+uav5
         IRjlVV1jw+92sk71SToHWgiMC8gaIRS0s7c89BlWvl7FCB3Qe+PzIpGi5OiT+xQ93ly4
         eGpMlwx1hCxk6UnRO9SHS63EczRfOAdxRJja9cCJFFuiqRu3DLeNq6BKZG/YScyVafee
         ZgQaR/W4KAj59M5XT88XHjb+gq3C74+gWTGDrqkLG1DX0+7YvGG+EwGzo+tUtnkg/8MM
         IEAA86szM+KYTysLKUJjnYW6zvElTE/rxvMtqEbu4kTOoPoV2z+ca5314ewqF/P7DkYv
         wXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924849; x=1781529649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0KpA3ZQAr7zIXn0uGbXscgdRewtZO5/SMCNOMBE13D8=;
        b=jArjrfnsuHUSJvDy3BuUslPokJqqjxyHJ1gfjFsjZtOHcdgOCjFRQhFM6U4rdg3MM4
         f3lQC3XQmxjHJrwkM/p58hB+DMjIZ+U2SkrkmIucPj3cNC8t302RqCX+C7gR+rdMqA0a
         t9mkIiwrkf6j++5hJWbhICoWbHPKr62x0zk23XEMu+tIV1KQxe9rCvCB0ccfG+59WRkr
         OncjdDREua2kxosE0V0u2D6pifjKAl5WKj4t0YUOd8uFaKVQ+8wOmb4HNPox+cQDBOmp
         3GDoG5hw2tvtW5oPducekgUy3fYDdqPbj1w0KIAagD/007M1ORYxtaRQQQQRdOJGJx6B
         Agaw==
X-Forwarded-Encrypted: i=1; AFNElJ9LGziBAlGgUuM3XyTikejGTKejoSCIwvCYDQGnTGaNIuc5Wp/DWGh5CPNFNjHs/D16clmnAbh4Eaw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyHmvTzXcDq4HDX0x611xncRqBWTUwbdnjzwpu5tWaZfYBz1YUy
	nFa5QZp3fXnQiwSHjnznEJVjXeGhwAIz1GOBS8HCa6mMWJZDEKWiMX0uWoO05ZbQiQA=
X-Gm-Gg: Acq92OHAICdLBdQlWHX6OgHDurLSsTkrPEOo+RsDTXV6m1KbpZP6lEKOPzL/WrOG/Ew
	e+KbWBp7X+Kpv0nkBecspmsQpcCpxMjd/SbT6aHZh0atG2/JZ5RwgzjKieLB30DLTLqWmymUlE4
	UG7AsitW0lPHZPeRJ1SJ9z8mprR8eBcflDZRmg9F7Cl5+xiKADFDBPlxqKL1RyQ0gnk6RkULFCc
	B4li1UqceJWQlUb9DZVpuIPr/z5Wq4++DFECRaJfA4fnCsp1zSFXLAUuc9+1JMAmetfvLOChamZ
	El6rVaCvhTliDgjDlmDjIGRZRStkV5ikyD1Z0vTu7KIQ9j0V6NMlEgpbRwJ6p1bWXW+XZVyBV3D
	hIr0stk2CpakRs6TwDehB1xbipFPMjKF8z6loonRYqotzbbksEqhz9axQXj6gLWrNRzNYa7KXCe
	MesvVXEy2443uuzOwXfx05EKpKybByH31pTc5dtx+UELsLxLk=
X-Received: by 2002:a05:600c:34ca:b0:490:9df1:f0cf with SMTP id 5b1f17b1804b1-490c2592042mr268917625e9.2.1780924849190;
        Mon, 08 Jun 2026 06:20:49 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:963d:8b06:4a7b:c38f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f34413csm51684983f8f.21.2026.06.08.06.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:20:48 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 08 Jun 2026 15:20:23 +0200
Subject: [PATCH 2/4] mtd: rawnand: qcom: Make "aon" clock optional
MIME-Version: 1.0
Message-Id: <20260608-qcom-nandc-mdm9607-v1-2-4639a0492274@linaro.org>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
In-Reply-To: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_062051_265730_F86EF1D0 
X-CRM114-Status: GOOD (  14.57  )
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
tree.

Make the second "aon" clock optional to avoid an error when it is missing.
For platforms that really need it, the dt-bindings are responsible for
validating that.

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
