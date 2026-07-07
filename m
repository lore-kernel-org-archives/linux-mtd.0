Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6ACC43458
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2026 11:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sY9cikniri6H/i08bfKBI2OILdP3y4LIr9kWm4RmgN4=; b=cibVT8Eimlh2Zm
	oi5QuHFyCHu3zgjmRSA72kmKQ9uxQ3KXOMfHypptjtBfm5Yl0me7F0o6BG0ZOw4FwHuOJjWWPqVcC
	xfb1zpK8wpFn6+PGKUBqVI8wY+14QfobVbzMUSpRT3oBarllrg17A7GY1qxnnXOt0Nue9Jwjh3vY9
	KxWBacvEcsDaTOVnsAMA3yjJT4oKHK2NEWrMbr11hQsKtKlInJ3ohvxPo9wJfncpX6Hy/fSgoBBFG
	VIhjUmiJXHzdJRWKYwJQHS6PczmCxsRHtaI77/tEyldt8AXD0+rSW7n6PJSSMLnadPm6rOWMEhn82
	Phacu1JFym1lJsTj6BNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4Pd-0000000Eti0-2JDc;
	Tue, 07 Jul 2026 11:56:29 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4PY-0000000EtfD-37xC
	for linux-mtd@lists.infradead.org;
	Tue, 07 Jul 2026 11:56:27 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-47de0093c42so2157035f8f.3
        for <linux-mtd@lists.infradead.org>; Tue, 07 Jul 2026 04:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783425383; x=1784030183; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lgMT9Upuh5KVAe4sPSM1sPIhFZuI5vEjoVoPpztrNMM=;
        b=Nc2Z8hB/wqJjo5nqiAQQUI18g5ZIO1Z/cQtrTAF/ubzEP51rG7ovmMjTsywZV4Own8
         +PyjuvWrYVjvZ0l7z00bqIL7s1avXstf5dSzfvQNmLFu1sOEbZHY73zwNcVKAHvaC3T8
         B9D5Pc7V12+UgmOSSzxVAp69OA+bsRyZM+EslbCX2/I2jIMY6nAC/34+/hs0+bJNnE+W
         K2jBfTtfBu75eM05FjX5lwY4LD3YE11Ep+4n2vBDd2pF/cz+wYbHQp9wMWQVRFkzzkbA
         d3MG3PXlIEjq+3rZ1+Dq3Tb6d1fHdcb03qLPX2HWTk+ateGXHdXdxnb35Q8LWCi94jDN
         FjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783425383; x=1784030183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lgMT9Upuh5KVAe4sPSM1sPIhFZuI5vEjoVoPpztrNMM=;
        b=D8PPDQk1bmPLE8S7JPEoacKDgNK8drC2hvBzfEZiwKZ+RScvCkuutcu2IJ1IjJ6k3N
         rvSva5wHicId9d7XodpOgpCT0knql0vsrMyXInCDSaMV1Eja9FToIchE35LdKSzyp1An
         HGwI1ISdeOUWfUuz00tfKS5ejpmHDxvdQn0xsUNesIebeQ0D7NsquIFdMgeF0LQdJSjJ
         QgyB7pCZgyQFboSksdFFavml43io8EejVuqqYSNb5FoM8czS1AKjnv1qWRM3NLAFN6aB
         PkKG89GW7dCaJMy4zzzB23xKHk4fgA5NKvse4xrdLnu0LMmBu89kQSqRZ5ob8vRilX4J
         8Uyw==
X-Forwarded-Encrypted: i=1; AHgh+RowHe83u1N0ySQwMdzY+ShX3DpCLqGvtLGRha4GBEKs8i8jMju6Y/kVcLyBYhgiKSG2MQSljVedqzY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxOAgTZX0/rm7t5waiLgxqHRNXpSEyHCrjZdfcmT18laCybrbdq
	AQUdhveqZw2Bwu6JyuPc8M1PGfqMA9Y89ojODE75wJqawEVE0xJgaYOiziUqNURu7Cc=
X-Gm-Gg: AfdE7cnDank3zftZkEEYKXPqOkLscGqhRJPe+r1/KzC9+KP5b5tfK7oesT8zO1igrkr
	C9LWJrHRF2AXydSbdGdGUS2iT6g15jg5QyoTSVzkjvxTg8OdTTWyS7u0g4wqK9aFnb8scZeGyH1
	n/PLUIoxH2iD8kUqA+XhKxBG0YyE/aJWV5Jv/1EdyNMIIX/7iyQ3AP1cvL0UyD+GIuGzApsnabw
	PGHRV3v2GUn1whGVp+xEUGwSlTw7X/j10sWHx1ouTtmBfwA/Ia1tOnEDCr7aTYOXWxQb2Y4dclB
	SdN7c3uXKspmwtUgwEE+g9xAyY8y7q0H8ZwL8Cu7NG0WpYBtr9hP0M5Rn94yHj/zK/rc+HTRK+i
	oSIrLCKM6UnOfgVgaGSZYjd5XmFFhL8n9sAJoTNpuARTESCnjQqxul71u8zlB1e8yLH8yiB9IEp
	p88w1kZDm5xHkwcKW0wLhGf+LwNg==
X-Received: by 2002:a05:600c:1d0c:b0:493:bed9:b53d with SMTP id 5b1f17b1804b1-493df09b330mr53502095e9.31.1783425382814;
        Tue, 07 Jul 2026 04:56:22 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:adab:817c:53a0:8f31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f5ca1fsm55401235e9.15.2026.07.07.04.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:56:22 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 07 Jul 2026 13:56:01 +0200
Subject: [PATCH v2 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
MIME-Version: 1.0
Message-Id: <20260707-qcom-nandc-mdm9607-v2-1-d906f7e8b814@linaro.org>
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
X-CRM114-CacheID: sfid-20260707_045624_804360_A84F73A2 
X-CRM114-Status: GOOD (  13.06  )
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

On MDM9607 and other recent SoCs, the QPIC hardware requires 3 clocks
(core, aon, ahb). However, access to these clocks is restricted to the RPM
firmware that controls the shared power resources for the whole SoC. The
clocks cannot be controlled separately, for the OS view of the hardware
there is only a single RPM_SMD_QPIC_CLK clock that implicitly enables all
of the 3 clocks. The only exception to this are some IPQ* SoC that are not
using RPM, there the clocks are directly controlled by the kernel via the
clock controller (GCC). Require only one clock in the dt-bindings for
MDM9607 to avoid having to define dummy clock entries.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 .../devicetree/bindings/mtd/qcom,nandc.yaml        | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
index 5511389960f0..a916cac53af6 100644
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
@@ -101,6 +104,27 @@ allOf:
           items:
             - const: rxtx
 
+  # On MDM9607, the OS can only control a single clock.
+  # The 3 hardware clocks (core, aon, ahb) are invisible to the OS.
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
@@ -121,6 +145,7 @@ allOf:
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
