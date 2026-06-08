Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C141ECD8C9F
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jun 2026 13:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jikgGJ04Ny2+vCVPSqq2vaoWhJ+rzT1/I2/Y4HmNCXQ=; b=o93wyrSU4GA0qo
	04qkOsKBWuWOzyGA0uO8JMAG6drv2mjYhIODpaC7KCaQCi2YL2qqoxpwsaV1Wx3hQRqynYvYHmAA0
	ME1uk6OOivSWJbAosX1OlFyYRRcipqR1O6jHD11J+RXldjhQejCuLGkGcH9UFzK86qq7T7Dbwn9TG
	zw/x4k4Jx0lI5M6RqXd05DI5yr4W/zikEkJAeZli01/REqjp347bYZgVTMuIrjwyI5FoUkeROgXCX
	Ac1dUgcDsv5F2dU2QH/CKvIJmTf/0YVx9gEF+11TXcTe5d7oW/6d0CjXV31KuH9z4HtQkmIb0z8qU
	8xpeH0CEL7I+oO7ZzfcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZuO-00000003bUO-2yQJ;
	Mon, 08 Jun 2026 13:20:52 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZuM-00000003bSs-18EU
	for linux-mtd@lists.infradead.org;
	Mon, 08 Jun 2026 13:20:51 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so28167805e9.0
        for <linux-mtd@lists.infradead.org>; Mon, 08 Jun 2026 06:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780924848; x=1781529648; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nTitixK7p5wGlkH2q+LYGHH8Q5benyrXkOJwJBLEA1g=;
        b=Lvgggsq8uRkuiZxBCKJQl+ot9Q27+rlx0kgu4inazhFR1W7yobGDygR84jheu2K8XU
         GTJVjVwplCHku+0RRkt+4v2EKkCfnm1B09VddbD92tqkafu1n7z1PE8nY5pfMmr3HLVW
         IsjpZKZ4Qju43UGn5OQCDZ0Q6QJBQYqscJm3aToAGDyZLLovYbbkRRSdXBzJTYwWDXB3
         ynDdVNq1XqwWEU0IFCk2z2T55+XLeP4qRPWrv1y4i6LA0+g4e8n3h2TCY0AOjunKq0pE
         zq5hJIp8VoDobSFjyf64ZnkOSqMeNsXrIz+d39nwCbzdfz2NHgLU5FHEGDUoC197OTOP
         KG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924848; x=1781529648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nTitixK7p5wGlkH2q+LYGHH8Q5benyrXkOJwJBLEA1g=;
        b=PUl/zo0aKYYen8mx9Agrgm1n2scdEvtcj+3lM051aE7R3ehK1jBVUe4j1FbWIbMzgx
         mVcXBN+8qwjr1WS6ekA81I1gb+CXClaPm8Xt1l+Rinpez3dnkR+8KmRcOenfTZC2Y38Z
         2AVvqT/Yep5AEvuMh4j2vb7j2EgGc8oaStyE7BUzec1n2uWIF4qKOE/6LifGDeLaQmiF
         w5O9g9iPd0JZsOmHhzuWt3DG7uaaE6U6Lz60ea3WG7wSXmUlykVI6/g67DssJRk2g/EW
         9VDNmCIS/FiD3kdsGjfhR7FeZ1Ls5O7bTfDkAsPFcXDBKwdwwl51aBmW0gzrV9XB7DUN
         IffQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QUcn4zTFNu9Y62p1rrdf6j51JOAIfAfUdxjhep6Rn2X71Z0yFJ1CKVG8/dvzqQslpe/Tz+6tHGrI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxNeICk2lR7e13uyXips+2vFJs6gK9ZhhWZPx5PV0jDn3NkUHd2
	GOXcHq0fxyaAXHMD5yH9XbuSKmGlYTgeLL2UXzgjCbOuc+Y7ceSaxsylrax6gnuNn3Y=
X-Gm-Gg: Acq92OGdlNEGHO+/6G8Oz/WuxMYCyjmEec/LEYAnD96NDeEb+S8gPTYFdWq7rIqjggL
	EX15FJiPouW/DLKoDtQmHpGsIpX5c84F/rrdXn6zeZFckR+MFcLgawlIUdQnCLVgDGaagU87CXX
	H4vk8q2eAXBPR2YW+MR2Woe0a0G/lgwEqbuN3bZBJXLzzuUXiURL9OW5uSgfxikIAs1ZVcPQJP0
	6m/7iz4YCYPuXj5J3aZBAgKSLMNH9Zam/wBAeoUtziaIHc+TivZfs//G2QZ7W6Xz7ROSY/G4/KT
	oVQ5wtGuKdEhgx2CW68SpGPltmWb7xr2L7PtUilhdnRPQcPHgV3e6/iAgHJjW77Pm22Ynl4tghq
	ssXjdP39CM8/05gw6wg3b0r0jYSfcOm9E1/yWRRlTVHffYksGmF9SliXToJrETLR7r6UwP7xEU3
	ZLaWnErOuuZCsyu6VV/bKpPWDuhYhUMpzZWUQKdwQP/7crIM8=
X-Received: by 2002:a05:600c:198d:b0:490:9d1b:f086 with SMTP id 5b1f17b1804b1-490c25baa0bmr261899205e9.14.1780924848315;
        Mon, 08 Jun 2026 06:20:48 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:963d:8b06:4a7b:c38f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f34413csm51684983f8f.21.2026.06.08.06.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:20:47 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 08 Jun 2026 15:20:22 +0200
Subject: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
MIME-Version: 1.0
Message-Id: <20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
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
X-CRM114-CacheID: sfid-20260608_062050_328910_7B232FBD 
X-CRM114-Status: GOOD (  11.77  )
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

Add the qcom,mdm9607-nand compatible for the QPIC NAND controller used
inside the MDM9607 SoC.

On MDM9607, there is only a single controllable clock for the NAND
controller (RPM_SMD_QPIC_CLK). The same situation also applies e.g. for
qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.dtsi) works
around that by assigning a dummy clock (&nand_clk_dummy) to the second
clock ("aon") that is required by the dt-bindings. This is not really
useful, so avoid doing that for new platforms by excluding the second "aon"
clock entry in the dt-bindings.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 .../devicetree/bindings/mtd/qcom,nandc.yaml        | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
index 5511389960f0..4a9ba32cbddd 100644
--- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
+++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
@@ -22,17 +22,20 @@ properties:
               - qcom,ipq4019-nand
               - qcom,ipq6018-nand
               - qcom,ipq8074-nand
+              - qcom,mdm9607-nand
               - qcom,sdx55-nand
 
   reg:
     maxItems: 1
 
   clocks:
+    minItems: 1
     items:
       - description: Core Clock
       - description: Always ON Clock
 
   clock-names:
+    minItems: 1
     items:
       - const: core
       - const: aon
@@ -101,6 +104,26 @@ allOf:
           items:
             - const: rxtx
 
+  # MDM9607 has no (separately controllable) "aon" clock, only "core"
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,mdm9607-nand
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+    else:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+
   - if:
       properties:
         compatible:
@@ -121,6 +144,7 @@ allOf:
               - qcom,ipq4019-nand
               - qcom,ipq6018-nand
               - qcom,ipq8074-nand
+              - qcom,mdm9607-nand
               - qcom,sdx55-nand
 
     then:

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
