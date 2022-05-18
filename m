Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5E9C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 18 May 2022 18:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hj1NmlY7iurXbgGrqOj/VchOduEIqsWl0JK0Xse7CP0=; b=e90BHDb8eFAYNX
	b6JOqwpPHgNbsiyxKSUiJBzqbPyUMcEKpiWQAX5rSGgNpWH6Oif5KrqKWGSJScQj35aLo8IQZsRzC
	uyXRQ22dT2Knl53G9kmyc22TO9bCzWWqi1PyNh3o0xZQmCZTxc3OmRFKWHXOmCilnYPUfCBhwOSeN
	JU/zuWUv36JgoPJbZg2KAwUA34zk2dFcn0JdeVozBuo0QmicvwmegTeTCe6vLvYmofbkhnO8FjgZK
	s9nSMpaxpISY8U72JAgBsZoFzcI/ZQL3i0icUksV5WdtYWwJ2YqYeFm1V4v92CAUbbKryDGEwgKJT
	I1DKlTM+ILWpdeRfJi2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrOdj-003TTK-IE; Wed, 18 May 2022 18:43:19 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrOde-003TQ9-8d
 for linux-mtd@lists.infradead.org; Wed, 18 May 2022 18:43:15 +0000
Received: by mail-wr1-x42a.google.com with SMTP id u27so3067138wru.8
 for <linux-mtd@lists.infradead.org>; Wed, 18 May 2022 11:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LCQt9dF5/Nd3/Isv+mV5CnUwo5R82LECwM2pguJb50A=;
 b=TuTrW85JBFEdq12t36v4JPlKIQEDeS4N4Lzp1EDwAnp0onOMiAlex7/6IuElJsKadP
 gahiCwCQWh0sM8QKcPWWfmkkR56YLM1fxMY2gnC2S8wX7vm5LMuH5I2/f9XfQpHph0nW
 APsPKBb8sEH8EDy0Pmactr13MFtbH3caebPj7d0SuvcyX0w4u5vIEhNu3Wyq3vAvk3/k
 WvoHuRdh6YbMW7M0SeRbVcsJx0xbwgEe+vs8ScrMA77KZPm5rG26RHz0BUHds2QJ4D2Y
 5HCKVaIhA87kaVw1BD29F96jTmHlQenfAh3LiibCfsvrzTW0fjNEbgaKb34BQ+bFJuUz
 IwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LCQt9dF5/Nd3/Isv+mV5CnUwo5R82LECwM2pguJb50A=;
 b=qFHM4QSP75w8LzZJi19WbCHW09SCpP6hhABxcb6tpmXNoPjFL/4e44jNyWSVx70NLP
 wAthz/jOSFD/vM6hWHufN1jZVn7NkrbhlPBW4WzzKv6qNXErLX5kd7PtLIPSci8Z27Ad
 27H75PXRTKDPsi5d/GtBFfmbv8lt1va/tIerdaTpjNqCl+afpvx6C45gUynvXJXfsVMo
 pThcpkJ5kSezFmVYEzcCYEG0XS/SKhq9ZcNJ9V7GHYFDm9A7WzxF0ayAGqu6twIxjC3C
 Rl5ED3vSbzCZ+3XoaalcI0HVSgi45yeJHz37B+QfrMFYJaYWNTWRWQnMXh3M/are79Oc
 TBbw==
X-Gm-Message-State: AOAM532iG9yE+B+gzyDXfY5bZUVvWk/7yAQLX3PmsM1PBO7/GG92Xb94
 OF32MOp6mp8x7Q3YEPefrOA=
X-Google-Smtp-Source: ABdhPJykuWKJkrm3GbrAy+7CPM02+KOldHkPFjK+XnhxsXrzR3KDbLz3l0Czbn2VBW47MNOD8mj5aA==
X-Received: by 2002:adf:ee4a:0:b0:20e:5884:5c72 with SMTP id
 w10-20020adfee4a000000b0020e58845c72mr895738wro.314.1652899388895; 
 Wed, 18 May 2022 11:43:08 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 q9-20020adf9dc9000000b0020d02ddf4d5sm2768546wre.5.2022.05.18.11.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 11:43:08 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ansuel Smith <ansuelsmth@gmail.com>
Subject: [PATCH v3 2/2] dt-bindings: mtd: qcom_nandc: document qcom,
 boot-pages binding
Date: Wed, 18 May 2022 20:42:56 +0200
Message-Id: <20220518184256.21238-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220518184256.21238-1-ansuelsmth@gmail.com>
References: <20220518184256.21238-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_114314_340020_4E8E9A6B 
X-CRM114-Status: GOOD (  12.76  )
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

Document new qcom,boot-pages binding used to apply special
read/write configuration to boot pages.

QCOM apply a special configuration where spare data is not protected
by ECC for some special pages (used for boot partition). Add
Documentation on how to declare these special pages.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/mtd/qcom,nandc.yaml   | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
index 84ad7ff30121..3b8244db2ae8 100644
--- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
+++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
@@ -102,6 +102,30 @@ allOf:
             - const: rx
             - const: cmd
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq8074-nand
+
+    then:
+      properties:
+        qcom,boot-pages:
+          $ref: /schemas/types.yaml#/definitions/uint32-matrix
+          items:
+            items:
+              - description: offset
+              - description: size
+          description:
+            Some special page used by boot partition have spare data
+            not protected by ECC. Use this to declare these special page
+            by defining first the offset and then the size.
+
+            It's in the form of <offset1 size1 offset2 size2 offset3 ...>
+
+            Refer to the ipq8064 example on how to use this special binding.
+
 required:
   - compatible
   - reg
@@ -135,6 +159,8 @@ examples:
         nand-ecc-strength = <4>;
         nand-bus-width = <8>;
 
+        qcom,boot-pages = <0x0 0x58a0000>;
+
         partitions {
           compatible = "fixed-partitions";
           #address-cells = <1>;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
