Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD1EC43334
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 13:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5vjppTTDP9vJklgFPzJV/tu5XrkCuBOpd5PXEYp2aRw=; b=18y06m8FL+gsKg
	yutauXgsL8fCzdbEh4rKrdtYcNMD0VHEBEj9fcT7d9VlAYfgGhgGoZsysv/cssWKwbZfNGoELu+hY
	YvatEOaOx17jU22h1amVaGNCCoyFn89idRkcySwyDms9Ja5t/IBSzX+FKdUM6StD7z5berX+DO6Ks
	5i2IIfQpui9YZrsIM0ZsjXPbHZqO9eoACCQSQgJl27c2s390fBMShZXvYwiEL62yzU4TBK2Ohb5V7
	2qTRerniOjp7xWyT/xErcyKAOw2KIbl25geW4vMIx6foYEHngkj0KUJpHU+odB+BEMokxxnwmOvIC
	CYq6yDw+h9v94IhVzldA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzI9G-00281d-Ta; Thu, 09 Jun 2022 13:24:31 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzI97-0027un-W9
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 13:24:23 +0000
Received: by mail-ed1-x531.google.com with SMTP id z7so31167566edm.13
        for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2022 06:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6jeqtgRl8bKHnXZ4AwxPt+xAQ0F0PxiC5aWs7JdMOrY=;
        b=cJVhmrHYyT63kIWknwWNHq8H3Fm9koj9Te576ocCrSOqv18WrgBUMotLdhsN3HIdgM
         /aoYBLe/1EthBKwzLMOnDMzMig7pgkcWUDz16SM9QlGmsvii3FqSwftw9IOpua1hqHWt
         25Lmz9S4wLtucB+FC0jlpNDPXt28Iw7T+JqGvOtDSU9eNPMNLImvrJ4EyIofVj3wjzF/
         NmsQbdligcS3Jl35T6bp6lduzJbYTPUS2LCFpZA5Koky7S9y1t5KWRyGqqGgjh0huMkj
         4YDSGmibIrJm/1RE4XIvWQzFiHPn6y7ILU3OChbYMf6D77+KLKMiE9opqoyC8nXEIaNw
         Emdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6jeqtgRl8bKHnXZ4AwxPt+xAQ0F0PxiC5aWs7JdMOrY=;
        b=NyDu1waWgQEB5m6vaPlbIn6eRElZwc1TnYDPk3ZlKlJIH3Yer16Vn5nVTCksI28IDJ
         /RenWa530ev35nGlWlgC61rycBR/0j+ywJsSj4N4bom8toKqBPzT60pDdR4f2iEEN9Hl
         d7CN/Fmr3dTWk/B4AK/7wiCSK1xQW37GECt/Deh4HMARdhRGXaLhTel8msG8hE2iHxW7
         wgDhiJ05LFuFBBYAQSfGOXGCGJOZ4tRFJNU3uCYTvCNUTlEIp1/SMTEljo9MrggS5D8w
         CcTBAI6fm4OK4GBOptfaAENxFiWMRWxsghi9bHxepDcgJsBEqDWDjr9kwEC2kWnu3BMM
         O2bw==
X-Gm-Message-State: AOAM533QC2gtlsw/HkCAV7dh95rDz83JBrg1y1p/OqIcJ+RSL++Jy2ZJ
	M5aUlltXvU0jNsAnsgIDtlA=
X-Google-Smtp-Source: ABdhPJz4eKUEq7ZrMsvoEKZtpxBHOSayxyiXJ2PgF4vC9W0d68Yh4tOffD3uKBEr3qTbYLCZAaDwpA==
X-Received: by 2002:a05:6402:31fa:b0:42d:cd6d:c8fd with SMTP id dy26-20020a05640231fa00b0042dcd6dc8fdmr44609520edb.347.1654781058277;
        Thu, 09 Jun 2022 06:24:18 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.googlemail.com with ESMTPSA id i2-20020a056402054200b004315050d7dfsm8360263edx.81.2022.06.09.06.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 06:24:17 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ansuel Smith <ansuelsmth@gmail.com>
Subject: [PATCH v6 3/3] dt-bindings: mtd: qcom_nandc: document qcom,boot-partitions binding
Date: Thu,  9 Jun 2022 15:23:44 +0200
Message-Id: <20220609132344.17548-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220609132344.17548-1-ansuelsmth@gmail.com>
References: <20220609132344.17548-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_062422_090264_CFC96E65 
X-CRM114-Status: GOOD (  12.88  )
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

Document new qcom,boot-partition binding used to apply special
read/write layout to boot partitions.

QCOM apply a special layout where spare data is not protected
by ECC for some special pages (used for boot partition). Add
Documentation on how to declare these special pages.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 .../devicetree/bindings/mtd/qcom,nandc.yaml   | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
index 84ad7ff30121..482a2c068740 100644
--- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
+++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
@@ -102,6 +102,31 @@ allOf:
             - const: rx
             - const: cmd
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq806x-nand
+
+    then:
+      properties:
+        qcom,boot-partitions:
+          $ref: /schemas/types.yaml#/definitions/uint32-matrix
+          items:
+            items:
+              - description: offset
+              - description: size
+          description:
+            Boot partition use a different layout where the 4 bytes of spare
+            data are not protected by ECC. Use this to declare these special
+            partitions by defining first the offset and then the size.
+
+            It's in the form of <offset1 size1 offset2 size2 offset3 ...>
+            and should be declared in ascending order.
+
+            Refer to the ipq8064 example on how to use this special binding.
+
 required:
   - compatible
   - reg
@@ -135,6 +160,8 @@ examples:
         nand-ecc-strength = <4>;
         nand-bus-width = <8>;
 
+        qcom,boot-partitions = <0x0 0x58a0000>;
+
         partitions {
           compatible = "fixed-partitions";
           #address-cells = <1>;
-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
